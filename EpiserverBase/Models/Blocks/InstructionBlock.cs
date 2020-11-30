using System;
using System.ComponentModel.DataAnnotations;
using EPiServer.Core;
using EPiServer.DataAbstraction;
using EPiServer.DataAnnotations;

namespace EpiserverBase.Models.Blocks
{
    [ContentType(DisplayName = "InstructionBlock", GUID = "447e7783-9616-4da4-b26c-6a5d5757b172", Description = "")]
    public class InstructionBlock : BlockData
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