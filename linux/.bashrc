# Set base project directories
ARR_PROJECTS=($HOME/work/projects/ $HOME/work/repos/ $HOME/work/sandbox/)

# Enable nullglob to safely handle empty directories
shopt -s nullglob

# Use a single loop and array manipulation
ARR_PROJECTS_PATHS=()
for path in "${ARR_PROJECTS[@]}"; do
    # Glob for sub-directories only (dangling / helps, but test is safer)
    for folder in ${path}*; do
        if [[ -d "$folder" ]]; then
            ARR_PROJECTS_PATHS+=("$folder")
        fi
    done
done

# Disable nullglob
shopt -u nullglob

# Export PYTHONPATH using IFS to join array elements with ':'
(
    IFS=':'
    export PYTHONPATH="${ARR_PROJECTS_PATHS[*]}"
)
