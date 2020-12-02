using System;
using System.ComponentModel.DataAnnotations;
using EPiServer.Core;
using EPiServer.DataAbstraction;
using EPiServer.DataAnnotations;

namespace EpiserverBase.Models.Blocks
{
    [ContentType(DisplayName = "HeaderBlock", GUID = "0fe355eb-29ae-44a7-816b-2e767c1edce4", Description = "")]
    public class HeaderBlock : SiteBlockData
    {
        /*
        [CultureSpecific]
        [Display(
            Name = "Name",
            Description = "Name field's description",
            GroupName = SystemTabNames.Content,
            Order = 1)]
        public virtual string Name { get; set; }
         */
    }
}