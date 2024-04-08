#!/bin/bash
set -e
localPath=$(pwd)

execute_before_start() {
    echo "Execute befor start" > running.txt
    cd $localPath/notebooks/mines

    for i in * ;do
        cd $i
        if [ -f .git ]; then
            echo "Pulling " $i
            git pull >> /dev/null 
            echo
        fi
        cd ..
    done
    cd $localPath
}

execute_anaconda() {
    docker run \
        -v $localPath/notebooks:/opt/notebooks \
        -p 8888:8888 \
        aat-anaconda
}

execute_after_start() {
    sleep 1
    echo "Execute after start" >> running.txt
    cd $localPath/notebooks/mines
    for i in * ;do
        cd $i
        if [ -f .git ]; then
            echo "Pushing " $i
            git add . -A >> /dev/null 
            git commit -a -m "EOD automatic commit" >> /dev/null 
            git push origin >> /dev/null 
            echo
        fi
        cd ..
    done
    cd $localPath
}

execute_before_start

execute_anaconda

execute_after_start
