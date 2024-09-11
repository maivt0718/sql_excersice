CREATE USER 'thai'@'%' IDENTIFIED BY 'password';

-- # CẤP QUYỀN CHỈ ĐƯỢC SELECT DATA CHO DATABASE node44
GRANT SELECT ON node44.* TO 'thai'@'%';
-- # COMMIT
flush PRIVILEGES;

GRANT INSERT ON node44.* TO 'thai'@'%';
flush PRIVILEGES;

REVOKE INSERT ON node44.* TO 'thai'@'%';

-- # remove quyền insert cho Thái
REVOKE INSERT ON node44.* from 'thai'@'%';
flush PRIVILEGES;

-- # kiểm tra user đó có những quyền nào
SHOW GRANTS FOR 'thai'@'%'

- ALL PRIVILEGES: Cấp tất cả các quyền.
- SELECT: Quyền xem dữ liệu (truy vấn bảng).
- INSERT: Quyền thêm dữ liệu mới vào bảng.
- UPDATE: Quyền cập nhật dữ liệu hiện có.
- DELETE: Quyền xóa dữ liệu trong bảng.
- CREATE: Quyền tạo bảng hoặc cơ sở dữ liệu mới.
- ALTER: Quyền sửa đổi cấu trúc bảng (ví dụ: thêm/sửa/xóa cột).
- DROP: Quyền xóa bảng hoặc cơ sở dữ liệu.
- INDEX: Quyền tạo và xóa chỉ mục (index).
- GRANT OPTION: Quyền cấp quyền cho người khác.
- RELOAD: Quyền tải lại các bảng quyền và bộ nhớ đệm (flush privileges).
- SHUTDOWN: Quyền tắt máy chủ MySQL.