using FresherMisa2026.Application.Interfaces;
using FresherMisa2026.Application.Interfaces.Repositories;
using FresherMisa2026.Application.Interfaces.Services;
using FresherMisa2026.Entities;
using FresherMisa2026.Entities.Employee;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace FresherMisa2026.Application.Services
{
    public class EmployeeService : BaseService<Employee>, IEmployeeService
    {
        private readonly IEmployeeRepository _employeeRepository;

        public EmployeeService(
            IBaseRepository<Employee> baseRepository,
            IEmployeeRepository employeeRepository
            ) : base(baseRepository)
        {
            _employeeRepository = employeeRepository;
        }

        public async Task<IEnumerable<Employee>> FilterEmployeesAsync(Guid? departmentId,Guid? positionId,decimal? salaryFrom,decimal? salaryTo,int? gender,DateTime? hireDateFrom,DateTime? hireDateTo)
        {
            var errors = new List<string>();

            // 1. Kiểm tra khoảng lương
            if (salaryFrom.HasValue && salaryTo.HasValue && salaryFrom > salaryTo)
            {
                errors.Add("salaryFrom không được lớn hơn salaryTo");
            }

            // 2. Kiểm tra khoảng ngày vào làm
            if (hireDateFrom.HasValue && hireDateTo.HasValue && hireDateFrom > hireDateTo)
            {
                errors.Add("hireDateFrom không được lớn hơn hireDateTo");
            }

            // 3. Kiểm tra giá trị giới tính
            if (gender.HasValue && (gender < 0 || gender > 2))
            {
                errors.Add("Giới tính phải là 0 (Nam), 1 (Nữ), hoặc 2 (Khác)");
            }

            // Nếu có lỗi thì throw exception
            if (errors.Any())
            {
                throw new ArgumentException(string.Join("; ", errors));
            }

            // 4. Gọi xuống repository để lấy dữ liệu
            var employees = await _employeeRepository.FilterEmployees(
                departmentId,
                positionId,
                salaryFrom,
                salaryTo,
                gender,
                hireDateFrom,
                hireDateTo
            );

            return employees;
        }


        public async Task<Employee> GetEmployeeByCodeAsync(string code)
        {
            var employee = await _employeeRepository.GetEmployeeByCode(code);
            if (employee == null)
                throw new Exception("Employee not found");

            return employee;
        }

        public async Task<IEnumerable<Employee>> GetEmployeesByDepartmentIdAsync(Guid departmentId)
        {
            return await _employeeRepository.GetEmployeesByDepartmentId(departmentId);
        }

        public async Task<IEnumerable<Employee>> GetEmployeesByPositionIdAsync(Guid positionId)
        {
            return await _employeeRepository.GetEmployeesByPositionId(positionId);
        }

        protected override async Task<List<ValidationError>> ValidateCustom(Employee employee)
        {
            var errors = new List<ValidationError>();

            // 1. Validate độ dài EmployeeCode
            if (!string.IsNullOrEmpty(employee.EmployeeCode) && employee.EmployeeCode.Length > 20)
            {
                errors.Add(new ValidationError("EmployeeCode", "Mã nhân viên không được vượt quá 20 ký tự"));
            }

            // 2. Validate EmployeeName (bạn đã có)
            if (string.IsNullOrEmpty(employee.EmployeeName))
            {
                errors.Add(new ValidationError("EmployeeName", "Tên nhân viên không được để trống"));
            }

            // 3. Validate trùng EmployeeCode
            var exist = await _employeeRepository.GetEmployeeByCode(employee.EmployeeCode);
            if (exist != null && exist.EmployeeID != employee.EmployeeID)
            {
                errors.Add(new ValidationError("EmployeeCode", "Mã nhân viên đã tồn tại"));
            }

            // 4. Validate Email (nếu có)
            if (!string.IsNullOrEmpty(employee.Email))
            {
                var emailRegex = new System.Text.RegularExpressions.Regex(
                    @"^[^@\s]+@[^@\s]+\.[^@\s]+$"
                );

                if (!emailRegex.IsMatch(employee.Email))
                {
                    errors.Add(new ValidationError("Email", "Email không đúng định dạng"));
                }
            }

            // 5. Validate PhoneNumber (nếu có)
            if (!string.IsNullOrEmpty(employee.PhoneNumber))
            {
                var phoneRegex = new System.Text.RegularExpressions.Regex(
                    @"^(0|\+84)[0-9]{9}$"
                );

                if (!phoneRegex.IsMatch(employee.PhoneNumber))
                {
                    errors.Add(new ValidationError("PhoneNumber", "Số điện thoại không hợp lệ"));
                }
            }

            // 6. Validate DateOfBirth < hiện tại
            if (employee.DateOfBirth.HasValue)
            {
                if (employee.DateOfBirth.Value >= DateTime.Now)
                {
                    errors.Add(new ValidationError("DateOfBirth", "Ngày sinh phải nhỏ hơn ngày hiện tại"));
                }
            }

            return errors;
        }
    }
}