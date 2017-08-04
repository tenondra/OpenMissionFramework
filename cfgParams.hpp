class ace_repair_engineerSetting_repair {
    title = "Cold Start - hráči nebudou na začátku schopni zranit se ani střílet";
    values[] = {true,false};
    texts[] =  {"Ano", "Ne"};
    default = true;
    typeName = "SCALAR";
    function = "";
    isGlobal = 1;
};

class ModuleMPTypeGameMaster_F {
    title = "Forced spawn - defaultně určený spawn, jinak určí Zeus";
    values[] = {true,false};
    texts[] =  {"Ano - spawn z Editoru", "Ne - určí Zeus"};
    default = true;
    typeName = "SCALAR";
    isGlobal = 1;
};

class tfrf_param_daytime {
		title = "Čas";
		texts[] = {"Ráno","Poledne","Večer","Noc"};
		values[] = {6,12,18,0};
		default = 12;
		function = "BIS_fnc_paramDaytime"; 
		isGlobal = 1; 
	};

class tfrf_param_weather
	{
		title = "$STR_f_param_weather";
		values[] = {0,1,2,3,4,5,6,7,8,9};
		texts[] = {$STR_f_param_weather_Option0,$STR_f_param_weather_Option1,$STR_f_param_weather_Option2,$STR_f_param_weather_Option3,$STR_f_param_weather_Option4,$STR_f_param_weather_Option5,$STR_f_param_weather_Option6,$STR_f_param_weather_Option7,$STR_f_param_weather_Option8,$STR_f_param_weather_Option11};
		default = 0;
	};

class tfrf_param_fog
{
    title = "Override Fog";
    values[] = {0,1,2,4};
    texts[] = {"No Fog","Light Fog","Heavy Fog","Use default"};
    default = 4;
};

class tfrf_param_wind
{
    title = "Override Wind";
    values[] = {0,1,2,4};
    texts[] = {"No Wind","Light Wind","Heavy Wind","Use default"};
    default = 4;
};

class tfrf_param_szW
{
    title = "Override Wind";
    values[] = {0,1,2,4};
    texts[] = {"No Wind","Light Wind","Heavy Wind","Use default"};
    default = 4;
};

class tfrf_param_szE
{
    title = "Override Wind";
    values[] = {0,1,2,4};
    texts[] = {"No Wind","Light Wind","Heavy Wind","Use default"};
    default = 4;
};

class tfrf_param_szI
{
    title = "Override Wind";
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



