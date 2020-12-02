


using EPiServer;
using EPiServer.Core;
using EPiServer.ServiceLocation;
using EpiserverBase.Models.Pages;
using EpiserverBase.Services;
using System.Linq;
using System.Web.Http;

namespace EpiserverBase.Controllers.Api
{
    [RoutePrefix("api")]
    public class FooterApiController : ApiController
    {
        private readonly IFooterApiService _footerSerivce;
        public FooterApiController(IFooterApiService footerService)
        {
            _footerSerivce = footerService;
        }
        [HttpGet]
        [Route("footer")]
        public IHttpActionResult Footer()
        {
            return Ok(_footerSerivce.GetFooterProperties());
        }

    }
}
