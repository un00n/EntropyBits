#!/bin/bash

# Prompt the user to enter the desired password length
read -p "Enter the length of password: " length

# Validate the entered length (ensure it's a positive integer)
if [[ $length =~ ^[0-9]+$ ]]; then

    # Present options for password character types
    printf '[0]Numbers\n[1]letters\n[2]Both\n[3]with special characters\n'
    read choice

    # Handle user's choice for character types
    case ${choice} in
        0)
            trOption=[:digit:]
            ;;
        1)
            trOption=[:alpha:]
            ;;
        2)
            trOption=[:alnum:]
            ;;
        3)
            trOption=[:graph:]
            ;;
        *)
            printf "Invalid Input!\n"
            exit 1  # Exit the script if invalid choice
            ;;
    esac

    # Function to generate a password of specified length and character set
    randfunc() {
        < /dev/urandom tr -dc "$1" | head -c "$2" && echo ""
    }

    # Generate and print the password
    password=$(randfunc "$trOption" "$length")
    echo "Generated password: $password"

else
    echo "Invalid input! Please enter a positive integer for password length."
fi
