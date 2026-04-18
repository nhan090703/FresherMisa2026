using Dapper;
using FresherMisa2026.Application.Extensions;
using FresherMisa2026.Application.Interfaces.Repositories;
using FresherMisa2026.Entities.Department;
using FresherMisa2026.Entities.Employee;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa2026.Infrastructure.Repositories
{
    /// <summary>
    /// Repository for Department entity
    /// </summary>
    /// Created By: dvhai (09/04/2026)
    public class DepartmentRepository : BaseRepository<Department>, IDepartmentRepository
    {
        public DepartmentRepository(IConfiguration configuration) : base(configuration)
        {

        }

        /// <summary>
        /// Đếm số nhân viên trong phòng ban theo mã
        /// </summary>
        public async Task<int> CountEmployeesByDepartmentCode(string departmentCode)
        {
            string query = SQLExtension.GetQuery("Department.CountEmployeesByCode");
            var param = new Dictionary<string, object>
            {
                { "@DepartmentCode", departmentCode }
            };

            return await _dbConnection.ExecuteScalarAsync<int>(
                query,
                param,
                commandType: System.Data.CommandType.Text
            );
        }


        /// <summary>
        /// Lấy department theo code
        /// </summary>
        /// <param name="code">Mã department</param>
        /// <returns>Department tìm thấy hoặc null</returns>
        /// CREATED BY: dvhai (09/04/2026)
        public async Task<Department> GetDepartmentByCode(string code)
        {
            string query = SQLExtension.GetQuery("Department.GetByCode");
            var @param = new Dictionary<string, object>
            {
                {"@DepartmentCode", code }
            };
            return await _dbConnection.QueryFirstOrDefaultAsync<Department>(query, @param, commandType: System.Data.CommandType.Text);
        }

        /// <summary>
        /// Lấy danh sách nhân viên theo mã phòng ban
        /// </summary>
        public async Task<IEnumerable<Employee>> GetEmployeesByDepartmentCode(string departmentCode)
        {
            string query = SQLExtension.GetQuery("Department.GetEmployeesByCode");
            var param = new Dictionary<string, object>
            {
                { "@DepartmentCode", departmentCode }
            };

            return await _dbConnection.QueryAsync<Employee>(
                query,
                param,
                commandType: System.Data.CommandType.Text
            );
        }


        /// <summary>
        /// Kiểm tra phòng ban có tồn tại nhân viên hay không
        /// </summary>
        /// <param name="departmentId">ID phòng ban cần kiểm tra</param>
        /// <returns>
        /// True nếu tồn tại nhân viên, ngược lại False
        /// </returns>
        /// Created By: nptnhan (18/04/2026)
        public async Task<bool> HasEmployeeAsync(Guid DepartmentId)
        {
            string query = SQLExtension.GetQuery("Employee.HasByDepartmentId");
            var param = new Dictionary<string, object>
                {
                    { "@DepartmentID", DepartmentId }
                };
            return await _dbConnection.ExecuteScalarAsync<bool>(query, param, commandType: System.Data.CommandType.Text);
         }
    }
}
