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
    public static class ContentExtensions
    {
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