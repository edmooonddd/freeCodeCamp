#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"


if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  # if input is not a number
  if [[ ! $1 =~ ^[0-9]+$ ]]
  then
    #if input are words or letter
    LENGTH=$(echo -n "$1" | wc -m)
    if [[ $LENGTH -gt 2 ]]
    then
      #get data by full name
      DATA=$($PSQL "SELECT atomic_number, symbol, name, metal_type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) WHERE name ='$1'")
      if [[ -z $DATA ]]
      then
        echo "I could not find that element in the database."
      else
        echo "$DATA" | while IFS="|" read -r ATOMIC_NUMBER SYMBOL NAME METAL_TYPE ATOMIC_MASS MELTING BOILING
        do
          echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $METAL_TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
        done
      fi
    else
      #get data by symbol
      DATA=$($PSQL "SELECT atomic_number, symbol, name, metal_type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) WHERE symbol='$1'")
      if [[ -z $DATA ]]
      then
        echo "I could not find that element in the database."
      else
        echo "$DATA" | while IFS="|" read -r ATOMIC_NUMBER SYMBOL NAME METAL_TYPE ATOMIC_MASS MELTING BOILING
        do
          echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $METAL_TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
        done
      fi
    fi
  else
    #get data by the atomic number
    DATA=$($PSQL "SELECT atomic_number, symbol, name, metal_type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) WHERE atomic_number=$1")
    if [[ -z $DATA ]]
    then
      echo "I could not find that element in the database."
    else
      echo "$DATA" | while IFS="|" read -r ATOMIC_NUMBER SYMBOL NAME METAL_TYPE ATOMIC_MASS MELTING BOILING
      do
        echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $METAL_TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
      done
    fi
  fi
fi

