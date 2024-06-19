
mission_spot
	parent_type = /obj
	icon = 'mission_post.dmi'
	density = TRUE

	Click()
		usr << output("[name]","outputall.output")

	Tozoku_Crossing
	Whispering_Road
	Shrouded_Swamp_Sanctuary
	Fire_Summit_Outpost
	Rain_Summit_Outpost
	The_Solitary_Oasis
	Takumi_Mines
	Desert_Of_Sorrow
	Ryujin_Fortress
	Great_Onikuma_Bridge
	Land_Of_Rice_Fields

	/*
	Lost_Lake
	Clifftop_Village
	Edge_of_Despair
	Badlands
	Island_Fortress
	Land_of_Suijin
	Cloud_Lake
	Spirit_Deer_Forest
	Great_Wolf_Canyon
	Northern_Wind_Cliffs
	Sky_Lake
	Kukunochi_Forest
	Thunder_Valley
	Great_Sea_of_Uzushiogakure
	The_Painted_Hills
	Ruins_of_Cold_Valley
	Farewell_Bend
	The_Frozen_Marches
	*/


var/list/possible_locations = list("Tozoku Crossing" = list("villages"=list(),"squads"=0),
								   "Whispering Road" = list("villages"=list(),"squads"=0),
								   "Shrouded Swamp Sanctuary" = list("villages"=list(),"squads"=0),
								   "Fire Summit Outpost" = list("villages"=list(),"squads"=0),
								   "Rain Summit Outpost" = list("villages"=list(),"squads"=0),
								   "The Solitary Oasis" = list("villages"=list(),"squads"=0),
								   "Takumi Mines" = list("villages"=list(),"squads"=0),
								   "Desert Of Sorrow" = list("villages"=list(),"squads"=0),
								   "Ryujin Fortress" = list("villages"=list(),"squads"=0),
								   "Great Onikuma Bridge"= list("villages"=list(),"squads"=0),
								   "Land Of Rice Fields" = list("villages"=list(),"squads"=0),
								   "Kukunochi Forest" = list("villages"=list(),"squads"=0),
								   "Thunder Valley" = list("villages"=list(),"squads"=0),
								   "Great Sea of Uzushiogakure" = list("villages"=list(),"squads"=0),
								   "The Painted Hills" = list("villages"=list(),"squads"=0),
								   "Ruins of Cold Valley" = list("villages"=list(),"squads"=0),
								   "Farewell Bend"= list("villages"=list(),"squads"=0),
								   "The Frozen Marches" = list("villages"=list(),"squads"=0))



delivery
	parent_type = /mission
	name = "Delivery Mission"
	class = "C"
	success_cooldown = 5
	failure_cooldown = 3


	New(mob/leader)
		..()

		reward = rand(250,350)
		message = "[time_remaining] minute(s) remaining to get to location."

		squad = archive.squads[leader.squad]

		pick_mission_post()
		make_description()


	var
		secure_radius = 12
		package_recipient/package_recipient
		obj/items/package


	countdown()

		if(--time_remaining < 0)
			squad.mission = null
			for(var/mob/m in squad.online_members)
				m << output("Your squad has failed to complete its mission. [squad.mission.mission_client]","outputall.output")
				m.mission_cooldown["C"] = hours(failure_cooldown)
				m.last_mission["C"] = world.realtime
				m.view_mission()

				for(var/obj/items/i in m.contents)
					if(package == i)
						del(i)

			archive.active_missions -= src

			if(package_recipient)
				package_recipient.loc = null

			if(possible_locations[mission_spot.name]["squads"] != "Locked")
				--possible_locations[mission_spot.name]["squads"]
				possible_locations[mission_spot.name]["villages"].Remove(squad.village)

			if(status == "Victory")
				possible_locations[mission_spot.name]["squads"] = 0
				possible_locations[mission_spot.name]["villages"] = list()

			return

		var/squad_arrived = FALSE
		var/region_unsecure = FALSE

		for(var/mob/m in range(secure_radius,mission_spot))
			if(m.client)
				if(archive.squads[m.squad] == squad)
					squad_arrived = TRUE
				else
					region_unsecure = TRUE

		message = "[time_remaining] minute(s) remaining to get to location."

		if(squad_arrived)
			message = "[time_remaining] minute(s) remaining until arrival."
			time_remaining = min(time_remaining, 20)
			if(region_unsecure)
				message = "Secure the area before the arrival."
				++time_remaining
				if(++engaged_timer > engaged_threshold)
					possible_locations[mission_spot.name]["squads"] = "Locked"
					time_remaining = max(0,--time_remaining)
			else
				if(engaged_timer > engaged_threshold)
					status = "Victory"

				if(time_remaining == 0)
					message = "Hand over the package."
					archive.active_missions -= src
					recipient_arrival()

	proc/recipient_arrival()
		package_recipient = new(null,mission_client,src)
		package_recipient.loc = locate(mission_spot.x-2,mission_spot.y+3,mission_spot.z)
		walk_to(package_recipient,locate(mission_spot.x-2,mission_spot.y,mission_spot.z))

	proc/give_package(mob/leader)
		package = new(leader)
		package.icon = 'delivery_package.dmi'
		package.name = "[mission_client]'s package"

	proc/pick_mission_post()
		var/list/options[] = list()

		for(var/i in possible_locations)
			if(possible_locations[i]["squads"] > 1 || possible_locations[i]["squads"] == "Locked")
				continue
			if(squad.village in possible_locations[i]["villages"])
				continue
			options += i

		if(options.len)
			var/choice = pick(options)

			for(var/mission_spot/m in world)
				if(m.name == choice)
					++possible_locations[choice]["squads"]
					possible_locations[choice]["villages"].Add(squad.village)
					mission_spot = m


	make_description()
		description = {"
					<html><body bgcolor='#0B0F12'><font color='#F8F8F8'><center>
					<img src='https://media.discordapp.net/attachments/858097565010362418/1124352662842912869/64a9618ad457e96919c09614bc0be27f.png?width=1404&height=1060' size=150, width=150>
					<br><br><font size=2>
					Make the delivery before time runs out. Ensure that the area is secure or else the recipient will not arrive. The dropoff location is <b>[mission_spot.name]</b>.
					  "}


package_recipient
	parent_type = /mob
	icon = 'Base_Pale.dmi'

	var
		delivered = FALSE
		delivery/missions

	New(loc,name,mission)
		..()
		spawn(1) src.AddHair()
		spawn(1) src.AddOverlays()
		src.name = name
		src.missions = mission
		spawn(minutes(1)) depart()

	DblClick()

	Click()
		if(get_dist(src,usr)>2) return

		for(var/obj/items/i in usr.contents)
			if(missions.package == i)
				delivered = TRUE
				del(i)

		if(delivered)
			missions.squad.mission = null

			if(missions.status == "Victory")
				possible_locations[missions.mission_spot.name]["squads"] = 0
				possible_locations[missions.mission_spot.name]["villages"] = list()
			else
				--possible_locations[missions.mission_spot.name]["squads"]
				possible_locations[missions.mission_spot.name]["villages"].Remove(missions.squad.village)

			for(var/mob/m in missions.squad.online_members)
				m.view_mission()
				m << output("Your squad has successfully completed its mission!","outputall.output")
				m.mission_cooldown["C"] = hours(missions.success_cooldown)
				m.last_mission["C"] = world.realtime

			for(var/member in missions.squad.members)
				var/mission_reward/reward = new
				reward.name = member
				reward.key = missions.squad.members[member]
				reward.rank = missions.class
				reward.amount = missions.reward

				archive.mission_rewards += reward

			loc = null

	proc/depart()
		if(loc)
			missions.squad.mission = null

			if(missions.status == "Victory")
				possible_locations[missions.mission_spot.name]["squads"] = 0
				possible_locations[missions.mission_spot.name]["villages"] = list()
			else
				--possible_locations[missions.mission_spot.name]["squads"]
				possible_locations[missions.mission_spot.name]["villages"].Remove(missions.squad.village)

			for(var/mob/m in missions.squad.online_members)
				m.view_mission()
				m << output("Your squad has failed to complete the mission","outputall.output")
				m.mission_cooldown["C"] = hours(missions.failure_cooldown)
				m.last_mission["C"] = world.realtime

			loc = null








