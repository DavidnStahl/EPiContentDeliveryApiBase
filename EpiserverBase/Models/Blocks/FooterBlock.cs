using System;
using System.ComponentModel.DataAnnotations;
using EPiServer.Core;
using EPiServer.DataAbstraction;
using EPiServer.DataAnnotations;

namespace EpiserverBase.Models.Blocks
{
    [ContentType(DisplayName = "FooterBlock", GUID = "08197646-014b-4698-a2ed-c85b8d55a6e7", Description = "")]
    public class FooterBlock : SiteBlockData
    {
        
        [CultureSpecific]
        [Display(
            Name = "Text",
            Description = "",
            GroupName = SystemTabNames.Content,
            Order = 10)]
        public virtual string Text { get; set; }
         
    }
}