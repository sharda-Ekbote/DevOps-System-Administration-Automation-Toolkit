#!/bin/bash
# Description: Safely delete a list of files provided in a text file
# Usage: ./bulk_cleanup.sh file_list.txt

FILE_LIST=$1

# 1. Check if the input file exists
if [[ ! -f "$FILE_LIST" ]]; then
    echo "Error: List file '$FILE_LIST' not found."
    exit 1
fi

# 2. Safety Check: Count how many files will be deleted
count=$(wc -l < "$FILE_LIST")
echo "WARNING: You are about to delete $count files listed in $FILE_LIST."
read -p "Are you sure you want to proceed? (y/n): " confirm

# 3. Execution using xargs
if [[ $confirm == "y" ]]; then
    cat "$FILE_LIST" | xargs -n1 rm -f
    echo "Successfully deleted $count files."
else
    echo "Operation cancelled."
fi
