using FresherMisa2026.Entities.Employee;
using System;
using System.Collections.Generic;

namespace FresherMisa2026.Application.Interfaces.Repositories
{
    public interface IEmployeeRepository : IBaseRepository<Employee>
    {
        Task<Employee> GetEmployeeByCode(string code);
        Task<IEnumerable<Employee>> GetEmployeesByDepartmentId(Guid departmentId);
        Task<IEnumerable<Employee>> GetEmployeesByPositionId(Guid positionId);
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
        /// created date: 18/4/2026

        Task<IEnumerable<Employee>> FilterEmployees(
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
