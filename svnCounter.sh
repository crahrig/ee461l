#!/bin/bash

# checkout the repository and get into the svn top directory
svn checkout $1 ~/svn/svnCounter/ --username '$2' --password '$3'
cd ~/svn/svnCounter/

# capturing the version of the repository
version=$(svnversion)


# print the outputs
# print the repository url to the screen
echo Repository: $1
# print the repository version
echo Version: $version
# print the number of changes between revision
for i in $(seq 1 $version)
   do
      j=$(($i + 1))
      changes=svn diff -r $i:$j | diffstat | tail -1
      echo There are $changes 
   done
# print Done
echo Done
