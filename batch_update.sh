#!/bin/bash 


list=$(find $1 -name hvigor-config.json5)
for prj in ${list}
do
    project_home=$(dirname $(dirname ${prj}))
    ./hvigor_update.sh ${project_home}
done