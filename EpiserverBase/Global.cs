using EPiServer.DataAnnotations;
using System.ComponentModel.DataAnnotations;

namespace EpiserverBase
{
    public class Global
    {
        public static readonly string LoginPath = "/util/login.aspx";

        [GroupDefinitions()]
        public static class GroupNames
        {
            [Display(Name = "Metadata", Order = 10)]
            public const string Metadata = "Metadata";

            [Display(Name = "Specialized", Order = 15)]
            public const string Specialized = "Specialized";
        }

        public static class SiteUIHints
        {
            public const string Strings = "StringList";
        }
    }
}
