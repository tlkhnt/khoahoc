sudo -v ; curl https://rclone.org/install.sh | sudo bash

#!/bin/bash

# Đường dẫn tới file rclone.conf bạn muốn import
CONF_FILE_SOURCE="./rclone.conf"

# Thư mục cấu hình Rclone (Linux/macOS)
RCLONE_CONF_DIR="$HOME/.config/rclone"

# Kiểm tra nếu thư mục cấu hình không tồn tại, tạo mới
if [ ! -d "$RCLONE_CONF_DIR" ]; then
    echo "Tạo thư mục cấu hình Rclone: $RCLONE_CONF_DIR"
    mkdir -p "$RCLONE_CONF_DIR"
fi

# Sao chép file cấu hình vào thư mục Rclone
if [ -f "$CONF_FILE_SOURCE" ]; then
    echo "Sao chép file cấu hình từ $CONF_FILE_SOURCE đến $RCLONE_CONF_DIR"
    cp "$CONF_FILE_SOURCE" "$RCLONE_CONF_DIR/rclone.conf"
    echo "Import file cấu hình thành công!"
else
    echo "Không tìm thấy file cấu hình tại: $CONF_FILE_SOURCE"
    exit 1
fi

# Xác minh việc import thành công
if rclone config show; then
    echo "Rclone đã nhận file cấu hình."
else
    echo "Đã xảy ra lỗi khi import file cấu hình."
    exit 1
fi

# rclone copy gdrive: onedrive:2k7 --ignore-existing -P

# rclone copy edrive: onedrive:IELTS --ignore-existing -P
