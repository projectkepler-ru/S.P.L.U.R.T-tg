/datum/techweb_node/riot_supression/New()
	design_ids += "m9x17mm_mag"
	design_ids += "m9x17mm_mag_rubber"
	design_ids += "m9x17mm_mag_ihdf"
	design_ids += "m9x17mm_mag_hp"
	design_ids += "m9x17mm_mag_ap"
	design_ids += "m9x17mm_pmag_hp"
	design_ids += "m9x17mm_pmag_ap"
	design_ids -= "m9mm_sec"
	design_ids -= "m9mm_sec_speedloader"
	. = ..()

/datum/techweb_node/ballistic/New()
	design_ids += "wt458_kit"
	. = ..()
