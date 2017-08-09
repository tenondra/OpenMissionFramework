//=====================================================================================
// TFRF Cold Start - safety script
// Credits: F3 Framework, Brebera
// Dokumentace: https://www.github.com/tenondra/TFRFramework/wiki
//=====================================================================================

tfrf_fnc_safety ={

	if (isDedicated) exitwith {};

	switch (_this select 0) do
	{
		//Turn safety on
		case true: {

			//Delete bullets from fired weapons
			if (isNil "tfrf_eh_safetyMan") then {
			tfrf_eh_safetyMan = player addEventHandler["Fired", {deletevehicle (_this select 6);}];
			};

			// Disable guns and damage for vehicles if player is crewing a vehicle
			if (vehicle player != player && {player in [gunner vehicle player,driver vehicle player,commander vehicle player]}) then {
				player setVariable ["tfrf_var_safetyVeh",vehicle player];
				(player getVariable "tfrf_var_safetyVeh") allowDamage false;

				if (isNil "tfrf_eh_safetyVeh") then {
					tfrf_eh_safetyVeh = (player getVariable "tfrf_var_safetyVeh") addEventHandler["Fired", {deletevehicle (_this select 6);}];
				};
			};
					// Make player invincible
					player allowDamage false;
		};

		//Turn safety off
		case false: {

			//Allow player to fire weapons
			if !(isNil "tfrf_eh_safetyMan") then {
				player removeEventhandler ["Fired", tfrf_eh_safetyMan];
				tfrf_eh_safetyMan = nil;
			};

			// Re-enable guns and damage for vehicles if they were disabled
			if !(isNull(player getVariable ["tfrf_var_safetyVeh",objnull])) then {
				(player getVariable "tfrf_var_safetyVeh") allowDamage true;

				if !(isNil "tfrf_eh_safetyVeh") then {
					(player getVariable "tfrf_var_safetyVeh") removeeventhandler ["Fired", tfrf_eh_safetyVeh];
					tfrf_eh_safetyVeh = nil;
				};
				player setVariable ["tfrf_var_safetyVeh",nil];
			};

			// Make player vulnerable
			player allowDamage true;
		};
	};
};
