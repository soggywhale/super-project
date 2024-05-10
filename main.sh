#!/usr/bin/env bash

stamps=$(curl -s -X GET "http://transport.opendata.ch/v1/connections?to=$2&from=$1" | \
    jq -r '.connections[] | "\(.from.departureTimestamp),\(.to.arrivalTimestamp)"')

export IFS=$'\n'



for stamp in $stamps; {
    printf "Départ: %(%H:%M)T Arrivée: %(%H:%M)T\n" \
        "${stamp%%,*}" \
        "${stamp##*,}"
}