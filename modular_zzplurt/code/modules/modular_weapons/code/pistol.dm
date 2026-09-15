//Pistol as in anything that is compact and fired one handed
/obj/item/gun/ballistic/revolver/protector_revolver
	fire_delay = 3
	desc = "The Protector was designed to be a compact backup gun for NT law enforcement. Features a built in light and carefully polished action to ensure functionality no matter the environment, chambered in the same NT issue 9mm Murphy to maintain ammo compatibility. Security pistol magazines can be notched onto the cylinder for easy reloading. Somehow, somewhy. You felt like you made a promise to someone important" //The Signalis Reference must remains untouched.
	icon = 'modular_zzplurt/icons/obj/weapons/guns/ballistic_40x32.dmi'
	icon_state = "rhino" //Sorry Niim but the signalis reference must not be forgotten
/obj/item/gun/ballistic/revolver/protector_revolver/add_seclight_point()
	.=..()
	AddComponent(/datum/component/seclite_attachable, \
		starting_light = new /obj/item/flashlight/seclite(src), \
		is_light_removable = FALSE, \
		light_overlay_icon = 'modular_zubbers/icons/obj/weapons/guns/ballistic.dmi', \
		light_overlay = "rhino_light")

/obj/item/gun/ballistic/automatic/pistol/sec_glock
	name = "\improper 'Ladon' Security Pistol"
	desc = "A well built all rounder standard sidearm of NanoTrasen station security force chambered in 9x17mm. It comes with a revolutionary quick-reload system."
	icon = 'modular_zzplurt/icons/obj/weapons/guns/ballistic_40x32.dmi'
	icon_state = "ladon"
	accepted_magazine_type = /obj/item/ammo_box/magazine/security
	fire_sound = 'modular_zubbers/sound/weapons/gun/lock/shot.ogg'
	fire_delay = 2
