tfrf_fnc_killedInfo = {
  _killerName = name (_this select 1);
  _weaponName = getText (configFile >> "cfgWeapons" >> currentWeapon (_this select 1) >> "displayname");
  hint format ["%1 tě zabil pomocí zbraně: %2",  _killerName, _weaponName];
};
