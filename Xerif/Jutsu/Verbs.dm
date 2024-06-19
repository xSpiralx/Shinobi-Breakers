mob/Admin5
	verb
		Debug_View_Datums()
			set category = "Admin"
			var/list/datum_list = list()
			for(var/datum/d)
				if(datum_list["[d.type]"])
					var/a = datum_list["[d.type]"]
					datum_list["[d.type]"] = (a + 1)
				else datum_list["[d.type]"] = 1
			for(var/t in datum_list)
				src << output("'[t]' = [datum_list[t]]", "outputall.output")
			del(datum_list)

		Debug_Wipe_Matrixes()
			set category = "Admin"
			var/count = 0
			for(var/matrix/m)
				count++
				del(m)
			src << output("Wiped [count] matrixes.", "outputall.output")

	/*	Debug_Wipe_RPDatums()
			set category = "Admin"
			var/count = 0
			for(var/datum/roleplay_log/m)
				count++
				del(m)
			src << output("Wiped [count] log datums.", "outputall.output")
*/
		/*Debug_Memory()
			set category = "Admin"
			var/count = 0
			for(var/dmifonttextline/d)
				count++
				del(d)
			src << "[count] datums deleted."*/

		Debug_Traits()
			set category = "Admin"
			del(archive.info_text["Average"])

		/*Automatic_Costs()
			for(var/obj/jutsu/a in archive)
				if(a.jutsu_type == "perk")
					a.point_cost = a.boost_strength + a.boost_endurance + a.boost_agility + a.boost_speed + a.boost_stamina + a.boost_control + 2
					a.prerequisites = list("Locked")
					world << "[a] - [a.point_cost]"*/


		Toggle_Clans()
			set category = "Admin"
			var/a = input("Toggle what?") in list("Hyuuga", "Inuzuka", "Aburame", "Kaguya", "Yuki", "Hozuki", "Yomei", "Uchiha", "Senju", "Samurai", "Priest", "Hoshigaki", "Uzumaki", "Sabaku", "Iwato", "Fuujin", "Cancel")
			switch(a)
				if("Uchiha")
					archive.uchiha_on = !archive.uchiha_on
					if(archive.uchiha_on) src << "Uchiha toggled on."
					else  src << "Uchiha toggled off."
				if("Senju")
					archive.senju_on = !archive.senju_on
					if(archive.senju_on) src << "Senju toggled on."
					else  src << "Senju toggled off."
				if("Hyuuga")
					archive.hyuuga_on = !archive.hyuuga_on
					if(archive.hyuuga_on) src << "Hyuuga toggled on."
					else  src << "Hyuuga toggled off."
				if("Kaguya")
					archive.kaguya_on = !archive.kaguya_on
					if(archive.kaguya_on) src << "Kaguya toggled on."
					else  src << "Kaguya toggled off."
				if("Inuzuka")
					archive.inuzuka_on = !archive.inuzuka_on
					if(archive.inuzuka_on) src << "Inuzuka toggled on."
					else  src << "Inuzuka toggled off."
				if("Aburame")
					archive.aburame_on = !archive.aburame_on
					if(archive.aburame_on) src << "Aburame toggled on."
					else  src << "Aburame toggled off."
				if("Yuki")
					archive.yuki_on = !archive.yuki_on
					if(archive.yuki_on) src << "Yuki toggled on."
					else  src << "Yuki toggled off."
				if("Hozuki")
					archive.hozuki_on = !archive.hozuki_on
					if(archive.hozuki_on) src << "Hozuki toggled on."
					else  src << "Hozuki toggled off."
				if("Yomei")
					archive.yomei_on = !archive.yomei_on
					if(archive.yomei_on) src << "Yomei toggled on."
					else  src << "Yomei toggled off."
				if("Samurai")
					archive.samurai_on = !archive.samurai_on
					if(archive.samurai_on) src << "Samurai toggled on."
					else  src << "Samurai toggled off."
				if("Priest")
					archive.Priest_on = !archive.Priest_on
					if(archive.Priest_on) src << "Priest toggled on."
					else  src << "Priest toggled off."
				if("Hoshigaki")
					archive.hoshigaki_on = !archive.hoshigaki_on
					if(archive.hoshigaki_on) src << "Hoshigaki toggled on."
					else  src << "Hoshigaki toggled off."
				if("Uzumaki")
					archive.uzumaki_on = !archive.uzumaki_on
					if(archive.uzumaki_on) src << "Uzumaki toggled on."
					else  src << "Uzumaki toggled off."
				if("Sabaku")
					archive.Sabaku_on = !archive.Sabaku_on
					if(archive.Sabaku_on) src << "Sabaku toggled on."
					else  src << "Sabaku toggled off."
				if("Iwato")
					archive.Iwato_on = !archive.Iwato_on
					if(archive.Iwato_on) src << "Iwato toggled on."
					else  src << "Iwato toggled off."
				if("Fuujin")
					archive.Fuujin_on = !archive.Fuujin_on
					if(archive.Fuujin_on) src << "Fuujin toggled on."
					else  src << "Fuujin toggled off."
				if("Nara")
					archive.nara_on = !archive.nara_on
					if(archive.nara_on) src << "Nara toggled on."
					else  src << "Nara toggled off."
				if("Akimichi")
					archive.akimichi_on = !archive.akimichi_on
					if(archive.akimichi_on) src << "Akimichi toggled on."
					else src << "Akimichi toggled off."

		Construct_Header(msg as text, big as num)
			set category = "Admin"
			if(!archive.button_icons["[msg]"])
				var/obj/o = drawfont.QuickText(src, msg, "#E6C208", 1, layer = 93)
				var/icon/draw_text = new/icon(o.icon)
				var/icon/product
				if(big)
					product = new/icon('blankheaderbig.png')
				else
					product = new/icon('blankheader.png')
				draw_text.Crop(1, 32, draw_text.Width(), 10)
				product.Blend(draw_text, ICON_OVERLAY, 9, -4)
				if(big)
					archive.big_button_icons["[msg]"] = product
				else
					archive.button_icons["[msg]"] = product
			if(big)
				src << browse_rsc(archive.big_button_icons["[msg]"], "abc.png")
				src << browse("<img src=abc.png/>", "window=test")
				src << ftp(archive.big_button_icons["[msg]"], "[msg].png")
			else
				src << ftp(archive.button_icons["[msg]"], "[msg].png")

	verb/Archive_Perk(obj/jutsu/J in world)
		set category = "Admin"

		if(istype(J, /perk_box))
			var/perk_box/perk_box = J
			J = perk_box:reference

		if(!J)
			usr << "Error."
			return

		if(!istype(J) && J.jutsu_type == "perk")
			usr << "This is not a custom perk."
			return

		for(var/obj/jutsu/jutsu in archive.contents)
			if(jutsu.name == J.name)
				usr << "There is already a perk with this name archived. Delete it or rename to bypass this."
				return

		archive.contents += J
		archive.save_archive()
		usr << "[J] has been added to the perk archive."
		world.log << "[J.name] has been saved to the perk archives."
		message_admins("[usr.key] has saved [J] to the perk archives.")
		Admin_Logs+="<br>[usr]([usr.key]) archived the [J.name] perk."
		SaveLogs()


	verb/Archive_Jutsu(obj/jutsu/J as obj in world)
		set category = "Admin"

		if(istype(J, /perk_box))
			var/perk_box/perk_box = J
			J = perk_box:reference

		if(!J)
			usr << "Error."
			return

		if(!istype(J) && J.jutsu_type <> "perk")
			usr << "This is not a custom jutsu."
			return

		for(var/obj/jutsu/jutsu in archive.contents)
			if(jutsu.name == J.name)
				usr << "There is already a jutsu with this name archived. Delete it or rename to bypass this."
				return

		archive.contents += J
		archive.save_archive()
		usr << "[J] has been added to the jutsu archive."
		world.log << "[J.name] has been saved to the jutsu archives."
		message_admins("[usr.key] has saved [J.name] to the jutsu archives.")
		Admin_Logs+="<br>[usr]([usr.key]) has saved [J] to the archives."
		SaveLogs()



	verb/Edit_Login_Screen()
		set category = "Admin"
		archive.login_screen = input("Edit the login screen", "Login screen", archive.login_screen) as message




//mob/Admin2/verb/Reset_Reqs()
//	for(var/obj/jutsu/a)
//		a.prerequisites = list()
//		world << "Reset [a] prerequisites to list()"
//	world << "Reset complete."

mob/Admin3/verb
	Archive_New_Weapon(obj/items/weapons/J in world)
		set category = "Admin"

		if(!istype(J, /obj/items/weapons))
			usr << "Error"
			return

		for (var/obj/items/weapons/wep in archive.contents)
			if (istype(wep, /obj/items/weapons) && wep.name == J.name)
				usr << "There is already a weapon with this name archived. Delete it or rename to bypass this."
				return

		archive.contents += J
		archive.save_archive()
		usr << "[J] has been added to the weapon archive."
		world.log << "[J.name] has been saved to the weapon archives."
		message_admins("[usr.key] has saved [J] to the weapon archives.")
		Admin_Logs += "<br>[usr]([usr.key]) archived the [J.name] weapon."
		SaveLogs()





mob/Admin3/verb
	Give_Archived_Jutsu(mob/M as mob in world)
		set category = "Admin"
		var/list/L = list()
		for(var/obj/jutsu/P in archive.contents)
			if(P.jutsu_type <> "perk")
				L += P
		var/obj/jutsu/archived_jutsu = input("Choose the jutsu you'd like to give to [M].") in L

		if(!archived_jutsu)
			usr << "Error."
			return

		for(var/obj/jutsu/jutsu in M)
			if(jutsu.name == archived_jutsu.name)
				usr << "[M] already has a jutsu with this name. Please rename or delete it."
				return

		for(var/obj/progress_card/card in M.progress_list)
			if(card.name == archived_jutsu.name)
				del(card)

		var/obj/jutsu/new_jutsu = new(M)
		for(var/variable in archived_jutsu.vars - "transform")
			if(issaved(archived_jutsu.vars[variable]))
				new_jutsu.vars[variable] = archived_jutsu.vars[variable]

		if(M.progress_box)
			M.progress_box.display_interface(M.progress_list, M)
			M.progress_box.update_bars(M)
		if(M.character_box)
			M.character_box.update_bars(M)
		if(M.jutsu_box)
			M.jutsu_box.display_interface(M.contents)

		usr << "[archived_jutsu] has been successfully copied to [M]."
		message_admins("[usr.key] has copied [archived_jutsu] to [M] also known as [M.key]")
		Admin_Logs+="<br>[usr]([usr.key]) gave [M] also known as  [M.key] a copy of [archived_jutsu]."
		SaveLogs()

	Teach_Archived_Jutsu(mob/M as mob|obj in world)
		set hidden = 1
		set category = "Admin"
		var/list/L = list()
		for(var/obj/jutsu/P in archive.contents)
			if(P.jutsu_type <> "perk")
				L += P
		var/obj/jutsu/archived_jutsu = input("Choose the jutsu you'd like to give to [M].") in L

		if(!archived_jutsu)
			usr << "Error."
			return

		if(M.teach_jutsu(archived_jutsu))

			if(M.progress_box)
				M.progress_box.display_interface(M.progress_list, M)
				M.progress_box.update_bars(M)
			if(M.character_box)
				M.character_box.update_bars(M)

			usr << "[archived_jutsu] has been successfully taught to [M]."
			message_admins("[usr.key] has taught [archived_jutsu] to [M]")
			Admin_Logs+="<br>[usr]([usr.key]) taught [M] [archived_jutsu]."
			SaveLogs()
		else
			usr << "[archived_jutsu] has already been taught to [M]."

	Teach_Archived_Perk(mob/M as mob|obj in world)
		set hidden = 1
		set category = "Admin"
		var/list/L = list()
		for(var/obj/jutsu/P in archive.contents)
			if(P.jutsu_type == "perk")
				L += P
		var/obj/jutsu/archived_perk = input("Choose the perk you'd like to give to [M].") in L

		if(!archived_perk)
			usr << "Error."
			return

		if(M.teach_jutsu(archived_perk))

			if(M.progress_box)
				M.progress_box.display_interface(M.progress_list, M)
				M.progress_box.update_bars(M)
			if(M.character_box)
				M.character_box.update_bars(M)

			usr << "[archived_perk] has been successfully taught to [M]."
			message_admins("[usr.key] has taught [archived_perk] to [M] also known as [M.key].")
			Admin_Logs+="<br>[usr]([usr.key]) taught [M] also known as [M.key] [archived_perk]."
			SaveLogs()
		else
			usr << "[archived_perk] has already been taught to [M]."

	Give_Archived_Perk(mob/M as mob in world)
		set category = "Admin"
		var/list/L = list()
		for(var/obj/jutsu/P in archive.contents)
			if(P.jutsu_type == "perk")
				L += P
		var/obj/jutsu/archived_perk = input("Choose the perk you'd like to give to [M].") in L

		if(!archived_perk)
			usr << "Error."
			return

		for(var/obj/jutsu/jutsu in M)
			if(jutsu.name == archived_perk.name)
				usr << "[M] already has a perk with this name. Please rename or delete it."
				return

		for(var/obj/progress_card/card in M.progress_list)
			if(card.name == archived_perk.name)
				del(card)

		var/obj/jutsu/new_perk = new(M)
		for(var/variable in archived_perk.vars - "transform")
			if(issaved(archived_perk.vars[variable]))
				new_perk.vars[variable] = archived_perk.vars[variable]

		if(M.progress_box)
			M.progress_box.display_interface(M.progress_list, M)
			M.progress_box.update_bars(M)
		if(M.character_box)
			M.character_box.update_bars(M)
		if(M.jutsu_box)
			M.jutsu_box.display_interface(M.contents)

		usr << "[archived_perk] has been successfully copied to [M]."
		message_admins("[usr.key] has copied [archived_perk] to [M] also known as [M.key]")
		Admin_Logs+="<br>[usr]([usr.key]) gave [M] also known as [M.key] a copy of [archived_perk]."
		SaveLogs()
