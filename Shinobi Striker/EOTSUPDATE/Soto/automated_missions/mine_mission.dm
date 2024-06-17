
mining
	parent_type = /mission
	name = "Mining Mission"
	class = "C"
	success_cooldown = 4
	failure_cooldown = 8

	var
		starting_ore = 0
		ore_needed

	New(mob/leader)
		..()

		reward = rand(175,225)
		ore_needed = rand(450,650)

		message = "Head to the nearest mines and collect enough minerals."

		squad = archive.squads[leader.squad]
		calc_starting_ore()
		make_description()

	proc/calc_starting_ore()
		for(var/mob/m in squad.online_members)
			for(var/obj/items/Bars/minerals in m.contents)
				starting_ore += minerals.amount

	countdown()

		var/total_collected = 0
		for(var/mob/m in squad.online_members)
			for(var/obj/items/Bars/minerals in m.contents)
				total_collected += minerals.amount

		if(total_collected - starting_ore >= ore_needed)
			squad.mission = null
			for(var/mob/m in squad.online_members)
				m.view_mission()
				m << output("Your squad has successfully completed its mission!","outputall.output")
				m.mission_cooldown["C"] = hours(success_cooldown)
				m.last_mission["C"] = world.realtime

				if(ore_needed > 0)
					for(var/obj/items/Bars/minerals in m.contents)
						var/remaining = minerals.amount - ore_needed
						ore_needed -= minerals.amount

						minerals.amount = remaining
						if(minerals.amount <= 0)
							del(minerals)
						else
							minerals.Update()


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
					<img src='https://cdn.discordapp.com/attachments/1124423389055045684/1124850159780642856/latest.png' size=150, width=150>
					<br><br><font size=2>
					The village is demanding higher quotas of minerals for resupplying their forces. Collect <b>[ore_needed]</b> minerals from the nearest mine and return to the village.
					  "}









