/*

*/

/var/regex/comma_expression = new("(\\d)(?=(\\d{3})+$)","g")

#define commafy(x) comma_expression.Replace(num2text(x,12),"$&,")

/archive/var/missions_disabled = 1

/mob/Admin3/verb/Force_Mission_Stalemate(var/mob/o in world)
	set category = "Admin"

	if(o.get_squad())
		if(o.squad.active)

			var/obj/squad/enemy_squad
			for(var/obj/squad/s in archive.squads)
				if(s == o.squad) continue
				if(s.active && s.mission_area == o.squad.mission_area)
					enemy_squad = s; break

			for(var/mob/m in o.squad.get_squad_members())
				if(!m.Dead)
					m.x = m.old_x_loc
					m.y = m.old_y_loc
					m.z = m.old_z_loc

				m.system_message("An Admin has forced the mission into a stalemate.")
				m.verbs -= /mob/proc/Surrender_Mission

			for(var/mob/m in enemy_squad.get_squad_members())
				if(!m.Dead)
					m.x = m.old_x_loc
					m.y = m.old_y_loc
					m.z = m.old_z_loc

				m.system_message("An Admin has forced the mission into a stalemate.")
				m.verbs -= /mob/proc/Surrender_Mission

			o.squad.active = 0
			enemy_squad.active = 0

		else
			system_message("[o] isn't on a mission.")
	else
		system_message("[o] doesn't have a squad.")

/mob/proc/Request_Mission()
	set category = "Squad"

	if(get_squad())

		if(archive.missions_disabled)
			system_message("Missions are disabled at the moment.")
			return

		squad.squad_faction = Village

		if(squad.active)
			system_message("Your squad is already on a mission.")
			return

		if(squad.last_readied + 18000 > world.realtime)
			var/time_remaining = round(((squad.last_readied + 18000 - world.realtime)/10)/60)
			system_message("Your squad has already requested a mission assignment. Please wait [time_remaining] more minute(s) before requesting another.")
			return

		var/list/online_squad_members = squad.get_squad_members()
		if(online_squad_members.len != squad.members.len)
			system_message("All squad members must be online in order to request a mission assignment.")
			return

		for(var/mob/m in squad.get_squad_members())
			if(m.last_mission + 864000 > world.realtime)
				system_message("One of your squad members has already been on a mission in the last 24 hours.")
				return

		var/total_mission_areas = 9

		var/mission_area = 0

		var/list/l = list()
		for(var/i = 1, i < total_mission_areas + 1, i++)
			for(var/obj/squad/o in archive.squads)
				if(o.active && o.mission_area == i)
					continue
				l += i

		if(l.len)
			mission_area = pick(l)
		else
			system_message("All available missions have been taken by other squads. Check again later.")
			return

		var/mission_type = input("Select a mission type") in list("Information Gathering", "Mercenary Assignment")
		if(mission_type == "Mercenary Assignment")
			squad.mission_type = "unsafe"
		else
			squad.mission_type = "safe"

		var/mission_rank = "D-rank"
		if(squad.squad_type == "Genin Squad") mission_rank = "C-rank"
		if(squad.squad_type == "Chunin Squad") mission_rank = "B-rank"
		if(squad.squad_type == "Tokubetsu Jonin Team") mission_rank = "A-rank"
		if(squad.squad_type == "Jonin Team") mission_rank = "S-rank"

		var/a = "a"
		if(mission_rank == "A-rank" || mission_rank == "S-rank") a = "an"

		for(var/obj/squad/s in archive.squads)
			if(s.squad_type == squad.squad_type && s.squad_faction != squad.squad_faction && !s.active) //if compatible

				var/d = 0
				for(var/mob/m in s.get_squad_members())
					if(m.last_mission + 864000 > world.realtime)
						d = 1; break
				if(d) continue


				if(s.last_readied + 18000 > world.realtime && s.mission_type == squad.mission_type) //if ready

					for(var/mob/m in squad.get_squad_members())
						m.system_message("You've been assigned a [mission_rank] mission. Please travel to the objective area.")
						m.last_mission = world.realtime
						m.verbs += /mob/proc/Travel_to_Mission_Area
					for(var/mob/m in s.get_squad_members())
						m.system_message("You've been assigned a [mission_rank] mission. Please travel to the objective area.")
						m.last_mission = world.realtime
						m.verbs += /mob/proc/Travel_to_Mission_Area

					squad.active = 1
					s.active = 1

					squad.mission_area = mission_area
					s.mission_area = mission_area

					squad.mission_team = 1
					s.mission_team = 2

					for(var/mob/m)
						if(m.Admin)
							m << "[squad.members[squad.leader]]'s squad began [a] [mission_rank] [squad.mission_type == "safe" ? "information gathering" : "mercenary assignment"]] mission against [s.members[s.leader]]'s squad."

					return

		system_message("You have requested a mission assignment. For the next 30 minutes, a client may hire your ninja squad for a mission.")
		squad.last_readied = world.realtime

		//for(var/mob/m)
			//if(m.squad != squad)
				//m << "<font size=2>The mission desk announces that a high profile client has commissioned [a] [mission_rank] [squad.mission_type == "safe" ? "information gathering" : "mercenary assignment"] mission.</font>"

/mob/proc/Surrender_Mission()
	set category = "Squad"

	if(get_squad())

		if(!squad.active)
			system_message("Your squad is not currently on a mission.")
			return

		if(key != squad.leader)
			for(var/mob/m in squad.get_squad_members())
				if(m.key == squad.leader)
					if(!m.Dead)
						system_message("You can't give the order to surrender while your leader is still alive and online.")
						return

		var/obj/squad/enemy_squad
		for(var/obj/squad/s in archive.squads)
			if(s == squad) continue
			if(s.active && s.mission_area == squad.mission_area)
				enemy_squad = s; break

		//if can surrender
		if(squad.mission_type == "unsafe")
			var/can_surrender = 0
			for(var/mob/m in squad.get_squad_members())
				if(m.Dead)
					if(squad.squad_type != "Tokubetsu Jonin Team" && squad.squad_type != "Jonin Team")
						can_surrender = 1; break
					else
						if(copytext(get_rank_grade(m), 1, 2) == "A" || copytext(get_rank_grade(m), 1, 2) == "B")
							can_surrender = 1; break
			if(!can_surrender)
				system_message("You don't have a good enough reason to surrender and fail your mission. Either a squad member must die, or if on a team, the Jonin leader must die.")
				return

		for(var/mob/m in squad.get_squad_members())
			if(!m.Dead)
				m.x = m.old_x_loc
				m.y = m.old_y_loc
				m.z = m.old_z_loc

			m.system_message("Your squad leader has given the order to retreat! Your squad abandons the mission and flees the battlefield.")
			m.verbs -= /mob/proc/Surrender_Mission

		for(var/mob/m in enemy_squad.get_squad_members())
			if(!m.Dead)
				m.x = m.old_x_loc
				m.y = m.old_y_loc
				m.z = m.old_z_loc

			m.system_message("The enemy has fled and without opposition your squad is able to complete their mission.")
			m.verbs -= /mob/proc/Surrender_Mission

			if(squad.mission_type == "unsafe")
				m.stat_cap += 15
				m.system_message("Your stat cap has been increased to [get_rank_grade(m)].")
			else
				if(++m.stat_points > m.stat_cap)
					m.stat_points = m.stat_cap
				m.system_message("You've been rewarded 1 point(s) for the mission.")

			if(m.key == enemy_squad.leader)

				var/mission_rank = "D-rank"
				var/mission_ryo = 100

				if(squad.squad_type == "Genin Squad")
					mission_rank = "C-rank"
					mission_ryo = 150
				if(squad.squad_type == "Chunin Squad")
					mission_rank = "B-rank"
					mission_ryo = 200
				if(squad.squad_type == "Tokubetsu Jonin Team")
					mission_rank = "A-rank"
					mission_ryo = 250
				if(squad.squad_type == "Jonin Team")
					mission_rank = "S-rank"
					mission_ryo = 300

				if(squad.mission_type == "unsafe") mission_ryo = mission_ryo * 10


				var/a = "a"
				if(mission_rank == "A-rank" || mission_rank == "S-rank") a = "an"

				m.system_message("For the completion of [a] [mission_rank] [squad.mission_type == "safe" ? "information gathering" : "mercenary assignment"] mission your squad has been paid [commafy(mission_ryo)] ryo.")
				m.missions_complete[copytext(mission_rank, 1, 2)]++

		squad.active = 0
		enemy_squad.active = 0

/mob/proc/Travel_to_Mission_Area()
	set category = "Squad"

	if(get_squad())

		if(z == 30)
			system_message("You have already traveled to the mission area.")
			return

		if(squad.active)
			system_message("Your squad has been sent on a mission and must achieve victory at all cost. Ninja villages choose accomplishing missions over the lives of their comrades, ninja are trained to follow orders even if it means death. Retreat is not an option without good reason.")

			old_x_loc = x
			old_y_loc = y
			old_z_loc = z

			switch(squad.mission_area)
				if(1) loc = locate(50, 5 + (squad.mission_team == 2 ? 90 : 0), 30)
				if(2) loc = locate(150, 5 + (squad.mission_team == 2 ? 90 : 0), 30)
				if(3) loc = locate(250, 5 + (squad.mission_team == 2 ? 90 : 0), 30)

				if(4) loc = locate(50, 105 + (squad.mission_team == 2 ? 90 : 0), 30)
				if(5) loc = locate(150, 105 + (squad.mission_team == 2 ? 90 : 0), 30)
				if(6) loc = locate(250, 105 + (squad.mission_team == 2 ? 90 : 0), 30)

				if(7) loc = locate(50, 205 + (squad.mission_team == 2 ? 90 : 0), 30)
				if(8) loc = locate(150, 205 + (squad.mission_team == 2 ? 90 : 0), 30)
				if(9) loc = locate(250, 205 + (squad.mission_team == 2 ? 90 : 0), 30)

			verbs -= /mob/proc/Travel_to_Mission_Area
			verbs += /mob/proc/Surrender_Mission

		else
			system_message("Your squad is not currently on a mission.")


	//if you've been on a mission, wait

	//if a mission is available for you, go on that mission
	//if not, put in waiting list for 30mins, mission is available

/mob/var/tmp/obj/squad/squad
/mob/var/last_mission = 0

/mob/var/old_x_loc
/mob/var/old_y_loc
/mob/var/old_z_loc

/archive/var/list/squads = list()

/obj/squad
	name = "Undefined Squad"

	var/list/members = list()
	var/leader = null

	var/squad_type = "Genin Squad"
	var/squad_faction

	var/mission_area
	var/mission_type = "safe"
	var/mission_team = 1

	var/last_readied = 0
	var/active = 0

	proc/add_member(var/mob/m)
		members[m.key] = m.name

	proc/get_squad_members()
		var/list/l = list()
		for(var/mob/m)
			if(m.key in members)
				l += m
		return l

	proc/give_verbs(var/mob/m)

		m.verbs += /mob/proc/View_Squad
		m.verbs += /mob/proc/Leave_Squad

		if(active && m.z != 30)
			m.verbs += /mob/proc/Travel_to_Mission_Area

		if(m.key == leader)
			m.verbs += /mob/proc/Invite_to_Squad
			m.verbs += /mob/proc/Boot_from_Squad
			m.verbs += /mob/proc/Set_Squad_Name
			m.verbs += /mob/proc/Request_Mission

		if(active && m.z == 30)
			m.verbs += /mob/proc/Surrender_Mission

		m.verbs -= /mob/verb/Create_Squad

	proc/remove_verbs(var/mob/m)

		m.verbs -= /mob/proc/Invite_to_Squad
		m.verbs -= /mob/proc/View_Squad
		m.verbs -= /mob/proc/Boot_from_Squad
		m.verbs -= /mob/proc/Leave_Squad
		m.verbs -= /mob/proc/Set_Squad_Name
		m.verbs -= /mob/proc/Request_Mission
		m.verbs -= /mob/proc/Travel_to_Mission_Area

		m.verbs += /mob/verb/Create_Squad

/mob/proc/squad_membership_init()
	if(get_squad())
		squad.give_verbs(src)
		if(!squad.active && z == 30)
			x = old_x_loc
			y = old_y_loc
			z = old_z_loc
	else
		if(z == 30)
			x = old_x_loc
			y = old_y_loc
			z = old_z_loc

/mob/proc/get_squad()
	if(squad) return squad
	for(var/obj/squad/f in archive.squads)
		for(var/k in f.members)
			if(key == k)
				squad = f
				return f
	return null

/mob/verb/Create_Squad()

	if(get_squad())
		system_message("You're already in a squad. Leave it first.")
		return

	if(Class == "Academy Student")
		system_message("Academy Students may not participate in missions.")
		return

	if(Class == "Genin" && copytext(get_rank_grade(src), 1, 2) == "C")
		system_message("Your character is elegible for a promotion and is prohibited from participating in missions until promoted as their rank does not accurately reflect their skills.")
		return

	if(Class == "Chunin" && copytext(get_rank_grade(src), 1, 2) == "B")
		system_message("Your character is elegible for a promotion and is prohibited from participating in missions until promoted as their rank does not accurately reflect their skills.")
		return

	if(Class == "Tokubetsu Jonin" && copytext(get_rank_grade(src), 1, 2) == "A")
		system_message("Your character is elegible for a promotion and is prohibited from participating in missions until promoted as their rank does not accurately reflect their skills.")
		return

	if(copytext(get_rank_grade(src), 1, 2) == "S")
		system_message("Your character is elegible only for specialist missions.")
		return



	var/obj/squad/s = new
	s.add_member(src)
	s.leader = key
	s.name = "Team [rand(1, 20)]"

	archive.squads += s

	squad = s
	squad_membership_init()

	switch(copytext(get_rank_grade(src), 1, 2))
		if("A") s.squad_type = "Jonin Team"
		if("B") s.squad_type = "Tokubetsu Jonin Team"
		if("C") s.squad_type = "Chunin Squad"

	system_message("You've created [s.name], classified as a [s.squad_type].")

/mob/proc/Set_Squad_Name()
	set category = "Squad"

	if(get_squad())
		var/n = input("Change squad name to:") as text
		if(!n) return
		squad.name = n

/mob/proc/Invite_to_Squad()
	set category = "Squad"

	if(get_squad())

		if(squad.last_readied + 18000 > world.realtime || squad.active)	return

		var/mob/m = locate() in get_step(src, dir)

		if(!m) return

		if(m.squad && m.squad == squad)
			system_message("[m] is already in your squad.")
			return

		if(m.squad) return

		var/max_members = 3
		if(squad.squad_type == "Tokubetsu Jonin Squad" || squad.squad_type == "Jonin Squad")
			max_members = 4

		if(squad.members.len >= max_members)
			system_message("Your squad is full.")
			return

		if(m.Village != Village)
			system_message("This character is not in your faction.")
			return

		//by grade
		if(squad.squad_type == "Genin Squad" && ( copytext(get_rank_grade(m), 1, 2) != "D" && copytext(get_rank_grade(m), 1, 2) != "E"))
			system_message("Only Genin ranked characters may join Genin squads.")
			return

		if(squad.squad_type == "Chunin Squad" && copytext(get_rank_grade(m), 1, 2) != "C")
			system_message("Only Chunin ranked characters may join Chunin squads.")
			return

		if(squad.squad_type == "Tokubetsu Jonin Team" && ( copytext(get_rank_grade(m), 1, 2) != "D" && copytext(get_rank_grade(m), 1, 2) != "E"))
			system_message("Only Genin may join tokubetsu Jonin teams.")
			return

		if(squad.squad_type == "Jonin Team" && copytext(get_rank_grade(m), 1, 2) != "C")
			system_message("Only Chunin may join Jonin teams.")
			return

		//by rank
		if((faction && key != faction.leader) && Class != "Criminal")
			if(squad.squad_type == "Genin Squad" && m.Class != "Genin")
				system_message("Only Genin ranked characters may join Genin squads.")
				return

			if(squad.squad_type == "Chunin Squad"  && m.Class != "Chunin")
				system_message("Only Chunin ranked characters may join Chunin squads.")
				return

			if(squad.squad_type == "Tokubetsu Jonin Team" && m.Class != "Tokubetsu Jonin")
				system_message("Only Genin may join tokubetsu Jonin teams.")
				return

			if(squad.squad_type == "Jonin Team" && m.Class != "Jonin")
				system_message("Only Chunin may join Jonin teams.")
				return

		if(alert(m, "[src] is inviting you to join [squad.name].", "Squad Invitation", "Accept", "Decline") == "Accept")

			if(m.squad) return

			if(m.Class == "Genin" && copytext(get_rank_grade(m), 1, 2) == "C")
				system_message("This character is elegible for a promotion and is prohibited from participating in missions until promoted as their rank does not accurately reflect their skills.")
				return

			if(m.Class == "Chunin" && copytext(get_rank_grade(m), 1, 2) == "B")
				system_message("This character is elegible for a promotion and is prohibited from participating in missions until promoted as their rank does not accurately reflect their skills.")
				return

			if(m.Class == "Tokubetsu Jonin" && copytext(get_rank_grade(m), 1, 2) == "A")
				system_message("This character is elegible for a promotion and is prohibited from participating in missions until promoted as their rank does not accurately reflect their skills.")
				return

			if(copytext(get_rank_grade(src), 1, 2) == "S")
				system_message("This character is elegible only for specialist missions.")
				return

			if(squad.members.len >= max_members)
				system_message("Your squad is full.")
				return

			squad.add_member(m)
			m.squad = squad

			for(var/mob/o in squad.get_squad_members())
				o.system_message("[m] has joined [squad.name].")

/mob/proc/View_Squad()
	set category = "Squad"

	if(get_squad())

		system_message("Leader")
		system_message(" - [squad.members[squad.leader]]")
		system_message("Squad Members")
		for(var/k in squad.members - squad.leader)
			system_message(" - [squad.members[k]]")
		if(squad.members.len <= 1)
			system_message(" - None")
		system_message("Squad Classification")
		system_message(" - [squad.squad_type]")

/mob/proc/Boot_from_Squad()
	set category = "Squad"

	if(get_squad())

		if(squad.last_readied + 18000 > world.realtime || squad.active)	return

		var/list/l = list()
		for(var/k in squad.members)
			if(k != squad.leader) l += squad.members[k]

		l += "Cancel"

		var/n = input("Select a squad member to boot from the squad") in l

		if(n == "Cancel") return

		var/member
		for(var/k in squad.members)
			if(n == squad.members[k])
				member = k
				break

		if(!member) return

		if(member == squad.leader)
			system_message("Cannot boot the leader.")
			return

		squad.members -= member

		for(var/mob/m)
			if(m.key == member)
				m.squad_membership_init()
				m.squad.remove_verbs(m)
				m.squad = null
				m.system_message("You've been booted from the squad.")

/mob/proc/Leave_Squad()
	set category = "Squad"
	if(get_squad())

		if(squad.last_readied + 18000 > world.realtime || squad.active)	return

		squad.members -= key
		squad.remove_verbs(src)

		if(squad.members.len < 1)
			del(squad)
		else
			if(squad.leader == key)
				squad.leader = pick(squad.get_squad_members())

		squad = null



/mob/var/list/missions_complete = list("D" = 0, "C" = 0, "B" = 0, "A" = 0, "S" = 0)