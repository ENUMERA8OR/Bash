#!/bin/bash

echo "Enter password"
read password
len="${#password}"

if test $len -lt 8 ; then
    echo "Password is Weak"
elif test $len -ge 8 && [[ $password =~ [0-9] ]] && [[ $password =~ [A-Z] ]] && [[ $password =~ [a-z] ]] && [[ $password =~ [$~#@%^&*()_+] ]]; then
    if test $len -ge 12 ; then
        if [[ $(echo $password | fold -w1 | sort | uniq -d | wc -l) -eq 0 ]]; then
            echo "Password is Hard"
        else
            echo "Password is Strong"
        fi
    else
        echo "Password is Strong"
    fi
else
    echo "Password is Weak"
fi

echo "Do you want to generate a password? (yes/no)"
read generate

if [ "$generate" == "yes" ]; then
    echo "Enter password length:"
    read length
    echo "Generating password..."
    openssl rand -base64 48 | cut -c1-$length
else
    echo "Password not generated."
fi
