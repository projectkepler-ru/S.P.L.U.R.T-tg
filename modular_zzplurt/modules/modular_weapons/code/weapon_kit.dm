/obj/item/weaponcrafting/gunkit/splurt_laser_assault
	name = "laser assault rifle conversion kit (lethal)"
	desc = "A large suitcase containing disposable tools and upgraded pieces for improving your laser rifle."

/datum/crafting_recipe/assault_splurt_laser
	name = "Laser Assault Rifle"
	result = /obj/item/melee/reverbing_blade/oscula
	reqs = list(
		/obj/item/gun/energy/laser = 1,
		/obj/item/weaponcrafting/gunkit/splurt_laser_assault = 1,
	)
	time = 20 SECONDS
	category = CAT_WEAPON_RANGED
