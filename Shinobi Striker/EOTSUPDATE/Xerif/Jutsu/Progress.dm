/world/New()
	..()
	spawn(seconds(10)) progress_loop()

/mob/var/reward_point = 50
/mob/var/reward_timer = 0
/mob/var/reward_counter = 0
/mob/var/last_reward = 0

/mob/var/true_stat_cap = 1#INF

/var/lifetime_progress_average = 0

/proc/hours(var/n)
	return 36000 * n

/proc/minutes(var/n)
	return 600 * n

/proc/seconds(var/n)
	return 10 * n

/mob/var/daily_counter = 0
/mob/var/last_progress_day = 0
/mob/var/avg_pp_excluded = FALSE
/mob/var/reward_breakpoint

/var/progress_softcap = 165

/proc/get_reward_point(mob/M)
	var/bonus, amount

	bonus = 520*(M.lifetime_progress_points/progress_softcap)
	amount = 300*M.dailies

	M.reward_breakpoint = amount + bonus
	return M.reward_breakpoint

proc/calculate_pp_average()
	var/_total
	var/_players
	var/_avg
	for(var/mob/M)
		if(M.client && M.avg_pp_excluded != TRUE)
			_total+=M.lifetime_progress_points
			_players++

	_avg = _total / _players
	return _avg

/proc/progress_loop()
	set background = 1
	lifetime_progress_average = calculate_pp_average()
	for(var/mob/M)
		spawn(1)
			M.check_injury_timers()
			M.SpamCount--
			if(M.progress_activity > 0 && archive.progress_on)
				if(!M.progress_target)
					M.progress_activity--

				if(world.realtime - M.reward_timer >= hours(22))
					M.reward_timer = world.realtime
					M.activity_reward(1)
					M.dailies = 0

				if(M.HasPerk("Starter") && M.avg_pp_excluded == FALSE)
					world << "[M] has been excluded from the server average due to having the starter perk... Server average reset complete"
					M.avg_pp_excluded = TRUE
					lifetime_progress_average = 1

				if(++M.reward_point > get_reward_point(M))
					M.activity_reward(0)
					M.reward_point = 0
					M.dailies++

			if(M.progress_target && archive.progress_on)
				M.progress_target.progress(M)

			if(M.character_box)
				M.character_box.update_bars(M)

	spawn(minutes(1)) progress_loop()

/mob/var/dailies = 0
/mob/proc/activity_reward(_daily)

	if(_daily)
		var/bonus = get_point_bonus(src)
		stat_points += bonus
		progress_points += bonus
		lifetime_progress_points += bonus
		src << output("You've been rewarded [bonus ? bonus : "fractional"] point(s) for your daily.", "outputall.output")

	if(character_box)
		character_box.update_stats(src)
		character_box.update_info(src)

mob/verb/progress_check()
	set hidden = 1
	src << output("You have made [round((reward_point/(reward_breakpoint))*100)]% progress to your next activity reward.","outputall.output")


mob/Admin6
	verb
		Set_PP()
			set category = "Admin6"
			var/choice = input("Choose a cap.") in list("Low","Medium","High","Cancel")
			if(choice == "Low")
				archive.lowcap = input("Choose a lowcap. It's currently [archive.lowcap]") as num
			if(choice == "Medium")
				archive.medcap = input("Choose a medcap. It's currently [archive.medcap]") as num
			if(choice == "High")
				archive.highcap = input("Choose a highcap. It's currently [archive.highcap]") as num

		Adjust_Server_Average_PP()
			set category = "Admin6"
			var/k = input("What do you want to change the server average pp to?",lifetime_progress_average) as num
			lifetime_progress_average = k


/proc/get_point_bonus(mob/M)
	//var/total = M.total_stats() + M.stat_points
	if(M.lifetime_progress_points < 50) return 3
	if(M.lifetime_progress_points < 100) return 2
	if(M.lifetime_progress_points < 150) return 1
	return 1

/proc/get_rank_grade(mob/M)
	var/total = M.total_stats()
	if(total >= 230) return "S"

	//hancho cap 224
	if(total >= 215) return "A+"
	if(total >= 195) return "A"
	if(total >= 180) return "A-"

	//jonin cap 179
	if(total >= 165) return "B+"
	if(total >= 150) return "B"
	if(total >= 135) return "B-"

	//134 chunin cap
	if(total >= 120) return "C+"
	if(total >= 105) return "C"
	if(total >= 90) return "C-"

	//89 genin cap
	if(total >= 75) return "D+"
	if(total >= 60) return "D"
	if(total >= 45) return "D-"


	if(total >= 30) return "E+"
	if(total >= 15) return "E"
	return "E-"

obj/progress_card
	name
	desc
	icon
	icon_state
	var
		learn_req = 1200
		control_req = 1
		stamina_req = 1
		jutsu_id = 1
		chakra_req = 1
		learn_progress = 1
		hidden = 0
		jutsu_type
		list/prerequisites = list()
		list/encapsulates = list()
		learning_from
		hidden_name = ""

	test
		name = "Body"
		icon = 'Perk.dmi'
		icon_state = "Body"
		learn_req = 30

	test2
		name = "Tailed Chakra"
		icon = 'Perk.dmi'
		icon_state = "Tailed Chakra"
		learn_req = 30

	proc/set_learn_req(var/mob/M)
		return learn_req
/*		if(M.control + M.control_boost() > control_req && jutsu_type <> "perk")
			if(learn_req = round(learn_req * (control_req / M.control)))
*/
	proc/progress(var/mob/M)
		update_learnreq(M) //Make sure requirements are updated.
		check_progress(M) // setup to make perks instant
		if(world.realtime - M.progress_timer > 432000) //864000
			M.progress_timer = world.realtime
			M.progress_today = 0

		var/progress_rate
		if(M.control + M.control_boost() + M.studious_boost() < control_req)
			if(learn_progress/max(learn_req, 1) > ((max(1, M.control + M.control_boost()) + M.studious_boost())/max(control_req, 1)))
				progress_rate = 0
			else
				progress_rate = 1
		else //if(M.progress_today < M.progress_cap)
			progress_rate = 1
		//else// if(M.progress_today < M.progress_cap * 1.25)
		//	progress_rate = 0.25
		//else progress_rate = 0

/*		var/progress_rate
		if(M.control + M.control_boost() < control_req)
			if(learn_progress/learn_req > 0.05)
				progress_rate = 0
			else
				progress_rate = 1
		else if(M.progress_today < M.progress_cap)
			progress_rate = 1
		else if(M.progress_today < M.progress_cap * 1.25)
			progress_rate = 0.25
		else progress_rate = 0
*/
		var/progress_amount
		var/int_bonus = 1

		if(M.HasPerk("Studious I"))
			int_bonus = 2
		if(M.HasPerk("Studious II"))
			int_bonus = 3
		if(M.HasPerk("Studious III"))
			int_bonus = 4
		if(M.HasPerk("Genius"))
			int_bonus = 5

		if(M.HasPerk("Senju Talent"))
			int_bonus = 2

		if(learning_from)
			if(learning_from == "SCROLL")
				for(var/obj/items/jutsu_scroll/scroll in M)
					if(scroll.source == name)
						M.progress_activity--
						progress_amount = 1 * M.progress_speed * progress_rate * int_bonus
			else if(M.teacher_activity && M.progress_activity)
				M.teacher_activity--
				M.progress_activity--
				progress_amount = 100 * M.progress_speed * progress_rate * int_bonus
		else if(is_active(M))
			progress_amount = 35 * M.progress_speed * progress_rate * int_bonus

		learn_progress += progress_amount * archive.global_progress_rate
		//M.progress_today += progress_amount

		if(M.character_box)
			M.character_box.update_bars(M)
		if(M.progress_box)
			M.progress_box.update_bars(M)

		check_progress(M)

	proc/check_progress(var/mob/M)
		if(learn_progress > learn_req)
			give_jutsu(M)
			M.progress_target = null
			M.progress_list -= src
			if(M.progress_box)
				M.progress_box.display_interface(M.progress_list, M)
				M.progress_box.update_bars(M)
			if(M.character_box)
				M.character_box.update_bars(M)
			if(M.jutsu_box)
				M.jutsu_box.display_interface(M.contents)
			del(src)

	proc/is_active(var/mob/M)
		if(M.progress_activity > 0)
			M.progress_activity--
			return 1
		return 0

	proc/give_jutsu(var/mob/M)
//		var/jutsu_type = get_jutsu(name)
		var/obj/jutsu/jutsu_type = get_jutsu(name)
		if(hidden)
			jutsu_type = get_jutsu(hidden_name)
		if(jutsu_type)
			var/obj/jutsu/new_jutsu = copy_jutsu(jutsu_type, M)
			if(jutsu_type.progresses_into)
				for(var/obj/jutsu/jutsu in M)
					if(jutsu.progresses_into == name)
						del(jutsu)
			if(new_jutsu.free_spec)
				M.spec_points++
				M << output("This perk grants you a free specialization perk. Buy it from the tree.", "outputall.output")
		//SLOTH core deletion loop
		for(var/obj/jutsu/k in M.contents)
			if(k.progresses_into)
				if(k.progresses_into == src.name)
					del(k)
	proc/get_jutsu(name_identifier)
		for(var/obj/jutsu/jutsu in archive)
			if(jutsu.name == name_identifier)
				return jutsu

	proc/copy_jutsu(obj/jutsu/jutsu_type, var/mob/M)
		var/obj/jutsu/new_jutsu = new(M)
		for(var/variable in jutsu_type.vars - "transform")
			if(issaved(jutsu_type.vars[variable]))
				new_jutsu.vars[variable] = jutsu_type.vars[variable]
		return new_jutsu

	proc/set_current(var/mob/M)
		M.progress_target = src
		if(M.character_box)
			M.character_box.update_bars(M)
		if(M.progress_box)
			M.progress_box.display_interface(M.progress_list, M)
			M.progress_box.update_bars(M)
	proc/update_learnreq(var/mob/M)
		for(var/obj/progress_card/A in M.contents)
			var/obj/jutsu/J = get_jutsu(A.name)
			if(A.learn_req != J.learn_req)
				A.learn_req = J.learn_req
				M << "Updated learn requirements for [A]"
	Click()
		set_current(usr)

	DblClick()
		var/obj/jutsu/j = get_jutsu(name)

		if(!j) return

		if(j.jutsu_type!="perk")
			j.bl=384
			j.bw=542
			usr<<browse(src.desc,"window=[j];size=[j.bl]x[j.bw]")
		else
			usr<<browse({"
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style>

a{
color:#DDBE0D;
}

body{
color:[j.perk_color];
background-color:#0b0f12;
font-family:calibri;
}
table, th, td {
  vertical-align: top;
  padding-left: 15px;
  font-size:13px;
}
.leftcolumn {
color:#DDBE0D;
}
</style>
</head>
<body>

<table style="width:100%">
  <tr>
    <td><div class=leftcolumn>Name</div></td>
    <td><b>[j.name]</b></td>
  </tr>
  <tr>
    <td><div class=leftcolumn>Desc</div></td>
    <td><font color=white>[j.desc]</font></td>
  </tr>
   <tr>
    <td><div class=leftcolumn>Note</div></td>
    <td><i>[j.perk_note]</i></td>
  </tr>
</table>
</body>
</html>

"},"window=[j];size=[j.bl]x[j.bw]")

mob
	var
		progress_cap = 120
		progress_speed = 4
		progress_today = 0
		progress_timer = 0
		progress_key = 1
		obj/progress_card/progress_target
		list/obj/progress_card/progress_list = list()
		progress_activity = 0
		teacher_activity = 0

	proc/is_req_locked(var/obj/jutsu/t)
		var/prerequisite_locked = 0
		for(var/r in t.prerequisites)
			var/l = 1
			for(var/obj/jutsu/p in src)
				if(p.name == r)
					l = 0
				else if(p.encapsulates.Find(r))
					l = 0
			if(l)
				prerequisite_locked = 1
				break
		if(prerequisite_locked)
			return 0
		return 1



	proc/bypass_teach(var/obj/jutsu/jutsu_type, var/hidden = 0)
		if(!jutsu_type) return
		for(var/obj/jutsu/jutsu in src)
			if(jutsu.name == jutsu_type.name)
				return 0
		for(var/obj/progress_card/card in progress_list)
			if(card.name == jutsu_type.name)
				return 0

		for(var/obj/progress_card/card in progress_list)
			if(card.name == jutsu_type.name)
				del(card)

		var/obj/jutsu/new_jutsu = new(src)
		for(var/variable in jutsu_type.vars - "transform")
			if(issaved(jutsu_type.vars[variable]))
				new_jutsu.vars[variable] = jutsu_type.vars[variable]

		if(progress_box)
			progress_box.display_interface(progress_list)
			progress_box.update_bars(src)
		if(character_box)
			character_box.update_bars(src)
		if(jutsu_box)
			jutsu_box.display_interface(contents)
		return 1


	proc/teach_jutsu(var/obj/jutsu/jutsu_type, var/hidden = 0)
		if(!jutsu_type) return
		for(var/obj/jutsu/jutsu in src)
			if(jutsu.name == jutsu_type.name)
				return 0
		for(var/obj/progress_card/card in progress_list)
			if(card.name == jutsu_type.name)
				return 0
		var/obj/progress_card/card = new(src)
		card.name = jutsu_type.name
		card.desc = jutsu_type.desc
		card.icon = jutsu_type.icon
		card.jutsu_type = jutsu_type.jutsu_type
		card.icon_state = jutsu_type.icon_state
		card.learn_req = jutsu_type.learn_req
		card.control_req = jutsu_type.control_req
		card.chakra_req = jutsu_type.chakra_req
		card.prerequisites = jutsu_type.prerequisites
		card.encapsulates = jutsu_type.encapsulates
		card.learn_progress = round(5 * jutsu_type.learn_req/100)
		if(hidden)
			card.name = "Natural Trait (Hidden)"
			card.hidden = 1
			card.icon = 'Perkmask.dmi'
			card.icon_state = "hidden"
			card.hidden_name = jutsu_type.name
		progress_list += card
//		src << "You've learnt the basics to [card.name]"
		if(progress_box)
			progress_box.display_interface(progress_list, src)
		spawn() card.check_progress(src)
		return card

	proc/update_jutsu()
		for(var/obj/jutsu/jutsu in src)
			archive.jutsu_last_activity[jutsu.name] = world.realtime
			for(var/obj/jutsu/archived_jutsu in archive)
				if(jutsu.name == archived_jutsu.name)
					if(jutsu.last_updated < archived_jutsu.last_edit)
						for(var/variable in archived_jutsu.vars - "transform" - "Discount")
							if(issaved(archived_jutsu.vars[variable]))
								jutsu.vars[variable] = archived_jutsu.vars[variable]
						jutsu.last_updated = archived_jutsu.last_edit
						src << "Updated [jutsu.name]."
						break
		for(var/obj/items/weapons/wep in src)
			for(var/obj/items/weapons/wep_arch in archive)
				if(wep.name == wep_arch.name)
					if(wep.last_edit < wep_arch.last_edit)
						for(var/variable in wep_arch.vars - "transform" - "amount")
							if(issaved(wep_arch.vars[variable]))
								wep.vars[variable] = wep_arch.vars[variable]
						wep.last_edit = wep_arch.last_edit
						src << "Updated [wep.name]."
						break
		for(var/obj/items/Poisons/p in src)
			for(var/obj/items/Poisons/poison_arch in archive)
				if(p.name == poison_arch.name)
					if(p.last_edit < poison_arch.last_edit)
						for(var/variable in poison_arch.vars - "transform" - "amount")
							if(issaved(poison_arch.vars[variable]))
								p.vars[variable] = poison_arch.vars[variable]
						p.last_edit = poison_arch.last_edit
						src << "Updated [p.name]."
						break
		for(var/obj/items/Clothing/p in src)
			for(var/obj/items/Clothing/poison_arch in archive)
				if(p.name == poison_arch.name)
					if(p.last_edit < poison_arch.last_edit)
						for(var/variable in poison_arch.vars - "transform" - "amount")
							if(issaved(poison_arch.vars[variable]))
								p.vars[variable] = poison_arch.vars[variable]
						p.last_edit = poison_arch.last_edit
						src << "Updated [p.name]."
						break


	verb/Teach()
		if(TeachingOff)
			return
		//if(src.lifetime_progress_points  <= 60)
		//	alert("You can not teach until you have more than 60 progress points.")
		//	return
		var/mob/M = locate() in get_step(src, dir)

		if(M.client.address == src.client.address)
			del(M)
			return

		if(M.client.computer_id == src.client.computer_id)
			del(M)
			return

		if(!M) return
		var/list/L = list()
		for(var/obj/jutsu/jutsu in src)
			if(jutsu.jutsu_type <> "perk" && !jutsu.unlearnable)
				L += jutsu
			if(jutsu.jutsu_type == "perk" && (jutsu.perk_type in list("Skill")))
				L += jutsu

		L += "Cancel"

		var/obj/jutsu/jutsu_type = input(usr,"Teach [M] what jutsu?") in L
		if(!jutsu_type || !istype(jutsu_type, /obj/jutsu) || jutsu_type == "Cancel")
			return

		var/TeacherRank = src.Class
		var/LearnerRank = M.Class
		var/rank_list = list("Student", "Genin", "Chunin", "Tokubetsu Jonin", "Jonin", "Hancho")
		var/teacher_index = -1
		var/student_index = -1
		var/reqs = M.check_reqs(jutsu_type, 1)



		for (var/rank in rank_list)
			teacher_index += 1
			if (rank == TeacherRank)
				break

		for (var/rank in rank_list)
			student_index += 1
			if (rank == LearnerRank)
				break

		if (student_index >= teacher_index)
			alert(src, "You can only teach someone with a lower rank than yours. You are [src.Class] and your teacher is [M.Class]")
			return

		if(reqs != "Pass")
			alert(src,reqs)
			return


		var/p = ""
		for(var/req in jutsu_type.prerequisites)
			p += "[req]"
			if(req != jutsu_type.prerequisites[jutsu_type.prerequisites.len])
				p += ", "

		if(jutsu_type.control_req) p += "[jutsu_type.control_req ? ", " : ""][length(p) ? ", " : ""][get_grade_stat(jutsu_type.control_req)] grade control "
		if(jutsu_type.stamina_req) p += "[jutsu_type.stamina_req ? ", " : ""][length(p) ? ", " : ""][get_grade_stat(jutsu_type.stamina_req)] grade stamina "
		if(jutsu_type.strength_req) p += "[jutsu_type.strength_req ? ", " : ""][length(p) ? ", " : ""][get_grade_stat(jutsu_type.strength_req)] grade strength "
		if(jutsu_type.speed_req) p += "[jutsu_type.speed_req ? ", " : ""][length(p) ? ", " : ""][get_grade_stat(jutsu_type.speed_req)] grade speed "
		if(jutsu_type.agility_req) text += "[jutsu_type.agility_req ? ", " : ""][length(text) > 45 ? ", " : ""][get_grade_stat(jutsu_type.agility_req)] grade agility "
		if(jutsu_type.endurance_req) text += "[jutsu_type.endurance_req ? ", " : ""][length(text) > 45 ? ", " : ""][get_grade_stat(jutsu_type.endurance_req)] grade endurance "
		if(p == "") p = "None"

		if(jutsu_type.jutsu_type <> "perk")
			var/obj/progress_card/card = M.teach_jutsu(jutsu_type)
			if(!card)
				for(var/obj/progress_card/c in M.progress_list)
					if(c.name == jutsu_type.name)
						c.learning_from = src.ckey
						show_message("[src] is [M]'s new teacher for [jutsu_type]")
						return
				alert(M, "You already have [jutsu_type]")
				return
			card.learning_from = src.ckey

			var/mob/controlMob = src
			if(controlMob.MindTransfer) controlMob=controlMob.MindTransfer
			for(var/mob/hearer in hearers(16,controlMob))
				if(hearer.MindTransfer) if(hearer == hearer.MindTransfer.MindAfflicted) continue
				if(hearer.MindAfflicted)
					hearer.MindAfflicted << output("[hearer.getStrangerName(src)] has taught [hearer.MindAfflicted.getStrangerName(M)] the basics to [jutsu_type]", "outputall.output")
				else hearer << output("[hearer.getStrangerName(src)] has taught [hearer.getStrangerName(M)] the basics to [jutsu_type]", "outputall.output")
			return

		for(var/obj/progress_card/c in M.progress_list)
			if(c.name == jutsu_type.name)
				c.learning_from = src.ckey

				var/mob/controlMob = src
				if(controlMob.MindTransfer) controlMob=controlMob.MindTransfer
				for(var/mob/hearer in hearers(16,controlMob))
					if(hearer.MindTransfer) if(hearer == hearer.MindTransfer.MindAfflicted) continue
					if(hearer.MindAfflicted)
						hearer.MindAfflicted << output("[hearer.getStrangerName(src)] is [hearer.MindAfflicted.getStrangerName(M)]'s new teacher for [jutsu_type]", "outputall.output")
					else hearer << output("[hearer.getStrangerName(src)] is [hearer.getStrangerName(M)]'s new teacher for [jutsu_type]", "outputall.output")
				return

		if((input(M, "[src] is attempting to teach you [jutsu_type] for [jutsu_type.point_cost] point(s)\n\nPrerequisites: [p]\nPP Cost: [jutsu_type.point_cost]") in list("Accept", "Cancel")) == "Accept")
			if(M.progress_points >= jutsu_type.point_cost)
				var/obj/progress_card/card = M.teach_jutsu(jutsu_type)
				if(!card)
					alert(M, "You already have [jutsu_type]")
					return
				M.progress_points -= jutsu_type.point_cost
				card.learning_from = src.ckey
				var/mob/controlMob = src
				if(controlMob.MindTransfer) controlMob=controlMob.MindTransfer
				for(var/mob/hearer in hearers(16,controlMob))
					if(hearer.MindTransfer) if(hearer == hearer.MindTransfer.MindAfflicted) continue
					if(hearer.MindAfflicted)
						hearer.MindAfflicted << output("[hearer.getStrangerName(src)] has taught [hearer.MindAfflicted.getStrangerName(M)] the basics to [jutsu_type]", "outputall.output")
					else hearer << output("[hearer.getStrangerName(src)] has taught [hearer.getStrangerName(M)] the basics to [jutsu_type]", "outputall.output")
			else
				alert(M, "You don't have enough points ([progress_points]/[jutsu_type.point_cost])")
			M.character_box.update_info(M)



mob

	proc/check_rank(obj/jutsu/perk)

		var/difference = rankToInt(perk.rank_req) -  rankToInt(Class)
		if(difference <= 0)
			return "Pass"

		if(difference == 1)
			if(HasPerk("Genius"))
				return "Pass"
			return "Someone of your rank normally cannot use this perk. Do you wish to purchase it for double the cost? \n([perk.point_cost*2] points)"

		if(difference > 1)
			return "Too High"


	proc/check_reqs(obj/jutsu/perk, teach = 0)

		var/list/listed_requirements = perk.prerequisites.Copy()

		for(var/i in listed_requirements)
			if(i == Class)
				listed_requirements -= i

			if(findtext(i,"Proficiency"))
				var/list/isplit = splittext(i," ")
				var/list/k = ""
				for(var/obj/jutsu/jutsu in src)
					k = splittext(jutsu.name," ")
					if(k[1] == isplit[1] && k[2] == isplit[2])
						if(checkNumeral(isplit[3],k[3]))
							listed_requirements -= i
							break

			if(findtext(i,"OR"))
				var/list/split = splittext(i," OR ")
				for(var/obj/jutsu/jutsu in src)
					if(jutsu.name == split[1] || jutsu.name == split[2])
						listed_requirements -= i


			if(findtext(i,"NOT"))

				var/pos = findtext(i,"NOT ")
				var/not_allowed = "[copytext(i,pos+4)]"

				for(var/obj/jutsu/jutsu in src)
					if(jutsu.name == not_allowed)
						var/text = "You cannot acquire [perk] because you have [jutsu]."
						if(teach == 1)
							text = "They cannot acquire [perk] because they have [jutsu]."
						return text

				listed_requirements -= i


		for(var/obj/jutsu/jutsu in src)
			if(jutsu.name in listed_requirements)
				listed_requirements -= jutsu.name


		if(listed_requirements.len || max(src.control + src.control_boost(),1) < perk.control_req || max(src.stamina + src.stamina_boost(),1) < perk.stamina_req || max(1,src.endurance + src.endurance_boost()) < perk.endurance_req || max(src.strength + src.strength_boost(),1) < perk.strength_req || max(src.speed + src.speed_boost(),1) < perk.speed_req || max(src.agility + src.agility_boost(),1) < perk.agility_req || max(src.speed + src.speed_boost(),1) < perk.speed_req)

			var/text = "You don't meet the requirements for [perk]"
			if(teach == 1)
				text = "They don't meet the requirements for [perk]"
		//	alert(src, text)
			return text
		return "Pass"


proc
	checkNumeral(x,y) //req , user's current
		x = numeralToInt(x)
		y = numeralToInt(y)
		if(y >= x)
			return 1
		return 0
proc
	numeralToInt(x)
		switch(x)
			if("I")
				return 1
			if("II")
				return 2
			if("III")
				return 3
			if("IV")
				return 4
			if("V")
				return 5

proc
	rankToInt(x)
		if(x == "Genin")
			return 1
		if(x == "Chunin")
			return 2
		if(x == "Tokubetsu")
			return 3
		if(x == "Jonin")
			return 4
		if(x == "Kage")
			return 5

		return 0