#!/bin/bash

# Path to the file containing the recorded touch events
events_file="path/to/events.txt"

# Delay between events in milliseconds
event_delay=50

# Read the recorded events file line by line
while IFS= read -r event; do
    # Simulate touch event on the device
    adb -s "$device" shell input tap $event

    # Add a delay between events for realistic replay
    sleep "$(bc <<< "scale=3; $event_delay / 1000")"
done < "$events_file"
