#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Usage : $0 postal-code"
	exit 1
fi

echo "Postal code is : $1"

[ -d data ] || mkdir data

output_file="data/transactions-$1-$(date +%d-%m-%Y).json"
curl "http://api.cquest.org/dvf?code_postal=$1" > $output_file

echo "The output file is : $output_file"