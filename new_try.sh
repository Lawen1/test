#!/bin/bash

# Check if the log file exists
if [ ! -f "access_log_20210128-185931.log" ]; then
    echo "Log file access_log_20210128-185931.log not found."
    exit 1
fi

# Function to print usage
print_usage() {
    echo "Usage: $0 [-ip <source_ip>] [-browser <browser_name>]"
    echo "Options:"
    echo "  -ip <source_ip>         Filter log entries by source IP address"
    echo "  -browser <browser_name> Filter log entries by browser type"
    exit 1
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        -ip)
            source_ip="$2"
            shift 2
            ;;
        -browser)
            browser="$2"
            shift 2
            ;;
        *)
            print_usage
            ;;
    esac
done

# Construct regex pattern for the browser
browser_pattern=""
# If browser is specified, create a regex pattern to match it
if [ ! -z "$browser" ]; then
    # Escape special characters in the browser name
    browser_pattern=$(sed 's/[][\\.*^$/]/\\&/g' <<< "$browser")
fi

# Filter log entries based on provided options
filtered_logs=$(awk -v ip="$source_ip" -v browser="$browser_pattern" '
    {
        if ($0 ~ ip) {
            match($0, /"[^"]*"$/);
            user_agent = substr($0, RSTART+1, RLENGTH-2);
            if (user_agent ~ browser) {
                print $0
            }
        }
    }
' access_log_20210128-185931.log | awk -v ip="$source_ip" -v browser="$browser_pattern" 'match($0, /^[^ ]+/) {ip_found=substr($0, RSTART, RLENGTH)} ip_found ~ ip && $0 ~ browser {print}')

# Print filtered logs
echo "$filtered_logs"