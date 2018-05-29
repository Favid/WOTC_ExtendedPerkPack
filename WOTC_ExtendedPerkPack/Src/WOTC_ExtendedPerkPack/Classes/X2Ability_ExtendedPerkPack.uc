class X2Ability_ExtendedPerkPack extends XMBAbility config (ExtendedPerkPack);

var config int CHIPAWAY_SHRED_CV;
var config int CHIPAWAY_SHRED_LS;
var config int CHIPAWAY_SHRED_MG;
var config int CHIPAWAY_SHRED_CL;
var config int CHIPAWAY_SHRED_BM;
var config int CHIPAWAY_COOLDOWN;
var config int CHIPAWAY_AMMO_COST;
var config bool CHIPAWAY_AWC;
var config bool CONCENTRATION_AWC;
var config bool LIKELIGHTNING_AWC;
var config int STATIONARYTHREAT_DAMAGE_PER_TURN;
var config int STATIONARYTHREAT_DAMAGE_MAX_TURNS;
var config bool STATIONARYTHREAT_AWC;
var config bool OPPORTUNIST_AWC;
var config int MAIM_AMMO_COST;
var config int MAIM_COOLDOWN;
var config int MAIM_DURATION;
var config bool MAIM_AWC;
var config bool QUICKPATCH_AWC;
var config int PRESERVATION_DEFENSE_BONUS;
var config int PRESERVATION_DURATION;
var config bool PRESERVATION_AWC;
var config int LICKYOURWOUNDS_HEALAMOUNT;
var config int LICKYOURWOUNDS_MAXHEALAMOUNT;
var config bool LICKYOURWOUNDS_AWC;
var config int MOMENTUM_AIM_BONUS;
var config int MOMENTUM_CRIT_BONUS;
var config bool MOMENTUM_AWC;
var config int THOUSANDSTOGO_ACTIVATIONS_PER_TURN;
var config bool THOUSANDSTOGO_AWC;
var config int RECHARGE_COOLDOWN_AMOUNT;
var config bool RECHARGE_AWC;
var config int PIERCETHEVEIL_AIM_BONUS;
var config int PIERCETHEVEIL_DAMAGE_BONUS;
var config int PIERCETHEVEIL_ARMOR_PIERCING;
var config int PIERCETHEVEIL_INCREASE_COOLDOWN_AMOUNT;
var config int PIERCETHEVEIL_COOLDOWN;
var config bool PIERCETHEVEIL_AWC;
var config int THEBIGGERTHEYARE_AIM_BONUS;
var config bool THEBIGGERTHEYARE_AWC;
var config int CALLFORFIRE_RADIUS;
var config int CALLFORFIRE_COOLDOWN;
var config bool CALLFORFIRE_AWC;
var config int LOCKNLOAD_AMMO_TO_RELOAD;
var config bool LOCKNLOAD_AWC;
var config int IMPOSITION_DURATION;
var config int IMPOSITION_AIM_PENALTY;
var config bool IMPOSITION_AWC;
var config bool TRENCHWARFARE_AWC;
var config bool COMPENSATION_AWC;
var config int FIRSTSTRIKE_CONCEALED_DAMAGE_BONUS;
var config int FIRSTSTRIKE_FLANKING_DAMAGE_BONUS;
var config bool FIRSTSTRIKE_AWC;
var config int DISABLINGSHOT_STUN_ACTIONS;
var config int DISABLINGSHOT_AMMO_COST;
var config int DISABLINGSHOT_COOLDOWN;
var config bool DISABLINGSHOT_AWC;
var config int BLEND_TURNS_CONCEALED;
var config bool BLEND_AWC;
var config int BOTNET_HACK_DEFENSE_PENALTY;
var config int BOTNET_COOLDOWN;
var config bool BOTNET_AWC;
var config bool READYFORANYTHING_AWC;
var config int RESUPPLY_AMMO_TO_RELOAD;
var config int RESUPPLY_CHARGES;
var config bool RESUPPLY_AWC;
var config int IMMUNIZE_CHARGES;
var config bool IMMUNIZE_AWC;
var config bool RUSH_AWC;
var config bool ARMEDTOTHETEETH_AWC;
var config bool AMMOCONSERVATION_AWC;
var config int AMMOCONSERVATION_COOLDOWN;
var config bool WELLPROTECTED_AWC;
var config int DEDICATION_MOBILITY;
var config int DEDICATION_COOLDOWN;
var config bool DEDICATION_AWC;
var config int TRIAGE_RADIUS;
var config int TRIAGE_HEAL_AMOUNT;
var config int TRIAGE_CHARGES;
var config bool TRIAGE_AWC;
var config bool STEADFAST_AWC;
var config bool CORPSMAN_AWC;
var config int FIELDMEDIC_BONUS_ITEMS;
var config bool FIELDMEDIC_AWC;
var config int STIMULATE_RANGE_IN_TILES;
var config bool STIMULATE_AWC;
var config int BLOODLET_DURATION;
var config int BLOODLET_TICK_DAMAGE;
var config int BLOODLET_BLEEDING_CHANCE_PERCENT;
var config bool BLOODLET_AWC;
var config int BLINDINGFIRE_AMMO_COST;
var config int BLINDINGFIRE_COOLDOWN;
var config int BLINDINGFIRE_CONE_TILE_WIDTH;
var config int BLINDINGFIRE_CONE_LENGTH;
var config int BLINDINGFIRE_SOURCE_AIM_PENALTY;
var config int BLINDINGFIRE_TARGET_AIM_PENALTY;
var config bool BLINDINGFIRE_AWC;
var config bool QUICKFEET_AWC;
var config int COMBATDRUGS_AIM;
var config int COMBATDRUGS_CRIT;
var config bool COMBATDRUGS_AWC;
var config int SALTINTHEWOUND_DAMAGE_BONUS;
var config bool SALTINTHEWOUND_AWC;
var config int UNLOAD_AIM_BONUS;
var config bool UNLOAD_ALLOW_CRIT;
var config int UNLOAD_COOLDOWN;
var config int UNLOAD_DAMAGE_PERCENT_MALUS;
var config bool UNLOAD_AWC;
var config int AMBUSH_COOLDOWN;
var config bool AMBUSH_AWC;
var config int RENEWAL_HEALAMOUNT;
var config int RENEWAL_MAXHEALAMOUNT;
var config int RENEWAL_RADIUS;
var config bool RENEWAL_AWC;
var config int WARNINGSHOT_AMMO_COST;
var config int WARNINGSHOT_COOLDOWN;
var config bool WARNINGSHOT_AWC;
var config int VITALSTRIKE_RUPTURE;
var config int VITALSTRIKE_AMMO_COST;
var config int VITALSTRIKE_COOLDOWN;
var config int VITALSTRIKE_DAMAGE_BONUS;
var config bool VITALSTRIKE_AWC;
var config int OPENFIRE_AIM;
var config int OPENFIRE_CRIT;
var config bool OPENFIRE_AWC;
var config bool HAVOC_AWC;
var config bool FINESSE_AWC;

var localized string LocCombatDrugsEffect;
var localized string LocCombatDrugsEffectDescription;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
    
	Templates.AddItem(ChipAway());
	Templates.AddItem(Concentration());
	Templates.AddItem(LikeLightning());
	Templates.AddItem(StationaryThreat());
	Templates.AddItem(Opportunist());
	Templates.AddItem(Maim());
    Templates.AddItem(QuickPatch());
    Templates.AddItem(Preservation());
    Templates.AddItem(LickYourWounds());
    Templates.AddItem(Momentum());
    Templates.AddItem(ThousandsToGo());
    Templates.AddItem(Recharge());
    Templates.AddItem(PierceTheVeil());
    Templates.AddItem(TheBiggerTheyAre());
    Templates.AddItem(CallForFire());
    Templates.AddItem(LockNLoad());
    Templates.AddItem(Imposition());
    Templates.AddItem(TrenchWarfare());
    Templates.AddItem(Compensation());
    Templates.AddItem(FirstStrike());
    Templates.AddItem(DisablingShot());
    Templates.AddItem(Blend());
    Templates.AddItem(Botnet());
    Templates.AddItem(ReadyForAnything());
    Templates.AddItem(Resupply());
    Templates.AddItem(Immunize());
    Templates.AddItem(Rush());
    Templates.AddItem(ArmedToTheTeeth());
    Templates.AddItem(AmmoConservation());
    Templates.AddItem(WellProtected());
    Templates.AddItem(Dedication());
    Templates.AddItem(Triage());
    Templates.AddItem(Steadfast());
    Templates.AddItem(Corpsman());
    Templates.AddItem(FieldMedic());
    Templates.AddItem(Stimulate());
    Templates.AddItem(Bloodlet());
    Templates.AddItem(BlindingFire());
    Templates.AddItem(QuickFeet());
    Templates.AddItem(CombatDrugs());
    Templates.AddItem(SaltInTheWound());
    Templates.AddItem(Unload());
    Templates.AddItem(Unload2());
    Templates.AddItem(UnloadDamageBonus());
    Templates.AddItem(Ambush());
    Templates.AddItem(AmbushShot());
    Templates.AddItem(Renewal());
    Templates.AddItem(WarningShot());
    Templates.AddItem(VitalStrike());
    Templates.AddItem(OpenFire());
    Templates.AddItem(Havoc());
    Templates.AddItem(Finesse());
    
	return Templates;
}

// Chip Away
// (AbilityName="F_ChipAway", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Fire a shot that shreds additional armor. Cooldown-based.
static function X2AbilityTemplate ChipAway()
{
	local X2AbilityTemplate Template;

	// Create the template using a helper function
	Template = Attack('F_ChipAway', "img:///UILibrary_FavidsPerkPack.UIPerk_ChipAway", default.CHIPAWAY_AWC, none, default.AUTO_PRIORITY, eCost_WeaponConsumeAll, default.CHIPAWAY_AMMO_COST);
	
    // Cooldown
	AddCooldown(Template, default.CHIPAWAY_COOLDOWN);
	
	// Add a secondary ability to provide bonuses on the shot
	AddSecondaryAbility(Template, ChipAwayBonuses());

	return Template;
}

static function X2AbilityTemplate ChipAwayBonuses()
{
	local X2AbilityTemplate Template;
	local XMBEffect_ConditionalBonus Effect;
	local XMBCondition_AbilityName Condition;

	// Create a conditional bonus effect
	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'F_ChipAway_Bonuses';

	// The bonus adds shred damage dependent on tech level
	Effect.AddShredModifier(default.CHIPAWAY_SHRED_CV, eHit_Success, 'conventional');
	Effect.AddShredModifier(default.CHIPAWAY_SHRED_LS, eHit_Success, 'laser_lw');
	Effect.AddShredModifier(default.CHIPAWAY_SHRED_MG, eHit_Success, 'magnetic');
	Effect.AddShredModifier(default.CHIPAWAY_SHRED_CL, eHit_Success, 'coilgun_lw');
	Effect.AddShredModifier(default.CHIPAWAY_SHRED_BM, eHit_Success, 'beam');
	
	// The bonus only applies to the Chip Away ability
	Condition = new class'XMBCondition_AbilityName';
	Condition.IncludeAbilityNames.AddItem('F_ChipAway');
	Effect.AbilityTargetConditions.AddItem(Condition);

	// Create the template using a helper function
	Template = Passive('F_ChipAway_Bonuses', "img:///UILibrary_FavidsPerkPack.UIPerk_ChipAway", false, Effect);

	// The Chip Away ability will show up as an active ability, so hide the icon for the passive damage effect
	HidePerkIcon(Template);

	return Template;
}

// Concentration
// (AbilityName="F_Concentration")
// Your grazing shots are automatically upgraded to normal hits. Passive.
static function X2AbilityTemplate Concentration()
{
	local X2AbilityTemplate Template;
	local XMBEffect_ChangeHitResultForAttacker Effect;

	// Create an effect that will change attack hit results
	Effect = new class'XMBEffect_ChangeHitResultForAttacker';
	Effect.EffectName = 'Concentration';
    Effect.IncludeHitResults.AddItem(eHit_Graze);
	Effect.NewResult = eHit_Success;

	// Create the template using a helper function
	Template = Passive('F_Concentration', "img:///UILibrary_FavidsPerkPack.UIPerk_Concentration", default.CONCENTRATION_AWC, Effect);

	return Template;
}

// Like Lightning
// (AbilityName="F_LikeLightning", ApplyToWeaponSlot=eInvSlot_SecondaryWeapon)
// When Run and Gun is activated, your Arc Thrower cooldown is immediately removed and your next Arc Thrower shot that turn does not cost an action. Passive.
static function X2AbilityTemplate LikeLightning()
{
	local X2Effect_ReduceCooldowns ReduceCooldownEffect;
	local X2AbilityTemplate Template;
	local XMBCondition_AbilityName NameCondition;

	// Effect that reduces the cooldown of arc thrower abilities
	ReduceCooldownEffect = new class'X2Effect_ReduceCooldowns';
	ReduceCooldownEffect.ReduceAll = true;
	ReduceCooldownEffect.AbilitiesToTick.AddItem('ArcthrowerStun');
	ReduceCooldownEffect.AbilitiesToTick.AddItem('EMPulser');

	// Create a triggered ability that will activate whenever the unit uses an ability that meets the condition
	Template = SelfTargetTrigger('F_LikeLightning', "img:///UILibrary_XPerkIconPack.UIPerk_lightning_chevron", default.LIKELIGHTNING_AWC, ReduceCooldownEffect, 'AbilityActivated');

	// Only when Run and Gun abilities are used
	NameCondition = new class'XMBCondition_AbilityName';
	NameCondition.IncludeAbilityNames.AddItem('RunAndGun');
	NameCondition.IncludeAbilityNames.AddItem('LW2WotC_RunAndGun');
	AddTriggerTargetCondition(Template, NameCondition);

	// Show a flyover when activated
	Template.bShowActivation = true;

	// Add secondary ability that will refund arc thrower action points when used while Run and Gun is active
	AddSecondaryAbility(Template, LikeLightningRefund());

	return Template;
}

static function X2AbilityTemplate LikeLightningRefund()
{
	local XMBEffect_AbilityCostRefund Effect;
	local XMBCondition_AbilityName AbilityNameCondition;
	local X2Condition_UnitValue RunAndGunCondition;
	
	// Create an effect that will refund the cost of attacks
	Effect = new class'XMBEffect_AbilityCostRefund';
	Effect.EffectName = 'F_LikeLightning_Refund';
	Effect.TriggeredEvent = 'F_LikeLightning_Refund';
	Effect.CountValueName = 'F_LikeLightning_RefundCounter';
	Effect.MaxRefundsPerTurn = 1;

	// The bonus only applies to arc thrower shots
	AbilityNameCondition = new class'XMBCondition_AbilityName';
	AbilityNameCondition.IncludeAbilityNames.AddItem('ArcThrowerStun');
	AbilityNameCondition.IncludeAbilityNames.AddItem('EMPulser');
	Effect.AbilityTargetConditions.AddItem(AbilityNameCondition);

	// Only refunds if Run and Gun has been activated
	RunAndGunCondition = new class'X2Condition_UnitValue';
	RunAndGunCondition.AddCheckValue('RunAndGun_SuperKillCheck', 0, eCheck_GreaterThan,,,'AA_RunAndGunNotUsed');
	Effect.AbilityShooterConditions.AddItem(RunAndGunCondition);

	// Create the template using a helper function
	return Passive('F_LikeLightning_Refund', "img:///UILibrary_XPerkIconPack.UIPerk_lightning_chevron", false, Effect);
}

// Stationary Threat
// (AbilityName="F_StationaryThreat", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Gain plus one damage to your primary weapon for each turn that you do not move.
static function X2AbilityTemplate StationaryThreat()
{
	local X2AbilityTemplate Template;
	local XMBEffect_ConditionalBonus Effect;
	local XMBValue_UnitValue Value;
	local X2Effect_SetUnitValue ValueEffect;

	// Create a value that uses a unit value.
	Value = new class'XMBValue_UnitValue';
	
	// The value that counts the number of turns without movement
	Value.UnitValueName = 'F_StationaryThreat_TurnsWithoutMovement';
	 
	// Create a conditional bonus effect
	Effect = new class'XMBEffect_ConditionalBonus';

	// The effect adds damage each turn
	Effect.AddDamageModifier(default.STATIONARYTHREAT_DAMAGE_PER_TURN);

	// The effect stacks a configurable number of times
	Effect.ScaleValue = Value;
	Effect.ScaleMax = default.STATIONARYTHREAT_DAMAGE_MAX_TURNS;

	// Restrict to the weapon matching this ability
	Effect.AbilityTargetConditions.AddItem(default.MatchingWeaponCondition);

	// Create the template using a helper function
	Template = Passive('F_StationaryThreat', "img:///UILibrary_XPerkIconPack.UIPerk_rifle_blaze", default.STATIONARYTHREAT_AWC, Effect);
	
	// Default the counter to 0
	ValueEffect = new class'X2Effect_SetUnitValue';
	ValueEffect.UnitName = 'F_StationaryThreat_TurnsWithoutMovement';
	ValueEffect.NewValueToSet = 0;
	ValueEffect.CleanupType = eCleanup_BeginTactical;
	Template.AddTargetEffect(ValueEffect);

	// Secondary ability that increments 'turns without movement' by 1 at the start of each turn
	AddSecondaryAbility(Template, StationaryThreatBeginTurn());

	// Secondary ability that sets 'turns without movement' to 0 when a move is made
	AddSecondaryAbility(Template, StationaryThreatMovement());

	return Template;
}

static function X2AbilityTemplate StationaryThreatBeginTurn()
{
	local X2AbilityTemplate Template;
	local X2Effect_IncrementUnitValue ValueEffect;
	
	// Increments counter by one at the start of each turn
	ValueEffect = new class'X2Effect_IncrementUnitValue';
	ValueEffect.UnitName = 'F_StationaryThreat_TurnsWithoutMovement';
	ValueEffect.NewValueToSet = 1;
	ValueEffect.CleanupType = eCleanup_BeginTactical;

	// Create a triggered ability that will activate whenever the unit's turn beings
	Template = SelfTargetTrigger('F_StationaryThreat_BeginTurn', "img:///UILibrary_XPerkIconPack.UIPerk_rifle_blaze", false, ValueEffect, 'PlayerTurnBegun', eFilter_Player);

	return Template;
}

static function X2AbilityTemplate StationaryThreatMovement()
{
	local X2AbilityTemplate Template;
	local X2Effect_SetUnitValue ValueEffect;
	
	// Resets counter to 0 when a move is made
	ValueEffect = new class'X2Effect_SetUnitValue';
	ValueEffect.UnitName = 'F_StationaryThreat_TurnsWithoutMovement';
	ValueEffect.NewValueToSet = 0;
	ValueEffect.CleanupType = eCleanup_BeginTactical;

	// Create a triggered ability that will activate whenever the unit moves
	Template = SelfTargetTrigger('F_StationaryThreat_Movement', "img:///UILibrary_XPerkIconPack.UIPerk_rifle_blaze", false, ValueEffect, 'UnitMoveFinished');

	return Template;
}

// Opportunist
// (AbilityName="F_Opportunist")
// Reaction fire shots now ignore half of cover bonuses
// NOTE: Extended Information lies about this ability's bonuses in the flyover
static function X2AbilityTemplate Opportunist()
{
	local X2AbilityTemplate Template;
	local XMBEffect_ConditionalBonus LowCoverBonusEffect;
	local XMBEffect_ConditionalBonus FullCoverBonusEffect;

	Template = Passive('F_Opportunist', "img:///UILibrary_FavidsPerkPack.UIPerk_Opportunist", default.OPPORTUNIST_AWC, none);

    // Bonus for when targets are in low cover
	LowCoverBonusEffect = new class'XMBEffect_ConditionalBonus';
	LowCoverBonusEffect.AbilityTargetConditions.AddItem(default.HalfCoverCondition);
	LowCoverBonusEffect.AbilityTargetConditions.AddItem(default.ReactionFireCondition);
	LowCoverBonusEffect.AddToHitModifier(class'X2AbilityToHitCalc_StandardAim'.default.LOW_COVER_BONUS / 2);
    AddSecondaryEffect(Template, LowCoverBonusEffect);
    
    // Bonus for when targets are in full cover
	FullCoverBonusEffect = new class'XMBEffect_ConditionalBonus';
	FullCoverBonusEffect.AbilityTargetConditions.AddItem(default.FullCoverCondition);
	FullCoverBonusEffect.AbilityTargetConditions.AddItem(default.ReactionFireCondition);
	FullCoverBonusEffect.AddToHitModifier(class'X2AbilityToHitCalc_StandardAim'.default.HIGH_COVER_BONUS / 2);
    AddSecondaryEffect(Template, FullCoverBonusEffect);

    return Template;
}

// Maim
// (AbilityName="F_Maim", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Fire a shot that immobilizes the target until the end of their next turn. Cooldown-based.
static function X2AbilityTemplate Maim()
{
	local X2AbilityTemplate Template;
	local X2Effect_Immobilize Effect;
	
	// Create the template using a helper function
	Template = Attack('F_Maim', "img:///UILibrary_FavidsPerkPack.UIPerk_Maim", default.MAIM_AWC, none, class'UIUtilities_Tactical'.const.CLASS_LIEUTENANT_PRIORITY, eCost_WeaponConsumeAll, default.MAIM_AMMO_COST);

	// Cooldown
	AddCooldown(Template, default.MAIM_COOLDOWN);

	// Effect
	Effect = new class'X2Effect_Immobilize';
	Effect.EffectName = 'F_Maim_Immobilize';
	Effect.DuplicateResponse = eDupe_Refresh;
	Effect.BuildPersistentEffect(default.MAIM_DURATION, false, true, , eGameRule_PlayerTurnEnd);
	Effect.AddPersistentStatChange(eStat_Mobility, 0, MODOP_Multiplication);
	Effect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, Template.LocLongDescription, Template.IconImage, true, , Template.AbilitySourceName);
	Effect.VisualizationFn = EffectFlyOver_Visualization;
	Template.AddTargetEffect(Effect);

	return Template;
}

// Quick Patch
// (AbilityName="F_QuickPatch")
// Using a Medikit does not cost an action. Passive.
static function X2AbilityTemplate QuickPatch()
{
	local XMBEffect_AbilityCostRefund Effect;
	local XMBCondition_AbilityName AbilityNameCondition;
	
	// Create an effect that will refund the cost of the action
	Effect = new class'XMBEffect_AbilityCostRefund';
	Effect.EffectName = 'F_QuickPatch';
	Effect.TriggeredEvent = 'F_QuickPatch';

	// The bonus only applies to medikit abilities
	AbilityNameCondition = new class'XMBCondition_AbilityName';
	AbilityNameCondition.IncludeAbilityNames.AddItem('MedikitHeal');
	AbilityNameCondition.IncludeAbilityNames.AddItem('NanoMedikitHeal');
	AbilityNameCondition.IncludeAbilityNames.AddItem('MedikitStabilize');
	AbilityNameCondition.IncludeAbilityNames.AddItem('Sedate');
	Effect.AbilityTargetConditions.AddItem(AbilityNameCondition);

	// Create the template using a helper function
	return Passive('F_QuickPatch', "img:///UILibrary_XPerkIconPack.UIPerk_medkit_chevron", default.QUICKPATCH_AWC, Effect);
}

// Preservation
// (AbilityName="F_Preservation")
// When your concealment is broken, gain a bonus to defense for a few turns. Passive.
static function X2AbilityTemplate Preservation()
{
	local X2AbilityTemplate Template;
	local X2Effect_PersistentStatChange DefenseEffect;

	// Create a persistent stat change effect that grants a defense bonus
	DefenseEffect = new class'X2Effect_PersistentStatChange';
	DefenseEffect.EffectName = 'F_PreservationEffect';
	DefenseEffect.AddPersistentStatChange(eStat_Defense, default.PRESERVATION_DEFENSE_BONUS);
	
	// Prevent the effect from applying to a unit more than once
	DefenseEffect.DuplicateResponse = eDupe_Refresh;

	// The effect lasts for a specified duration
	DefenseEffect.BuildPersistentEffect(default.PRESERVATION_DURATION, false, true, false, eGameRule_PlayerTurnBegin);
	
	// Add a visualization that plays a flyover over the target unit
	DefenseEffect.VisualizationFn = EffectFlyOver_Visualization;

	// Ability is triggered when concealment is broken
	Template = SelfTargetTrigger('F_Preservation', "img:///UILibrary_XPerkIconPack.UIPerk_stealth_defense2", default.PRESERVATION_AWC, DefenseEffect, 'UnitConcealmentBroken', eFilter_Unit);
	
	// Trigger abilities don't appear as passives. Add a passive ability icon.
	AddIconPassive(Template);

	return Template;
}

// Lick Your Wounds
// (AbilityName="F_LickYourWounds")
// Hunker Down restores some health and removes poison, burning, and acid burning. Passive.
static function X2AbilityTemplate LickYourWounds()
{
	local X2AbilityTemplate Template;
	local XMBCondition_AbilityName NameCondition;
	local X2Effect_ApplyHeal HealEffect;
	
	// Create a triggered ability that will activate whenever the unit uses an ability that meets the condition
	Template = SelfTargetTrigger('F_LickYourWounds', "img:///UILibrary_FavidsPerkPack.UIPerk_LickYourWounds", default.LICKYOURWOUNDS_AWC, none, 'AbilityActivated');

	// Only trigger with Hunker Down
	NameCondition = new class'XMBCondition_AbilityName';
	NameCondition.IncludeAbilityNames.AddItem('HunkerDown');
	AddTriggerTargetCondition(Template, NameCondition);

	// Restore health effect
	HealEffect = new class'X2Effect_ApplyHeal';
	HealEffect.HealAmount = default.LICKYOURWOUNDS_HEALAMOUNT;
	HealEffect.MaxHealAmount = default.LICKYOURWOUNDS_MAXHEALAMOUNT;
	HealEffect.HealthRegeneratedName = 'LickYourWoundsHeal';
	Template.AddTargetEffect(HealEffect);

	// Heal the status effects that a Medkit would heal
	Template.AddTargetEffect(class'X2Ability_SpecialistAbilitySet'.static.RemoveAllEffectsByDamageType());
	
	// Trigger abilities don't appear as passives. Add a passive ability icon.
	AddIconPassive(Template);

	return Template;
}

// Momentum
// (AbilityName="F_Momentum", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Grants increased aim and critical chance if you have moved this turn. Passive.
static function X2AbilityTemplate Momentum()
{
	local X2AbilityTemplate Template;
	local XMBEffect_ConditionalBonus OffenseEffect;
	local X2Condition_UnitValue Condition;

	// Create a conditional bonus effect
	OffenseEffect = new class'XMBEffect_ConditionalBonus';

	// Add the aim and crit bonuses
	OffenseEffect.AddToHitModifier(default.MOMENTUM_AIM_BONUS, eHit_Success);
	OffenseEffect.AddToHitModifier(default.MOMENTUM_CRIT_BONUS, eHit_Crit);

	// Only if you have moved this turn
	Condition = new class'X2Condition_UnitValue';
	Condition.AddCheckValue('MovesThisTurn', 0, eCheck_GreaterThan);
	OffenseEffect.AbilityShooterConditions.AddItem(Condition);
	
	// Create the template using a helper function
	Template = Passive('F_Momentum', "img:///UILibrary_FavidsPerkPack.UIPerk_Momentum", default.MOMENTUM_AWC, OffenseEffect);

	return Template;
}

// Thousands To Go
// (AbilityName="F_ThousandsToGo", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Once per turn, after killing an enemy with your primary weapon, you may take an additional non-movement action. Passive.
static function X2AbilityTemplate ThousandsToGo()
{
	local X2Effect_GrantActionPoints Effect;
	local X2AbilityTemplate Template;
	local X2Condition_UnitValue ValueCondition;
	local X2Effect_IncrementUnitValue IncrementEffect;

	// Effect adds a Run and Gun action point
	Effect = new class'X2Effect_GrantActionPoints';
	Effect.NumActionPoints = 1;
	Effect.PointType = class'X2CharacterTemplateManager'.default.RunAndGunActionPoint;

	// Create a triggered ability that will activate whenever the unit uses an ability that meets the condition
	Template = SelfTargetTrigger('F_ThousandsToGo', "img:///UILibrary_FavidsPerkPack.UIPerk_ThousandsToGo", default.THOUSANDSTOGO_AWC, Effect, 'KillMail');
    
    // Only trigger on kills with the matching weapon
	AddTriggerTargetCondition(Template, default.MatchingWeaponCondition);
    
	// Limit activations
	ValueCondition = new class'X2Condition_UnitValue';
	ValueCondition.AddCheckValue('F_ThousandsToGo_Activations', default.THOUSANDSTOGO_ACTIVATIONS_PER_TURN, eCheck_LessThan);
	Template.AbilityTargetConditions.AddItem(ValueCondition);

    // Create an effect that will increment the unit value
	IncrementEffect = new class'X2Effect_IncrementUnitValue';
	IncrementEffect.UnitName = 'F_ThousandsToGo_Activations';
	IncrementEffect.NewValueToSet = 1; // This means increment by one -- stupid property name
	IncrementEffect.CleanupType = eCleanup_BeginTurn;
    Template.AddTargetEffect(IncrementEffect);

	// Trigger abilities don't appear as passives. Add a passive ability icon.
	AddIconPassive(Template);

	// Show a flyover when activated
	Template.bShowActivation = true;

	return Template;
}

// Recharge
// (AbilityName="F_Recharge", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Killing an enemy with your primary weapon reduces the cooldown of all abilities. Passive.
static function X2AbilityTemplate Recharge()
{
	local X2AbilityTemplate Template;
	local X2Effect_ReduceCooldowns Effect;

	// Create an effect that reduces all cooldowns
	Effect = new class'X2Effect_ReduceCooldowns';
	Effect.Amount = default.RECHARGE_COOLDOWN_AMOUNT;
	Effect.ReduceAll = false;
	
	// Create a triggered ability that activates whenever the unit gets a kill
	Template = SelfTargetTrigger('F_Recharge', "img:///UILibrary_FavidsPerkPack.UIPerk_Recharge", default.RECHARGE_AWC, Effect, 'KillMail');
    
	// Effect only applies to matching weapon
	AddTriggerTargetCondition(Template, default.MatchingWeaponCondition);

	// Trigger abilities don't appear as passives. Add a passive ability icon.
	AddIconPassive(Template);

	// Show a flyover when activated
	Template.bShowActivation = true;

	return Template;
}

// Pierce The Veil
// (AbilityName="F_PierceTheVeil", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Activated ability that confers bonus aim, damage, and armor piercing to organic targets with your primary weapon, while increasing the cooldown of all of your other abilities. Cooldown-based.
static function X2AbilityTemplate PierceTheVeil()
{
	local XMBEffect_ConditionalBonus ShootingEffect;
	local X2AbilityTemplate Template;
	local X2Condition_UnitProperty				OrganicCondition;
	local X2Effect_IncreaseCooldowns CooldownEffect;

	// Create a stat change effect that grants an aim bonus, damage bonus, and armor piercing bonus
	ShootingEffect = new class'XMBEffect_ConditionalBonus';
	ShootingEffect.EffectName = 'F_PierceTheVeilBonuses';
	ShootingEffect.AddToHitModifier(default.PIERCETHEVEIL_AIM_BONUS);
	ShootingEffect.AddDamageModifier(default.PIERCETHEVEIL_DAMAGE_BONUS);
	ShootingEffect.AddArmorPiercingModifier(default.PIERCETHEVEIL_ARMOR_PIERCING);

	// Only against organics 
	OrganicCondition = new class'X2Condition_UnitProperty';
	OrganicCondition.ExcludeRobotic = true;
	ShootingEffect.AbilityTargetConditions.AddItem(OrganicCondition);

	// Only with the associated weapon
	ShootingEffect.AbilityTargetConditions.AddItem(default.MatchingWeaponCondition);

	// Prevent the effect from applying to a unit more than once
	ShootingEffect.DuplicateResponse = eDupe_Refresh;

	// The effect lasts for one turn
	ShootingEffect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnBegin);
	
	// Activated ability that targets user
	Template = SelfTargetActivated('F_PierceTheVeil', "img:///UILibrary_FavidsPerkPack.UIPerk_AmplifiedShot", default.PIERCETHEVEIL_AWC, ShootingEffect, class'UIUtilities_Tactical'.const.CLASS_COLONEL_PRIORITY, eCost_Free);
	
	// Cannot be used while burning, etc.
	Template.AddShooterEffectExclusions();

	// Cooldown
	AddCooldown(Template, default.PIERCETHEVEIL_COOLDOWN);

	// Show a flyover when activated
	Template.bShowActivation = true;

	// Now the effect to increase cooldowns
	CooldownEffect = new class'X2Effect_IncreaseCooldowns';
	CooldownEffect.Amount = default.PIERCETHEVEIL_INCREASE_COOLDOWN_AMOUNT;
	CooldownEffect.IncreaseAll = false;
	CooldownEffect.OnlyAlreadyOnCooldown = false;
	Template.AddTargetEffect(CooldownEffect);

	return Template;
}

// The Bigger They Are
// (AbilityName="F_TheBiggerTheyAre")
// Grants increased aim against targets that cannot take cover. Passive.
static function X2AbilityTemplate TheBiggerTheyAre()
{
	local X2AbilityTemplate Template;
	local XMBEffect_ConditionalBonus Effect;

	// Create a conditional bonus effect
	Effect = new class'XMBEffect_ConditionalBonus';

	// Add the aim bonus
	Effect.AddToHitModifier(default.THEBIGGERTHEYARE_AIM_BONUS);

	// Target must not be allowed to take cover (like MECs and Drones)
	Effect.AbilityTargetConditions.AddItem(default.CantTakeCoverCondition);
	
	// Create the template using a helper function
	Template = Passive('F_TheBiggerTheyAre', "img:///UILibrary_FavidsPerkPack.UIPerk_TheBiggerTheyAre", default.THEBIGGERTHEYARE_AWC, Effect);

	return Template;
}

// Call For Fire
// (AbilityName="F_CallForFire")
// Enter overwatch. All allies in a radius around you also enter overwatch.
static function X2AbilityTemplate CallForFire()
{
    local X2Effect_AddOverwatchActionPoints     Effect;
	local X2AbilityTemplate                     Template;
	local X2AbilityMultiTarget_Radius           RadiusMultiTarget;
    local X2Condition_UnitProperty              Condition;
    
    // Effect granting an overwatch shot
	Effect = new class'X2Effect_AddOverwatchActionPoints';

    // Activated ability that targets user
	Template = SelfTargetActivated('F_CallForFire', "img:///UILibrary_XPerkIconPack.UIPerk_overwatch_circle", default.CALLFORFIRE_AWC, Effect, class'UIUtilities_Tactical'.const.CLASS_COLONEL_PRIORITY, eCost_SingleConsumeAll);
	
	// The ability targets the unit that has it, but also effects all nearby units that meet the conditions on the multitarget effect.
	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.fTargetRadius = default.CALLFORFIRE_RADIUS;
	RadiusMultiTarget.bIgnoreBlockingCover = true;
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;
	Template.AddMultiTargetEffect(Effect);

    // Only affects living allies
	Condition = new class'X2Condition_UnitProperty';
	Condition.RequireWithinRange = true;
	Condition.ExcludeHostileToSource = true;
	Condition.ExcludeFriendlyToSource = false;
	Condition.ExcludeDead = true; 
	Template.AbilityMultiTargetConditions.AddItem(Condition);
    
	// Cooldown
	AddCooldown(Template, default.CALLFORFIRE_COOLDOWN);

	// Show a flyover when activated
	Template.bShowActivation = true;

    // Do a pointing animation
	Template.CustomFireAnim = 'HL_SignalPoint';
    Template.bSkipFireAction = false;
    
    // Make the overwatch sound when used
	Template.AbilityConfirmSound = "Unreal2DSounds_OverWatch";

	return Template;
}

// Lock 'N Load
// (AbilityName="F_LockNLoad", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Kills with your primary weapon restore one ammo. Passive.
static function X2AbilityTemplate LockNLoad()
{
	local X2AbilityTemplate Template;
	local X2Effect_ReloadPrimaryWeapon Effect;

	// Create an effect that reduces all cooldowns
	Effect = new class'X2Effect_ReloadPrimaryWeapon';
	Effect.AmmoToReload = default.LOCKNLOAD_AMMO_TO_RELOAD;
	
	// Create a triggered ability that activates whenever the unit gets a kill
	Template = SelfTargetTrigger('F_LockNLoad', "img:///UILibrary_XPerkIconPack.UIPerk_reload_shot", default.LOCKNLOAD_AWC, Effect, 'KillMail');
    
	// Effect only applies to matching weapon
	AddTriggerTargetCondition(Template, default.MatchingWeaponCondition);

	// Trigger abilities don't appear as passives. Add a passive ability icon.
	AddIconPassive(Template);

	// Show a flyover when activated
	Template.bShowActivation = true;

	return Template;
}

// Imposition
// (AbilityName="F_Imposition")
// Standard shots with the unit's primary weapon lowers the target's aim until next turn. Passive.
static function X2AbilityTemplate Imposition()
{
	local X2AbilityTemplate Template;

	// Start with the passive template
	Template = Passive('F_Imposition', "img:///UILibrary_FavidsPerkPack.UIPerk_Imposition", default.IMPOSITION_AWC, none);
	
	return Template;
}

// Added to StandardShot in OnPostTemplatesCreated()
static function X2Effect_PersistentStatChange ImpositionEffect()
{
	local X2AbilityTemplate Template;
	local X2Effect_PersistentStatChange		Effect;
	local X2Condition_AbilityProperty       Condition;

    // Get the template that we'll use for this effect's display info
    Template = Imposition();

    // Effect that reduces aim
	Effect = new class'X2Effect_PersistentStatChange';
	Effect.EffectName = 'F_Imposition_AimPenalty';
	Effect.DuplicateResponse = eDupe_Refresh;
	Effect.BuildPersistentEffect(default.IMPOSITION_DURATION, false, false, false, eGameRule_PlayerTurnBegin);
	Effect.AddPersistentStatChange(eStat_Offense, default.IMPOSITION_AIM_PENALTY);
	Effect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, Template.LocLongDescription, Template.IconImage, true, , Template.AbilitySourceName);
	Effect.VisualizationFn = EffectFlyOver_Visualization;
	Effect.bApplyOnMiss = true;

    // Only apply if shooter has Imposition passive
	Condition = new class'X2Condition_AbilityProperty';
	Condition.OwnerHasSoldierAbilities.AddItem('F_Imposition');
	Effect.TargetConditions.AddItem(Condition);

	return Effect;
}

// Trench Warfare
// (AbilityName="F_TrenchWarfare")
// If you get at least one kill during your turn, automatically hunker down at the end of it. Passive.
static function X2AbilityTemplate TrenchWarfare()
{
	local X2AbilityTemplate				Template;
	local X2Effect_IncrementUnitValue   ValueEffect;
	
	// Increments counter by one at the start of each turn
	ValueEffect = new class'X2Effect_IncrementUnitValue';
	ValueEffect.UnitName = 'F_TrenchWarfare_KillsThisTurn';
	ValueEffect.NewValueToSet = 1;
	ValueEffect.CleanupType = eCleanup_BeginTurn;
    
	// Create a triggered ability that runs when the owner gets a kill
	Template = SelfTargetTrigger('F_TrenchWarfare', "img:///UILibrary_FavidsPerkPack.UIPerk_TrenchWarfare", default.TRENCHWARFARE_AWC, ValueEffect, 'KillMail');

	// Trigger abilities don't appear as passives. Add a passive ability icon.
	AddIconPassive(Template);

    // Show flyover after a kill
    Template.bShowActivation = true;

    // Secondary ability that activates Hunker Down at the end of the turn if you got a kill
    AddSecondaryAbility(Template, TrenchWarfareActivator());

	return Template;
}

static function X2AbilityTemplate TrenchWarfareActivator()
{
    local X2Effect_GrantActionPoints ActionPointEffect;
	local X2Effect_ImmediateAbilityActivation HunkerDownEffect;
	local X2AbilityTemplate Template;
	local X2Condition_UnitEffects EffectsCondition;
	local X2Condition_UnitValue ValueCondition;

	// Create a triggered ability that runs at the end of the player's turn
	Template = SelfTargetTrigger('F_TrenchWarfare_Activator', "img:///UILibrary_FavidsPerkPack.UIPerk_TrenchWarfare", false, none, 'PlayerTurnEnded', eFilter_Player);

	// Require not already hunkered down
	EffectsCondition = new class'X2Condition_UnitEffects';
	EffectsCondition.AddExcludeEffect('HunkerDown', 'AA_UnitIsImmune');
	Template.AbilityTargetConditions.AddItem(EffectsCondition);

	// Require that a kill has been made
	ValueCondition = new class'X2Condition_UnitValue';
	ValueCondition.AddCheckValue('F_TrenchWarfare_KillsThisTurn', 0, eCheck_GreaterThan);
	Template.AbilityTargetConditions.AddItem(ValueCondition);

	// Hunkering requires an action point, so grant one if the unit is out of action points
	ActionPointEffect = new class'X2Effect_GrantActionPoints';
	ActionPointEffect.PointType = class'X2CharacterTemplateManager'.default.DeepCoverActionPoint;
	ActionPointEffect.NumActionPoints = 1;
	ActionPointEffect.bApplyOnlyWhenOut = true;
	AddSecondaryEffect(Template, ActionPointEffect);

	// Activate the Hunker Down ability
	HunkerDownEffect = new class'X2Effect_ImmediateAbilityActivation';
	HunkerDownEffect.EffectName = 'ImmediateHunkerDown';
	HunkerDownEffect.AbilityName = 'HunkerDown';
	HunkerDownEffect.BuildPersistentEffect(1, false, true, , eGameRule_PlayerTurnBegin);
	AddSecondaryEffect(Template, HunkerDownEffect);

	return Template;
}

// Compensation
// (AbilityName="F_Compensation")
// Firing your sniper rifle with two actions will refund one of those actions. Passive.
static function X2AbilityTemplate Compensation()
{
    local XMBEffect_AbilityCostRefund Effect;
	local XMBCondition_AbilityName AbilityNameCondition;

	// Create an effect that will refund the cost of attacks
	Effect = new class'XMBEffect_AbilityCostRefund';
	Effect.EffectName = 'F_Compensation_Refund';
	Effect.TriggeredEvent = 'F_Compensation_Refund';

	// Only refund once per turn
	Effect.CountValueName = 'F_Compensation_RefundCounter';
	Effect.MaxRefundsPerTurn = 1;

    // Only refund one action point instead of all
    Effect.bRefundSinglePoint = true;

	// The bonus only applies to standard sniper rifle shots
	AbilityNameCondition = new class'XMBCondition_AbilityName';
	AbilityNameCondition.IncludeAbilityNames.AddItem('SniperStandardFire');
	Effect.AbilityTargetConditions.AddItem(AbilityNameCondition);

	// Create the template using a helper function
	return Passive('F_Compensation', "img:///UILibrary_XPerkIconPack.UIPerk_sniper_chevron_x2", default.COMPENSATION_AWC, Effect);
}

// First Strike
// (AbilityName="F_FirstStrike", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Grants a large damage bonus while concealed, and a small damage bonus while flanking. Passive.
static function X2AbilityTemplate FirstStrike()
{
	local X2AbilityTemplate Template;
    local X2Condition_UnitProperty   ConcealedCondition;
	local XMBEffect_ConditionalBonus ConcealedBonusEffect;
	local XMBEffect_ConditionalBonus FlankingBonusEffect;

	ConcealedCondition = new class'X2Condition_UnitProperty';
	ConcealedCondition.ExcludeFriendlyToSource = false;
	ConcealedCondition.IsConcealed = true;

    // Bonus while concealed
	ConcealedBonusEffect = new class'XMBEffect_ConditionalBonus';
	ConcealedBonusEffect.AddDamageModifier(default.FIRSTSTRIKE_CONCEALED_DAMAGE_BONUS);
	ConcealedBonusEffect.AbilityTargetConditions.AddItem(default.MatchingWeaponCondition);
	ConcealedBonusEffect.AbilityTargetConditions.AddItem(ConcealedCondition);

	Template = Passive('F_FirstStrike', "img:///UILibrary_XPerkIconPack.UIPerk_stealth_shot2", default.FIRSTSTRIKE_AWC, ConcealedBonusEffect);

    // Bonus while flanking
	FlankingBonusEffect = new class'XMBEffect_ConditionalBonus';
	FlankingBonusEffect.AddDamageModifier(default.FIRSTSTRIKE_FLANKING_DAMAGE_BONUS);
	FlankingBonusEffect.AbilityTargetConditions.AddItem(default.MatchingWeaponCondition);
	FlankingBonusEffect.AbilityTargetConditions.AddItem(default.FlankedCondition);
    AddSecondaryEffect(Template, FlankingBonusEffect);

	return Template;
}

// Disabling Shot
// (AbilityName="F_DisablingShot", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Fire a shot that stuns the target. This attack cannot critically hit.
static function X2AbilityTemplate DisablingShot()
{
	local X2AbilityTemplate              Template;
	local X2Effect_Stunned	             StunnedEffect;
    local X2AbilityToHitCalc_StandardAim ToHitCalc;

	// Create the template using a helper function
	Template = Attack('F_DisablingShot', "img:///UILibrary_XPerkIconPack.UIPerk_shot_repair", default.DISABLINGSHOT_AWC, none, class'UIUtilities_Tactical'.const.CLASS_SERGEANT_PRIORITY, eCost_WeaponConsumeAll, default.DISABLINGSHOT_AMMO_COST);
	
	// Create Stun effect
	StunnedEffect = class'X2StatusEffects'.static.CreateStunnedStatusEffect(default.DISABLINGSHOT_STUN_ACTIONS, 100, false);
	StunnedEffect.bRemoveWhenSourceDies = false;
	Template.AddTargetEffect(StunnedEffect);
	
	// Custom hit calc to disallow critical hits
	ToHitCalc = new class'X2AbilityToHitCalc_StandardAim';
	ToHitCalc.bAllowCrit = false;
	Template.AbilityToHitCalc = ToHitCalc;
	Template.AbilityToHitOwnerOnMissCalc = ToHitCalc;

	// Cooldown
	AddCooldown(Template, default.DISABLINGSHOT_COOLDOWN);

	return Template;
}

// Blend
// (AbilityName="F_Blend")
// Immediately grants concealment that is automatically broken at the beginning of next turn.
static function X2AbilityTemplate Blend()
{
    local X2AbilityTemplate     Template;
	local X2Effect_SetUnitValue ValueEffect;

    // Start with a copy of the Ranger's Conceal ability
    Template = class'X2Ability_RangerAbilitySet'.static.Stealth('F_Blend');
	Template.IconImage = "img:///UILibrary_XPerkIconPack.UIPerk_stealth_blaze";
    Template.bCrossClassEligible = default.BLEND_AWC;

    // Remove costs so we can add our own
    Template.AbilityCosts.Length = 0;
	Template.AbilityCosts.AddItem(new class'X2AbilityCost_Charges');
	Template.AbilityCosts.AddItem(default.FreeActionCost);

    // Add an effect that sets our counter value
	ValueEffect = new class'X2Effect_SetUnitValue';
	ValueEffect.UnitName = 'F_Blend_Activated';
	ValueEffect.NewValueToSet = 1; // start at 1
	ValueEffect.CleanupType = eCleanup_BeginTactical;
    Template.AddTargetEffect(ValueEffect);

    // Ability that will increment counter for number of turns concealed by Blend
    AddSecondaryAbility(Template, BlendConcealmentCounter());

    // Ability that will remove concealment on the start of next turn
    AddSecondaryAbility(Template, BlendConcealmentRemover());

    // Reset the counter when concealment is lost
    AddSecondaryAbility(Template, BlendConcealmentLostListener());

    return Template;
}

static function X2AbilityTemplate BlendConcealmentCounter()
{
    local X2AbilityTemplate     Template;
	local X2Effect_IncrementUnitValue ValueEffect;
    local X2Condition_UnitValue ValueCondition;
    
	// Increment counter by 1 each turn
	ValueEffect = new class'X2Effect_IncrementUnitValue';
	ValueEffect.UnitName = 'F_Blend_Activated';
	ValueEffect.NewValueToSet = 1;
	ValueEffect.CleanupType = eCleanup_BeginTactical;

	// Create a triggered ability that will activate whenever the unit's turn beings - priority set to occur before the remove ability
	Template = SelfTargetTrigger('F_Blend_ConcealmentCounter', "img:///UILibrary_XPerkIconPack.UIPerk_stealth_blaze", false, ValueEffect, 'PlayerTurnBegun', eFilter_Player, 51);
    
    // Only fires if our counter is at least 1, meaning Blend has been used
	ValueCondition = new class'X2Condition_UnitValue';
	ValueCondition.AddCheckValue('F_Blend_Activated', 0, eCheck_GreaterThan);
	Template.AbilityTargetConditions.AddItem(ValueCondition);

    return Template;
}

static function X2AbilityTemplate BlendConcealmentRemover()
{
    local X2AbilityTemplate     Template;
    local X2Condition_UnitValue ValueCondition;

	// Create a triggered ability that will activate whenever the unit's turn beings
	Template = SelfTargetTrigger('F_Blend_ConcealmentRemover', "img:///UILibrary_XPerkIconPack.UIPerk_stealth_blaze", false, new class'X2Effect_BreakUnitConcealment', 'PlayerTurnBegun', eFilter_Player, 50);

    // Only fires if our counter is greater than max number of turns
	ValueCondition = new class'X2Condition_UnitValue';
	ValueCondition.AddCheckValue('F_Blend_Activated', default.BLEND_TURNS_CONCEALED, eCheck_GreaterThan);
	Template.AbilityTargetConditions.AddItem(ValueCondition);

    return Template;
}

static function X2AbilityTemplate BlendConcealmentLostListener()
{
	local X2Effect_SetUnitValue ValueEffect;

    // Reset the counter for Blend when concealment is lost
	ValueEffect = new class'X2Effect_SetUnitValue';
	ValueEffect.UnitName = 'F_Blend_Activated';
	ValueEffect.NewValueToSet = 0;
	ValueEffect.CleanupType = eCleanup_BeginTactical;

	// Create a triggered ability that will activate whenever the unit breaks concealment
	return SelfTargetTrigger('F_Blend_ConcealmentLost', "img:///UILibrary_XPerkIconPack.UIPerk_stealth_blaze", false, ValueEffect, 'UnitConcealmentBroken');
}

// Botnet
// (AbilityName="F_Botnet")
// While active, standard shots from all allies lower their target's hack defense.
static function X2AbilityTemplate Botnet()
{
	local X2AbilityTemplate Template;
    local X2Effect_Persistent Effect;

	// Activated ability that targets user
	Template = SelfTargetActivated('F_Botnet', "img:///UILibrary_XPerkIconPack.UIPerk_gremlin_circle", default.BOTNET_AWC, none, class'UIUtilities_Tactical'.const.CLASS_COLONEL_PRIORITY, eCost_Free);
	Template.bShowActivation = true;

    // Has a mutli-target effect that grants a dummy effect to all allies
	Template.AbilityMultiTargetStyle = new class'X2AbilityMultiTarget_AllAllies';
    Effect = new class'X2Effect_Persistent';
    Effect.EffectName = 'F_Botnet_Valid';
	Effect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnBegin);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.LocLongDescription, Template.IconImage, true, , Template.AbilitySourceName);
	Template.AddMultiTargetEffect(Effect);

    // Cooldown
    AddCooldown(Template, default.BOTNET_COOLDOWN);

	return Template;
}

// Added to StandardShot in OnPostTemplatesCreated()
static function X2Effect_PersistentStatChange BotnetEffect()
{
	local X2Effect_PersistentStatChange		Effect;
	local X2Condition_UnitEffectsOnSource   Condition;
	local X2Condition_UnitProperty          Condition_UnitProperty;

    // Only on robots
	Condition_UnitProperty = new class'X2Condition_UnitProperty';
	Condition_UnitProperty.ExcludeOrganic = true;
	Condition_UnitProperty.TreatMindControlledSquadmateAsHostile = true;
    
    // Effect that reduces hack defense
	Effect = class'X2StatusEffects'.static.CreateHackDefenseChangeStatusEffect(default.BOTNET_HACK_DEFENSE_PENALTY, Condition_UnitProperty);

    // Only apply if shooter has the required Botnet effect
	Condition = new class'X2Condition_UnitEffectsOnSource';
	Condition.AddRequireEffect('F_Botnet_Valid', 'AA_MissingRequiredEffect');
	Effect.TargetConditions.AddItem(Condition);

	return Effect;
}

// Ready For Anything
// (AbilityName="F_ReadyForAnything", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// When you make a standard attack with your primary weapon you automatically enter overwatch.
static function X2AbilityTemplate ReadyForAnything()
{
    //local X2Effect_ThreatAssessment         Effect;
	local X2AbilityTemplate                 Template;
	local X2Condition_AbilitySourceWeapon   AmmoCondition;
    local X2Effect_AddOverwatchActionPoints   Effect;
	
    // Effect granting an overwatch shot
	Effect = new class'X2Effect_AddOverwatchActionPoints';
    
	Template = SelfTargetTrigger('F_ReadyForAnything', "img:///UILibrary_XPerkIconPack.UIPerk_overwatch_shot_2", default.READYFORANYTHING_AWC, Effect, 'StandardShotActivated');
    Template.bShowActivation = true;
    
    // Only trigger with the matching weapon
	AddTriggerTargetCondition(Template, default.MatchingWeaponCondition);

    // Require that the user has ammo left
	AmmoCondition = new class'X2Condition_AbilitySourceWeapon';
	AmmoCondition.AddAmmoCheck(0, eCheck_GreaterThan);
	AddTriggerTargetCondition(Template, AmmoCondition);
	
	// Trigger abilities don't appear as passives. Add a passive ability icon.
	AddIconPassive(Template);

    return Template;
}

// Resupply
// (AbilityName="F_Resupply", ApplyToWeaponSlot=eInvSlot_SecondaryWeapon)
// Your GREMLIN moves to every ally, reloading the ammo in their primary weapon.
static function X2AbilityTemplate Resupply()
{
	local X2AbilityTemplate Template;
	local X2AbilityMultiTarget_AllAllies MultiTargetingStyle;
	local X2Condition_UnitProperty TargetCondition;
	local X2Effect_ReloadPrimaryWeapon Effect;

	Template = SelfTargetActivated('F_Resupply', "img:///UILibrary_FavidsPerkPack.UIPerk_Resupply", default.RESUPPLY_AWC, none);

	// Create an effect that reloads ammo
	Effect = new class'X2Effect_ReloadPrimaryWeapon';
	Effect.AmmoToReload = default.RESUPPLY_AMMO_TO_RELOAD;
	Template.AddMultiTargetEffect(Effect);

    // Targets all allies
	MultiTargetingStyle = new class'X2AbilityMultiTarget_AllAllies';
	MultiTargetingStyle.bAllowSameTarget = true;
	MultiTargetingStyle.NumTargetsRequired = 1; //At least one ally must be a valid target
	Template.AbilityMultiTargetStyle = MultiTargetingStyle;

    // Allied squadmates only
	TargetCondition = new class'X2Condition_UnitProperty';
	TargetCondition.ExcludeHostileToSource = true;
	TargetCondition.ExcludeFriendlyToSource = false;
	TargetCondition.RequireSquadmates = true;
	Template.AbilityMultiTargetConditions.AddItem(TargetCondition);

	// Targets must want a reload
	Template.AbilityMultiTargetConditions.AddItem(new class 'X2Condition_WantsReload');
    
	// Gremlin animation code
	Template.BuildNewGameStateFn = class'X2Ability_SpecialistAbilitySet'.static.SendGremlinToOwnerLocation_BuildGameState;
	Template.BuildVisualizationFn = class'X2Ability_SpecialistAbilitySet'.static.GremlinRestoration_BuildVisualization;
	Template.bSkipFireAction = true;
	Template.bShowActivation = true;
	Template.bStationaryWeapon = true;
	Template.bSkipPerkActivationActions = true;
	Template.PostActivationEvents.AddItem('ItemRecalled');
	Template.TargetingMethod = class'X2TargetingMethod_GremlinAOE';
	Template.ActivationSpeech = 'Reloading';

    // Charges
	AddCharges(Template, default.RESUPPLY_CHARGES);

	return Template;
}

// Immunize
// (AbilityName="F_Immunize", ApplyToWeaponSlot=eInvSlot_SecondaryWeapon)
// Your GREMLIN flies to an ally, granting them immunity to damage until the beginning of next turn.
static function X2AbilityTemplate Immunize()
{
	local X2AbilityTemplate                     Template;
    local X2Effect_DamageImmune                 Effect;

    // Effect granting immunity until next turn
    Effect = new class'X2Effect_DamageImmune';
	Effect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnBegin);

    Template = TargetedBuff('F_Immunize', "img:///UILibrary_XPerkIconPack.UIPerk_shield_gremlin", default.IMMUNIZE_AWC, Effect, default.AUTO_PRIORITY, eCost_Single);

    // Charges
    AddCharges(Template, default.IMMUNIZE_CHARGES);
    
	// Gremlin animation code
	Template.BuildNewGameStateFn = class'X2Ability_SpecialistAbilitySet'.static.SendGremlinToOwnerLocation_BuildGameState;
	Template.BuildVisualizationFn = class'X2Ability_SpecialistAbilitySet'.static.GremlinSingleTarget_BuildVisualization;
	Template.bShowActivation = true;
	Template.bStationaryWeapon = true;
	Template.bSkipPerkActivationActions = true;
	Template.PostActivationEvents.AddItem('ItemRecalled');
    
    // for later ref
	Template.CustomSelfFireAnim = 'NO_DefenseProtocolA';

	return Template;
}

// Rush
// (AbilityName="F_Rush", ApplyToWeaponSlot=eInvSlot_SecondaryWeapon)
// Run towards an enemy and stab them with your knife. Can only perform with single-action moves. Costs a single action and does not end the turn.
static function X2AbilityTemplate Rush()
{
	local X2AbilityTemplate                 Template;
	local array<name>                       SkipExclusions;
    local X2AbilityTarget_MovingMelee       MovingMeleeTargeting;

	// Start with a copy of the Ranger's running Slash
	Template = class'X2Ability_RangerAbilitySet'.static.AddSwordSliceAbility('F_Rush');
	Template.IconImage = "img:///UILibrary_XPerkIconPack.UIPerk_knife_move2";
    Template.bCrossClassEligible = default.RUSH_AWC;

    // Can only blue move
    MovingMeleeTargeting = new class'X2AbilityTarget_MovingMelee';
    MovingMeleeTargeting.MovementRangeAdjustment = 1;
    Template.AbilityTargetStyle = MovingMeleeTargeting;

    // No longer ends the turn
    Template.AbilityCosts.Length = 0;
    Template.AbilityCosts.AddItem(ActionPointCost(eCost_Single));

	// In LW2, melee attacks are allowed when disoriented, so we have to redo the shooter conditions from the base ability, which disables them while disoriented
	Template.AbilityShooterConditions.Length = 0;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	SkipExclusions.AddItem(class'X2AbilityTemplateManager'.default.DisorientedName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	return Template;
}

// Armed To The Teeth
// (AbilityName="F_ArmedToTheTeeth")
// Grants an ammo only utility slot. Passive.
static function X2AbilityTemplate ArmedToTheTeeth()
{
	// Create the template using a helper function - XcomGameData.ini sets this perk as unlocking the ammo pocket
	return Passive('F_ArmedToTheTeeth', "img:///UILibrary_FavidsPerkPack.UIPerk_ArmedToTheTeeth", default.ARMEDTOTHETEETH_AWC, none);
}

// Ammo Conservation
// (AbilityName="F_AmmoConservation")
// Activated ability that does not cost an action point. Until the beginning of next turn, your ammo will be refunded after each shot you take. Cooldown-based.
static function X2AbilityTemplate AmmoConservation()
{
	local X2AbilityTemplate		    Template;
	local X2Effect_RefundAmmoCost	Effect;
	
    // Handles the ammo cost refund
	Effect = new class'X2Effect_RefundAmmoCost';
	Effect.EffectName = 'F_AmmoConservation';
	Effect.DuplicateResponse = eDupe_Ignore;
	Effect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnBegin);

	Template = SelfTargetActivated('F_AmmoConservation', "img:///UILibrary_FavidsPerkPack.UIPerk_LockNLoad", default.AMMOCONSERVATION_AWC, Effect, class'UIUtilities_Tactical'.const.CLASS_COLONEL_PRIORITY, eCost_Free);
	Template.bShowActivation = true;

    AddCooldown(Template, default.AMMOCONSERVATION_COOLDOWN);

	return Template;
}

// Well Protected
// (AbilityName="F_WellProtected")
// Grants a vest only utility slot. Passive.
static function X2AbilityTemplate WellProtected()
{
	// Create the template using a helper function - XComVestSlot.ini sets this perk as unlocking the vest pocket
	return Passive('F_WellProtected', "img:///UILibrary_XPerkIconPack.UIPerk_defense_box", default.WELLPROTECTED_AWC, none);
}

// Dedication
// (AbilityName="F_Dedication")
// Free action. Gain bonus mobility and ignore reaction fire for the rest of the turn. Cooldown-based.
static function X2AbilityTemplate Dedication()
{
	local X2AbilityTemplate             Template;
	local X2Effect_PersistentStatChange Effect;
	
	// Activated ability that targets user
	Template = SelfTargetActivated('F_Dedication', "img:///UILibrary_FavidsPerkPack.UIPerk_Sprinter", default.DEDICATION_AWC, none, class'UIUtilities_Tactical'.const.CLASS_CORPORAL_PRIORITY, eCost_Free);
	Template.bShowActivation = true;

	// Create a persistent stat change effect that grants a mobility bonus - naming the effect Shadowstep lets you ignore reaction fire
	Effect = new class'X2Effect_PersistentStatChange';
	Effect.EffectName = 'Shadowstep';
	Effect.AddPersistentStatChange(eStat_Mobility, default.DEDICATION_MOBILITY);
	Effect.DuplicateResponse = eDupe_Refresh;
	Effect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnBegin);
    Template.AddTargetEffect(Effect);

	// Cannot be used while burning, etc.
	Template.AddShooterEffectExclusions();

	// Cooldown
	AddCooldown(Template, default.DEDICATION_COOLDOWN);

	return Template;
}

// Triage
// (AbilityName="F_Triage")
// Restores health to the user and all allies in the surrounding area. Also removes physical status effects.
static function X2AbilityTemplate Triage()
{
	local X2AbilityTemplate                     Template;
	local X2AbilityMultiTarget_Radius           RadiusMultiTarget;
    local X2Effect_ApplyMedikitHeal             HealEffect;
    local X2Effect_RemoveEffectsByDamageType    RemoveEffects;
    local array<name>                           SkipExclusions;
    local name                                  HealType;
    
    // Activated ability that targets user
	Template = SelfTargetActivated('F_Triage', "img:///UILibrary_XPerkIconPack.UIPerk_medkit_circle", default.TRIAGE_AWC, none, class'UIUtilities_Tactical'.const.CLASS_COLONEL_PRIORITY, eCost_SingleConsumeAll);
	
	// The ability targets the unit that has it, but also effects all nearby units that meet the conditions on the multitarget effect.
	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.fTargetRadius = default.TRIAGE_RADIUS;
	RadiusMultiTarget.bIgnoreBlockingCover = true;
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

    // Can be used while burning, but not under any other normally deblitating effects
	SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
	Template.AddShooterEffectExclusions(SkipExclusions);

    // Restore health effect
	HealEffect = new class'X2Effect_ApplyMedikitHeal';
	HealEffect.PerUseHP = default.TRIAGE_HEAL_AMOUNT;
	Template.AddTargetEffect(HealEffect);
	Template.AddMultiTargetEffect(HealEffect);

    // Remove the effects that a medikit would
	RemoveEffects = new class'X2Effect_RemoveEffectsByDamageType';
	foreach class'X2Ability_DefaultAbilitySet'.default.MedikitHealEffectTypes(HealType)
	{
		RemoveEffects.DamageTypesToRemove.AddItem(HealType);
	}
	Template.AddTargetEffect(RemoveEffects);
	Template.AddMultiTargetEffect(RemoveEffects);
    
	// Charges
    AddCharges(Template, default.TRIAGE_CHARGES);

	// Show a flyover when activated
	Template.bShowActivation = true;

	return Template;
}

// Steadfast
// (AbilityName="F_Steadfast")
// Grants immunity to negative mental conditions including panic, mind control, stuns, and disorientation.
static function X2AbilityTemplate Steadfast()
{
    local X2Effect_DamageImmunity       Effect;
    
	Effect = new class'X2Effect_DamageImmunity';
	Effect.ImmuneTypes.AddItem('Mental');
	Effect.ImmuneTypes.AddItem(class'X2Item_DefaultDamageTypes'.default.DisorientDamageType);
	Effect.ImmuneTypes.AddItem('Stun');
	Effect.ImmuneTypes.AddItem('Unconscious');
    
	return Passive('F_Steadfast', "img:///UILibrary_XPerkIconPack.UIPerk_mind_defense", default.STEADFAST_AWC, Effect);
}

// Corpsman
// (AbilityName="F_Corpsman")
// Grants a free medikit.
static function X2AbilityTemplate Corpsman()
{
	local X2AbilityTemplate Template;
	local XMBEffect_AddUtilityItem TemporaryItemEffect;
	
	// Effect granting a free medkit
	TemporaryItemEffect = new class'XMBEffect_AddUtilityItem';
	TemporaryItemEffect.EffectName = 'F_Corpsman';
	TemporaryItemEffect.DataName = 'Medikit';

	// Create the template using a helper function
	Template = Passive('F_Corpsman', "img:///UILibrary_XPerkIconPack.UIPerk_medkit_box", default.CORPSMAN_AWC, TemporaryItemEffect);

	return Template;
}

// Field Medic
// (AbilityName="F_FieldMedic")
// Grants additional medikit charges. Compatible with Corpsman
static function X2AbilityTemplate FieldMedic()
{
	local X2AbilityTemplate Template;
	local XMBEffect_AddItemCharges BonusItemEffect;
	
	BonusItemEffect = new class'XMBEffect_AddItemCharges';
	BonusItemEffect.PerItemBonus = default.FIELDMEDIC_BONUS_ITEMS;
	BonusItemEffect.ApplyToNames.AddItem('Medikit');
	BonusItemEffect.ApplyToNames.AddItem('NanoMedikit');

	// Create the template using a helper function
	Template = Passive('F_FieldMedic', "img:///UILibrary_PerkIcons.UIPerk_fieldmedic", default.FIELDMEDIC_AWC, BonusItemEffect);

	return Template;
}

// Stimulate
// (AbilityName="F_Stimulate")
// Once per turn, you may remove mental impairments from a nearby ally.
static function X2AbilityTemplate Stimulate()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityTarget_SingleInRange     SingleTarget;
	local X2Effect_RemoveEffects			RemoveEffects;

	// Removes most mental effects
	RemoveEffects = new class'X2Effect_RemoveEffects';
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.DisorientedName);
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.PanickedName);
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.StunnedName);
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2StatusEffects'.default.UnconsciousName);

	// Create template using a helper function
	Template = TargetedBuff('F_Stimulate', "img:///UILibrary_XPerkIconPack.UIPerk_stim_box", false, RemoveEffects, class'UIUtilities_Tactical'.const.MEDIKIT_HEAL_PRIORITY + 1, eCost_Single);

	// Once per turn
	AddCooldown(Template, 1);

	// Limited range
	SingleTarget = new class'X2AbilityTarget_SingleInRange';
	SingleTarget.RangeInTiles = default.STIMULATE_RANGE_IN_TILES;
	SingleTarget.bShowAOE = true;
	Template.AbilityTargetStyle = SingleTarget;

	// Template must be suffering from a mental impairment
	Template.AbilityTargetConditions.AddItem(new class'X2Condition_RevivalProtocol');

	Template.bLimitTargetIcons = true;
	Template.ActivationSpeech = 'StabilizingAlly';

	return Template;
}

// Bloodlet
// (AbilityName="F_Bloodlet")
// Standard shots from your primary weapon or a pistol now cause bleeding.
static function X2AbilityTemplate Bloodlet()
{
	local X2AbilityTemplate Template;

	// Start with the passive template
	Template = Passive('F_Bloodlet', "img:///UILibrary_XPerkIconPack.UIPerk_shot_adrenaline", default.BLOODLET_AWC, none);
	
	return Template;
}

// Added to StandardShot in OnPostTemplatesCreated()
static function X2Effect_Persistent BloodletEffect()
{
	local X2Effect_Persistent		    Effect;
	local X2Condition_AbilityProperty   Condition;

    // Create the bleed status effect
    Effect = class'X2StatusEffects'.static.CreateBleedingStatusEffect(default.BLOODLET_DURATION, default.BLOODLET_TICK_DAMAGE);
	Effect.ApplyChance = default.BLOODLET_BLEEDING_CHANCE_PERCENT;

    // Only apply if shooter has Bloodlet passive
	Condition = new class'X2Condition_AbilityProperty';
	Condition.OwnerHasSoldierAbilities.AddItem('F_Bloodlet');
	Effect.TargetConditions.AddItem(Condition);

	return Effect;
}

// Blinding Fire
// (AbilityName="F_BlindingFire", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Fire at enemies in a cone. This attack is inaccurate, but reduces the aim of all targets.
static function X2AbilityTemplate BlindingFire()
{
	local X2AbilityTemplate                 Template;	
	local X2AbilityCost_Ammo                AmmoCost;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityTarget_Cursor            CursorTarget;
	local X2AbilityMultiTarget_Cone         ConeMultiTarget;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2AbilityToHitCalc_StandardAim    StandardAim;
	local X2AbilityCooldown                 Cooldown;
	local X2Effect_Shredder					WeaponDamageEffect;
    local X2Effect_PersistentStatChange     AimPenaltyEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'F_BlindingFire');

	// Boilerplate setup
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_CAPTAIN_PRIORITY;
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.IconImage = "img:///UILibrary_XPerkIconPack.UIPerk_shot_rifle";
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";
	Template.CinescriptCameraType = "StandardGunFiring";
	Template.bCrossClassEligible = false;
	Template.Hostility = eHostility_Offensive;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	Template.TargetingMethod = class'X2TargetingMethod_Cone';
    Template.bCrossClassEligible = default.BLINDINGFIRE_AWC;

	// Boilerplate setup
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AbilityTargetConditions.AddItem(default.LivingTargetUnitOnlyProperty);
	
	// Ammo effects apply
	Template.bAllowAmmoEffects = true;

	// Requires one action point and ends turn
	ActionPointCost = new class 'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);

	// Configurable ammo cost
	AmmoCost = new class'X2AbilityCost_Ammo';	
	AmmoCost.iAmmo = default.BLINDINGFIRE_AMMO_COST;
	Template.AbilityCosts.AddItem(AmmoCost);

	// Configurable cooldown
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.BLINDINGFIRE_COOLDOWN;
	Template.AbilityCooldown = Cooldown;

	// Can hurt allies
	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	Template.AbilityShooterConditions.AddItem(UnitPropertyCondition);
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

	// Cannot be used while disoriented, burning, etc.
	Template.AddShooterEffectExclusions();

	// Standard aim calculation
	StandardAim = new class'X2AbilityToHitCalc_StandardAim';
	StandardAim.bMultiTargetOnly = false; 
	StandardAim.bGuaranteedHit = false;
	StandardAim.bOnlyMultiHitWithSuccess = false;
	StandardAim.bAllowCrit = true;
	Template.AbilityToHitCalc = StandardAim;
	Template.bOverrideAim = false;

	// Manual targetting
	CursorTarget = new class'X2AbilityTarget_Cursor';
	Template.AbilityTargetStyle = CursorTarget;	

	// Can shred
	WeaponDamageEffect = new class'X2Effect_Shredder';
	Template.AddTargetEffect(WeaponDamageEffect);
	Template.AddMultiTargetEffect(WeaponDamageEffect);
	Template.bFragileDamageOnly = true;
	Template.bCheckCollision = true;

    // Reduces the targets' aim
	AimPenaltyEffect = new class'X2Effect_PersistentStatChange';
	AimPenaltyEffect.EffectName = 'F_BlindingFire_AimPenalty';
	AimPenaltyEffect.DuplicateResponse = eDupe_Refresh;
	AimPenaltyEffect.BuildPersistentEffect(1, false, false, false, eGameRule_PlayerTurnBegin);
	AimPenaltyEffect.AddPersistentStatChange(eStat_Offense, default.BLINDINGFIRE_TARGET_AIM_PENALTY);
	AimPenaltyEffect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, Template.LocLongDescription, Template.IconImage, true, , Template.AbilitySourceName);
	AimPenaltyEffect.VisualizationFn = EffectFlyOver_Visualization;
	AimPenaltyEffect.bApplyOnMiss = true;
	Template.AddTargetEffect(AimPenaltyEffect);
	Template.AddMultiTargetEffect(AimPenaltyEffect);

	// Cone style target, does not go through full cover
	ConeMultiTarget = new class'X2AbilityMultiTarget_Cone';
	ConeMultiTarget.bExcludeSelfAsTargetIfWithinRadius = true;
	ConeMultiTarget.ConeEndDiameter = default.BLINDINGFIRE_CONE_TILE_WIDTH * class'XComWorldData'.const.WORLD_StepSize;
	ConeMultiTarget.bUseWeaponRangeForLength = false;
	ConeMultiTarget.ConeLength = default.BLINDINGFIRE_CONE_LENGTH * class'XComWorldData'.const.WORLD_StepSize;
	ConeMultiTarget.fTargetRadius = 99;     //  large number to handle weapon range - targets will get filtered according to cone constraints
	ConeMultiTarget.bIgnoreBlockingCover = false;
	Template.AbilityMultiTargetStyle = ConeMultiTarget;

	// Standard visualization
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;

	// Standard interactions with Shadow, Chosen, and the Lost
	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;

	// Add a secondary ability to provide an aim penalty for the shooter on the shot
	AddSecondaryAbility(Template, BlindingFireMalus());

	return Template;
}

// This is part of the Blinding Fire effect, above
static function X2AbilityTemplate BlindingFireMalus()
{
	local X2AbilityTemplate Template;
	local XMBEffect_ConditionalBonus Effect;
	local XMBCondition_AbilityName Condition;

	// Create a conditional bonus effect
	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'F_BlindingFire_Malus';
    
	// The effect modifies aim
	Effect.AddToHitModifier(default.BLINDINGFIRE_SOURCE_AIM_PENALTY, eHit_Success);

	// The effect only applies to the Blinding Fire ability
	Condition = new class'XMBCondition_AbilityName';
	Condition.IncludeAbilityNames.AddItem('F_BlindingFire');
	Effect.AbilityTargetConditions.AddItem(Condition);

	// Create the template using a helper function
	Template = Passive('F_BlindingFire_Malus', "img:///UILibrary_XPerkIconPack.UIPerk_shot_rifle", false, Effect);

	// Hide the icon for the passive aim penalty
	HidePerkIcon(Template);

	return Template;
}

// Quick Feet
// (AbilityName="F_QuickFeet")
// Refunds one action point when you are revealed from concealment via your own action.
static function X2AbilityTemplate QuickFeet()
{
	local X2AbilityTemplate						Template;
	local X2Effect_RefundConcealmentBreakingAction					QuickFeetEffect;

	// Quick Feet Effect
	QuickFeetEffect = new class'X2Effect_RefundConcealmentBreakingAction';
	QuickFeetEffect.EffectName = 'F_QuickFeet';
	
	Template = Passive('F_QuickFeet', "img:///UILibrary_XPerkIconPack.UIPerk_stealth_move", default.QUICKFEET_AWC, QuickFeetEffect);
	
	return Template;
}

// Combat Druges
// (AbilityName="F_CombatDrugs")
// Your smoke grenades confer bonuses to aim and critical chance.
static function X2AbilityTemplate CombatDrugs()
{
	return Passive('F_CombatDrugs', "img:///UILibrary_SOCombatEngineer.UIPerk_combatdrugs", default.COMBATDRUGS_AWC, none);
}

// Added to SmokeGrenade and SmokeBomb in OnPostTemplatesCreated()
static function X2Effect CombatDrugsEffect()
{
	local X2Effect_SmokeToHitModifiers Effect;
	local XMBCondition_SourceAbilities Condition;

	// Aim and crit bonuses
	Effect = new class'X2Effect_SmokeToHitModifiers';
	Effect.BuildPersistentEffect(class'X2Effect_ApplySmokeGrenadeToWorld'.default.Duration + 1, false, false, false, eGameRule_PlayerTurnBegin);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, default.LocCombatDrugsEffect, default.LocCombatDrugsEffectDescription, "img:///UILibrary_SOCombatEngineer.UIPerk_combatdrugs");
	Effect.AimMod = default.COMBATDRUGS_AIM;
	Effect.CritMod = default.COMBATDRUGS_CRIT;
	Effect.DuplicateResponse = eDupe_Refresh;

	// Only applies if the thrower has Combat Drugs
	Condition = new class'XMBCondition_SourceAbilities';
	Condition.AddRequireAbility('F_CombatDrugs', 'AA_UnitIsImmune');
	Effect.TargetConditions.AddItem(Condition);

	return Effect;
}

// Salt in the Wound
// (AbilityName="F_SaltInTheWound")
// All attacks deal increased damage to targets suffering from Burning, Poison, Acid, or Bleeding.
static function X2AbilityTemplate SaltInTheWound()
{
	local X2AbilityTemplate Template;
	local XMBEffect_ConditionalBonus Effect;
    local X2Condition_UnitAffectedByPhysicalEffect Condition;

	// Create a conditional bonus effect that increases damage
	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'F_SaltInTheWound_Damage';
	Effect.AddDamageModifier(default.SALTINTHEWOUND_DAMAGE_BONUS, eHit_Success);

    // Add a condition that the target must suffer from a physical effect
    Condition = new class'X2Condition_UnitAffectedByPhysicalEffect';
	Effect.AbilityTargetConditions.AddItem(Condition);
	
	// Create the template using a helper function
	Template = Passive('F_SaltInTheWound', "img:///UILibrary_FavidsPerkPack.UIPerk_SaltInTheWound", default.SALTINTHEWOUND_AWC, Effect);

	return Template;
}

// Unload
// (AbilityName="F_Unload", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Fire with the unit's primary weapon until out of ammo or the target is dead. Shots cannot critical. Cooldown-based.
static function X2AbilityTemplate Unload()
{
	local X2AbilityTemplate					Template;
	local X2AbilityCost_Ammo				AmmoCost;
	local X2AbilityToHitCalc_StandardAim    ToHitCalc;

	// Start with basic attack template, with a 0 ammo cost because we're going to do that in a very specific way on our own
	Template = Attack('F_Unload', "img:///UILibrary_FavidsPerkPack.UIPerk_Unload", default.UNLOAD_AWC, none, class'UIUtilities_Tactical'.const.CLASS_COLONEL_PRIORITY, eCost_WeaponConsumeAll, 0);
	
	// Cooldown
	AddCooldown(Template, default.UNLOAD_COOLDOWN);

	// Require 2 ammo to be present so that at least two shots can be taken
	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 2;
	AmmoCost.bFreeCost = true;
	Template.AbilityCosts.AddItem(AmmoCost);

	// Actually charge 1 ammo for this shot. Follow-up shots will charge the extra ammo
	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	Template.AbilityCosts.AddItem(AmmoCost);

	// Custom aim bonus/malus and potentially disallow critical hits
	ToHitCalc = new class'X2AbilityToHitCalc_StandardAim';
	ToHitCalc.BuiltInHitMod = default.UNLOAD_AIM_BONUS;
	ToHitCalc.bAllowCrit = default.UNLOAD_ALLOW_CRIT;
	Template.AbilityToHitCalc = ToHitCalc;
	Template.AbilityToHitOwnerOnMissCalc = ToHitCalc;

	// Now set the ability up for triggering the follow-up shots
	Template.AdditionalAbilities.AddItem('F_Unload2');
	Template.PostActivationEvents.AddItem('F_Unload2');

	// This should grant the damage modification effect that only applies to Unload
	Template.AdditionalAbilities.AddItem('F_UnloadDamage');

	return Template;
}

static function X2AbilityTemplate Unload2()
{
	local X2AbilityTemplate					Template;
	local X2AbilityToHitCalc_StandardAim    ToHitCalc;
	local X2AbilityTrigger_EventListener    Trigger;

	// Start with basic attack template
	Template = Attack('F_Unload2', "img:///UILibrary_FavidsPerkPack.UIPerk_Unload", false, none, class'UIUtilities_Tactical'.const.CLASS_COLONEL_PRIORITY, eCost_None, 1);
	
	// Custom aim bonus/malus and potentially disallow critical hits
	ToHitCalc = new class'X2AbilityToHitCalc_StandardAim';
	ToHitCalc.BuiltInHitMod = default.UNLOAD_AIM_BONUS;
	ToHitCalc.bAllowCrit = default.UNLOAD_ALLOW_CRIT;
	Template.AbilityToHitCalc = ToHitCalc;
	Template.AbilityToHitOwnerOnMissCalc = ToHitCalc;

	// Remove the activate ability trigger added by the Attack helper function
	Template.AbilityTriggers.Length = 0;

	// Set the ability to trigger with a listener
	Trigger = new class'X2AbilityTrigger_EventListener';
	Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	Trigger.ListenerData.EventID = 'F_Unload2';
	Trigger.ListenerData.Filter = eFilter_Unit;
	Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_OriginalTarget;
	Template.AbilityTriggers.AddItem(Trigger);

	// Now set the ability up for triggering the follow-up shots
	Template.PostActivationEvents.AddItem('F_Unload2');
	Template.CinescriptCameraType = "StandardGunFiring";

	// We don't want this ability to actually show up to the user
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;

	// Show a flyover for each follow-up shot
	Template.bShowActivation = true;
	
	Template.MergeVisualizationFn = SequentialShot_MergeVisualization;
	Template.BuildInterruptGameStateFn = none;

	return Template;
}

static function X2AbilityTemplate UnloadDamageBonus()
{
    local X2AbilityTemplate Template;
	local XMBEffect_ConditionalBonus Effect;
	local XMBCondition_AbilityName Condition;

	// Create a conditional bonus effect
	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'F_Unload_Bonuses';
    
	// The bonus reduces damage by a percentage
	Effect.AddPercentDamageModifier(-1 * default.UNLOAD_DAMAGE_PERCENT_MALUS);

	// The bonus only applies to the Unload ability and its follow-up shots
	Condition = new class'XMBCondition_AbilityName';
	Condition.IncludeAbilityNames.AddItem('F_Unload');
	Condition.IncludeAbilityNames.AddItem('F_Unload2');
	Effect.AbilityTargetConditions.AddItem(Condition);

	// Create the template using a helper function
	Template = Passive('F_UnloadDamage', "img:///UILibrary_FavidsPerkPack.UIPerk_Unload", false, Effect);

	// Unload will show up as an active ability, so hide the icon for the passive damage effect
	HidePerkIcon(Template);

    return Template;
}

// Ambush
// (AbilityName="F_Ambush", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Take a reaction shot against any enemy that moves or attacks within a cone of fire. Can only be used while concealed.
static function X2AbilityTemplate Ambush()
{
	local X2AbilityTemplate                 Template;
    //local X2Condition_UnitProperty          ConcealedCondition;
    local X2Effect                          Effect;
    local X2Effect_MarkValidActivationTiles MarkTilesEffect;

    // Start with a copy of KillZone
    Template = class'X2Ability_SharpshooterAbilitySet'.static.KillZone('F_Ambush', false);
    
    // Use our own icon
	Template.IconImage = "img:///UILibrary_XPerkIconPack.UIPerk_stealth_overwatch";

    // Only usable while concealed
	Template.AbilityShooterConditions.AddItem(new class'X2Condition_Concealed');

    // Modify it to use our AmbushShot ability instead of KillZoneShot
    foreach Template.AbilityShooterEffects(Effect)
    {
        MarkTilesEffect = X2Effect_MarkValidActivationTiles(Effect);
        if(MarkTilesEffect != none)
        {
            MarkTilesEffect.AbilityToMark = 'F_AmbushShot';
            break;
        }
    }

    // Use our own configuration value for the cooldown
    AddCooldown(Template, default.AMBUSH_COOLDOWN);

    // Remove the additional KillZoneShot ability and use our own AmbushShot instead
    Template.AdditionalAbilities.Length = 0;
	Template.AdditionalAbilities.AddItem('F_AmbushShot');

    // Use our own configuration value for AWC setting
    Template.bCrossClassEligible = default.AMBUSH_AWC;

    return Template;
}

// The Ambush shot - mostly a copy of KillZoneShot, but we want it to be able to fire while the shooter is concealed
static function X2AbilityTemplate AmbushShot()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_Ammo				AmmoCost;
	local X2AbilityCost_ReserveActionPoints ReserveActionPointCost;
	local X2AbilityToHitCalc_StandardAim    StandardAim;
	local X2Condition_AbilityProperty       AbilityCondition;
	local X2AbilityTarget_Single            SingleTarget;
	local X2AbilityTrigger_EventListener	Trigger;
	local X2Effect_Persistent               KillZoneEffect;
	local X2Condition_UnitEffectsWithAbilitySource  KillZoneCondition;
	local X2Condition_Visibility            TargetVisibilityCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'F_AmbushShot');

	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	Template.AbilityCosts.AddItem(AmmoCost);

	ReserveActionPointCost = new class'X2AbilityCost_ReserveActionPoints';
	ReserveActionPointCost.iNumPoints = 1;
	ReserveActionPointCost.bFreeCost = true;
	ReserveActionPointCost.AllowedTypes.AddItem('KillZone');
	Template.AbilityCosts.AddItem(ReserveActionPointCost);

	StandardAim = new class'X2AbilityToHitCalc_StandardAim';
	StandardAim.bReactionFire = true;
	Template.AbilityToHitCalc = StandardAim;

	Template.AbilityTargetConditions.AddItem(default.LivingHostileUnitDisallowMindControlProperty);
	TargetVisibilityCondition = new class'X2Condition_Visibility';
	TargetVisibilityCondition.bRequireGameplayVisible = true;
	TargetVisibilityCondition.bDisablePeeksOnMovement = true;
	TargetVisibilityCondition.bAllowSquadsight = true;
	Template.AbilityTargetConditions.AddItem(TargetVisibilityCondition);
	AbilityCondition = new class'X2Condition_AbilityProperty';
	AbilityCondition.TargetMustBeInValidTiles = true;
	Template.AbilityTargetConditions.AddItem(AbilityCondition);
	Template.AbilityTargetConditions.AddItem(class'X2Ability_DefaultAbilitySet'.static.OverwatchTargetEffectsCondition());

	//  Do not shoot targets that were already hit by this unit this turn with this ability
	KillZoneCondition = new class'X2Condition_UnitEffectsWithAbilitySource';
	KillZoneCondition.AddExcludeEffect('KillZoneTarget', 'AA_UnitIsImmune');
	Template.AbilityTargetConditions.AddItem(KillZoneCondition);
	//  Mark the target as shot by this unit so it cannot be shot again this turn
	KillZoneEffect = new class'X2Effect_Persistent';
	KillZoneEffect.EffectName = 'KillZoneTarget';
	KillZoneEffect.BuildPersistentEffect(1, false, false, false, eGameRule_PlayerTurnBegin);
	KillZoneEffect.SetupEffectOnShotContextResult(true, true);      //  mark them regardless of whether the shot hit or missed
	Template.AddTargetEffect(KillZoneEffect);

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	SingleTarget = new class'X2AbilityTarget_Single';
	SingleTarget.OnlyIncludeTargetsInsideWeaponRange = true;
	Template.AbilityTargetStyle = SingleTarget;

	//  Put holo target effect first because if the target dies from this shot, it will be too late to notify the effect.
	Template.AddTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.HoloTargetEffect());
	Template.AddTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.ShredderDamageEffect());

	Template.bAllowAmmoEffects = true;
	Template.bAllowBonusWeaponEffects = true;

	//Trigger on movement - interrupt the move
	Trigger = new class'X2AbilityTrigger_EventListener';
	Trigger.ListenerData.EventID = 'ObjectMoved';
	Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	Trigger.ListenerData.Filter = eFilter_None;
	Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.TypicalOverwatchListener;
	Template.AbilityTriggers.AddItem(Trigger);
	//  trigger on an attack
	Trigger = new class'X2AbilityTrigger_EventListener';
	Trigger.ListenerData.EventID = 'AbilityActivated';
	Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	Trigger.ListenerData.Filter = eFilter_None;
	Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.TypicalAttackListener;
	Template.AbilityTriggers.AddItem(Trigger);

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_overwatch";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_MAJOR_PRIORITY;
	Template.bDisplayInUITooltip = false;
	Template.bDisplayInUITacticalText = false;

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;

	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}

// Renewal
// (AbilityName="F_Renewal")
// At the start of each turn, heals yourself and all allies in a radius on you.
static function X2AbilityTemplate Renewal()
{
    local X2Effect_ApplyHeal                    Effect;
	local X2AbilityTemplate                     Template;
	local X2AbilityMultiTarget_Radius           RadiusMultiTarget;
    local X2Condition_UnitProperty              HealTargetCondition;
    
    // Effect that restores health
	Effect = new class'X2Effect_ApplyHeal';
	Effect.HealAmount = default.RENEWAL_HEALAMOUNT;
	Effect.MaxHealAmount = default.RENEWAL_MAXHEALAMOUNT;
	Effect.HealthRegeneratedName = 'RenewalHeal';

    // Activated ability that targets user
	Template = SelfTargetTrigger('F_Renewal', "img:///UILibrary_XPerkIconPack.UIPerk_medkit_blossom", default.RENEWAL_AWC, Effect, 'PlayerTurnBegun', eFilter_Player);
	
	// The ability targets the unit that has it, but also effects all nearby units that meet the conditions on the multitarget effect.
	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.fTargetRadius = default.RENEWAL_RADIUS;
	RadiusMultiTarget.bIgnoreBlockingCover = true;
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;
	Template.AddMultiTargetEffect(Effect);

	// Does not activate while dead
	AddTriggerTargetCondition(Template, default.LivingShooterProperty);

    // Only affects living allies
	HealTargetCondition = new class'X2Condition_UnitProperty';
	HealTargetCondition.RequireWithinRange = true;
	HealTargetCondition.ExcludeHostileToSource = true;
	HealTargetCondition.ExcludeFriendlyToSource = false;
	HealTargetCondition.ExcludeFullHealth = true;
	HealTargetCondition.ExcludeDead = true; 
	Template.AbilityMultiTargetConditions.AddItem(HealTargetCondition);
    
	// Trigger abilities don't appear as passives. Add a passive ability icon.
	AddIconPassive(Template);
    
	return Template;
}

// Warning Shot
// (AbilityName="F_WarningShot", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Fire a shot with your primary weapon that will make the target panic if it hits.
static function X2AbilityTemplate WarningShot()
{
	local X2AbilityTemplate Template;
	local X2Effect_Panicked Effect;
	
	// Create the template using a helper function
	Template = Attack('F_WarningShot', "img:///UILibrary_XPerkIconPack.UIPerk_panic_shot", default.WARNINGSHOT_AWC, none, class'UIUtilities_Tactical'.const.CLASS_LIEUTENANT_PRIORITY, eCost_WeaponConsumeAll, default.WARNINGSHOT_AMMO_COST);
    
	// Cooldown
	AddCooldown(Template, default.WARNINGSHOT_COOLDOWN);

	// Effect
	Effect = new class'X2Effect_Panicked';
	Effect = class'X2StatusEffects'.static.CreatePanickedStatusEffect();
	Template.AddTargetEffect(Effect);

	return Template;
}

// Vital Strike
// (AbilityName="F_VitalStrike", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Fire a shot with your primary weapon that deals additional damage and applies Rupture.
static function X2AbilityTemplate VitalStrike()
{
	local X2AbilityTemplate Template;
	local X2Effect_ApplyWeaponDamage Effect;

    // Standard damage effect that also applies Rupture
	Effect = class'X2Ability_GrenadierAbilitySet'.static.ShredderDamageEffect();
	Effect.EffectDamageValue.Rupture = default.VITALSTRIKE_RUPTURE;
	
	// Create the template using a helper function
	Template = Attack('F_VitalStrike', "img:///UILibrary_FieldMedic.perk_vital_strike", default.VITALSTRIKE_AWC, Effect, class'UIUtilities_Tactical'.const.CLASS_LIEUTENANT_PRIORITY, eCost_WeaponConsumeAll, default.VITALSTRIKE_AMMO_COST);
    
    // Standard attack effects for holotarget and weapon miss damage
    Template.AddTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.HoloTargetEffect());
	Template.AddTargetEffect(default.WeaponUpgradeMissDamage);

	// Cooldown
	AddCooldown(Template, default.VITALSTRIKE_COOLDOWN);

    // Secondary ability that grants a damage bonus
    AddSecondaryAbility(Template, VitalStrikeDamageBonus());

	return Template;
}

static function X2AbilityTemplate VitalStrikeDamageBonus()
{
    local X2AbilityTemplate Template;
	local XMBEffect_ConditionalBonus Effect;
	local XMBCondition_AbilityName Condition;

	// Create a conditional bonus effect
	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'F_VitalStrike_Bonuses';
    
	// The bonus reduces damage by a percentage
	Effect.AddDamageModifier(default.VITALSTRIKE_DAMAGE_BONUS);

	// The bonus only applies to the Vital Strike ability
	Condition = new class'XMBCondition_AbilityName';
	Condition.IncludeAbilityNames.AddItem('F_VitalStrike');
	Effect.AbilityTargetConditions.AddItem(Condition);

	// Create the template using a helper function
	Template = Passive('F_VitalStrike_Damage', "img:///UILibrary_FieldMedic.perk_vital_strike", false, Effect);

	// Vital Strike will show up as an active ability, so hide the icon for the passive damage effect
	HidePerkIcon(Template);

    return Template;
}

// Open Fire
// (AbilityName="F_OpenFire", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Gain bonus Aim and Critical Chance against targets that are at full health.
static function X2AbilityTemplate OpenFire()
{
	local X2AbilityTemplate Template;
    local X2Condition_UnitStatCheck Condition;
	local XMBEffect_ConditionalBonus Effect;

    // Aim and crit bonus
	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.AddToHitModifier(default.OPENFIRE_AIM, eHit_Success);
	Effect.AddToHitModifier(default.OPENFIRE_CRIT, eHit_Crit);
    
    // Only applies to full health targets
    Condition = new class'X2Condition_UnitStatCheck';
    Condition.AddCheckStat(eStat_HP, 100, eCheck_Exact, 100, 100, true);
	Effect.AbilityTargetConditions.AddItem(Condition);

	// Restrict to the weapon matching this ability
	Effect.AbilityTargetConditions.AddItem(default.MatchingWeaponCondition);

	Template = Passive('F_OpenFire', "img:///UILibrary_XPerkIconPack.UIPerk_stabilize_shot_2", default.OPENFIRE_AWC, Effect);

    return Template;
}

// Havoc
// (AbilityName="F_Havoc", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Your Suppression and Area Suppression abilities now deal a small amount of damage to the primary target.
static function X2AbilityTemplate Havoc()
{
	local X2AbilityTemplate Template;
	local X2Effect_ApplyWeaponDamage Effect;
	local XMBAbilityTrigger_EventListener EventListener;
	local XMBCondition_AbilityName NameCondition;
	local WeaponDamageValue DamageValue;

    DamageValue.Damage = 1;

	Effect = class'X2Ability_GrenadierAbilitySet'.static.ShredderDamageEffect();
	Effect.bIgnoreBaseDamage = true;
    Effect.EffectDamageValue = DamageValue;

	Template = TargetedDebuff('F_Havoc', "img:///UILibrary_FavidsPerkPack.UIPerk_Mayhem", default.HAVOC_AWC, none,, eCost_None);
	Template.AddTargetEffect(Effect);

    Template.CustomFireAnim = '';

	Template.AbilityShooterConditions.Length = 0;
	Template.AbilityTargetConditions.Length = 0;

	HidePerkIcon(Template);
	AddIconPassive(Template);

	Template.AbilityTriggers.Length = 0;
	
	EventListener = new class'XMBAbilityTrigger_EventListener';
	EventListener.ListenerData.Deferral = ELD_OnStateSubmitted;
	EventListener.ListenerData.EventID = 'AbilityActivated';
	EventListener.ListenerData.Filter = eFilter_Unit;
	EventListener.bSelfTarget = false;
	Template.AbilityTriggers.AddItem(EventListener);

	NameCondition = new class'XMBCondition_AbilityName';
    NameCondition.IncludeAbilityNames.AddItem('Suppression');
    NameCondition.IncludeAbilityNames.AddItem('LW2WotC_AreaSuppression');
	EventListener.AbilityTargetConditions.AddItem(NameCondition);
    
	return Template;
}

static function bool HavocDamagePreview(XComGameState_Ability AbilityState, StateObjectReference TargetRef, out WeaponDamageValue MinDamagePreview, out WeaponDamageValue MaxDamagePreview, out int AllowsShield)
{
	local XComGameState_Ability HavocAbility;
	local XComGameState_Unit OwnerState;
	local XComGameStateHistory History;

	History = `XCOMHISTORY;
	OwnerState = XComGameState_Unit(History.GetGameStateForObjectID(AbilityState.OwnerStateObject.ObjectID));
	HavocAbility = XComGameState_Ability(History.GetGameStateForObjectID(OwnerState.FindAbility('F_Havoc').ObjectID));

    if(HavocAbility != none)
    {
        HavocAbility.GetDamagePreview(TargetRef, MinDamagePreview, MaxDamagePreview, AllowsShield);
        return true;
    }

	return false;
}

// Finesse
// (AbilityName="F_Finesse")
// Your first melee attack each turn will have its actions refunded. Passive.
static function X2AbilityTemplate Finesse()
{
    local XMBEffect_AbilityCostRefund Effect;

	// Create an effect that will refund the cost of attacks
	Effect = new class'XMBEffect_AbilityCostRefund';
	Effect.EffectName = 'F_Finesse_Refund';
	Effect.TriggeredEvent = 'F_Finesse_Refund';

	// Only refund once per turn
	Effect.CountValueName = 'F_Finesse_RefundCounter';
	Effect.MaxRefundsPerTurn = 1;

	// The bonus only applies to melee attacks
	Effect.AbilityTargetConditions.AddItem(default.MeleeCondition);

	// Create the template using a helper function
	return Passive('F_Finesse', "img:///UILibrary_XPerkIconPack.UIPerk_knife_chevron", default.FINESSE_AWC, Effect);
}