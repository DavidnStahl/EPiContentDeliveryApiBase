using System;
using System.ComponentModel.DataAnnotations;
using EPiServer.Core;
using EPiServer.DataAbstraction;
using EPiServer.DataAnnotations;
using EPiServer.SpecializedProperties;
using EpiserverBase.Business.Rendering;

namespace EpiserverBase.Models.Pages
{
    [ContentType(
        GUID = "99820a97-b59a-4b65-b34f-0b45b19a8ff1",
        GroupName = Global.GroupNames.Specialized)]
    public class ContainerPage : PageData, IContainerPage
    {
    }
}