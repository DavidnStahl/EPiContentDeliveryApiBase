using EPiServer.Web.Mvc;
using EpiserverBase.Models.Pages;

namespace EpiserverBase.Controllers
{
    public abstract class PageBaseController<T> : PageController<T>
        where T : SitePageData
    {
    }
}
