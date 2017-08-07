// Run the loop only on the server
if (!isServer) exitWith {};

private ["_time","_minutes","_msg"];
_time = 0;
_minutes = 0;

sleep 2;

if (isNil "coldstart") then {
	missionNamespace setVariable ["coldstart", true];
};

while {coldstart} do {
	uisleep 1;
	// If mission timer has been terminated by admin briefing, simply exit
	if (coldstart == false) exitWith {};
	// Připočítat jednu sekundu k počítadlu
	_time = _time + 1;
	publicVariable "_time";
	//add minutes if time reaches one minute
	if {_time ==  59} then {
	 _minuta = _minuta+1;
	 _time = 0;
	 _msg = format ["Zbrane jsou cold jiz %1 minut, cekame na spusteni mise",_minuta];
	 //[_msg,"systemChat str"] call BIS_fnc_MP;
	 [["Cold Start",[format["Zbraně jsou cold již %1 minut",_minutes]]],"bis_fnc_showNotification",true] call BIS_fnc_MP;
	};
};

//Once the mission timer has reached 0, disable the safeties
if (typename coldstart != typename true) then {
		// Broadcast message to players
		[["Zeus zahajuje misi",["Mise začíná právě teď!"]],"bis_fnc_showNotification",true] call BIS_fnc_MP;

		// Remotely execute script to disable safety for all selectable units
		[[false],"tfr_fnc_safety",playableUnits + switchableUnits] call BIS_fnc_MP;
};
