using AutoMapper;
using EPiServer.Core;
using EpiserverBase.Models.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EpiserverBase.Profiles
{
    public class DtosMappingProfile : Profile
    {
        public DtosMappingProfile()
        {
            CreateMap<PageData, NavigationDto>();
        }
    }
}