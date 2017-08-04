if (isNil "coldstart") then {
	coldstart = ["coldstart",true] call BIS_fnc_getParamValue;
};

if (coldstart) then
{
	// The server will handle the loop and notifications
	if (isServer) then {
		[] execVM "tfrf\coldstart\coldStartLoop.sqf";
	};
  "COLD START" remoteExec ["hint"];

	// Enable invincibility for players
	if (!isDedicated) then {
		[true] call tfrf_fnc_safety;
	};
};
