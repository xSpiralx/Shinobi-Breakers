/mob/var/strength = 1
/mob/var/agility = 1
/mob/var/endurance = 1

/mob/var/vitality = 10
/mob/var/control = 1
/mob/var/stamina = 10

/mob/var/speed = 1

/mob/var/stat_cap = 89
/mob/var/stat_points = 15

/mob/var/health = 50
/mob/var/maxhealth = 50
/mob/var/chakra = 100
/mob/var/healthpoints = 6
/mob/var/maxhealthpoints = 6
/mob/var/trait_text

/mob/var/numtoggle = 1


/mob/proc/togglenums(var/mob/user)
	if(!user.numtoggle)
		user.numtoggle = 1
	else
		user.numtoggle = 0

	if(character_box)
		character_box.update_stats(src)
		character_box.update_info(src)


/mob/proc/allocate_stats(stat)
	if(stat_points > 0 && !is_capped())
		var/stat_limit = round(stat_cap / 4)
		switch(stat)
			if("strength")
				if(strength < stat_limit)
					strength++
					stat_points--
			if("endurance")
				if(endurance < stat_limit)
					endurance++
					stat_points--
			if("agility")
				if(agility < stat_limit)
					agility++
					stat_points--
			if("speed")
				if(speed < stat_limit)
					speed++
					stat_points--
			if("stamina")
				if(stamina < stat_limit)
					stamina++
					stat_points--
			if("control")
				if(control < stat_limit)
					control++
					stat_points--
		if(character_box)
			character_box.update_stats(src)
			character_box.update_info(src)
	else
		if(is_capped())
			usr << "You have added [total_stats()] / [stat_cap] stat points, you cannot add more until you rank up."
		else
			usr << "You have no more stat points to spend."


/mob/proc/is_capped()
	return total_stats() >= stat_cap

/mob/proc/total_stats()
	return strength + endurance + agility + speed + stamina + control - 15


/mob/proc/can_attack(var/mob/M)
	if(!(!resting && !KO && move && !M.KO && M.attackable && (!attacking && !(grabbee || grabber)) && chakra > 0))
		return 0
	return 1

/*/mob/proc/take_damage(amount)
	health -= amount
	if(character_box)
		character_box.update_bars(src)*/

/mob/proc/get_targets()
	var/list/targets = list()
	for(var/mob/M in get_step(src, dir))
		targets += M
	if(grabbee) targets += grabbee
	if(grabber) targets += grabber
	return targets

/mob/proc/damage_message(mob/attacker, damage)
	var/damage_amount
	if(damage <= 2)
		damage_amount = pick(
		", but the blow is useless",
		", but barely does any damage",
		", but the blow doesn't land solidly",
		", but it doesn't seem to do a thing")
	else if(damage >= 50)
		damage_amount = pick(
		", doing incomprehensible damage")
	else if(damage >= 35)
		damage_amount = pick(
		", doing horrible damage",
		", doing grevious damage",
		", doing incredible damage",
		", doing extreme damage")
	else if(damage >= 25)
		damage_amount = pick(
		", heavily bruising the muscle and rattling bone",
		", horribly bruising the muscle and fracturing bone")

	var/damage_type
	if(damage >= 50)
		damage_type = pick(
		"hulk smashes")
	else if(damage >= 35)
		damage_type = pick(
		"smashes")
	else if(damage >= 25)
		damage_type = pick(
		"punches",
		"elbows",
		"palm strikes",
		"knees",
		"kicks")
	else
		damage_type = pick(
		"punches",
		"elbows",
		"palm strikes",
		"knees",
		"kicks")

	view() << "<font color=[hit_color]>[attacker] [damage_type] [src][damage_amount]."

/mob/proc/miss_message(mob/victim)
	view() << "<font color=[miss_color]>[src] completely misses [victim]."

proc/get_grade_stat(var/value = 0, var/stam = 0)
    if(value > 80) return "S+"// @ 91
    if(value > 75) return "S"// @ 86
    if(value > 70) return "S-"// @ 81
    if(value > 65) return "A+"// @ 76
    if(value > 60) return "A"// @ 71
    if(value > 55) return "A-"// @ 56
    if(value > 50) return "B+"// @ 51
    if(value > 45) return "B"// @ 46
    if(value > 40) return "B-"// @ 41
    if(value > 35) return "C+"// @ 36
    if(value > 30) return "C"// @ 31
    if(value > 25) return "C-"// @ 26
    if(value > 20) return "D+" // @ 21
    if(value > 15) return "D" // @ 16
    if(value > 10) return "D-" // @ 11
    if(value > 5) return "E+" // @ 6
    return "E"
//5 points to increase cap by 1
/var/miss_color = "#999999"
/var/hit_color = "#FFFFFF"

/var/tmp/attack_timer = 0

/mob/verb/Attack()
	set category = "Combat"

	if(world.realtime < attack_timer)
		return

	attack_timer = world.realtime + 10

	for(var/mob/m in get_step(src, dir))
		flick("Attack", src)
		break
		//if(prob(2)) m.surrender()


////////////////////////////////////
//////////////Avainer 10/1/2017/////
////////////////////////////////////

mob
	var
		healthpoints_current = 25

		stamina_current = 10

		chakra_current = 10

		calories_current = 0

		swarms_current = 0


	verb
		Restore_Chakra()
			set category = "Combat"

			var/mob/controlMob = src
			if(controlMob.MindTransfer) controlMob=controlMob.MindTransfer
			var/d
			var/c = input(src,"What would you like to restore your chakra by?","Your current chakra: [(chakra_current / get_chakra() ) *100]%") in list("Cancel","E","D","C","B","A","S","Full")
			switch(c)
				if("Cancel")
					return
				if("E")
					d = 1
				if("D")
					d = 3
				if("C")
					d = 6
				if("B")
					d = 14
				if("A")
					d = 34
				if("S")
					d = 70

				if("Full")
					d = get_chakra()

			chakra_current += d
			if(chakra_current >= get_chakra())
				chakra_current = get_chakra()

			if(character_box)
				character_box.update_bars(src)
			for(var/mob/M in hearers(16,controlMob))
				if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) continue
				if(M.MindAfflicted)
					M.MindAfflicted << output("<i>[M.MindAfflicted.getStrangerName(src)] increases their chakra by [c].</i>", "outputall.output")
				else M << output("<i>[M.getStrangerName(src)] increases their chakra by [c].</i>", "outputall.output")

				M.ChatLog("<font color=red>*[src.name] ([src.strangerName]-[src.key]) increases their chakra by [c] - [chakra_current] / [get_chakra()].")

		Drain_Chakra()
			set category = "Combat"

			var/critical
			var/mob/controlMob = src
			if(controlMob.MindTransfer) controlMob=controlMob.MindTransfer
			var/d
			var/c = input(src,"What would you like to deduct your chakra by?","Your current chakra: [(chakra_current / get_chakra() ) *100]%") in list("Cancel","E","D","C","B","A","S")
			switch(c)
				if("Cancel")
					return
				if("E")
					d = 1
				if("D")
					d = 3
				if("C")
					d = 6
				if("B")
					d = 14
				if("A")
					d = 34
				if("S")
					d = 70

			if(HasPerk("Mastery of Body"))
				d -= d/6

			if(HasPerk("Perfect Control"))
				d -= d/3

			if(chakra_current - d < 0)
				alert("You do not have enough chakra to perform this action.")
				return

			var/percentage = ((chakra_current-d)/get_chakra()) * 100
			if(percentage < 20)
				switch(input("Are you sure you want to do this? This will take you to [percentage]% chakra.") in list("No","Yes"))
					if("No")
						return
				critical = 1
			chakra_current -= d
			stamina_current = max(stamina_current - (d/2),0)

			if(character_box)
				character_box.update_bars(src)
			for(var/mob/M in hearers(16,controlMob))
				if(M.MindTransfer)
					if(M == M.MindTransfer.MindAfflicted) continue

				if(M.MindAfflicted)
					M.MindAfflicted << output("<i>[M.MindAfflicted.getStrangerName(src)] reduces their chakra by a cost of [c]. [critical ? "Current: [percentage]%" : ""]</i>", "outputall.output")
				//	if(percentage<20)
					//	M.MindAfflicted << output("<i>[M.MindAfflicted.getStrangerName(src)] is at [percentage]% chakra.</i>", "outputall.output")
				else
					M << output("<i>[M.getStrangerName(src)] reduces their chakra by a cost of [c]. [critical ? "Current: [percentage]%" : ""]</i>", "outputall.output")
				//	if(percentage<20)
					//	M.MindAfflicted << output("<i>[M.MindAfflicted.getStrangerName(src)] is at [percentage]% chakra.</i>", "outputall.output")


				M.ChatLog("<font color=red>*[src.name] ([src.strangerName]-[src.key]) just reduced their chakra by a cost of [c] - [chakra_current] / [get_chakra()]")


		Restore_All()
			set category = "Combat"
			src.stamina_current = get_stamina()
			src.chakra_current = get_chakra()
			var/mob/controlMob = src
			for(var/mob/M in hearers(16,controlMob))
				if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) continue
				if(M.MindAfflicted)
					M.MindAfflicted << output("<i>[M.MindAfflicted.getStrangerName(src)] increases their stamina and chakra to full.</i>", "outputall.output")
				else M << output("<i>[M.getStrangerName(src)] increases their stamina and chakra to full.</i>", "outputall.output")

				M.ChatLog("<font color=red>*[src.name] ([src.strangerName]-[src.key]) increases their stamina and chakra to full.")

		Restore_Stamina()
			set category = "Combat"

			var/mob/controlMob = src
			if(controlMob.MindTransfer) controlMob=controlMob.MindTransfer
			var/d
			var/c = input(src,"What would you like to restore your stamina by?","Your current stamina: [(stamina_current / get_stamina() ) *100]%") in list("Cancel","E","D","C","B","A","S","Full")
			switch(c)
				if("Cancel")
					return
				if("E")
					d = 1
				if("D")
					d = 3
				if("C")
					d = 6
				if("B")
					d = 14
				if("A")
					d = 34
				if("S")
					d = 70

				if("Full")
					d = get_stamina()

			stamina_current += d
			if(stamina_current >= get_stamina())
				stamina_current = get_stamina()

			if(character_box)
				character_box.update_bars(src)
			for(var/mob/M in hearers(16,controlMob))
				if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) continue
				if(M.MindAfflicted)
					M.MindAfflicted << output("<i>[M.MindAfflicted.getStrangerName(src)] increases their stamina by [c].</i>", "outputall.output")
				else M << output("<i>[M.getStrangerName(src)] increases their stamina by [c].</i>", "outputall.output")

				M.ChatLog("<font color=red>*[src.name] ([src.strangerName]-[src.key]) increases their stamina by [c] - [stamina_current] / [get_stamina()].")

		Drain_Stamina()
			set category = "Combat"
			var/mob/controlMob = src
			if(controlMob.MindTransfer) controlMob=controlMob.MindTransfer
			var/d
			var/c = input(src,"What would you like to deduct your stamina by?","Your current stamina: [(stamina_current / get_stamina() ) *100]%") in list("Cancel","E","D","C","B","A","S")
			switch(c)
				if("Cancel")
					return
				if("E")
					d = 1
				if("D")
					d = 3
				if("C")
					d = 6
				if("B")
					d = 14
				if("A")
					d = 34
				if("S")
					d = 70


			if(stamina_current - d < 0)
				alert("You do not have enough stamina to perform this action.")
				return

			var/critical = 0
			var/percentage = ((stamina_current-d) / get_stamina()) * 100
			if(percentage < 20)
				switch(input("Are you sure you want to do this? This will take you to [percentage]% stamina.") in list("No","Yes"))
					if("No")
						return
				critical = 1

			stamina_current -= d
			chakra_current = max(chakra_current - (d/2),0)

			if(stamina_current <= 0)
				stamina_current = 0
			if(character_box)
				character_box.update_bars(src)
			for(var/mob/M in hearers(16,controlMob))
				if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) continue
				if(M.MindAfflicted)
					M.MindAfflicted << output("<i>[M.MindAfflicted.getStrangerName(src)] reduces their stamina by a cost of [c]. [critical ? "Current: [percentage]%" : ""]</i>", "outputall.output")
					//if(percentage<20) M.MindAfflicted << output("<i>[M.MindAfflicted.getStrangerName(src)] is at [percentage]% stamina.</i>", "outputall.output")
				else
					M << output("<i>[M.getStrangerName(src)] reduces their stamina by a cost of [c]. [critical ? "Current: [percentage]%" : ""]</i>", "outputall.output")
				//	if(percentage<20) M.MindAfflicted << output("<i>[M.MindAfflicted.getStrangerName(src)] is at [percentage]% stamina.</i>", "outputall.output")



				M.ChatLog("<font color=red>*[src.name] ([src.strangerName]-[src.key]) just reduced their stamina by a cost of [c] - [stamina_current] / [get_stamina()]")

		Drain_Health()
			set category = "Combat"
			var/mob/controlMob = src
			if(controlMob.MindTransfer) controlMob=controlMob.MindTransfer
			var/d
			var/c = input(src,"What would you like to deduct your stamina by?","Your current stamina: [(healthpoints / maxhealthpoints ) *100]%") in list("Cancel","Petty Damage","Light Damage","Moderate Damage","Heavy Damage","Critical Damage")
			switch(c)
				if("Cancel")
					return
				if("Petty Damage")
					d = 1
				if("Light Damage")
					d = 2
				if("Moderate Damage")
					d = 3
				if("Heavy Damage")
					d = 4
				if("Critical Damage")
					d = 5

			if(healthpoints - d < 0)
				alert("You do not have enough health to perform this action.")
				return

			var/critical = 0
			var/percentage = ((healthpoints-d) / maxhealthpoints) * 100
			if(percentage < 20)
				switch(input("Are you sure you want to do this? This will take you to [percentage]% health.") in list("No","Yes"))
					if("No")
						return
				critical = 1

			healthpoints -= d
			if(healthpoints <= 0)
				healthpoints = 0
			if(character_box)
				character_box.update_bars(src)
			for(var/mob/M in hearers(16,controlMob))
				if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) continue
				if(M.MindAfflicted)
					M.MindAfflicted << output("<i>[M.MindAfflicted.getStrangerName(src)] reduces their health by a cost of [c]. [critical ? "Current: [percentage]%" : ""]</i>", "outputall.output")
					//if(percentage<20) M.MindAfflicted << output("<i>[M.MindAfflicted.getStrangerName(src)] is at [percentage]% health.</i>", "outputall.output")
				else
					M << output("<i>[M.getStrangerName(src)] reduces their health by a cost of [c]. [critical ? "Current: [percentage]%" : ""]</i>", "outputall.output")
				//	if(percentage<20) M.MindAfflicted << output("<i>[M.MindAfflicted.getStrangerName(src)] is at [percentage]% health.</i>", "outputall.output")



				M.ChatLog("<font color=red>*[src.name] ([src.strangerName]-[src.key]) just reduced their health by a cost of [c] - [healthpoints] / [maxhealthpoints]")

		Restore_Health()
			set category = "Combat"

			var/mob/controlMob = src
			if(controlMob.MindTransfer) controlMob=controlMob.MindTransfer
			var/d
			var/c = input(src,"What would you like to restore your health by?","Your current health: [(healthpoints / maxhealthpoints ) *100]%") in list("Cancel","Full","Petty Damage","Light Damage","Moderate Damage","Heavy Damage","Critical Damage")
			switch(c)
				if("Cancel")
					return
				if("Petty Damage")
					d = (maxhealthpoints * 0.166)
				if("Light Damage")
					d = (maxhealthpoints * 0.33)
				if("Moderate Damage")
					d = (maxhealthpoints * 0.50)
				if("Heavy Damage")
					d = (maxhealthpoints * 0.66)
				if("Critical Damage")
					d = (maxhealthpoints * 0.83)
				if("Full")
					d = maxhealthpoints

			healthpoints += d
			if(healthpoints >= maxhealthpoints)
				healthpoints = maxhealthpoints

			if(character_box)
				character_box.update_bars(src)
			for(var/mob/M in hearers(16,controlMob))
				if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) continue
				if(M.MindAfflicted)
					M.MindAfflicted << output("<i>[M.MindAfflicted.getStrangerName(src)] increases their health by [c].</i>", "outputall.output")
				else M << output("<i>[M.getStrangerName(src)] increases their health by [c].</i>", "outputall.output")

				M.ChatLog("<font color=red>*[src.name] ([src.strangerName]-[src.key]) increases their health by [c] - [healthpoints] / [maxhealthpoints].")

		chakra()
			set category = "Combat"
			var/mob/controlMob = usr
			if(controlMob.MindTransfer) controlMob=controlMob.MindTransfer
			var/c = get_grade_stat( min(src.control,src.stamina + stamina_boost())  + chakra_boost_pool() )
			for(var/mob/M in hearers(16,controlMob))
				if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) continue
				if(M.MindAfflicted)

					M.MindAfflicted << output("<i>[M.MindAfflicted.getStrangerName(src)] - Chakra: [c]</i>", "outputall.output")
				else M << output("<i>[M.getStrangerName(src)] - Chakra: [c]</i>", "outputall.output")

		/*restore_calories()
			set category = "Combat"
			if(src.Clan != "Akimichi")
				alert("This is only available to the Akimichi clan.")
				return
			var/mob/controlMob = src
			if(controlMob.MindTransfer) controlMob=controlMob.MindTransfer
			var/d
			var/c = input(src,"What would you like to restore your calories by?","Your current calories: [(calories_current / get_calories() ) *100]%") in list("Cancel","D","C","B","A","S","Full")
			switch(c)
				if("Cancel")
					return
				if("E-")
					d = 1
				if("E")
					d = 1.5
				if("E+")
					d = 2
				if("D-")
					d = 2.5
				if("D")
					d = 3
				if("D+")
					d = 3.5
				if("C-")
					d = 4
				if("C")
					d = 5
				if("C+")
					d = 7
				if("B-")
					d = 9
				if("B")
					d = 12
				if("B+")
					d = 15
				if("A-")
					d = 22
				if("A")
					d = 34
				if("A+")
					d = 40
				if("S-")
					d = 46
				if("S")
					d = 70
				if("S+")
					d = 85

				if("Full")
					d = get_calories()

			calories_current += d
			if(calories_current >= get_calories())
				calories_current = get_calories()

			if(character_box)
				character_box.update_bars(src)
			for(var/mob/M in hearers(16,controlMob))
				if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) continue
				if(M.MindAfflicted)
					M.MindAfflicted << output("<i>[M.MindAfflicted.getStrangerName(src)] increases their calories by [c].</i>", "outputall.output")
				else M << output("<i>[M.getStrangerName(src)] increases their calories by [c].</i>", "outputall.output")

				M.ChatLog("<font color=red>*[src.name] ([src.strangerName]-[src.key]) increases their calories by [c] - [calories_current] / [get_calories()].")

		deduct_calories()
			set category = "Combat"
			if(src.Clan != "Akimichi")
				alert("This is only available to the Akimichi clan.")
				return
			var/mob/controlMob = src
			if(controlMob.MindTransfer) controlMob=controlMob.MindTransfer
			var/d
			var/c = input(src,"What would you like to deduct your calories by?","Your current calories: [(calories_current / get_calories() ) *100]%") in list("Cancel","D","C","B","A","S")
			switch(c)
				if("Cancel")
					return
				if("E-")
					d = 1
				if("E")
					d = 1.5
				if("E+")
					d = 2
				if("D-")
					d = 2.5
				if("D")
					d = 3
				if("D+")
					d = 3.5
				if("C-")
					d = 4
				if("C")
					d = 5
				if("C+")
					d = 7
				if("B-")
					d = 9
				if("B")
					d = 12
				if("B+")
					d = 15
				if("A-")
					d = 22
				if("A")
					d = 34
				if("A+")
					d = 40
				if("S-")
					d = 46
				if("S")
					d = 70
				if("S+")
					d = 85

			if(calories_current - d < 0)
				alert("You do not have enough calories to perform this action.")
				return

			var/critical = 0
			var/percentage = ((calories_current-d) / get_calories()) * 100
			if(percentage < 20)
				switch(input("Are you sure you want to do this? This will take you to [percentage]% calories.") in list("No","Yes"))
					if("No")
						return
				critical = 1

			calories_current -= d
			if(calories_current <= 0)
				calories_current = 0
			if(character_box)
				character_box.update_bars(src)
			for(var/mob/M in hearers(16,controlMob))
				if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) continue
				if(M.MindAfflicted)
					M.MindAfflicted << output("<i>[M.MindAfflicted.getStrangerName(src)] reduces their calories by a cost of [c]. [critical ? "Current: [percentage]%" : ""]</i>", "outputall.output")
					//if(percentage<20) M.MindAfflicted << output("<i>[M.MindAfflicted.getStrangerName(src)] is at [percentage]% calories.</i>", "outputall.output")
				else
					M << output("<i>[M.getStrangerName(src)] reduces their calories by a cost of [c]. [critical ? "Current: [percentage]%" : ""]</i>", "outputall.output")
				//	if(percentage<20) M.MindAfflicted << output("<i>[M.MindAfflicted.getStrangerName(src)] is at [percentage]% calories.</i>", "outputall.output")

				M.ChatLog("<font color=red>*[src.name] ([src.strangerName]-[src.key]) just reduced their calories by a cost of [c] - [calories_current] / [get_calories()]")


		restore_swarms()
			set category = "Combat"
			if(src.Clan != "Aburame")
				alert("This is only available to the Aburame clan.")
				return
			var/mob/controlMob = src
			if(controlMob.MindTransfer) controlMob=controlMob.MindTransfer
			var/d
			var/c = input(src,"What would you like to restore your swarms by?","Your current swarms: [(swarms_current / get_swarms() ) *100]%") in list("Cancel","D","C","B","A","Full")
			switch(c)
				if("Cancel")
					return
				if("E-")
					d = 1
				if("E")
					d = 1.5
				if("E+")
					d = 2
				if("D-")
					d = 2.5
				if("D")
					d = 3
				if("D+")
					d = 3.5
				if("C-")
					d = 4
				if("C")
					d = 5
				if("C+")
					d = 7
				if("B-")
					d = 9
				if("B")
					d = 12
				if("B+")
					d = 15
				if("A-")
					d = 22
				if("A")
					d = 34
				if("A+")
					d = 40
				if("S-")
					d = 46
				if("S")
					d = 70
				if("S+")
					d = 85


				if("Full")
					d = get_swarms()

			swarms_current += d
			if(swarms_current >= get_swarms())
				swarms_current = get_swarms()

			if(character_box)
				character_box.update_bars(src)
			for(var/mob/M in hearers(16,controlMob))
				if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) continue
				if(M.MindAfflicted)
					M.MindAfflicted << output("<i>[M.MindAfflicted.getStrangerName(src)] increases their swarms by [c].</i>", "outputall.output")
				else M << output("<i>[M.getStrangerName(src)] increases their swarms by [c].</i>", "outputall.output")

				M.ChatLog("<font color=red>*[src.name] ([src.strangerName]-[src.key]) increases their swarms by [c] - [swarms_current] / [get_swarms()].")

		deduct_swarms()
			set category = "Combat"
			if(src.Clan != "Aburame")
				alert("This is only available to the Aburame clan.")
				return
			var/mob/controlMob = src
			if(controlMob.MindTransfer) controlMob=controlMob.MindTransfer
			var/d
			var/c = input(src,"What would you like to deduct your swarms by?","Your current swarms: [(swarms_current / get_swarms() ) *100]%") in list("Cancel","D","C","B","A")
			switch(c)
				if("Cancel")
					return
				if("E-")
					d = 1
				if("E")
					d = 1.5
				if("E+")
					d = 2
				if("D-")
					d = 2.5
				if("D")
					d = 3
				if("D+")
					d = 3.5
				if("C-")
					d = 4
				if("C")
					d = 5
				if("C+")
					d = 7
				if("B-")
					d = 9
				if("B")
					d = 12
				if("B+")
					d = 15
				if("A-")
					d = 22
				if("A")
					d = 34
				if("A+")
					d = 40
				if("S-")
					d = 46
				if("S")
					d = 70
				if("S+")
					d = 85


			if(swarms_current - d < 0)
				alert("You do not have enough swarms to perform this action.")
				return

			var/critical = 0
			var/percentage = ((swarms_current-d) / get_swarms()) * 100
			if(percentage < 20)
				switch(input("Are you sure you want to do this? This will take you to [percentage]% swarms.") in list("No","Yes"))
					if("No")
						return
				critical = 1

			swarms_current -= d
			if(swarms_current <= 0)
				swarms_current = 0
			if(character_box)
				character_box.update_bars(src)
			for(var/mob/M in hearers(16,controlMob))
				if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) continue
				if(M.MindAfflicted)
					M.MindAfflicted << output("<i>[M.MindAfflicted.getStrangerName(src)] reduces their swarms by a cost of [c]. [critical ? "Current: [percentage]%" : ""]</i>", "outputall.output")
					//if(percentage<20) M.MindAfflicted << output("<i>[M.MindAfflicted.getStrangerName(src)] is at [percentage]% swarms.</i>", "outputall.output")
				else
					M << output("<i>[M.getStrangerName(src)] reduces their swarms by a cost of [c]. [critical ? "Current: [percentage]%" : ""]</i>", "outputall.output")
				//	if(percentage<20) M.MindAfflicted << output("<i>[M.MindAfflicted.getStrangerName(src)] is at [percentage]% swarms.</i>", "outputall.output")

				M.ChatLog("<font color=red>*[src.name] ([src.strangerName]-[src.key]) just reduced their swarms by a cost of [c] - [swarms_current] / [get_swarms()]")
*/

	proc
		get_chakra()
			var/c = get_grade_stat( min(src.control,src.stamina + stamina_boost())  + chakra_boost_pool() )
			switch(c)
				if("E")
					return 3
				if("E+")
					return 5
				if("D-")
					return 9
				if("D")
					return 12
				if("D+")
					return 15
				if("C-")
					return 18
				if("C")
					return 24
				if("C+")
					return 30
				if("B-")
					return 44
				if("B")
					return 58
				if("B+")
					return 71
				if("A-")
					return 104
				if("A")
					return 118
				if("A+")
					return 162
				if("S-")
					return 200
				if("S")
					return 235
				if("S+")
					return 260

		get_stamina()
			var/c = get_grade_stat(stamina+stamina_boost_pool(),1)
			switch(c)
				if("E")
					return 3
				if("E+")
					return 5
				if("D-")
					return 9
				if("D")
					return 12
				if("D+")
					return 15
				if("C-")
					return 18
				if("C")
					return 24
				if("C+")
					return 30
				if("B-")
					return 44
				if("B")
					return 58
				if("B+")
					return 71
				if("A-")
					return 104
				if("A")
					return 118
				if("A+")
					return 162
				if("S-")
					return 200
				if("S")
					return 235
				if("S+")
					return 260
/*
		maxhealthpoints
			var/c = get_grade_stat(endurance+health_boost_pool(),1)
			switch(c)
				if("E")
					return 25
				if("E+")
					return 30
				if("D-")
					return 35
				if("D")
					return 45
				if("D+")
					return 55
				if("C-")
					return 65
				if("C")
					return 80
				if("C+")
					return 95
				if("B-")
					return 110
				if("B")
					return 130
				if("B+")
					return 150
				if("A-")
					return 170
				if("A")
					return 200
				if("A+")
					return 220
				if("S-")
					return 240
				if("S")
					return 260
				if("S+")
					return 280
*/
		/*get_calories()
			var/c = get_grade_stat((stamina+stamina_boost_pool()-15)+calories_boost_pool(),1)
			switch(c)
				if("E")
					return 3
				if("E+")
					return 5
				if("D-")
					return 9
				if("D")
					return 15
				if("D+")
					return 18
				if("C-")
					return 20
				if("C")
					return 25
				if("C+")
					return 30
				if("B-")
					return 44
				if("B")
					return 58
				if("B+")
					return 71
				if("A-")
					return 104
				if("A")
					return 118
				if("A+")
					return 162
				if("S-")
					return 180
				if("S")
					return 210
				if("S+")
					return 280
		get_swarms()
			var/c = get_grade_stat((src.control + src.stamina)/2+chakra_boost_pool()) // chakra + swarm boost
			switch(c)
				if("E")
					return 1 + swarms_boost_pool()
				if("E+")
					return 2 + swarms_boost_pool()
				if("D-")
					return 3 + swarms_boost_pool()
				if("D")
					return 4 + swarms_boost_pool()
				if("D+")
					return 6 + swarms_boost_pool()
				if("C-")
					return 7 + swarms_boost_pool()
				if("C")
					return 8 + swarms_boost_pool()
				if("C+")
					return 10 + swarms_boost_pool()
				if("B-")
					return 12 + swarms_boost_pool()
				if("B")
					return 14 + swarms_boost_pool()
				if("B+")
					return 16 + swarms_boost_pool()
				if("A-")
					return 20 + swarms_boost_pool()
				if("A")
					return 22 + swarms_boost_pool()
				if("A+")
					return 26 + swarms_boost_pool()
				if("S-")
					return 30 + swarms_boost_pool()
				if("S")
					return 30 + swarms_boost_pool()
				if("S+")
					return 30 + swarms_boost_pool()*/
/*
Swarms
Swarm Costs per Jutsu
D = 1
C = 2
B = 6
A = 10

Max Swarms @ Chakra
D = 4
C = 8
B = 14
A = 22(edited)
*/