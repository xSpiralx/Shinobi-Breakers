/turf/skilltile
	icon = 'Skilltiles.dmi'

/obj/skillgrid
	icon = 'Skillgrid.dmi'
	layer = 2.5

/obj/socket
	icon = 'Skillsocket.dmi'

/mob/var/progress_points = 0
/mob/var/lifetime_progress_points = 0

/mob/var/spec_points = 2

/mob/verb/Specialization()
	set hidden = 1
	var/option = input("Listed below are the primary categories for each skillcard. Select one of the choices. The specialization tree is for more specialized, career building traits. The primary database lists more generalized traits for broad strokes.") in list("Specialization Tree","Primary Database","Cancel")
	if(option == "Cancel") return
	if(option == "Primary Database")
		Database()
		return
	var/list/gen2perks = list()
	for(var/obj/jutsu/perk in archive)
		if(perk.perk_type == "Gen2")
			gen2perks += perk
	gen2perks += "Cancel"

	var/choice
	while(choice != "Cancel")
		choice = input("Listed here are only profession/clan perks that can be learnt on your own with the required prerequisites. Select one for more information.\n\nProgress points: [progress_points]") in gen2perks

		if(choice == "Cancel")
			return

		var/obj/jutsu/perk = choice

		var/p = ""
		for(var/req in perk.prerequisites)
			p += "[req]"
			if(req != perk.prerequisites[perk.prerequisites.len])
				p += ", "

		if(perk.control_req) p += "[length(p) ? ", " : ""][get_grade_stat(perk.control_req)] grade control"
		if(perk.stamina_req) p += "[perk.control_req ? ", " : ""][get_grade_stat(perk.stamina_req)] grade stamina"

		if(p == "") p = "None"

		if((input(src, "[perk.desc]\nNote: [perk.perk_note ? perk.perk_note : ""]\n\nPrerequisites: [p]\nPP Cost: [perk.spec_perk && spec_points ? "Free" : perk.point_cost]") in list("Purchase", "Cancel")) == "Purchase")

			var/list/listed_requirements = perk.prerequisites.Copy()
			for(var/obj/jutsu/jutsu in src)
				if(jutsu.name in listed_requirements)
					listed_requirements -= jutsu.name
				else
					for(var/r in jutsu.encapsulates)
						if(r in listed_requirements)
							listed_requirements -= r
			if(listed_requirements.len || (control + control_boost()) < perk.control_req || (stamina + stamina_boost()) < perk.stamina_req)
				var/text = "You don't meet the requirements for [perk] ( "
				for(var/t in listed_requirements)
					text += "[t][length(text) > 45 ? ", " : ""] "
				if(perk.control_req) text += "[get_grade_stat(perk.control_req)] grade control[length(text) > 45 ? ", " : ""] "
				if(perk.stamina_req) text += "[get_grade_stat(perk.stamina_req)] grade stamina "
				text += ")"
				alert(src, text)
				return

			if(progress_points >= perk.point_cost || (spec_points && perk.spec_perk))
				if(!teach_jutsu(perk))
					alert("You already have [perk]")
					return
				var/a = 0
				if(spec_points && perk.spec_perk)
					spec_points--
					a = 1
				else progress_points -= perk.point_cost
				alert(src, "You have purchased [perk] for [a ? "1 free specialization" : perk.point_cost] point(s)")
			else
				alert(src, "You don't have enough points ([progress_points]/[perk.point_cost])")
			character_box.update_info(src)
