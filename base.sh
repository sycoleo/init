#!/bin/bash

function setup()
{
 #colour level

 SETCOLOR_SUCCESS="echo -en \\033[1;32m"  

 SETCOLOR_FAILURE="echo -en \\033[1;31m"

 SETCOLOR_WARNING="echo -en \\033[1;33m"

 SETCOLOR_NORMAL="echo -en \\033[0;39m"
} 



setup 


function LogMsg()
{
   time=`date "+%D %T"`

    echo "[$time] : INFO    : $*"

   $SETCOLOR_NORMAL
}

function LogWarnMsg()
{
time=`date "+%D %T"`

$SETCOLOR_WARNING

echo "[$time] : WARN   : $*"

$SETCOLOR_NORMAL
}

function LogSucMsg()
{
time=`date "+%D %T"`
$SETCOLOR_SUCCESS

echo "[$time] : SUCCESS : $*"

$SETCOLOR_NORMAL
}

function LogErrorMsg()
{
time=`date "+%D %T"`

$SETCOLOR_FAILURE

echo "[$time] : ERROR   : $*"

$SETCOLOR_NORMAL
}

function Error() {
LogErrorMsg $*
exit 1
}
