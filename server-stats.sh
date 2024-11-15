iostat -c | awk 'NR==4 {print "CPU Usage Metrics\nCPU Util:\t" 100-$6 "%\nIdle:\t\t" $6"%\n"}'
vmstat -a | awk 'NR==3 {print "Memory Usage Metrics\nFree Mem:\t" $4 "\nActive Mem:\t" $6 }'
iostat -d | awk 'NR>2 {if(NR==3) print "\nDisk Usage\n"$1"\t" $2"\t" $3"\t" $4"\t"; else print $1"\t" $2"\t" $3"\t\t" $4"\t"}'
top -n 1 -b -c -o %CPU | awk 'NR>=6 { if(NR==6) print "TOP CPU Processes\n" $9 "\t" $12; else print $9 "\t" $12}'
top -n 1 -b -c -o %MEM | awk 'NR>=6 { if(NR==6) print "TOP MEM Processes\n" $10 "\t" $12; else print $10 "\t" $12}'