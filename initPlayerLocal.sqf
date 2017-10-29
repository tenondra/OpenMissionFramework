//=====================================================================================
// OMF Spawn script / init
// Credits: Brebera
// Documentation: https://github.com/tenondra/OpenMissionFramework/wiki
//=====================================================================================

//Inicializovat dynamics group aka "U"
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

private ["_infohrac","_infohracarr1","_infohracarr2","_msg","_zeusarr"];

_zeusarr = [Zeus1,Zeus2,Zeus3,Zeus1C];
//Get info about player
_infohrac = squadParams player;
_infohracarr1 = _infohrac select 0;
_infohracarr2 = _infohrac select 1;

if (omf_welcomemsg == true) then {
  if (player isKindOf Curator ) exitWith {
    _msg =  format ["Zeus %1 from squad %2 had just connected. Welcome!",name player, _infohracarr1 select 1];
    _msg = str _msg;
    [_msg, "systemChat", true] call BIS_fnc_MP;
  };
};

//Wait for player to sync with server
waitUntil {alive player};
player enableSimulation false;
player allowdamage false;
player openMap [true, true];
sleep 2;
hint parseText "<t color='#e32525'>Čekám na sync serveru...</t> ";
sleep 10;
hint parseText "<t color='#00ff00'>Synchronizováno!</t> ";
sleep 2;
player enableSimulation true;
player allowdamage true;
player openMap [false, false];

//Ujistit hráče, že vše funguje
if (omf_welcomemsg == true) then {
  hint parseText format ["<t align='center' size='2.0'>OPEN MISSION FRAMEWORK</t><br />
  Player: %1;<br /> Open Mission Framework v1.0 initialized. Welcome!<br /> <br />
  Your squad: %2   Squad title: %3<br /> <br />
  Your squad logo: <img size='4.0' image= '%4' /><br /> <br />",
   _infohracarr2 select 1, _infohracarr1 select 1, _infohracarr1 select 5, _infohracarr1 select 4];

  //Dát všem vědět, že se připojil další hráč
  _msg =  format ["Player %1 from squad %2 had just connected to the server. Welcome!",name player, _infohracarr1 select 1];
  _msg = str _msg;
  [_msg, "systemChat", true] call BIS_fnc_MP;
};

if (isClass (configfile >> "CfgPatches" >> "tfar_core") && !isClass (configfile >> "CfgPatches" >> "acre_main")) then {
  player linkItem "TFAR_anprc152";
};
if (isClass (configfile >> "CfgPatches" >> "acre_main") && !isClass (configfile >> "CfgPatches" >> "tfar_core") then {
  player addItemToBackpack "ACRE_PRC152";
};
//Vyčistit obrazovku od hintu
sleep 20;
hintSilent "";
