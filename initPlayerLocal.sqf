//=====================================================================================
// TFRF Spawn script + init
// Credits: Brebera
// Dokumentace: https://www.github.com/tenondra/TFRFramework/wiki
//=====================================================================================

//Inicializovat dynamics group aka "U"
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

//První spawn hráče
private ["_infohrac","_infohracarr1","_infohracarr2","_msg"];

//Získat info o hráči
_infohrac = squadParams player;
_infohracarr1 = _infohrac select 0;
_infohracarr2 = _infohrac select 1;


//Synchronizace se serverem
waitUntil {alive player};
player enableSimulation false;
sleep 5;
hint parseText "<t color='#e32525'>Čekám na sync serveru...</t> ";
sleep 10;
hint parseText "<t color='#00ff00'>Synchronizováno!</t> ";
sleep 2;
player enableSimulation true;

//Ujistit hráče, že vše funguje
hint parseText format ["<t align='center' size='2.0'>TFROD SRS MISE</t><br />
Hráč: %1; TFROD Framework v3.4 inicializován. Vítej!<br /> <br />
Tvůj squad je: %2   SquadTitle je: %3<br /> <br />
Zobrazovaná insignie je: <img size='4.0' image= '%4' /><br /> <br />",
 _infohracarr2 select 1, _infohracarr1 select 1, _infohracarr1 select 5, _infohracarr1 select 4];

//Dát všem vědět, že se připojil další hráč
_msg =  format ["Hráč %1 ze Squadu %2 se právě připojil na server. Welcome!",_infohracarr2 select 1, _infohracarr1 select 1];
[_msg] remoteExec "systemChat str";

//Vyčistit obrazovku od hintu
sleep 20;
hintSilent "";
