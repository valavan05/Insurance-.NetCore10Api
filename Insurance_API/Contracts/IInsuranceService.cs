using Insurance_API.DTO;

namespace Insurance_API.Contracts
{
    public interface IInsuranceService
    {
        Task<int> AddAsync(InsuranceMasterDto insurance);

        Task<IEnumerable<InsuranceMasterDto>> GetAllAsync();

        Task<InsuranceMasterDto?> GetByIdAsync(int insuranceId);

        Task<bool> UpdateAsync(InsuranceMasterDto insurance);

        Task<bool> DeleteAsync(int insuranceId);

        Task<PagedResulDto<InsuranceMasterDto>> GetAllPagedAsync(
            string? policyNumber,
            string? policyHolderName,
            string? insuranceType,
            int pageNumber,
            int pageSize);
    }
}