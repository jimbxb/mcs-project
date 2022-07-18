#!/bin/bash

SUFFIX=${1:-}
FLAGS=${2:-}

N_TESTS=30
DATA=./data$SUFFIX

OLD_WYBE=~/docs/wybe-old/wybemk
OLD_LIBS=--libdir=/home/james/docs/wybe-old/wybelibs
NEW_WYBE=~/docs/wybe-new/wybemk
NEW_LIBS=--libdir=/home/james/docs/wybe-new/wybelibs
FIRST_PROGS=./programs/first/
HIGHER_PROGS=./programs/higher/
SIZE_RESOURCES_CSV=$DATA/size-resources.csv
SIZE_ORDER_CSV=$DATA/size-order.csv
TIME_RESOURCES_CSV=$DATA/time-resources.csv
TIME_ORDER_CSV=$DATA/time-order.csv

clean() {
    find ./programs -type f \( -name "*.o" -o ! -name "*.*" \) -exec rm {} +
}

clean
mkdir --parents $DATA
rm --force $SIZE_RESOURCES_CSV $SIZE_ORDER_CSV $TIME_RESOURCES_CSV $TIME_ORDER_CSV
touch $SIZE_RESOURCES_CSV $SIZE_ORDER_CSV $TIME_RESOURCES_CSV $TIME_ORDER_CSV

echo "TESTING SIZE"
echo "parameters"
time ./scripts/size.sh Parameters $OLD_WYBE $FIRST_PROGS $OLD_LIBS $FLAGS \
    >> $SIZE_RESOURCES_CSV
echo "globals"
time ./scripts/size.sh Globals $NEW_WYBE $FIRST_PROGS $NEW_LIBS $FLAGS \
    >> $SIZE_RESOURCES_CSV

echo "TESTING SIZE"
echo "first order"
time ./scripts/size.sh First $NEW_WYBE $FIRST_PROGS $NEW_LIBS $FLAGS \
    >> $SIZE_ORDER_CSV
echo "higher order"
time ./scripts/size.sh Higher $NEW_WYBE $HIGHER_PROGS $NEW_LIBS $FLAGS \
    >> $SIZE_ORDER_CSV

echo "TESTING RESOURCES"
echo "parameters"
time ./scripts/time.sh Parameters $OLD_WYBE $N_TESTS $FIRST_PROGS $OLD_LIBS $FLAGS \
    >> $TIME_RESOURCES_CSV
echo "globals"
time ./scripts/time.sh Globals $NEW_WYBE $N_TESTS $FIRST_PROGS $NEW_LIBS $FLAGS \
    >> $TIME_RESOURCES_CSV

echo "TESTING ORDER"
echo "first"
time ./scripts/time.sh First $NEW_WYBE $N_TESTS $FIRST_PROGS $NEW_LIBS $FLAGS \
    >> $TIME_ORDER_CSV
echo "higher"
time ./scripts/time.sh Higher $NEW_WYBE $N_TESTS $HIGHER_PROGS $NEW_LIBS $FLAGS \
    >> $TIME_ORDER_CSV

echo "CLEANING UP"
python3 ./scripts/cleanup.py $DATA_DIR

clean
