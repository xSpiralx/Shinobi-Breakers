/*load the library
update the library
	- remove all scrolls with deleted jutsu

player login
	- remove all scrolls not in the database


progress stops (grays out) if the scroll leaves the inventory or the library


lisst of scrolls & names in a grid --- jutsu picture and name, description beneath

dealing with inactives
archive copy, and game copy
*/
/mob/proc/clean_scrolls()
	return
	for(var/obj/items/jutsu_scroll/a in src)
		var/obj/items/jutsu_scroll/master = a.get_master()
		if(master)
			if(!findtext(a.holder, key))
				src << output("[a] is a duplicate and has been deleted.", "outputall.output")
				del(a)
		else
			src << output("[a] no longer exists in the scroll library and has been deleted.", "outputall.output")
			del(a)

/obj/items/jutsu_scroll
	name = "{Jutsu formula} Blank"
	icon = 'Jutsuscrolls.dmi'
	icon_state = "Scroll - Gold"
	suffix = "Not in game world (Undistributed)."
	var/source = null
	var/holder
	var/last_holder
	var/buffer
	var/can_pick_up = 0

	proc/get_master()
		var/a = null
		for(var/obj/items/jutsu_scroll/b in archive)
			if(b.name == name && b != src)
				a = b
		return a

	DblClick()
		var/obj/jutsu/jutsu_type
		for(var/obj/jutsu/jutsu in archive)
			if(jutsu.name == source)
				jutsu_type = jutsu
		if(!jutsu_type)
			usr << output("[src]'s text is damaged and unreadable.", "outputall.output")
			return

		var/list/listed_requirements = jutsu_type.prerequisites.Copy()
		for(var/obj/jutsu/jutsu in usr)
			if(jutsu.name in listed_requirements)
				listed_requirements -= jutsu.name
			else
				for(var/r in jutsu.encapsulates)
					if(r in listed_requirements)
						listed_requirements -= r

		if(listed_requirements.len || (usr.control + usr.control_boost()) < jutsu_type.control_req || (usr.stamina + usr.stamina_boost()) < jutsu_type.stamina_req || (usr.endurance + usr.endurance_boost()) < jutsu_type.endurance_req || (usr.strength + usr.strength_boost()) < jutsu_type.strength_req || (usr.speed + usr.speed_boost()) < jutsu_type.speed_req || (usr.agility + usr.agility_boost()) < jutsu_type.agility_req || (usr.speed + usr.speed_boost()) < jutsu_type.speed_req)
			var/text = "You don't meet the requirements for [jutsu_type] ( "
			for(var/t in listed_requirements)
				text += "[length(text) > 45 ? ", " : ""][t] "
			if(jutsu_type.control_req) text += "[length(text) > 45 ? ", " : ""][get_grade_stat(jutsu_type.control_req)] grade control "
			if(jutsu_type.stamina_req) text += "[length(text) > 45 ? ", " : ""][get_grade_stat(jutsu_type.stamina_req)] grade stamina "
			if(jutsu_type.strength_req) text += "[length(text) > 45 ? ", " : ""][get_grade_stat(jutsu_type.strength_req)] grade strength "
			if(jutsu_type.speed_req) text += "[length(text) > 45 ? ", " : ""][get_grade_stat(jutsu_type.speed_req)] grade speed "
			if(jutsu_type.agility_req) text += "[length(text) > 45 ? ", " : ""][get_grade_stat(jutsu_type.agility_req)] grade agility "
			if(jutsu_type.endurance_req) text += "[length(text) > 45 ? ", " : ""][get_grade_stat(jutsu_type.endurance_req)] grade endurance "
			text += ")"
			alert(usr, text)
			return

		var/p = ""
		for(var/req in jutsu_type.prerequisites)
			p += "[req]"
			if(req != jutsu_type.prerequisites[jutsu_type.prerequisites.len])
				p += ", "

		if(jutsu_type.control_req) p += ", [get_grade_stat(jutsu_type.control_req)] control"

		if(p == "") p = "None"

		if(jutsu_type.jutsu_type <> "perk")
			var/obj/progress_card/card = usr.teach_jutsu(jutsu_type)
			if(!card)
				for(var/obj/progress_card/c in usr.progress_list)
					if(c.name == jutsu_type.name)
						c.learning_from = "SCROLL"
						for(var/mob/M in view())
							M << output("[src] is [M.getStrangerName(usr)]'s new teacher for [jutsu_type]", "outputall.output")
						return
				alert(usr, "You already have [jutsu_type]")
				return
			card.learning_from = "SCROLL"
			for(var/mob/M in view())
				M << output("[M.getStrangerName(usr)] has read [src], thus learning the basics to [jutsu_type]", "outputall.output")
			return

	Pick_Up()
		if(can_pick_up == 1)
			set src in oview(1)
			var/obj/items/jutsu_scroll/master = get_master()
			AJutsuScroll_Logs+="<br>[usr]([usr.key]) has picked up a [src]. ([time2text(world.realtime)])"
			SaveLogs()

			//if u pick it back up and the last holder was u, set last holder back to buffer
			holder = "Holder: [usr.key]"
			if(holder == last_holder)
				last_holder = buffer
			if(master)
				master.suffix = "[holder]<br>[last_holder]"
			suffix = "[holder]<br>[last_holder]"
			src.Move(usr)
		if(can_pick_up == 0)
			alert(usr, "Alert a GM to claim this scroll!")
			return



	Drop()
		set src in usr.contents

		buffer = last_holder
		last_holder = "Last holder: [usr.key]"

		src.Move(usr.loc)
		step(src,usr.dir)

		var/obj/items/jutsu_scroll/master = get_master()
		if(master)
			master.suffix = "Located: [x], [y], [z][last_holder]"
		suffix = "Located: [x], [y], [z][last_holder]"

		if(src.loc)
			for(var/mob/M in src.loc)
				if(M&&M.client)
					if(M.client.address==usr.client.address) return
					for(var/mob/X in range(15,usr))
						X<<output("[X.getStrangerName(usr)] hands [X.getStrangerName(M)] a [src].","outputall.output")
					src.Move(M)

					holder = "Holder: [M.key]"
					if(master)
						master.suffix = "[holder]<br>[last_holder]"
					suffix = "[holder]<br>[last_holder]"
					break

/mob/var/tmp/view_archived_scrolls = 0
/mob/var/tmp/view_archived_weapons = 0
/mob/Admin4/verb/Generate_Scroll(obj/jutsu/J in world)
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

	var/obj/items/jutsu_scroll/scroll = new(archive)
	scroll.name = "{Jutsu formula} [J.name]"
	scroll.source = J.name


/mob/verb/Database()
	set hidden = 1
	var/a = input("This lists all generalized traits that are currently within the game world. They are broken up into categories of Will, Skill, Misc and Alignment, and help shape your character in a non-specialized way. In order to self-learn these skills, one must pay a hefty price, much more than if they learned from a teacher. What would you like to do? \n\nProgress points: [progress_points]") in list("Skill", "Will", "Misc","Alignment")
	switch(a)
		if("Cores")
			var/list/b = list()
			for(var/obj/jutsu/p in archive)
				if(p.perk_type == "Core" && p.jutsu_type == "perk")
					b += p
			var/obj/jutsu/perk = input("All cores are listed here.") in b

			var/p = ""
			for(var/req in perk.prerequisites)
				p += "[req]"
				if(req != perk.prerequisites[perk.prerequisites.len])
					p += ", "

			if(perk.control_req) p += "[perk.control_req ? ", " : ""][length(p) ? ", " : ""][get_grade_stat(perk.control_req)] grade control "
			if(perk.stamina_req) p += "[perk.stamina_req ? ", " : ""][length(p) ? ", " : ""][get_grade_stat(perk.stamina_req)] grade stamina "
			if(perk.strength_req) p += "[perk.strength_req ? ", " : ""][length(p) ? ", " : ""][get_grade_stat(perk.strength_req)] grade strength "
			if(perk.speed_req) p += "[perk.speed_req ? ", " : ""][length(p) ? ", " : ""][get_grade_stat(perk.speed_req)] grade speed "
			if(perk.agility_req) text += "[perk.agility_req ? ", " : ""][length(text) > 45 ? ", " : ""][get_grade_stat(perk.agility_req)] grade agility "
			if(perk.endurance_req) text += "[perk.endurance_req ? ", " : ""][length(text) > 45 ? ", " : ""][get_grade_stat(perk.endurance_req)] grade endurance "
			if(p == "") p = "None"

//			input(src, "[perk.desc]\nNote: [perk.perk_note ? perk.perk_note : ""]\n\nPrerequisites: [p]\nPP Cost: [perk.point_cost]") in list("Confirm", "Cancel")
			if((input(src, "[perk.desc]\nNote: [perk.perk_note ? perk.perk_note : ""]\n\nPrerequisites: [p]\nPP Cost: [(min((perk.point_cost * archive.database_leech_cost), (perk.point_cost+10)))]") in list("Purchase", "Cancel")) == "Purchase")

				var/list/listed_requirements = perk.prerequisites.Copy()
				for(var/obj/jutsu/jutsu in src)
					if(jutsu.name in listed_requirements)
						listed_requirements -= jutsu.name
				if(listed_requirements.len || (usr.control + usr.control_boost()) < perk.control_req || (usr.stamina + usr.stamina_boost()) < perk.stamina_req || (usr.endurance + usr.endurance_boost()) < perk.endurance_req || (usr.strength + usr.strength_boost()) < perk.strength_req || (usr.speed + usr.speed_boost()) < perk.speed_req || (usr.agility + usr.agility_boost()) < perk.agility_req || (usr.speed + usr.speed_boost()) < perk.speed_req)
					var/text = "You don't meet the requirements for [perk] ( "
					for(var/t in listed_requirements)
						text += "[length(text) > 45 ? ", " : ""][t] "
					if(perk.control_req) text += "[length(text) > 45 ? ", " : ""][get_grade_stat(perk.control_req)] grade control "
					if(perk.stamina_req) text += "[length(text) > 45 ? ", " : ""][get_grade_stat(perk.stamina_req)] grade stamina "
					if(perk.strength_req) text += "[length(text) > 45 ? ", " : ""][get_grade_stat(perk.strength_req)] grade strength "
					if(perk.speed_req) text += "[length(text) > 45 ? ", " : ""][get_grade_stat(perk.speed_req)] grade speed "
					if(perk.agility_req) text += "[length(text) > 45 ? ", " : ""][get_grade_stat(perk.agility_req)] grade agility "
					if(perk.endurance_req) text += "[length(text) > 45 ? ", " : ""][get_grade_stat(perk.endurance_req)] grade endurance "
					text += ")"
					alert(src, text)
					return

				if(progress_points >= (min((perk.point_cost * archive.database_leech_cost), (perk.point_cost+10))) || (spec_points && perk.spec_perk))
					if(!teach_jutsu(perk))
						alert("You already have [perk]")
						return

					if(spec_points && perk.spec_perk)
						spec_points--
						a = 1
					else progress_points -= (min((perk.point_cost * archive.database_leech_cost), (perk.point_cost+10)))
					alert(src, "You have purchased [perk] for [(min((perk.point_cost * archive.database_leech_cost), (perk.point_cost+10)))] point(s)")
				else
					alert(src, "You don't have enough points ([progress_points]/[(min((perk.point_cost * archive.database_leech_cost), (perk.point_cost+10)))])")
				character_box.update_info(src)


		if("Will")
			var/list/b = list()
			for(var/obj/jutsu/p in archive)
				if(p.perk_type == "Will" && p.jutsu_type == "perk")
					b += p
			var/obj/jutsu/perk = input("All will perks are listed here.") in b

			var/p = ""
			for(var/req in perk.prerequisites)
				p += "[req]"
				if(req != perk.prerequisites[perk.prerequisites.len])
					p += ", "

			if(perk.control_req) p += "[perk.control_req ? ", " : ""][length(p) ? ", " : ""][get_grade_stat(perk.control_req)] grade control "
			if(perk.stamina_req) p += "[perk.stamina_req ? ", " : ""][length(p) ? ", " : ""][get_grade_stat(perk.stamina_req)] grade stamina "
			if(perk.strength_req) p += "[perk.strength_req ? ", " : ""][length(p) ? ", " : ""][get_grade_stat(perk.strength_req)] grade strength "
			if(perk.speed_req) p += "[perk.speed_req ? ", " : ""][length(p) ? ", " : ""][get_grade_stat(perk.speed_req)] grade speed "
			if(perk.agility_req) text += "[perk.agility_req ? ", " : ""][length(text) > 45 ? ", " : ""][get_grade_stat(perk.agility_req)] grade agility "
			if(perk.endurance_req) text += "[perk.endurance_req ? ", " : ""][length(text) > 45 ? ", " : ""][get_grade_stat(perk.endurance_req)] grade endurance "
			if(p == "") p = "None"

//			input(src, "[perk.desc]\nNote: [perk.perk_note ? perk.perk_note : ""]\n\nPrerequisites: [p]\nPP Cost: [perk.point_cost]") in list("Confirm", "Cancel")
			if((input(src, "[perk.desc]\nNote: [perk.perk_note ? perk.perk_note : ""]\n\nPrerequisites: [p]\nPP Cost: [(min((perk.point_cost * archive.database_leech_cost), (perk.point_cost+10)))]") in list("Purchase", "Cancel")) == "Purchase")

				var/list/listed_requirements = perk.prerequisites.Copy()
				for(var/obj/jutsu/jutsu in src)
					if(jutsu.name in listed_requirements)
						listed_requirements -= jutsu.name
				if(listed_requirements.len || (usr.control + usr.control_boost()) < perk.control_req || (usr.stamina + usr.stamina_boost()) < perk.stamina_req || (usr.endurance + usr.endurance_boost()) < perk.endurance_req || (usr.strength + usr.strength_boost()) < perk.strength_req || (usr.speed + usr.speed_boost()) < perk.speed_req || (usr.agility + usr.agility_boost()) < perk.agility_req || (usr.speed + usr.speed_boost()) < perk.speed_req)
					var/text = "You don't meet the requirements for [perk] ( "
					for(var/t in listed_requirements)
						text += "[length(text) > 45 ? ", " : ""][t] "
					if(perk.control_req) text += "[length(text) > 45 ? ", " : ""][get_grade_stat(perk.control_req)] grade control "
					if(perk.stamina_req) text += "[length(text) > 45 ? ", " : ""][get_grade_stat(perk.stamina_req)] grade stamina "
					if(perk.strength_req) text += "[length(text) > 45 ? ", " : ""][get_grade_stat(perk.strength_req)] grade strength "
					if(perk.speed_req) text += "[length(text) > 45 ? ", " : ""][get_grade_stat(perk.speed_req)] grade speed "
					if(perk.agility_req) text += "[length(text) > 45 ? ", " : ""][get_grade_stat(perk.agility_req)] grade agility "
					if(perk.endurance_req) text += "[length(text) > 45 ? ", " : ""][get_grade_stat(perk.endurance_req)] grade endurance "
					text += ")"
					alert(src, text)
					return
				if(progress_points >= (min((perk.point_cost * archive.database_leech_cost), (perk.point_cost+10))) || (spec_points && perk.spec_perk))
					if(!teach_jutsu(perk))
						alert("You already have [perk]")
						return

					if(spec_points && perk.spec_perk)
						spec_points--
						a = 1
					else progress_points -= (min((perk.point_cost * archive.database_leech_cost), (perk.point_cost+10)))
					alert(src, "You have purchased [perk] for [(min((perk.point_cost * archive.database_leech_cost), (perk.point_cost+10)))] point(s)")
				else
					alert(src, "You don't have enough points ([progress_points]/[(min((perk.point_cost * archive.database_leech_cost), (perk.point_cost+10)))])")
				character_box.update_info(src)




		if("Skill")
			var/list/b = list()
			for(var/obj/jutsu/p in archive)
				if(p.perk_type == "Skill" && p.jutsu_type == "perk")
					b += p
			var/obj/jutsu/perk = input("All skill perks are listed here.") in b

			var/p = ""
			for(var/req in perk.prerequisites)
				p += "[req]"
				if(req != perk.prerequisites[perk.prerequisites.len])
					p += ", "

			if(perk.control_req) p += "[perk.control_req ? ", " : ""][length(p) ? ", " : ""][get_grade_stat(perk.control_req)] grade control "
			if(perk.stamina_req) p += "[perk.stamina_req ? ", " : ""][length(p) ? ", " : ""][get_grade_stat(perk.stamina_req)] grade stamina "
			if(perk.strength_req) p += "[perk.strength_req ? ", " : ""][length(p) ? ", " : ""][get_grade_stat(perk.strength_req)] grade strength "
			if(perk.speed_req) p += "[perk.speed_req ? ", " : ""][length(p) ? ", " : ""][get_grade_stat(perk.speed_req)] grade speed "
			if(perk.agility_req) text += "[perk.agility_req ? ", " : ""][length(text) > 45 ? ", " : ""][get_grade_stat(perk.agility_req)] grade agility "
			if(perk.endurance_req) text += "[perk.endurance_req ? ", " : ""][length(text) > 45 ? ", " : ""][get_grade_stat(perk.endurance_req)] grade endurance "
			if(p == "") p = "None"

			if((input(src, "[perk.desc]\nNote: [perk.perk_note ? perk.perk_note : ""]\n\nPrerequisites: [p]\nPP Cost: [(min((perk.point_cost * archive.database_leech_cost), (perk.point_cost+10)))]") in list("Purchase", "Cancel")) == "Purchase")

				var/list/listed_requirements = perk.prerequisites.Copy()
				for(var/obj/jutsu/jutsu in src)
					if(jutsu.name in listed_requirements)
						listed_requirements -= jutsu.name
				if(listed_requirements.len || (usr.control + usr.control_boost()) < perk.control_req || (usr.stamina + usr.stamina_boost()) < perk.stamina_req || (usr.endurance + usr.endurance_boost()) < perk.endurance_req || (usr.strength + usr.strength_boost()) < perk.strength_req || (usr.speed + usr.speed_boost()) < perk.speed_req || (usr.agility + usr.agility_boost()) < perk.agility_req || (usr.speed + usr.speed_boost()) < perk.speed_req)
					var/text = "You don't meet the requirements for [perk] ( "
					for(var/t in listed_requirements)
						text += "[length(text) > 45 ? ", " : ""][t] "
					if(perk.control_req) text += "[length(text) > 45 ? ", " : ""][get_grade_stat(perk.control_req)] grade control "
					if(perk.stamina_req) text += "[length(text) > 45 ? ", " : ""][get_grade_stat(perk.stamina_req)] grade stamina "
					if(perk.strength_req) text += "[length(text) > 45 ? ", " : ""][get_grade_stat(perk.strength_req)] grade strength "
					if(perk.speed_req) text += "[length(text) > 45 ? ", " : ""][get_grade_stat(perk.speed_req)] grade speed "
					if(perk.agility_req) text += "[length(text) > 45 ? ", " : ""][get_grade_stat(perk.agility_req)] grade agility "
					if(perk.endurance_req) text += "[length(text) > 45 ? ", " : ""][get_grade_stat(perk.endurance_req)] grade endurance "
					text += ")"
					alert(src, text)
					return

				if(progress_points >= (min((perk.point_cost * archive.database_leech_cost), (perk.point_cost+10))) || (spec_points && perk.spec_perk))
					if(!teach_jutsu(perk))
						alert("You already have [perk]")
						return

					if(spec_points && perk.spec_perk)
						spec_points--
						a = 1
					else progress_points -= (min((perk.point_cost * archive.database_leech_cost), (perk.point_cost+10)))
					alert(src, "You have purchased [perk] for [(min((perk.point_cost * archive.database_leech_cost), (perk.point_cost+10)))] point(s)")
				else
					alert(src, "You don't have enough points ([progress_points]/[(min((perk.point_cost * archive.database_leech_cost), (perk.point_cost+10)))])")
				character_box.update_info(src)

		if("Misc")
			var/list/b = list()
			for(var/obj/jutsu/p in archive)
				if(p.perk_type == "Misc" && p.jutsu_type == "perk")
					b += p
			var/obj/jutsu/perk = input("All misc perks are listed here.") in b

			var/p = ""
			for(var/req in perk.prerequisites)
				p += "[req]"
				if(req != perk.prerequisites[perk.prerequisites.len])
					p += ", "

			if(perk.control_req) p += "[perk.control_req ? ", " : ""][length(p) ? ", " : ""][get_grade_stat(perk.control_req)] grade control "
			if(perk.stamina_req) p += "[perk.stamina_req ? ", " : ""][length(p) ? ", " : ""][get_grade_stat(perk.stamina_req)] grade stamina "
			if(perk.strength_req) p += "[perk.strength_req ? ", " : ""][length(p) ? ", " : ""][get_grade_stat(perk.strength_req)] grade strength "
			if(perk.speed_req) p += "[perk.speed_req ? ", " : ""][length(p) ? ", " : ""][get_grade_stat(perk.speed_req)] grade speed "
			if(perk.agility_req) text += "[perk.agility_req ? ", " : ""][length(text) > 45 ? ", " : ""][get_grade_stat(perk.agility_req)] grade agility "
			if(perk.endurance_req) text += "[perk.endurance_req ? ", " : ""][length(text) > 45 ? ", " : ""][get_grade_stat(perk.endurance_req)] grade endurance "
			if(p == "") p = "None"

//			input(src, "[perk.desc]\nNote: [perk.perk_note ? perk.perk_note : ""]\n\nPrerequisites: [p]\nPP Cost: [perk.point_cost]") in list("Confirm", "Cancel")

			if((input(src, "[perk.desc]\nNote: [perk.perk_note ? perk.perk_note : ""]\n\nPrerequisites: [p]\nPP Cost: [(min((perk.point_cost * archive.database_leech_cost), (perk.point_cost+10)))]") in list("Purchase", "Cancel")) == "Purchase")

				var/list/listed_requirements = perk.prerequisites.Copy()
				for(var/obj/jutsu/jutsu in src)
					if(jutsu.name in listed_requirements)
						listed_requirements -= jutsu.name
				if(listed_requirements.len || (usr.control + usr.control_boost()) < perk.control_req || (usr.stamina + usr.stamina_boost()) < perk.stamina_req || (usr.endurance + usr.endurance_boost()) < perk.endurance_req || (usr.strength + usr.strength_boost()) < perk.strength_req || (usr.speed + usr.speed_boost()) < perk.speed_req || (usr.agility + usr.agility_boost()) < perk.agility_req || (usr.speed + usr.speed_boost()) < perk.speed_req)
					var/text = "You don't meet the requirements for [perk] ( "
					for(var/t in listed_requirements)
						text += "[length(text) > 45 ? ", " : ""][t] "
					if(perk.control_req) text += "[length(text) > 45 ? ", " : ""][get_grade_stat(perk.control_req)] grade control "
					if(perk.stamina_req) text += "[length(text) > 45 ? ", " : ""][get_grade_stat(perk.stamina_req)] grade stamina "
					if(perk.strength_req) text += "[length(text) > 45 ? ", " : ""][get_grade_stat(perk.strength_req)] grade strength "
					if(perk.speed_req) text += "[length(text) > 45 ? ", " : ""][get_grade_stat(perk.speed_req)] grade speed "
					if(perk.agility_req) text += "[length(text) > 45 ? ", " : ""][get_grade_stat(perk.agility_req)] grade agility "
					if(perk.endurance_req) text += "[length(text) > 45 ? ", " : ""][get_grade_stat(perk.endurance_req)] grade endurance "
					text += ")"
					alert(src, text)
					return

				if(progress_points >= (min((perk.point_cost * archive.database_leech_cost), (perk.point_cost+10))) || (spec_points && perk.spec_perk))
					if(!teach_jutsu(perk))
						alert("You already have [perk]")
						return

					if(spec_points && perk.spec_perk)
						spec_points--
						a = 1
					else progress_points -= (min((perk.point_cost * archive.database_leech_cost), (perk.point_cost+10)))
					alert(src, "You have purchased [perk] for [(min((perk.point_cost * archive.database_leech_cost), (perk.point_cost+10)))] point(s)")
				else
					alert(src, "You don't have enough points ([progress_points]/[(min((perk.point_cost * archive.database_leech_cost), (perk.point_cost+10)))])")
				character_box.update_info(src)


		if("Alignment")
			var/list/b = list()
			for(var/obj/jutsu/p in archive)
				if(p.perk_type == "Alignment" && p.jutsu_type == "perk")
					b += p
			var/obj/jutsu/perk = input("All alignment perks are listed here.") in b

			var/p = ""
			for(var/req in perk.prerequisites)
				p += "[req]"
				if(req != perk.prerequisites[perk.prerequisites.len])
					p += ", "

			if(perk.control_req) p += "[perk.control_req ? ", " : ""][length(p) ? ", " : ""][get_grade_stat(perk.control_req)] grade control "
			if(perk.stamina_req) p += "[perk.stamina_req ? ", " : ""][length(p) ? ", " : ""][get_grade_stat(perk.stamina_req)] grade stamina "
			if(perk.strength_req) p += "[perk.strength_req ? ", " : ""][length(p) ? ", " : ""][get_grade_stat(perk.strength_req)] grade strength "
			if(perk.speed_req) p += "[perk.speed_req ? ", " : ""][length(p) ? ", " : ""][get_grade_stat(perk.speed_req)] grade speed "
			if(perk.agility_req) text += "[perk.agility_req ? ", " : ""][length(text) > 45 ? ", " : ""][get_grade_stat(perk.agility_req)] grade agility "
			if(perk.endurance_req) text += "[perk.endurance_req ? ", " : ""][length(text) > 45 ? ", " : ""][get_grade_stat(perk.endurance_req)] grade endurance "
			if(p == "") p = "None"

//			input(src, "[perk.desc]\nNote: [perk.perk_note ? perk.perk_note : ""]\n\nPrerequisites: [p]\nPP Cost: [perk.point_cost]") in list("Confirm", "Cancel")

			if((input(src, "[perk.desc]\nNote: [perk.perk_note ? perk.perk_note : ""]\n\nPrerequisites: [p]\nPP Cost: [(min((perk.point_cost * archive.database_leech_cost), (perk.point_cost+10)))]") in list("Purchase", "Cancel")) == "Purchase")

				var/list/listed_requirements = perk.prerequisites.Copy()
				for(var/obj/jutsu/jutsu in src)
					if(jutsu.name in listed_requirements)
						listed_requirements -= jutsu.name
				if(listed_requirements.len || (usr.control + usr.control_boost()) < perk.control_req || (usr.stamina + usr.stamina_boost()) < perk.stamina_req || (usr.endurance + usr.endurance_boost()) < perk.endurance_req || (usr.strength + usr.strength_boost()) < perk.strength_req || (usr.speed + usr.speed_boost()) < perk.speed_req || (usr.agility + usr.agility_boost()) < perk.agility_req || (usr.speed + usr.speed_boost()) < perk.speed_req)
					var/text = "You don't meet the requirements for [perk] ( "
					for(var/t in listed_requirements)
						text += "[length(text) > 45 ? ", " : ""][t] "
					if(perk.control_req) text += "[length(text) > 45 ? ", " : ""][get_grade_stat(perk.control_req)] grade control "
					if(perk.stamina_req) text += "[length(text) > 45 ? ", " : ""][get_grade_stat(perk.stamina_req)] grade stamina "
					if(perk.strength_req) text += "[length(text) > 45 ? ", " : ""][get_grade_stat(perk.strength_req)] grade strength "
					if(perk.speed_req) text += "[length(text) > 45 ? ", " : ""][get_grade_stat(perk.speed_req)] grade speed "
					if(perk.agility_req) text += "[length(text) > 45 ? ", " : ""][get_grade_stat(perk.agility_req)] grade agility "
					if(perk.endurance_req) text += "[length(text) > 45 ? ", " : ""][get_grade_stat(perk.endurance_req)] grade endurance "
					text += ")"
					alert(src, text)
					return

				if(progress_points >= (min((perk.point_cost * archive.database_leech_cost), (perk.point_cost+10))) || (spec_points && perk.spec_perk))
					if(!teach_jutsu(perk))
						alert("You already have [perk]")
						return

					if(spec_points && perk.spec_perk)
						spec_points--
						a = 1
					else progress_points -= (min((perk.point_cost * archive.database_leech_cost), (perk.point_cost+10)))
					alert(src, "You have purchased [perk] for [(min((perk.point_cost * archive.database_leech_cost), (perk.point_cost+10)))] point(s)")
				else
					alert(src, "You don't have enough points ([progress_points]/[(min((perk.point_cost * archive.database_leech_cost), (perk.point_cost+10)))])")
				character_box.update_info(src)

