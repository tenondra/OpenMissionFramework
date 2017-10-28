/*
	Author: Sean Crowe

	Description:
	Called at start of mission and calls LT_fnc_LTaction to all objects attached to module
*/

_module = allMissionObjects "LT_makeLTmenu";

{
  _currentModule = _x;

  {
      [_x, _currentModule getVariable ["transfer", true], _currentModule getVariable ["arsenal", true], _currentModule getVariable ["manage", true], false, _currentModule getVariable ["admin", true]] call LT_fnc_LTaction;
  } forEach (synchronizedObjects _x);

} forEach _module;
