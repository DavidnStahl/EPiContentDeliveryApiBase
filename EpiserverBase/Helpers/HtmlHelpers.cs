using EPiServer;
using EPiServer.Core;
using EPiServer.ServiceLocation;
using EPiServer.Web.Mvc.Html;
using EPiServer.Web.Routing;
using EpiserverBase.Business;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.WebPages;

namespace EpiserverBase.Helpers
{
    public static class HtmlHelpers
    {
        /// <summary>
        /// An item for use in a MenuList.
        /// </summary>
        public class MenuItem
        {
            public MenuItem(PageData page)
            {
                Page = page;
            }

            public PageData Page { get; set; }
            public bool Selected { get; set; }
            public bool AncestorOfSelected { get; set; }
            public Lazy<bool> HasChildren { get; set; }
        }

        /// <summary>
        /// Returns HTML for each child page for use in a menu.
        /// </summary>
        public static IHtmlString MenuList(
            this HtmlHelper helper,
            ContentReference rootLink,
            Func<MenuItem, HelperResult> itemTemplate = null,
            bool includeRoot = false,
            bool requireVisibleInMenu = true,
            bool requirePageTemplate = true)
        {
            itemTemplate = itemTemplate ?? new Func<MenuItem, HelperResult>(
                x => new HelperResult(
                    textWriter => textWriter.Write(helper.PageLink(x.Page))
                )
            );

            var currentContentLink = helper.ViewContext.RequestContext
                .GetContentLink();
            var contentLoader = ServiceLocator.Current.GetInstance<IContentLoader>();

            IEnumerable<PageData> filter(IEnumerable<PageData> pages) =>
                pages.FilterForDisplay(requirePageTemplate, requireVisibleInMenu);

            var pagePath = contentLoader.GetAncestors(currentContentLink)
                .Reverse()
                .Select(x => x.ContentLink)
                .SkipWhile(x => !x.CompareToIgnoreWorkID(rootLink))
                .ToList();

            var menuItems = contentLoader.GetChildren<PageData>(rootLink)
                .FilterForDisplay(requirePageTemplate, requireVisibleInMenu)
                .Select(x => CreateMenuItem(
                    x,
                    currentContentLink,
                    pagePath,
                    contentLoader,
                    filter))
                .ToList();

            if (includeRoot)
            {
                menuItems.Insert(
                    0,
                    CreateMenuItem(
                        contentLoader.Get<PageData>(rootLink),
                        currentContentLink,
                        pagePath,
                        contentLoader,
                        filter)
                );
            }

            var buffer = new StringBuilder();
            var writer = new StringWriter(buffer);

            menuItems.ForEach(MenuItem => itemTemplate(MenuItem).WriteTo(writer));

            return new MvcHtmlString(buffer.ToString());
        }

        /// <summary>
        /// Creates a new MenuItem from provided PageData.
        /// </summary>
        private static MenuItem CreateMenuItem(
            PageData page,
            ContentReference currentContentLink,
            List<ContentReference> pagePath,
            IContentLoader contentLoader,
            Func<IEnumerable<PageData>, IEnumerable<PageData>> filter)
        {
            var selected = page.ContentLink.CompareToIgnoreWorkID(currentContentLink);
            var ancestorOfSelected = !selected && pagePath.Contains(page.ContentLink);

            var menuItem = new MenuItem(page)
            {
                Selected = selected,
                AncestorOfSelected = ancestorOfSelected,
                HasChildren = new Lazy<bool>(() => filter(
                    contentLoader.GetChildren<PageData>(page.ContentLink)).Any())
            };

            return menuItem;
        }
    }
}