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
		chakra_sight
/*		chakra_sight_x
		chakra_sight_y*/

		sensing_color = null
		//For sensing color, null = no color change
		//"sayfont" or 1 = change to a player's font color
		//set it to an HTML color code to make it that color
		sensing_resize = 0
		sensing_icon = null


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

			user.sensing_active = src
			user.Chakra_Signatures_Update()


		else
			user << "You deactivate [src]"
			if(buff_icon)
				user.overlays -= buff_icon
			user.sensing_active = null

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
	var/tmp
		obj/jutsu/sensing_active = null


	proc/Chakra_Signatures_Update()
		for(var/i in chakra_images) client.images -= i
		chakra_images = new/list()
		if(sensing_active)
			var
				icon/ii = icon(sensing_active.sensing_icon) //store this before we loop to lessen the load a little
				pxx = 0
				pyy = 0

			if(ii.Width() > 32) pxx = -1*( ii.Width()*(1/3))
			if(ii.Height() > 32) pyy = -1*(ii.Height()*(1/3))


			for(var/client/c)
				if(c == src.client || c.mob.z != z) continue
				var image/i = image(icon = sensing_active.sensing_icon, layer = 6, loc = c.mob, pixel_x = pxx, pixel_y = pyy)

				if(sensing_active.sensing_resize)
					var
						matrix/m = i.transform
						multiplier = 1 + (((c.mob.Get_Max_Chakra()/32)/100))
					m.Scale(multiplier, multiplier)
					i.transform = m
		//For sensing color, null = no color change
		//"sayfont" or 1 = change to a player's font color
		//set it to an HTML color code to make it that color

				if(sensing_active.sensing_color == 1 || sensing_active.sensing_color == "sayfont")
					i.color = c.mob.SayFont
				else if(istext(sensing_active.sensing_color))
					i.color = sensing_active.sensing_color

				chakra_images += i
				client.images += i

			spawn(10) Chakra_Signatures_Update()


	proc/Get_Max_Chakra()
		var total_stam = 0, total_con = 0, total_vit = 0
		var boost_vit = 0, boost_con = 0, boost_stam = 0
		for(var/obj/jutsu/p in src)
			if(p.jutsu_type == "perk" || (p.jutsu_type == "buff" && p.active))
				if(p.boost_vitality) boost_vit += p.boost_vitality
				if(p.boost_control) boost_con += p.boost_control
				if(p.boost_stamina) boost_stam += p.boost_stamina
		. = ((((stamina + boost_stam) + (control + (boost_con/2)) ) / 2 ) + (control + (boost_con/2) ) ) * ( vitality + boost_vit )

