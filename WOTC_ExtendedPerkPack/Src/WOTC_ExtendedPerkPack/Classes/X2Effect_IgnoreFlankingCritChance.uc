class X2Effect_IgnoreFlankingCritChance extends X2Effect_Persistent;

function GetToHitAsTargetModifiers(XComGameState_Effect EffectState, XComGameState_Unit Attacker, XComGameState_Unit Target, XComGameState_Ability AbilityState, class<X2AbilityToHitCalc> ToHitType, bool bMelee, bool bFlanking, bool bIndirectFire, out array<ShotModifierInfo> ShotModifiers)
{
	local ShotModifierInfo ShotInfo;

	if (bFlanking)
	{
		ShotInfo.ModType = eHit_Crit;
		ShotInfo.Reason = FriendlyName;
		ShotInfo.Value = Attacker.GetCurrentStat(eStat_FlankingCritChance) * -1;
		ShotModifiers.AddItem(ShotInfo);
	}
}

defaultproperties
{
    DuplicateResponse=eDupe_Ignore
}