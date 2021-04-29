#!/bin/bash 

for aa1 in \
p001_09  \
p010_19  \
p020_29  \
p030_39  \
p040_49  \
p050_59  \
p060_69  \
p070_79  \
p080_89  \
p090_99  \
p100_109  \
p110_119  \

do
   mkdir -p ${aa1}
   aa2=`echo ${aa1} | cut -c 2-4`
   cat exampe.001 \
       |sed -e "s;^title.*\$;tilte: \"${aa1}\";g" \
       |sed -e "s;cup_001.jpg;cup_${aa2}.jpg;g" \
       > ${aa1}/_index.md
done

for aa1 in \
    00 01 02 03 04 05 06 07 08 09 10 11 
do
    mv cup_${aa1}?.md  p${aa1}?_*/
done
