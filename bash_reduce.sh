#
# Map Reduce framework in bash / awk / GNU Parallel
#
# Implement your own map and reduce functions
# The framework will take care of the rest
#
# @author anton.sorhus@gmail.com

usage="\n
\tusage: ./bash_reduce.sh mode map-source reduce-source input [map, reduce args] [parallel args] \n\n
\t\tmode: --sequential -s, --local -l or --cluster -c. local and cluster requires GNU parallel. cluster also requires cluster.config file.\n
\t\tsource: files containing map and reduce functions in awk.\n
\t\tinput: data.\n
\t\tmap, reduce args: optional awk args for mapper and reducer.\n
\t\tparallel args: optional args for GNU parallel.\n
"

if [[ $# -gt 2 ]]
then
  if [[ $1 == --sequential || $1 == -s ]]
  then
    MODE=s
  elif [[ $1 == --local || $1 == -l ]]
  then
    MODE=l
  elif [[ $1 == --cluster || $1 == -c ]] 
  then
    MODE=c
  else
    echo -e $usage
    exit
  fi
else
  echo -e $usage
  exit
fi

map=$(<$2)
shuffle=$(<"shuffle.awk")
reduce=$(<$3)

if [[ $MODE == s ]]
then
  awk $5 "$map" < $4 | \
  sort -S 1G | \
  awk "$shuffle" | \
  awk $5 "$reduce" | \
  sort -S 1G -k2nr -k1
  exit
fi

alias local='parallel --gnu --progress --pipe $6'
if [[ $MODE == l ]]
then
  alias mode='local'
elif [[ $MODE == c ]]
then
  alias mode='local --sshloginfile cluster.config --controlmaster --sshdelay 0.01 --progress'
fi
shopt -s expand_aliases

mode "awk $5 '$map' | sort -S 1G | awk '$shuffle'" < $4 | \
sort -S 1G | \
awk "$shuffle" | \
mode "awk $5 '$reduce'" | \
sort -S 1G -k2nr -k1
