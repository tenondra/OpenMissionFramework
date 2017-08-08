//=====================================================================================
// TFRF Cold Start - safety script
// Credits: Brebera
// Dokumentace: https://www.github.com/tenondra/TFRFramework/wiki
//=====================================================================================

tfrf_fnc_safety ={

	//Vynechat server ze scriptu
	if (isServer) exitwith {};

	switch (_this select 0) do
	{
		//Zapnout safety
		case true:
		{
			// Vymazat všechny vystřelené kulky
			player addEventHandler ["Fired", {deletevehicle (_this select 6);}];

			// Vypnout zbraně a damage pro vozidla, pokud se v něm nachází hráč
			if (vehicle player != player && {player in [gunner vehicle player,driver vehicle player,commander vehicle player]}) then {
				player setVariable ["f_var_safetyVeh",vehicle player];
				(player getVariable "f_var_safetyVeh") allowDamage false;

				if (isNil "f_eh_safetyVeh") then {
					f_eh_safetyVeh = (player getVariable "f_var_safetyVeh") addEventHandler["Fired", {deletevehicle (_this select 6);}];
				};
			};

			//Udělat hráče nesmrtelného
			{_x allowDamage false} forEach playableUnits;
		};

		//Vypnout safety
		case false;
		default {

			//Povolit hráči střílet ze zbraní
			if !(isNil "f_eh_safetyMan") then {
				player removeEventhandler ["Fired", f_eh_safetyMan];
				f_eh_safetyMan = nil;
			};

			// Zpátky povolit zbraně a damage pro vozidla ve kterých se nachází hráči
			if !(isNull(player getVariable ["f_var_safetyVeh",objnull])) then {
				(player getVariable "f_var_safetyVeh") allowDamage true;

				if !(isNil "f_eh_safetyVeh") then {
					(player getVariable "f_var_safetyVeh") removeeventhandler ["Fired", f_eh_safetyVeh];
					f_eh_safetyVeh = nil;
				};
				player setVariable ["f_var_safetyVeh",nil];
			};

			//Udělat hráče zranitelného
			{_x allowDamage true} forEach playableUnits;
		};
	};
};
