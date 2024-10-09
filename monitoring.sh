#!/bin/bash

monitoring(){
    

  #!/bin/bash

# Performance thresholds (modifiable as needed)
CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=90
NETWORK_THRESHOLD=1000000 # 1 Mbps

# Function to display an error dialog
# Remplacez kdialog par zenity ou dialog selon votre préférence
display_error_dialog() {
    kdialog --error "Some error occurred: $1"
}

# Monitoring performance
while true; do
    # CPU usage monitoring
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/., \([0-9.]\)% id.*/\1/" | awk '{print 100 - $1}')
    if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
        display_error_dialog "High CPU usage: $CPU_USAGE%"
    fi

    # Memory usage monitoring
    MEMORY_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100}')
    if [ $(echo "$MEMORY_USAGE > $MEMORY_THRESHOLD" | bc -l) ]; then
        display_error_dialog "High memory usage: $MEMORY_USAGE%"
    fi

    # Disk usage monitoring
    DISK_USAGE=$(df -h | grep '/dev/sda1' | awk '{print $5}' | sed 's/%//')
    if [ $DISK_USAGE > $DISK_THRESHOLD ]; then
        display_error_dialog "High disk usage: $DISK_USAGE%"
    fi

    # Network usage monitoring
    NETWORK_USAGE=$(ifstat -b | grep eth0 | awk '{print $7}')
    if (( $NETWORK_USAGE > $NETWORK_THRESHOLD )); then
        display_error_dialog "High network usage: $NETWORK_USAGE bps"
    fi

    # Monitoring interval (modifiable as needed)
    sleep 300  # 5 minutes
done

}