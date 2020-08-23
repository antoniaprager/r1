#!/bin/bash

set -e

var1=$1
var2=${var1%.cbr}
var3=$(basename "$var2")

unrar x "$var1"
convert "$var3/*.jpg" "$var3.pdf"
 


