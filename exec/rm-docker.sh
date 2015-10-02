#!/bin/bash

RM="curl -X DELETE 192.168.101.29:5000/v1/repositories/vpon/vpon-dsp-web-retargeting/tags/"

for i in {1..182}
do
    String="$RM""$i"
    $($String)
done

