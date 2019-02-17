#!/bin/sh

# Directory that enviroment configuration will be stored in
ENV_DIR=./env

while getopts ":f" opt; do
    case $opt in
        f) FORCE_COPY=true ;;
        \?) echo "Invalid Option: -${OPTARG}" && exit 1 ;;
    esac
done

if [ ! -d ${ENV_DIR} ]; then 
    echo "Failed to find env directory '${ENV_DIR}'."
    exit 1;
fi

# Exit function
function die() {
    echo $*
    exit 1;
}

# Copies an example file
function copy_example_env() {
    local exampleFile=$1.env.example;
    
    if [ -z ${exampleFile} ]; then 
        die "No file argument provided to function."
    fi

    local exampleFilePath=${ENV_DIR}/${exampleFile}

    if [ ! -f ${exampleFilePath} ]; then
        die "Example file '${exampleFile}' not found. Please check '${ENV_DIR}' and verify this file exists.";
    fi

    local envFile=${exampleFile%.*}

    if [ -z ${envFile} ]; then
        die "Generated env file for '${exampleFile}' would have a blank name. Ensure that the example env file has a named prefix. e.g config.env.example."
    fi

    local envFilePath=${ENV_DIR}/${envFile}

    if [ "${FORCE_COPY}" == "false" ] && [ -f ${envFilePath} ]; then
        echo "Env file '${envFile}' already exists." 
        return 1;
    fi

    cp ${exampleFilePath} ${envFilePath}
    echo "${exampleFile} copied and saved to ${envFile}."
}

copy_example_env postgres