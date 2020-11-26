using EPiServer.Web.Mvc;
using EpiserverBase.Models.Pages;
using EpiserverBase.Models.ViewModels;
using System.Web.Mvc;

namespace EpiserverBase.Controllers
{
    public class StartPageController : PageBaseController<StartPage>
    {
        public ActionResult Index(StartPage currentPage)
        {
            var model = PageViewModel.Create(currentPage);

            return View(model);
        }
    }
}
