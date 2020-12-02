using EPiServer.Core;
using EPiServer.Filters;
using EPiServer.Security;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Linq;
using System.Web;

namespace EpiserverBase.Models.Dtos
{
    public class PageDto
    {
        public virtual string Name { get; set; }
        public virtual string ContentGuid { get; set; }
            
    }
}