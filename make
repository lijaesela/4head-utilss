#!/bin/sh -e

#
# usage: make <action> [more actions...]
# actions: compile, install, uninstall, clean
#

CC="tcc -Wall -v"
Prefix="/usr/local/4head"
ManPrefix="${Prefix}/share/man"

[ $# = 0 ] && echo "please give an argument. maybe you meant 'make compile'." && exit 1

for arg in "$@"; do
   case $arg in
   
      compile) echo "making..."
   
         # compile
         mkdir -p bin
         cd src
         for code in *.c; do
            $CC $code -o ../bin/${code%%.*}
         done
   
         cd ..;;
   
      install) echo "installing..."
   
         # install programs
         cd bin
         mkdir -p $Prefix
         for binary in *; do
            cp $binary $Prefix/$binary
         done
   
         # install manuals
         cd ../man
         mkdir -p $ManPrefix
         for manpage in *; do
            cp $manpage $ManPrefix/$manpage
         done
   
         cd ..;;
   
      uninstall) echo "uninstalling..."
         
         # remove programs
         cd bin
         for binary in *; do
            rm -f $Prefix/$binary
         done
   
         # remove manuals
         cd ../man
         for manpage in *; do
            rm -f $ManPrefix/$manpage
         done
   
         cd ..;;
   
      clean) echo "cleaning..."
         rm -rf bin;;
   
   esac
   echo "done."
done

echo "exited with success."
