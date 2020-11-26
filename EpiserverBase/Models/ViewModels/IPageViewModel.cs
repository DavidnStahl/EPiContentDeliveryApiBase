using EPiServer.Core;
using EpiserverBase.Models.Pages;

namespace EpiserverBase.Models.ViewModels
{
    /// <summary>
    /// Defines common view model characteristics for pages.
    /// </summary>
    public interface IPageViewModel<out T> where T : SitePageData
    {
        T CurrentPage { get; }
        SiteSettingsPage Settings { get; }
    }
}
