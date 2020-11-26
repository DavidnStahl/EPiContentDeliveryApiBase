using EPiServer.ContentApi.Cms;
using EPiServer.ContentApi.Core.Configuration;
using EPiServer.Framework;
using EPiServer.Framework.Initialization;
using EPiServer.ServiceLocation;
using System;

namespace EpiserverBase.Business.Initialization
{
    [ModuleDependency(typeof(ContentApiCmsInitialization))]
    public class ContentDeliveryApiInitialization : IConfigurableModule
    {
        public void ConfigureContainer(ServiceConfigurationContext context)
        {
            context.Services.Configure<ContentApiConfiguration>(config =>
            {
                config.Default().SetMinimumRoles(string.Empty);
            });
        }

        public void Initialize(InitializationEngine context)
        {
            //
        }

        public void Uninitialize(InitializationEngine context)
        {
            //
        }
    }
}