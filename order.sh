#!/usr/bin/bash
# authors order

# Specify the path to the index
index="./docs/index.html"

# Check if the config file exists
if [ -f "$index" ]; then

# author line (easy match)
authors_line=$(grep -n "<dt>Authors:</dt>" $index)

# replacement line (next one)
rl=$((${authors_line:0:2} + 1))

# authors in order
aio=$(cat ./src/authors.html)

# Perform find and replace using sed
sed -i "${rl}s|^.*$|${aio}|g" "$index"
echo "Replacement done in $index"

else
echo "$index does not exist."

fi