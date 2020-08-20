#!/bin/bash
comic=$1
unrar x "$comic".cbr
convert "$comic/*.jpg" "$comic.pdf"
