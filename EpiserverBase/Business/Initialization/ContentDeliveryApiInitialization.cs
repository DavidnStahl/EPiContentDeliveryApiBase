using EPiServer.ContentApi.Cms;
using EPiServer.ContentApi.Core.Configuration;
using EPiServer.Framework;
using EPiServer.Framework.Initialization;
using EPiServer.ServiceLocation;
using EpiserverBase.Infrastructure;
using System;

namespace EpiserverBase.Business.Initialization
{
    [ModuleDependency(typeof(ServiceContainerInitialization))]
    public class ContentDeliveryApiInitialization : IConfigurableModule
    {
        public void ConfigureContainer(ServiceConfigurationContext context)
        {
            context.InitiializeContentApi();
            context.Services.Configure<ContentApiConfiguration>(config =>
            {
                config.Default().SetMinimumRoles(string.Empty)
                .SetSiteDefinitionApiEnabled(true);
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