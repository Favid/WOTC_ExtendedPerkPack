class X2Effect_AllowCritOnHolotargeted extends X2Effect_Persistent;

function bool AllowReactionFireCrit(XComGameState_Unit UnitState, XComGameState_Unit TargetState) 
{
	local StateObjectReference TargetEffectRef;
	local XComGameState_Effect TargetEffectState;
	local XComGameStateHistory History;
	local XComGameState_Unit HolotargetingUnit;
	
	History = `XCOMHISTORY;

	// Check the target unit to see if they have been holotargeted
	foreach TargetState.AffectedByEffects(TargetEffectRef)
	{
		TargetEffectState = XComGameState_Effect(History.GetGameStateForObjectID(TargetEffectRef.ObjectID));
		if (TargetEffectState.GetX2Effect().EffectName == 'LWHoloTarget')
		{
			// Target is holotargeted, so lets see who holotargeted him
			HolotargetingUnit = XComGameState_Unit(History.GetGameStateForObjectID(TargetEffectState.ApplyEffectParameters.SourceStateObjectRef.ObjectID));

			// Now check if the holotargeter has our new HiDefHolo ability
			if (HolotargetingUnit.FindAbility('F_HiDefHolo').ObjectID != 0)
			{
				return true;
			}
		}
	}

	return false;
}