#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {

  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo "Welcome to My Salon, how can I help you?"

  # get available services
  LIST_SERVICES=$($PSQL "SELECT * FROM services")
  # display available services
  echo "$LIST_SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done
  # get customer choice
  read SERVICE_ID_SELECTED
 
  # retrieve the maximum service_id from the services table
  MAX_SERVICE_ID=$($PSQL "SELECT MAX(service_id) FROM services")
  # check if the selected service_id is within the valid range
  if [[ $SERVICE_ID_SELECTED -ge 1 && $SERVICE_ID_SELECTED -le $MAX_SERVICE_ID ]]
  then
    # if number is within the valid range
    # get service name selected
    SERVICE_NAME_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    SERVICE_MENU
    # send to main menu
  else
    MAIN_MENU "I could not find that service. What would you like today?"
  fi

}

SERVICE_MENU() {
  # get customer info
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  # if customer doesn't exist
  if [[ -z $CUSTOMER_NAME ]]
  then
    # get new customer name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    # insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers (phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi

  # get the customer_id
  CUSTOMER_ID_SELECTED=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'") 

  # get service name formatted
  SERVICE_NAME_FORMATTED=$(echo $SERVICE_NAME_SELECTED | sed -E 's/^ *| *$//g')
  # get customer name formatted
  CUSTOMER_NAME_FORMATTED=$(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//g')

  # get the desired time of the service from the customer
  echo -e "\nWhat time would you like your $SERVICE_NAME_FORMATTED, $CUSTOMER_NAME_FORMATTED?"
  read SERVICE_TIME
  # schedule consumer service
  INSERT_SCHEDULE_SERVICE=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID_SELECTED, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  # send to main menu
  echo -e "\nI have put you down for a $SERVICE_NAME_FORMATTED at $SERVICE_TIME, $CUSTOMER_NAME_FORMATTED."
  exit

}

MAIN_MENU
