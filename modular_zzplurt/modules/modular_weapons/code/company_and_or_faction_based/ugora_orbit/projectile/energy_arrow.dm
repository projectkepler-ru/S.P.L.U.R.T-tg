/obj/item/ammo_casing/energy/hardlight_bow
	projectile_type = /obj/projectile/energy_arrow
	e_cost = LASER_SHOTS(1, STANDARD_CELL_CHARGE)

/obj/projectile/energy_arrow
	name = "energy arrow"
	desc = "Does it even matter? whos gonna read this shit"
	icon = 'modular_zzplurt\modules\modular_weapons\icons\obj\company_and_or_faction_based\ugora_orbit\projectile'
	icon_state = "arrow_energy"
	damage = 30
	speed = 1.3
	range = 14
	shrapnel_type = null
	embed_type = /datum/embedding/energy_arrow

/datum/embedding/energy_arrow
