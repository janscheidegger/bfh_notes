#!/bin/bash
if [ $# -eq 0 ]
then
    echo "Error: Add folder Path as Argument!"
    echo "Usage: createPdf.sh <Path>"
    exit
fi
cd "$1"
# Create one PDF for every Topic
for f in *.txt
do
    echo $f
    filename="${f%.*}"
    echo "$filename.pdf"
    pandoc "$f" -o "$filename.pdf"
done

# Create one big PDF with all the content
currentFolder=${PWD##*/}
cat *.txt > "$currentFolder"
pandoc --toc "$currentFolder" -o "$currentFolder.pdf"
echo "Done..."
