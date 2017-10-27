while {true} do {
  if (!(isNil "Zeus1") && (isNull(getAssignedCuratorLogic Zeus1))) then {unassignCurator Zeus1_zeus;Zeus1 assignCurator Zeus1_zeus};
  if (!(isNil "Zeus2") && (isNull(getAssignedCuratorLogic Zeus2))) then {unassignCurator Zeus2_zeus;Zeus2 assignCurator Zeus2_zeus};
  if (!(isNil "Zeus3") && (isNull(getAssignedCuratorLogic Zeus3))) then {unassignCurator Zeus3_zeus;Zeus3 assignCurator Zeus3_zeus};
  uisleep 10;
};
