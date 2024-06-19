
searching
	parent_type = /mission
	name = "Searching Mission"
	class = "C"
	success_cooldown = 4
	failure_cooldown = 8


	var
		list/locations[] = list(""
							    ""
							    ""
							    ""
							    ""
								""
								""
								)

		hiding_spot = ""
		var/mob/victim/victim

	New(mob/leader)
		..()

		reward = rand(215,325)
		hiding_spot = pick(locations)

		message = "[time_remaining] until the trail is gone."
		squad = archive.squads[leader.squad]
		make_description()


	countdown()

		if(--time_remaining < 0)
			squad.mission = null
			for(var/mob/m in squad.online_members)
				m << output("Your squad has failed to complete its mission. [squad.mission.mission_client]","outputall.output")
				m.mission_cooldown = hours(failure_cooldown)
				m.last_mission = world.realtime
				m.view_mission()

			if(victim)
				victim.loc = null

			archive.active_missions -= src



	make_description()
		description = {"
					<html><body bgcolor='#0B0F12'><font color='#F8F8F8'><center>
					<img src='https://cdn.discordapp.com/attachments/1124423389055045684/1124865697990840380/latest.png' size=150, width=150>
					<br><br><font size=2>
					A member of the village has gone missing, however this note was left behind. Find him before the trail runs cold.<br><br>
					[locations[hiding_spot]]
					  "}

	proc/kidnap_victim()
		var/mob/victim = new


kidnapped
	parent_type = /mob
	icon = 'Base_Pale.dmi'

	var
		searching/missions

	New(loc,name,mission)
		..()

		spawn(1) src.AddHair()
		spawn(1) src.AddOverlays()
		src.name = name
		src.missions = mission


	Click()
		if(get_dist(src,usr)>2) return

		missions.squad.mission = null

		if(missions.status == "Victory")
			possible_locations[missions.mission_spot.name] = 0
		else
			--possible_locations[missions.mission_spot.name]

		for(var/mob/m in missions.squad.online_members)
			m.view_mission()
			m << output("Your squad has successfully completed its mission!","outputall.output")
			m.mission_cooldown = hours(missions.success_cooldown)
			m.last_mission = world.realtime

		for(var/member in missions.squad.members)
			var/mission_reward/reward = new
			reward.name = member
			reward.key = missions.squad.members[member]
			reward.rank = missions.class
			reward.amount = missions.reward

			archive.mission_rewards += reward

		loc = null













