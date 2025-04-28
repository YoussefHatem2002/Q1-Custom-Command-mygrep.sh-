#!/bin/bash

# === Function to show help message ===
show_help() {
    echo "How to use this script:"
    echo "  $0 [options] <search_string> <filename>"
    echo "Options you can use:"
    echo "  -n        Show line numbers next to matching lines"
    echo "  -v        Invert match (show lines that DON'T match)"
    echo "  --help    Show this help message and exit"
}

# === If user asks for help, just show it and leave ===
if [[ "$1" == "--help" ]]; then
    show_help
    exit 0
fi

# === We need at least two things: a search string and a file ===
if [[ $# -lt 2 ]]; then
    echo "Oops! You forgot something."
    show_help
    exit 1
fi

# === Let's set some flags, just in case user wants -n or -v ===
show_line_numbers=false
invert_match=false

# === Check if the user added any options like -n or -v ===
while getopts ":nv" option; do
    case $option in
        n)
            show_line_numbers=true  # User wants line numbers
            ;;
        v)
            invert_match=true       # User wants inverted matching
            ;;
        \?)
            echo "Hmm, I don't understand the option: -$OPTARG"
            show_help
            exit 1
            ;;
    esac
done

# === Now remove the options from the list of arguments ===
shift $((OPTIND - 1))

# === Get the search word and the file name ===
search_word="$1"
filename="$2"

# === Double-check that the user gave us both ===
if [[ -z "$search_word" || -z "$filename" ]]; then
    echo "Error: You need to give me both a search word and a file."
    show_help
    exit 1
fi

# === Make sure the file exists ===
if [[ ! -f "$filename" ]]; then
    echo "Error: The file '$filename' does not exist."
    exit 1
fi

# === Let's start reading the file line by line ===
line_number=0
while IFS= read -r line; do
    line_number=$((line_number + 1))  # Keep track of which line we're on

    # Check if the current line contains the search word (case-insensitive)
    if echo "$line" | grep -i -q "$search_word"; then
        is_match=true
    else
        is_match=false
    fi

    # If user asked for inverted matches, flip the result
    if [[ "$invert_match" == true ]]; then
        if [[ "$is_match" == true ]]; then
            is_match=false
        else
            is_match=true
        fi
    fi

    # Now, if the line should be shown
    if [[ "$is_match" == true ]]; then
        if [[ "$show_line_numbers" == true ]]; then
            echo "${line_number}:$line"  # Show line number + line
        else
            echo "$line"  # Just show the line
        fi
    fi

done < "$filename"
