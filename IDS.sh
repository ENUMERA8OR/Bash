#!/bin/bash 
# Calls all the other functions in the correct order
main() {
    
    # Implementation
    echo "Insert your log file"
    read -p "Log file entered" file_name
    read_log_file "$file_name"
}

# Reads the log file line by line
read_log_file(file_name) {
    # Implementation
    while read file_name; do
    echo "$file_name"
    done < file_name
    send_alert "$file_name"
    handle_false_positives "$file_name"

}

upload_threat_signatures() {
    # Implementation
    echo "Insert your threat signature file"
    read -p "Threat signature file entered" sig_file
    send_alert "$sig_file"
    handle_false_positives "$sig_file"
}

# Handles false positives
handle_false_positives() {
    # Implementation
    readarray -t array3 < $file_name
    readarray -t array4 < $sig_file
}

# Alerts the system administrator
send_alert(file_name,sig_file) {
    # Implementation
    readarray -t array1 < $file_name
    readarray -t array2 < $sig_file
    for compare1 in "$array[[@]]";do
        for compare2 in "$array2[[@]]";do
            if [[ $compare1[] -eq $compare2[] ]];then
                
                echo "Alert detected!"

            else

                echo "No alert was detected in the log file."
            fi
        done
    done

}

main
