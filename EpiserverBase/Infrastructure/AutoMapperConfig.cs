using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EpiserverBase.Infrastructure
{
    public class AutoMapperConfig
    {
        public static IMapper CreateIMapper()
        {
            var mapperConfiguration = new MapperConfiguration(cfg => cfg.AddProfiles((IEnumerable<Profile>)System.Reflection.Assembly.GetExecutingAssembly()));
            return mapperConfiguration.CreateMapper();
        }
    }
}