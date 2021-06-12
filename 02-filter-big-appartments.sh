#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Usage : $0 transactions-data-file"
	exit 1
fi

if [ ! -f $1 ]; then
	echo "File $1 do not exist"
	exit 2
fi

jq '.resultats | .[] | select(.type_local=="Appartement" and .surface_lot_1 > 60 ) | {date_mutation: .date_mutation, surface_lot_1: .surface_lot_1, valeur_fonciere: .valeur_fonciere, prix_m2: (.valeur_fonciere / .surface_lot_1)}' $1 | jq -s 'sort_by(.date_mutation)'

