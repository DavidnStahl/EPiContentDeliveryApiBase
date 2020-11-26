using EPiServer.Core;
using EPiServer.DataAnnotations;
using EPiServer.Web;
using EpiserverBase.Models.Properties;
using System.ComponentModel.DataAnnotations;

namespace EpiserverBase.Models.Pages
{
    /// <summary>
    /// Base class for all page types.
    /// </summary>
    public abstract class SitePageData : PageData
    {
        [Display(
            GroupName = Global.GroupNames.Metadata,
            Order = 100)]
        [CultureSpecific]
        public virtual string MetaTitle
        {
            get
            {
                var metaTitle = this.GetPropertyValue(p => p.MetaTitle);

                // Fall back to page name if title isn't set
                return string.IsNullOrWhiteSpace(metaTitle)
                    ? PageName
                    : metaTitle;
            }

            set
            {
                this.SetPropertyValue(p => p.MetaTitle, value);
            }
        }

        [Display(
            GroupName = Global.GroupNames.Metadata,
            Order = 200)]
        [CultureSpecific]
        [BackingType(typeof(PropertyStringList))]
        public virtual string[] MetaKeywords
        {
            get
            {
                var metaKeywords = this.GetPropertyValue(p => p.MetaKeywords);

                return metaKeywords == null
                    ? new string[] { }
                    : metaKeywords;
            }

            set
            {
                this.SetPropertyValue(p => p.MetaKeywords, value);
            }
        }

        [Display(
            GroupName = Global.GroupNames.Metadata,
            Order = 300)]
        [CultureSpecific]
        [UIHint(UIHint.Textarea)]
        public virtual string MetaDescription
        {
            get; set;
        }
    }
}
