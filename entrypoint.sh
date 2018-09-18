#!/bin/bash

usage () {

    echo "Usage:


         docker run <container> [demo|start|help]
         docker run <container> demo
         docker run <container> help
         docker run -v $PWD/:/data <container> start

         Commands:

                help: show help and exit
                start: generate a specification, with your subdirectory with the
                       specifications top level folder bound to /data
                demo: show a demo generation using files in the container
         
         Options [start]:

            --config CONFIG     configuration.yml file, defaults to configuration.yml in
                                folder
            --folder SPECS      folder with input specification subfolders
            --output OUTFOLDER  folder to write output specification subfolders
         "
}

if [ $# -eq 0 ]; then
    usage
    exit
fi

OPENBASES_DEMO="no"
OPENBASES_RUN="no"
ARGS=""

while true; do
    case ${1:-} in
        -h|--help)
            usage
            exit
        ;;
        help)
            exec python /code/run.py --help;
            exit 0;            
        ;;
        demo)
            shift
            OPENBASES_DEMO="yes"
        ;;
        run|start)
            shift
            OPENBASES_RUN="yes"
        ;;
        --folder)
            shift
            echo "Input specifications folder set to ${1}"
            ARGS="${ARGS} --folder ${1}"
            shift
        ;;
        --config)
            shift
            echo "Configuration file set to ${1}"
            ARGS="${ARGS} --config ${1}"
            shift
        ;;
        --output)
            shift
            echo "Output markdown folder set to ${1}"
            ARGS="${ARGS} --output ${1}"
            shift
        ;;
        -*)
            echo "Unknown option: ${1:-}"
            exit 1
        ;;
        *)
            break
        ;;
    esac
done

# Are we starting the server?

if [ "${OPENBASES_DEMO}" == "yes" ]; then

    # Run demo, not using any different folders
    exec /opt/conda/bin/python /code/run.py
    exit 0;
fi

if [ "${OPENBASES_RUN}" == "yes" ]; then

    echo "/opt/conda/bin/python /code/run.py ${ARGS}"
    /opt/conda/bin/python /code/run.py ${ARGS}
    exit 0
else
    usage
fi
