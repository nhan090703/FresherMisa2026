CREATE TABLE position (
  PositionID char(36) NOT NULL COMMENT 'Khóa chính chức vụ',
  PositionCode varchar(20) NOT NULL COMMENT 'Mã chức vụ',
  PositionName varchar(255) NOT NULL COMMENT 'Tên chức vụ',
  PRIMARY KEY (PositionID)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 2340,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci;

INSERT INTO position VALUES
('11111111-1111-1111-1111-111111111111', 'DEV', 'Developer'),
('22222222-2222-2222-2222-222222222222', 'QA', 'Quality Assurance'),
('33333333-3333-3333-3333-333333333333', 'PM', 'Project Manager'),
('44444444-4444-4444-4444-444444444444', 'HR', 'HR Specialist'),
('55555555-5555-5555-5555-555555555555', 'ACC', 'Accountant'),
('66666666-6666-6666-6666-666666666666', 'MKT', 'Marketing Executive'),
('77777777-7777-7777-7777-777777777777', 'OPS', 'Operation Staff');

DELIMITER $$

-- =============================
-- Proc_UpdatePosition
-- =============================
CREATE PROCEDURE Proc_UpdatePosition (
  IN v_PositionID CHAR(36),
  IN v_PositionCode VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  IN v_PositionName VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci
)
BEGIN
  -- 1. Check tồn tại
  IF NOT EXISTS (
    SELECT 1 
    FROM position 
    WHERE PositionID = v_PositionID
  ) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Position không tồn tại';
  END IF;

  -- 2. Check trùng code (trừ chính nó)
  IF EXISTS (
    SELECT 1 
    FROM position 
    WHERE PositionCode = v_PositionCode
      AND PositionID <> v_PositionID
  ) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'PositionCode đã tồn tại';
  END IF;

  -- 3. Update
  UPDATE position
  SET 
    PositionCode = v_PositionCode,
    PositionName = v_PositionName
  WHERE PositionID = v_PositionID;

END $$


-- =============================
-- Proc_InsertPosition
-- =============================
CREATE PROCEDURE Proc_InsertPosition (
  IN v_PositionID CHAR(36),
  IN v_PositionCode VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  IN v_PositionName VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci
)
BEGIN
  -- 1. Check ID trùng
  IF EXISTS (
    SELECT 1 
    FROM position 
    WHERE PositionID = v_PositionID
  ) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'PositionID đã tồn tại';
  END IF;

  -- 2. Check code trùng
  IF EXISTS (
    SELECT 1 
    FROM position 
    WHERE PositionCode = v_PositionCode
  ) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'PositionCode đã tồn tại';
  END IF;

  -- 3. Insert
  INSERT INTO position (
    PositionID,
    PositionCode,
    PositionName
  )
  VALUES (
    v_PositionID,
    v_PositionCode,
    v_PositionName
  );

END $$


-- =============================
-- Proc_DeletePositionById
-- =============================
CREATE PROCEDURE Proc_DeletePositionById (
  IN v_PositionID CHAR(36)
)
BEGIN
  -- 1. Check tồn tại
  IF NOT EXISTS (
    SELECT 1 
    FROM position 
    WHERE PositionID = v_PositionID
  ) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Position không tồn tại';
  END IF;

  -- 2. Check ràng buộc (có employee không)
  IF EXISTS (
    SELECT 1 
    FROM employee 
    WHERE PositionID = v_PositionID
  ) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Không thể xóa chức vụ vì đã có nhân viên';
  END IF;

  -- 3. Delete
  DELETE FROM position
  WHERE PositionID = v_PositionID;

END $$

DELIMITER ;