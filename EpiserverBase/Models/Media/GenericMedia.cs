using System;
using System.ComponentModel.DataAnnotations;
using EPiServer.Core;
using EPiServer.DataAbstraction;
using EPiServer.DataAnnotations;

namespace EpiserverBase.Models.Media
{
    [ContentType(GUID = "4e55dc2c-1674-4f51-ad64-bb5e8a37009d")]
    public class GenericMedia : MediaData
    {
        /// <summary>
        /// Gets or sets a short description of the file.
        /// </summary>
        [CultureSpecific]
        [Display(
            GroupName = SystemTabNames.Content,
            Order = 100)]
        public virtual string Description { get; set; }
    }
}