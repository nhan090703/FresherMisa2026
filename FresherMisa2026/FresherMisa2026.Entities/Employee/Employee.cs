using FresherMisa2026.Entities.Extensions;
using System;
using System.ComponentModel.DataAnnotations;
using FresherMisa2026.Entities.Extensions;

namespace FresherMisa2026.Entities.Employee
{
    [ConfigTable("Employee", false, "EmployeeCode")]
    public class Employee : BaseModel
    {
        [Key]
        public Guid EmployeeID { get; set; }
        [FresherMisa2026.Entities.Extensions.IRequired("Mã nhân viên không ???c ?? tr?ng")]
        public string EmployeeCode { get; set; }
        [FresherMisa2026.Entities.Extensions.IRequired("Tên nhân viên không ???c ?? tr?ng")]
        public string EmployeeName { get; set; }

        public int? Gender { get; set; }

        public DateTime? DateOfBirth { get; set; }

        public string? PhoneNumber { get; set; }

        public string? Email { get; set; }

        public string? Address { get; set; }
        [FresherMisa2026.Entities.Extensions.IRequired("Phòng ban không ???c ?? tr?ng")]
        public Guid DepartmentID { get; set; }
        [FresherMisa2026.Entities.Extensions.IRequired("V? trí không ???c ?? tr?ng")]
        public Guid PositionID { get; set; }

        public decimal? Salary { get; set; }

        public DateTime? CreatedDate { get; set; }
    }
}