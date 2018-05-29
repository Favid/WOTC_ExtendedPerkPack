class X2Effect_RefundAmmoCost extends X2Effect_Persistent;

function RegisterForEvents(XComGameState_Effect EffectGameState)
{
	local X2EventManager EventMgr;
	local Object EffectObj;

	EventMgr = `XEVENTMGR;

	EffectObj = EffectGameState;

	EventMgr.RegisterForEvent(EffectObj, 'AbilityActivated', RefundAmmoCostListener, ELD_OnStateSubmitted,,,, EffectObj);
}

static function EventListenerReturn RefundAmmoCostListener(Object EventData, Object EventSource, XComGameState NewGameState, Name InEventID, Object CallbackData)
{
	local XComGameStateContext_Ability AbilityContext;
	local XComGameState_Ability AbilityState;
	local XComGameState_Item SourceWeapon;

	AbilityContext = XComGameStateContext_Ability(NewGameState.GetContext());

    if (AbilityContext != none && AbilityContext.InterruptionStatus != eInterruptionStatus_Interrupt)
	{
	    AbilityState = XComGameState_Ability(EventData);
	    SourceWeapon = AbilityState.GetSourceWeapon();
	    if (SourceWeapon != none && SourceWeapon.InventorySlot == eInvSlot_PrimaryWeapon)
	    {
            if(SourceWeapon.Ammo < SourceWeapon.GetClipSize())
            {
                SourceWeapon.Ammo += AbilityState.iAmmoConsumed;
            }
	    }
    }

	return ELR_NoInterrupt;
}
