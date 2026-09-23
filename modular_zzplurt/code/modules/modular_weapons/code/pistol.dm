//Pistol as in anything that is compact and fired one handed
/obj/item/gun/ballistic/revolver/protector_revolver
	desc = "The Protector was designed to be a compact backup gun for NT law enforcement. Features a built in light and carefully polished action to ensure functionality no matter the environment, chambered in the same NT issue 9mm Murphy to maintain ammo compatibility. Security pistol magazines can be notched onto the cylinder for easy reloading. Somehow, somewhy. You felt like you made a promise to someone important" //The Signalis Reference must remains untouched.
	icon = 'modular_zzplurt/icons/obj/weapons/guns/ballistic_40x32.dmi'
	fire_delay = 8 //Because with the rework its actually pretty dangerous now. This is equal to a shotgun fire delay, which is a pretty close analogue to what we're working with
	icon_state = "rhino" //Sorry Niim but the signalis reference must not be forgotten
	projectile_damage_multiplier = 1.5 //Let us get pretty close to 25
	fire_sound = 'modular_zzplurt/sound/items/weapons/gun/gunshot_strong.ogg'
//Taken from https://github.com/ParadiseSS13/Paradise/blob/51e176654c3d86d61707689c9ab218edd36153c3/sound/weapons/gunshots/gunshot_strong.ogg
//No attribution available for authorship

/obj/item/gun/ballistic/revolver/protector_revolver/add_seclight_point()
	.=..()
	AddComponent(/datum/component/seclite_attachable, \
		starting_light = new /obj/item/flashlight/seclite(src), \
		is_light_removable = FALSE, \
		light_overlay_icon = 'icons/obj/weapons/guns/flashlights.dmi', \
		light_overlay = "flight", \
		overlay_x = 2, \
		overlay_y = 5)
//While not everyone is guilty, many of us stood by and watched, letting these bad things happen
//Any doubts perhaps? a whimper? Plentiful, but the changes that got us where we are today weren't good changes
//Nor were they made all by good people
/obj/item/gun/ballistic/automatic/pistol/sec_glock
	name = "\improper 'Ladon' Security Pistol"
	desc = "A well built all rounder standard sidearm of NanoTrasen station security force chambered in 9x17mm. It comes with a revolutionary quick-reload system."
	icon = 'modular_zzplurt/icons/obj/weapons/guns/ballistic_40x32.dmi'
	icon_state = "ladon"
	accepted_magazine_type = /obj/item/ammo_box/magazine/security
	fire_sound = 'modular_zubbers/sound/weapons/gun/lock/shot.ogg'
	fire_delay = 3 //I should note that during testing the gun could honest to god have it's fire delay as low as 0 and it would still not be kinda eh, but the starch differences now is that this is atleast something you could viably pull out in an emergency or dualwield for more damage
	burst_delay = 0
