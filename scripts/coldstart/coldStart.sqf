//=====================================================================================
// OMF Cold Start - Init
// Credits: Brebera, F3 Framework
// Documentation: https://github.com/tenondra/OpenMissionFramework/wiki
//=====================================================================================

//Jestli neexistuje "coldstart" var, vytvořit ji - nastavit true
if (isNil "coldstart") then {
	missionNamespace setVariable ["coldstart", true];
};

//Pokud coldstart = true
if (coldstart) then
{
	// Server se postará o loop a notifikace
	if (isServer) then {
		[] execVM "scripts\coldstart\coldStartLoop.sqf";
	};
  "COLD START" remoteExec ["hint"];

	// Povolit nesmrtelnost pro hráče
	if (!isDedicated) then {
		[[true],"omf_fnc_safety",playableUnits + switchableUnits] call BIS_fnc_MP;
	};
};
