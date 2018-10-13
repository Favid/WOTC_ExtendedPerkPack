class X2Effect_ReturnFireAOE extends X2Effect_Persistent;

var name AbilityToActivate;         //  ability to activate when the covering fire check is matched
var name GrantActionPoint;          //  action point to give the shooter when covering fire check is matched
var int MaxPointsPerTurn;           //  max times per turn the action point can be granted
var bool bPreEmptiveFire;           //  if true, the reaction fire will happen prior to the attacker's shot; otherwise it will happen after
var bool bOnlyDuringEnemyTurn;      //  only activate the ability during the enemy turn (e.g. prevent return fire during the sharpshooter's own turn)
var bool bUseMultiTargets;          //  initiate AbilityToActivate against yourself and look for multi targets to hit, instead of direct retaliation
var bool bOnlyWhenAttackMisses;		//  Only activate the ability if the attack missed
var bool bSelfTargeting;			//  The ability being activated targets the covering unit (self)
var float RequiredAllyRange;        //  The targeted ally must be within this range from the owner of this effect. Value of 0 ignores this.
var bool bAllowSelf;                //  If true, return fire will activate if you are targeted; if false, the target must be an ally

function RegisterForEvents(XComGameState_Effect EffectGameState)
{
	local X2EventManager EventMgr;
	local Object EffectObj;

	EventMgr = `XEVENTMGR;

	EffectObj = EffectGameState;

	EventMgr.RegisterForEvent(EffectObj, 'AbilityActivated', ReturnFireAOECheck, ELD_OnStateSubmitted,,,, EffectObj);
}

static function EventListenerReturn ReturnFireAOECheck(Object EventData, Object EventSource, XComGameState GameState, Name Event, Object CallbackData)
{
    local XComGameState_Effect          EffectState;
	local XComGameState_Unit AttackingUnit, CoveringUnit, TargetUnit;
	local XComGameStateHistory History;
	local X2Effect_ReturnFireAOE CoveringFireEffect;
	local StateObjectReference AbilityRef;
	local XComGameState_Ability AbilityState;
	local XComGameStateContext_Ability AbilityContext;
	local XComGameState NewGameState;
    local UnitValue                     ActivationCounterValue;

	AbilityContext = XComGameStateContext_Ability(GameState.GetContext());
	if (AbilityContext != none)
	{
		History = `XCOMHISTORY;
	    EffectState = XComGameState_Effect(CallbackData);
        CoveringUnit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(EffectState.ApplyEffectParameters.TargetStateObjectRef.ObjectID));
		AttackingUnit = class'X2TacticalGameRulesetDataStructures'.static.GetAttackingUnitState(GameState);
        TargetUnit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(AbilityContext.InputContext.PrimaryTarget.ObjectID));
		if (AttackingUnit != none && AttackingUnit.IsEnemyUnit(CoveringUnit))
		{
			CoveringFireEffect = X2Effect_ReturnFireAOE(EffectState.GetX2Effect());
			`assert(CoveringFireEffect != none);

			if (CoveringFireEffect.bOnlyDuringEnemyTurn)
			{
				//  make sure it's the enemy turn if required
				if (`TACTICALRULES.GetCachedUnitActionPlayerRef().ObjectID != AttackingUnit.ControllingPlayer.ObjectID)
					return ELR_NoInterrupt;
			}

			if (CoveringFireEffect.bPreEmptiveFire)
			{
				//  for pre emptive fire, only process during the interrupt step
				if (AbilityContext.InterruptionStatus != eInterruptionStatus_Interrupt)
					return ELR_NoInterrupt;
			}
			else
			{
				//  for non-pre emptive fire, don't process during the interrupt step
				if (AbilityContext.InterruptionStatus == eInterruptionStatus_Interrupt)
					return ELR_NoInterrupt;
			}

            if (CoveringFireEffect.RequiredAllyRange > 0)
            {
                // do nothing if the target unit is not within the required range of the covering unit
                if (!class'Helpers'.static.IsTileInRange(CoveringUnit.TileLocation, TargetUnit.TileLocation, CoveringFireEffect.RequiredAllyRange))
                    return ELR_NoInterrupt;
            }


            if (!CoveringFireEffect.bAllowSelf)
            {
                if (CoveringUnit.ObjectID == TargetUnit.ObjectID)
                    return ELR_NoInterrupt;
            }

			if (CoveringFireEffect.bOnlyWhenAttackMisses)
			{
				//  do nothing if the covering unit was not hit in the attack
				if (class'XComGameStateContext_Ability'.static.IsHitResultHit(AbilityContext.ResultContext.HitResult))
					return ELR_NoInterrupt;
			}

			AbilityRef = CoveringUnit.FindAbility(CoveringFireEffect.AbilityToActivate);
			AbilityState = XComGameState_Ability(History.GetGameStateForObjectID(AbilityRef.ObjectID));
			if (AbilityState != none)
			{
                CoveringUnit.GetUnitValue('ReturnFireAOE_GrantsThisTurn', ActivationCounterValue);

				if (CoveringFireEffect.GrantActionPoint != '' && (CoveringFireEffect.MaxPointsPerTurn > ActivationCounterValue.fValue || CoveringFireEffect.MaxPointsPerTurn <= 0))
				{
					NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState(string(GetFuncName()));

			        CoveringUnit.SetUnitFloatValue ('ReturnFireAOE_GrantsThisTurn', ActivationCounterValue.fValue + 1, eCleanup_BeginTurn);

					CoveringUnit = XComGameState_Unit(NewGameState.ModifyStateObject(CoveringUnit.Class, CoveringUnit.ObjectID));
					CoveringUnit.ReserveActionPoints.AddItem(CoveringFireEffect.GrantActionPoint);

					if (AbilityState.CanActivateAbilityForObserverEvent(AttackingUnit, CoveringUnit) != 'AA_Success')
					{
						History.CleanupPendingGameState(NewGameState);
					}
					else
					{
						`TACTICALRULES.SubmitGameState(NewGameState);

						if (CoveringFireEffect.bUseMultiTargets)
						{
							AbilityState.AbilityTriggerAgainstSingleTarget(CoveringUnit.GetReference(), true);
						}
						else
						{
							AbilityContext = class'XComGameStateContext_Ability'.static.BuildContextFromAbility(AbilityState, AttackingUnit.ObjectID);
							if( AbilityContext.Validate() )
							{
								`TACTICALRULES.SubmitGameStateContext(AbilityContext);
							}
						}
					}
				}
				else if (CoveringFireEffect.bSelfTargeting && AbilityState.CanActivateAbilityForObserverEvent(CoveringUnit) == 'AA_Success')
				{
					AbilityState.AbilityTriggerAgainstSingleTarget(CoveringUnit.GetReference(), CoveringFireEffect.bUseMultiTargets);
				}
				else if (AbilityState.CanActivateAbilityForObserverEvent(AttackingUnit) == 'AA_Success')
				{
					if (CoveringFireEffect.bUseMultiTargets)
					{
						AbilityState.AbilityTriggerAgainstSingleTarget(CoveringUnit.GetReference(), true);
					}
					else
					{
						AbilityContext = class'XComGameStateContext_Ability'.static.BuildContextFromAbility(AbilityState, AttackingUnit.ObjectID);
						if( AbilityContext.Validate() )
						{
							`TACTICALRULES.SubmitGameStateContext(AbilityContext);
						}
					}
				}
			}
		}
	}
	return ELR_NoInterrupt;
}

DefaultProperties
{
	EffectName = "ReturnFireAOE"
	DuplicateResponse = eDupe_Ignore
	AbilityToActivate = "PistolReturnFire"
	GrantActionPoint = "returnfire"
	MaxPointsPerTurn = 0
	bPreEmptiveFire = false
	bOnlyDuringEnemyTurn = true
	bOnlyWhenAttackMisses = false
	bSelfTargeting = false
    RequiredAllyRange = 0
    bAllowSelf = true
}