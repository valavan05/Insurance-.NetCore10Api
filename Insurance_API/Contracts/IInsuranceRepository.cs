using Insurance_API.DTO;
using Insurance_API.Entities;

namespace Insurance_API.Contracts;

public interface IInsuranceRepository
{
    Task<int> AddAsync(InsuranceMaster insurance);
    Task<IEnumerable<InsuranceMaster>> GetAllAsync();
    Task<InsuranceMaster?> GetByIdAsync(int insuranceId);
    Task<bool> UpdateAsync(InsuranceMaster insurance);
    Task<bool> DeleteAsync(int insuranceId);
    Task<PagedResulDto<InsuranceMaster>> GetAllPagedAsync(
        string? policyNumber,
        string? policyHolderName,
        string? insuranceType,
        int pageNumber,
        int pageSize);
}