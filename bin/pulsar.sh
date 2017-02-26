#!/bin/sh
#
# Copyright (C) 2017 Rodrigo González López.
# All rights reserved.
#
# forked from z3bra's scripts.
#

DLY=0.05
CLRS=$(tac < ~/.colors | cat - ~/.colors | tr -d '#')
LEN=$(echo "`wc -l ~/.colors | cut -d' ' -f1` * 2" | bc)
i=0

while true
do
	for c in $CLRS
	do
		CRNT=$(pfw)

		wattr $CRNT \
			&& test "`wattr wh $CRNT`" != "`wattr wh $(lsw -r)`" \
			&& chwb -c $c $CRNT

		i=$(echo "$i + 1" | bc)

		sleep $DLY

		if [ $i -eq $LEN ];then
			sleep 2
			i=0
		fi
	done
done