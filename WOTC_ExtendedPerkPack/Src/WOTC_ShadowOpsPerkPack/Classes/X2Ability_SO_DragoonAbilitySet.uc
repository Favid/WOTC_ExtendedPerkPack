class X2Ability_SO_DragoonAbilitySet extends XMBAbility config(SODragoon);

var config array<name> ShieldProtocolImmunities;
var config int ConventionalShieldProtocol, MagneticShieldProtocol, BeamShieldProtocol;
var config int ConventionalShieldsUp, MagneticShieldsUp, BeamShieldsUp;
var config float AegisDamageReduction;
var config int HeavyArmorBase, HeavyArmorBonus;
var config int BurstFireEnvironmentalDamage, BurstFireCoverDestructionChance, BurstFireHitChance;
var config float ECMDetectionModifier;
var config int TacticalSenseDodgeBonus, TacticalSenseMaxDodgeBonus;
var config int RestorationHealAmount, RestorationMaxHealAmount, RestorationIncreasedHealAmount, RestorationHealingBonusMultiplier;
var config name RestorationIncreasedHealProject;
var config int VanishCooldown;
var config int LightfootMobilityBonus;
var config float LightfootDetectionModifier;
var config int IronWillBonus;
var config int SensorOverlaysCritBonus;
var config int SuperchargeChargeBonus;
var config array<int> ReverseEngineeringHackBonus;
var config array<name> RocketeerAbilityNames;
var config int EatThisAimBonus, EatThisCritBonus, EatThisMaxTiles;
var config int InspirationDodgeBonus, InspirationWillBonus, InspirationMaxTiles;
var config int ShieldSurgeArmor;
var config array<name> PuppeteerAbilityNames;
var config int ShieldBatteryBonusCharges;
var config int OverkillBonusDamage;
var config int ShotgunFinesseMobilityBonus, ShotgunFinesseCritBonus;
var config name ShotgunFinesseWeaponCat;

var config int ShieldProtocolCharges, StealthProtocolCharges, RestoratonProtocolCharges, ChargeCharges, PhalanxProtocolCharges;
var config int StealthProtocolConventionalCharges, StealthProtocolMagneticCharges, StealthProtocolBeamCharges;
var config int RestorationProtocolConventionalCharges, RestorationProtocolMagneticCharges, RestorationProtocolBeamCharges;
var config int StasisFieldCharges;

var config int BurstFireCooldown, StasisFieldCooldown, PuppetProtocolCooldown;
var config int BurstFireAmmo;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
	
	Templates.AddItem(ShieldProtocol());
	Templates.AddItem(HeavyArmor());
	//Templates.AddItem(StealthProtocol());
	//Templates.AddItem(BurstFire());
	//Templates.AddItem(ShieldsUp());
	//Templates.AddItem(ECM());
	//Templates.AddItem(Rocketeer());
	//Templates.AddItem(Vanish());
	//Templates.AddItem(VanishTrigger());
	//Templates.AddItem(RestorationProtocol());
	//Templates.AddItem(StasisField());
	//Templates.AddItem(PuppetProtocol());
	//Templates.AddItem(TacticalSense());
	Templates.AddItem(AdvancedShieldProtocol());
	//Templates.AddItem(Lightfoot());
	Templates.AddItem(PurePassive('ShadowOps_Aegis', "img:///UILibrary_SODragoon.UIPerk_aegis", false));
	//Templates.AddItem(IronWill());
	//Templates.AddItem(SensorOverlays());
	//Templates.AddItem(Supercharge());
	//Templates.AddItem(Scout());
	//Templates.AddItem(Charge());
	//Templates.AddItem(EatThis());
	//Templates.AddItem(PurePassive('ShadowOps_DigitalWarfare', "img:///UILibrary_SODragoon.UIPerk_digitalwarfare", false));
	//Templates.AddItem(Inspiration());
	Templates.AddItem(PurePassive('ShadowOps_ShieldSurge', "img:///UILibrary_SODragoon.UIPerk_shieldsurge", false));
	//Templates.AddItem(PhalanxProtocol());
	//Templates.AddItem(Puppeteer());
	//Templates.AddItem(ShieldBattery());
	//Templates.AddItem(Overkill());
	//Templates.AddItem(ShotgunFinesse());

	return Templates;
}

static function X2AbilityTemplate ShieldProtocol(optional name TemplateName = 'ShadowOps_ShieldProtocol', optional string Icon = "img:///UILibrary_SODragoon.UIPerk_shieldprotocol", optional EActionPointCost Cost = eCost_Single)
{
	local X2AbilityTemplate                     Template;
	local X2Condition_UnitProperty              TargetProperty;
	local X2Condition_UnitEffects               EffectsCondition;
	local X2AbilityCharges                      Charges;
	local X2AbilityCost_Charges                 ChargeCost;

	`CREATE_X2ABILITY_TEMPLATE(Template, TemplateName);

	Template.IconImage = Icon;
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.Hostility = eHostility_Defensive;
	Template.bLimitTargetIcons = true;
	Template.DisplayTargetHitChance = false;
	Template.ShotHUDPriority = class'XMBAbility'.default.AUTO_PRIORITY;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SingleTargetWithSelf;

	Template.AbilityCosts.AddItem(ActionPointCost(Cost));

	Charges = new class 'X2AbilityCharges';
	Charges.InitialCharges = default.ShieldProtocolCharges;
	Template.AbilityCharges = Charges;

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);
	
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	TargetProperty = new class'X2Condition_UnitProperty';
	TargetProperty.ExcludeDead = true;
	TargetProperty.ExcludeHostileToSource = true;
	TargetProperty.ExcludeFriendlyToSource = false;
	TargetProperty.RequireSquadmates = true;
	Template.AbilityTargetConditions.AddItem(TargetProperty);

	EffectsCondition = new class'X2Condition_UnitEffects';
	EffectsCondition.AddExcludeEffect('ShieldProtocol', 'AA_UnitIsImmune');
	Template.AbilityTargetConditions.AddItem(EffectsCondition);

	Template.AddTargetEffect(ShieldProtocolEffect(Template.LocFriendlyName, Template.LocLongDescription));
	Template.AddTargetEffect(ShieldSurgeEffect());

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.bStationaryWeapon = true;
	Template.BuildNewGameStateFn = class'X2Ability_SpecialistAbilitySet'.static.AttachGremlinToTarget_BuildGameState;
	Template.BuildVisualizationFn = class'X2Ability_SpecialistAbilitySet'.static.GremlinSingleTarget_BuildVisualization;
	Template.bSkipPerkActivationActions = true;
	Template.bShowActivation = true;
	Template.PostActivationEvents.AddItem('ItemRecalled');

	Template.CustomSelfFireAnim = 'NO_DefenseProtocolA';

	Template.bCrossClassEligible = false;

	return Template;
}

static function X2AbilityTemplate AdvancedShieldProtocol()
{
	local X2AbilityTemplate                     Template;

	Template = ShieldProtocol('ShadowOps_AdvancedShieldProtocol', "img:///UILibrary_SODragoon.UIPerk_advancedshieldprotocol", eCost_Free);
	Template.OverrideAbilities.AddItem('ShadowOps_ShieldProtocol');

	return Template;
}	

static function X2Effect ShieldProtocolEffect(string FriendlyName, string LongDescription)
{
	local X2Effect_ShieldProtocol ShieldedEffect;

	ShieldedEffect = new class'X2Effect_ShieldProtocol';
	ShieldedEffect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnBegin);
	ShieldedEffect.ConventionalAmount = default.ConventionalShieldProtocol;
	ShieldedEffect.MagneticAmount = default.MagneticShieldProtocol;
	ShieldedEffect.BeamAmount = default.BeamShieldProtocol;
	ShieldedEffect.ImmuneTypes = default.ShieldProtocolImmunities;
	ShieldedEffect.AegisDamageReduction = default.AegisDamageReduction;
	ShieldedEffect.SetDisplayInfo(ePerkBuff_Bonus, FriendlyName, LongDescription, "img:///UILibrary_PerkIcons.UIPerk_adventshieldbearer_energyshield", true);

	return ShieldedEffect;
}

static function X2Effect ShieldSurgeEffect()
{
	local X2Effect_PersistentStatChange ArmorEffect;
	local X2AbilityTemplate ShieldSurgeTemplate;
	local XMBCondition_SourceAbilities Condition;

	`CREATE_X2ABILITY_TEMPLATE(ShieldSurgeTemplate, 'ShadowOps_ShieldSurge');

	ArmorEffect = new class'X2Effect_PersistentStatChange';
	ArmorEffect.BuildPersistentEffect(1, false, false, false, eGameRule_PlayerTurnBegin);
	ArmorEffect.AddPersistentStatChange(eStat_ArmorMitigation, default.ShieldSurgeArmor);
	ArmorEffect.SetDisplayInfo(ePerkBuff_Bonus, ShieldSurgeTemplate.LocFriendlyName, ShieldSurgeTemplate.LocLongDescription, "img:///UILibrary_SODragoon.UIPerk_shieldsurge", true);

	Condition = new class'XMBCondition_SourceAbilities';
	Condition.AddRequireAbility('ShadowOps_ShieldSurge', 'AA_AbilityUnavailable');
	ArmorEffect.TargetConditions.AddItem(Condition);

	return ArmorEffect;
}

static function X2AbilityTemplate HeavyArmor()
{
	local X2AbilityTemplate						BaseTemplate;
	local X2AbilityTemplate_Dragoon					Template;
	local X2AbilityTargetStyle                  TargetStyle;
	local X2AbilityTrigger						Trigger;
	local X2Effect_HeavyArmor                   HeavyArmorEffect;

	`CREATE_X2ABILITY_TEMPLATE(BaseTemplate, 'ShadowOps_HeavyArmor');
	Template = new class'X2AbilityTemplate_Dragoon'(BaseTemplate);

	// Icon Properties
	Template.IconImage = "img:///UILibrary_SODragoon.UIPerk_heavyarmor";

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	HeavyArmorEffect = new class'X2Effect_HeavyArmor';
	HeavyArmorEffect.Base = default.HeavyArmorBase;
	HeavyArmorEffect.Bonus = default.HeavyArmorBonus;
	HeavyArmorEffect.BuildPersistentEffect(1, true, true, true);
	HeavyArmorEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocLongDescription, Template.IconImage,,,Template.AbilitySourceName);
	Template.AddTargetEffect(HeavyArmorEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, default.HeavyArmorBase);
	Template.SetUIBonusStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, default.HeavyArmorBonus, HeavyArmorStatDisplay);

	Template.bCrossClassEligible = true;

	return Template;
}

static function bool HeavyArmorStatDisplay(XComGameState_Item InventoryItem)
{
	local X2ArmorTemplate ArmorTemplate;
	
	ArmorTemplate = X2ArmorTemplate(InventoryItem.GetMyTemplate());
	return (ArmorTemplate != none && ArmorTemplate.bHeavyWeapon);
}