
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
    values[] = {1,0};
    texts[] = {"Yes","No"};
    default = 1;
    isGlobal = 1;
    function = "omf_setwelcomemsg";
};

class omf_engart {
    title = "Enable artillery computer";
    values[] = {1,0};
    texts[] = {"Yes","Nope"};
    default = 0;
    isGlobal = 1;
    function = "omf_setwelcomemsg";
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
