using EPiServer.ServiceLocation;
using EPiServer.Web.Mvc;

namespace EpiserverBase.Business.Rendering
{
    [ServiceConfiguration(typeof(IViewTemplateModelRegistrator))]
    public class TemplateCoordinator : IViewTemplateModelRegistrator
    {
        public const string BlockFolder = "~/Views/Shared/Blocks/";
        public const string PagePartialsFolder = "~/Views/Shared/PagePartials/";

        /// <summary>
        /// Registers renderers/templates which are not automatically discovered,
        /// i.e. partial views whose names does not match a content type's name.
        /// </summary>
        /// <remarks>
        /// Using only partial views instead of controllers for blocks and page partials
        /// has performance benefits as they will only require calls to RenderPartial instead of
        /// RenderAction for controllers.
        /// Registering partial views as templates this way also enables specifying tags and
        /// that a template supports all types inheriting from the content type/model type.
        /// </remarks>
        public void Register(TemplateModelCollection viewTemplateModelRegistrator)
        {
//            viewTemplateModelRegistrator.Add(typeof(SitePageData), new TemplateModel
//            {
//                Name = "PagePartial",
//                Inherit = true,
//                AvailableWithoutTag = true,
//                Path = PagePartialPath("Page.cshtml")
//            });
//
//            viewTemplateModelRegistrator.Add(typeof(SitePageData), new TemplateModel
//            {
//                Name = "PagePartialWide",
//                Inherit = true,
//                Tags = new[] { Global.ContentAreaTags.TwoThirdsWidth, Global.ContentAreaTags.FullWidth },
//                AvailableWithoutTag = false,
//                Path = PagePartialPath("PageWide.cshtml")
//            });
        }

        private static string BlockPath(string fileName)
        {
            return string.Format("{0}{1}", BlockFolder, fileName);
        }

        private static string PagePartialPath(string fileName)
        {
            return string.Format("{0}{1}", PagePartialsFolder, fileName);
        }
    }
}
