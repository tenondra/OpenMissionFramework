//Spustit scripty
//[] execVM "tfrf\safezone.sqf";

execVM "tfrf\coldstart\fnc_safety.sqf";

//Vypnout AI hlas, nastavit všechny hráče bez hlasu a vypnout arty comp.
enableSaving [false, false];
enableSentences false;
enableRadio false;
enableEngineArtillery false;
{_x disableConversation true} forEach playableUnits;
{_x setSpeaker "ace_novoice"} forEach playableUnits;

//custom Ares moduly
//Modul na spuštění hry
["TFRF", "Cold start-begin", {coldstart = false; publicVariable "coldstart";}] call Ares_fnc_RegisterCustomModule;
["TFRF", "Safety - nouzový fix", {[[false],"tfrf_fnc_safety",playableUnits + switchableUnits] call BIS_fnc_MP;}] call Ares_fnc_RegisterCustomModule;
