using EPiServer;
using EPiServer.Core;
using EPiServer.Filters;
using EPiServer.ServiceLocation;
using EpiserverBase.Models.Media;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EpiserverBase.Business
{
    /// <summary>
    /// Extension methods for Episerver content.
    /// </summary>
    public static class ContentExtensions
    {
        /// <summary>
		/// Returns the AltText property value of an ImageFile.
		/// </summary>
		public static string ImageAltText(this ContentReference contentLink)
        {
            if (contentLink == null)
            {
                return null;
            }

            var contentRepository = ServiceLocator.Current
                .GetInstance<IContentRepository>();
            var content = contentRepository.Get<IContent>(contentLink);

            if (!(content is ImageFile imageFile))
            {
                return null;
            }

            return imageFile.AltText;
        }

        /// <summary>
        /// Filters out content that should not be visible to the user.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="contents"></param>
        /// <param name="requirePageTemplate"></param>
        /// <param name="requireVisibleInMenu"></param>
        /// <returns></returns>
        public static IEnumerable<T> FilterForDisplay<T>(
            this IEnumerable<T> contents,
            bool requirePageTemplate = false,
            bool requireVisibleInMenu = false) where T : IContent
        {
            var accessFilter = new FilterAccess();
            var publishedFilter = new FilterPublished();

            contents = contents.Where(x =>
                !publishedFilter.ShouldFilter(x) &&
                !accessFilter.ShouldFilter(x));

            if (requireVisibleInMenu)
            {
                contents = contents.Where(x => VisibleInMenu(x));
            }

            return contents;
        }

        /// <summary>
        /// Returns whether a page is set to be visible in menus.
        /// </summary>
        private static bool VisibleInMenu(IContent content)
        {
            if (content is PageData page)
            {
                return page.VisibleInMenu;
            }

            return true;
        }
    }
}