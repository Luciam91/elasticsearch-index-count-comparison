#!/bin/sh

elasticsearch_host=$1
initial_index=$2
new_index=$3

echo $elasticsearch_host

initial_count=$(curl -s -H "Accept: application/json" -H "Content-Type: application/json" -X GET http://$elasticsearch_host/$initial_index/_count?pretty=true | jq '.count')
echo $initial_count

while true
do
	new_count=$(curl -s -H "Accept: application/json" -H "Content-Type: application/json" -X GET http://$elasticsearch_host/$new_index/_count?pretty=true | jq '.count')
	if [ "$initial_count" -lt "$new_count" ]
	then
		exit 0
	fi
done

