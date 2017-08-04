//Initialize variables
coldstart = true;
publicVariable "coldstart";
//Initialize scripts
nul= execVM "tfrf\safezone.sqf";

nul= execVM "tfrf\coldstart\coldStart.sqf";
nul=execVM "tfrf\zeus\zeusFix.sqf";

nul= execVM "tfrf\zeus\tfrf_fnc_checkZeus.sqf";
nul= execVM "tfrf\coldstart\tfrf_fnc_safety.sqf";


//Turn off AI callouts, arty computer, saving and player's and AI's voice
enableSaving [false, false];
enableSentences false;
enableRadio false;
enableEngineArtillery false;
{_x setSpeaker "NoVoice"} forEach playableUnits;

//custom Ares modules
//Module to trigger start of the game - no more safety
["TFROD", "Cold start-begin", {coldstart = false;}] call Ares_fnc_RegisterCustomModule;
