#!/bin/bash

# Define the log file
logfile="data/access_log_20210128-185931.log"

# Ask the user what they want to search for
echo "Do you want to filter IP or browser? Enter 'ip' or 'browser':"
read -r search_type

if [[ "$search_type" == "ip" ]]; then
    # Ask for the IP
    echo "Enter the IP or partial IP you want to search for:"
    read -r pattern
    # Use awk to find the IP and extract the IP addresses
    found_ips=$(awk -v pattern="$pattern" '$1 ~ pattern {print $1}' "$logfile")
    
    if [ -z "$found_ips" ]; then
        echo "IP address not found in the log file."
    else
        echo "Found IP addresses:"
        echo "$found_ips"
    fi

elif [[ "$search_type" == "browser" ]]; then
    # Ask for the browser
    echo "Enter the exact browser name or part of it you want to search for (e.g., Chrome):"
    read -r browser
    # Use awk to find the browser and extract the IP addresses
    found_entries=$(awk -v browser="$browser" 'tolower($0) ~ tolower(browser) {printf"%s ", $1; for (i=13; i<=NF; i++) printf "%s ", $i; print ""}' "$logfile")

    if [ -z "$found_entries" ]; then
        echo "Browser not found in the log file."
    else
        echo "Found entries:"
        echo "$found_entries"
    fi

else
    echo "Invalid input. Please enter either 'ip' or 'browser'."
fi
