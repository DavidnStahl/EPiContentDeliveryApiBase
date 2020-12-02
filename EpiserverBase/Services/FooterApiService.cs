using AutoMapper;
using EPiServer;
using EPiServer.Core;
using EPiServer.ServiceLocation;
using EpiserverBase.Models.Dtos;
using EpiserverBase.Models.Pages;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EpiserverBase.Services
{
    public class FooterApiService : IFooterApiService
    {
        private readonly IMapper _mapper;
        public FooterApiService(IMapper mapper)
        {
            _mapper = mapper;
        }
        public FooterDto GetFooterProperties()
        {
            var contentLoader = ServiceLocator.Current.GetInstance<IContentLoader>();

            var model = contentLoader
                .GetChildren<SiteSettingsPage>(ContentReference.RootPage)
                .FirstOrDefault().Footer;

            return _mapper.Map<FooterDto>(model);
        }
    }
}