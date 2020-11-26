
using AutoMapper;
using EPiServer;
using EPiServer.Core;
using EPiServer.Web;
using EpiserverBase.Models.Dtos;
using EpiserverBase.Services;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace EpiserverBase.Controllers.Api
{    
    [RoutePrefix("api")]
    public class NavigationApiController : ApiController
    {
        private readonly INavigationApiService _navigationSerivce;
        public NavigationApiController(INavigationApiService navigationService)
        {
            _navigationSerivce = navigationService;
        }

        [HttpGet]
        [Route("navigation")]
        public IHttpActionResult Navigation()
        {
            var x = 0;
            return Ok(_navigationSerivce.GetAllPages());
        }
    }
}
