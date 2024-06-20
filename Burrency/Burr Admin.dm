mob/var/total_stats

mob/Admin2/verb
	Send_To_Spawn(var/mob/M as mob in world)
		set category = "Admin"
		switch(input("Are you sure you want to move [M] to spawn?") in list ("Yes","No"))
			if("No") return
		if(M.Clan == "None" && M.Village == "Clansmen")
			usr<< output("[M] doesn't appear to have a clan make sure they've been approved for one and set their variables properly if so.","outputall.output")
			return
		if(M.Village == "Yukigakure")
			M.loc = locate(114,131,41)
		if(M.Village == "Uzushiogakure")
			M.loc = locate(100,105,1)
		if(M.Village == "Otogakure")
			M.loc = locate(103,130,32)

/*
mob/proc
	Gape_Tasks()
		for(var/task/task in contents)
			del(task)
			*/
mob/Admin6/verb
	View_Total_Stats(var/mob/m as mob in world)
		usr<< output("[m]'s total stats is [m.total_stats() + m.stat_points] out of [m.stat_cap]", "outputall.output")
		return
mob/Admin6/verb/assign_costs(_rank as text,_cost as num)
	for(var/obj/jutsu/o in archive)
		if(o.jutsu_rank=="[_rank]")
			o.ryo_cost = _cost
mob/Admin6/verb/assign_element_to_clan(_element as text,_clan as text)
	for(var/obj/jutsu/o in archive)
		if(findtextEx("[o.name]","[_element]"))
			o.can_purchase |= list("[_clan]")
/mob/proc/get_total_stats()
	return strength + endurance + agility + speed + stamina + control

mob
	proc/request_perm(mob/actor, action, )
		switch(input(src,"Do you give [actor.key], permission to [action]?") in list ("No", "Yes"))
			if("Yes")
				return TRUE
			if("No")
				return FALSE

mob/Admin2
	verb/Ask_See_Inventory(var/mob/m as mob in world)
		var/mob/actor = usr
		if(m == actor.Selected)
			actor.Selected = null
			return
		if(m.request_perm(actor,"see inventory"))
			actor.Selected = m
			SAdmin_Logs+="<br>[usr]([usr.key]) looks in [m]. ([time2text(world.realtime)])"
			public_admin_log("<font color=#F88017>[usr] has looked into [m]'s contents list.")
           ////inventory looking stuff
mob/Admin3
	verb/ViewScrollLog()
		set category = "Admin"
		usr<<browse("<body bgcolor=black><font color=white face=Calibri>[AJutsuScroll_Logs]</font></body>","window=Logs;size=400x400")




/mob/Admin4/verb/Force_View_Inventory(var/mob/m as mob in world)
	set category = "Admin"
	if(m == usr.Selected)
		usr.Selected=null
	else
		usr.Selected=m
		SAdmin_Logs+="<br>[usr]([usr.key]) looks in [m]. ([time2text(world.realtime)])"
		public_admin_log("<font color=#F88017>[usr] has looked into [m]'s contents list.")



mob/proc/HasPerk(perk)
	for(var/obj/jutsu/P in src.contents)
		if(P.name == "[perk]")
			return TRUE
/*  CURRENTLY NOT USED
mob/proc/PerkRankCheck(perk)
	for(var/obj/jutsu/P in archive.contents)
		if(P.rank_req == usr.Class)
			return TRUE
*/
/*/mob/var
    OriginsBonus = 0

/mob/proc/stat_reset()
    // Reset all relevant stats to default values
    strength = 1
    endurance = 1
    agility = 1
    speed = 1
    stamina = 1
    control = 1
    // Update other necessary variables and UI
    if(character_box)
        character_box.update_stats(src)
    src << "Your stats have been reset."

/mob/proc/starting_incentive_system()
    if(OriginsBonus)
        src << "You've already claimed your Starting Incentive."
        return

    if(lifetime_progress_points >= 60)
        src << "You've got too much PP to get your bonus."
        return

    switch(input("By typing 'I Agree' you're agreeing to claim your Starting Incentive and get Stat reset, and will not be able to claim another one on this character if the incentive increases"))
        if("I Agree")
            // Reset stats before applying the incentive
            stat_reset()

            var needed_progress_points = 60 - lifetime_progress_points
            var total_progress_points = progress_points + needed_progress_points
            var total_stat_points = 60 + 15

            // Adjust lifetime_progress_points and progress_points
            lifetime_progress_points = 60
            progress_points = total_progress_points

            // Adjust stat_points
            stat_points = total_stat_points

            // Set the bonus flag and give ryo
            OriginsBonus = 1

            var/obj/items/Ryo/hasryo
            for(var/obj/items/Ryo/R in contents)
                hasryo = R

            if(hasryo)
                hasryo.amount += 3000
                hasryo.Update()
            else
                var/obj/items/Ryo/R = new(src)
                R.amount = 3000
                R.Update()
                src.contents += R

            // Give the player a headband
            new/obj/items/Clothing/Headband(src)


            src << output("You've been rewarded point(s) and received a headband as part of an incentive.", "outputall.output")

            if(character_box)
                character_box.update_stats(src)

            src << "You've successfully claimed your Starting Incentive and received 3000 ryo."

            // Update character stats if there's a character box
            if(character_box)
                character_box.update_stats(src)

        else
            src << "You've selected to not get your Starting Incentive or did not type 'I Agree' exactly as shown."

/mob/verb
    Starting_Incentive()
        set category = "Commands"
        starting_incentive_system()



*/



mob/var/ConfirmedClan = FALSE

mob/verb
	Authenticate_Clan()
		set category="Commands"
		ConfirmedClanPreCheck()
		if(usr.ConfirmedClan == FALSE)
			if(usr.ConfirmedClan == TRUE)
				src << "Your clan has already been Authenticated"
			if(usr.ConfirmedClan == FALSE && (usr.Clan == "Inuzuka"))
				src << "Your clan has been authenticated as [usr.Clan], 4 pp has been removed to cover the costs of your clan perk."
				usr.givePerk("Inuzuka Clan")
				usr.progress_points -= 4
				usr.ConfirmedClan = 1
			if(usr.ConfirmedClan == FALSE && (usr.Clan == "Nara"))
				src << "Your clan has been authenticated as [usr.Clan], 4 pp has been removed to cover the costs of your clan perk."
				usr.givePerk("Nara Clan")
				usr.progress_points -= 4
				usr.ConfirmedClan = 1
			if(usr.ConfirmedClan == FALSE && (usr.Clan == "Hoshigaki"))
				src << "Your clan has been authenticated as [usr.Clan], 4 pp has been removed to cover the costs of your clan perk."
				usr.givePerk("Hoshigaki Clan")
				usr.progress_points -= 4
				usr.ConfirmedClan = 1
			if(usr.ConfirmedClan == FALSE && (usr.Clan == "Hozuki"))
				src << "Your clan has been authenticated as [usr.Clan], 4 pp has been removed to cover the costs of your clan perk."
				usr.givePerk("Hozuki Clan")
				usr.progress_points -= 4
				usr.ConfirmedClan = 1
			if(usr.ConfirmedClan == FALSE && (usr.Clan == "Hyuuga"))
				src << "Your clan has been authenticated as [usr.Clan], 4 pp has been removed to cover the costs of your clan perk."
				usr.givePerk("Hyuuga Clan")
				usr.progress_points -= 4
				usr.ConfirmedClan = 1
			if(usr.ConfirmedClan == FALSE && (usr.Clan == "Nimbus"))
				src << "Your clan has been authenticated as [usr.Clan], 4 pp has been removed to cover the costs of your clan perk."
				usr.givePerk("Nimbus Clan")
				usr.progress_points -= 4
				usr.ConfirmedClan = 1
			if(usr.ConfirmedClan == FALSE && (usr.Clan == "Kaguya"))
				src << "Your clan has been authenticated as [usr.Clan], 4 pp has been removed to cover the costs of your clan perk."
				usr.givePerk("Kaguya Clan")
				usr.progress_points -= 4
				usr.ConfirmedClan = 1
			if(usr.ConfirmedClan == FALSE && (usr.Clan == "Uchiha"))
				src << "Your clan has been authenticated as [usr.Clan], 4 pp has been removed to cover the costs of your clan perk."
				usr.givePerk("Uchiha Clan")
				usr.progress_points -= 4
				usr.ConfirmedClan = 1
			if(usr.ConfirmedClan == FALSE && (usr.Clan == "Uzumaki"))
				src << "Your clan has been authenticated as [usr.Clan], 4 pp has been removed to cover the costs of your clan perk."
				usr.givePerk("Uzuamki Clan")
				usr.progress_points -= 4
				usr.ConfirmedClan = 1
			if(usr.ConfirmedClan == FALSE && (usr.Clan == "Senju"))
				src << "Your clan has been authenticated as [usr.Clan], 4 pp has been removed to cover the costs of your clan perk."
				usr.givePerk("Senju Clan")
				usr.progress_points -= 4
				usr.ConfirmedClan = 1
			if(usr.ConfirmedClan == FALSE && (usr.Clan == "Yuki"))
				src << "Your clan has been authenticated as [usr.Clan], 4 pp has been removed to cover the costs of your clan perk."
				usr.givePerk("Yuki Clan")
				usr.progress_points -= 4
				usr.ConfirmedClan = 1
			if(usr.ConfirmedClan == FALSE && (usr.Clan == "Ukiyo"))
				src << "Your clan has been authenticated as [usr.Clan], 4 pp has been removed to cover the costs of your clan perk."
				usr.givePerk("Ukiyo Clan")
				usr.progress_points -= 4
				usr.ConfirmedClan = 1
		else
			src << "You either already have your clan perk or there was an issue with receiving your bonus."




mob/verb/ConfirmedClanPreCheck()
	set hidden = 1
	var/perks = list("Hoshigaki Clan", "Inuzuka Clan", "Ukiyo Clan", "Uchiha Clan", "Nimbus Clan", "Akimichi Clan", "Aburame Clan", "Hozuki Clan", "Senju Clan", "Yuki Clan", "Uzumaki Clan", "Kaguya Clan", "Hyuuga Clan", "Nara Clan")
	if (usr.ConfirmedClan == 0)
		for(var/perk in perks)
			if(usr.HasPerk(perk))
				usr.ConfirmedClan = 1
				break
/*
mob/verb
	confirmingshit()
		if(usr.HasPerk("Inuzuka Clan") && usr.Clan == "Inuzuka" && usr.ConfirmedClan == FALSE)
			world<< "[usr] has had their clan authenticated"
			usr.ConfirmedClan = TRUE */
mob/Admin2
	verb/SeePlayerInventory(var/mob/m as mob in world)
		var/mob/actor = usr
		if(m.request_perm(actor,"see inventory"))
			usr.Selected=m
			SAdmin_Logs+="<br>[usr]([usr.key]) looks in [m]. ([time2text(world.realtime)])"
			public_admin_log("<font color=#F88017>[usr] has looked into [m]'s contents list.")
           ////inventory looking stuff



mob/Admin6
	verb/View_Roleplay_Spy()
		set category="Admin6"
		if(!Spying)
			winset(usr,"rpspy","is-visible=true")
			SAdmin_Logs+="<br>[usr]([usr.key]) uses toggles roleplay spy on. ([time2text(world.realtime)])"
			Spying=1
			return
		winset(usr,"rpspy","is-visible=false")
		Spying=0

mob/Admin6
	verb
		View_Ryo_Logs()
			set category = "Admin6"
			usr<<browse("<body bgcolor=black><font color=white face=Calibri>[RyoLogs]</font></body>","window=Logs;size=400x400")

mob/Admin3/verb
	Reward(mob/M in world)
		switch(input(usr,"What would you like to reward [M]?") in list ("Ryo","Minerals","Lumber","Perk Points","Cancel"))
			if("Ryo")
				var/hasryo
				var/ryobonus = input("How much ryo would you like to reward them?") as num
				for(var/obj/items/Ryo/R in M.contents)
					hasryo=R
				if(hasryo)
					hasryo:amount+=ryobonus
					hasryo:Update()
				else
					var/obj/items/Ryo/R=new(M)
					R.amount=ryobonus
					R.Update()
				Admin_Logs+="<br>[time2text(world.realtime,"Day DD hh:mm")]: [usr]([usr.key]) has given [ryobonus] ryo to [M]."
				RyoLogs+="<br>[time2text(world.realtime,"Day DD hh:mm")]: [usr]([usr.key]) has given [ryobonus] ryo to [M]."
				for(var/mob/MM in world) if(MM.Admin) MM<< {"<font color=#F88017>[src] gives [ryobonus] ryo to [M]."}
				SaveLogs()
			if("Minerals")
				var/hasmin
				var/minbonus = input("How much minerals would you like to reward them?") as num
				for(var/obj/items/Bars/R in M.contents)
					hasmin=R
				if(hasmin)
					hasmin:amount+=minbonus
					hasmin:Update()
				else
					var/obj/items/Bars/R=new(M)
					R.amount=minbonus
					R.Update()
				Admin_Logs+="<br>[time2text(world.realtime,"Day DD hh:mm")]: [usr]([usr.key]) has given [minbonus] minerals to [M]."
				RyoLogs+="<br>[time2text(world.realtime,"Day DD hh:mm")]: [usr]([usr.key]) has given [minbonus] minerals to [M]."
				for(var/mob/MM in world) if(MM.Admin) MM<< {"<font color=#F88017>[src] gives [minbonus] minerals to [M]."}
				SaveLogs()
			if("Lumber")
				var/haslum
				var/lumbonus = input("How much minerals would you like to reward them?") as num
				for(var/obj/items/Wood/R in M.contents)
					haslum=R
				if(haslum)
					haslum:amount+=lumbonus
					haslum:Update()
				else
					var/obj/items/Wood/R=new(M)
					R.amount=lumbonus
					R.Update()
				Admin_Logs+="<br>[time2text(world.realtime,"Day DD hh:mm")]: [usr]([usr.key]) has given [lumbonus] lumber to [M]."
				RyoLogs+="<br>[time2text(world.realtime,"Day DD hh:mm")]: [usr]([usr.key]) has given [lumbonus] lumber to [M]."
				for(var/mob/MM in world) if(MM.Admin) MM<< {"<font color=#F88017>[src] gives [lumbonus] lumber to [M]."}
				SaveLogs()
			if("Perk Points")
				var/bonus = input("How many stat points would you like to reward them?") as num

				if(M.total_stats() + M.stat_points + bonus >= M.stat_cap)
					if(M.stat_cap - M.total_stats() - M.stat_points > 0)
						message_admins("[usr.key] has given a [M.stat_cap - M.total_stats() - M.stat_points] bonus to [M]([M.key]).")
						M << output("You've been rewarded [M.stat_cap - M.total_stats() - M.stat_points] point(s)", "outputall.ouatput")
						M.progress_points += M.stat_cap - M.total_stats() - M.stat_points
						M.lifetime_progress_points += M.stat_cap - M.total_stats() - M.stat_points
						M.stat_points += M.stat_cap - M.total_stats() - M.stat_points
					else
						usr << "[M] is capped."
						return
				else
					M.progress_points += bonus
					M.lifetime_progress_points += bonus
					M.stat_points += bonus
					M << output("You've been rewarded [bonus] point(s)", "outputall.output")

				if(M.character_box)
					M.character_box.update_stats(M)

				if(src.key!="") Admin_Logs+="<br><font color= #99ffcc><b>[time2text(world.realtime,"Day DD hh:mm")]</b>:</font>[usr]([usr.key]) gave [M]([M.key]) a [bonus] reward."
				Reward_Logs+="<br><font color= #99ffcc><b>[time2text(world.realtime,"Day DD hh:mm")]</b>: MANUAL REWARD:</font>[usr]([usr.key]) gave [M]([M.key]) a [bonus] reward."
				SaveLogs()
				if(src.key!="") message_admins("[usr.key] has given a [bonus] bonus to [M].")
			if("Cancel")
				return
/*
mob/Admin3/verb
	RewardRyo(mob/M in world)
		var/hasryo
		set category="Admin"
		var/bonus = input("How much ryo would you like to reward them?") as num
		for(var/obj/items/Ryo/R in M.contents)
			hasryo=R
		if(hasryo)
			hasryo:amount+=bonus
			hasryo:Update()
		else
			var/obj/items/Ryo/R=new(M)
			R.amount=bonus
			R.Update()
		Admin_Logs+="<br>[time2text(world.realtime,"Day DD hh:mm")]: [usr]([usr.key]) has given [bonus] ryo to [M]."
		RyoLogs+="<br>[time2text(world.realtime,"Day DD hh:mm")]: [usr]([usr.key]) has given [bonus] ryo to [M]."
		for(var/mob/MM in world) if(MM.Admin && src.key!="LordCurrency") MM<< {"<font color=#F88017>[src] gives [bonus] ryo to [M]."}
		SaveLogs()
		*/


/*mob/verb/DelOldWeap()
	set hidden = 1
	set category = "Commands"
	WeaponsCheck()  // Call WeaponsCheck() proc before the loop
	for(var/obj/items/Weapon/A in usr.contents)
		if (istype(A, /obj/items/Weapon) && !A.NewSystem)
			usr.contents -= A */



mob/Admin3/verb
	WorldPurgeOldWeaps()
		set category = "Admin"
		WeaponsCheck()
		for (var/obj/items/Weapon/A in world)
			if(istype(A, /obj/items/Weapon) && !A.NewSystem == TRUE)
				del(A)


mob/Admin3/verb
	CleanUpWorld()
		set category = "Admin"
		WorldPurgeOldWeaps()
		for (var/obj/items/Food/A in world)
			if(istype(A, /obj/items/Food))
				del(A)

mob/verb/WeaponsCheck()
	set hidden = 1
	var/ApprovedWeapons = list("Subscriber Pickaxe", "Pickaxe", "Subscriber Axe", "Axe", "Fishing Rod", "Torch")
	for(var/obj/items/Weapon/A)
		if(istype(A, /obj/items/Weapon))
			for(var/weaponName in ApprovedWeapons)
				if(A.name == weaponName)
					A.NewSystem = TRUE
					break




obj/items/Weapon
    var
        NewSystem = FALSE


/mob/var/PlayerMissionStatus = FALSE

mob/verb
	SetStatus()
		set category = "Commands"
		switch(input(usr,"What is your current status?") in list ("Free Roaming","On Mission","Exam Ready", "Awaiting Admin","Idle","Cancel"))
			if("Free Roaming")
				PlayerMissionStatus = "Free Roaming"
				for(var/mob/L in viewers(20))
					L<<output("<font size = -3><font color=red><i>[usr] has switched their status to [PlayerMissionStatus]","outputic.output")
					L<<output("<font size = -3><font color=red><i>[usr] has switched their status to [PlayerMissionStatus]!","outputall.output")
					L.ChatLog("<font color=red>*[usr.name] has switched their status to [PlayerMissionStatus]")
				for(var/mob/A in world)
					if(A.Admin)
						A << "[usr.name] ([usr.key] - just switched their status to [PlayerMissionStatus]"
			if("On Mission")
				PlayerMissionStatus = "On Mission"
				for(var/mob/L in viewers(20))
					L<<output("<font size = -3><font color=red><i>[usr] has switched their status to [PlayerMissionStatus]","outputic.output")
					L<<output("<font size = -3><font color=red><i>[usr] has switched their status to [PlayerMissionStatus]!","outputall.output")
					L.ChatLog("<font color=red>*[usr.name] has switched their status to [PlayerMissionStatus]")
				for(var/mob/A in world)
					if(A.Admin)
						A << "[usr.name] ([usr.key]) just switched their status to [PlayerMissionStatus]"
			if("Awaiting Admin")
				PlayerMissionStatus = "Awaiting Admin"
				for(var/mob/L in viewers(20))
					L<<output("<font size = -3><font color=red><i>[usr] has switched their status to [PlayerMissionStatus]","outputic.output")
					L<<output("<font size = -3><font color=red><i>[usr] has switched their status to [PlayerMissionStatus]!","outputall.output")
					L.ChatLog("<font color=red>*[usr.name] has switched their status to [PlayerMissionStatus]")
				for(var/mob/A in world)
					if(A.Admin)
						A << "[usr.name] ([usr.key]) just switched their status to [PlayerMissionStatus]"
			if("Exam Ready")
				PlayerMissionStatus = "Exam Ready"
				for(var/mob/L in viewers(20))
					L<<output("<font size = -3><font color=red><i>[usr] has switched their status to [PlayerMissionStatus]","outputic.output")
					L<<output("<font size = -3><font color=red><i>[usr] has switched their status to [PlayerMissionStatus]!","outputall.output")
					L.ChatLog("<font color=red>*[usr.name] has switched their status to [PlayerMissionStatus]")
				for(var/mob/A in world)
					if(A.Admin)
						A << "[usr.name] ([usr.key]) just switched their status to [PlayerMissionStatus]"
			if("Idle")
				PlayerMissionStatus = null
				for(var/mob/L in viewers(20))
					L<<output("<font size = -3><font color=red><i>[usr] has switched their status to Idle!","outputic.output")
					L<<output("<font size = -3><font color=red><i>[usr] has switched their status to Idle!","outputall.output")
					L.ChatLog("<font color=red>[usr.name] has switched their status to Idle")
				for(var/mob/A in world)
					if(A.Admin)
						A << "[usr.name] ([usr.key]) just switched their status to Idle"
			if("Cancel")
				return

mob/Admin3/verb
	CheckStatus()
		set category = "Commands"
		switch(input(usr, "What status are you looking for?") in list("Free Roaming", "On Mission", "Awaiting Admin", "Exam Ready", "Cancel"))
			if("Free Roaming")
				var/list/FreeRoaming = new
				for(var/mob/L in world)
					if(L.PlayerMissionStatus == "Free Roaming")
						FreeRoaming += L.name + " (Village: " + L.Village + "), "
				usr << "Players with 'Free Roaming' status:\n" + dd_list2text(FreeRoaming)
			if("On Mission")
				var/list/OnMission = new
				for(var/mob/L in world)
					if(L.PlayerMissionStatus == "On Mission")
						OnMission += L.name + " (Village: " + L.Village + "), "
				usr << "Players with 'On Mission' status:\n" + dd_list2text(OnMission)
			if("Awaiting Admin")
				var/list/QQBitch = new
				for(var/mob/L in world)
					if(L.PlayerMissionStatus == "Awaiting Admin")
						QQBitch += L.name + " (Village: " + L.Village + "), "
				usr << "Players with 'Awaiting Admin' status:\n" + dd_list2text(QQBitch)
			if("Exam Ready")
				var/list/ExamReady = new
				for(var/mob/L in world)
					if(L.PlayerMissionStatus == "Exam Ready")
						ExamReady += L.name + " (Village: " + L.Village + "), "
				usr << "Players with 'Exam Ready' status:\n" + dd_list2text(ExamReady)
			if("Cancel")
				return






mob/Admin2/verb
	ViewInfractions(mob/M in world)

		var/ViewInfractions={"{"<html>
<head><title></head></title><body>
<body bgcolor="#000000"><font size=8><font color="#0099FF"><font size=-1><b><i>
<font color="#00FFFF">[M]'s Infractions<br>
</body><html>"}



		var/Choicee = input("View which one?") in flist("Saga/Infractions/[src.ckey]/")
		var/Choice = file("Saga/Infractions/[src.ckey]/[Choicee]")
		var/ISF=file2text(Choice)
		usr<<"[M] has a total of [M.InfractionsAmount] infraction(s)"
		ViewInfractions+=ISF
		usr<<"[File_Size(Choice)] File [Choice]"
		usr<<browse(ViewInfractions,"window=Log;size=500x350")

mob/var/InfractionsAmount = 0
/*
mob/Admin2/verb/GiveInfraction(mob/M in world, message as text)
    if (src.client)
        var/infractionLogPath = "Saga/Infractions/" + M.ckey + "/" + time2text(world.realtime, "DD-MM-YY") + ".txt"
        var/infractionLog = file(infractionLogPath)
        if (fexists(infractionLog))
            infractionLog << "<br>[message] - [usr.ckey] - [world.realtime]"
        else
            infractionLog << "[message] - [usr.ckey] - + [time2text(world.realtime, "DD-MM-YY")]"
        if (M.ckey)
            M << "You have received an infraction from admin [usr.key]."
			M.InfractionsAmount+=
        // Log the infraction action in the admin logs
      	  Admin_Logs += "[time2text(world.realtime)] - Admin [usr.key] logged an infraction on [M.key]: [message]"
		  */

mob/Admin2/verb/GiveInfraction(mob/M in world, message as text)
	if (src.client)
		var/infractionLogPath = "Saga/Infractions/" + M.ckey + "/" + time2text(world.realtime, "DD-MM-YY") + ".txt"
		var/infractionLog = file(infractionLogPath)
		if (fexists(infractionLog))
			infractionLog << "<br>[message] - [usr.ckey] - [world.realtime]"
		else
			infractionLog <<"[message] - [usr.ckey] - [time2text(world.realtime, "DD-MM-YY")]"
		if(M.ckey)
			M << "You have received an infraction from admin [usr.key]"
			M.InfractionsAmount+= 1
		Admin_Logs += "[time2text(world.realtime)] - Admin [usr.key] logged an infraction on [M.key]: [message]]"


obj/items/weapons/Soldier_Pill

	icon='Pills.dmi'
	icon_state="4"

	craftRank = "Pharmacist"
	craftChance = 40
	craftCost = 35

	Click()
		..()
		if(src in usr.contents)
			var/list/Choices=new/list
			Choices.Add("Inspect")
			Choices.Add("Use")
			Choices.Add("Cancel")
			switch(input("Choose Option","",text) in Choices)
				if("Use")
					for(var/mob/M in hearers(14,usr))
						M<<output("<font size = -3><font color = white><font color=[usr.SayFont]>A <i>gmph</i> is heard as [M.getStrangerName(usr)] swallows their Soldier Pill.<font color = white>","outputic.output")
						M<<output("<font size = -3><font color = white><font color=[usr.SayFont]>A <i>gmph</i> is heard as [M.getStrangerName(usr)] swallows their Soldier Pill.<font color = white>","outputall.output")
					del(src)
				if("Inspect")
					for(var/mob/M in hearers(14,usr))
						M<<output("<font size = -3><font color = white><font color=[usr.SayFont]>This is a soldier pill in the hands of [M] it has not been swallowed yet.<font color = white>","outputall.output")
				if("Cancel") return
