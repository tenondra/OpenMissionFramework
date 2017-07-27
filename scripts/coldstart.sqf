if (isNil "coldstart") then {
	coldstart = ["coldstart",true] call BIS_fnc_getParamValue;
};

if (coldstart) then
{
	// The server will handle the loop and notifications
	if (isServer) then {
		[] execVM "f\safeStart\f_safeStartLoop.sqf";
	};
  "COLD START" remoteExec ["hint"];

	// Enable invincibility for players
	if (!isDedicated) then {
		[true] call f_fnc_safety;
	};
};
