/obj/item/gun/energy/laser/assault/splurt //because we might change our mind on things later. So I wnat to keep this modular aswell.
	name = "\improper assault laser rifle"
	desc = "The Type 5 Heat Delivery System Assault Variant, developed by Nanotrasen. The workhorse of Nanotrasen's security forces and paramilitary organizations."
	icon = 'modular_zzplurt/modules/modular_weapons/icons/obj/company_and_or_faction_based/nanotrasen_system_inc/guns48x.dmi'

	inhand_icon_state = "assault_laser"
	worn_icon_state = "assault_laser"

	burst_size = 2
	fire_delay = 2
	ammo_type = list(/obj/item/ammo_casing/energy/lasergun/assault) //Keep this here so we can edit it :)
	emp_resistance = 2
	weapon_weight = WEAPON_HEAVY
	projectile_speed_multiplier = 1.5

//Stats are similar-ish
