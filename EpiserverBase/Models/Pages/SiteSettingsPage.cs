using System;
using System.ComponentModel.DataAnnotations;
using EPiServer;
using EPiServer.Core;
using EPiServer.DataAbstraction;
using EPiServer.DataAnnotations;
using EPiServer.SpecializedProperties;
using EPiServer.Web;

namespace EpiserverBase.Models.Pages
{
    [ContentType(
        GUID = "df56a3b0-be6c-4450-8cd8-4e7f18c9004d",
        GroupName = Global.GroupNames.Specialized)]
    public class SiteSettingsPage : PageData
    {
        [Display(
            GroupName = SystemTabNames.Content,
            Order = 100)]
        [CultureSpecific]
        [UIHint(UIHint.Image)]
        public virtual ContentReference LogoImage { get; set; }
    }
}