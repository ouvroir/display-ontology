#!/usr/bin/bash
# ce script effectue quelques chercher-remplacer
# afin d'ajuster à nos besoins le ficher d'index généré par Widoco

# Specify the path to the index
index="./docs/index.html"

# Check if the index file exists
if [ -f "$index" ]; then

# find the label “authors” (easy match)
# and return it with the line number
authors_line=$(grep -n "<dt>Authors:</dt>" $index)

# return the line number + 1
# as we want to swap the next one
rl=$((${authors_line:0:2} + 1))

# authors in order
aio=$(cat ./src/authors.html)
# acknowlegments with CRSH et du FCI
acknow=$(cat ./src/acknow.html)

# Perform find and replace using sed

# for authors order
sed -i "${rl}s|^.*$|${aio}|g" "$index"
# for index.html
sed -i "s|index-en|index|g" "$index"
# for acknolegments
sed -i "s|^The authors would like to thank.*$|${acknow}|g" "$index"

echo "Replacements done in $index"

else
echo "$index does not exist."

fi