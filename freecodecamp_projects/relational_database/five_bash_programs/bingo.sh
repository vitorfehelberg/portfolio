#!/bin/bash

# Bingo Number Generator

echo -e "\n~~ Bingo Number Generator ~~\n"

NUMBER=$(( RANDOM % 75 + 1  ))
TEXT="The next number is"

if (( NUMBER <= 15 ))
then
  echo -e "$TEXT B $NUMBER!\n"
elif [[ $NUMBER -le 30 ]]
then
  echo -e "$TEXT I $NUMBER!\n"
elif (( $NUMBER < 46 ))
then
  echo -e "$TEXT N $NUMBER!\n"
elif [[ $NUMBER -lt 61 ]]
then
  echo -e "$TEXT G $NUMBER!\n"
else
  echo -e "$TEXT O $NUMBER!\n"
fi