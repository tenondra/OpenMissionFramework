tfrf_fnc_checkZeus ={
  if !(isServer) exitWith {};

  params ["_unit"];

  // Exit if no unit was passed
  if (isNull _unit) exitWith {};
  // Exit if no unit was passed
  if !(isNull (getAssignedCuratorLogic _unit)) exitWith {};
  // Exit if the unit is not a player
  if !(isPlayer _unit) exitWith {};


  // Make sure a side logic exists, if not create it
    if (isNil "f_var_sideCenter") then {
    	f_var_sideCenter = createCenter sideLogic;
    	publicVariable "f_var_sideCenter";
    };
  // Create a new curator logic
  _curator = (createGroup f_var_sideCenter) createUnit ["ModuleCurator_F",[0,0,0] , [], 0, ""];
  // Assign the passed unit as curator
  _unit assignCurator _curator;

  _unit hint "Nyní jsi Zeus";
  /*
  _curator setCuratorWaypointCost 0;
  {_curator setCuratorCoef [_x,0];} forEach ["place","edit","delete","destroy","group","synchronize"];
  */
};
