#!/bin/bash
##
## Script that makes this, basically:
##          ___________
##         |           |
##         |  Welcome  |
##         |  Back     |
##         |  kwj      |
##         |___________|
##               ||
##       (\__/)  ||
##       (•ㅅ•)  ||
##       / 　 づ
##
## Can add a line to run it in /etc/update-motd/00-header so
## that you see this when you login. Username is automatically 
## detected.
##
## Kipp Johnson
## July 9th, 2018
##

## Get login name of user
myname=$(logname)

## Get length of username, and set width of sign to that length+3
nchar=$(echo $myname |wc -c)
width=$((nchar+3))

## For proper formatting, we want the sign to be at least 11 characters wide
## Since width is dependent upon the name of the login, we will check that here
if (( $width < 11)); then
	width=11
fi

## Some parameter definitions
leftmargin="10" ## How many chars from the left should everything start?

## Create sign's top and bottom
emptystring=$(printf "%${width}s")
topchar=${emptystring// /_}
toplength=$(($leftmargin+$width))

## Right-hand sign margins computed here
r1margin=$(($width-9))
r2margin=$(($width-6))
r3margin=$(($width-$nchar-1))

## Print the sign itself
printf "%${toplength}s\n" "$topchar"
printf "%${leftmargin}s %${width}s\n" "|" "|"
printf "%${leftmargin}s %s %${r1margin}s\n" "|" " Welcome" "|"
printf "%${leftmargin}s %s %${r2margin}s\n" "|" " Back" "|"
printf "%${leftmargin}s %s %${r3margin}s\n" "|" " $myname" "|"
printf "%${leftmargin}s%s%s\n" "|" "$topchar" "|"

## Margins for the bunny holding the sign
b0=$(($leftmargin+7))
b1=$(($leftmargin+7))
b2=$(($leftmargin+12))
b3=$(($leftmargin+6))

## It's bunny time
printf "%${b0}s\n" "        ||"
printf "%${b1}s\n" "(\__/)  ||"
printf "%${b2}s\n" "(•ㅅ•)  ||"
printf "%${b3}s\n" "/ 　 づ"
