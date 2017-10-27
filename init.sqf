//Init basic scripts
//[] execVM "scripts\safezone.sqf";

execVM "scripts\coldstart\fnc_safety.sqf";

//Vypnout AI hlas, nastavit všechny hráče bez hlasu a vypnout arty comp.
enableSaving [false, false];
enableSentences false;
enableRadio false;

{_x disableConversation true} forEach playableUnits;
{_x setSpeaker "ace_novoice"} forEach playableUnits;

if (omf_earty == true) then {
  enableEngineArtillery false;
};

//custom Ares moduly
//Modul na spuštění hry
if isClass (configFile >> "CfgPatches" >> "ares_achilles" )) then {
  ["OMF", "Begin mission", {coldstart = false; publicVariable "coldstart";}] call Ares_fnc_RegisterCustomModule;
  ["OMF", "Safety - nouzový fix", {[[false],"omf_fnc_safety",playableUnits + switchableUnits] call BIS_fnc_MP;}] call Ares_fnc_RegisterCustomModule;
};


//CBA functions

//Easier way for admin to hint players
if isClass (configFile >> "CfgPatches" >> "cba_main_a3" )) then {
  ["hint", {
      [[(_this select 0)], "hint", true] call BIS_fnc_MP;
  }, "admin"] call CBA_fnc_registerChatCommand;
};
