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

namespace EpiserverBase.Services
{
    public class NavigationApiService : INavigationApiService
    {
        private readonly IMapper _mapper;
        public NavigationApiService(IMapper mapper)
        {
            _mapper = mapper;
        }
        public List<PageDto> GetAllPages()
        {
            var pages = new List<PageData>
            {
                EPiServer.ServiceLocation.ServiceLocator.Current
                .GetInstance<IContentLoader>()
                .GetChildren<PageData>(SiteDefinition.Current.RootPage)
                .FirstOrDefault(r => r.Name == "Start")
            };

            pages.AddRange(EPiServer.ServiceLocation.ServiceLocator.Current
                .GetInstance<IContentLoader>()
                .GetChildren<PageData>(SiteDefinition.Current.StartPage).Where(p => p.VisibleInMenu == true)
                .ToList());

            return _mapper.Map<List<PageDto>>(pages);
        }
    }
}