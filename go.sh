#!/bin/bash
count=1
while ( ls log | grep -q -- "-${count}.log" ); do
  count=$( expr $count + 1 )
done

echo "count is ${count}"

for a in *cfg; do
  log="log/${a}-${count}.log"
  ( date; uptime; spacewalk-clone-by-date -c ${a}; echo "Exit is $?"; date ) 2>&1 | tee $log
done
