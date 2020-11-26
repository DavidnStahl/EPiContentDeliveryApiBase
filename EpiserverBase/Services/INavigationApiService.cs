using EpiserverBase.Models.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EpiserverBase.Services
{
    public interface INavigationApiService
    {
        List<PageDto> GetAllPages();
    }
}
