/datum/supply_pack/security/armory/secdaisho
	name = "Oscillating Sword Crate"
	desc = "A three pack of the Ugora Orbit branded two handed sword and the sheath for them."
	cost = CARGO_CRATE_VALUE * 20
	contains = list(/obj/item/storage/belt/secdaisho = 3)
	crate_name = "osculating sword"

/datum/supply_pack/security/sectanto
	name = "Tanto Crate"
	desc = "A three pack of the Ugora Orbit branded tanto. Thin sharp blade meant for last resort."
	cost = CARGO_CRATE_VALUE * 8
	contains = list(/obj/item/knife/oscu_tanto = 3)
	crate_name = "security knife"

/*===
Daisho (large and small)
Yes, If you're thinking of a certain other place, you're correct. And I also enjoy Arknights too.
The sprite is custom made by @Wolf751 for the purpose of this server.
Speaking of which, daisho are also fun :3
===*/

/obj/item/storage/belt/secdaisho
	name = "security combination sheath"
	desc = "A modified scabbard intended to hold a sword and compact baton at the same time."
	icon = 'modular_zzplurt/master_files/icons/obj/clothing/job/belts.dmi'
	worn_icon = 'modular_zzplurt/master_files/icons/mob/clothing/job/belt.dmi'
	icon_state = "daisho"
	w_class = WEIGHT_CLASS_BULKY
	interaction_flags_click = NEED_DEXTERITY

/obj/item/storage/belt/secdaisho/Initialize(mapload)
	. = ..()
	atom_storage.max_slots = 2
	atom_storage.max_total_storage = WEIGHT_CLASS_BULKY
	atom_storage.set_holdable(list(
		/obj/item/melee/oscula,
		/obj/item/melee/baton/tanto,
		))

/obj/item/storage/belt/secdaisho/full/PopulateContents()
	new /obj/item/melee/oscula(src)
	new /obj/item/melee/baton/tanto(src)
	update_appearance()


//Is it really an issue if AGPL. from doppler #303 If paxil pings me not to use this then it can be altered
//as an aside, not everything is gonna be the same anyway. People have different vision
//As of writing this I still have not been able to pull exu alter yet
//Just one more pull and maybe I can get her

/obj/item/storage/belt/secdaisho/examine(mob/user)
	. = ..()
	if(length(contents))
		. += span_notice("<b>Left Click</b> to draw a stored blade, <b>Right Click</b> to draw a stored baton while wearing.")

/obj/item/storage/belt/secdaisho/attack_hand(mob/user, list/modifiers)
	if(!(user.get_slot_by_item(src) & ITEM_SLOT_BELT) && !(user.get_slot_by_item(src) & ITEM_SLOT_BACK) && !(user.get_slot_by_item(src) & ITEM_SLOT_SUITSTORE))
		return ..()
	for(var/obj/item/melee/oscula/yato in contents)
		user.visible_message(span_notice("[user] draws [yato] from [src]."), span_notice("You draw [yato] from [src]."))
		user.put_in_hands(yato)
		playsound(user, 'sound/items/sheath.ogg', 50, TRUE)
		update_appearance()
		return
	return ..()

/obj/item/storage/belt/secdaisho/attack_hand_secondary(mob/user, list/modifiers)
	if(!(user.get_slot_by_item(src) & ITEM_SLOT_BELT) && !(user.get_slot_by_item(src) & ITEM_SLOT_BACK) && !(user.get_slot_by_item(src) & ITEM_SLOT_SUITSTORE))
		return ..()
	for(var/obj/item/melee/baton/tanto/stored in contents)
		user.visible_message(span_notice("[user] draws [stored] from [src]."), span_notice("You draw [stored] from [src]."))
		user.put_in_hands(stored)
		playsound(user, 'sound/items/sheath.ogg', 50, TRUE)
		update_appearance()
		return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN
	return ..()

/obj/item/storage/belt/secdaisho/update_icon_state()
	var/has_sword = FALSE
	var/has_baton = FALSE
	for(var/obj/thing in contents)
		if(has_baton && has_sword)
			break
		if(istype(thing, /obj/item/melee/baton/tanto))
			has_baton = TRUE
		if(istype(thing, /obj/item/melee/oscula))
			has_sword = TRUE

	icon_state = initial(icon_state)
	worn_icon_state = initial(worn_icon_state)

	var/next_appendage
	if(has_sword && has_baton)
		next_appendage = "-full"
	else if(has_sword)
		next_appendage = "-sword"
	else if(has_baton)
		next_appendage = "-baton"

	if(next_appendage)
		icon_state += next_appendage
		worn_icon_state += next_appendage
	return ..()

/obj/item/melee/oscula
	name = "oscillating sword"
	desc = "An expertly crafted historical human sword once used by the Persians which has recently gained traction due to Venusian historal recreation sports. One small flaw, the Taj-based company who produces these has mistaken them for British cavalry sabres akin to those used by high ranking Nanotrasen officials. Atleast it cuts the same way!"
	icon = 'modular_zzplurt/modules/modular_weapons/icon/company_and_or_faction_based/ugora_orbit/sword.dmi'
	icon_state = "secsword0"
	inhand_icon_state = "secsword0"
	lefthand_file = 'modular_zzplurt/modules/modular_weapons/icon/company_and_or_faction_based/ugora_orbit/sword_lefthand.dmi'
	righthand_file = 'modular_zzplurt/modules/modular_weapons/icon/company_and_or_faction_based/ugora_orbit/sword_righthand.dmi'
	block_chance = 25
	armour_penetration = 15
	force = 12
	damtype = BURN
	wound_bonus = 10
	exposed_wound_bonus = -30
	demolition_mod = 0.8
	//I understand it's unrealistic, but I want to avoid people using the sword to break crate or locker open. Also yes this means its less effective against a lot of other thing, but we'll get there. Trust.
	/// How much damage to do unwielded, this makes it do less than survival knife but the same as our Tanto
	var/force_unwielded = 12
	/// 20 damage is ok. It's the same as shooting a single thermal pistol at a time, when it come to raw DPS difference, this wont cut it.
	var/force_wielded = 20
	/// How much AP should this have when one handed. This make it so the sword isn't completely worthless should you have even just a bit of armour
	var/ap_unwielded = 15
	/// 25 is an okay number, enough to get through block chance and armour, Yes it does seems very high. but bear in mind that's very similar to most available sec ranged AP option (barring the X-Ray laser at 100% AP)
	var/ap_wielded = 25
	/* In regards to concern on the fact that there is a difference of 6 ticks between this and any standard melee cooldown
	/// | Refer to below for linear graph. Damage:TickRate
	/// | [1]    [2]  [3]    [4]     	This is assuming you are hitting in strafe			   |===|
	/// | 12:2, 24:4, 36:6, 48:8     														   |===|
	/// | 30:8, 60:16, 90:24, 120:32 														   |===|
	/// | 12:2 * 4 = 48:8 > 30:8 = 30:8														   |===|
	/// | Tickrate can be misleading, as standard melee tick is practically equal to a second. |===|
		As we can see, the DPS of the Oscillating Sword vs Energy Sword is high

		There is a significantly lower tickrate, so each cyclic rate(Melee Hit Per Strafe) is significantly higher.
		If you're only getting hit in every time you walk by them, then energy sword would outdamage
		This means the energy sword has the upperhand because 2 hit would already be severe for your limbs

		The sword has a lower overall damage and does not deal brute wound (no bleed out) on the fast mode
		Yes, this sword is one of the more complicated one in term of balance and it may feel oppressive
		Due to how many feature it has and the system put in place. And I intend to address all of it one at a time.
	*/
	attack_speed = CLICK_CD_RAPID

	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK | ITEM_SLOT_BELT
	sharpness = NONE

	attack_verb_continuous = list("attacks", "pokes", "jabs", "bludgeons", "hits", "bashes") //The sword is dull, not sharp
	attack_verb_simple = list("attack", "poke", "jab", "smack", "hit", "bludgeon")

/obj/item/melee/oscula/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/two_handed, \
		force_unwielded = force_unwielded, \
		force_wielded = force_wielded, \
		ap_wielded = ap_wielded,\
		ap_unwielded = ap_unwielded,\
		wield_callback = CALLBACK(src, PROC_REF(on_wield)), \
		unwield_callback = CALLBACK(src, PROC_REF(on_unwield)), \
	)

/obj/item/melee/oscula/update_icon_state()
	icon_state = inhand_icon_state = HAS_TRAIT(src, TRAIT_WIELDED) ? "secsword[HAS_TRAIT(src, TRAIT_WIELDED)]" : "secsword0"
	return ..()

/obj/item/melee/oscula/proc/on_wield(obj/item/source, mob/living/carbon/user)
	attack_speed = CLICK_CD_MELEE
	armour_penetration = ap_wielded

/obj/item/melee/oscula/proc/on_unwield(obj/item/source, mob/living/carbon/user)
	attack_speed = CLICK_CD_RAPID
	armour_penetration = ap_unwielded

/obj/item/knife/oscu_tanto
	name = "\improper komuro"
	desc = "A long thin blade commonly used by Ugoran people as ritual dagger and to finish off dying opponent. Stabbing a <b> proned </b> target will deal more damage"
	icon = 'modular_zzplurt/modules/modular_weapons/icon/company_and_or_faction_based/ugora_orbit/tanto.dmi'
	icon_state = "tanto"
	inhand_icon_state = "tanto"
	lefthand_file = 'modular_zzplurt/modules/modular_weapons/icon/company_and_or_faction_based/ugora_orbit/tanto_lefthand.dmi'
	righthand_file = 'modular_zzplurt/modules/modular_weapons/icon/company_and_or_faction_based/ugora_orbit/tanto_righthand.dmi'
	worn_icon_state = "knife"
	force = 12 //This is more effective when the target is laying down
	w_class = WEIGHT_CLASS_SMALL //It's not exactly big but it's kind of long.
	throwforce = 20 //Long Slim Throwing Knives
	wound_bonus = 0 //We want to avoid this being too effective at wounding out of nowhere.
	exposed_wound_bonus = 15 //It's a slim long knife, prepare yourself.
	armour_penetration = 20 // You should be able to use it fairly often and effectively

/obj/item/knife/oscu_tanto/examine_more(mob/user)
	. = ..()
	. += span_info("This knife deals more damage when attacking from behind, hitting a target laying down or if they are incapacitated. Such as from succesful baton hit. \
		Mastery of this blade is imperative to any close quarter combatant.")


/obj/item/knife/oscu_tanto/pre_attack(atom/target, mob/living/user, list/modifiers, list/attack_modifiers)
	if(!isliving(target))
		return ..()

	var/mob/living/living_target = target
	var/ritual_worthy = FALSE

	if(living_target.stat == DEAD) // We are using the code from the leito here and following what Anne suggested aswell, it'd be best to make it not do extra damage against dead body due to dismemberment
		return ..()

	if(HAS_TRAIT(living_target, TRAIT_INCAPACITATED))
		ritual_worthy = TRUE

	if(check_behind(user, living_target))
		ritual_worthy = TRUE

	if(ritual_worthy)
		MODIFY_ATTACK_FORCE_MULTIPLIER(attack_modifiers, 2.5) ///This makes it do 30 damage, still a lot but its situational enough

	return ..()


/datum/storage/security_belt
	max_slots = 6

/datum/storage/security_belt/New(atom/parent, max_slots, max_specific_storage, max_total_storage, rustle_sound, remove_rustle_sound)
	. = ..()
	set_holdable(list(
		/obj/item/ammo_box,
		/obj/item/ammo_casing/shotgun,
		/obj/item/assembly/flash/handheld,
		/obj/item/clothing/glasses,
		/obj/item/clothing/gloves,
		/obj/item/flashlight/seclite,
		/obj/item/food/donut,
		/obj/item/grenade,
		/obj/item/holosign_creator/security,
		/obj/item/knife/combat,
		/obj/item/melee/baton,
		/obj/item/radio,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/restraints/handcuffs,
		/obj/item/restraints/legcuffs/bola,
		/obj/item/knife/oscu_tanto,
	))

/obj/item/storage/belt/security/full/PopulateContents()
	new /obj/item/reagent_containers/spray/pepper(src)
	new /obj/item/restraints/handcuffs(src)
	new /obj/item/grenade/flashbang(src)
	new /obj/item/assembly/flash/handheld(src)
	new /obj/item/knife/oscu_tanto(src)
	new /obj/item/melee/baton/security/loaded(src)
	update_appearance()

/datum/storage/security_belt/webbing
	max_slots = 7

/obj/item/melee/baton/tanto
