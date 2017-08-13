["Initialize"] call BIS_fnc_dynamicGroups;

//Zaregistrovat proměnné
missionNamespace setVariable ["coldstart", true];
missionNamespace setVariable ["cantriggercold", true];


execVM "tfrf\coldstart\coldStart.sqf";

while {coldstart} do {
  sleep 5;
  [[true],"tfrf_fnc_safety",playableUnits + switchableUnits] call BIS_fnc_MP;
};
