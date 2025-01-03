#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~"

echo -e "\nWelcome to my Salon, how can I help you?\n"

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

    #select a service
    read SERVICE_ID_SELECTED
    #if input is not a number
    if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then
        MAIN_MENU "That is not a valid choice of services.\n"
    else
      SERVICE_AVAILABILITY=$($PSQL "SELECT service_id, name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
      #show services again if chosen service is not available
      if [[ -z $SERVICE_AVAILABILITY ]]
      then
        MAIN_MENU "I could not find that service. What would you like today?\n"
      else
        #get customer info
        echo -e "\nWhat's your phone number?"
        read CUSTOMER_PHONE

        CUSTOMER_EXIST=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

        #if customer does not exist
        if [[ -z $CUSTOMER_EXIST ]]
        then
            echo -e "\nI dont have a record for that phone number, what's your name?"
            #get new customer name
            read CUSTOMER_NAME
            #insert new customer name
            INSERT_NEW_CUSTOMER=$($PSQL "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
        fi

        #appointment
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
        CUSTOMER_NAME_TABLE=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
        SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED'")
        CUSTOMER_NAME_FORMATTED=$(echo $CUSTOMER_NAME_TABLE | sed -r 's/^ *| *$//g')
        SERVICE_NAME_FORMATTED=$(echo $SERVICE_NAME | sed -r 's/^ *| *$//g')

        #get customer desired time
        echo -e "\nWhat time would you like your $SERVICE_NAME_FORMATTED, $CUSTOMER_NAME_FORMATTED?"
        read SERVICE_TIME
        #insert time to appointment table
        INSERT_TIME_RESULT=$($PSQL "INSERT INTO appointments (service_id, customer_id, time) VALUES ($SERVICE_ID_SELECTED, $CUSTOMER_ID, '$SERVICE_TIME')")
        echo -e "\nI have put you down for a $SERVICE_NAME_FORMATTED at $SERVICE_TIME, $CUSTOMER_NAME_FORMATTED."
      fi
    fi
}

MAIN_MENU