using EPiServer.Core;
using EPiServer.DataAbstraction;
using EPiServer.DataAnnotations;
using EPiServer.Shell.ObjectEditing;
using EpiserverBase.Business.EditorDescriptors.ContentSelection;
using EpiserverBase.Models.Blocks;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace EpiserverBase.Models.Pages
{
    [ContentType(
    GUID = "706FA2C9-C542-4419-BA3D-E37C754CED6F",
    GroupName = Global.GroupNames.Specialized)]
    public class InstructionPage : SitePageData
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
        [AllowedTypes(new[] { typeof(InstructionBlock) })]
        public virtual ContentArea InstructionContentArea { get; set; }
    }
}