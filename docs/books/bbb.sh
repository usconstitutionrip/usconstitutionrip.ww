#!/bin/bash

#../jpg/rip_in_001.jpg   \
#../jpg/rip_in_002.jpg   \

for aa1 in \
    `ls jpg/*.jpg`
do
    aa2=`basename ${aa1}`
    aa3=${aa2%.*}
    aa4=`echo -n ${aa3}|sed -e 's;^.*_;;g'`
    aa5=$(($(echo ${aa4} |sed -e 's;^0*;;g')))
    bb1=`realpath  .`
    bb2=`basename  ${bb1}|sed -e 's;^[0-9]*_;;g'`
    echo "---
weight: ${aa5}
bookFlatSection: true
title: \"${aa4}\"
---

![${bb2} ${aa4} ](../${aa1})

" >  ${aa3}.md

done
