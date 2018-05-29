class X2Ability_Stolen extends XMBAbility config (ExtendedPerkPack);

var config int KILLEMALL_COOLDOWN;
var config int KILLEMALL_AMMO_COST;
var config int KILLEMALL_CONE_WIDTH_TILES;
var config bool KILLEMALL_AWC;

var config bool SURGICALPRECISION_AWC;

var config int CRITICALTARGET_CRIT_BONUS;
var config bool CRITICALTARGET_AWC;

var config int FOCUSEDDEFENSE_DEFENSE_BONUS;
var config bool FOCUSEDDEFENSE_AWC;

var config bool SNIPERELITE_AWC;

var config int SENSOROVERLAYS_CRIT_BONUS;
var config bool SENSOROVERLAYS_AWC;

var config int PHALANXPROTOCOL_CHARGES;
var config bool PHALANXPROTOCOL_AWC;

var config bool IMPROVEDSUPPRESSION_AWC;

var config int BREACH_AMMO_COST;
var config int BREACH_COOLDOWN;
var config int BREACH_DAMAGE;
var config int BREACH_SHRED;
var config int BREACH_RANGE;
var config int BREACH_ENVIRONMENT_DAMAGE;
var config int BREACH_RADIUS;
var config bool BREACH_AWC;

var config bool LIQUIDATOR_AWC;

var config int SLAMFIRE_COOLDOWN;
var config bool SLAMFIRE_AWC;

var config int TACTICIAN_CONVENTIONAL_DAMAGE;
var config int TACTICIAN_LASER_DAMAGE;
var config int TACTICIAN_MAGNETIC_DAMAGE;
var config int TACTICIAN_COIL_DAMAGE;
var config int TACTICIAN_BEAM_DAMAGE;
var config bool TACTICIAN_AWC;

var config int EATTHIS_AIM;
var config int EATTHIS_CRIT;
var config int EATTHIS_MAX_TILES;
var config bool EATTHIS_AWC;

var config int FASTBALL_COOLDOWN;
var config bool FASTBALL_AWC;

var config int VANISH_COOLDOWN;
var config bool VANISH_AWC;

var config int FRACTURE_SHRED;
var config int FRACTURE_CRIT_CHANCE;
var config bool FRACTURE_AWC;

var config int STALKER_MOBILITY;
var config int STALKER_AIM;
var config bool STALKER_AWC;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

    Templates.AddItem(KillEmAll());
    Templates.AddItem(SurgicalPrecision());
    Templates.AddItem(CriticalTarget());
    Templates.AddItem(FocusedDefense());
    Templates.AddItem(SniperElite());
    Templates.AddItem(SensorOverlays());
    Templates.AddItem(PhalanxProtocol());
    Templates.AddItem(ImprovedSuppression());
    Templates.AddItem(Breach());
    Templates.AddItem(Liquidator());
    Templates.AddItem(SlamFire());
    Templates.AddItem(Tactician());
    Templates.AddItem(EatThis());
    Templates.AddItem(Fastball());
    Templates.AddItem(Vanish());
    Templates.AddItem(VanishTrigger());
    Templates.AddItem(Fracture());
    Templates.AddItem(Stalker());
	
	return Templates;
}

// Kill 'Em All
// (AbilityName="F_KillEmAll", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Take a shot at every enemy in a cone area.
// Original Creator: Musashi
static function X2AbilityTemplate KillEmAll()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityToHitCalc_StandardAim    ToHitCalc;
	local X2AbilityTarget_Cursor            CursorTarget;
	local X2AbilityMultiTarget_Cone         ConeMultiTarget;

    // Create template with a helper function
    Template = Attack('F_KillEmAll', "img:///UILibrary_XPerkIconPack.UIPerk_rifle_circle", default.KILLEMALL_AWC, none, class'UIUtilities_Tactical'.const.CLASS_COLONEL_PRIORITY, eCost_WeaponConsumeAll, default.KILLEMALL_AMMO_COST);

    // Cooldown
    AddCooldown(Template, default.KILLEMALL_COOLDOWN);
    
    // Aim calculations - multi target only
	ToHitCalc = new class'X2AbilityToHitCalc_StandardAim';
	ToHitCalc.bOnlyMultiHitWithSuccess = false;
	ToHitCalc.bMultiTargetOnly = true;
	Template.AbilityToHitCalc = ToHitCalc;
    Template.AbilityToHitOwnerOnMissCalc = none;
	Template.bOverrideAim = true;
	Template.bCheckCollision = true;

    // Use cursor targeting
    CursorTarget = new class'X2AbilityTarget_Cursor';
	Template.AbilityTargetStyle = CursorTarget;	

    // Targets multiple enemies in a cone
    ConeMultiTarget = new class'X2AbilityMultiTarget_Cone';
	ConeMultiTarget.bExcludeSelfAsTargetIfWithinRadius = true;
	ConeMultiTarget.ConeEndDiameter = default.KILLEMALL_CONE_WIDTH_TILES * class'XComWorldData'.const.WORLD_StepSize;
	ConeMultiTarget.bUseWeaponRangeForLength = true;
	ConeMultiTarget.fTargetRadius = 99;     //  large number to handle weapon range - targets will get filtered according to cone constraints
	ConeMultiTarget.bIgnoreBlockingCover = false;
	Template.AbilityMultiTargetStyle = ConeMultiTarget;
    Template.TargetingMethod = class'X2TargetingMethod_Cone';

    // Targets must be visible and not mind controlled
    Template.AbilityTargetConditions.Length = 0;
	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);
	//Template.AbilityTargetConditions.AddItem(default.LivingHostileUnitDisallowMindControlProperty);
    
    // Does damage to the multi targets
    Template.AddMultiTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.HoloTargetEffect());
	Template.AddMultiTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.ShredderDamageEffect());
	Template.AddMultiTargetEffect(default.WeaponUpgradeMissDamage);
    
    // Custom visualization
	Template.BuildVisualizationFn = KillEmAll_BuildVisualization;
    
    // Get rid of the friendly fire warning, since friendlies will be ignored
	//Template.bFriendlyFireWarning = false;

    return Template;
}

function KillEmAll_BuildVisualization(XComGameState VisualizeGameState)
{
	local X2AbilityTemplate             AbilityTemplate;
	local XComGameStateContext_Ability  Context;
	local AbilityInputContext           AbilityContext;
	local StateObjectReference          ShootingUnitRef;
	//local X2Action_Fire                 FireAction;
	local X2Action_Fire_Faceoff         FireFaceoffAction;
	local XComGameState_BaseObject      TargetStateObject;//Container for state objects within VisualizeGameState	

	local Actor                     TargetVisualizer, ShooterVisualizer;
	local X2VisualizerInterface     TargetVisualizerInterface;
	local int                       EffectIndex, TargetIndex;

	local VisualizationActionMetadata        EmptyTrack;
	local VisualizationActionMetadata        ActionMetadata;
	local VisualizationActionMetadata        SourceTrack;
	local XComGameStateHistory      History;

	local X2Action_PlaySoundAndFlyOver SoundAndFlyover;
	local name         ApplyResult;

	local X2Action_StartCinescriptCamera CinescriptStartAction;
	local X2Action_EndCinescriptCamera   CinescriptEndAction;
	local X2Camera_Cinescript            CinescriptCamera;
	local string                         PreviousCinescriptCameraType;
	local X2Effect                       TargetEffect;

	local X2Action_MarkerNamed				JoinActions;
	local array<X2Action>					LeafNodes;
	local XComGameStateVisualizationMgr		VisualizationMgr;
	local X2Action_ApplyWeaponDamageToUnit	ApplyWeaponDamageAction;


	History = `XCOMHISTORY;
	VisualizationMgr = `XCOMVISUALIZATIONMGR;

	Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	AbilityContext = Context.InputContext;
	AbilityTemplate = class'XComGameState_Ability'.static.GetMyTemplateManager().FindAbilityTemplate(AbilityContext.AbilityTemplateName);
	ShootingUnitRef = Context.InputContext.SourceObject;

	ShooterVisualizer = History.GetVisualizer(ShootingUnitRef.ObjectID);

	SourceTrack = EmptyTrack;
	SourceTrack.StateObject_OldState = History.GetGameStateForObjectID(ShootingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	SourceTrack.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(ShootingUnitRef.ObjectID);
	if( SourceTrack.StateObject_NewState == none )
		SourceTrack.StateObject_NewState = SourceTrack.StateObject_OldState;
	SourceTrack.VisualizeActor = ShooterVisualizer;

	if( AbilityTemplate.ActivationSpeech != '' )     //  allows us to change the template without modifying this function later
	{
		SoundAndFlyOver = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyover'.static.AddToVisualizationTree(SourceTrack, Context));
		SoundAndFlyOver.SetSoundAndFlyOverParameters(None, "", AbilityTemplate.ActivationSpeech, eColor_Good);
	}


	// Add a Camera Action to the Shooter's Metadata.  Minor hack: To create a CinescriptCamera the AbilityTemplate 
	// must have a camera type.  So manually set one here, use it, then restore.
	PreviousCinescriptCameraType = AbilityTemplate.CinescriptCameraType;
	AbilityTemplate.CinescriptCameraType = "StandardGunFiring";
	CinescriptCamera = class'X2Camera_Cinescript'.static.CreateCinescriptCameraForAbility(Context);
	CinescriptStartAction = X2Action_StartCinescriptCamera(class'X2Action_StartCinescriptCamera'.static.AddToVisualizationTree(SourceTrack, Context, false, SourceTrack.LastActionAdded));
	CinescriptStartAction.CinescriptCamera = CinescriptCamera;
	AbilityTemplate.CinescriptCameraType = PreviousCinescriptCameraType;

	class'X2Action_ExitCover'.static.AddToVisualizationTree(SourceTrack, Context, false, SourceTrack.LastActionAdded);

	//  Now configure a fire action for each multi target
	for( TargetIndex = 0; TargetIndex < AbilityContext.MultiTargets.Length; ++TargetIndex )
	{
		// Add an action to pop the previous CinescriptCamera off the camera stack.
		CinescriptEndAction = X2Action_EndCinescriptCamera(class'X2Action_EndCinescriptCamera'.static.AddToVisualizationTree(SourceTrack, Context, false, SourceTrack.LastActionAdded));
		CinescriptEndAction.CinescriptCamera = CinescriptCamera;
		CinescriptEndAction.bForceEndImmediately = true;

		// Add an action to push a new CinescriptCamera onto the camera stack.
		AbilityTemplate.CinescriptCameraType = "StandardGunFiring";
		CinescriptCamera = class'X2Camera_Cinescript'.static.CreateCinescriptCameraForAbility(Context);
		CinescriptCamera.TargetObjectIdOverride = AbilityContext.MultiTargets[TargetIndex].ObjectID;
		CinescriptStartAction = X2Action_StartCinescriptCamera(class'X2Action_StartCinescriptCamera'.static.AddToVisualizationTree(SourceTrack, Context, false, SourceTrack.LastActionAdded));
		CinescriptStartAction.CinescriptCamera = CinescriptCamera;
		AbilityTemplate.CinescriptCameraType = PreviousCinescriptCameraType;

		// Add a custom Fire action to the shooter Metadata.
		TargetVisualizer = History.GetVisualizer(AbilityContext.MultiTargets[TargetIndex].ObjectID);
		FireFaceoffAction = X2Action_Fire_Faceoff(class'X2Action_Fire_Faceoff'.static.AddToVisualizationTree(SourceTrack, Context, false, SourceTrack.LastActionAdded));
		FireFaceoffAction.SetFireParameters(Context.IsResultContextMultiHit(TargetIndex), AbilityContext.MultiTargets[TargetIndex].ObjectID, false);
		FireFaceoffAction.vTargetLocation = TargetVisualizer.Location;

		//  Setup target response
		TargetVisualizerInterface = X2VisualizerInterface(TargetVisualizer);
		ActionMetadata = EmptyTrack;
		ActionMetadata.VisualizeActor = TargetVisualizer;
		TargetStateObject = VisualizeGameState.GetGameStateForObjectID(AbilityContext.MultiTargets[TargetIndex].ObjectID);
		if( TargetStateObject != none )
		{
			History.GetCurrentAndPreviousGameStatesForObjectID(AbilityContext.MultiTargets[TargetIndex].ObjectID,
															   ActionMetadata.StateObject_OldState, ActionMetadata.StateObject_NewState,
															   eReturnType_Reference,
															   VisualizeGameState.HistoryIndex);
			`assert(ActionMetadata.StateObject_NewState == TargetStateObject);
		}
		else
		{
			//If TargetStateObject is none, it means that the visualize game state does not contain an entry for the primary target. Use the history version
			//and show no change.
			ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(AbilityContext.MultiTargets[TargetIndex].ObjectID);
			ActionMetadata.StateObject_NewState = ActionMetadata.StateObject_OldState;
		}

		for( EffectIndex = 0; EffectIndex < AbilityTemplate.AbilityMultiTargetEffects.Length; ++EffectIndex )
		{
			TargetEffect = AbilityTemplate.AbilityMultiTargetEffects[EffectIndex];
			ApplyResult = Context.FindMultiTargetEffectApplyResult(TargetEffect, TargetIndex);

			// Target effect visualization
			AbilityTemplate.AbilityMultiTargetEffects[EffectIndex].AddX2ActionsForVisualization(VisualizeGameState, ActionMetadata, ApplyResult);

			// Source effect visualization
			AbilityTemplate.AbilityMultiTargetEffects[EffectIndex].AddX2ActionsForVisualizationSource(VisualizeGameState, SourceTrack, ApplyResult);
		}
		if( TargetVisualizerInterface != none )
		{
			//Allow the visualizer to do any custom processing based on the new game state. For example, units will create a death action when they reach 0 HP.
			TargetVisualizerInterface.BuildAbilityEffectsVisualization(VisualizeGameState, ActionMetadata);
		}

		ApplyWeaponDamageAction = X2Action_ApplyWeaponDamageToUnit(VisualizationMgr.GetNodeOfType(VisualizationMgr.BuildVisTree, class'X2Action_ApplyWeaponDamageToUnit', TargetVisualizer));
		if( ApplyWeaponDamageAction != None )
		{
			VisualizationMgr.DisconnectAction(ApplyWeaponDamageAction);
			VisualizationMgr.ConnectAction(ApplyWeaponDamageAction, VisualizationMgr.BuildVisTree, false, FireFaceoffAction);
		}
	}
	class'X2Action_EnterCover'.static.AddToVisualizationTree(SourceTrack, Context, false, SourceTrack.LastActionAdded);

	// Add an action to pop the last CinescriptCamera off the camera stack.
	CinescriptEndAction = X2Action_EndCinescriptCamera(class'X2Action_EndCinescriptCamera'.static.AddToVisualizationTree(SourceTrack, Context, false, SourceTrack.LastActionAdded));
	CinescriptEndAction.CinescriptCamera = CinescriptCamera;

	//Add a join so that all hit reactions and other actions will complete before the visualization sequence moves on. In the case
	// of fire but no enter cover then we need to make sure to wait for the fire since it isn't a leaf node
	VisualizationMgr.GetAllLeafNodes(VisualizationMgr.BuildVisTree, LeafNodes);

	if( VisualizationMgr.BuildVisTree.ChildActions.Length > 0 )
	{
		JoinActions = X2Action_MarkerNamed(class'X2Action_MarkerNamed'.static.AddToVisualizationTree(SourceTrack, Context, false, none, LeafNodes));
		JoinActions.SetName("Join");
	}
}

// Surgical Precision
// (AbilityName="F_SurgicalPrecision")
// Reduces aim penalties from cover by half
// Original Creator: Musashi
static function X2AbilityTemplate SurgicalPrecision()
{
    local X2AbilityTemplate Template;
	local XMBEffect_ConditionalBonus HighCoverEffect;
	local XMBEffect_ConditionalBonus LowCoverEffect;

	HighCoverEffect = new class'XMBEffect_ConditionalBonus';
	HighCoverEffect.AbilityTargetConditions.AddItem(default.FullCoverCondition);
	HighCoverEffect.AddToHitModifier(class'X2AbilityToHitCalc_StandardAim'.default.HIGH_COVER_BONUS / 2);
	HighCoverEffect.AbilityTargetConditions.AddItem(new class'X2Condition_NonReactionFire');

	Template = Passive('F_SurgicalPrecision', "img:///UILibrary_FavidsPerkPack.UIPerk_SnipersEye", default.SURGICALPRECISION_AWC, HighCoverEffect);

	LowCoverEffect = new class'XMBEffect_ConditionalBonus';
	LowCoverEffect.AbilityTargetConditions.AddItem(default.HalfCoverCondition);
	LowCoverEffect.AddToHitModifier(class'X2AbilityToHitCalc_StandardAim'.default.LOW_COVER_BONUS / 2);
	LowCoverEffect.AbilityTargetConditions.AddItem(new class'X2Condition_NonReactionFire');

    AddSecondaryEffect(Template, LowCoverEffect);

    return Template;
}

// Critical Target
// (AbilityName="F_CriticalTarget")
// Grants a critical chance bonus on the nearest enemy. Does not apply to melee attacks. Passive.
// Original Creator: xylthixlm
static function X2AbilityTemplate CriticalTarget()
{
	local XMBEffect_ConditionalBonus Effect;

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.AddToHitModifier(default.CRITICALTARGET_CRIT_BONUS, eHit_Crit);

	Effect.AbilityTargetConditions.AddItem(new class'X2Condition_ClosestVisibleEnemy');
	Effect.AbilityTargetConditions.AddItem(default.RangedCondition);

	return Passive('F_CriticalTarget', "img:///UILibrary_XPerkIconPack.UIPerk_star_crit", default.CRITICALTARGET_AWC, Effect);
}

// Focused Defense
// (AbilityName="F_FocusedDefense")
// Grants a defense against attacks by the closest visible enemy while not flanked. Passive.
// Original Creator: xylthixlm
static function X2AbilityTemplate FocusedDefense()
{
	local XMBEffect_ConditionalBonus Effect;
	local XMBCondition_CoverType NotFlankedCondition;

	NotFlankedCondition = new class'XMBCondition_CoverType';
	NotFlankedCondition.ExcludedCoverTypes.AddItem(CT_None);

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.AddToHitAsTargetModifier(-default.FOCUSEDDEFENSE_DEFENSE_BONUS, eHit_Success);

	Effect.AbilityTargetConditionsAsTarget.AddItem(NotFlankedCondition);
	Effect.AbilityTargetConditionsAsTarget.AddItem(new class'X2Condition_ClosestVisibleEnemy');

	return Passive('F_FocusedDefense', "img:///UILibrary_XPerkIconPack.UIPerk_star_defense", default.FOCUSEDDEFENSE_AWC, Effect);
}

// Sniper Elite
// (AbilityName="F_SniperElite")
// Removes squadsight penalties. Passive.
// Original Creator: Musashi
static function X2AbilityTemplate SniperElite()
{
	return Passive('F_SniperElite', "img:///UILibrary_XPerkIconPack.UIPerk_sniper_blaze", default.SNIPERELITE_AWC, new class'X2Effect_NoSquadsightPenalties');
}

// Sensor Overlays
// (AbilityName="F_SensorOverlays")
// All allies gain bonus critical chance against enemies you can see. Passive.
// Original Creator: xylthixlm
static function X2AbilityTemplate SensorOverlays()
{
	local X2Effect_ConditionalBonusAgainstOwnerTargets Effect;

	Effect = new class'X2Effect_ConditionalBonusAgainstOwnerTargets';
	Effect.EffectName = 'F_SensorOverlays';
	Effect.DuplicateResponse = eDupe_Allow;
	Effect.AddToHitModifier(default.SENSOROVERLAYS_CRIT_BONUS, eHit_Crit);
	Effect.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);

	return SquadPassive('F_SensorOverlays', "img:///UILibrary_XPerkIconPack.UIPerk_gremlin_crit2", default.SENSOROVERLAYS_AWC, Effect);
}

// Phalanx Protocol
// (AbilityName="F_PhalanxProtocol", ApplyToWeaponSlot=eInvSlot_SecondaryWeapon)
// Your GREMLIN moves to every ally, granting all of them a Defense bonus until the start of your next turn.
// Original Creator: xylthixlm
// NOTE: Gremlin animations are wonky, but functionality is fine
static function X2AbilityTemplate PhalanxProtocol()
{
	local X2Effect Effect;
	local X2AbilityTemplate Template;
	local X2AbilityMultiTarget_AllAllies MultiTargetingStyle;
	local X2Condition_UnitProperty TargetCondition;

	Template = SelfTargetActivated('F_PhalanxProtocol', "img:///UILibrary_XPerkIconPack.UIPerk_gremlin_defense2", default.PHALANXPROTOCOL_AWC, none);

	Effect = class'X2Ability_SpecialistAbilitySet'.static.AidProtocolEffect();
	Template.AddMultiTargetEffect(Effect);

	MultiTargetingStyle = new class'X2AbilityMultiTarget_AllAllies';
	MultiTargetingStyle.bAllowSameTarget = true;
	MultiTargetingStyle.NumTargetsRequired = 1; //At least one ally must be a valid target
	Template.AbilityMultiTargetStyle = MultiTargetingStyle;

	TargetCondition = new class'X2Condition_UnitProperty';
	TargetCondition.ExcludeHostileToSource = true;
	TargetCondition.ExcludeFriendlyToSource = false;
	TargetCondition.RequireSquadmates = true;
	Template.AbilityMultiTargetConditions.AddItem(TargetCondition);

	AddCharges(Template, default.PHALANXPROTOCOL_CHARGES);
    
	// Gremlin animation code
	Template.BuildNewGameStateFn = class'X2Ability_SpecialistAbilitySet'.static.SendGremlinToOwnerLocation_BuildGameState;
	Template.BuildVisualizationFn = class'X2Ability_SpecialistAbilitySet'.static.GremlinRestoration_BuildVisualization;
	Template.bSkipFireAction = true;
	Template.bShowActivation = true;
	Template.bStationaryWeapon = true;
	Template.bSkipPerkActivationActions = true;
	Template.PostActivationEvents.AddItem('ItemRecalled');
	Template.TargetingMethod = class'X2TargetingMethod_GremlinAOE';
    
    // for later ref
	Template.CustomSelfFireAnim = 'NO_DefenseProtocolA';

	return Template;
}

// Improved Suppression
// (AbilityName="F_ImprovedSuppression")
// Your Suppression and Area Suppression abilities also disorient the primary target.
// Original Creator: xylthixlm
static function X2AbilityTemplate ImprovedSuppression()
{
	local X2AbilityTemplate Template;
	local X2Effect_Persistent Effect;
	local XMBAbilityTrigger_EventListener EventListener;
	local XMBCondition_AbilityName NameCondition;

	Effect = class'X2StatusEffects'.static.CreateDisorientedStatusEffect();
	Effect.VisualizationFn = EffectFlyOver_Visualization;
	Effect.TargetConditions.Length = 0;

	Template = TargetedDebuff('F_ImprovedSuppression', "img:///UILibrary_XPerkIconPack.UIPerk_suppression_plus", default.IMPROVEDSUPPRESSION_AWC, none,, eCost_None);
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

// Breach
// (AbilityName="F_Breach", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Fire a shot that destroys cover and shreds armor in a small area, but deals reduced damage and can't get critical hits.
// Original Creator: xylthixlm
static function X2AbilityTemplate Breach()
{
	local X2AbilityTemplate                 Template;	
	local X2AbilityCost_Ammo                AmmoCost;
	local X2Effect_ApplyWeaponDamage        WeaponDamageEffect;
	local X2AbilityTarget_Cursor            CursorTarget;
	local XMBAbilityMultiTarget_Radius      RadiusMultiTarget;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2AbilityToHitCalc_StandardAim    StandardAim;
	local X2AbilityCooldown                 Cooldown;
	local AdditionalCooldownInfo			AdditionalCooldown;
    local WeaponDamageValue                 Damage;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'F_Breach');
	
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.IconImage = "img:///UILibrary_XPerkIconPack.UIPerk_shot_blossom";
	Template.Hostility = eHostility_Offensive;
	Template.DisplayTargetHitChance = false;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_CORPORAL_PRIORITY;

	Template.TargetingMethod = class'X2TargetingMethod_CoverBlockingAOE';

	AmmoCost = new class'X2AbilityCost_Ammo';	
	AmmoCost.iAmmo = default.BREACH_AMMO_COST;
	Template.AbilityCosts.AddItem(AmmoCost);
	
	Template.AbilityCosts.AddItem(ActionPointCost(eCost_WeaponConsumeAll));
	
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.BREACH_COOLDOWN;
	AdditionalCooldown.AbilityName = 'ShadowOps_Breach';
	AdditionalCooldown.bUseAbilityCooldownNumTurns = true;
	Cooldown.AditionalAbilityCooldowns.AddItem(AdditionalCooldown);
	Template.AbilityCooldown = Cooldown;
	
	StandardAim = new class'X2AbilityToHitCalc_StandardAim';
	StandardAim.bGuaranteedHit = true;
	StandardAim.bAllowCrit = false;
	Template.AbilityToHitCalc = StandardAim;
	
    Damage.Damage = default.BREACH_DAMAGE;
    Damage.Shred = default.BREACH_SHRED;
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
    WeaponDamageEffect.bIgnoreBaseDamage = true;
	WeaponDamageEffect.EffectDamageValue = Damage;
	WeaponDamageEffect.EnvironmentalDamageAmount = default.BREACH_ENVIRONMENT_DAMAGE;
	Template.AddMultiTargetEffect(WeaponDamageEffect);
    
	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.FixedAbilityRange = default.BREACH_RANGE;
	Template.AbilityTargetStyle = CursorTarget;

	RadiusMultiTarget = new class'XMBAbilityMultiTarget_Radius';
	RadiusMultiTarget.fTargetRadius = default.BREACH_RADIUS;
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	Template.AbilityShooterConditions.AddItem(UnitPropertyCondition);

	Template.AddShooterEffectExclusions();

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.bCrossClassEligible = default.BREACH_AWC;

	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.MeleeLostSpawnIncreasePerUse;

	return Template;	
}

// Liquidator
// (AbilityName="F_Liquidator", ApplyToWeaponSlot=eInvSlot_SecondaryWeapon)
// Kills with your pistol now refund your actions. Passive.
// Original Creator: xylthixlm
static function X2AbilityTemplate Liquidator()
{
	local XMBEffect_AbilityCostRefund Effect;

	Effect = new class'XMBEffect_AbilityCostRefund';
	Effect.TriggeredEvent = 'CoupDeGrace';
	Effect.AbilityTargetConditions.AddItem(default.DeadCondition);
	Effect.AbilityTargetConditions.AddItem(default.MatchingWeaponCondition);

	return Passive('F_Liquidator', "img:///UILibrary_XPerkIconPack.UIPerk_pistol_chevron", default.LIQUIDATOR_AWC, Effect);
}

// Slam Fire
// (AbilityName="F_SlameFire", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// For the rest of the turn, whenever you get a critical hit with your primary weapon, your actions are refunded.
// Original Creator: xylthixlm
static function X2AbilityTemplate SlamFire()
{
	local X2AbilityTemplate					Template;
	local XMBEffect_AbilityCostRefund       SlamFireEffect;

	SlamFireEffect = new class'XMBEffect_AbilityCostRefund';
	SlamFireEffect.EffectName = 'SlamFire';
	SlamFireEffect.TriggeredEvent = 'SlamFire';
	SlamFireEffect.AbilityTargetConditions.AddItem(default.MatchingWeaponCondition);
	SlamFireEffect.AbilityTargetConditions.AddItem(default.CritCondition);
	SlamFireEffect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnEnd);

	Template = SelfTargetActivated('F_SlamFire', "img:///UILibrary_XPerkIconPack.UIPerk_crit_chevron", default.SLAMFIRE_AWC, SlamFireEffect, class'UIUtilities_Tactical'.const.CLASS_COLONEL_PRIORITY, eCost_Free);
	Template.bShowActivation = true;
    
    AddCooldown(Template, default.SLAMFIRE_COOLDOWN);

	class'X2Ability_RangerAbilitySet'.static.SuperKillRestrictions(Template, 'Serial_SuperKillCheck');
	Template.AddShooterEffectExclusions();

	return Template;
}

// Tactician
// (AbilityName="F_Tactician", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Missed shots with your primary weapon deal a small amount of damage.
// Original Creator: xylthixlm
static function X2AbilityTemplate Tactician()
{
	local XMBEffect_ConditionalBonus Effect;
	local X2AbilityTemplate Template;

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.AbilityTargetConditions.AddItem(default.MatchingWeaponCondition);
    Effect.AddDamageModifier(default.TACTICIAN_CONVENTIONAL_DAMAGE, eHit_Miss, 'conventional');
    Effect.AddDamageModifier(default.TACTICIAN_LASER_DAMAGE, eHit_Miss, 'laser_lw');
    Effect.AddDamageModifier(default.TACTICIAN_MAGNETIC_DAMAGE, eHit_Miss, 'magnetic');
    Effect.AddDamageModifier(default.TACTICIAN_COIL_DAMAGE, eHit_Miss, 'coilgun_lw');
    Effect.AddDamageModifier(default.TACTICIAN_BEAM_DAMAGE, eHit_Miss, 'beam');

	Template = Passive('F_Tactician', "img:///UILibrary_SOInfantry.UIPerk_tactician", default.TACTICIAN_AWC, Effect);

	return Template;
}

// Eat This
// (AbilityName="F_EatThis")
// You gain Aim and Crit on attacks against adjacent targets. The bonus decreases with range.
// Original Creator: xylthixlm
static function X2AbilityTemplate EatThis()
{
	local XMBEffect_ConditionalBonus Effect;

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.AddToHitModifier(default.EATTHIS_AIM, eHit_Success);
	Effect.AddToHitModifier(default.EATTHIS_CRIT, eHit_Crit);

	Effect.ScaleValue = new class'XMBValue_Distance';
	Effect.ScaleMultiplier = -1.0 / default.EATTHIS_MAX_TILES;
	Effect.ScaleBase = 1.0 - Effect.ScaleMultiplier + 0.5 / max(default.EATTHIS_AIM, default.EATTHIS_CRIT); // Add a constant for rounding
	Effect.ScaleMax = 1.0;

	Effect.AbilityTargetConditions.AddItem(default.RangedCondition);

	return Passive('F_EatThis', "img:///UILibrary_SODragoon.UIPerk_eatthis", default.EATTHIS_AWC, Effect);
}

// Fastball
// (AbilityName="F_Fastball")
// The next grenade you throw or launch this turn doesn't cost an action.
// Original Creator: xylthixlm
static function X2AbilityTemplate Fastball()
{
	local X2AbilityTemplate                 Template;	
	local XMBEffect_AbilityCostRefund		FastballEffect;
	local XMBCondition_AbilityName			NameCondition;

	FastballEffect = new class'XMBEffect_AbilityCostRefund';
	FastballEffect.TriggeredEvent = 'Fastball';
	FastballEffect.bShowFlyOver = true;
	FastballEffect.CountValueName = 'FastballUses';
	FastballEffect.MaxRefundsPerTurn = 1;
	FastballEffect.bFreeCost = true;
	FastballEffect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnEnd);

	NameCondition = new class'XMBCondition_AbilityName';
	NameCondition.IncludeAbilityNames.AddItem('ThrowGrenade');
	NameCondition.IncludeAbilityNames.AddItem('LaunchGrenade');
	FastballEffect.AbilityTargetConditions.AddItem(NameCondition);

	Template = SelfTargetActivated('F_Fastball', "img:///UILibrary_SOCombatEngineer.UIPerk_fastball", default.FASTBALL_AWC, FastballEffect,, eCost_Free);
	AddCooldown(Template, default.FASTBALL_COOLDOWN);

	return Template;
}

// Vanish
// (AbilityName="F_Vanish")
// If you begin your turn with no enemies able to see you, you gain concealment.
// Original Creator: xylthixlm
static function X2AbilityTemplate Vanish()
{
	local X2AbilityTemplate						Template;
	Template = PurePassive('F_Vanish', "img:///UILibrary_SODragoon.UIPerk_vanish", default.VANISH_AWC);
	Template.AdditionalAbilities.AddItem('F_VanishTrigger');

	return Template;
}

static function X2AbilityTemplate VanishTrigger()
{
	local X2AbilityTemplate						Template;
	local X2Effect_RangerStealth                StealthEffect;
	local X2Condition_NotVisibleToEnemies		VisibilityCondition;
	local X2AbilityTrigger_EventListener		EventListener;
	local X2AbilityCooldown						Cooldown;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'F_VanishTrigger');

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.IconImage = "img:///UILibrary_SODragoon.UIPerk_vanish";

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.VANISH_COOLDOWN;
	Template.AbilityCooldown = Cooldown;

	EventListener = new class'X2AbilityTrigger_EventListener';
	EventListener.ListenerData.Deferral = ELD_OnStateSubmitted;
	EventListener.ListenerData.EventID = 'PlayerTurnBegun';
	EventListener.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_Self;
	EventListener.ListenerData.Filter = eFilter_Player;
	Template.AbilityTriggers.AddItem(EventListener);

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AbilityShooterConditions.AddItem(new class'X2Condition_Stealth');

	VisibilityCondition = new class'X2Condition_NotVisibleToEnemies';
	Template.AbilityShooterConditions.AddItem(VisibilityCondition);

	StealthEffect = new class'X2Effect_RangerStealth';
	StealthEffect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnEnd);
	StealthEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, true);
	StealthEffect.bRemoveWhenTargetConcealmentBroken = true;
	Template.AddTargetEffect(StealthEffect);

	Template.AddTargetEffect(class'X2Effect_Spotted'.static.CreateUnspottedEffect());

	Template.ActivationSpeech = 'ActivateConcealment';
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.bSkipFireAction = true;

	return Template;
}

// Fracture
// (AbilityName="F_Fracture", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Your primary weapon attacks against mechanical units have a bonus to Critical Chance and shred additional armor.
// Original Creator: xylthixlm
static function X2AbilityTemplate Fracture()
{
	local XMBEffect_ConditionalBonus Effect;
	local X2Condition_UnitProperty Condition;

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.AbilityTargetConditions.AddItem(default.MatchingWeaponCondition);
    Effect.AddShredModifier(default.FRACTURE_SHRED, eHit_Success);
    Effect.AddToHitModifier(default.FRACTURE_CRIT_CHANCE, eHit_Crit);

	Condition = new class'X2Condition_UnitProperty';
	Condition.ExcludeOrganic = true;
	Condition.IncludeWeakAgainstTechLikeRobot = true;
	Effect.AbilityTargetConditions.AddItem(Condition);

	return Passive('F_Fracture', "img:///UILibrary_SOCombatEngineer.UIPerk_fracture", default.FRACTURE_AWC, Effect);
}

// Stalker
// (AbilityName="F_Stalker")
// Gain increased mobility and aim while concealed.
// Original Creator: xylthixlm
static function X2AbilityTemplate Stalker()
{
	local XMBEffect_ConditionalStatChange Effect;

	Effect = new class'XMBEffect_ConditionalStatChange';
	Effect.AddPersistentStatChange(eStat_Mobility, default.STALKER_MOBILITY);
	Effect.AddPersistentStatChange(eStat_Offense, default.STALKER_AIM);
	Effect.Conditions.AddItem(new class'XMBCondition_Concealed');

	return Passive('F_Stalker', "img:///UILibrary_SOHunter.UIPerk_stalker", default.STALKER_AWC, Effect);
}