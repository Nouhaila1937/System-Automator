
ma_date=$(date +"%Y-%m-%d")  # save the date 

Cleaning(){

    UID_ROOT=0
    
    if [ "$UID" -ne "$UID_ROOT" ]; then 
        
        echo "error 100 : Permission denied "

    else 

        echo "Start the operation of cleaning "

        # Clean temporary files
        echo "Cleaning temporary files..."
        rm -rf /tmp/*

        # Clean apt cache
        echo "Cleaning apt cache..."
        apt clean

        # Remove obsolete packages
        echo "Removing obsolete packages..."
        apt autoremove --purge

        # Clean thumbnail cache
        echo "Cleaning thumbnail cache..."
        rm -rf ~/.cache/thumbnails/*

        # Clean log files
        echo "Cleaning log files..."
        rm -rf /var/log/*


        # Save modifications to a file
        echo "Saving modifications..."
        {
            echo $ma_date
            echo "Temporary files cleaned"
            echo "Apt cache cleaned"
            echo "Obsolete packages removed"
            echo "Thumbnail cache cleaned"
            echo "Log files cleaned"
            echo "====================="
        } >> system_cleaning_log.txt
        
      
    fi


}