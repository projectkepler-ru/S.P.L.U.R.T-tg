/datum/voucher_set/yog_knights
	blackbox_key = "sec_melee_redeemed"
/*
We like the Knights in AR, but using that name doesn't feel right.
So let's come up with our own name, thematic to what we've been doing
Yog Knights, Ugora Orbit Knights of Yog.
*/

/datum/voucher_set/yog_knights/daisho
	name = "Security Daisho"
	description = "An armoured suit for exploring harsh environments. It can be reinforced with goliath plates."
	icon = 'modular_zzplurt/master_files/icons/obj/clothing/job/belts.dmi'
	icon_state = "daisho"
	set_items = list(
		/obj/item/clothing/suit/hooded/explorer,
		/obj/item/clothing/mask/gas/explorer,
	)

/datum/voucher_set/yog_knight/tanto_belt
	name = "Standard Belt with Knife"
	description = "A fire-proof suit for exploring hot environments. It can't be reinforced with goliath plates, but is ash storm proof."
	icon = 'modular_zzplurt/master_files/icons/misc/voucher.dmi'
	icon_state = "security"
	set_items = list(
		/obj/item/clothing/suit/hooded/seva,
		/obj/item/clothing/mask/gas/seva,
	)

/obj/item/melee_voucher
	name = "security utility belt voucher"
	desc = "A card with rudimentary identification on it, this one redeems security belts. Use it on a peacekeeping equipment vendor."
	icon = 'icons/obj/mining.dmi'
	icon_state = "mining_voucher"
	w_class = WEIGHT_CLASS_TINY


//Code to redeem new items at the mining vendor using the suit voucher
//More items can be added in the lists and in the if statement.
/obj/machinery/computer/order_console/mining/proc/redeem_suit_voucher(obj/item/suit_voucher/voucher, mob/redeemer)
	var/items = list(
		"SEVA suit" = image(icon = 'modular_skyrat/master_files/icons/obj/clothing/suits.dmi', icon_state = "seva"),
		"Explorer suit" = image(icon = 'icons/obj/clothing/suits/utility.dmi', icon_state = "explorer"),
	)

	var/selection = show_radial_menu(redeemer, src, items, require_near = TRUE, tooltips = TRUE)
	if(!selection || !Adjacent(redeemer) || QDELETED(voucher) || voucher.loc != redeemer)
		return
	var/drop_location = drop_location()
	switch(selection)
		if("SEVA suit")
			new /obj/item/clothing/suit/hooded/seva(drop_location)
			new /obj/item/clothing/mask/gas/seva(drop_location)
		if("Explorer suit")
			new /obj/item/clothing/suit/hooded/explorer(drop_location)
			new /obj/item/clothing/mask/gas/explorer(drop_location)

	SSblackbox.record_feedback("tally", "suit_voucher_redeemed", 1, selection)
	qdel(voucher)

