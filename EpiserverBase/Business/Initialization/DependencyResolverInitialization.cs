using System.Web.Mvc;
using EPiServer.Framework;
using EPiServer.Framework.Initialization;
using EPiServer.ServiceLocation;
using EpiserverBase.Business.Rendering;
using EPiServer.Web.Mvc;
using EPiServer.Web.Mvc.Html;
using System;
using AutoMapper;
using StructureMap;
using EpiserverBase.Infrastructure;
using EpiserverBase.Profiles;
using System.Web.Http;
using EpiserverBase.Services;

namespace EpiserverBase.Business.Initialization
{
    [InitializableModule]
    [ModuleDependency(typeof(ServiceContainerInitialization))]
    public class DependencyResolverInitialization : IConfigurableModule
    {
        public static MapperConfiguration CreateMapperConfiguration()
        {
            var mappingConfig = new MapperConfiguration(config =>
            {
                config.AddProfile<DtosMappingProfile>();
            });

            return mappingConfig;
        }
        public void ConfigureContainer(ServiceConfigurationContext context)
        {
            //Implementations for custom interfaces can be registered here.
            var container = context.StructureMap();

            container.Configure(x =>
           {
               var mappingConfig = CreateMapperConfiguration();

               x.For<IConfigurationProvider>().Use(mappingConfig);
               x.For<IMapper>().Use(mappingConfig.CreateMapper());
           });


            context.ConfigurationComplete += (o, e) =>
            {
                //Register custom implementations that should be used in favour of the default implementations
                context.Services.AddTransient<IContentRenderer, ErrorHandlingContentRenderer>();
                context.Services.AddTransient<INavigationApiService, NavigationApiService>();
                context.Services.AddTransient<IFooterApiService, FooterApiService>();
            };

            DependencyResolver.SetResolver(new StructureMapDependencyResolver(container));
            GlobalConfiguration.Configuration.DependencyResolver = new StructureMapDependencyResolver(container);

        }

        public void Initialize(InitializationEngine context)
        {
            DependencyResolver.SetResolver(new ServiceLocatorDependencyResolver(context.Locate.Advanced));            
        }

        public void Uninitialize(InitializationEngine context)
        {
        }

        public void Preload(string[] parameters)
        {
        }
    }
}
