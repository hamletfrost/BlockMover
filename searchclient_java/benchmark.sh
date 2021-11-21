#!/bin/bash

levels_greedy=(\
"../levels/MAPF02C.lvl" \
"../levels/SAFirefly.lvl" \
"../levels/SACrunch.lvl" \
"../levels/SAsoko3_08.lvl" \
"../levels/SAsoko3_16.lvl" \
"../levels/SAsoko3_32.lvl")

javac searchclient/SearchClient.java

for lvl in "${levels_greedy[@]}"
do
  echo Level: $lvl

  java -jar ../server.jar -l $lvl -c "java -Xmx8g searchclient.SearchClient -greedy | grep FINAL" > out.log 2>&1

  grep FINAL: out.log

  grep Found out.log

  echo " "
done


rm out.log
