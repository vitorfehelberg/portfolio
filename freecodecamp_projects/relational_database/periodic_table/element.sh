#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [ -z "$1" ]
then
  echo "Please provide an element as an argument."
else
  element="$($PSQL "   SELECT t1.atomic_number,
                              t1.symbol,
                              t1.name,
                              t3.type,
                              t2.atomic_mass,
                              t2.melting_point_celsius,
                              t2.boiling_point_celsius 
                         FROM elements t1 
                    LEFT JOIN properties t2
                           ON t1.atomic_number = t2.atomic_number
                    LEFT JOIN types t3
                           ON t2.type_id = t3.type_id
                        WHERE t1.atomic_number::text = '$1'
                           OR t1.symbol = '$1'
                           OR t1.name = '$1'")"
  if [ -z "$element" ]
  then
    echo "I could not find that element in the database."
  else
    atomic_number=$(echo "$element" | awk -F '|' '{print $1}')
    symbol=$(echo "$element" | awk -F '|' '{print $2}')
    name=$(echo "$element" | awk -F '|' '{print $3}')
    type=$(echo "$element" | awk -F '|' '{print $4}')
    mass=$(echo "$element" | awk -F '|' '{print $5}')
    melting_point=$(echo "$element" | awk -F '|' '{print $6}')
    boiling_point=$(echo "$element" | awk -F '|' '{print $7}')
  
    echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $mass amu. $name has a melting point of $melting_point celsius and a boiling point of $boiling_point celsius."
  fi
fi
