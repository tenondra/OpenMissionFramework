//Initial 4 sec. sleep to let things settle down
sleep 4;

if !(isServer) exitWith {};

private ["_unit"];
_unit = [_this,0,objNull] call bis_fnc_param;

while {True} do {
	uiSleep 60;
	//{_x assignCurator randomZeus} forEach ZeusPool;
	if (isNull Zeus1) then {}
	else {
		Zeus1 assignCurator GM1;
	};
	Zeus2 assignCurator GM2;
	Zeus3 assignCurator GM3;
	ZeusCivil assignCurator GMCivil;
};
