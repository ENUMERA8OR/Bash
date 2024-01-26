#!/bin/bash 
# Calls all the other functions in the correct order
main() {
    
    # Implementation
    echo "Insert your log file"
    read -p "Log file entered" file_name_path
    read_log_file "$file_name_path"
}

# Reads the log file line by line
read_log_file(file_name_path) {
    # Implementation

    while read file_name_path; do
    echo "$file_name_path"
    done 

    send_alert "$file_name_path"
    handle_false_positives "$file_name_path"

}

# Upload your threat signature suricata rules file
upload_threat_signatures() {
    # Implementation
    echo "Insert your threat signature file"
    read -p "Threat signature file entered" sig_file_path
    send_alert "$sig_file_path"
    handle_false_positives "$sig_file_path"
}

# Handles false positives
handle_false_positives(file_name_path,sig_file_path) {
    # Implementation
    readarray -t array3 < $file_name_path
    readarray -t array4 < $sig_file_path
}

# Alerts the system administrator
send_alert(file_name_path,sig_file_path) {
    # Implementation
    readarray -t array1 < $file_name_path
    readarray -t array2 < $sig_file_path

    for compare1 in "${array1[@]}"; do

        line_count1=0

        for compare2 in "${array2[@]}"; do

            line_count2=0
            line_count1=line_count1 + 1
            line_count2=line_count2 + 1 

            if [[ $compare1 -eq $compare2 ]];then

                echo "Match detected!"
                echo "Signature rule at line $line_count2."
                echo "Detection artefact at line $line_count1."

            else

                echo "No alert was detected in the log file."
                
            fi
        done
    done

}


