using EpiserverBase.Models.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EpiserverBase.Services
{
    public interface IFooterApiService
    {
        FooterDto GetFooterProperties();
    }
}