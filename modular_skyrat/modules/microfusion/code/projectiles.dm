/obj/item/ammo_casing
	///What volume should the sound play at?
	var/fire_sound_volume = 50

/obj/item/ammo_casing/energy/laser/microfusion
	name = "microfusion energy lens"
	projectile_type = /obj/projectile/beam/laser/microfusion
	e_cost = 100 // 10 shots with a normal cell.
	select_name = "laser"
	fire_sound = 'modular_skyrat/modules/microfusion/sound/laser_1.ogg'
	fire_sound_volume = 100

/obj/projectile/beam/laser/microfusion
	name = "microfusion laser"
	icon = 'modular_skyrat/modules/microfusion/icons/projectiles.dmi'

/obj/projectile/beam/microfusion_disabler
	name = "microfusion disabler laser"
	icon = 'modular_skyrat/modules/microfusion/icons/projectiles.dmi'
	icon_state = "disabler"
	damage = 41
	damage_type = STAMINA
	flag = ENERGY
	hitsound = 'sound/weapons/tap.ogg'
	eyeblur = 0
	impact_effect_type = /obj/effect/temp_visual/impact_effect/blue_laser
	light_color = LIGHT_COLOR_BLUE
	tracer_type = /obj/effect/projectile/tracer/disabler
	muzzle_type = /obj/effect/projectile/muzzle/disabler
	impact_type = /obj/effect/projectile/impact/disabler

/obj/projectile/beam/laser/microfusion/superheated
	name = "superheated microfusion laser"
	icon_state = "laser_greyscale"
	color = LIGHT_COLOR_FIRE
	light_color = LIGHT_COLOR_FIRE


/obj/projectile/beam/laser/microfusion/superheated/on_hit(atom/target, blocked)
	. = ..()
	if(isliving(target))
		var/mob/living/living = target
		living.fire_stacks += 2
		living.IgniteMob()
