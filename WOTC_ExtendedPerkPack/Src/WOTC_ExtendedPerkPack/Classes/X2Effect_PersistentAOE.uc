class X2Effect_PersistentAOE extends X2Effect_Persistent;

var bool IncludeOwner;
var float AOEDistanceSquared;

function OnUnitChangedTile(const out TTile NewTileLocation, XComGameState_Effect EffectState, XComGameState_Unit TargetUnit)
{
	local XComGameStateHistory History;
	local XComGameState_Unit SourceUnit;
	local XComGameState_Effect OtherEffect;
	local bool bAddTarget;
	local int i;

	History = `XCOMHISTORY;
	if (TargetUnit.ObjectID != EffectState.ApplyEffectParameters.SourceStateObjectRef.ObjectID)
	{
		SourceUnit = XComGameState_Unit(History.GetGameStateForObjectID(EffectState.ApplyEffectParameters.SourceStateObjectRef.ObjectID));
		if (SourceUnit != none && SourceUnit.IsAlive() && TargetUnit.IsAlive())
		{
			bAddTarget = class'Helpers'.static.IsTileInRange(SourceUnit.TileLocation, NewTileLocation, AOEDistanceSquared);
			EffectState.UpdatePerkTarget(bAddTarget);
		}
	}
	else
	{
		//  When the source moves, check all other targets and update them
		SourceUnit = TargetUnit;
		for (i = 0; i < EffectState.ApplyEffectParameters.AbilityInputContext.MultiTargets.Length; ++i)
		{
			if (EffectState.ApplyEffectParameters.AbilityInputContext.MultiTargets[i].ObjectID != SourceUnit.ObjectID)
			{
				TargetUnit = XComGameState_Unit(History.GetGameStateForObjectID(EffectState.ApplyEffectParameters.AbilityInputContext.MultiTargets[i].ObjectID));
				OtherEffect = TargetUnit.GetUnitAffectedByEffectState(default.EffectName);
				if (OtherEffect != none)
				{
					bAddTarget = class'Helpers'.static.IsTileInRange(NewTileLocation, TargetUnit.TileLocation, AOEDistanceSquared);
					OtherEffect.UpdatePerkTarget(bAddTarget);
				}
			}
		}
	}
}

function bool IsEffectCurrentlyRelevant(XComGameState_Effect EffectGameState, XComGameState_Unit TargetUnit)
{
	local XComGameState_Unit SourceUnit;

	//`LOG("=== Verifying if effect relevant: " @ EffectName);
	//`LOG("=== SourceUnit: " @ SourceUnit.GetFullName());
	//`LOG("=== TargetUnit: " @ TargetUnit.GetFullName());

	SourceUnit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(EffectGameState.ApplyEffectParameters.SourceStateObjectRef.ObjectID));
	
	if (SourceUnit == none || SourceUnit.IsDead() || TargetUnit == none || TargetUnit.IsDead())
	{
		//`LOG("=== Not relevant: Invalid source or target");
		return false;
	}

    if (SourceUnit.ObjectID == TargetUnit.ObjectID)
    {
		//`LOG("=== Same source and target. Relevant?: " @ string(IncludeOwner));
        return IncludeOwner;
    }
    else
	{
		//  jbouscher: uses tile range rather than unit range so the visual check can match this logic
		if (!class'Helpers'.static.IsTileInRange(SourceUnit.TileLocation, TargetUnit.TileLocation, AOEDistanceSquared))
		{
			//`LOG("=== Not Relevant: Target not in range of source");
			return false;
		}
	}
	
	//`LOG("=== Effect relevant: " @ EffectName);
	return true;
}

DefaultProperties
{
	EffectName="PersistentAOE"
	DuplicateResponse=eDupe_Ignore
}

