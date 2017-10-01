//=====================================================================================
// MF Kompatibilita TFAR a spectatoru
// Credits: Brebera
// Dokumentace: https://www.github.com/tenondra/TFRFramework/wiki
//=====================================================================================

private ["_player","_value"];
 _player = _this select 0;
 _value = _this select 1;
 if (_value) then {
	_player call TFAR_fnc_sendPlayerKilled;
 };
