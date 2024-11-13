echo "Most reqs from IPs:"
awk '{count[$1]++} END {for (word in count) print word " - " count[word]}' info.txt | sort -nrk3 | head -5

echo "\nMost used paths:"
awk '{count[$7]++} END {for (path in count) print path " - " count[path]}' info.txt | sort -nrk3 | head -5

echo "\nMost seen reponse codes:"
awk '{count[$9]++} END {for (code in count) print code " - "count[code]}'  info.txt | sort -nrk3 | head -5

echo "\nMost user agents:"
awk '{count[$NF]++} END {for (user in count) print user " - " count[user]}' info.txt | sort -nrk3 | head -5