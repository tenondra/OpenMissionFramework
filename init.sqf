//Init basic scripts

omf_welcomemsg = true;

execVM "scripts\coldstart\fnc_safety.sqf";

//Vypnout AI hlas, nastavit všechny hráče bez hlasu a vypnout arty comp.
enableSaving [false, false];
enableSentences false;
enableRadio false;

{_x disableConversation true} forEach playableUnits;
{_x setSpeaker "ace_novoice"} forEach playableUnits;

//if (omf_earty == true) then {
  enableEngineArtillery false;
//};

//CBA functions
//Easier way for admin to hint players
if (isClass (configfile >> "CfgPatches" >> "cba_main")) then {
  ["hint", {
      [[(_this select 0)], "hint", true] call BIS_fnc_MP;
  }, "admin"] call CBA_fnc_registerChatCommand;
};

//Custom Ares module
if (isClass (configfile >> "CfgPatches" >> "achilles_data_f_achilles" )) then {
  ["OMF", "Begin mission", {coldstart = false; publicVariable "coldstart";}] call Ares_fnc_RegisterCustomModule;
  ["OMF", "Safety - nouzový fix", {[[false],"omf_fnc_safety",playableUnits + switchableUnits] call BIS_fnc_MP;}] call Ares_fnc_RegisterCustomModule;
  ["OMF", "Enhanced arsenal", {execVM "scripts\arsenalenh.sqf"}] call Ares_fnc_RegisterCustomModule;
};
