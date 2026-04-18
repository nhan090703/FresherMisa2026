CREATE TABLE employee (
  EmployeeID char(36) NOT NULL COMMENT 'Khóa chính nhân viên',
  EmployeeCode varchar(20) NOT NULL COMMENT 'Mã nhân viên',
  EmployeeName varchar(100) NOT NULL COMMENT 'Tên nhân viên',
  Gender int(11) DEFAULT 0 COMMENT 'Giới tính: 0-Nữ, 1-Nam, 2-Khác',
  DateOfBirth date DEFAULT NULL COMMENT 'Ngày sinh',
  PhoneNumber varchar(50) DEFAULT NULL COMMENT 'Số điện thoại',
  Email varchar(100) DEFAULT NULL COMMENT 'Email',
  Address varchar(255) DEFAULT NULL COMMENT 'Địa chỉ',
  DepartmentID char(36) NOT NULL COMMENT 'Phòng ban',
  PositionID char(36) NOT NULL COMMENT 'Chức vụ',
  Salary decimal(18, 4) DEFAULT 0.0000 COMMENT 'Lương cơ bản',
  CreatedDate datetime DEFAULT NULL COMMENT 'Ngày tạo',

  PRIMARY KEY (EmployeeID),

  CONSTRAINT fk_employee_department 
    FOREIGN KEY (DepartmentID) 
    REFERENCES department(DepartmentID),

  CONSTRAINT fk_employee_position 
    FOREIGN KEY (PositionID) 
    REFERENCES `position`(PositionID)
)
ENGINE=InnoDB
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

ALTER TABLE Employee
ADD COLUMN IsDeleted BOOLEAN DEFAULT FALSE;

INSERT INTO employee VALUES
('e0000001-0000-0000-0000-000000000001', 'EMP001', 'Nguyễn Văn An', 1, '1995-03-15', '0912345678', 'an.nguyen@misa.com', 'Hà Nội', '550e8400-e29b-41d4-a716-446655440012', '11111111-1111-1111-1111-111111111111', 18000000.0000, '2026-04-15 09:29:18'),
('e0000001-0000-0000-0000-000000000002', 'EMP002', 'Trần Thị Mai', 0, '1998-07-20', '0987654321', 'mai.tran@misa.com', 'Hồ Chí Minh', '550e8400-e29b-41d4-a716-446655440012', '22222222-2222-2222-2222-222222222222', 15000000.0000, '2026-04-15 09:29:18'),
('e0000001-0000-0000-0000-000000000003', 'EMP003', 'Phạm Minh Hoàng', 1, '1993-11-05', '0905123456', 'hoang.pham@misa.com', 'Đà Nẵng', '550e8400-e29b-41d4-a716-446655440012', '33333333-3333-3333-3333-333333333333', 35000000.0000, '2026-04-15 09:29:18'),
('e0000001-0000-0000-0000-000000000004', 'EMP004', 'Lê Thị Hương', 0, '1996-02-10', '0934567890', 'huong.le@misa.com', 'Hà Nội', '550e8400-e29b-41d4-a716-446655440010', '44444444-4444-4444-4444-444444444444', 14000000.0000, '2026-04-15 09:29:18'),
('e0000001-0000-0000-0000-000000000005', 'EMP005', 'Nguyễn Quốc Bảo', 1, '1992-09-18', '0911223344', 'bao.nguyen@misa.com', 'Hà Nội', '550e8400-e29b-41d4-a716-446655440010', '44444444-4444-4444-4444-444444444444', 16000000.0000, '2026-04-15 09:29:18'),
('e0000001-0000-0000-0000-000000000006', 'EMP006', 'Đặng Thị Lan', 0, '1994-04-22', '0977112233', 'lan.dang@misa.com', 'HCM', '550e8400-e29b-41d4-a716-446655440011', '55555555-5555-5555-5555-555555555555', 20000000.0000, '2026-04-15 09:29:18'),
('e0000001-0000-0000-0000-000000000007', 'EMP007', 'Hoàng Văn Sơn', 1, '1990-01-30', '0944556677', 'son.hoang@misa.com', 'HCM', '550e8400-e29b-41d4-a716-446655440011', '55555555-5555-5555-5555-555555555555', 22000000.0000, '2026-04-15 09:29:18'),
('e0000001-0000-0000-0000-000000000008', 'EMP008', 'Vũ Thị Thu', 0, '1997-06-12', '0966889900', 'thu.vu@misa.com', 'Hà Nội', '550e8400-e29b-41d4-a716-446655440013', '66666666-6666-6666-6666-666666666666', 17000000.0000, '2026-04-15 09:29:18'),
('e0000001-0000-0000-0000-000000000009', 'EMP009', 'Phan Anh Tú', 1, '1999-12-01', '0922113344', 'tu.phan@misa.com', 'HCM', '550e8400-e29b-41d4-a716-446655440013', '66666666-6666-6666-6666-666666666666', 16500000.0000, '2026-04-15 09:29:18'),
('e0000001-0000-0000-0000-000000000010', 'EMP010', 'Bùi Văn Đức', 1, '1991-08-08', '0933445566', 'duc.bui@misa.com', 'Đà Nẵng', '550e8400-e29b-41d4-a716-446655440014', '77777777-7777-7777-7777-777777777777', 21000000.0000, '2026-04-15 09:29:18'),
('e0000001-0000-0000-0000-000000000011', 'EMP011', 'Lý Thị Mỹ', 0, '1996-10-10', '0988112233', 'my.ly@misa.com', 'Hà Nội', '550e8400-e29b-41d4-a716-446655440014', '77777777-7777-7777-7777-777777777777', 19500000.0000, '2026-04-15 09:29:18'),
('e0000001-0000-0000-0000-000000000012', 'EMP012', 'Nguyễn Trung Kiên', 1, '1998-05-05', '0912000001', 'kien.nguyen@misa.com', 'Hà Nội', '550e8400-e29b-41d4-a716-446655440012', '11111111-1111-1111-1111-111111111111', 17500000.0000, '2026-04-15 09:29:18'),
('e0000001-0000-0000-0000-000000000013', 'EMP013', 'Trịnh Hà My', 0, '1997-09-09', '0912000002', 'my.trinh@misa.com', 'HCM', '550e8400-e29b-41d4-a716-446655440012', '22222222-2222-2222-2222-222222222222', 15500000.0000, '2026-04-15 09:29:18'),
('e0000001-0000-0000-0000-000000000014', 'EMP014', 'Đỗ Minh Tuấn', 1, '1994-07-07', '0912000003', 'tuan.do@misa.com', 'HCM', '550e8400-e29b-41d4-a716-446655440012', '11111111-1111-1111-1111-111111111111', 19000000.0000, '2026-04-15 09:29:18'),
('e0000001-0000-0000-0000-000000000015', 'EMP015', 'Phạm Thị Linh', 0, '1995-03-03', '0912000004', 'linh.pham@misa.com', 'Đà Nẵng', '550e8400-e29b-41d4-a716-446655440012', '22222222-2222-2222-2222-222222222222', 16000000.0000, '2026-04-15 09:29:18');

DELIMITER $$

-- =============================
-- Proc_UpdateEmployee
-- =============================
CREATE PROCEDURE Proc_UpdateEmployee (
  IN v_EmployeeID CHAR(36),
  IN v_EmployeeCode VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  IN v_EmployeeName VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  IN v_Gender INT,
  IN v_DateOfBirth DATE,
  IN v_PhoneNumber VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  IN v_Email VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  IN v_Address VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  IN v_DepartmentID CHAR(36),
  IN v_PositionID CHAR(36),
  IN v_Salary DECIMAL(18,4),
  IN v_CreatedDate DATETIME
)
BEGIN
  -- 1. Check tồn tại
  IF NOT EXISTS (
    SELECT 1 
    FROM employee 
    WHERE EmployeeID = v_EmployeeID
  ) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Employee không tồn tại';
  END IF;

  -- 2. Check trùng code (trừ chính nó)
  IF EXISTS (
    SELECT 1 
    FROM employee 
    WHERE EmployeeCode = v_EmployeeCode
      AND EmployeeID <> v_EmployeeID
  ) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'EmployeeCode đã tồn tại';
  END IF;

  -- 3. Update
  UPDATE employee
  SET 
    EmployeeCode = v_EmployeeCode,
    EmployeeName = v_EmployeeName,
    Gender = v_Gender,
    DateOfBirth = v_DateOfBirth,
    PhoneNumber = v_PhoneNumber,
    Email = v_Email,
    Address = v_Address,
    DepartmentID = v_DepartmentID,
    PositionID = v_PositionID,
    Salary = v_Salary,
    CreatedDate = v_CreatedDate
  WHERE EmployeeID = v_EmployeeID;

END $$


-- =============================
-- Proc_InsertEmployee
-- =============================
CREATE PROCEDURE Proc_InsertEmployee (
  IN v_EmployeeID CHAR(36),
  IN v_EmployeeCode VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  IN v_EmployeeName VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  IN v_Gender INT,
  IN v_DateOfBirth DATE,
  IN v_PhoneNumber VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  IN v_Email VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  IN v_Address VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  IN v_DepartmentID CHAR(36),
  IN v_PositionID CHAR(36),
  IN v_Salary DECIMAL(18,4),
  IN v_CreatedDate DATETIME
)
BEGIN
  -- 1. Check ID trùng
  IF EXISTS (
    SELECT 1 
    FROM employee 
    WHERE EmployeeID = v_EmployeeID
  ) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'EmployeeID đã tồn tại';
  END IF;

  -- 2. Check code trùng
  IF EXISTS (
    SELECT 1 
    FROM employee 
    WHERE EmployeeCode = v_EmployeeCode
  ) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'EmployeeCode đã tồn tại';
  END IF;

  -- 3. Insert
  INSERT INTO employee (
    EmployeeID,
    EmployeeCode,
    EmployeeName,
    Gender,
    DateOfBirth,
    PhoneNumber,
    Email,
    Address,
    DepartmentID,
    PositionID,
    Salary,
    CreatedDate
  )
  VALUES (
    v_EmployeeID,
    v_EmployeeCode,
    v_EmployeeName,
    v_Gender,
    v_DateOfBirth,
    v_PhoneNumber,
    v_Email,
    v_Address,
    v_DepartmentID,
    v_PositionID,
    v_Salary,
    v_CreatedDate
  );

END $$


-- =============================
-- Proc_DeleteEmployeeById
-- =============================
CREATE PROCEDURE Proc_DeleteEmployeeById (
  IN v_EmployeeID CHAR(36)
)
BEGIN
  -- 1. Check tồn tại
  IF NOT EXISTS (
    SELECT 1 
    FROM employee 
    WHERE EmployeeID = v_EmployeeID
  ) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Employee không tồn tại';
  END IF;

  -- 2. Delete
  DELETE FROM employee
  WHERE EmployeeID = v_EmployeeID;

END $$

DELIMITER ;

ALTER TABLE employee
ADD COLUMN HireDateFrom DATE DEFAULT NULL COMMENT 'Ngày vào làm từ',
ADD COLUMN HireDateTo DATE DEFAULT NULL COMMENT 'Ngày vào làm đến';

UPDATE employee SET HireDateFrom = '2019-01-10', HireDateTo = '2024-03-15' WHERE EmployeeID = 'e0000001-0000-0000-0000-000000000001';
UPDATE employee SET HireDateFrom = '2020-03-05', HireDateTo = '2025-02-01' WHERE EmployeeID = 'e0000001-0000-0000-0000-000000000002';
UPDATE employee SET HireDateFrom = '2018-07-22', HireDateTo = '2023-12-31' WHERE EmployeeID = 'e0000001-0000-0000-0000-000000000003';
UPDATE employee SET HireDateFrom = '2021-11-15', HireDateTo = '2025-06-20' WHERE EmployeeID = 'e0000001-0000-0000-0000-000000000004';
UPDATE employee SET HireDateFrom = '2019-09-01', HireDateTo = '2024-05-01' WHERE EmployeeID = 'e0000001-0000-0000-0000-000000000005';
UPDATE employee SET HireDateFrom = '2022-02-20', HireDateTo = '2025-03-18' WHERE EmployeeID = 'e0000001-0000-0000-0000-000000000006';
UPDATE employee SET HireDateFrom = '2020-06-18', HireDateTo = '2024-06-30' WHERE EmployeeID = 'e0000001-0000-0000-0000-000000000007';
UPDATE employee SET HireDateFrom = '2023-04-12', HireDateTo = '2025-01-25' WHERE EmployeeID = 'e0000001-0000-0000-0000-000000000008';
UPDATE employee SET HireDateFrom = '2019-12-30', HireDateTo = '2024-09-10' WHERE EmployeeID = 'e0000001-0000-0000-0000-000000000009';
UPDATE employee SET HireDateFrom = '2021-05-25', HireDateTo = '2025-04-05' WHERE EmployeeID = 'e0000001-0000-0000-0000-000000000010';
UPDATE employee SET HireDateFrom = '2020-08-14', HireDateTo = '2024-11-22' WHERE EmployeeID = 'e0000001-0000-0000-0000-000000000011';
UPDATE employee SET HireDateFrom = '2022-01-07', HireDateTo = '2025-02-28' WHERE EmployeeID = 'e0000001-0000-0000-0000-000000000012';

UPDATE employee SET HireDateFrom = '2022-01-07', HireDateTo = '2025-02-28' WHERE EmployeeID = 'e0000001-0000-0000-0000-000000000013';
UPDATE employee SET HireDateFrom = '2022-01-07', HireDateTo = '2025-02-28' WHERE EmployeeID = 'e0000001-0000-0000-0000-000000000014';
UPDATE employee SET HireDateFrom = '2022-01-07', HireDateTo = '2025-02-28' WHERE EmployeeID = 'e0000001-0000-0000-0000-000000000015';

DELIMITER $$

CREATE PROCEDURE Proc_FilterEmployees (
    IN v_DepartmentID CHAR(36),
    IN v_PositionID CHAR(36),
    IN v_SalaryFrom DECIMAL(18,4),
    IN v_SalaryTo DECIMAL(18,4),
    IN v_Gender INT,
    IN v_HireDateFrom DATE,
    IN v_HireDateTo DATE
)
BEGIN
    -- 1. Kiểm tra tham số lương
    IF v_SalaryFrom IS NOT NULL AND v_SalaryTo IS NOT NULL AND v_SalaryFrom > v_SalaryTo THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'salaryFrom không được lớn hơn salaryTo';
    END IF;

    -- 2. Kiểm tra tham số ngày vào làm
    IF v_HireDateFrom IS NOT NULL AND v_HireDateTo IS NOT NULL AND v_HireDateFrom > v_HireDateTo THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'hireDateFrom không được lớn hơn hireDateTo';
    END IF;

    -- 3. Trả về danh sách nhân viên theo filter
    SELECT 
        e.EmployeeID,
        e.EmployeeCode,
        e.EmployeeName,
        e.Gender,
        e.DateOfBirth,
        e.PhoneNumber,
        e.Email,
        e.Address,
        e.DepartmentID,
        e.PositionID,
        e.Salary,
        e.CreatedDate,
        e.HireDateFrom,
        e.HireDateTo
    FROM employee e
    WHERE (v_DepartmentID IS NULL OR e.DepartmentID = v_DepartmentID)
      AND (v_PositionID IS NULL OR e.PositionID = v_PositionID)
      AND (v_SalaryFrom IS NULL OR e.Salary >= v_SalaryFrom)
      AND (v_SalaryTo IS NULL OR e.Salary <= v_SalaryTo)
      AND (v_Gender IS NULL OR e.Gender = v_Gender)
      AND (v_HireDateFrom IS NULL OR e.HireDateFrom >= v_HireDateFrom)
      AND (v_HireDateTo IS NULL OR e.HireDateTo <= v_HireDateTo);
END$$

DELIMITER ;
