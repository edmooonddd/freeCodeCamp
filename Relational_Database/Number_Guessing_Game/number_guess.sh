#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

MAIN() {
  #get username
  echo -e "Enter your username:"
  read USERNAME

  #query username from db
  RETURNING_USER=$($PSQL "SELECT name FROM users WHERE name = '$USERNAME'")

  #if user already played before
  if [[ $RETURNING_USER ]]
  then
    #get user_id
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME'")

    #get number of games played
    GAMES_PLAYED=$($PSQL "SELECT COUNT(user_id) FROM games WHERE user_id = $USER_ID")

    #get best game
    BEST_GAME=$($PSQL "SELECT MIN(GUESSES) FROM games WHERE user_id = $USER_ID")

    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  else
    #if user is new player
    echo "Welcome, $USERNAME! It looks like this is your first time here."

    #insert new user into users table
    INSERT_NEW_USER=$($PSQL "INSERT INTO users (name) VALUES ('$USERNAME')")
  fi

  GAME
}

GAME() {
  #generate random number
  RANDOM_NUMBER=$(( $RANDOM % 1000 + 1 ))
  # echo $RANDOM_NUMBER

  #count number of guesses
  TRIES=0

  #condition for while loop
  GUESSED=0

  echo -e "Guess the secret number between 1 and 1000:"

  while [[ $GUESSED = 0 ]]
  do
    read GUESS

    #if guess is not a number
    if [[ ! $GUESS =~ ^[0-9]+$ ]]
    then
      echo "That is not an integer, guess again:"
    #if guess is correct
    elif [[ $GUESS = $RANDOM_NUMBER ]]
    then
      TRIES=$(($TRIES + 1))
      echo "You guessed it in $TRIES tries. The secret number was $RANDOM_NUMBER. Nice job!"
      #insert into db
      INSERT_TO_GAMES=$($PSQL "INSERT INTO games (user_id, guesses) VALUES ($USER_ID, $TRIES)")
      #break the while loop
      GUESSED=1
    #if guess is greater than random number
    elif [[ $GUESS -gt $RANDOM_NUMBER ]]
    then
      TRIES=$(($TRIES + 1))
      echo "It's lower than that, guess again:"
    #if guess is lower than random number
    else
      TRIES=$(($TRIES + 1))
      echo "It's higher than that, guess again:"
    fi
  done
}

MAIN