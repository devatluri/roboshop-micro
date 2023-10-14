#!/bin/bash

#This is called array, instead of single value it can hold multiple values. 
PERSONS=("Ramesh" "Suresh" "Sachin")


echo "First person: ${PERSONS[0]}"
echo "All persons: ${PERSONS[@]}"