#!/bin/bash
#input contains domain names
input="network-test-machine-list.txt"
#output file
output="network-test-latency.txt"
performping() {
local domain=$1
local samples=3

# below runs ping and calculates average round time trip RTT. 5th filed corressponds to RTT in ping
avg=$(ping -c $samples "$domain" | awk -F'/' '/^rtt/{print $5}' )

# show domain name and average round trip time and write to output file
echo "$domain $avg" >> "$output"
}
# if input file is not found show error
if [ ! -f "$input" ]; then
	echo "Error: $input not found"
	exit 1
fi
#Reading domain names form input file
while IFS= read -r domain || [[ -n "$domain" ]]; do
	echo "$domain.."
	performping "$domain"
done < "$input"
echo "Completed. Please check $output"
