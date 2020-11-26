using EPiServer.Framework;
using EPiServer.Framework.Initialization;
using System.Web.Optimization;

namespace EpiserverBase.Business.Initialization
{
    [InitializableModule]
    public class BundleConfig : IInitializableModule
    {
        public void Initialize(InitializationEngine context)
        {
            if (context.HostType == HostType.WebApplication)
            {
                RegisterBundles(BundleTable.Bundles);
            }
        }

        /// <summary>
        /// Register script and style sheet bundles.
        /// </summary>
        /// <param name="bundles">Existing bundles.</param>
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/js")
                .Include("~/Static/js/main.js")
                .Include("~/Static/js/main-menu.js")
            );

            bundles.Add(new StyleBundle("~/bundles/css")
                .Include("~/Static/css/main.css")
            );
        }

        public void Uninitialize(InitializationEngine context)
        {
        }
    }
}