/obj/item/gun/energy/laser/assault/splurt //because we might change our mind on things later. So I wnat to keep this modular aswell.
	name = "\improper assault laser rifle"
	desc = "The Type 5 Heat Delivery System Assault Variant, developed by Nanotrasen. The workhorse of Nanotrasen's security forces and paramilitary organizations."
	icon = 'icons/obj/weapons/guns/wide_guns.dmi'
	icon_state = "assault_laser"
	inhand_icon_state = "assault_laser"
	worn_icon_state = "assault_laser"
	slot_flags = ITEM_SLOT_BACK
	burst_size = 2
	fire_delay = 1
	ammo_type = list(/obj/item/ammo_casing/energy/lasergun/assault)
	emp_resistance = 2
	weapon_weight = WEAPON_HEAVY
	projectile_speed_multiplier = 1.5
	SET_BASE_PIXEL(-8, 0)
