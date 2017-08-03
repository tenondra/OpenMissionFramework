//Initial 4 sec. sleep to let things settle down
sleep 4;
if (!isDedicated) exitWith {};

while {True} do {
	uiSleep 60;
	//{_x assignCurator randomZeus} forEach ZeusPool;
	Zeus1 assignCurator GM1;
	Zeus2 assignCurator GM2;
	Zeus3 assignCurator GM3;
	ZeusCivil assignCurator GMCivil;
};
