//---------------------------------------------------------------------------------------
//  FILE:   XComDownloadableContentInfo_WOTC_ExtendedPerkPack.uc                                    
//           
//	Use the X2DownloadableContentInfo class to specify unique mod behavior when the 
//  player creates a new campaign or loads a saved game.
//  
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------

class X2DownloadableContentInfo_WOTC_ExtendedPerkPack extends X2DownloadableContentInfo;

/// <summary>
/// This method is run if the player loads a saved game that was created prior to this DLC / Mod being installed, and allows the 
/// DLC / Mod to perform custom processing in response. This will only be called once the first time a player loads a save that was
/// create without the content installed. Subsequent saves will record that the content was installed.
/// </summary>
static event OnLoadedSavedGame()
{}

/// <summary>
/// Called when the player starts a new campaign while this DLC / Mod is installed
/// </summary>
static event InstallNewCampaign(XComGameState StartState)
{}

static event OnPostTemplatesCreated()
{
    PatchAbilityForImposition('StandardShot');
    PatchAbilityForImposition('SniperStandardFire');
    PatchAbilityForImposition('LW2WotC_SnapShot');
    PatchAbilityForImposition('LW2WotC_ShootAnyone');

    PatchAbilityForBotnet('StandardShot');
    PatchAbilityForBotnet('SniperStandardFire');
    PatchAbilityForBotnet('LW2WotC_SnapShot');
    PatchAbilityForBotnet('LW2WotC_ShootAnyone');

    PatchAbilityForBloodlet('StandardShot');
    PatchAbilityForBloodlet('PistolStandardShot');
    PatchAbilityForBloodlet('SniperStandardFire');
    PatchAbilityForBloodlet('LW2WotC_SnapShot');
    PatchAbilityForBloodlet('LW2WotC_ShootAnyone');

    PatchAbilityForHavoc('Suppression');
    PatchAbilityForHavoc('LW2WotC_AreaSuppression');

    PatchSmokeGrenadeForCombatDrugs('SmokeGrenade');
    PatchSmokeGrenadeForCombatDrugs('SmokeGrenadeMk2');

}

static function PatchAbilityForImposition(name AbilityName)
{
	local X2AbilityTemplate Template;

	Template = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager().FindAbilityTemplate(AbilityName);

	if (Template != none)
	{
		Template.AddTargetEffect(class'X2Ability_ExtendedPerkPack'.static.ImpositionEffect());
	}
}

static function PatchAbilityForBotnet(name AbilityName)
{
	local X2AbilityTemplate Template;

	Template = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager().FindAbilityTemplate(AbilityName);

	if (Template != none)
	{
		Template.AddTargetEffect(class'X2Ability_ExtendedPerkPack'.static.BotnetEffect());
	}
}

static function PatchAbilityForBloodlet(name AbilityName)
{
	local X2AbilityTemplate Template;

	Template = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager().FindAbilityTemplate(AbilityName);

	if (Template != none)
	{
		Template.AddTargetEffect(class'X2Ability_ExtendedPerkPack'.static.BloodletEffect());
	}
}

static function PatchAbilityForHavoc(name AbilityName)
{
	local X2AbilityTemplate Template;

	Template = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager().FindAbilityTemplate(AbilityName);

	if (Template != none)
	{
	    Template.DamagePreviewFn = class'X2Ability_ExtendedPerkPack'.static.HavocDamagePreview;
	}
}

private static function PatchSmokeGrenadeForCombatDrugs(name ItemName)
{
	local X2ItemTemplateManager		ItemManager;
	local array<X2DataTemplate>		TemplateAllDifficulties;
	local X2DataTemplate			Template;
	local X2GrenadeTemplate			GrenadeTemplate;

	ItemManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
	ItemManager.FindDataTemplateAllDifficulties(ItemName, TemplateAllDifficulties);
	foreach TemplateAllDifficulties(Template)
	{
		GrenadeTemplate = X2GrenadeTemplate(Template);
		GrenadeTemplate.ThrownGrenadeEffects.AddItem(class'X2Ability_ExtendedPerkPack'.static.CombatDrugsEffect());
		GrenadeTemplate.LaunchedGrenadeEffects.AddItem(class'X2Ability_ExtendedPerkPack'.static.CombatDrugsEffect());
	}
}

static function bool AbilityTagExpandHandler(string InString, out string OutString)
{
	local name Type;

	Type = name(InString);
	switch(Type)
	{
		case 'CHIPAWAY_SHRED_CV':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.CHIPAWAY_SHRED_CV);
			return true;
		case 'CHIPAWAY_SHRED_LS':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.CHIPAWAY_SHRED_LS);
			return true;
		case 'CHIPAWAY_SHRED_MG':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.CHIPAWAY_SHRED_MG);
			return true;
		case 'CHIPAWAY_SHRED_CL':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.CHIPAWAY_SHRED_CL);
			return true;
		case 'CHIPAWAY_SHRED_BM':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.CHIPAWAY_SHRED_BM);
			return true;
		case 'CHIPAWAY_COOLDOWN':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.CHIPAWAY_COOLDOWN);
			return true;
		case 'CHIPAWAY_AMMO_COST':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.CHIPAWAY_AMMO_COST);
			return true;
		case 'MOMENTUM_AIM_BONUS':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.MOMENTUM_AIM_BONUS);
			return true;
		case 'MOMENTUM_CRIT_BONUS':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.MOMENTUM_CRIT_BONUS);
			return true;
		case 'MAIM_AMMO_COST':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.MAIM_AMMO_COST);
			return true;
		case 'MAIM_COOLDOWN':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.MAIM_COOLDOWN);
			return true;
		case 'LICKYOURWOUNDS_HEALAMOUNT':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.LICKYOURWOUNDS_HEALAMOUNT);
			return true;
		case 'LICKYOURWOUNDS_MAXHEALAMOUNT':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.LICKYOURWOUNDS_MAXHEALAMOUNT);
			return true;
		case 'PRESERVATION_DEFENSE_BONUS':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.PRESERVATION_DEFENSE_BONUS);
			return true;
		case 'PRESERVATION_DURATION':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.PRESERVATION_DURATION);
			return true;
		case 'STATIONARYTHREAT_DAMAGE_PER_TURN':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.STATIONARYTHREAT_DAMAGE_PER_TURN);
			return true;
		case 'STATIONARYTHREAT_DAMAGE_MAX_TURNS':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.STATIONARYTHREAT_DAMAGE_MAX_TURNS);
			return true;
		case 'RECHARGE_COOLDOWN_AMOUNT':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.RECHARGE_COOLDOWN_AMOUNT);
			return true;
		case 'PIERCETHEVEIL_DAMAGE_BONUS':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.PIERCETHEVEIL_DAMAGE_BONUS);
			return true;
		case 'PIERCETHEVEIL_AIM_BONUS':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.PIERCETHEVEIL_AIM_BONUS);
			return true;
		case 'PIERCETHEVEIL_ARMOR_PIERCING':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.PIERCETHEVEIL_ARMOR_PIERCING);
			return true;
		case 'PIERCETHEVEIL_COOLDOWN':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.PIERCETHEVEIL_COOLDOWN);
			return true;
		case 'THEBIGGERTHEYARE_AIM_BONUS':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.THEBIGGERTHEYARE_AIM_BONUS);
			return true;
		case 'CALLFORFIRE_COOLDOWN':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.CALLFORFIRE_COOLDOWN);
			return true;
		case 'KILLEMALL_COOLDOWN':
			OutString = string(class'X2Ability_Stolen'.default.KILLEMALL_COOLDOWN);
			return true;
		case 'KILLEMALL_AMMO_COST':
			OutString = string(class'X2Ability_Stolen'.default.KILLEMALL_AMMO_COST);
			return true;
		case 'IMPOSITION_AIM_PENALTY':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.IMPOSITION_AIM_PENALTY);
			return true;
		case 'FIRSTSTRIKE_CONCEALED_DAMAGE_BONUS':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.FIRSTSTRIKE_CONCEALED_DAMAGE_BONUS);
			return true;
		case 'FIRSTSTRIKE_FLANKING_DAMAGE_BONUS':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.FIRSTSTRIKE_FLANKING_DAMAGE_BONUS);
			return true;
		case 'DISABLINGSHOT_AMMO_COST':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.DISABLINGSHOT_AMMO_COST);
			return true;
		case 'DISABLINGSHOT_COOLDOWN':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.DISABLINGSHOT_COOLDOWN);
			return true;
		case 'DISABLINGSHOT_STUN_ACTIONS':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.DISABLINGSHOT_STUN_ACTIONS);
			return true;
		case 'BOTNET_COOLDOWN':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.BOTNET_COOLDOWN);
			return true;
		case 'BOTNET_HACK_DEFENSE_PENALTY':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.BOTNET_HACK_DEFENSE_PENALTY);
			return true;
		case 'RESUPPLY_CHARGES':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.RESUPPLY_CHARGES);
			return true;
		case 'IMMUNIZE_CHARGES':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.IMMUNIZE_CHARGES);
			return true;
		case 'AMMOCONSERVATION_COOLDOWN':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.AMMOCONSERVATION_COOLDOWN);
			return true;
		case 'DEDICATION_MOBILITY':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.DEDICATION_MOBILITY);
			return true;
		case 'DEDICATION_COOLDOWN':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.DEDICATION_COOLDOWN);
			return true;
		case 'TRIAGE_RADIUS':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.TRIAGE_RADIUS);
			return true;
		case 'TRIAGE_HEAL_AMOUNT':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.TRIAGE_HEAL_AMOUNT);
			return true;
		case 'TRIAGE_CHARGES':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.TRIAGE_CHARGES);
			return true;
		case 'STIMULATE_RANGE_IN_TILES':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.STIMULATE_RANGE_IN_TILES);
			return true;
		case 'BLOODLET_DURATION':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.BLOODLET_DURATION);
			return true;
		case 'BLOODLET_TICK_DAMAGE':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.BLOODLET_TICK_DAMAGE);
			return true;
		case 'BLOODLET_BLEEDING_CHANCE_PERCENT':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.BLOODLET_BLEEDING_CHANCE_PERCENT);
			return true;
		case 'BLINDINGFIRE_AMMO_COST':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.BLINDINGFIRE_AMMO_COST);
			return true;
		case 'BLINDINGFIRE_COOLDOWN':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.BLINDINGFIRE_COOLDOWN);
			return true;
		case 'BLINDINGFIRE_SOURCE_AIM_PENALTY':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.BLINDINGFIRE_SOURCE_AIM_PENALTY);
			return true;
		case 'BLINDINGFIRE_TARGET_AIM_PENALTY':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.BLINDINGFIRE_TARGET_AIM_PENALTY);
			return true;
		case 'COMBATDRUGS_AIM':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.COMBATDRUGS_AIM);
			return true;
		case 'COMBATDRUGS_CRIT':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.COMBATDRUGS_CRIT);
			return true;
		case 'SALTINTHEWOUND_DAMAGE_BONUS':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.SALTINTHEWOUND_DAMAGE_BONUS);
			return true;
		case 'UNLOAD_COOLDOWN':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.UNLOAD_COOLDOWN);
			return true;
		case 'UNLOAD_DAMAGE_PERCENT_MALUS':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.UNLOAD_DAMAGE_PERCENT_MALUS);
			return true;
		case 'AMBUSH_COOLDOWN':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.AMBUSH_COOLDOWN);
			return true;
		case 'RENEWAL_HEALAMOUNT':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.RENEWAL_HEALAMOUNT);
			return true;
		case 'RENEWAL_MAXHEALAMOUNT':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.RENEWAL_MAXHEALAMOUNT);
			return true;
		case 'RENEWAL_RADIUS':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.RENEWAL_RADIUS);
			return true;
		case 'WARNINGSHOT_COOLDOWN':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.WARNINGSHOT_COOLDOWN);
			return true;
		case 'VITALSTRIKE_DAMAGE_BONUS':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.VITALSTRIKE_DAMAGE_BONUS);
			return true;
		case 'VITALSTRIKE_COOLDOWN':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.VITALSTRIKE_COOLDOWN);
			return true;
		case 'FIELDMEDIC_BONUS_ITEMS':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.FIELDMEDIC_BONUS_ITEMS);
			return true;
		case 'BLEND_TURNS_CONCEALED':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.BLEND_TURNS_CONCEALED);
			return true;
		case 'SHOULDERTOLEANON_RADIUS':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.SHOULDERTOLEANON_RADIUS);
			return true;
		case 'SHOULDERTOLEANON_AIM_BONUS':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.SHOULDERTOLEANON_AIM_BONUS);
			return true;
		case 'BOLSTEREDWALL_DODGE_BONUS':
			OutString = string(class'X2Ability_ExtendedPerkPack'.default.BOLSTEREDWALL_DODGE_BONUS);
			return true;
		default: 
			return false;
	}
}