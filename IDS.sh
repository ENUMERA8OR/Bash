#!/bin/bash 
# Calls all the other functions in the correct order
main() {
    
    # Implementation
    echo "Insert your log file"
    read -r -p "Log file entered" file_name_path
    read_log_file "$file_name_path"
}

# Reads the log file line by line
read_log_file() {
    # Implementation

    while read -r "$1"; do
    echo "$1"
    done 

    send_alert "$1"
    handle_false_positives "$1"

}

# Upload your threat signature suricata rules file
upload_threat_signatures() {
    # Implementation
    echo "Insert your threat signature file"
    read -r -p "Threat signature file entered" sig_file_path
    send_alert "$sig_file_path"
    handle_false_positives "$sig_file_path"
}

# Handles false positives
handle_false_positives() {
    # Implementation
    readarray -t array3 < "$1"
    readarray -t array4 < "$2"
}

# Alerts the system administrator
send_alert() {
    # Implementation
    readarray -t array1 < "$1"
    readarray -t array2 < "$2"

    for compare1 in "${array1[@]}"; do

        line_count1=0

        for compare2 in "${array2[@]}"; do

            line_count2=0
            line_count1=$((line_count1 + 1))
            line_count2=$((line_count2 + 1)) 

            if [[ $compare1 = "$compare2" ]];then

                echo "Match detected!"
                echo "Signature rule at line $line_count2."
                echo "Detection artefact at line $line_count1."

            else

                echo "No alert was detected in the log file."
                
            fi
        done
    done

}


