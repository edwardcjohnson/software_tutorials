#!/bin/bash

# --- Setup and Safety ---
set -euo pipefail # Exit on any error, treat unset variables as an error, and catch errors in pipelines.

# Define ANSI color codes for better output
GREEN='\033[32m'
YELLOW='\033[33m'
RED='\033[31m'
NC='\033[0m' # No Color

# Initial Message
echo -e "\n${YELLOW}Pulling in latest changes for all Git repositories...${NC}\n"

# --- Main Logic ---

# Use find to locate all .git directories and print their parent directory path,
# using -print0 for safety with filenames that contain spaces.
find . -type d -name ".git" -print0 | while IFS= read -r -d $'\000' gitdir; do
    
    # Get the parent directory path and remove the leading './' for clean display
    REPO_DIR=$(dirname "$gitdir")
    DISPLAY_DIR=${REPO_DIR#./} # Removes the leading "./" if it exists

    echo -e "${YELLOW}--- Updating ${DISPLAY_DIR} ---${NC}"
    
    # Change into the repository directory using pushd (stores current location)
    pushd "$REPO_DIR" > /dev/null

    # Perform the pull
    # Use 'git pull' which respects the current branch's tracking configuration
    git pull
    PULL_STATUS=$? # Store the exit status of the previous command (git pull)

    if [ $PULL_STATUS -eq 0 ]; then
        echo -e "${GREEN}SUCCESS:${NC} Repository up-to-date."
    else
        echo -e "${RED}ERROR:${NC} Failed to pull changes. Please check the repository manually."
    fi

    # Return to the starting directory using popd
    popd > /dev/null
    
    echo "" # Add a newline separator
done

# --- Completion Message ---
echo -e "\n${GREEN}Complete! Check the output for any errors.${NC}\n"
