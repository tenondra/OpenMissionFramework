if (isServer) exitwith {};

{_x allowDamage true} forEach playableUnits;

//Allow player to fire weapons
if !(isNil "f_eh_safetyMan") then {
	player removeEventhandler ["Fired", f_eh_safetyMan];
	f_eh_safetyMan = nil;
};

// Re-enable guns and damage for vehicles if they were disabled
if !(isNull(player getVariable ["f_var_safetyVeh",objnull])) then {
	(player getVariable "f_var_safetyVeh") allowDamage true;

	if !(isNil "f_eh_safetyVeh") then {
		(player getVariable "f_var_safetyVeh") removeeventhandler ["Fired", f_eh_safetyVeh];
		f_eh_safetyVeh = nil;
	};
	player setVariable ["f_var_safetyVeh",nil];
};

// Make player vulnerable
player allowDamage true;
