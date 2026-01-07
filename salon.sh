#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon -t -A -c"

echo -e "\n~~~~~ PRETTY SALON ~~~~~\n"

# Display menu and get valid service
MAIN_MENU () {
  if [[ $1 ]]
  then 
    echo -e "$1\n"
  else
    echo -e "Welcome to Pretty Salon, how may I help you?\n"
  fi

  # get services
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  echo "$SERVICES" | while IFS="|" read SERVICE_ID SERVICE_NAME
  do 
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  # read input
  read SERVICE_ID_SELECTED
}

# Display main menu
MAIN_MENU

# Loop until user enters a valid numeric service ID that exists
GET_SELECTED_SERVICE=""
while [[ -z $GET_SELECTED_SERVICE ]]
do
  # check if input is a number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    MAIN_MENU "Please enter a valid number for the service ID."
    continue
  fi
  # check if service exists
  GET_SELECTED_SERVICE=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'")
  if [[ -z $GET_SELECTED_SERVICE ]]
  then
    MAIN_MENU "Service ID not found. Please select a valid service."
  fi
done

# ask for customer phone
echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE

# check if customer exists
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

if [[ -z $CUSTOMER_NAME ]]
then
  # ask for name and insert customer
  echo -e "\nWhat's your name?"
  read CUSTOMER_NAME
  INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
fi

# get customer_id
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

# ask for service time
echo -e "\nWhat time would you like your $GET_SELECTED_SERVICE, $CUSTOMER_NAME?"
read SERVICE_TIME

# insert appointment (use correct service ID!)
INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

# confirmation message
echo -e "\nI have put you down for a $GET_SELECTED_SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
