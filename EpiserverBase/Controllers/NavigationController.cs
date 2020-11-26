
using AutoMapper;
using EPiServer;
using EPiServer.Core;
using EPiServer.Web;
using EpiserverBase.Models.Dtos;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace EpiserverBase.Controllers
{
    
    [RoutePrefix("api")]
    public class NavigationController : ApiController
    {
        private readonly AutoMapper.IMapper _mapper;
        public NavigationController(AutoMapper.IMapper mapper)
        {
            _mapper = mapper;
        }
        [HttpGet]
        [Route("navigation")]
        public IHttpActionResult Navigation()
        {
            var startPage = EPiServer.ServiceLocation.ServiceLocator.Current
                .GetInstance<IContentLoader>()
                .GetChildren<PageData>(SiteDefinition.Current.RootPage)
                .FirstOrDefault(r => r.Name == "Start");

            var navigatonItems = EPiServer.ServiceLocation.ServiceLocator.Current
                .GetInstance<IContentLoader>()
                .GetChildren<PageData>(SiteDefinition.Current.StartPage)
                .ToList();

            navigatonItems.Add(startPage);

            var navigationDto = _mapper.Map<List<NavigationDto>>(navigatonItems);

            return Ok(navigationDto);
        }
    }
}
