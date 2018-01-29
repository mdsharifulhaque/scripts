#!/bin/bash

now=$(date +"%F")
log_file="/home/mshaque/darpa1998/execute_snort_barnyard2_log_$now.log"
pcap_file_location="/home/mshaque/darpa1998/all"

echo "***********************************Running Snort****************************"| tee -a "$log_file"
command1="sudo snort -c /etc/snort/snort.conf --pcap-dir=$pcap_file_location"
#command2="ls -a"
eval $command1 2>&1 | tee -a "$log_file"


echo "**********************************************************************************"| tee -a "$log_file"
echo "**********************************************************************************"| tee -a "$log_file"
echo "**********************************************************************************"| tee -a "$log_file"
echo "**********************************************************************************"| tee -a "$log_file"
echo "**********************************************************************************"| tee -a "$log_file"
command2="sudo barnyard2 -c /etc/snort/barnyard2.conf -d /var/log/snort -f snort.u2 -w /var/log/snort/barnyard2.waldo -g snort -u snort"
eval $command2 2>&1 | tee -a "$log_file"

