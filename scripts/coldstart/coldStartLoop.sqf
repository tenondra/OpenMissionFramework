//=====================================================================================
// OMF Cold Start - Loop
// Credits: Brebera, Arcanum
// Dokumentace: https://www.github.com/tenondra/TFRFramework/wiki
//=====================================================================================


// Run the loop only on the server
if !(isServer) exitWith {};

private ["_time","_minute","_msg","_sklonovani","_msgg","_urslow","_slowarr"];
_time = 0;
_minute = 0;
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
		_minute = _minute+1;
		if (_minute >1 && _minute < 5) then {
			_sklonovani = "minute";
		};
		if (_minute > 4) then {
			_sklonovani = "minutes";
		};
		if (_minute in _slowarr) then {
			_urslow = "Hurry up guys! Its not a barbie simulator";
			[_urslow] remoteExec "systemChat str";
		};
		[[format ["Weapons are cold already %1 %2, waiting for the missionmaker to start the mission", _minute, _sklonovani]], "hint", true] call BIS_fnc_MP;
		_time = 0;
	};
};

//Jakmile Zeus sputí misi pomocí modulu, zastavit timer a dát všem vědět, že mise začala. Zároveň vypnout nesmrtelnost
if (!coldstart && cantriggercold) then {
		cantriggercold = false;
		publicVariable "cantriggercold";
		coldstart = false;
		publicVariable "coldstart";
		// Broadcast message to players
		[["Start",["The mission begins!"]],"bis_fnc_showNotification",true] call BIS_fnc_MP;
		[["Zeus has started the mission. The mission begins!"], "hint", true] call BIS_fnc_MP;
		_msgg = "Zeus has started the mission. The mission begins!";
		_msgg = str _msgg;
		for [{_i=0}, {_i<5}, {_i=_i+1}] do {
			[_msgg, "systemChat", true, true] call BIS_fnc_MP;
			sleep 1;
		};

		// Remotely execute script to disable safety for all selectable units
		//[[false],"omf_fnc_safety",playableUnits + switchableUnits] call BIS_fnc_MP;
		[[false],"omf_fnc_safety",true, true] call BIS_fnc_MP;
};
