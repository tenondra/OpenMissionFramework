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
    texts[] =  {"Ano", "Ne"};
    default = true;
    function = "";
    isGlobal = 1;
    variable = "coldstart";
};

class GuerFriendly {
	title = "Nezávislí - přátelé s";
	values[] = {-1,1,0,2};
	texts[] = {"Nikým","BLUFOR","OPFOR","Všemi"};
	default = -1;
	function = "BIS_fnc_paramGuerFriendly";
};

class tfrf_param_daytime {
		title = "Čas";
		texts[] = {"Ráno","Poledne","Večer","Noc"};
		values[] = {6,12,18,0};
		default = 12;
		function = "BIS_fnc_paramDaytime"; 
};

class tfrf_param_weather {
		title = "Počasí";
		values[] = {0,25,50,75,100};
		texts[] = {"Slunečno","Oblačno","Zataženo","Déšť","Bouřka"};
		default = 0;
        function = "BIS_fnc_paramWeather"; 
};

/*
class tfrf_param_szW {
    title = "Safe zóna BLUFOR - bezpečný spawn během celé hry";
    values[] = {"safezone_west","none"};
    texts[] = {"Ne","Ano"};
    default = "safezone_west";
    function = "tfrf_fnc_removeMarker";
};

class tfrf_param_szE {
    title = "Safe zóna OPFOR - bezpečný spawn během celé hry";
    values[] = {0,1};
    texts[] = {"safezone_east","none"};
    default = "safezone_east";
    function = "tfrf_fnc_removeMarker";
};

class tfrf_param_szI {
    title = "Safe zóna INDEPENDENT - bezpečný spawn během celé hry";
    values[] = {"safezone_guerrila","none"};
    texts[] = {"Ne","Ano"};
    default = "safezone_guerrila";
    function = "tfrf_fnc_removeMarker";
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