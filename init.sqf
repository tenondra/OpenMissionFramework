//variables
coldstart = true;
publicVariable "coldstart";
//exec scripty
execVM "scripts\safezone.sqf";
// Nemusí být?? [] execVM "scripts\tfarspect.sqf"; Nemusí být??
[] execVM "f\safeStart\f_safeStart.sqf";
//execVM "scripts\coldstart.sqf";
//custom Ares moduly
["TFROD", "Cold start-begin", {coldstart = false;}] call Ares_fnc_RegisterCustomModule;
//Vypnout AI callExtension, saving a ArtyComputer
enableSaving [false, false];
enableSentences false;
enableRadio false;
enableEngineArtillery false;
{_x setSpeaker "NoVoice"} forEach playableUnits;
