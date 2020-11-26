﻿using EPiServer.Core;
using EPiServer.DataAbstraction;
using EPiServer.DataAnnotations;
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
        [Display(
            Name = "Title",
            GroupName = SystemTabNames.Content,
            Order = 10)]
        [CultureSpecific]
        public virtual string Title { get; set; }

        [Display(
            Name = "Main body",
            GroupName = SystemTabNames.Content,
            Order = 20)]
        [CultureSpecific]
        public virtual XhtmlString MainBody { get; set; }
    }
}