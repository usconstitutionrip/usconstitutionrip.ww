#!/bin/bash 

for aa1 in \
p01_09  \
p10_19  \
p20_29  \

do
   mkdir -p ${aa1}
   aa2=`echo ${aa1} | cut -c 2-3`
   cat exampe.001 \
       |sed -e "s;^title.*\$;tilte: \"${aa1}\";g" \
       |sed -e "s;dpjt_01.jpg;dpjt_${aa2}.jpg;g" \
       > ${aa1}/_index.md
done

for aa1 in \
    0 1 2 
do
    mv dpjt_${aa1}?.md  p${aa1}?_*/
done
