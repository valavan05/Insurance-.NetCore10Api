using AutoMapper;
using Insurance_API.Entities;
using Insurance_API.DTO;

namespace Insurance_API.Mapper
{
    public class InsuranceProfile : Profile
    {
        public InsuranceProfile()
        {
            CreateMap<InsuranceMaster, InsuranceMasterDto>().ReverseMap();
        }
    }
}
