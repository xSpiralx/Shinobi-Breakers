
woodcutting
	parent_type = /mission
	name = "Woodcutting Mission"
	class = "D"
	success_cooldown = 2
	failure_cooldown = 4

	var
		starting_lumber = 0
		lumber_needed

	New(mob/leader)
		..()

		reward = rand(100,115)

		lumber_needed = rand(150,175)

		message = "Head to the nearest forest and collect enough lumber."

		squad = archive.squads[leader.squad]
		calc_starting_lumber()
		make_description()

	proc/calc_starting_lumber()
		for(var/mob/m in squad.online_members)
			for(var/obj/items/Wood/lumber in m.contents)
				starting_lumber += lumber.amount

	countdown()

		var/total_collected = 0
		for(var/mob/m in squad.online_members)
			for(var/obj/items/Wood/lumber in m.contents)
				total_collected += lumber.amount

		if(total_collected - starting_lumber >= lumber_needed)
			squad.mission = null
			for(var/mob/m in squad.online_members)
				m.view_mission()
				m << output("Your squad has successfully completed its mission!","outputall.output")
				m.mission_cooldown["D"] = hours(success_cooldown)
				m.last_mission["D"] = world.realtime

				if(lumber_needed > 0)
					for(var/obj/items/Wood/lumber in m.contents)
						var/remaining = lumber.amount - lumber_needed
						lumber_needed -= lumber.amount

						lumber.amount = remaining
						if(lumber.amount <= 0)
							del(lumber)
						else
							lumber.Update()


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
					<img src='https://cdn.discordapp.com/attachments/1124423389055045684/1125416285392621649/sjlcok6taaaa.png' size=150, width=150>
					<br><br><font size=2>
					The village is in need of more lumber for local repairs. Gather <b>[lumber_needed]</b> piles of wood from the nearest forest and return to the village.
					  "}









