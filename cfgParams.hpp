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

class Daytime {
		title = "Čas";
		texts[] = {"Ráno","Poledne","Večer","Noc"};
		values[] = {6,12,18,0};
		default = 12;
		function = "BIS_fnc_paramDaytime"; 
		isGlobal = 1; 
	};

