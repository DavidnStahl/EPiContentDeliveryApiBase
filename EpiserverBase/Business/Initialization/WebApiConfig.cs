
using EPiServer.Framework;
using EPiServer.Framework.Initialization;
using Newtonsoft.Json;
using System.Web.Http;

namespace EpiserverBase.Business.Initialization
{
    [InitializableModule]
    [ModuleDependency(typeof(FrameworkInitialization))]
    public class WebApiConfig : IInitializableModule
    {

        public void Initialize(InitializationEngine context)
        {
            GlobalConfiguration.Configure(config =>
            {
                //config.MapHttpAttributeRoutes();
                config.EnableCors();

                var formatters = GlobalConfiguration.Configuration.Formatters;
                var jsonFormatter = formatters.JsonFormatter;
                var settings = jsonFormatter.SerializerSettings;

                var enumConverter = new Newtonsoft.Json.Converters.StringEnumConverter();
                jsonFormatter.SerializerSettings.Converters.Add(enumConverter);

                settings.Formatting = Formatting.Indented;

                config.Formatters.Remove(config.Formatters.XmlFormatter);

                config.Routes.MapHttpRoute(
                  name: "DefaultEpiApi",
                  routeTemplate: "api/epi/{controller}/{id}",
                  defaults: new { id = RouteParameter.Optional });
            });
        }

        public void Uninitialize(InitializationEngine context)
        {
            //
        }
    }
}