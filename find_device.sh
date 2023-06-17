#!/bin/bash

# Find the connected Android device
find_device() {
    device_info=$(adb devices | awk 'NR==2 {print}')
    if [ -z "$device_info" ]; then
        echo "No device found. Please make sure your Android device is connected."
        exit 1
    fi

    device=$(echo "$device_info" | awk '{print $1}')
    echo "Found device: $device"
}

# Check if adb command is available
command -v adb >/dev/null 2>&1 || { echo "ADB command not found. Please install Android SDK Platform Tools."; exit 1; }

# Find the connected device
find_device
