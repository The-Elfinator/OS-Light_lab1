#! ../../../bin/bash

awk '{if ($3 == "(WW)") print}' ../../../var/log/anaconda/X.log > full.log
awk '{if ($3 == "(II)") print}' ../../../var/log/anaconda/X.log >> full.log
sed -i -e 's/(WW)/Warning:/g' full.log
sed -i -e 's/(II)/Information:/g' full.log
