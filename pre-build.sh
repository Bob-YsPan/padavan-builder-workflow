#!/bin/bash

# 定義你想抓取的板子路徑
BOARD_VENDOR="XIAOMI"
BOARD_NAME="MI-R3"
SOURCE_URL="https://raw.githubusercontent.com/xiaiohuan/rt-n56u/4c30384fd57c2415110292a14c306b2da1051241/trunk/configs/boards"

# 建立目標目錄
TARGET_DIR="padavan-ng/trunk/configs/boards/$BOARD_VENDOR/$BOARD_NAME"
mkdir -p "$TARGET_DIR"

# 下載該板子所需的關鍵配置文件
# 通常包含：board.h, board.mk, kernel-3.4.x.config, partitions.config
files=("board.h" "board.mk" "kernel-3.4.x.config" "partitions.config", "SingleSKU.dat")

for file in "${files[@]}"; do
    wget -q "$SOURCE_URL/$BOARD_NAME/$file" -O "$TARGET_DIR/$file"
done

echo "Custom board $BOARD_NAME added successfully."
