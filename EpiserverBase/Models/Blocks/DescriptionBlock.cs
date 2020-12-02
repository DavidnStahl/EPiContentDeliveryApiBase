using System;
using System.ComponentModel.DataAnnotations;
using EPiServer.Core;
using EPiServer.DataAbstraction;
using EPiServer.DataAnnotations;

namespace EpiserverBase.Models.Blocks
{
    [ContentType(DisplayName = "DescriptionBlock", GUID = "459afe43-1df2-4794-8561-89e0ee13cfd7", Description = "")]
    public class DescriptionBlock : SiteBlockData
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
        public virtual XhtmlString MainBody { get; set; }

    }
}