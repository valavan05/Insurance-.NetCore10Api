using Insurance_API.Contracts;
using Insurance_API.DTO;
using Insurance_API.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Insurance_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class InsuranceController : ControllerBase
    {
        private readonly IInsuranceService _service;

        public InsuranceController(IInsuranceService service)
        {
            _service = service;
        }

        [HttpGet("GetAll")]
        public async Task<IActionResult> GetAll()
        {
            try
            {
                var data = await _service.GetAllAsync();

                return Ok(new ApiResponse<IEnumerable<InsuranceMasterDto>>
                {
                    Success = true,
                    Message = "Insurance records retrieved successfully",
                    Data = data
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ApiResponse<string>
                {
                    Success = false,
                    Message = "Error retrieving insurance records",
                    Error = new ApiError
                    {
                        Code = "500",
                        Details = ex.Message
                    }
                });
            }
        }

        [HttpGet("GetById/{insuranceId}")]
        public async Task<IActionResult> GetById(int insuranceId)
        {
            try
            {
                var insurance = await _service.GetByIdAsync(insuranceId);

                if (insurance == null)
                {
                    return NotFound(new ApiResponse<string>
                    {
                        Success = false,
                        Message = "Insurance record not found"
                    });
                }

                return Ok(new ApiResponse<InsuranceMasterDto>
                {
                    Success = true,
                    Message = "Insurance record retrieved successfully",
                    Data = insurance
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ApiResponse<string>
                {
                    Success = false,
                    Message = "Error retrieving insurance record",
                    Error = new ApiError
                    {
                        Code = "500",
                        Details = ex.Message
                    }
                });
            }
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(InsuranceMasterDto dto)
        {
            try
            {
                var id = await _service.AddAsync(dto);

                return Ok(new ApiResponse<int>
                {
                    Success = true,
                    Message = "Insurance record created successfully",
                    Data = id
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ApiResponse<string>
                {
                    Success = false,
                    Message = "Error creating insurance record",
                    Error = new ApiError
                    {
                        Code = "500",
                        Details = ex.Message
                    }
                });
            }
        }

        [HttpPut("Update/{insuranceId}")]
        public async Task<IActionResult> Update(int insuranceId, InsuranceMasterDto dto)
        {
            try
            {
                dto.InsuranceId = insuranceId;

                var updated = await _service.UpdateAsync(dto);

                if (!updated)
                {
                    return NotFound(new ApiResponse<string>
                    {
                        Success = false,
                        Message = "Insurance record not found"
                    });
                }

                return Ok(new ApiResponse<string>
                {
                    Success = true,
                    Message = "Insurance record updated successfully"
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ApiResponse<string>
                {
                    Success = false,
                    Message = "Error updating insurance record",
                    Error = new ApiError
                    {
                        Code = "500",
                        Details = ex.Message
                    }
                });
            }
        }

        [HttpDelete("Delete/{insuranceId}")]
        public async Task<IActionResult> Delete(int insuranceId)
        {
            try
            {
                var deleted = await _service.DeleteAsync(insuranceId);

                if (!deleted)
                {
                    return NotFound(new ApiResponse<string>
                    {
                        Success = false,
                        Message = "Insurance record not found"
                    });
                }

                return Ok(new ApiResponse<string>
                {
                    Success = true,
                    Message = "Insurance record deleted successfully"
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ApiResponse<string>
                {
                    Success = false,
                    Message = "Error deleting insurance record",
                    Error = new ApiError
                    {
                        Code = "500",
                        Details = ex.Message
                    }
                });
            }
        }

        [HttpGet("GetAllPaged")]
        public async Task<IActionResult> GetAllPaged(
            string? policyNumber,
            string? policyHolderName,
            string? insuranceType,
            int pageNumber = 1,
            int pageSize = 10)
        {
            try
            {
                var result = await _service.GetAllPagedAsync(
                    policyNumber,
                    policyHolderName,
                    insuranceType,
                    pageNumber,
                    pageSize);

                return Ok(new ApiResponse<IEnumerable<InsuranceMasterDto>>
                {
                    Success = true,
                    Message = "Insurance records retrieved successfully",
                    Data = result.Data,
                    TotalRecords = result.TotalRecords
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ApiResponse<string>
                {
                    Success = false,
                    Message = "Error retrieving insurance records",
                    Error = new ApiError
                    {
                        Code = "500",
                        Details = ex.Message
                    }
                });
            }
        }
    }
}