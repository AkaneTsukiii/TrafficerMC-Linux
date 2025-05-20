#!/bin/bash

# 1. Cài Node.js nếu chưa có
if ! command -v node &> /dev/null; then
    echo "[+] Cài đặt Node.js và npm..."
    sudo apt update
    sudo apt install -y nodejs npm
else
    echo "[✓] Node.js đã được cài đặt."
fi

# 2. Giải nén project nếu chưa tồn tại
if [ ! -d "trafficer-cli" ]; then
    if [ -f "trafficer-cli.zip" ]; then
        echo "[+] Giải nén trafficer-cli.zip..."
        unzip trafficer-cli.zip
    else
        echo "[!] Không tìm thấy file trafficer-cli.zip."
        exit 1
    fi
else
    echo "[✓] Thư mục trafficer-cli đã tồn tại."
fi

# 3. Cài dependencies
cd trafficer-cli
echo "[+] Cài đặt dependencies..."
npm install

# 4. Chạy ứng dụng
echo "[🚀] Khởi động TrafficerMC CLI..."
npm start
