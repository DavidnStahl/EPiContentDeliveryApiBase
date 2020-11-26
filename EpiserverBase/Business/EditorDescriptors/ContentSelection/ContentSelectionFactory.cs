using System.Collections.Generic;
using System.Linq;
using EPiServer;
using EPiServer.Core;
using EPiServer.DataAbstraction;
using EPiServer.ServiceLocation;
using EPiServer.Shell.ObjectEditing;
using EPiServer.Web;
using EpiserverBase.Models.Pages;

namespace EpiserverBase.Business.EditorDescriptors.ContentSelection
{
    public class ContentSelectionFactory<T> : ISelectionFactory where T : IContentData
    {

        private static readonly IContentTypeRepository _contentTypeRepository = ServiceLocator.Current.GetInstance<IContentTypeRepository>();
        private static readonly IContentModelUsage _contentModelUsage = ServiceLocator.Current.GetInstance<IContentModelUsage>();

        private static readonly IContentLoader _contentLoader = ServiceLocator.Current.GetInstance<IContentLoader>();

        public IEnumerable<ISelectItem> GetSelections(ExtendedMetadata metadata)
        {
            var contentType = _contentTypeRepository.Load<T>();
            if (contentType == null)
            {
                return Enumerable.Empty<SelectItem>();
            }

            var startPage = _contentLoader.Get<StartPage>(SiteDefinition.Current.StartPage);

            var selectItems = _contentModelUsage
                    .ListContentOfContentType(contentType)
                    .Select(x => x.ContentLink.ToReferenceWithoutVersion())
                    .Distinct()
                    .Select(x => _contentLoader.Get<T>(x, startPage.Language))
                    .OfType<IContent>()
                    .Select(x => new SelectItem
                    {
                        Text = x.Name,
                        Value = x.ContentLink
                    })
                    .OrderBy(x => x.Text)
                    .ToList();

            selectItems.Insert(0, new SelectItem());

            return selectItems;
        }
    }
}