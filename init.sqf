//Spustit scripty
//[] execVM "scripts\safezone.sqf";

execVM "scripts\coldstart\fnc_safety.sqf";

//Vypnout AI hlas, nastavit všechny hráče bez hlasu a vypnout arty comp.
enableSaving [false, false];
enableSentences false;
enableRadio false;
//enableEngineArtillery false;
{_x disableConversation true} forEach playableUnits;
{_x setSpeaker "ace_novoice"} forEach playableUnits;

//custom Ares moduly
//Modul na spuštění hry
["OMF", "Cold start-begin", {coldstart = false; publicVariable "coldstart";}] call Ares_fnc_RegisterCustomModule;
["OMF", "Safety - nouzový fix", {[[false],"omf_fnc_safety",playableUnits + switchableUnits] call BIS_fnc_MP;}] call Ares_fnc_RegisterCustomModule;

//CBA funkce
["hint", {
    [[(_this select 0)], "hint", true] call BIS_fnc_MP;
}, "admin"] call CBA_fnc_registerChatCommand;
