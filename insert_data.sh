#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
if [[ $YEAR != "year" ]]
then 
# check for winner in teams
CHECK_WINNER=$($PSQL "select name from teams where name='$WINNER'")
if [[ -z $CHECK_WINNER ]]
then
# insert winner in teams 
INSERT_WINNER=$($PSQL "insert into teams(name) values ('$WINNER')")
fi

# check for opponent in teams
CHECK_OPPONENT=$($PSQL "select name from teams where name='$OPPONENT'")
if [[ -z $CHECK_OPPONENT ]]
then
# insert winner in teams 
INSERT_WINNER=$($PSQL "insert into teams(name) values ('$OPPONENT')")
fi

# get winner id and opponent id
WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER'")
OPPONENT_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")

# insert game details in games
INSERT_GAME=$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")

fi
done