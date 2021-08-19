#!/bin/bash

echo "Asking google for: '$@'"

for term in $@ ; do
	search="$search%20$term"
done
	xdg-open "http://www.google.com/search?q=$search"
