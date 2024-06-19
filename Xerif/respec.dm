mob/proc/give_perk(perk_name)
	var/obj/jutsu/archived_perk
	for(var/obj/jutsu/P in archive.contents)
		if(P.jutsu_type == "perk")
			if(P.name == perk_name)
				archived_perk = P

	if(!archived_perk)
		src << "Error."
		return

	for(var/obj/jutsu/jutsu in src)
		if(jutsu.name == archived_perk.name)
			return

	for(var/obj/progress_card/card in src.progress_list)
		if(card.name == archived_perk.name)
			del(card)

	var/obj/jutsu/new_perk = new(src)
	for(var/variable in archived_perk.vars - "transform")
		if(issaved(archived_perk.vars[variable]))
			new_perk.vars[variable] = archived_perk.vars[variable]


/mob/proc/respec_perks()
	for(var/obj/jutsu/perk in src)
		if(perk.name == "Bandit") continue
		if(perk.jutsu_type == "perk")
			del(perk)

	for(var/obj/progress_card/card in src)
		if(card.jutsu_type == "perk")
			del(card)

	progress_points = lifetime_progress_points
	core_slots = 10
	give_perk(starter_perk)

/mob/proc/respec_jutsu()
	for(var/obj/jutsu/perk in src)
		if(perk.name == "Bandit") continue
		if(perk.jutsu_type == "Jutsu" || perk.jutsu_type == null || perk.jutsu_type == "")
			del(perk)

	for(var/obj/progress_card/card in src)
		if(card.jutsu_type == "Jutsu")
			del(card)

/mob/proc/respec_points()

	strength = 1
	endurance = 1
	speed = 1
	agility = 1
	stamina = 10
	control = 1

	stat_points = lifetime_progress_points + 15

/archive/var/respec_new_logins = 1

/mob/var/respec_check = 1

/mob/proc/complete_respec()
	var/text = ""
	for(var/obj/jutsu/perk in src)
		text += "[perk.name], "
	src << "Refunded [text]"
	respec_perks()
	respec_jutsu()
	respec_points()
	src << "Your stats & perks have been reset and all points refunded."

/mob/proc/respec_check()
	if(archive.respec_new_logins && respec_check < 1)
		complete_respec()
		respec_check = 1

/mob/Admin3/verb/Complete_Respec(mob/m as mob in world)
	set category = "Admin"
	m.complete_respec()

/mob/Admin3/verb/Perk_Respec(mob/m as mob in world)
	set category = "Admin"
	m.respec_perks()
	m.respec_points()
	m << "Your stats & perks have been reset and all points refunded."