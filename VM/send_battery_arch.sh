#!/bin/bash
konsole -e bash -c "python3 battery_sender.py 192.168.122.54; exec bash" &
