#cat ~/client_records/millbrook/PAT-results.csv | sed -e "s/\( \)\+,/,/g" -e "/^\(,\)\+$/ d"
cat ${1} | sed -e "s/\( \)\+,/,/g" -e "/^\(,\)\+$/ d"
