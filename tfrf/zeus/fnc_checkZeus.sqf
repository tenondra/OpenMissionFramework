if !(isServer) exitWith {};

params ["_unit"];

if (isNull _unit) exitWith {};
if !(isNull (getAssignedCuratorLogic _unit)) exitWith {};
if !(isPlayer _unit) exitWith {};
