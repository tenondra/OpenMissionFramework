/*
class ModuleMPTypeGameMaster_F {
    title = "";
    values[] = {true,false};
    texts[] =  {"Ano - spawn z Editoru", "Ne - určí Zeus"};
    default = false;
};
*/
class coldstart {
    title = "Cold Start - hráči se nebudou do odstartování mise schopni zranit ani střílet, nebo poškodit a střílet z vozidel";
    values[] = {true,false};
    texts[] =  {"Yes", "Nope"};
    default = true;
    function = "";
    isGlobal = 1;
    variable = "coldstart";
};

class GuerFriendly {
	title = "Guerila - friendlies w/";
	values[] = {-1,1,0,2};
	texts[] = {"No one","BLUFOR","OPFOR","Everyone"};
	default = -1;
	function = "BIS_fnc_paramGuerFriendly";
};

class omf_param_daytime {
		title = "DayTime";
		texts[] = {"Morning","Noon","Evening","Night"};
		values[] = {6,12,18,0};
		default = 12;
		function = "BIS_fnc_paramDaytime";
};

class omf_param_weather {
		title = "Weather";
		values[] = {0,25,50,75,100};
		texts[] = {"Slunečno","Oblačno","Zataženo","Déšť","Bouřka"};
		default = 0;
    function = "BIS_fnc_paramWeather";
};

class omf_welcomemsg {
  title = "Welcome Message";
  values[] = {0,1};
  texts[] = {"Yes","No"};
  default = 1;
  isGlobal = 1;
  function = "omf_setwelcomemsg";
};

/*
class omf_param_szW {
    title = "Safe zóna BLUFOR - bezpečný spawn během celé hry";
    values[] = {"safezone_west","none"};
    texts[] = {"Ne","Ano"};
    default = "safezone_west";
    function = "omf_fnc_removeMarker";
};

class omf_param_szE {
    title = "Safe zóna OPFOR - bezpečný spawn během celé hry";
    values[] = {0,1};
    texts[] = {"safezone_east","none"};
    default = "safezone_east";
    function = "omf_fnc_removeMarker";
};

class omf_param_szI {
    title = "Safe zóna INDEPENDENT - bezpečný spawn během celé hry";
    values[] = {"safezone_guerrila","none"};
    texts[] = {"Ne","Ano"};
    default = "safezone_guerrila";
    function = "omf_fnc_removeMarker";
};

class ModuleMPTypeGameMaster_F {
    title = "Forced spawn - defaultně určený spawn, jinak určí Zeus - default: NE";
    values[] = {true,false};
    texts[] =  {"Ano - spawn z Editoru", "Ne - určí Zeus"};
    default = false;
    typeName = "SCALAR";
    isGlobal = 1;
};
*/
