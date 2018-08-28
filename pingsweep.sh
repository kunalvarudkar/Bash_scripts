#!/bin/bash

echo "Enter your subnet"
read SUBNET

for IP in $(seq 60 70); do
	ping -c 1 $SUBNET.$IP
done
