class X2Effect_SuppressionDamage extends X2Effect_ApplyWeaponDamage;

function WeaponDamageValue GetBonusEffectDamageValue(XComGameState_Ability AbilityState, XComGameState_Unit SourceUnit, XComGameState_Item SourceWeapon, StateObjectReference TargetRef)
{
    local name SourceAbilityName;
    local WeaponDamageValue ReturnDamageValue;

    if(SourceUnit.HasSoldierAbility('F_Havoc'))
    {
        SourceAbilityName = AbilityState.GetMyTemplateName();
        if(SourceAbilityName == 'Suppression' || SourceAbilityName == 'LW2WotC_AreaSuppression')
        {
	        ReturnDamageValue.Damage = 1;
        }
    }

    return ReturnDamageValue;
}

DefaultProperties
{
	bAllowFreeKill = false
	bAllowWeaponUpgrade = false
	bIgnoreBaseDamage = true
}