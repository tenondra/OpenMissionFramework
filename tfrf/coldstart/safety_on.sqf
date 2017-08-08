if (isServer) exitwith {};

{_x allowDamage false} forEach playableUnits;

if (isNil "f_eh_safetyMan") then {
			f_eh_safetyMan = player addEventHandler["Fired", {deletevehicle (_this select 6);}];
		};

// Disable guns and damage for vehicles if player is crewing a vehicle
if (vehicle player != player && {player in [gunner vehicle player,driver vehicle player,commander vehicle player]}) then {
	player setVariable ["f_var_safetyVeh",vehicle player];
	(player getVariable "f_var_safetyVeh") allowDamage false;

	if (isNil "f_eh_safetyVeh") then {
		f_eh_safetyVeh = (player getVariable "f_var_safetyVeh") addEventHandler["Fired", {deletevehicle (_this select 6);}];
	};
};

// Make player invincible
player allowDamage false;
