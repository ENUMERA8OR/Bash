# Bash
Bash Cybersecurity Projects
1. Password Strength Checker & Generator
   Description: Password Strength Check:

The script prompts the user to enter a password.

It then checks the length of the password and whether it contains at least one number, one uppercase letter, one lowercase letter, and one special character.

Based on these checks, it classifies the password as "Weak", "Strong", or "Hard".

If the password is less than 8 characters long, it's considered "Weak".

If the password is at least 8 characters long and contains all the required elements, it's considered "Strong".

If the password is at least 12 characters long and contains all the required elements and no repeating characters, it's considered "Hard".

Password Generation:

After checking the password strength, the script asks if the user wants to generate a password.

If the user answers "yes", it prompts for the desired password length.

It then generates a random password of the specified length using the openssl rand command.

The openssl rand command generates a random string of bytes, which is then base64 encoded. The cut command is used to trim the string to the desired length.

If the user answers "no", it informs that the password was not generated.

2.
