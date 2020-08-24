# generalizations; fill PYTHONPATH from the directory contents of these paths
ARR_PROJECTS=($HOME/work/projects $HOME/work/repos $HOME/work/sandbox)
ARR_PROJECTS_PATHS=()

function join { local IFS="$1"; shift; echo "$*"; }

# Enable special handling to prevent expansion to a
# literal '/tmp/backup/*' when no matches are found.
shopt -s nullglob

for path in "${ARR_PROJECTS[@]}"; do
    FOLDERS=(${path}/*)
    for folder in "${FOLDERS[@]}"; do
        if [[ -d "$folder" ]]
        then
            ARR_PROJECTS_PATHS+=($folder)
        fi
    done
done

# Unset shell option after use, if desired. Nullglob
# is unset by default.
shopt -u nullglob

export PYTHONPATH=$(join ':' ${ARR_PROJECTS_PATHS[@]})
