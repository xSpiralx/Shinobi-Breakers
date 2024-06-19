
fishing
	parent_type = /mission
	name = "Fishing Mission"
	class = "D"
	success_cooldown = 2
	failure_cooldown = 4

	var
		starting_fish = 0
		fish_needed

	New(mob/leader)
		..()

		reward = rand(100,115)
		fish_needed = rand(8,12)

		message = "Head to the nearest lake and collect enough fish."

		squad = archive.squads[leader.squad]
		calc_starting_fish()
		make_description()

	proc/calc_starting_fish()
		for(var/mob/m in squad.online_members)
			for(var/obj/items/Food/Small_Fish/Small in m.contents)
				++starting_fish

	countdown()

		var/total_collected = 0
		for(var/mob/m in squad.online_members)
			for(var/obj/items/Food/Small_Fish/Small in m.contents)
				++total_collected

		if(total_collected - starting_fish >= fish_needed)
			squad.mission = null
			for(var/mob/m in squad.online_members)
				m.view_mission()
				m << output("Your squad has successfully completed its mission! ","outputall.output")
				m.mission_cooldown["D"] = hours(success_cooldown)
				m.last_mission["D"] = world.realtime

				if(fish_needed > 0)
					for(var/obj/items/Food/Small_Fish/Small in m.contents)
						--fish_needed
						del(Small)

			for(var/member in squad.members)
				var/mission_reward/reward = new
				reward.name = member
				reward.key = squad.members[member]
				reward.rank = class
				reward.amount = src.reward

				archive.mission_rewards += reward

			archive.active_missions -= src


	make_description()
		description = {"
					<html><body bgcolor='#0B0F12'><font color='#F8F8F8'><center>
					<img src='https://cdn.discordapp.com/attachments/1124423389055045684/1125427856114188430/DPdngvvUEAExr3h.png' size=150, width=150>
					<br><br><font size=2>
					A recent storm has led to food shortages throughout the village. Assist by collecting <b>[fish_needed]</b> fish from the nearest lake and return to the village.
					  "}









