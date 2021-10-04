#!/bin/bash

levels_bfs=(\
"../levels/MAPF00.lvl" \
"../levels/MAPF01.lvl" \
"../levels/MAPF02.lvl" \
"../levels/MAPF02C.lvl" \
"../levels/SAD1.lvl" \
"../levels/SAD2.lvl" \
"../levels/SAD3.lvl" \
"../levels/SAfriendofBFS.lvl" \
"../levels/SACrunch.lvl" \
"../levels/SAFirefly.lvl")

levels_dfs=(\
"../levels/MAPF02C.lvl" \
"../levels/SAD1.lvl" \
"../levels/SAD2.lvl" \
"../levels/SAD3.lvl" \
"../levels/SAfriendofBFS.lvl" \
"../levels/SACrunch.lvl" \
"../levels/SAFirefly.lvl")

javac searchclient/SearchClient.java

for lvl in "${levels_bfs[@]}"
do
  echo BFS Level: $lvl

  java -jar ../server.jar -l $lvl -c "java -Xmx8g searchclient.SearchClient -bfs | grep FINAL" > out.log 2>&1

  grep FINAL: out.log

  grep Found out.log

  echo " "
done

for lvl in "${levels_dfs[@]}"
do
  echo DFS Level: $lvl

  java -jar ../server.jar -l $lvl -c "java -Xmx8g searchclient.SearchClient -dfs | grep FINAL" > out.log 2>&1

  grep FINAL: out.log

  grep Found out.log

  echo " "
done

rm out.log
