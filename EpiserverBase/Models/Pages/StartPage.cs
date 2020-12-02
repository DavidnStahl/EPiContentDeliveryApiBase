using System.ComponentModel.DataAnnotations;
using EPiServer.Core;
using EPiServer.DataAbstraction;
using EPiServer.DataAnnotations;
using EPiServer.Shell.ObjectEditing;
using EpiserverBase.Business.EditorDescriptors.ContentSelection;
using EpiserverBase.Models.Blocks;

namespace EpiserverBase.Models.Pages
{
    [ContentType(
        GUID = "5f5a391f-6b6a-4659-8e40-67a1860c2e52",
        GroupName = Global.GroupNames.Specialized)]
    [AvailableContentTypes(
        Availability.Specific,
        ExcludeOn = new[] { typeof(StartPage)})]
    public class StartPage : SitePageData
    {
        [CultureSpecific]
        [Display(
            GroupName = SystemTabNames.Content,
            Order = 5)]
        [SelectOne(SelectionFactoryType = typeof(ContentSelectionFactory<SiteSettingsPage>))]
        public virtual PageReference Settings { get; set; }


        [Display(
            Name = "Information",
            GroupName = SystemTabNames.Content,
            Order = 10)]
        [CultureSpecific]
        [AllowedTypes(new[] { typeof(InformationBlock), typeof(DescriptionBlock) })]
        public virtual ContentArea InformationContentArea  { get; set; }


    }
}
