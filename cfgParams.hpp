

class coldstart {
    title = "Cold Start - hráči nebudou na začátku schopni zranit se ani střílet - default: ANO";
    values[] = {true,false};
    texts[] =  {"Ano", "Ne"};
    default = true;
    function = "";
    isGlobal = 1;
};

class GuerFriendly {
	title = Nezávislí - přátelé s;
	values[] = {-1,1,0,2};
	texts[] = {"Nikým","BLUFOR","OPFOR","Všemi"};
	default = -1;
	function = "BIS_fnc_paramGuerFriendly";
};

class tfrf_param_daytime {
		title = "Čas - default: Poledne";
		texts[] = {"Ráno","Poledne","Večer","Noc"};
		values[] = {6,12,18,0};
		default = 12;
		function = "BIS_fnc_paramDaytime"; 
};

class tfrf_param_weather {
		title = "Počasí - default ";
		values[] = {0,25,50,75,100};
		texts[] = {"Slunečno","Oblačno","","Déšť","Bouřka"};
		default = 0;
};

class tfrf_param_szW {
    title = "Safe zóna BLUFOR - bezpečný spawn během celé hry";
    values[] = {0,1};
    texts[] = {"No Wind","Light Wind"};
    default = 0;
};

class tfrf_param_szE {
    title = "Safe zóna OPFOR - bezpečný spawn během celé hry";
    values[] = {0,1};
    texts[] = {"No Wind","Light Wind"};
    default = 0;
};

class tfrf_param_szI {
    title = "Safe zóna - bezpečný spawn během celé hry - default: NE";
    values[] = {0,1,2,4};
    texts[] = {"No Wind","Light Wind","Heavy Wind","Use default"};
    default = 0;
};

class tfrf_param_szC {
    title = "Override Wind";
    values[] = {0,1,2,4};
    texts[] = {"No Wind","Light Wind","Heavy Wind","Use default"};
    default = 4;
};

/*
class ModuleMPTypeGameMaster_F {
    title = "Forced spawn - defaultně určený spawn, jinak určí Zeus - default: NE";
    values[] = {true,false};
    texts[] =  {"Ano - spawn z Editoru", "Ne - určí Zeus"};
    default = false;
    typeName = "SCALAR";
    isGlobal = 1;
};
*/