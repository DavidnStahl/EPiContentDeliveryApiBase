using System;
using System.IO;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Html;
using EPiServer.Core;
using EPiServer.DataAbstraction;
using EPiServer.Security;
using EpiserverBase.Models.ViewModels;
using EPiServer.Web.Mvc;

namespace EpiserverBase.Business.Rendering
{
    public class ErrorHandlingContentRenderer : IContentRenderer
    {
        private readonly MvcContentRenderer _mvcRenderer;
        public ErrorHandlingContentRenderer(MvcContentRenderer mvcRenderer)
        {
            _mvcRenderer = mvcRenderer;
        }

        public void Render(HtmlHelper helper, PartialRequest partialRequestHandler, IContentData contentData, TemplateModel templateModel)
        {
            try
            {
                _mvcRenderer.Render(helper, partialRequestHandler, contentData, templateModel);
            }
            catch (NullReferenceException ex)
            {
                if (HttpContext.Current.IsDebuggingEnabled)
                {
                    throw;
                }
                HandlerError(helper, contentData, ex);
            }
            catch (ArgumentException ex)
            {
                if (HttpContext.Current.IsDebuggingEnabled)
                {
                    throw;
                }
                HandlerError(helper, contentData, ex);
            }
            catch (ApplicationException ex)
            {
                if (HttpContext.Current.IsDebuggingEnabled)
                {
                    throw;
                }
                HandlerError(helper, contentData, ex);
            }
            catch (InvalidOperationException ex)
            {
                if (HttpContext.Current.IsDebuggingEnabled)
                {
                    throw;
                }
                HandlerError(helper, contentData, ex);
            }
            catch (NotImplementedException ex)
            {
                if (HttpContext.Current.IsDebuggingEnabled)
                {
                    throw;
                }
                HandlerError(helper, contentData, ex);
            }
            catch (IOException ex)
            {
                if (HttpContext.Current.IsDebuggingEnabled)
                {
                    throw;
                }
                HandlerError(helper, contentData, ex);
            }
            catch (EPiServerException ex)
            {
                if (HttpContext.Current.IsDebuggingEnabled)
                {
                    throw;
                }
                HandlerError(helper, contentData, ex);
            }
        }

        private void HandlerError(HtmlHelper helper, IContentData contentData, Exception renderingException)
        {
            if (PrincipalInfo.HasEditAccess)
            {
                var errorModel = new ContentRenderingErrorModel(contentData, renderingException);
                helper.RenderPartial("TemplateError", errorModel);
            }
        }
    }
}
