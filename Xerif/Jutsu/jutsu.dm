/obj/jutsu
	name
	desc
	icon
	icon_state
	var
		Discount
		mastery_cost = 30
		is_public_effect = 0
		chakra_usage = 0
		point_cost = 0
		cooldown = 0
		jutsu_damage = 0
		progresses_into
		control_req = 1
		stamina_req = 1
		byak_range = 0
		endurance_req = 1
		agility_req = 1
		chakra_req = 1
		speed_req = 1
		strength_req = 1
		rank_req = null
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
		JutsuRank
		boost_movement = 0
		boost_strength = 0
		boost_base_strength = 0
		boost_endurance = 0
		boost_base_endurance = 0
		boost_agility = 0
		boost_base_agility = 0
		boost_speed = 0
		boost_base_speed = 0
		boost_stamina = 0
		boost_control = 0
		boost_vitality = 0
		boost_kenjutsu = 0
		boost_health_pool = 0
		boost_chakra_pool = 0
		boost_stamina_pool = 0
		boost_calories_pool=0
		boost_swarms_pool=0
		active = 0
		boost_shinobikit = 0
		jutsu_shout
		jutsu_message
		unlearnable
		buff_icon

	Click()
		//if(usr.stamina + usr.stamina_boost() < chakra_req)
		//	viewers(16) << "[usr] fails to use [name] as the technique is too chakra-consuming for their reserves"
		//	return

		if(gridbased && !(src in usr.contents))
			usr.perkOpen = src
			usr<<output(null,"Perk.Description")
			usr<<output(null,"Perk.Name")
			//winset(usr,"Perk","is-visible=true")

			//var/icon/I = icon(icon,icon_state)
			//var/newPicture = fcopy_rsc(I)
			//winset(usr,"Perk.Picture","image=\ref[newPicture]")
			//winset(usr,"Perk.Name","text=\"[name]\"")

			usr<<output("[desc]<br><br>Note: [perk_note]","Perk.Description")
		else
			if(!(src in usr.contents))
				return

			usr.showPerk = src

			usr<<output(null,"Perk.Description")
			usr<<output(null,"Perk.Name")
			//winshow(usr,"Perk.Show",0)
			//winset(usr,"Perk","is-visible=true")


			/*
			var/icon/I = new('Misc Effects.dmi', "Black")
		I.Blend(rgb(R,G,B),ICON_ADD)
		var/iconfile = fcopy_rsc(I)
		winset(src, "ColorWindow.Picture", "image=\ref[iconfile]")
		*/
			//var/icon/I = icon(icon,icon_state)
			//var/newPicture = fcopy_rsc(I)
			//winset(usr,"Perk.Picture","image=\ref[newPicture]")
			//winset(usr,"Perk.Name","text=\"[name]\"")
			//winshow(usr,"Perk.Show",1)
			usr<<output("[desc]<br>[perk_note ? "Note: [perk_note]" : ""]","Perk.Description")
			usr.showPerkView()

	DblClick()
		if(name == "") del(src)

		if(gridbased && !(src in usr.contents))
			usr.perkOpen = src
			usr<<output(null,"Perk.Description")
			usr<<output(null,"Perk.Name")

			usr<<output("[desc]<br><br>Note: [perk_note]","Perk.Description")
		else
			if(!(src in usr.contents))
				return

			usr.showPerk = src

			usr<<output(null,"Perk.Description")
			usr<<output(null,"Perk.Name")

			usr<<output("[desc]<br>[perk_note ? "Note: [perk_note]" : ""]","Perk.Description")
			usr.showPerk()


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
		var/mob/controlMob = user
		if(controlMob.MindTransfer) controlMob=controlMob.MindTransfer
		active = !active
		if(active)
			user << "You activate [src]"
			if(buff_icon)
				user.overlays += buff_icon
			if(jutsu_message)
				//controlMob.show_message("<font color=[controlMob.SayFont]>[controlMob] [jutsu_message]", 15)


				for(var/mob/M in hearers(15, user))
					if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) continue
					if(M.MindAfflicted)
						M.MindAfflicted << output("<font color=[controlMob.SayFont]>[M.MindAfflicted.getStrangerName(controlMob)] [jutsu_message]", "outputall.output")
					else
						M << output("<font color=[controlMob.SayFont]>[M.getStrangerName(controlMob)] [jutsu_message]", "outputall.output")
				return
			if(jutsu_shout == "disabled")
				return
			display_desc(controlMob)

			user.sensing_active = src
			user.Chakra_Signatures_Update()


		else
			user << "You deactivate [src]"
			if(buff_icon)
				user.overlays -= buff_icon
			user.sensing_active = null

	proc/byakugan(mob/user)
		if(!user.Byakugan)
			user.Byakugan = extra_type
			user << "You activate [src]"
			user.sight |= SEE_MOBS
			user.see_invisible = 1
			for(var/obj/jutsu/kk in user)
				user.byak_range_enhance = 0
				if(kk.byak_range == 1)
					user.byak_range_enhance = 1
					break
				if(kk.byak_range == 1)
					user.byak_range_enhance2 = 1
					break
			var/mob/controlMob = user
			if(controlMob.MindTransfer) controlMob=controlMob.MindTransfer
			display_desc(controlMob)
		else
			user.Byakugan = 0
			user << "You deactivate [src]"
			user.see_invisible = 0
			user.sight &= ~SEE_MOBS

	proc/sharingan(mob/user)
		if(!user.Sharingan)
			user.Sharingan = 1
			user << "You activate [src]"
			user.sight |= SEE_MOBS
			user.see_invisible = 1
			for(var/obj/chakraoverlay/O in world) O.layer = 900
			var/mob/controlMob = user
			if(controlMob.MindTransfer) controlMob=controlMob.MindTransfer
			display_desc(controlMob)
		else
			user.Sharingan = 0
			user << "You deactivate [src]"
			user.see_invisible = 0
			user.sight &= ~SEE_MOBS





	proc/jutsu(mob/user)
		var/mob/controlMob = user
		if(controlMob.MindTransfer) controlMob=controlMob.MindTransfer
		display_desc(controlMob)

	proc/display_desc(mob/user)
		for(var/mob/M in hearers(16, user))
			if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) continue
			if(M.MindAfflicted)
				if(src in M.masteredjutsu)
					M.MindAfflicted << output("<font size=-2><font color=[user.SayFont]>[M.MindAfflicted.getStrangerName(user)] has activated a [jutsu_type != "perk" ? "technique" : "perk"]: <a href=?src=\ref[user];action=Perk;perk=[md5(name)]>[name](Mastered)</a>!</font>", "outputall.output")
				else
					M.MindAfflicted << output("<font size=-2><font color=[user.SayFont]>[M.MindAfflicted.getStrangerName(user)] has activated a [jutsu_type != "perk" ? "technique" : "perk"]: <a href=?src=\ref[user];action=Perk;perk=[md5(name)]>[name]</a>!</font>", "outputall.output")
			else
				if(src in M.masteredjutsu)
					M << output("<font size=-2><font color=[user.SayFont]>[M.getStrangerName(user)] has activated a [jutsu_type != "perk" ? "technique" : "perk"]: <a href=?src=\ref[user];action=Perk;perk=[md5(name)]>[name](Mastered)</a>!</font>", "outputall.output")
				else
					M << output("<font size=-2><font color=[user.SayFont]>[M.getStrangerName(user)] has activated a [jutsu_type != "perk" ? "technique" : "perk"]: <a href=?src=\ref[user];action=Perk;perk=[md5(name)]>[name]</a>!</font>", "outputall.output")
mob/var/list/chakra_images = list()
mob/var/byak_range_enhance = 0
mob/var/byak_range_enhance2 = 0
mob
	var/tmp
		obj/jutsu/sensing_active = null
	verb/closePerk()
		set hidden = 1
		winshow(src,"Perk",0)
		winshow(src,"Perk.Show",0)
		usr<<output(null,"Perk.Description")
		usr<<output(null,"Perk.Name")
		usr.showPerk = 0
	verb/closeWeapon()
		set hidden = 1
		winshow(src,"Weapon",0)
		winshow(src,"Weapon.Show",0)
		usr<<output(null,"Weapon.Description")
		usr<<output(null,"Weapon.Name")
		usr.showWeapon = 0
	verb/showPerk()
		set hidden = 1
		if(!showPerk) return
		if(!(showPerk in src.contents))
			return
		winset(src,"Perk","is-visible=false")
		switch(showPerk.jutsu_type)
			if("perk") showPerk.perk(src)
			if("buff") showPerk.buff(src)
			if("shunshin") showPerk.shunshin(src)
			if("shousen") showPerk.shousen(src)
			if("henge") showPerk.henge(src)
			if("suimen") showPerk.suimen(src)
			if("summon") showPerk.summon(src)
			if("clone") showPerk.clone(src)
			if("sense") showPerk.sense(src)
			if("kagura") showPerk.kagura(src)
			if("byakugan") showPerk.byakugan(usr)
			if("sharingan") showPerk.sharingan(usr)
			if("hiraishin") showPerk.hiraishin(usr)
			if("ShikokuMujin") showPerk.ShikokuMujin(usr)
			else showPerk.perk(src)


	verb/showPerkView()
		set hidden = 1
		if(!showPerk) return
		if(!(showPerk in src.contents))
			return
		winset(src,"Perk","is-visible=false")
		switch(showPerk.jutsu_type)
			if("perk") showPerk.perkView(src)
			if("buff") showPerk.buff(src)
			if("shunshin") showPerk.shunshin(src)
			if("shousen") showPerk.shousen(src)
			if("henge") showPerk.henge(src)
			if("suimen") showPerk.suimen(src)
			if("summon") showPerk.summon(src)
			if("clone") showPerk.clone(src)
			if("sense") showPerk.sense(src)
			if("kagura") showPerk.kagura(src)
			if("byakugan") showPerk.byakugan(usr)
			if("sharingan") showPerk.sharingan(usr)
			if("hiraishin") showPerk.hiraishin(usr)
			if("ShikokuMujin") showPerk.ShikokuMujin(usr)
			else showPerk.perkView(src)

	//	switch(showPerk.extra_type)
			//if("byakugan") showPerk.byakugan(src)

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


			for(var/mob/m in view(25))
				if(m == src.client || m.z != z) continue
				var image/i = image(icon = sensing_active.sensing_icon, layer = 10, loc = m, pixel_x = pxx, pixel_y = pyy)

				if(sensing_active.sensing_resize)
					var
						matrix/l = i.transform
						multiplier = 1 + (((m.Get_Max_Chakra()/32)/100))
					l.Scale(multiplier, multiplier)
					i.transform = l
		//For sensing color, null = no color change
		//"sayfont" or 1 = change to a player's font color
		//set it to an HTML color code to make it that color

				if(sensing_active.sensing_color == 1 || sensing_active.sensing_color == "sayfont")
					i.color = m.SayFont
				else if(istext(sensing_active.sensing_color))
					i.color = sensing_active.sensing_color

				chakra_images += i
				client.images += i

			spawn(10) Chakra_Signatures_Update()


	proc/Get_Max_Chakra()
		//var total_stam = 0, total_con = 0, total_vit = 0
		var boost_vit = 0, boost_con = 0, boost_stam = 0
		for(var/obj/jutsu/p in src)
			if(p.jutsu_type == "perk" || (p.jutsu_type == "buff" && p.active))
				if(p.boost_vitality) boost_vit += p.boost_vitality
				if(p.boost_control) boost_con += p.boost_control
				if(p.boost_stamina) boost_stam += p.boost_stamina
		. = ((((stamina + boost_stam) + (control + (boost_con/2)) ) / 2 ) + (control + (boost_con/2) ) ) * ( vitality + boost_vit )