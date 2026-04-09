#!/bin/bash
#!/bin/bash
echo "=============SYSTEM_INFO==========="
c_user=$(whoami)
host_n=$(hostname)
up_time=$(uptime -p)
date=$(date +%d-%m-%Y)
time=$(date +%H:%M:%S)
total_mem=$(free -m | awk '/^Mem:/ {print $2}')
used_mem=$(free -m | awk '/^Mem:/ {print $3}')
free_mem=$(free -m | awk '/^Mem:/ {print $4}')
echo "CURRENT_USER: $c_user |CURRENT_DATE: $date |CURRENT_TIME: $time |HOSTNAME: $host_n"
echo "-------Uptime------"
echo "UPTIME: $up_time"
echo ""
echo "------------------------"
#display 
echo "TOTAL_MEMORY: $total_mem MB |USED_MEMORY: $used_mem MB |FREE_MEMORY: $free_mem MB"
echo "------------------------"
# display disk space,used space,and free space
total_disk=$(df -m / | awk 'NR==2 {print $2}')
used_disk=$(df -m / | awk 'NR==2 {print $3}')
free_disk=$(df -m / | awk 'NR==2 {print $4}')
echo "TOTAL_DISK_SPACE: $total_disk GB |USED_DISK_SPACE: $used_disk GB |FREE_DISK_SPACE: $free_disk GB"
echo "  "
echo "-------PROCESSES---RUNNING--------"
#total number of running processes
total_pros=$(ps -e | tail -n +2 | wc -l)
echo "TOTAL PROCESSES RUNNING: $total_pros"
echo "  "
echo "---------------TOP 5 CONSUMING PROCESSES------------------"
echo "    "
ps -eo user,pid,pcpu,pmem,comm --sort=-pcpu | head -n 6
