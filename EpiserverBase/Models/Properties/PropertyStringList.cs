using EPiServer.Core;
using EPiServer.Framework.DataAnnotations;
using EPiServer.PlugIn;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EpiserverBase.Models.Properties
{
    /// <summary>
    /// A property type for storing a list of strings.
    /// </summary>
    /// <remarks>See <see cref="Pages.SitePageData"/> for example usage by the MetaKeywords property.</remarks>
    [EditorHint(Global.SiteUIHints.Strings)]
    [PropertyDefinitionTypePlugIn(
        Description = "A property for a list of strings",
        DisplayName = "String List")]
    public class PropertyStringList : PropertyLongString
    {
        protected string Separator = "\n";

        public string[] List { get => (string[])Value; }

        public override Type PropertyValueType { get => typeof(string[]); }

        public override object SaveData(PropertyDataCollection properties)
        {
            return LongString;
        }

        public override object Value
        {
            get
            {
                var value = base.Value as string;

                if (value == null)
                {
                    return null;
                }

                return value.Split(
                    Separator.ToCharArray(),
                    StringSplitOptions.RemoveEmptyEntries
                );
            }

            set
            {
                if (value is string[])
                {
                    var str = string.Join(Separator, value as string[]);

                    base.Value = str;
                }
                else
                {
                    base.Value = value;
                }
            }
        }
    }
}
