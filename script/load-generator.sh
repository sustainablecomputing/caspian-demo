#!/bin/bash

############################################################
#
# Create AppWrappers in a timely manner (poisson) and submit them to the hub cluster
#
# Usage: <shellName> [<numSlots>] [<numJobs>] 
# Arguments
# $1  number of time slots to simulate workload arrivals
# $2  Number of jobs be submitted over numSlots slots
############################################################
if [ $# -lt 2 ]
then
	echo "usage: <cmd> <numslots> <numjobs>  "
	exit
fi


. demo-setenv.sh

numClusters=1
if [[ $1 && $1 -gt 0 ]]
then
	numslots=$1
fi

numjobs=1
if [[ $2 && $2 -gt 0 ]]
then
	numjobs=$2
fi

cd ~/caspian-demo

/usr/bin/python3 ~/caspian-demo/load-generator.py $numslots $numjobs 