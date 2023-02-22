#!/bin/bash

INPUT_DEVICE="alsa_input.pci-0000_00_1f.3.analog-stereo"
OUTPUT_DEVICE="alsa_output.usb-Lenovo_ThinkPad_Thunderbolt_3_Dock_USB_Audio"

# Find the input device ID
INPUT_DEVICE_ID=$(pactl list short sources | grep "$INPUT_DEVICE" | awk '{print $1}')
if [ -z "$INPUT_DEVICE_ID" ]; then
    echo "Input device not found: $INPUT_DEVICE"
    exit 1
fi

# Find the output device ID
OUTPUT_DEVICE_ID=$(pactl list short sinks | grep "$OUTPUT_DEVICE" | awk '{print $1}')
if [ -z "$OUTPUT_DEVICE_ID" ]; then
    echo "Output device not found: $OUTPUT_DEVICE"
    exit 1
fi

# Set the default input and output devices
pactl set-default-source "$INPUT_DEVICE_ID"
pactl set-default-sink "$OUTPUT_DEVICE_ID"
