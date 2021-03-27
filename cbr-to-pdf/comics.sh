#!/bin/bash

set -e

var1=$1
var2=${var1%.cbr}
var3=$(basename "$var2")

mytemp=$(mktemp -d)

cp "$var1" $mytemp
pushd $mytemp


unrar e "$var3.cbr"
convert *.jpg "$var3.pdf"
 
popd

mv $mytemp/*pdf .

