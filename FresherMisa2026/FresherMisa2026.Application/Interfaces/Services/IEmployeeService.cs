using FresherMisa2026.Entities.Employee;
using System;
using System.Collections.Generic;

namespace FresherMisa2026.Application.Interfaces.Services
{
    public interface IEmployeeService : IBaseService<Employee>
    {
        Task<Employee> GetEmployeeByCodeAsync(string code);
        Task<IEnumerable<Employee>> GetEmployeesByDepartmentIdAsync(Guid departmentId);
        Task<IEnumerable<Employee>> GetEmployeesByPositionIdAsync(Guid positionId);
        /// <summary>
        /// L?c nhân viên theo nhi?u tiêu chí
        /// </summary>
        /// <param name="departmentId">Phòng ban</param>
        /// <param name="positionId">Ch?c v?</param>
        /// <param name="salaryFrom">L??ng t?</param>
        /// <param name="salaryTo">L??ng ??n</param>
        /// <param name="gender">Gi?i tính (0: N?, 1: Nam, 2: Khác)</param>
        /// <param name="hireDateFrom">Ngày vào làm t?</param>
        /// <param name="hireDateTo">Ngày vào làm ??n</param>
        /// <returns>Danh sách nhân viên th?a mãn ?i?u ki?n</returns>
        /// Created by nptnhan
        /// Created date: 18/04/2026
        Task<IEnumerable<Employee>> FilterEmployeesAsync(
            Guid? departmentId,
            Guid? positionId,
            decimal? salaryFrom,
            decimal? salaryTo,
            int? gender,
            DateTime? hireDateFrom,
            DateTime? hireDateTo
        );

    }
}