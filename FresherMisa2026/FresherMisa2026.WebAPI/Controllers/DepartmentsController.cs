using FresherMisa2026.Application.Interfaces;
using FresherMisa2026.Application.Interfaces.Services;
using FresherMisa2026.Application.Services;
using FresherMisa2026.Entities;
using FresherMisa2026.Entities.Department;
using Microsoft.AspNetCore.Mvc;

namespace FresherMisa2026.WebAPI.Controllers
{
    [ApiController]
    public class DepartmentsController : BaseController<Department>
    {
        private readonly IDepartmentSerice _departmentSerice;

        public DepartmentsController(
            IDepartmentSerice departmentSerice) : base(departmentSerice)
        {
            _departmentSerice = departmentSerice;
        }


        /// <summary>
        /// Lấy department theo code
        /// </summary>
        /// <returns></returns>
        /// Created By: dvhai (10/04/2026)
        [HttpGet("Code/{code}")]
        public async Task<ActionResult<ServiceResponse>> GetByCode(string code)
        {
            var response = new ServiceResponse();
            response.Data = await _departmentSerice.GetDepartmentByCodeAsync(code);
            response.IsSuccess = true;

            return response;
        }
        /// <summary>
        /// Lấy danh sách nhân viên theo mã phòng ban
        /// GET /api/Departments/{code}/employees
        /// </summary>
        [HttpGet("{code}/employees")]
        public async Task<ActionResult<ServiceResponse>> GetEmployeesByDepartmentCode(string code)
        {
            var response = new ServiceResponse();
            response.Data = await _departmentSerice.GetEmployeesByDepartmentCodeAsync(code);
            response.IsSuccess = true;
            return response;
        }

        /// <summary>
        /// Đếm số nhân viên trong phòng ban theo mã
        /// GET /api/Departments/{code}/employee-count
        /// </summary>
        [HttpGet("{code}/employee-count")]
        public async Task<ActionResult<ServiceResponse>> CountEmployeesByDepartmentCode(string code)
        {
            var response = new ServiceResponse();
            response.Data = await _departmentSerice.CountEmployeesByDepartmentCodeAsync(code);
            response.IsSuccess = true;
            return response;
        }

    }
}
