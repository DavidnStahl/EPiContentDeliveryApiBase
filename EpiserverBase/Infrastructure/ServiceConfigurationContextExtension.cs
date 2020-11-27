using EPiServer.ContentApi.Core.Configuration;
using EPiServer.ContentApi.Core.Security;
using EPiServer.ContentApi.Core.Security.Internal;
using EPiServer.ContentApi.Core.Serialization;
using EPiServer.ServiceLocation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EpiserverBase.Infrastructure
{
    public static class ServiceConfigurationContextExtension
    {
        public static void InitiializeContentApi(this ServiceConfigurationContext context)
        {
            context.InitializeContentApi(new ContentApiOptions());
        }

        public static void InitializeContentApi(this ServiceConfigurationContext context, ContentApiOptions options)
        {
            context.Services.AddSingleton((IServiceLocator location) => options);           
            context.Services.AddSingleton<IContentApiRequiredRoleFilter, ContentApiRequiredRoleFilter>();
            context.Services.AddSingleton<IContentApiSiteFilter, ContentApiSiteFilter>();


        }
    }
}