/world/New()
	..()
	spawn(seconds(10)) mission_loop()

/archive/var/active_missions[] = list()
/archive/var/mission_rewards[] = list()

/mob/var/list/missions_completed = list("D"=0,"C"=0,"B"=0,"A"=0,"S"=0)
/mob/var/last_mission = list("D"=0,"C"=0)
/mob/var/mission_cooldown = list("D"=0,"C"=0)

/var/automated_missions_enabled = TRUE

proc/mission_loop()
	for(var/mission/mission in archive.active_missions)
		mission.countdown()

	spawn(seconds(75)) mission_loop()


mission
	parent_type = /datum

	var
		name
		class
		location
		reward
		status
		failure_cooldown
		success_cooldown
		mission_client
		description
		time_remaining = 45
		message
		squad/squad
		complete = FALSE
		mission_spot/mission_spot
		engaged_timer = 0
		engaged_threshold = 20

	New()
		..()
		mission_client = pick("Tada, Haruko",
							  "Juba, Mari",
							  "Higuchi, Aika",
							  "Oda, Sakiko",
							  "Otani, Suzume",
							  "Kudo, Izumi",
							  "Araya, Minako",
							  "Tsuji, Atsushi",
							  "Paidful, Hanazawa",
							  "Senju, Aimi",
							  "Paidful, Muon",
							  "Harada, Moriko",
							  "Shima, Hideko",
							  "Muramoto, Kyo",
							  "Chiba, Mari",
							  "Uyehara, Momoe")

	proc/countdown()
	proc/make_description()


mission_reward
	parent_type = /datum

	var
		rank
		name
		key
		amount


mission_giver
	parent_type = /mob
	icon = 'Base_Pale.dmi'
	name = "Mission Handler"

	New()
		..()
		spawn(5) src.AddHair()
		spawn(5) src.AddOverlays()

	Click()
		if(get_dist(src,usr)>2) return
		if(usr.claim_rewards()) return
		if(!automated_missions_enabled)
			usr << output("There are no missions available at this time.","outputall.output")
			return
		if(!usr.squad)
			usr << output("You must be in a squad to take a mission.","outputall.output")
			return
		if(archive.squads[usr.squad].mission)
			usr << output("You already have a mission, complete it first.","outputall.output")
			return
		if(archive.squads[usr.squad].leader != usr.name)
			usr << output("Only the squad leader can accept a mission.","outputall.output")
			return

		var/answer = input("Do you want to accept a mission?") in list("D-Rank","C-Rank","Cancel")
		switch(answer)
			if("C-Rank")
				for(var/mob/m in archive.squads[usr.squad].online_members)
					if(world.realtime - m.last_mission["C"] < m.mission_cooldown["C"])
						var/cooldown_remaining = (m.last_mission["C"] + m.mission_cooldown["C"]) - world.realtime
						usr << output("Your squad cannot take another C-rank mission for [round( (cooldown_remaining)/hours(1) ) + 1] hour(s).","outputall.output")
						return

				var/choice = input("Which mission do you want to go on?") in list("Delivery","Mining","Cancel")
				switch(choice)
					if("Delivery")
						var/delivery/new_mission = new(usr)
						if(new_mission.mission_spot)
							new_mission.give_package(usr)
							archive.squads[usr.squad].mission = new_mission
							archive.active_missions += new_mission
							usr.view_mission()
						else
							usr << output("There are no delivery missions available right now.","outputall.output")

					if("Mining")
						var/mining/new_mission = new(usr)
						archive.squads[usr.squad].mission = new_mission
						archive.active_missions += new_mission
						usr.view_mission()

					if("Cancel")
						return

			if("D-Rank")

				for(var/mob/m in archive.squads[usr.squad].online_members)
					if(world.realtime - m.last_mission["D"] < m.mission_cooldown["D"])
						var/cooldown_remaining = (m.last_mission["D"] + m.mission_cooldown["D"]) - world.realtime
						usr << output("Your squad cannot take another D-rank mission for [round( (cooldown_remaining)/hours(1) ) + 1] hour(s).","outputall.output")
						return

				var/choice = input("Which mission do you want ot go on?") in list("Fishing","Woodcutting","Cancel")
				switch(choice)
					if("Woodcutting")
						var/woodcutting/new_mission = new(usr)
						archive.squads[usr.squad].mission = new_mission
						archive.active_missions += new_mission
						usr.view_mission()

					if("Fishing")
						var/fishing/new_mission = new(usr)
						archive.squads[usr.squad].mission = new_mission
						archive.active_missions += new_mission
						usr.view_mission()

					if("Cancel")
						return

			if("Cancel")
				return


///debug tools////
mob/Admin3/verb/reset_mission_cooldown(mob/m)
	set category = "Admin"
	m.mission_cooldown["D"] = 0
	m.last_mission["D"] = 0
	m.mission_cooldown["C"] = 0
	m.last_mission["C"] = 0

mob/var/mission_reset_check = 0

mob/proc/reset_mision_check()
	if(mission_reset_check < 2)
		mission_cooldown = list("D"=0,"C"=0)
		last_mission = list("D"=0,"C"=0)
		src << "Your mission cooldowns have been reset."
	mission_reset_check = 2

mob/Admin6/verb/reset_mission_post()
	set category = "Admin6"
	for(var/i in possible_locations)
		possible_locations[i] = list("villages"=list(),"squads"=0)

mob/Admin6/verb/view_mission_post_squads()
	set category = "Admin6"
	for(var/i in possible_locations)
		var/status = isnum(possible_locations[i]["squads"]) ? "[possible_locations[i]["squads"]]/2" : "[possible_locations[i]["squads"]]"
		usr << "[i]'s status: [status]"

mob/Admin6/verb/view_mission_post_villages()
	set category = "Admin6"
	for(var/i in possible_locations)
		for(var/k in possible_locations[i]["villages"])
			usr << "[i]'s village:[k]"

mob/Admin6/verb/reset_rewards()
	set category = "Admin6"
	archive.mission_rewards = list()

mob/Admin6/verb/delete_bugged_mission_posts()
	set category = "Admin6"
	for(var/mission_spot/m in world)
		if(m.loc)
			continue
		else
			del(m)

mob/Admin6/verb/observe_mission_post()
	set category = "Admin6"

	var/mission_spots[] = list()
	for(var/mission_spot/m in world)
		mission_spots+=m
	var/mission_spot/M = input("Which mission spot?") in mission_spots
	usr.client.perspective=EYE_PERSPECTIVE
	usr.client.eye=M
	if(usr.master_plane) master_plane.loc=M
	if(usr.darkness) darkness.loc = M
	if(M==usr)
		usr.client.perspective=EYE_PERSPECTIVE
		usr.client.eye=usr
		if(usr.master_plane) usr.master_plane.loc=usr
		if(usr.darkness) usr.darkness.loc = usr

mob/Admin6/verb/jump_to_mission_post()
	var/mission_spots[] = list()
	for(var/mission_spot/m in world)
		mission_spots+=m
	var/mission_spot/M = input("Which mission spot?") in mission_spots
	usr.loc = M.loc

mob/Admin6/verb/toggle_automated_missions()
	if(automated_missions_enabled)
		automated_missions_enabled = 0
		usr << "automated missions have been turned off."
	else
		automated_missions_enabled = 1
		usr << "automated missions have been turned on."

//////////////////////////////


mob/proc/claim_rewards()
	var/reward_claimed = FALSE

	for(var/mission_reward/reward in archive.mission_rewards)
		if(name == reward.name && key == reward.key)
			missions_completed[reward.rank]++
			usr << output("You have been rewarded [reward.amount] ryo for mission completion.","outputall.output")
			give_ryo(reward.amount)
			archive.mission_rewards -= reward
			reward_claimed = TRUE

	return reward_claimed



mob/verb/view_mission()
	set hidden = 1

	var/mission/mission = archive.squads[squad].mission

	if(mission)

		winset(usr,"missionoutput","is-visible=true")
		winset(src,"mainscreen.childtabpanes", "right=missionoutput")
		winset(usr,"missionoutput.missiontop","cells=0x0")

		usr << output("<font color=#DDBE0D>Name", "missionoutput.missiontop:1,1")
		usr << output("<font color=#DDBE0D>Rank", "missionoutput.missiontop:1,2")
		usr << output("<font color=#DDBE0D>Client", "missionoutput.missiontop:1,3")
		usr << output("<font color=#DDBE0D>Reward", "missionoutput.missiontop:1,4")

		usr << output("[mission.name]", "missionoutput.missiontop:2,1")
		usr << output("[mission.class]", "missionoutput.missiontop:2,2")
		usr << output("[mission.mission_client]", "missionoutput.missiontop:2,3")
		usr << output("[mission.reward] ryo", "missionoutput.missiontop:2,4")

		usr << browse(mission.description,"window=missionoutput.missionbot")

	else
		winset(usr,"missionoutput","is-visible=true")
		winset(src,"mainscreen.childtabpanes", "right=missionoutput")
		winset(usr,"missionoutput.missiontop","cells=0x0")

		usr << browse("<html><body bgcolor='#0B0F12'></body></html>","window=missionoutput.missionbot")

mob/verb/abandon_mission()
	set hidden = 1

	var/mission/mission = archive.squads[squad].mission

	if(mission)
		archive.squads[squad].mission = null
		archive.active_missions -= mission

		for(var/mob/m in archive.squads[squad].online_members)
			m << output("Your squad has abandoned their mission!","outputall.output")
			m.last_mission[mission.class] = world.realtime
			m.mission_cooldown[mission.class] = hours(mission.failure_cooldown)
			m.view_mission()

		if(mission.status == "Victory")
			possible_locations[mission.mission_spot.name] = list("villages"=list(),"squads"=0)
		else
			possible_locations[mission.mission_spot.name]["villages"].Remove(archive.squads[squad].village)
			--possible_locations[mission.mission_spot.name]["squads"]








