#!/bin/bash

RM="curl -X DELETE 192.168.101.29:5000/v1/repositories/vpon/vpon-dsp-web-dev-dsl/tags/"

for i in {1..30}
do
    String="$RM""$i"
    $($String)
done

