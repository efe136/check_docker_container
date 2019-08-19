#!/bin/bash
# Created by Efkan Isazade

# Mutable Nagios Exit Codes
OK=0
WARNING=1
var1="true,"
var2="false,"

while getopts "w:c:" opt; do
        case $opt in
                w) warn_var="$OPTARG"  ;;
                c) container_var="$OPTARG"  ;;
        esac
done

command=$(docker inspect $container_var | grep "Running" | awk {'print $2'})
if [ "$command" = "$var1" ]; then
    echo "$command" "Status is OK" && exit "$OK"

elif [ "$command" = "$var2" ]; then
    echo "$command" "Status is WARNING" && exit "$WARNING"
fi
