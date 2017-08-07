//=====================================================================================
// TFRF Fix nefunnkčího Zeuse - jak pro samotnou Armu tak TFAR
// Credits: Brebera
// Dokumentace: https://www.github.com/tenondra/TFRFramework/wiki
//=====================================================================================

sleep 5;

if (!isServer) exitWith {};

while {True} do {
	uiSleep 10;
	if (isNil "Zeus1") then {diag_log "No Zeus has been assigned"}
	else {
		Zeus1 assignCurator GM1;
	};
	if (isNil "Zeus2") then {diag_log "No Zeus has been assigned"}
	else {
		Zeus2 assignCurator GM2;
	};
	if (isNil "Zeus3") then {diag_log "No Zeus has been assigned"}
	else {
		Zeus3 assignCurator GM3;
	};
	if (isNil "Civil") then {diag_log "No Zeus has been assigned"}
	else {
		Zeus1 assignCurator GMC1;
	};
};
