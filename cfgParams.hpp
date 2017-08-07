class ace_repair_engineerSetting_repair {
    title = "Cold Start - hráči nebudou na začátku schopni zranit se ani střílet - default: ANO";
    values[] = {true,false};
    texts[] =  {"Ano", "Ne"};
    default = true;
    typeName = "SCALAR";
    function = "";
    isGlobal = 1;
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

class tfrf_param_safeZone {
    title = "Safe zóna - bezpečný spawn během celé hry - default: NE";
    values[] = {false,true,"BLUF","OPF","IND"};
    texts[] =  {"Ne", "Ne - určí Zeus"};
    default = true;
    typeName = "SCALAR";
    isGlobal = 1;
};

class tfrf_param_daytime {
		title = "Čas - default: Poledne";
		texts[] = {"Ráno","Poledne","Večer","Noc"};
		values[] = {6,12,18,0};
		default = 12;
		function = "BIS_fnc_paramDaytime"; 
		isGlobal = 1; 
	};

class tfrf_param_weather
	{
		title = "Počasí - default ";
		values[] = {0,1,2,3,4,5,6,7,8,9};
		texts[] = {};
		default = 0;
	};

class tfrf_param_fog
{
    title = "Mlha - default: Nastavení mise";
    values[] = {0,1,2,4};
    texts[] = {"Bez mlhy","Slabá mlha","Silná mlha","Nastavení mise"};
    default = 4;
};

class tfrf_param_wind
{
    title = "Vítr - default: Nastavení mise";
    values[] = {0,1,2,4};
    texts[] = {"Bez větru","Slabý vítr","Silný vítr","Nastavení mise"};
    default = 4;
};

class tfrf_param_szW
{
    title = "Safe zóna - bezpečný spawn během celé hry - default: NE";
    values[] = {0,1,2,4};
    texts[] = {"No Wind","Light Wind","Heavy Wind","Use default"};
    default = 4;
};

class tfrf_param_szE
{
    title = "Safe zóna - bezpečný spawn během celé hry - default: NE";
    values[] = {0,1,2,4};
    texts[] = {"No Wind","Light Wind","Heavy Wind","Use default"};
    default = 4;
};

class tfrf_param_szI
{
    title = "Safe zóna - bezpečný spawn během celé hry - default: NE";
    values[] = {0,1,2,4};
    texts[] = {"No Wind","Light Wind","Heavy Wind","Use default"};
    default = 4;
};

class tfrf_param_szC
{
    title = "Override Wind";
    values[] = {0,1,2,4};
    texts[] = {"No Wind","Light Wind","Heavy Wind","Use default"};
    default = 4;
};



