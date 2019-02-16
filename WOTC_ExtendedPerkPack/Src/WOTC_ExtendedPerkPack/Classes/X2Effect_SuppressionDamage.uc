class X2Effect_SuppressionDamage extends X2Effect_Shredder;

var int ConventionalDamage;
var int MagneticDamage;
var int BeamDamage;

function WeaponDamageValue GetBonusEffectDamageValue(XComGameState_Ability AbilityState, XComGameState_Unit SourceUnit, XComGameState_Item SourceWeapon, StateObjectReference TargetRef)
{
    local WeaponDamageValue ReturnDamageValue;
	local X2WeaponTemplate WeaponTemplate;

	ReturnDamageValue = super.GetBonusEffectDamageValue(AbilityState, SourceUnit, SourceWeapon, TargetRef);

	if ((SourceWeapon != none) &&
		(SourceUnit != none))
	{
		WeaponTemplate = X2WeaponTemplate(SourceWeapon.GetMyTemplate());
		if (WeaponTemplate != none)
		{
			if (WeaponTemplate.WeaponTech == 'magnetic')
				ReturnDamageValue.Damage += MagneticDamage;
			else if (WeaponTemplate.WeaponTech == 'beam')
				ReturnDamageValue.Damage += BeamDamage;
			else
				ReturnDamageValue.Damage += ConventionalDamage;
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