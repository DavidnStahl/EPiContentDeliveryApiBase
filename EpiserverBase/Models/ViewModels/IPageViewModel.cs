using EPiServer.Core;
using EpiserverBase.Models.Pages;

namespace EpiserverBase.Models.ViewModels
{
    public interface IPageViewModel<out T> where T : SitePageData
    {
        T CurrentPage { get; }
        SiteSettingsPage Settings { get; }
    }
}
