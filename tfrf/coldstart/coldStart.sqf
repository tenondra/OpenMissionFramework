if (isNil coldstart) then {
	missionNamespace setVariable ["coldstart", true];
};

if (coldstart) then
{
	// The server will handle the loop and notifications
	if (isServer) then {
		nil = [] execVM "tfrf\coldstart\coldStartLoop.sqf";
	};
  "COLD START" remoteExec ["hint"];

	// Enable invincibility for players
	if (!isServer) then {
		[true] call tfrf_fnc_safety;
	};
};
