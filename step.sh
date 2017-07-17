#!/bin/bash

# fail if any commands fails
set -e

# debug log
#set -x

THIS_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

CMD="python junit2html"

if [ -f "${junit_file_path}" ] ; then
    CMD+=" ${junit_file_path}"
else
    echo "Error: File ${junit_file_path} does not exist"
    exit 1
fi
if [ -n "${html_file_path}" ] ; then
    CMD+=" ${html_file_path}"
else
    exit 1
fi

cd ${THIS_SCRIPT_DIR}/junit2html-master

`${CMD}`

# export for next steps
envman add --key JUNIT2HTML_FILE_PATH --value "${html_file_path}"
