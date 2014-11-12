#!/bin/sh

for MANIFEST in Manifest.*; do
  FILENAME=$(printf "$MANIFEST" | sed s/Manifest\.//)
  rm -f "$FILENAME"

  printf "\nBuilding $MANIFEST into $FILENAME\n"

  while read file; do
    printf "Including: $file\n"
    component=$(echo $file | awk -F'/' '{printf $2}')
    if [[ "bash-shebang exit-trap check-home-bin header argument compiler-and-libraries mac-functions shared-functions start-services" =~ $component ]]; then
      cat "$file" >> "$FILENAME"
    else
      echo "if ( echo \"$file\" | grep -q \"\$PACKAGE\" ); then" >> "$FILENAME"
      cat "$file" >> "$FILENAME"
      echo "fi" >> "$FILENAME"
    fi

    printf "### end $file\n\n" >> "$FILENAME"
  done < "$MANIFEST"
done
