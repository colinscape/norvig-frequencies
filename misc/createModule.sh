#! /bin/bash

date=`date +"%c %Z"`

MISC_DIR=$(dirname $0)
SRC_DIR=$MISC_DIR/../src/
DATA_DIR=$MISC_DIR/../data
MODULE_FILE=$SRC_DIR/data.coffee

echo "# Auto-generated by ../misc/createModule.sh on $date" > $MODULE_FILE
echo "module.exports = \"\"\"" >> $MODULE_FILE
cut -f1 $DATA_DIR/words-with-counts.txt >> $MODULE_FILE
echo "\"\"\".split '\n'" >> $MODULE_FILE
