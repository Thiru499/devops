#!/bin/bash

# Part 1: Check HTTP response from guvi.in
echo "Checking HTTP status code for guvi.in..."
status_code=$(curl -s -o /dev/null -w "%{http_code}" https://www.guvi.in)

echo "HTTP Status Code: $status_code"

if [[ "$status_code" -ge 200 && "$status_code" -lt 300 ]]; then
    echo "Success: guvi.in is reachable."
else
    echo "Failure: guvi.in returned an error."
fi

# Part 2: Create input.txt with dummy content
cat <<EOF > input.txt
This is line one.
Line two with no keyword.
Line three: give me more.
Line four: welcome but no give.
Line five: welcome and give knowledge.
Line six: just welcome.
Line seven: give and welcome here again.
EOF

echo -e "\nOriginal content of input.txt:"
cat input.txt

# Replace 'give' with 'learning' from line 5 onward for lines containing 'welcome'
awk 'NR<5 {print; next} /welcome/ {gsub(/give/, "learning")} {print}' input.txt > temp && mv temp input.txt

echo -e "\nUpdated content of input.txt:"
cat input.txt
