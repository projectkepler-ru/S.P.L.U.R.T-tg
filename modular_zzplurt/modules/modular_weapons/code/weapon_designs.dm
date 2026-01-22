/datum/design/splurt_laser_assault
	name = "Assault Laser Rifle (Lethal)"
	desc = "A kit containing improved focusing lens, pulse laser emitter and insulated coating for improving your laser gun."
	id = "assault_splurt_laser_kit"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/gold = SHEET_MATERIAL_AMOUNT * 5, /datum/material/iron = SHEET_MATERIAL_AMOUNT * 10, /datum/material/diamond =SHEET_MATERIAL_AMOUNT * 3.5, /datum/material/titanium = SHEET_MATERIAL_AMOUNT * 5)
	build_path = /obj/item/weaponcrafting/gunkit/splurt_laser_assault
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_KITS
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY
	autolathe_exportable = FALSE
