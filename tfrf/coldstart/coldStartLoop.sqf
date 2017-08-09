//=====================================================================================
// TFRF Cold Start - Loop
// Credits: Brebera
// Dokumentace: https://www.github.com/tenondra/TFRFramework/wiki
//=====================================================================================


// Run the loop only on the server
if !(isServer) exitWith {};

private ["_time","_minuta","_msg","_sklonovani","_msgg","_urslow","_slowarr"];
_time = 0;
_minuta = 0;
_sklonovani = "minutu";
_slowarr = [30,40,50,60,70,80,90,100];
sleep 2;

if (isNil "coldstart") then {
	missionNamespace setVariable ["coldstart", true];
};

if (isNil "cantriggercold") then {
	missionNamespace setVariable ["coldstart", true];
};

while {coldstart} do {
	uisleep 1;
	// Připočítat jednu sekundu k počítadlu
	_time = _time + 1;

	//hintSilent str _time;

	//Pokud uběhla minuta, připočítat ji a dát vědět všem hráčům počet minut od startu
	if (_time ==  60) then {
		_minuta = _minuta+1;
		if (_minuta >1 && _minuta < 5) then {
			_sklonovani = "minuty";
		};
		if (_minuta > 4) then {
			_sklonovani = "minut";
		};
		if (_minuta in _slowarr) then {
			_urslow = "Vážně vám to slotování a gearování trvá... Pohněte si!";
			[_urslow] remoteExec "systemChat str";
		};
		[[format ["Zbraně jsou cold již %1 %2, čeká se na start mise", _minuta, _sklonovani]], "hint", true] call BIS_fnc_MP;
		_time = 0;
	};
};

//Jakmile Zeus sputí misi pomocí modulu, zastavit timer a dát všem vědět, že mise začala. Zároveň vypnout nesmrtelnost
if (!coldstart && cantriggercold) then {
		cantriggercold = false;
		publicVariable "cantriggercold";
		// Broadcast message to players
		[["Start",["Mise začíná právě teď!"]],"bis_fnc_showNotification",true] call BIS_fnc_MP;
		[["Zeus zahajuje misi. Mise začíná právě teď!"], "hint", true] call BIS_fnc_MP;
		_msgg = "Zeus zahajuje misi. Mise začíná právě teď!";
		_msgg = str _msgg;
		for [{_i=0}, {_i<5}, {_i=_i+1}] do {
			[_msgg, "systemChat", true, true] call BIS_fnc_MP;
			sleep 1;
		};

		// Remotely execute script to disable safety for all selectable units
		[[false],"tfrf_fnc_safety",playableUnits + switchableUnits] call BIS_fnc_MP;
};
