#!/bin/bash

# Start the application
start_app() {
    package_name="com.example.app"  # Replace with the package name of your application
    activity_name=".MainActivity"  # Replace with the name of the activity to launch

    adb -s "$device" shell am start -n "$package_name/$package_name$activity_name"
}

# Stop the application
stop_app() {
    package_name="com.example.app"  # Replace with the package name of your application

    adb -s "$device" shell am force-stop "$package_name"
}

# Check the command-line argument
if [ "$1" = "start" ]; then
    source find_device.sh
    start_app
elif [ "$1" = "stop" ]; then
    source find_device.sh
    stop_app
else
    echo "Invalid command. Usage: $0 {start|stop}"
    exit 1
fi
