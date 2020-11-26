using EPiServer.DataAnnotations;
using System.ComponentModel.DataAnnotations;

namespace EpiserverBase
{
    public class Global
    {
        public static readonly string LoginPath = "/util/login.aspx";

        /// <summary>
        /// Group names for content types and properties.
        /// </summary>
        [GroupDefinitions()]
        public static class GroupNames
        {
            [Display(Name = "Metadata", Order = 10)]
            public const string Metadata = "Metadata";

            [Display(Name = "Specialized", Order = 15)]
            public const string Specialized = "Specialized";
        }

        /// <summary>
        /// Names for UIHint attributes.
        /// </summary>
        public static class SiteUIHints
        {
            public const string Strings = "StringList";
        }
    }
}
