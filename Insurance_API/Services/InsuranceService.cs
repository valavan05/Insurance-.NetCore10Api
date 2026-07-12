using AutoMapper;
using Insurance_API.Contracts;
using Insurance_API.DTO;
using Insurance_API.Entities;

namespace Insurance_API.Services
{
    public class InsuranceService : IInsuranceService
    {
        private readonly IInsuranceRepository _repository;
        private readonly IMapper _mapper;

        public InsuranceService(IInsuranceRepository repository, IMapper mapper)
        {
            _repository = repository;
            _mapper = mapper;
        }

        public async Task<int> AddAsync(InsuranceMasterDto dto)
        {
            var entity = _mapper.Map<InsuranceMaster>(dto);
            return await _repository.AddAsync(entity);
        }

        public async Task<IEnumerable<InsuranceMasterDto>> GetAllAsync()
        {
            var insuranceList = await _repository.GetAllAsync();
            return _mapper.Map<IEnumerable<InsuranceMasterDto>>(insuranceList);
        }

        public async Task<InsuranceMasterDto?> GetByIdAsync(int insuranceId)
        {
            var insurance = await _repository.GetByIdAsync(insuranceId);
            return insurance == null ? null : _mapper.Map<InsuranceMasterDto>(insurance);
        }

        public async Task<bool> UpdateAsync(InsuranceMasterDto dto)
        {
            var entity = _mapper.Map<InsuranceMaster>(dto);
            return await _repository.UpdateAsync(entity);
        }

        public async Task<bool> DeleteAsync(int insuranceId)
        {
            return await _repository.DeleteAsync(insuranceId);
        }

        public async Task<PagedResulDto<InsuranceMasterDto>> GetAllPagedAsync(
            string? policyNumber,
            string? policyHolderName,
            string? insuranceType,
            int pageNumber,
            int pageSize)
        {
            var result = await _repository.GetAllPagedAsync(
                policyNumber,
                policyHolderName,
                insuranceType,
                pageNumber,
                pageSize);

            return new PagedResulDto<InsuranceMasterDto>
            {
                Data = _mapper.Map<IEnumerable<InsuranceMasterDto>>(result.Data),
                TotalRecords = result.TotalRecords
            };
        }
    }
}