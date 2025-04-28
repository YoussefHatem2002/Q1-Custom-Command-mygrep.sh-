# Q1-Custom-Command-mygrep.sh-

# You're asked to build a mini version of the grep command. Your script will be called `mygrep.sh` and must support:
![WhatsApp Image](https://github.com/YoussefHatem2002/Q1-Custom-Command-mygrep.sh-/blob/main/WhatsApp%20Image%202025-04-27%20at%2022.26.37_d431b9ac.jpg?raw=true) 

![WhatsApp Image](https://github.com/YoussefHatem2002/Q1-Custom-Command-mygrep.sh-/blob/main/WhatsApp%20Image%202025-04-27%20at%2022.27.12_63aab046.jpg?raw=true) 




# 🧪 Hands-On Validation: 
![WhatsApp Image](https://github.com/YoussefHatem2002/Q1-Custom-Command-mygrep.sh-/blob/main/WhatsApp%20Image%202025-04-27%20at%2022.28.24_e9133c93.jpg?raw=true) 

![WhatsApp Image](https://github.com/YoussefHatem2002/Q1-Custom-Command-mygrep.sh-/blob/main/WhatsApp%20Image%202025-04-27%20at%2022.28.40_6671b5c8.jpg?raw=true) 

![WhatsApp Image](https://github.com/YoussefHatem2002/Q1-Custom-Command-mygrep.sh-/blob/main/WhatsApp%20Image%202025-04-27%20at%2022.29.27_c223d50b.jpg?raw=true) 

![WhatsApp Image](https://github.com/YoussefHatem2002/Q1-Custom-Command-mygrep.sh-/blob/main/WhatsApp%20Image%202025-04-27%20at%2022.30.09_f02fd654.jpg?raw=true) 

# 🧠 Reflective Section:
# 1. How My Script Handles Arguments and Options


## Help Command (`--help`)
If the user asks for help, the script shows clear instructions and exits immediately without doing anything else.

## Making Sure We Have Enough Info
The script checks that the user provides at least two things:
- A search word
- A filename

If anything’s missing, it gives a help message.

## Handling Options (`-n`, `-v`)
It uses `getopts` to read the flags:
- `-n` tells the script to show line numbers.
- `-v` flips the match — shows lines that do not contain the search word.

If someone types a wrong option, it explains the mistake and shows the help message.

## Pulling Out the Real Inputs
After processing the options, the script shifts them aside and treats the next two things as:
- The search word
- The filename

## Double-Checking the File
It checks if the file actually exists before trying to read it.  
If the file does not exist, the script exits with an error message.

## Doing the Main Work
The script reads the file one line at a time.  
It checks if each line matches (or doesn’t match if `-v` is used) and prints the result — either with line numbers or without, based on the user's choice.

---

# 2. If I Wanted to Add More Cool Features

If I wanted to add things like:

- Support for regular expressions (fancier search patterns)
- `-i` for case-insensitive search
- `-c` to just count the matches
- `-l` to list only filenames that matched

I would:

## Upgrade the Option Handling
- Add those new flags inside `getopts`.
- Set new variables like `count_only=true` or `case_insensitive=true` depending on the user's input.

## Make Matching Smarter
- Use different flags with `grep` depending on options.
- Skip printing lines if the user only wants a count.

## Split the Work Into Smaller Pieces
- Break the main loop into small helper functions such as:
  - `match_line()`
  - `print_match()`

This would keep the script clean, organized, and easier to extend.

---

# 3. What Was the Hardest Part?

The trickiest part was juggling the options and the real inputs.

## Why?
- `getopts` can only grab options like `-n` and `-v`.
- After options, the script still needs to correctly grab the search string and filename.
- If you forget to shift the arguments properly, the script might mistakenly treat an option flag as a search word.

## What I Learned
- Always clearly separate option parsing from argument handling.
- Validate inputs early.
- Use `shift $((OPTIND-1))` after processing options to correctly align arguments.



# 🏆 Bonus:
#  Add support for --help flag to print usage info.
![WhatsApp Image](https://github.com/YoussefHatem2002/Q1-Custom-Command-mygrep.sh-/blob/main/WhatsApp%20Image%202025-04-27%20at%2022.32.04_e5734650.jpg?raw=true) 
# Improve option parsing using getopts(Small Sample).
![WhatsApp Image](https://github.com/YoussefHatem2002/Q1-Custom-Command-mygrep.sh-/blob/main/WhatsApp%20Image%202025-04-28%20at%2023.50.27_e24d4ea0.jpg?raw=true) 


