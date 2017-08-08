//=====================================================================================
// TFRF Respawn script + init
// Credits: Brebera
// Dokumentace: https://www.github.com/tenondra/TFRFramework/wiki
//=====================================================================================

private ["_cameraPos","_markerpos","_group","_unit","_camera","_killer1","_killer2"];

_cameraPos = getPos player; // get position of dead player
_markerpos = getMarkerPos "specpos"; //locate marker
_group = createGroup civilian; // create civilian group
_unit = _group createUnit [ "VirtualSpectator_F", _markerpos, [], 0, "FORM"]; // create the 'spectator' unit at position of marker "specpos"
[_unit] join _group; // join the unit to the civilian group
_unit allowDamage false; // disable damage to new 'spectator' unit
_unit disableAI "ALL"; // disableAI
_unit enableSimulationGlobal false; // disable simulation
selectPlayer _unit; // switch player to the newly created 'spectator' unit

["Initialize", [player, [], true]] call BIS_fnc_EGSpectator; // initialize spectator
_camera = ["GetCamera"] call BIS_fnc_EGSpectator; // get the current camera for spectator
_cameraPos set [2,10]; // set height of camera
_camera setPosASL _cameraPos; // move the camera back to where you died.
player addMPEventHandler ["MPKilled",{_killer1 = _this select 1; _killer2 = _this select 2;cutText [format["Zemřel jsi. Zabil tě %1 / %2. Nyní máš možnost používat spectator mode a komunikovat s již mrtvými hráči.",_killer1,_killer2],"PLAIN",1.5,true];}];
[player, true] call TFAR_fnc_forceSpectator;
//execVM "tfrf\tfarspect.sqf";
sleep 30;
