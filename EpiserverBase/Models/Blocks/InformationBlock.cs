using System;
using System.ComponentModel.DataAnnotations;
using EPiServer.Core;
using EPiServer.DataAbstraction;
using EPiServer.DataAnnotations;

namespace EpiserverBase.Models.Blocks
{
    [ContentType(DisplayName = "InformationBlock", GUID = "a1df7267-e614-4b2c-a856-fcff310a7eec", Description = "")]
    public class InformationBlock : SiteBlockData
    {
        
        [CultureSpecific]
        [Display(
            Name = "Title",
            Description = "",
            GroupName = SystemTabNames.Content,
            Order = 10)]
        public virtual string Title { get; set; }

        [CultureSpecific]
        [Display(
            Name = "main body",
            Description = "",
            GroupName = SystemTabNames.Content,
            Order = 20)]
        public virtual string MainBody { get; set; }

    }
}