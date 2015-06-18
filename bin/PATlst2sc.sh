#./bin/PAT-tidy.sh ${1} | psc -kLSd,  > $(dirname ${1})/$(basename -s .lst ${1}).sc
./bin/PAT-tidy.sh ${1} | psc -kLSd, 
