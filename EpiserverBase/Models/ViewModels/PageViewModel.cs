using System.Linq;
using EPiServer;
using EPiServer.Core;
using EPiServer.ServiceLocation;
using EpiserverBase.Models.Pages;

namespace EpiserverBase.Models.ViewModels
{
    public class PageViewModel<T> : IPageViewModel<T> where T : SitePageData
    {
        public PageViewModel(T currentPage)
        {
            var contentLoader = ServiceLocator.Current.GetInstance<IContentLoader>();

            Settings = contentLoader
                .GetChildren<SiteSettingsPage>(ContentReference.RootPage)
                .FirstOrDefault();
            CurrentPage = currentPage;
        }

        public T CurrentPage { get; private set; }
        public SiteSettingsPage Settings { get; private set; }
    }

    public static class PageViewModel
    {
        public static PageViewModel<T> Create<T>(T page) where T : SitePageData
        {
            return new PageViewModel<T>(page);
        }
    }
}
