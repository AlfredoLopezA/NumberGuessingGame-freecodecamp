#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only -c"
let NUMBER_OF_GUESSES=1
let OPEN_GAME=1
echo "Enter your username:"
MAIN_MENU() {
  read USERNAME
  LARGE=${#USERNAME} #Max large 22
  if [[ "$LARGE" -gt 22 ]]
  then
    echo "Enter your username:"
    MAIN_MENU
  fi
  USER_DATA=$($PSQL "SELECT DISTINCT user_id, username, games_played, fewest_number FROM users INNER JOIN games USING(user_id) WHERE username = '$USERNAME'")
  if [[ ! -z $USER_DATA ]]
  then
    echo "$USER_DATA" | while read USER_ID BAR USERNAME BAR GAME_PLAYED BAR FEWEST_NUMBER
    do
      echo "Welcome back, $USERNAME! You have played $GAME_PLAYED games, and your best game took $FEWEST_NUMBER guesses."
    done
  else
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    INSERT_USER=$($PSQL "INSERT INTO users(username, games_played) VALUES('$USERNAME', 1)")
    if [[ $INSERT_USER != "INSERT 0 1" ]]
    then
      echo -e "\nSorry, We have an error with insert data on database, please try later."
      $OPEN_GAME=0
    else
      USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
    fi
  fi
  if [[ $OPEN_GAME = 1 ]]
  then
    echo "Guess the secret number between 1 and 1000:"
    SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))
    read USER_NUMBER
    echo $SECRET_NUMBER
    while true
    do
      if [[ $USER_NUMBER = $SECRET_NUMBER ]]
      then
        USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
        echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
        INSERT_GAME=$($PSQL "INSERT INTO games(user_id) VALUES($USER_ID)")
        if [[ $INSERT_GAME = "INSERT 0 1" ]]
        then
          FEWEST_NUMBER=$($PSQL "SELECT fewest_number FROM users WHERE user_id = ${USER_ID#"${USER_ID%%[![:space:]]*}"}")
          FEWEST_NUMBER="${FEWEST_NUMBER#"${FEWEST_NUMBER%%[![:space:]]*}"}"
          if [[ -z $FEWEST_NUMBER ]]
          then
            UPDATE_USER=$($PSQL "UPDATE users SET fewest_number=$NUMBER_OF_GUESSES WHERE user_id=$USER_ID")
          else
            if [[ $NUMBER_OF_GUESSES -lt $FEWEST_NUMBER ]]
            then
              UPDATE_USER=$($PSQL "UPDATE users SET fewest_number=$NUMBER_OF_GUESSES WHERE user_id=$USER_ID")
            fi
            GAME_PLAYED=$($PSQL "SELECT games_played FROM users WHERE user_id = '$USER_ID'")
            let "GAME_PLAYED++"
            GAME_NUMBER=$($PSQL "UPDATE users SET games_played = $GAME_PLAYED WHERE username = '$USERNAME'")
          fi
        else
          echo -e "\nSorry, We have an error with insert data on database, please try later."
        fi
        break
      else
        if [[ ! $USER_NUMBER =~ ^\-?[0-9]+$ ]]
        then
          echo "That is not an integer, guess again:"
        else
          if [[ $USER_NUMBER -gt $SECRET_NUMBER ]]
          then
            echo "It's lower than that, guess again:"
          else
            echo "It's higher than that, guess again:"
          fi
        fi
        read USER_NUMBER
        NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))
      fi
    done
  fi
}
MAIN_MENU