using System.Web.Mvc;
using EpiserverBase.Business.Rendering;
using EPiServer.Framework;
using EPiServer.Framework.Initialization;
using StructureMap;
using EpiserverBase.Infrastructure;

namespace EpiserverBase.Business.Initialization
{
    [ModuleDependency(typeof(EPiServer.Web.InitializationModule))]
    public class CustomizedRenderingInitialization : IInitializableModule
    {
        private static void ConfigureContainer(ConfigurationExpression container)
        {

            container.For<AutoMapper.IMapper>().Use(AutoMapperConfig.CreateIMapper());

        }
        public void Initialize(InitializationEngine context)
        {          
            ViewEngines.Engines.Insert(0, new SiteViewEngine());
        }

        public void Uninitialize(InitializationEngine context)
        {
        }

        public void Preload(string[] parameters)
        {
        }
    }
}
