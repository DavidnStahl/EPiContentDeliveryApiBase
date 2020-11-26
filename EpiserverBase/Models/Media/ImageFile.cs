using System;
using System.ComponentModel.DataAnnotations;
using EPiServer.Core;
using EPiServer.DataAbstraction;
using EPiServer.DataAnnotations;
using EPiServer.Framework.Blobs;
using EPiServer.Framework.DataAnnotations;

namespace EpiserverBase.Models.Media
{
    [ContentType(GUID = "eb5a5c46-8584-4998-b2be-39b86cf58a3f")]
    [MediaDescriptor(ExtensionString = "jpg,jpeg,png,gif,webp")]
    public class ImageFile : ImageData
    {
        /// <summary>
        /// Gets or sets a short description of the image.
        /// </summary>
        [Display(
            GroupName = SystemTabNames.Content,
            Order = 100)]
        [CultureSpecific]
        [Required]
        public virtual string AltText { get; set; }

        /// <summary>
        /// A small version of the image (accessible at "/path/to/image.jpg/Small").
        /// </summary>
        [ScaffoldColumn(false)]
        [ImageDescriptor(Width = 640, Height = 480)]
        public virtual Blob Small { get; set; }

        /// <summary>
        /// A medium version of the image (accessible at "/path/to/image.jpg/Medium").
        /// </summary>
        [ScaffoldColumn(false)]
        [ImageDescriptor(Width = 800, Height = 600)]
        public virtual Blob Medium { get; set; }

        /// <summary>
        /// A large version of the image (accessible at "/path/to/image.jpg/Large").
        /// </summary>
        [ScaffoldColumn(false)]
        [ImageDescriptor(Width = 1200, Height = 900)]
        public virtual Blob Large { get; set; }
    }
}