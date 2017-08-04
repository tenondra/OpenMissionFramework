//Initial 4 sec. sleep to let things settle down
sleep 4;

if !(isServer) exitWith {};

while {True} do {
	uiSleep 10;
	nul= ["Zeus1"] call tfrf_fnc_checkZeus;
	nul= ["Zeus2"] call tfrf_fnc_checkZeus;
	nul= ["Zeus3"] call tfrf_fnc_checkZeus;
	nul= ["Civil"] call tfrf_fnc_checkZeus;
};
