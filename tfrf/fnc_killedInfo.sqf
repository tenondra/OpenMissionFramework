tfrf_fnc_killedInfo = {
  _killerName = name (_this select 1);
  _instigator = _this select 2;
  
  hint format ["%1 tě zabil pomocí zbraně: %2; Instigator: %3",  _killerName, _weaponName, _instigator];
};
