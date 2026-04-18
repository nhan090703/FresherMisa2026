using FresherMisa2026.Application.Interfaces;
using FresherMisa2026.Application.Interfaces.Repositories;
using FresherMisa2026.Application.Interfaces.Services;
using FresherMisa2026.Entities;
using FresherMisa2026.Entities.Department;
using FresherMisa2026.Entities.Employee;
using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa2026.Application.Services
{
    public class DepartmentService : BaseService<Department>, IDepartmentSerice
    {
        private readonly IDepartmentRepository _deptRepository;

        public DepartmentService(
            IBaseRepository<Department> baseRepository,
            IDepartmentRepository departmentRepository
            ) : base(baseRepository)
        {
            _deptRepository = departmentRepository;
        }

        /// <summary>
        /// Lấy danh sach employee theo ma phong
        /// </summary>
        /// <returns></returns>
        /// Created By: nptnhan (18/04/2026)
        public async Task<int> CountEmployeesByDepartmentCodeAsync(string departmentCode)
        {
            if (string.IsNullOrWhiteSpace(departmentCode))
            {
                throw new ArgumentException("Mã phòng ban không được để trống");
            }

            // Kiểm tra phòng ban có tồn tại không
            var department = await _deptRepository.GetDepartmentByCode(departmentCode);
            if (department == null)
            {
                throw new Exception("Không tìm thấy phòng ban với mã đã nhập");
            }

            // Đếm số nhân viên trong phòng ban
            var count = await _deptRepository.CountEmployeesByDepartmentCode(departmentCode);

            return count;
        }

        
        /// <summary>
        /// Lấy department theo code
        /// </summary>
        /// <returns></returns>
        /// Created By: dvhai (10/04/2026)
        public async Task<Department> GetDepartmentByCodeAsync(string code)
        {
            var department = await _deptRepository.GetDepartmentByCode(code);
            if (department == null)
                throw new Exception("department is null");

            return department;
        }

        /// <summary>
        /// Dem so  employee theo ma phong
        /// </summary>
        /// <returns></returns>
        /// Created By: nptnhan (18/04/2026)
        public async Task<IEnumerable<Employee>> GetEmployeesByDepartmentCodeAsync(string departmentCode)
        {
            if (string.IsNullOrWhiteSpace(departmentCode))
            {
                throw new ArgumentException("Mã phòng ban không được để trống");
            }

            // Kiểm tra phòng ban có tồn tại không
            var department = await _deptRepository.GetDepartmentByCode(departmentCode);
            if (department == null)
            {
                throw new Exception("Không tìm thấy phòng ban với mã đã nhập");
            }

            // Lấy danh sách nhân viên trong phòng ban
            var employees = await _deptRepository.GetEmployeesByDepartmentCode(departmentCode);

            // Nếu không có nhân viên thì trả về danh sách rỗng
            if (employees == null || !employees.Any())
            {
                return new List<Employee>();
            }

            return employees;
        }
        

        #region OVERRIDE METHODS
        protected override async Task<bool> ValidateBeforeDeleteAsync(Guid entityId)
        {
            //1. Validate còn nhân viên trong phòng ban không
            var hasEmployee = await _deptRepository.HasEmployeeAsync(entityId);
            if (hasEmployee)
            {
                throw new Exception("Không thể xóa phòng ban vì đã có nhân viên");
            }

            // 3. Cho phép xóa
            return true;
        }

        /// <summary>
        /// Validate tùy chỉnh cho Department
        /// </summary>
        protected override async Task<List<ValidationError>> ValidateCustom(Department department)
        {
            var errors = new List<ValidationError>();

            // Ví dụ: Kiểm tra mã phòng ban không được vượt quá 20 ký tự
            if (!string.IsNullOrEmpty(department.DepartmentCode) && department.DepartmentCode.Length > 20)
            {
                errors.Add(new ValidationError("DepartmentCode", "Mã phòng ban không được vượt quá 20 ký tự"));
            }

            return errors;
        }
        #endregion OVERRIDE METHODS
    }
}
