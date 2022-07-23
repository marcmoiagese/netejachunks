#!/bin/bash
# version b0.2

##############################################
###               CONFIG VARS              ###
##############################################
ruta="/home/minecraft/server/logs/latest.log"
sessio="mine"

declare -a arr=("lava"
		"seagrass"
		"water"
		"azalea"
		"flowering_azalea"
		"moss_carpet"
		"bigdripleaf"
		"small_dripleaf"
		"netherrack"
		"glow_lichen"
		"vines"
		"chain"
		"glow_berries"
		"spore_bolssom"
		"gravel"
		"sand"
		"stone"
		"dirt"
		"deepslate"
		"tuff"
		"grass_block"
                "granite"
		"diorite"
		"andesite"
		"copper_ore"
		"gold_ore"
		"redstone_ore"
		"coal_ore"
		"iron_ore"
		"diamond_ore"
		"clay"
		"lapis_ore"
		"obsidian"
		"cobblestone"
		"mossy_cobblestone"
		"moss_block"
		"magma_block"
		"deepslate_iron_ore"
		"deepslate_gold_ore"
		"deepslate_lapis_ore"
		"deepslate_redstone_ore"
		"deepslate_copper_ore"
		"deepslate_diamond_ore"
		"deepslate_coal_ore"
		"raw_iron"
		"smooth_basalt"
		"calcite"
		"amethyst_block"
		"bone_block"
		"oak_leaves"
		"spruce_leaves"
		"brich_leaves"
		"jungle_leaves"
		"acacia_leaves"
		"darl_oak_leaves"
		"mangrove_leaves"
		"azalea_leaves"
		"flowering_azalea_leaves"
		"oak_log"
		"spruce_log"
		"brich_log"
		"jungle_log"
		"acacia_log"
		"dark_oak_log"
		"mangrove_log"
		"oak_fence"
		"oak_planks"
		"raw_copper_block"
		"sculk"
		"cobweb"
	)

				
##############################################


##############################################
###              CONTROL VARS              ###
##############################################

omplert=0
calcul=0

##############################################


##
for ore in "${arr[@]}" 
do
   echo "staring with"$ore
   echo "truncate log file"
   cat ${ruta} | gzip -v9f > ${ruta}-${ore}-preclean.`date +%y%m%d_%H%M%S`.gz && cat /dev/null > ${ruta}
   for i in {64..-56}
   do
     let X=$i-5
     #X=$((i-5))
     echo "X - $i Z - $X"
     sleep 1
     screen -r $sessio -X stuff "fill 187 ${i} 110 221 ${X} 161 minecraft:air replace minecraft:${ore}^M"
     #sleep 1
     screen -r $sessio -X stuff "fill 187 ${i} 207 223 ${X} 161 minecraft:air replace minecraft:${ore}^M"
     #sleep 1
     screen -r $sessio -X stuff "fill 187 ${i} 207 223 ${X} 255 minecraft:air replace minecraft:${ore}^M"
     #sleep 1
     screen -r $sessio -X stuff "fill 187 ${i} 256 223 ${X} 287 minecraft:air replace minecraft:${ore}^M"
   
   done
   calcul=`cat $ruta  | grep -a "Successfully filled" | grep -aPo '(?<=(filled )).*(?= blocks)' | awk '{ SUM += $1} END { print SUM }'`
   echo "extrets "$calcul" de "$ore
   sleep 10

done

