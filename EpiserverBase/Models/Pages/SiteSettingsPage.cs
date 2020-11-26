using System.ComponentModel.DataAnnotations;
using EPiServer.DataAbstraction;
using EPiServer.DataAnnotations;
using EpiserverBase.Business.UIDescriptors;
using EpiserverBase.Models.Blocks;

namespace EpiserverBase.Models.Pages
{
    [ContentType(
        DisplayName = "SitePageSettings",
        GUID = "df56a3b0-be6c-4450-8cd8-4e7f18c9004d",
        GroupName = Global.GroupNames.Specialized)]
    public class SiteSettingsPage : SitePageData, IUseSettingsIcon
    {
        [Display(
            Name = "Header",
            GroupName = SystemTabNames.Content,
            Order = 10)]
        public virtual HeaderBlock Header { get; set; }

        [Display(
            Name = "Footer",
            GroupName = SystemTabNames.Content,
            Order = 20)]
        public virtual FooterBlock Footer { get; set; }
    }
}