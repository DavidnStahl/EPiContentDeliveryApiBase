using EPiServer.Shell;
using EpiserverBase.Business.UIDescriptors.EpiserverDefaultContentIcon;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EpiserverBase.Business.UIDescriptors
{
    [UIDescriptorRegistration]
    public class SettingsIconDescriptor : UIDescriptor<IUseSettingsIcon>
    {
        public SettingsIconDescriptor()
        {
            IconClass = EpiserverDefaultContentIcons.ActionIcons.Settings;
        }
    }

    public interface IUseSettingsIcon
    {
    }
}