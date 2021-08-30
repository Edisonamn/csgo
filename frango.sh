#!/bin/bash

LATESTMM=$(wget -qO- https://mms.alliedmods.net/mmsdrop/"${METAMOD_VERSION}"/mmsource-latest-linux)
LATESTSM=$(wget -qO- https://sm.alliedmods.net/smdrop/"${SOURCEMOD_VERSION}"/sourcemod-latest-linux)

wget -qO- https://mms.alliedmods.net/mmsdrop/"${METAMOD_VERSION}"/"${LATESTMM}" | tar xvzf - -C "${STEAMAPPDIR}/${STEAMAPP}"
wget -qO- https://sm.alliedmods.net/smdrop/"${SOURCEMOD_VERSION}"/"${LATESTSM}" | tar xvzf - -C "${STEAMAPPDIR}/${STEAMAPP}"

rm  "${STEAMAPPDIR}/${STEAMAPP}/addons/metamod.vdf"
wget https://github.com/Edisonamn/csgo/blob/main/metamod.vdf -P "${STEAMAPPDIR}/${STEAMAPP}/addons"
echo "addons/sourcemod/bin/sourcemod_mm" >> "${STEAMAPPDIR}/${STEAMAPP}/addons/metamod/metaplugins.ini"

wget https://github.com/Edisonamn/csgo/blob/main/frango.cfg -P "${STEAMAPPDIR}/${STEAMAPP}/cfg"
echo "frango.cfg" >> "${STEAMAPPDIR}/${STEAMAPP}/cfg/server.cfg"
