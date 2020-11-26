using EPiServer.Shell.ObjectEditing.EditorDescriptors;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using EPiServer.Shell.ObjectEditing;

namespace EpiserverBase.Business.EditorDescriptors
{
    [EditorDescriptorRegistration(
        TargetType = typeof(string[]),
        UIHint = Global.SiteUIHints.Strings)]
    public class StringListEditorDescriptor : EditorDescriptor
    {
        public override void ModifyMetadata(
            ExtendedMetadata metadata,
            IEnumerable<Attribute> attributes)
        {
            ClientEditingClass = "episerverbase/editors/StringList";

            base.ModifyMetadata(metadata, attributes);
        }
    }
}
