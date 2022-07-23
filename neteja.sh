#!/bin/bash
# version b0.1

##############################################
###               CONFIG VARS              ###
##############################################
ore="stone"
ruta="/home/minecraft/server/logs/latest.log"
sessio="mine"

##############################################


##############################################
###              CONTROL VARS              ###
##############################################

omplert=0
calcul=0

##############################################


## Truncate log file to get data of this run
echo "truncate log file"
cat ${ruta} | gzip -v9f > ${ruta}-preclean.`date +%y%m%d_%H%M%S`.gz && cat /dev/null > ${ruta}


## 
for i in {64..-59}
do

	let X=$i-5
	echo "running command : Fill 87 ${i} 112 57 ${X} 153 minecraft:air replace minecraft:${ore}"
	screen -r $sessio -X stuff "Fill 87 ${i} 112 57 ${X} 153 minecraft:air replace minecraft:${ore}^M"
	
done


calcul=`cat $ruta  | grep -a "Successfully filled" | grep -aPo '(?<=(filled )).*(?= blocks)' | awk '{ SUM += $1} END { print SUM }'`
echo "extrets "$calcul" de "$ore

