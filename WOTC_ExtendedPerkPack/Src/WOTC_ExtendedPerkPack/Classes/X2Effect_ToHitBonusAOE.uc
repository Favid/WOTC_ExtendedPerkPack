class X2Effect_ToHitBonusAOE extends X2Effect_PersistentAOE;

var int ToHitBonus;

function GetToHitModifiers(XComGameState_Effect EffectState, XComGameState_Unit Attacker, XComGameState_Unit Target, XComGameState_Ability AbilityState, class<X2AbilityToHitCalc> ToHitType, bool bMelee, bool bFlanking, bool bIndirectFire, out array<ShotModifierInfo> ShotModifiers)
{
	local ShotModifierInfo ShotMod;

	if (Target != none && IsEffectCurrentlyRelevant(EffectState, Attacker))
	{
		ShotMod.ModType = eHit_Success;
		ShotMod.Reason = FriendlyName;
		ShotMod.Value = ToHitBonus;
		ShotModifiers.AddItem(ShotMod);
	}
}

DefaultProperties
{
	EffectName="ToHitBonusAOE"
}

