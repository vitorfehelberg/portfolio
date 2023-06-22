#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Number Guessing Game

echo -e "\n~~ Number Guessing Game ~~\n"

# Get user info
echo "Enter your username:"
read USERNAME

EXISTING_USERNAME="$($PSQL "SELECT username FROM number_guess WHERE username = '$USERNAME'")"

# If user doesn't exist
if [ -z "$EXISTING_USERNAME" ]
then 
  # Insert new user
  INSERT_USERNAME=$($PSQL "INSERT INTO number_guess(username) VALUES('$USERNAME')")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
# User exists, retrieve games_played and best_game
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM number_guess WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM number_guess WHERE username='$USERNAME'")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Guess the number

SECRET_NUMBER=$(( RANDOM % 1000 + 1  ))
GUESSES=0

echo "Guess the secret number between 1 and 1000:"

while true
do
  read GUESS
  # Add +1 to the guess count
  ((GUESSES++))
  # If input is not a number
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  else
    if [[ $GUESS -lt $SECRET_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
    elif [[ $GUESS -gt $SECRET_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
    else
      if [[ $GUESSES -lt $BEST_GAME || $BEST_GAME -eq 0 ]]
      then
        # Update the user's best game and games played
        UPDATE_STATS=$($PSQL "UPDATE number_guess SET best_game=$GUESSES WHERE username='$USERNAME'")
      fi
      # Increment the games played count
      UPDATE_GAMES_PLAYED=$($PSQL "UPDATE number_guess SET games_played=games_played+1 WHERE username='$USERNAME'")
      echo "You guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
      exit
    fi
  fi
done
