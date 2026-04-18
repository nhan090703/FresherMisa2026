using FresherMisa2026.Entities.Department;
using FresherMisa2026.Entities.Employee;
using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa2026.Application.Interfaces.Repositories
{
    public interface IDepartmentRepository : IBaseRepository<Department>
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="code"></param>
        /// <returns></returns>
        Task<Department> GetDepartmentByCode(string code);
        Task<bool> HasEmployeeAsync(Guid DepartmentId);

        /// <summary>
        /// Lấy danh sách nhân viên theo mã phòng ban
        /// </summary>
        Task<IEnumerable<Employee>> GetEmployeesByDepartmentCode(string departmentCode);

        /// <summary>
        /// Đếm số nhân viên trong phòng ban theo mã
        /// </summary>
        Task<int> CountEmployeesByDepartmentCode(string departmentCode);

    }
}
