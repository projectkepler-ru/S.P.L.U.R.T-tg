/obj/item/splurtweaponspawner_case
	name = "debug weapon case"
	desc = "How did you get this?"
	icon = 'modular_zzplurt/icons/obj/weapons/sec_haul/gun_case.dmi'
	icon_state = "secsidearm"
	worn_icon = 'modular_skyrat/modules/modular_weapons/icons/mob/worn/cases.dmi'
	worn_icon_state = "darkcase"
	material_flags = NONE
	w_class = WEIGHT_CLASS_NORMAL
	var/redeemed = FALSE

/obj/item/splurtweaponspawner_case/click_alt(mob/user)
	try_redeem(user)
	return CLICK_ACTION_SUCCESS

/obj/item/splurtweaponspawner_case/attack_self(mob/user)
	try_redeem(user)

/obj/item/splurtweaponspawner_case/proc/try_redeem(mob/user)
	if(redeemed || QDELETED(src))
		return
	if(!isliving(user))
		return
	var/mob/living/redeemer = user
	if(redeemer.incapacitated)
		return

	var/static/list/options
	if(!options)

		var/datum/radial_menu_choice/centcomsabre_option = new
		centcomsabre_option.image = image(icon = 'modular_zubbers/icons/obj/weapons/melee.dmi', icon_state = "cc-sheath-full")
		centcomsabre_option.info = span_boldnotice("A beautiful sabre, coming with a green leather sheath, fashioned after those granted to the Centcom Commanders. A status symbol for the true bureaucrat. For when the sword is mightier than the pen.")

		var/datum/radial_menu_choice/admiralsabre_option = new
		admiralsabre_option.image = image(icon = 'modular_zubbers/icons/obj/weapons/melee.dmi', icon_state = "admiral-sheath-full")
		admiralsabre_option.info = span_boldnotice("A beautiful sabre, coming with a black leather sheath, fashioned after those granted to Nanotrasen Admirals. A status symbol for the true bureaucrat. For when the sword is mightier than the pen.")

		var/datum/radial_menu_choice/miniegun_option = new
		miniegun_option.image = image(icon = 'icons/obj/weapons/guns/energy.dmi', icon_state = "mini")
		miniegun_option.info = span_boldnotice("The classic, the mini e-gun. Fits in your pocket, has a disabler and a lethal mode, and includes a flashlight. Perfect for the consultant who doesn't want to draw too much attention to themselves, but still wants to be prepared for anything.")

		var/datum/radial_menu_choice/verdict_option = new
		verdict_option.image = image(icon = 'modular_zubbers/icons/obj/weapons/guns/ballistic.dmi', icon_state = "niimconsultantrevolver")
		verdict_option.info = span_boldnotice("The Verdict, a weapon reminiscent of the other Nanotrasen Armories revolvers. It's similar to the all-slavic Unica, but with a lovely nickel polish. It is, however, much weaker and lighter than one, and uses a unique .32 caliber. Comes with a holster. Now all you're missing is a fat cigar.")

		options = list(
			"Commander's Sabre Replica" = centcomsabre_option,
			"Admiral's Sabre Replica" = admiralsabre_option,
			"Miniature Energy Gun" = miniegun_option,
			"The Verdict" = verdict_option,
		)

	var/selection = show_radial_menu(redeemer, src, options, custom_check = CALLBACK(src, PROC_REF(check_redeem_menu), redeemer), radius = 38, require_near = TRUE, tooltips = TRUE)
	if(!selection || redeemed || QDELETED(src))
		return

	var/spawn_path
	switch(selection)
		if("Commander's Sabre Replica")
			spawn_path = /obj/item/storage/belt/sheath/sabre/ntc_commander
		if("Admiral's Sabre Replica")
			spawn_path = /obj/item/storage/belt/sheath/sabre/ntc_admiral
		if("Miniature Energy Gun")
			spawn_path = /obj/item/gun/energy/e_gun/mini
		if("The Verdict")
			spawn_path = /obj/item/storage/belt/holster/consultant
		else
			return

	redeemed = TRUE
	var/obj/item/chosen_item = new spawn_path(drop_location())
	redeemer.put_in_hands(chosen_item)
	balloon_alert(redeemer, "selected [LOWER_TEXT(selection)]")
	qdel(src)

/obj/item/splurtweaponspawner_case/proc/check_redeem_menu(mob/living/redeemer)
	if(!istype(redeemer))
		return FALSE
	if(redeemer.incapacitated)
		return FALSE
	if(QDELETED(src) || redeemed)
		return FALSE
	if(!redeemer.Adjacent(src))
		return FALSE
	return TRUE

/obj/item/storage/toolbox/guncase/skyrat/pistol/trappiste_small_case/wespe
	name = "ladon gunset"
	icon = 'modular_zzplurt/icons/obj/weapons/sec_haul/gun_case.dmi'
	icon_state = "secsidearm"

	weapon_to_spawn = /obj/item/gun/ballistic/automatic/pistol/sol/no_mag
	extra_to_spawn = /obj/item/ammo_box/magazine/c35sol_pistol/starts_empty
