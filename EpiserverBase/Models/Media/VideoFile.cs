using System;
using System.ComponentModel.DataAnnotations;
using EPiServer.Core;
using EPiServer.DataAbstraction;
using EPiServer.DataAnnotations;
using EPiServer.Framework.DataAnnotations;
using EPiServer.Web;

namespace EpiserverBase.Models.Media
{
    [ContentType(GUID = "d96dbe79-af8f-4dab-a885-5e2dba9184c2")]
    [MediaDescriptor(ExtensionString = "mp4,webm")]
    public class VideoFile : VideoData
    {
        /// <summary>
        /// Gets or sets a description of the video.
        /// </summary>
        [CultureSpecific]
        [Display(
            GroupName = SystemTabNames.Content,
            Order = 100)]
        public virtual string Description { get; set; }

        /// <summary>
        /// Gets or sets an image to use as the video poster image.
        /// </summary>
        [CultureSpecific]
        [Display(
            GroupName = SystemTabNames.Content,
            Order = 200)]
        [UIHint(UIHint.Image)]
        public virtual ContentReference PreviewImage { get; set; }
    }
}