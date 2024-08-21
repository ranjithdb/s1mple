#!/bin/bash

awk '/welcome/ && NR >= 5 {gsub(/\<give\>/,"learning")} 1' bee_movie_script.txt > output.txt

