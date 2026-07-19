using Insurance_API.Contracts;
using Insurance_API.Data;
using Insurance_API.DTO;
using Insurance_API.Entities;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Data;

namespace Insurance_API.Repositories;

public class InsuranceRepositories : IInsuranceRepository
{
    private readonly AppDbContext _dbContext;

    public InsuranceRepositories(AppDbContext dbContext)
    {
        _dbContext = dbContext;
    }

    public async Task<int> AddAsync(InsuranceMaster insurance)
    {
        var result = await _dbContext.Database.ExecuteSqlRawAsync(
            @"EXEC sp_InsuranceMaster_Insert
                @PolicyNumber,
                @PolicyHolderName,
                @InsuranceType,
                @PremiumAmount,
                @CoverageAmount,
                @StartDate,
                @EndDate,
                @AgentName,
                @IsActive",
            new SqlParameter("@PolicyNumber", insurance.PolicyNumber),
            new SqlParameter("@PolicyHolderName", insurance.PolicyHolderName),
            new SqlParameter("@InsuranceType", insurance.InsuranceType),
            new SqlParameter("@PremiumAmount", insurance.PremiumAmount),
            new SqlParameter("@CoverageAmount", insurance.CoverageAmount),
            new SqlParameter("@StartDate", insurance.StartDate),
            new SqlParameter("@EndDate", insurance.EndDate),
            new SqlParameter("@AgentName", (object?)insurance.AgentName ?? DBNull.Value),
            new SqlParameter("@IsActive", insurance.IsActive)
        );

        return result;
    }

    public async Task<bool> UpdateAsync(InsuranceMaster insurance)
    {

        var affectedRows = await _dbContext.Database.ExecuteSqlRawAsync(
            @"EXEC sp_InsuranceMaster_Update
                @InsuranceId,
                @PolicyNumber,
                @PolicyHolderName,
                @InsuranceType,
                @PremiumAmount,
                @CoverageAmount,
                @StartDate,
                @EndDate,
                @AgentName,
                @IsActive",
            new SqlParameter("@InsuranceId", insurance.InsuranceId),
            new SqlParameter("@PolicyNumber", insurance.PolicyNumber),
            new SqlParameter("@PolicyHolderName", insurance.PolicyHolderName),
            new SqlParameter("@InsuranceType", insurance.InsuranceType),
            new SqlParameter("@PremiumAmount", insurance.PremiumAmount),
            new SqlParameter("@CoverageAmount", insurance.CoverageAmount),
            new SqlParameter("@StartDate", insurance.StartDate),
            new SqlParameter("@EndDate", insurance.EndDate),
            new SqlParameter("@AgentName", (object?)insurance.AgentName ?? DBNull.Value),
            new SqlParameter("@IsActive", insurance.IsActive)
        );

        return affectedRows > 0;
    }

    public async Task<InsuranceMaster?> GetByIdAsync(int insuranceId)
    {
        var insurance = await _dbContext.InsuranceMasters
            .FromSqlRaw(
                "EXEC sp_InsuranceMaster_GetById @InsuranceId",
                new SqlParameter("@InsuranceId", insuranceId))
            .AsNoTracking()
            .ToListAsync();

        return insurance.FirstOrDefault();
    }

    public async Task<IEnumerable<InsuranceMaster>> GetAllAsync()
    {
        return await _dbContext.InsuranceMasters
            .FromSqlRaw("EXEC sp_InsuranceMaster_GetAll")
            .ToListAsync();
    }

    public async Task<bool> DeleteAsync(int insuranceId)
    {
        var affectedRows = await _dbContext.Database.ExecuteSqlRawAsync(
            "EXEC sp_InsuranceMaster_Delete @InsuranceId",
            new SqlParameter("@InsuranceId", insuranceId));

        return affectedRows > 0;
    }

    public async Task<PagedResulDto<InsuranceMaster>> GetAllPagedAsync(
        string? policyNumber,
        string? policyHolderName,
        string? insuranceType,
        int pageNumber,
        int pageSize)
    {
        using var connection = _dbContext.Database.GetDbConnection();

        await connection.OpenAsync();

        using var command = connection.CreateCommand();

        command.CommandText = "sp_InsuranceMaster_GetPaged";
        command.CommandType = CommandType.StoredProcedure;

        command.Parameters.Add(new SqlParameter("@PolicyNumber", (object?)policyNumber ?? DBNull.Value));
        command.Parameters.Add(new SqlParameter("@PolicyHolderName", (object?)policyHolderName ?? DBNull.Value));
        command.Parameters.Add(new SqlParameter("@InsuranceType", (object?)insuranceType ?? DBNull.Value));
        command.Parameters.Add(new SqlParameter("@PageNumber", pageNumber));
        command.Parameters.Add(new SqlParameter("@PageSize", pageSize));

        using var reader = await command.ExecuteReaderAsync();

        var insurances = new List<InsuranceMaster>();

        while (await reader.ReadAsync())
        {
            insurances.Add(new InsuranceMaster
            {
                InsuranceId = reader.GetInt32(0),
                PolicyNumber = reader.GetString(1),
                PolicyHolderName = reader.GetString(2),
                InsuranceType = reader.GetString(3),
                PremiumAmount = reader.GetDecimal(4),
                CoverageAmount = reader.GetDecimal(5),
                StartDate = reader.GetDateTime(6),
                EndDate = reader.GetDateTime(7),
                AgentName = reader.IsDBNull(8) ? null : reader.GetString(8),
                IsActive = reader.GetBoolean(9),
                CreatedBy = reader.IsDBNull(10) ? null : reader.GetString(10),
                CreatedDate = reader.GetDateTime(11),
                UpdatedBy = reader.IsDBNull(12) ? null : reader.GetString(12),
                UpdatedDate = reader.IsDBNull(13) ? null : reader.GetDateTime(13)
            });
        }

        await reader.NextResultAsync();

        int totalRecords = 0;

        if (await reader.ReadAsync())
        {
            totalRecords = reader.GetInt32(0);
        }

        return new PagedResulDto<InsuranceMaster>
        {
            Data = insurances,
            TotalRecords = totalRecords
        };
    }
}