/obj/jutsu
	name
	desc
	icon
	icon_state
	var
		chakra_usage = 0
		point_cost = 0
		cooldown = 0
		jutsu_damage = 0
		progresses_into
		control_req = 1
		chakra_req = 1
		learn_req = 2520
		last_edit = 0
		last_updated = 0
		list/prerequisites = list()
		list/encapsulates = list()
		jutsu_type
		perk_type
		extra_type
		free_spec
		spec_perk
/*		chakra_sight
		chakra_sight_x
		chakra_sight_y*/
		sensing_enabled = 0
		sensing_icon
		sensing_px
		sensing_py
	//	list/sensing_type = list() //index[1] = icon, index[2] = pixel_x, index[3] = pixel_y


		boost_strength = 0
		boost_endurance = 0
		boost_agility = 0
		boost_speed = 0
		boost_stamina = 0
		boost_control = 0
		boost_vitality = 0

		active = 0
		jutsu_shout
		jutsu_message
		unlearnable

		buff_icon

	Click()
		//if(usr.stamina + usr.stamina_boost() < chakra_req)
		//	viewers(16) << "[usr] fails to use [name] as the technique is too chakra-consuming for their reserves"
		//	return
		switch(jutsu_type)
			if("perk") perk()
			if("buff") buff(usr)
			if("henge") henge(usr)
			if("suimen") suimen(usr)
			if("summon") summon(usr)
			//if("byakugan") byakugan(usr)
			else jutsu(usr)

		switch(extra_type)
			if("byakugan") byakugan(usr)

	test
		name = "Body"
		icon = 'Perk.dmi'
		icon_state = "Body"
		learn_req = 30

	test2
		name = "Mind 2"
		icon = 'Perk.dmi'
		icon_state = "Mind 2"
		learn_req = 30

/*	proc/buff(mob/user)
		active = !active
		if(active)
			user << "You activate [src]"
			if(buff_icon)
				user.overlays += buff_icon
			if(jutsu_message)
				user.show_message("<font color=[usr.SayFont]>[usr] [jutsu_message]", 15)
				return
			if(jutsu_shout == "disabled")
				return
			user.show_message("<font color=[usr.SayFont]>[usr] yells<font color = white>: [jutsu_shout ? jutsu_shout : name]!", 16)
			display_desc(user)
			for(var/mob/M)
				var/image/I = image(icon = chakra_sight, layer = 6, pixel_x = chakra_sight_x, pixel_y = chakra_sight_y, loc = M)
				usr.chakra_images += I
				src << I
		else
			user << "You deactivate [src]"
			if(buff_icon)
				user.overlays -= buff_icon
			for(var/I in usr.chakra_images)
				del(I)*/

/* //Try#2 -- Stable
	proc/buff(mob/user)
		active = !active
		if(active)
			user << "You activate [src]"
			if(buff_icon)
				user.overlays += buff_icon
			if(jutsu_message)
				user.show_message("<font color=[usr.SayFont]>[usr] [jutsu_message]", 15)
				return
			if(jutsu_shout == "disabled")
				return
			user.show_message("<font color=[usr.SayFont]>[usr] yells<font color = white>: [jutsu_shout ? jutsu_shout : name]!", 16)
			display_desc(user)

			user.sensing_enabled = 1
			user.sensing_type = list('_blank.dmi', 0, 0)

			user.Chakra_Signatures_Update()

		//	for(var/mob/M)
		//		var/image/I = image(icon = chakra_sight, layer = 6, pixel_x = chakra_sight_x, pixel_y = chakra_sight_y, loc = M)
		//		usr.chakra_images += I
		//		src << I
		else
			user << "You deactivate [src]"
			if(buff_icon)
				user.overlays -= buff_icon
			user.sensing_enabled = 0
		//	for(var/I in usr.chakra_images)
		//		del(I)
	proc/byakugan(mob/user)
		user.Byakugan = !user.Byakugan
		if(user.Byakugan)
			user << "You activate [src]"
		else
			user << "You deactivate [src]"

	proc/jutsu(mob/user)
		user.show_message("<font color=[usr.SayFont]>[usr] yells<font color = white>: [name]!")
		display_desc(user)

	proc/display_desc(mob/user)
		if(desc)
			user.show_message("<font color=[usr.SayFont]>[usr] has used: <font color = white>[name]")
			user.show_message("[desc]")

mob
	var
		sensing_enabled = 0
		list/sensing_type = list()

	proc/Chakra_Signatures_Update()
		for(var/client/c in players)
			client.images -= image(icon = sensing_type[1], layer = 6, loc = c.mob, pixel_x = sensing_type[2], pixel_y = sensing_type[3])

		if(sensing_enabled)
			for(var/client/c in players)
				if(c == src) continue
				client.images |= image(icon = sensing_type[1], layer = 6, loc = c.mob, pixel_x = sensing_type[2], pixel_y = sensing_type[3])
			spawn(1) Chakra_Signatures_Update()
*/




	proc/buff(mob/user)
		active = !active
		if(active)
			user << "You activate [src]"
			if(buff_icon)
				user.overlays += buff_icon
			if(jutsu_message)
				user.show_message("<font color=[usr.SayFont]>[usr] [jutsu_message]", 15)
				return
			if(jutsu_shout == "disabled")
				return
			user.show_message("<font color=[usr.SayFont]>[usr] yells<font color = white>: [jutsu_shout ? jutsu_shout : name]!", 16)
			display_desc(user)

			user.sensing_enabled = 1
		//	sensing_type = list(chakra_sight, 0, 0)
			user.sensing_icon = sensing_icon
			user.sensing_px = sensing_px
			user.sensing_py = sensing_py

			user.Chakra_Signatures_Update()

		//	for(var/mob/M)
		//		var/image/I = image(icon = chakra_sight, layer = 6, pixel_x = chakra_sight_x, pixel_y = chakra_sight_y, loc = M)
		//		usr.chakra_images += I
		//		src << I
		else
			user << "You deactivate [src]"
			if(buff_icon)
				user.overlays -= buff_icon
			user.sensing_enabled = 0
		//	for(var/I in usr.chakra_images)
		//		del(I)

	proc/byakugan(mob/user)
		user.Byakugan = !user.Byakugan
		if(user.Byakugan)
			user << "You activate [src]"
		else
			user << "You deactivate [src]"

	proc/jutsu(mob/user)
		user.show_message("<font color=[usr.SayFont]>[usr] yells<font color = white>: [name]!")
		display_desc(user)

	proc/display_desc(mob/user)
		if(desc)
			user.show_message("<font color=[usr.SayFont]>[usr] has used: <font color = white>[name]")
			user.show_message("[desc]")

mob/var/list/chakra_images = list()

mob
	var
		sensing_enabled = 0
		sensing_icon
		sensing_px
		sensing_py




	proc/Chakra_Signatures_Update()
		for(var/i in chakra_images) client.images -= i

		if(sensing_enabled)
			for(var/client/c in players)
				if(c == src.client) continue
				var image/i = image(icon = sensing_icon, layer = 6, loc = c.mob, pixel_x = sensing_px, pixel_y = sensing_py)
				chakra_images += i
				client.images += i

			spawn(1) Chakra_Signatures_Update()
