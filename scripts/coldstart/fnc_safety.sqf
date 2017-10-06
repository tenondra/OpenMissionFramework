//=====================================================================================
// OMF Cold Start - safety script
// Credits: F3 Framework, Brebera
// Dokumentace: https://www.github.com/tenondra/TFRFramework/wiki
//=====================================================================================

omf_fnc_safety ={

	if (isDedicated) exitwith {};

	_zeusarr = [Zeus1,Zeus2,Zeus3,Zeus1C];
	
	switch (_this select 0) do
	{
		//Turn safety on
		case true: {

			//Delete bullets from fired weapons
			if (isNil "omf_eh_safetyMan") then {
			omf_eh_safetyMan = player addEventHandler["Fired", {deletevehicle (_this select 6);}];
			};

			// Disable guns and damage for vehicles if player is crewing a vehicle
			if (vehicle player != player && {player in [gunner vehicle player,driver vehicle player,commander vehicle player]}) then {
				player setVariable ["omf_var_safetyVeh",vehicle player];
				(player getVariable "omf_var_safetyVeh") allowDamage false;

				if (isNil "omf_eh_safetyVeh") then {
					mf_eh_safetyVeh = (player getVariable "omf_var_safetyVeh") addEventHandler["Fired", {deletevehicle (_this select 6);}];
				};
			};
					// Make player invincible
					player allowDamage false;
		};

		//Turn safety off
		case false: {

			if (player in _zeusarr) exitWith {
				player allowDamage false;
			};

			//Allow player to fire weapons
			if !(isNil "omf_eh_safetyMan") then {
				player removeEventhandler ["Fired", omf_eh_safetyMan];
				omf_eh_safetyMan = nil;
			};

			// Re-enable guns and damage for vehicles if they were disabled
			if !(isNull(player getVariable ["mf_var_safetyVeh",objnull])) then {
				(player getVariable "mf_var_safetyVeh") allowDamage true;

				if !(isNil "omf_eh_safetyVeh") then {
					(player getVariable "omf_var_safetyVeh") removeeventhandler ["Fired", omf_eh_safetyVeh];
					omf_eh_safetyVeh = nil;
				};
				player setVariable ["omf_var_safetyVeh",nil];
			};

			// Make player vulnerable
			player allowDamage true;
			if (player in _zeusarr) exitWith {
				player allowDamage false;
			};
		};
	};
};
