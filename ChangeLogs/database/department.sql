USE misaemployee_development
CREATE TABLE department (
  DepartmentID char(36) NOT NULL COMMENT 'Khóa chính phòng ban',
  DepartmentCode varchar(20) NOT NULL COMMENT 'Mã phòng ban',
  DepartmentName varchar(255) NOT NULL COMMENT 'Tên phòng ban',
  Description varchar(255) DEFAULT NULL COMMENT 'Diễn giải',
  PRIMARY KEY (DepartmentID)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 2048,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci;

ALTER TABLE department
ADD UNIQUE INDEX UQ_DepartmentCode (DepartmentCode);

INSERT INTO department VALUES
('550e8400-e29b-41d4-a716-446655440010', 'RND', 'Research & Development', 'Nghiên cứu và phát triển sản phẩm'),
('550e8400-e29b-41d4-a716-446655440011', 'CS', 'Customer Service', 'Chăm sóc khách hàng'),
('550e8400-e29b-41d4-a716-446655440012', 'SALE', 'Sales', 'Kinh doanh và bán hàng'),
('550e8400-e29b-41d4-a716-446655440013', 'ADMIN', 'Administration', 'Hành chính tổng hợp'),
('550e8400-e29b-41d4-a716-446655440014', 'LEGAL', 'Legal', 'Pháp chế doanh nghiệp'),
('550e8400-e29b-41d4-a716-446655440015', 'DATA', 'Data Engineering', 'Quản lý và phân tích dữ liệu'),
('550e8400-e29b-41d4-a716-446655440016', 'SEC', 'Security', 'An ninh hệ thống'),
('550e8400-e29b-41d4-a716-446655440017', 'SUP', 'Support', 'Hỗ trợ kỹ thuật');

ALTER DATABASE misaemployee_development 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_general_ci;

DELIMITER $$

-- =============================
-- Proc_UpdateDepartment
-- =============================
CREATE PROCEDURE Proc_UpdateDepartment (
  IN v_DepartmentID CHAR(36),
  IN v_DepartmentCode VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  IN v_DepartmentName VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  IN v_Description VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci
)
BEGIN
  -- 1. Check tồn tại
  IF NOT EXISTS (
    SELECT 1 
    FROM department 
    WHERE DepartmentID = v_DepartmentID
  ) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Department không tồn tại';
  END IF;

  -- 2. Check trùng code (trừ chính nó)
  IF EXISTS (
    SELECT 1 
    FROM department 
    WHERE DepartmentCode = v_DepartmentCode
      AND DepartmentID <> v_DepartmentID
  ) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'DepartmentCode đã tồn tại';
  END IF;

  -- 3. Update
  UPDATE department
  SET 
    DepartmentCode = v_DepartmentCode,
    DepartmentName = v_DepartmentName,
    Description = v_Description
  WHERE DepartmentID = v_DepartmentID;

END $$


-- =============================
-- Proc_InsertDepartment
-- =============================
CREATE PROCEDURE Proc_InsertDepartment (
  IN v_DepartmentID CHAR(36),
  IN v_DepartmentCode VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  IN v_DepartmentName VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  IN v_Description VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci
)
BEGIN
  -- 1. Check ID trùng
  IF EXISTS (
    SELECT 1 
    FROM department 
    WHERE DepartmentID = v_DepartmentID
  ) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'DepartmentID đã tồn tại';
  END IF;

  -- 2. Check code trùng
  IF EXISTS (
    SELECT 1 
    FROM department 
    WHERE DepartmentCode = v_DepartmentCode
  ) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'DepartmentCode đã tồn tại';
  END IF;

  -- 3. Insert
  INSERT INTO department (
    DepartmentID,
    DepartmentCode,
    DepartmentName,
    Description
  )
  VALUES (
    v_DepartmentID,
    v_DepartmentCode,
    v_DepartmentName,
    v_Description
  );

END $$


-- =============================
-- Proc_DeleteDepartmentById
-- =============================
CREATE PROCEDURE Proc_DeleteDepartmentById (
  IN v_DepartmentID CHAR(36)
)
BEGIN
  -- (optional) check tồn tại
  IF NOT EXISTS (
    SELECT 1 
    FROM department 
    WHERE DepartmentID = v_DepartmentID
  ) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Department không tồn tại';
  END IF;

  DELETE FROM department
  WHERE DepartmentID = v_DepartmentID;

END $$

DELIMITER ;
