using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Insurance_API.Entities;

[Table("InsuranceMaster")]
public class InsuranceMaster
{
    [Key]
    public int InsuranceId { get; set; }

    [Required]
    [StringLength(20)]
    public string PolicyNumber { get; set; }

    [Required]
    [StringLength(100)]
    public string PolicyHolderName { get; set; }

    [Required]
    [StringLength(50)]
    public string InsuranceType { get; set; }

    [Required]
    [Column(TypeName = "decimal(18,2)")]
    public decimal PremiumAmount { get; set; }

    [Required]
    [Column(TypeName = "decimal(18,2)")]
    public decimal CoverageAmount { get; set; }

    [Required]
    public DateTime StartDate { get; set; }

    [Required]
    public DateTime EndDate { get; set; }

    [StringLength(100)]
    public string? AgentName { get; set; }

    public bool IsActive { get; set; }

    [StringLength(100)]
    public string? CreatedBy { get; set; }

    public DateTime CreatedDate { get; set; }

    [StringLength(100)]
    public string? UpdatedBy { get; set; }

    public DateTime? UpdatedDate { get; set; }
}