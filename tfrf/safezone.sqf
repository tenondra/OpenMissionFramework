private ["_PlayerInAreas","_OldPlayerInAreas","_TriggerList","_Debug","_MarkerName","_Pos","_SpawnProtection","_InZoneArea","_SideZone","_friendlies"];

//--- Spawn Protection ---//
#define SAFETY_ZONES [["safezone_west", 75],["safezone_east", 75],["safezone_guerrila", 75]]
#define MESSAGE	"Negligent discharge není na základně dovolen!"
SPAWN_Restriction=["APERSBoundingMine_Range_Ammo","ATMine_Range_Ammo","DemoCharge_Remote_Ammo","SatchelCharge_Remote_Ammo","SLAMDirectionalMine_Wire_Ammo","APERSTripMine_Wire_Ammo","APERSMine_Range_Ammo","GrenadeHand","smokeshell","F_20mm_Green","F_20mm_Red","F_20mm_White","F_20mm_Yellow","F_40mm_Green","F_40mm_Cir","F_40mm_Red","F_40mm_White","F_40mm_Yellow","NLAW_F","R_TBG32V_F","R_PG32V_F","M_Titan_AP","SmokeShellBlue","SmokeShellGreen","SmokeShellOrange","SmokeShellPurple","SmokeShellRed","SmokeShell","SmokeShellYellow","G_40mm_SmokeBlue","G_40mm_SmokeGreen","G_40mm_SmokeOrange","G_40mm_SmokePurple","G_40mm_SmokeRed","G_40mm_Smoke","G_40mm_SmokeYellow","ClaymoreDirectionalMine_Remote_Ammo","mini_Grenade","GrenadeHand_stone","G_40mm_HE","M_NLAW_AT_F","M_Titan_AT","B_30x113mm_M789_HEDP","B_20mm_AP","M_Sidewinder_AA","M_Hellfire_AT","R_Hydra_HE","RHS_ammo_BGM109","RHS_ammo_M919_APFSDS","RHS_ammo_M792_HEI","rhs_ammo_TOW_AT","rhs_ammo_TOW2_AT","rhs_ammo_Stinger_AA","rhsusf_ammo_basic_penetrator_base","rhsusf_ammo_basic_penetrator","rhs_ammo_M1069","rhs_ammo_M416","rhs_ammo_M829","rhs_ammo_M829A1","rhs_ammo_M829A2","rhs_ammo_M829A3","rhs_ammo_M830","rhs_ammo_M830A1","rhs_ammo_mk19m3_M384","rhs_ammo_mk19m3_M430I","rhs_ammo_mk19m3_M430I_penetrator","rhs_ammo_mk19m3_M1001","rhs_ammo_30x113mm_M789_HEDP","rhs_ammo_20mm_AP","rhs_ammo_127x99_Ball","rhs_ammo_127x99_Ball_Tracer_Red","rhs_ammo_127x99_Ball_Tracer_Green","rhs_ammo_127x99_Ball_Tracer_Yellow","rhs_ammo_127x99_SLAP","rhs_ammo_127x99_SLAP_Tracer_Red","rhs_ammo_127x99_SLAP_Tracer_Green","rhs_ammo_127x99_SLAP_Tracer_Yellow","rhs_ammo_Sidewinder_AA","rhs_ammo_Sidewinder_AA_heli","rhs_ammo_Hellfire_AT","rhs_ammo_Hellfire_AT_penetrator","rhs_ammo_agm65","rhs_ammo_ammo_agm65_penetrator","rhs_ammo_Hydra_HE","rhs_ammo_ammo_TOW_AT_penetrator","rhs_ammo_TOW2_AT_penetrator","rhs_ammo_ANALQ131","rhs_pod_hellfire","rhs_pod_FFAR","rhs_pod_FFAR_green","rhs_pod_hellfire_green","rhs_ammo_gbu12","rhsusf_B_300winmag","rhsusf_M33_Ball_M107","rhs_ammo_556x45_M855A1_Ball","rhs_ammo_556x45_M855A1_Ball_Red","rhs_ammo_556x45_M855A1_Ball_Green","rhs_ammo_556x45_M855A1_Ball_Yellow","rhs_ammo_556x45_Mk318_Ball","rhs_ammo_556x45_Mk262_Ball","rhs_ammo_556x45_blank","rhs_ammo_762x51_M80_Ball","rhs_ammo_762x51_M61_AP","rhs_ammo_762x51_M62_tracer","rhs_ammo_762x51_M80A1EPR_Ball","rhs_ammo_762x51_M82_blank","rhs_ammo_762x51_M118_Special_Ball","rhs_ammo_762x51_M993_Ball","rhs_ammo_m576_buckshot","rhs_ammo_12g_00buckshot","rhs_ammo_doomsday_buckshot","rhs_ammo_12g_slug","rhs_ammo_12g_FRAG","rhs_ammo_12g_HE","rhs_ammo_12gHEAP_penetrator","rhs_ammo_45ACP_MHP","rhs_ammo_9x19_FMJ","rhs_ammo_9x19_JHP","rhs_ammo_M136_rocket","rhs_ammo_M136_penetrator","rhs_ammo_M136_hp_rocket","rhs_ammo_M136_hp_penetrator","rhs_ammo_M136_hedp_rocket","rhs_ammo_M136_hedp_penetrator","rhsammo_fim92_missile","rhs_ammo_M_fgm148_AT","rhs_ammo_M_fgm148_AT_penetrator","rhsusf_m112_ammo","rhsusf_m112_ammo_scripted","rhsusf_m112x4_ammo","rhsusf_m112x4_ammo_scripted","rhsusf_mine_m19_ammo","rhsusf_40mm_HE","rhsusf_40mm_HEDP","rhs_ammo_40mmHEDP_penetrator","rhsusf_40mm_Practice","rhsusf_40mm_white","rhsusf_40mm_red","rhsusf_40mm_green","rhs_ammo_m67","rhs_ammo_m69","rhs_ammo_m84","rhs_ammo_an_m14_th3","rhs_ammo_m7a3_cs","rhs_ammo_mk3a2","rhs_ammo_an_m8hc","rhs_ammo_m18_green","rhs_ammo_m18_purple","rhs_ammo_m18_red","rhs_ammo_m18_yellow","rhs_ammo_recoil","rhs_ammo_902a","rhs_ammo_3d17","rhs_ammo_3d17_902B","rhs_ammo_smokegen","rhs_ammo_dazzler","rhs_ammo_3d17_shell","rhs_ammo_3d17_shell_902B","rhs_Laserbeam","rhs_ammo_br_base","rhs_ammo_br412","rhs_ammo_bm_base","rhs_ammo_bm25","rhs_ammo_bm8","rhs_ammo_bm4","rhs_ammo_bm23","rhs_ammo_3bm_base","rhs_ammo_3bm9","rhs_ammo_3bm12","rhs_ammo_3bm15","rhs_ammo_3bm17","rhs_ammo_3bm22","rhs_ammo_3bm26","rhs_ammo_3bm29","rhs_ammo_3bm32","rhs_ammo_3bm42","rhs_ammo_3bm42m","rhs_ammo_3bm46","rhs_ammo_bk_base","rhs_ammo_bk5","rhs_ammo_bk17","rhs_ammo_bk4","rhs_ammo_bk15","rhs_ammo_3bk_base","rhs_ammo_3bk12","rhs_ammo_3bk12_penetrator","rhs_ammo_heat_tandem","rhs_ammo_3bk14","rhs_ammo_3bk14_penetrator","rhs_ammo_3bk18","rhs_ammo_3bk18_penetrator","rhs_ammo_3bk18M","rhs_ammo_3bk18m_penetrator","rhs_ammo_3bk21","rhs_ammo_3bk21_penetrator","rhs_ammo_3bk29","rhs_ammo_3bk29_penetrator","rhs_ammo_3bk31","rhs_ammo_3bk31_penetrator","rhs_ammo_of_base","rhs_ammo_of412","rhs_ammo_of11","rhs_ammo_of28","rhs_ammo_of29","rhs_ammo_3of_base","rhs_ammo_3of_airburst","rhs_ammo_3of11","rhs_ammo_3of26","rhs_ammo_rpgShell_base","rhs_ammo_og15v","rhs_ammo_pg15v","rhs_ammo_pg15v_penetrator","rhs_ammo_9m41","rhs_ammo_3UOF17","rhs_ammo_3UOF19","rhs_ammo_3UOF191","rhs_ammo_3UOF191_airburst","rhs_ammo_3WOF27","rhs_ammo_3WB3","rhs_ammo_152_WP","rhs_ammo_3WOF93","rhs_ammo_3WS23","rhs_ammo_53WD546U","rhs_ammo_atgmCore_base","rhs_ammo_atgmBase_base","rhs_ammo_9m14m","rhs_ammo_9m14m_penetrator","rhs_ammo_9m112","rhs_ammo_9m112m","rhs_ammo_9m112_penetrator","rhs_ammo_9m112m_penetrator","rhs_ammo_9m113","rhs_ammo_9m113_penetrator","rhs_ammo_9m117","rhs_ammo_9m117_penetrator","rhs_ammo_9m118","rhs_ammo_9m118_penetrator","rhs_ammo_9m119","rhs_ammo_9m119_penetrator","rhs_ammo_9m119m","rhs_ammo_9m119m_penetrator","rhs_ammo_9m128","rhs_ammo_9m128_penetrator","rhs_ammo_9m133","rhs_ammo_9m133_penetrator","rhs_ammo_3m7","rhs_ammo_9m7_penetrator","rhs_ammo_9k114","rhs_ammo_9k114_penetrator","rhs_ammo_9m120","rhs_ammo_9m120_penetrator","rhs_ammo_9m127m","rhs_ammo_r73","rhs_ammo_ch29","rhs_ammo_ch29_penetrator","rhs_ammo_s8","rhs_ammo_s8_penetrator","rhs_ammo_s8DF","rhs_ammo_s8t","rhs_ammo_s8t_penetrator","rhs_ammo_s5_ub16","rhs_ammo_s5_ub32","rhs_ammo_b8v20a_pod","rhs_ammo_b8m1_pod","rhs_ammo_ub32_pod","rhs_ammo_ub16_pod","rhs_ammo_falanga_pod","rhs_ammo_ataka_tube","rhs_ammo_ataka_tube_2","rhs_ammo_upk23_pod","rhs_ammo_fab250","rhs_ammo_m21OF_HE","rhs_m21OF_fly","rhs_ammo_30x165mm_base","rhs_ammo_3ubr6","rhs_ammo_3ubr8","rhs_ammo_3uor6","rhs_ammo_3uof8","rhs_ammo_127x107mm","rhs_ammo_127x108mm","rhs_ammo_127x108mm_x5","rhs_ammo_145x115mm","rhs_ammo_BS32_145x115mm","RHS_ammo_23mm_AA","RHS_9M79_1_F","RHS_9N123F","RHS_9M79B","RHS_9M79_1_K","RHS_9N123K","RHS_9N24","rhs_B_545x39_Ball","rhs_B_545x39_7N10_Ball","rhs_B_545x39_7N22_Ball","rhs_B_545x39_7N24_Ball","rhs_B_545x39_Ball_Tracer_Green","rhs_B_762x54_Ball","rhs_B_762x54_Ball_Tracer_Green","rhs_B_762x54_7N1_Ball","rhs_B_762x39_Ball","rhs_B_762x39_Ball_89","rhs_B_762x39_Tracer","rhs_g_vog25","rhs_g_vog25p","rhs_g_vg40tb","rhs_g_vg40sz","rhs_g_grd50","rhs_g_grd100","rhs_g_grd200","rhs_mine_pmn2_ammo","rhs_mine_tm62m_ammo","R_PG32V_F","rhs_rpg26_rocket","rhs_rpg26_penetrator","rhs_rpg18_rocket","rhs_rpg18_penetrator","rhs_rpg7v2_pg7vl","rhs_rpg7v2_pg7vl_penetrator","rhs_rpg7v2_pg7vr","rhs_rpg7v2_pg7vr_penetrator","rhs_rpg7v2_tbg7v","rhs_rpg7v2_og7v","rhs_rshg2_rocket","rhs_ammo_9k32","rhs_ammo_9k38","rhs_B_9x19_7N21","rhs_B_9x18_57N181S","rhs_40mm_white","rhs_40mm_red","rhs_40mm_green","rhs_ammo_rgd5","rhs_ammo_rgn_base","rhs_ammo_rgn","rhs_ammo_rgn_sub","rhs_ammo_rgn_exp","rhs_ammo_rdg2_white","rhs_ammo_rdg2_black","rhs_ammo_nspn_yellow","rhs_ammo_nspn_red","rhs_ammo_nspn_green","rhs_ammo_nspd","rhs_ammo_fakel","rhs_ammo_fakels","rhs_ammo_zarya2","rhs_ammo_plamyam"];

waitUntil {!isNull player};

player addEventHandler ["Fired", {
	if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count SAFETY_ZONES > 0) then
	{
	_type = typeOf(_this select 6);

	if(_type in SPAWN_Restriction)then{
			hint format [" Tato munice je zde zakázaná: %1", _type];
			deleteVehicle (_this select 6);
			titleText [MESSAGE, "PLAIN", 3];
			};
	};
}];

_PlayerInAreas = [];
_OldPlayerInAreas = [];
_TriggerList = [];
_Debug = false;

//--- Initialization for an area ---//
_MarkerName	= "SAFETY_ZONES";
_Pos = getMarkerPos _MarkerName ;
_SpawnProtection = createTrigger ["EmptyDetector",_Pos];
_SpawnProtection setTriggerArea [75,75,0,true];
_SpawnProtection setTriggerActivation ["ANY","PRESENT",true];
_SpawnProtection setTriggerStatements ["","",""];
_TriggerList set [ count _TriggerList, [_SpawnProtection, WEST]];
//--- Initialization for an area ---//
/*
_MarkerName	= "respawn_east";
_Pos = getMarkerPos _MarkerName;
_SpawnProtection = createTrigger ["EmptyDetector",_Pos];
_SpawnProtection setTriggerArea [75,75,0,true];
_SpawnProtection setTriggerActivation ["ANY","PRESENT",true];
_SpawnProtection setTriggerStatements ["","",""];
_TriggerList set [ count _TriggerList, [_SpawnProtection, EAST]];
//--- Initialization for an area ---//
_MarkerName	= "respawn_guerrila";
_Pos = getMarkerPos _MarkerName;
_SpawnProtection = createTrigger ["EmptyDetector",_Pos];
_SpawnProtection setTriggerArea [75,75,0,true];
_SpawnProtection setTriggerActivation ["ANY","PRESENT",true];
_SpawnProtection setTriggerStatements ["","",""];
_TriggerList set [ count _TriggerList, [_SpawnProtection, INDEPENDENT]];
*/
sleep 1;
while{true}do{
	{
	_InZoneArea = _x select 0;
	_InZoneArea = list _InZoneArea;
	_SideZone 	= _x select 1;
	{
//--- for infantry ---//
			if(side _x == _SideZone)then{
				_x allowDamage false;
				_PlayerInAreas set [count _PlayerInAreas, _x];
			};
//--- for vehicle ---//
		if(side _x == _SideZone && ((_x isKindOf  "Air") ||(_x isKindOf  "Car")||(_x isKindOf  "Ship") ||(_x isKindOf  "Tank")||(_x isKindOf  "Helicopter")))then{
			if( count crew _x > 0)then{
					_friendlies = false;
					{
						if(side _x == _SideZone)then{_x allowDamage false;_PlayerInAreas set [count _PlayerInAreas, _x];};
					}forEach (crew _x);
				}else{_x allowDamage false;_PlayerInAreas set [count _PlayerInAreas, _x];};
			};
		}forEach _InZoneArea;
//--- Find the player who left the area and setDamage true ---//
		{
			if(!(_x in _PlayerInAreas))then{
				_x allowDamage true;
				if(_Debug)then{hint format ["Opustil obast základny- %1", _x];};
			}else{if(_Debug)then{hint format  ["Vstoupil do blasti základny- %1", _x];};};
		}forEach _OldPlayerInAreas;
	}foreach _TriggerList;
//--- refresh index---//
_OldPlayerInAreas = _PlayerInAreas;
_PlayerInAreas = [];
sleep 5;
};
