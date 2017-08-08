//Initialize variables
cantriggercold = true;

//Initialize scripts
execVM "tfrf\safezone.sqf";
execVM "tfrf\coldstart\coldStart.sqf";
execVM "tfrf\zeusFix.sqf";

[] execVM "tfrf\coldstart\fnc_safety.sqf";

//Turn off AI callouts, arty computer, saving and player's and AI's voice
enableSaving [false, false];
enableSentences false;
enableRadio false;
enableEngineArtillery false;
{_x setSpeaker "NoVoice"} forEach playableUnits;

//custom Ares moduly
//Module to trigger start of the game - no more safety
["TFRF", "Cold start-begin", {coldstart = false;}] call Ares_fnc_RegisterCustomModule;
