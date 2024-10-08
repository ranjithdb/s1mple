#!/bin/bash
URL="http://google.com"
HTTP_CODE=$(curl -o /dev/null -s -w "%{http_code}\n" "$URL")
echo "HTTP status code: $HTTP_CODE"

if [ "$HTTP_CODE" -eq 200 ]; then
	echo "Success: The request was successful."
else
	echo "Failure: The request failed with status code $HTTP_CODE."
fi
