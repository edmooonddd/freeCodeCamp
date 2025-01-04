#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~"

echo -e "\nWelcome to My Salon, how can I help you?\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  #show services
  SERVICES=$($PSQL "SELECT service_id, name FROM services")
  echo "$SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done

  #select service
  read SERVICE_ID_SELECTED
  #if input is not a number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    #show services again
    MAIN_MENU "That is not a valid choice of services.\n"
  else
    #check if service is available
    SERVICE_AVAILABILITY=$($PSQL "SELECT service_id, name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    if [[ -z $SERVICE_AVAILABILITY ]]
    then
      #show services again
      MAIN_MENU "I could not find that service. What would you like today?\n"
    else
      #get customer info
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE

      #check if customer is on the database
      CUSTOMER_EXIST=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      if [[ -z $CUSTOMER_EXIST ]]
      then
        #get new customer name
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        #insert new customer info on the database
        INSERT_NEW_CUSTOMER=$($PSQL "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
      fi

      #get appointment, query neccessary info on the database
      SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
      EXISTING_CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      #format the names
      SERVICE_NAME_FORMATTED=$(echo $SERVICE_NAME | sed -r 's/^ *| *$//g')
      EXISTING_CUSTOMER_NAME_FORMATTED=$(echo $EXISTING_CUSTOMER_NAME | sed -r 's/^ *| *$//g')

      #get the customer desired time
      echo -e "\nWhat time would you like your $SERVICE_NAME_FORMATTED, $EXISTING_CUSTOMER_NAME_FORMATTED?"
      read SERVICE_TIME

      #insert the desired time and other info to database
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      INSERT_TIME=$($PSQL "INSERT INTO appointments (time, customer_id, service_id) VALUES ('$SERVICE_TIME', $CUSTOMER_ID, $SERVICE_ID_SELECTED)")
      echo -e "\nI have put you down for a $SERVICE_NAME_FORMATTED at $SERVICE_TIME, $EXISTING_CUSTOMER_NAME_FORMATTED."
    fi
  fi
}

MAIN_MENU
