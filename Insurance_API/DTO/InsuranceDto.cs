using System;

namespace Insurance_API.DTO;
public class InsuranceMasterDto
{
    public int InsuranceId { get; set; }
    public string PolicyNumber { get; set; }
    public string PolicyHolderName { get; set; }
    public string InsuranceType { get; set; }
    public decimal PremiumAmount { get; set; }
    public decimal CoverageAmount { get; set; }
    public DateTime StartDate { get; set; }
    public DateTime EndDate { get; set; }
    public string? AgentName { get; set; }
    public bool IsActive { get; set; }
    public string? CreatedBy { get; set; }
    public DateTime CreatedDate { get; set; }
    public string? UpdatedBy { get; set; }
    public DateTime? UpdatedDate { get; set; }
}