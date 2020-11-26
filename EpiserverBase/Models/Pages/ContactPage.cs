using System.ComponentModel.DataAnnotations;
using EPiServer.Core;
using EPiServer.DataAbstraction;
using EPiServer.DataAnnotations;

namespace EpiserverBase.Models.Pages
{
    [ContentType(
    GUID = "4FB2FDAD-2A67-4637-92F9-4A0181374D67",
    GroupName = Global.GroupNames.Specialized)]
    public class ContactPage : SitePageData
    {
        [Display(
            Name = "Main body",
            GroupName = SystemTabNames.Content,
            Order = 10)]
        [CultureSpecific]
        public virtual XhtmlString MainBody { get; set; }
    }
}