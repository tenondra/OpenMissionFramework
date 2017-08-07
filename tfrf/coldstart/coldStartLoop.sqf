//=====================================================================================
// TFRF Cold Start - Loop
// Credits: Brebera
// Dokumentace: https://www.github.com/tenondra/TFRFramework/wiki
//=====================================================================================


// Run the loop only on the server
if (!isServer) exitWith {};

private ["_time","_minuta","_msg","_sklonovani","_msgg"];
_time = 0;
_minuta = 0;
_sklonovani = "minutu";
sleep 2;

if (isNil "coldstart") then {
	missionNamespace setVariable ["coldstart", true];
};

while {coldstart} do {
	uisleep 1;
	// If mission timer has been terminated by admin briefing, simply exit
		// Připočítat jednu sekundu k počítadlu
	_time = _time + 1;
	//hintSilent str _time;

	//add minutes if time reaches one minute
	if (_time ==  60) then {
	_minuta = _minuta+1;
	if (_minuta >1 && _minuta < 5) then {
		_sklonovani = "minuty";
	};
	if (_minuta > 5) then {
		_sklonovani = "minut";
	};
	_time = 0;
	[[format ["Zbrane jsou cold po dobu %1 %2, cekame na spusteni mise", _minuta, _sklonovani]], "hint", true] call BIS_fnc_MP;
	};
};

//Once the mission timer has reached 0, disable the safeties
if (!coldstart) then {
		// Broadcast message to players
		[["Start",["Mise začíná právě teď!"]],"bis_fnc_showNotification",true] call BIS_fnc_MP;
		[["Zeus zahajuje misi. Mise začíná právě teď!"], "hint", true] call BIS_fnc_MP;
		_msgg = "Zeus zahajuje misi. Mise začíná právě teď!";
		for [{_i=0}, {_i<5}, {_i=_i+1}] do {
			systemChat str _msgg;
			sleep 1;
		};

		// Remotely execute script to disable safety for all selectable units
		[[false],"tfrf_fnc_safety",playableUnits + switchableUnits] call BIS_fnc_MP;
};
