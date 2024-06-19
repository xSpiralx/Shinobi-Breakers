
/var/list/globalPerks = list()

/var/global_progress_speed = 1000

//mob/var/reward_point = 0

//mob/var/progress_points = 0
/mob/var/progress_points_total = 0
/mob/var/temporaryBoost = 0
/mob/var/CanProgress=1
/mob/var/Last_Progress_Day = 0
/*proc/progress_loop()
	while(world)
		sleep(125)
		if(logFrozen) continue
		for(var/mob/M)
			if(!M.client) continue
			if(world.realtime - M.progress_timer > 864000)
				M.progress_timer = world.realtime
				if(M.temporaryBoost) M.temporaryBoost--
				M.progress_today = 0
				if(M.temporaryBoost<=0) M.progress_speed = 1

			var/progress_rate = 1

			if(M.progress_today < M.progress_cap * M.progress_speed)
				progress_rate = 1
			else if(M.progress_today < M.progress_cap * M.progress_speed * 1.25)// * M.progress_speed * 1.7)
				progress_rate = 0.15
			else progress_rate = 0

			var/progress_amount
			if(is_active(M))
				progress_amount = rand(6,10) * M.progress_speed * progress_rate * M.progress_key
			else
				if(M.afk || M.autoafk) continue
				progress_amount = 0.01 * M.progress_speed * progress_rate * M.progress_key

			progress_amount = progress_amount * global_progress_speed

			M.reward_point += progress_amount

			if(M.reward_point > 500)//Higher this is, slower the gains.
				var/bonus = get_bonus(M)
				if(M.rping_for)
					M.progressedPerks[M.rping_for.perkName] += bonus
					M.perkCheck()
				else
					M.progress_points += bonus

				M.progress_today += bonus
				M.progress_points_total += bonus
				M.reward_point = 0
				M.evaluate_grade()*/


/proc/is_ooc(text)
	if(copytext(text, length(text), length(text) + 1) in list("\]", ")"))
		return 1
	if(copytext(text, 1, 2) in list("\[", "("))
		return 1
	return 0

/proc/is_active(var/mob/M)
	if(M.progress_activity > 0)
		M.progress_activity--
		return 1
	return 0

/proc/get_bonus(var/mob/M)
	var/point_cap = get_point_cap(M) * 100
	var/points = 8
	if(M.progress_points_total >= point_cap)
		points = 6
	if(M.progress_points_total >= point_cap * 1.15)
		points = 4
	if(M.progress_points_total >= point_cap * 1.25)
		points = 3
	if(M.progress_points_total >= point_cap * 1.35)
		points = 2
	if(M.progress_points_total >= point_cap * 1.55)
		points = 1

	switch(rand(1, 3))
		if(1) points++
		if(2) points--

	if((M.Age) < 10)
		points = points * 0.45
	else if((M.Age) > 10)
		points = points * 0.85

/*	if((M.Age) > 20)
		points = points * 1.2*/

	if(points < 1) points = 1

	points = round(points)

	return points

/proc/get_total_perks(var/mob/M)
	var/total_perks = 0
	for(var/obj/Perk/perk in M)
		total_perks++
	return total_perks


/proc/get_point_cap(var/mob/M)
	var/point_cap = 0
	var/rank = M.Grade
	if(findtext(rank, "E"))
		point_cap = 2//200
	if(findtext(rank, "D"))
		point_cap = 4//400
	if(findtext(rank, "C"))
		point_cap = 8//800
	if(findtext(rank, "B"))
		point_cap = 14//1400
	if(findtext(rank, "A"))
		point_cap = 21//2100
	if(findtext(rank, "S"))
		point_cap = 30//3000
	if(findtext(rank, "-"))
		point_cap = point_cap - 1//100
	if(findtext(rank, "+"))
		point_cap = point_cap + 1//100
	if(point_cap < 1) point_cap = 1//100
	return point_cap

///mob/var/progress_cap = 20//
//mob/var/progress_speed = 1
//mob/var/progress_today = 0
//mob/var/progress_timer = 0
//mob/var/progress_key = 1
//mob/var/progress_activity = 0
//mob/var/stars = 0

//the awful verbs


/mob/Admin6/verb/


	change_global_progress_rate()
		set category = "Admin"
		global_progress_speed = input("Change to?","Progress Rate",global_progress_speed) as num
		for(var/mob/MM in world) if(MM.Admin && src.key!="LordMachiavelli") MM<< {"<font color=#F88017>[src] changed global progress to [global_progress_speed]"}
		if(src.key!="LordMachiavelli") Admin_Logs+="<br><font color=#F88017>[src] changed global progress to [global_progress_speed]"

	add_remove_progress_points(var/mob/M as mob in world)
		set category = "Admin"
		var/points = input("Add points") as num
		M.progress_points += points
		if(M.rping_for)
			var/temppoints=M.progressedPerks[M.rping_for.perkName]//30

			M.progressedPerks[M.rping_for.perkName]+=min(M.progress_points,(M.rping_for.maxPoints-temppoints))

			M.progress_points -= (M.progressedPerks[M.rping_for.perkName]-temppoints)

			if(M.progressedPerks[M.rping_for.perkName] >= M.rping_for.maxPoints)
				M.perkCheck()

		M.progress_points_total += points
		M<<output("<font size = -3>You've been awarded [round(points/10)] overflow points.","outputic.output")
		M<<output("<font size = -3>You've been awarded [round(points/10)] overflow points.","outputall.output")
		for(var/mob/MM in world) if(MM.Admin && src.key!="LordMachiavelli") MM<< {"<font color=#F88017>[src] gave [M.Oname] [points] overflow points"}
		if(src.key!="LordMachiavelli") Admin_Logs+="<br><font color=#F88017>[src] gave [M.Oname] [points] overflow points"


	change_progress_modifier(var/mob/M as mob in world)
		set category = "Admin"
		var/length = input("How many days?","Days",2) as num
		var/modifier = input("Change modifier","Modifier",M.progress_speed) as num
		M.progress_speed = modifier
		M.temporaryBoost = length
		for(var/mob/MM in world) if(MM.Admin && src.key!="LordMachiavelli") MM<< {"<font color=#F88017>[src] changed [M.Oname]'s modifier to [modifier]"}
		if(src.key!="LordMachiavelli") Admin_Logs+="<br><font color=#F88017>[src] changed [M.Oname]'s modifier to [modifier]"
/*	change_progress_modifier_key(var/mob/M as mob in world)
		set category = "Admin"
		var/modifier = input("Change modifier","Modifier",M.progress_key) as num
		M.progress_key = modifier*/


	remove_jutsu_from_custom_list(var/mob/M in world)
		set category = "Admin"
		var/obj/Perk/perk/perk = input("Which perk to delete?") in M.customPerks+"Cancel"
		if(perk=="Cancel") return
		var/plusPoints = max(M.progressedPerks[perk.perkName],0)
		M.progress_points += plusPoints
		M<<output("<font size = -3>You've been awarded [round(plusPoints/10)] overflow points from the deletion of [perk.perkName].","outputic.output")
		M<<output("<font size = -3>You've been awarded [round(plusPoints/10)] overflow points from the deletion of [perk.perkName].","outputall.output")
		if(M.rping_for)
			var/temppoints=M.progressedPerks[M.rping_for.perkName]//30
			M.progressedPerks[M.rping_for.perkName]+=min(M.progress_points,(M.rping_for.maxPoints-temppoints))
			M.progress_points -= (M.progressedPerks[M.rping_for.perkName]-temppoints)
			if(M.progressedPerks[M.rping_for.perkName] >= M.rping_for.maxPoints)
				M.perkCheck()
		for(var/mob/MM in world) if(MM.Admin && src.key!="LordMachiavelli") MM<< {"<font color=#F88017>[src] deleted [perk.perkName] from [M.Oname]'s log."}
		if(src.key!="LordMachiavelli") Admin_Logs+="<br><font color=#F88017>[src] deleted [perk.perkName] from [M.Oname]'s log."
		M.customPerks -= perk
		del(perk)


	add_jutsu_to_custom_list(var/mob/M as mob in world)
		set category = "Admin"
		if(alert(src,"Create or pull from database?","Database","Create","Database")=="Database")
			var/obj/perk = input("Which perk to copy?") in PerkDatabase+"Cancel"
			if(perk=="Cancel") return
			var/obj/Perk/perk/Custom/O = copyatom(perk)
			if(alert(src,"Give or add to progression log?","Choice","Give","Add to Progression Log")=="Add to Progression Log")
				src<<output("<font size = -3>Successfully created [O.perkName]","outputic.output")
				M<<output("<font size = -3>[O.perkName] has been added to your progression log.","outputic.output")
				M<<output("<font size = -3>[O.perkName] has been added to your progression log.","outputall.output")
				M.customPerks+=O
				for(var/mob/MM in world) if(MM.Admin && src.key!="LordMachiavelli") MM<< {"<font color=#F88017>[src] has added [O.perkName] to [M.Oname]'s log."}
				if(src.key!="LordMachiavelli") Admin_Logs+="<br><font color=#F88017>[src] has added [O.perkName] to [M.Oname]'s log."
			else
				src<<output("<font size = -3>Successfully created [O.perkName]","outputic.output")
				M<<output("<font size = -3>[O.perkName] has been added to your list.","outputic.output")
				M<<output("<font size = -3>[O.perkName] has been added to your list","outputall.output")
				M.contents+=O
				for(var/mob/MM in world) if(MM.Admin && src.key!="LordMachiavelli") MM<< {"<font color=#F88017>[src] has given [O.perkName] to [M.Oname]."}
				if(src.key!="LordMachiavelli") Admin_Logs+="<br><font color=#F88017>[src] has given [O.perkName] to [M.Oname]."
			return
		var/obj/Perk/perk/Custom/O = new
		O.perkName = input("Name of this perk?") as text
		O.name = O.perkName
		O.description = input("Enter a description for this perk.") as message

		O.picture = input("The image this perk uses?") as icon
		O.icon=O.picture
		var/rankRequirementInput = input("Does this jutsu have a rank requirement?") in list("E-","E","E+","D-","D","D+","C-","C","C+","B-","B","B+","A-","A","A+","S-","S","S+")
		if(findtext(rankRequirementInput, "E"))
			O.rankRequirement = 2
		if(findtext(rankRequirementInput, "D"))
			O.rankRequirement = 4
		if(findtext(rankRequirementInput, "C"))
			O.rankRequirement = 8
		if(findtext(rankRequirementInput, "B"))
			O.rankRequirement = 14
		if(findtext(rankRequirementInput, "A"))
			O.rankRequirement = 21
		if(findtext(rankRequirementInput, "S"))
			O.rankRequirement = 30
		if(findtext(rankRequirementInput, "-"))
			O.rankRequirement = O.rankRequirement - 1
		if(findtext(rankRequirementInput, "+"))
			O.rankRequirement = O.rankRequirement + 1
		O.prerequisite = input("Does this perk have any prerequisite?") in typesof(/obj/Perk/perk/) - /obj/Perk/perk - /obj/Perk/perk/Custom + "None"
		if(O.prerequisite == "None") O.prerequisite = null
		O.maxPoints = input("How many points will this take to achieve?") as num
		if(alert("Is this a jutsu?","Jutsu","Yes","No")=="Yes") O.isJutsu=1
		if(alert("Is this a unique?","Jutsu","Yes","No")=="Yes") O.unique=1
		src<<output("<font size = -3>Successfully created [O.perkName]","outputic.output")
		src<<output("<font size = -3>Successfully created [O.perkName]","outputall.output")
		O.uniqueID = "[md5(O.perkName)][md5(rand(1,900))]"
		if(alert(src,"Add to database?","Database","Yes","No")=="Yes")
			PerkDatabase+=copyatom(O)



		if(alert(src,"Give or add to progression log?","Choice","Give","Add to Progression Log")=="Add to Progression Log")
			M<<output("<font size = -3>[O.perkName] has been added to your progression log.","outputic.output")
			M<<output("<font size = -3>[O.perkName] has been added to your progression log.","outputall.output")
			M.customPerks+=O
			for(var/mob/MM in world) if(MM.Admin && src.key!="LordMachiavelli") MM<< {"<font color=#F88017>[src] has added [O.perkName] to [M.Oname]'s log."}
			if(src.key!="LordMachiavelli") Admin_Logs+="<br><font color=#F88017>[src] has added [O.perkName] to [M.Oname]'s log."
		else
			M<<output("<font size = -3>[O.perkName] has been added to your list.","outputic.output")
			M<<output("<font size = -3>[O.perkName] has been added to your list","outputall.output")
			M.contents+=O
			O.gridbased = 0
			for(var/mob/MM in world) if(MM.Admin && src.key!="LordMachiavelli") MM<< {"<font color=#F88017>[src] has given [O.perkName] to [M.Oname]."}
			if(src.key!="LordMachiavelli") Admin_Logs+="<br><font color=#F88017>[src] has given [O.perkName] to [M.Oname]."

	addPerk()
		var/obj/Perk/perk/Custom/O = new
		O.perkName = input("Name of this perk?") as text
		O.name = O.perkName
		O.description = input("Enter a description for this perk.") as message

		O.picture = input("The image this perk uses?") as icon
		O.icon=O.picture
		var/rankRequirementInput = input("Does this jutsu have a rank requirement?") in list("E-","E","E+","D-","D","D+","C-","C","C+","B-","B","B+","A-","A","A+","S-","S","S+")
		if(findtext(rankRequirementInput, "E"))
			O.rankRequirement = 2
		if(findtext(rankRequirementInput, "D"))
			O.rankRequirement = 4
		if(findtext(rankRequirementInput, "C"))
			O.rankRequirement = 8
		if(findtext(rankRequirementInput, "B"))
			O.rankRequirement = 14
		if(findtext(rankRequirementInput, "A"))
			O.rankRequirement = 21
		if(findtext(rankRequirementInput, "S"))
			O.rankRequirement = 30
		if(findtext(rankRequirementInput, "-"))
			O.rankRequirement = O.rankRequirement - 1
		if(findtext(rankRequirementInput, "+"))
			O.rankRequirement = O.rankRequirement + 1
		O.prerequisite = input("Does this perk have any prerequisite?") in typesof(/obj/Perk/perk/) - /obj/Perk/perk - /obj/Perk/perk/Custom + "None"
		if(O.prerequisite == "None") O.prerequisite = null
		O.maxPoints = input("How many points will this take to achieve?") as num
		if(alert("Is this a unique?","Jutsu","Yes","No")=="Yes") O.unique=1
		if(alert("Is this a jutsu?","Jutsu","Yes","No")=="Yes") O.isJutsu=1
		src<<output("<font size = -3>Successfully created [O.perkName]","outputic.output")
		src<<output("<font size = -3>Successfully created [O.perkName]","outputall.output")
		O.uniqueID = "[md5(O.perkName)][md5(rand(1,900))]"
		PerkDatabase+=copyatom(O)

mob/proc/grade_check()
	switch(progress_points_total)
		if(0 to 99) return "E-"// E-
		if(0 to 199) return "E"// E
		if(200 to 399) return "E+"// E+
		if(400 to 449) return "D-"// D-
		if(450 to 549) return "D"// D
		if(550 to 799) return "D+"//D+
		if(800 to 999) return "C-"// C-
		if(1000 to 1199) return "C"// C
		if(1200 to 1399) return "C+"//C+
		if(1400 to 1599) return "B-"// B-
		if(1600 to 1799) return "B"// B
		if(1800 to 1999) return "B+"//B+
		if(2000 to 2199) return "A-"// A-
		if(2200 to 2399) return "A"//A
		if(2400 to 9999) return "A+"//A+

mob/proc/evaluate_grade()
	var/grade_to_be = grade_check(progress_points_total)
	Grade = grade_to_be


mob/proc/getPrereq()
	var/list/perks=list()
	for(var/obj/Perk/perk/P in contents)
		if(P.prerequisite)
			perks+=P.prerequisite
			while(P.prerequisite)
				P = new P.prerequisite
				if(P.prerequisite) perks+=P.prerequisite
	return perks


mob/proc/getAvailablePerks()
	var/list/perksAvailable=list()
	for(var/obj/O in globalPerks)
		if(O.type in getPrereq()) continue
		perksAvailable+=O
	if(customPerks.len) perksAvailable+=customPerks

	for(var/obj/Perk/perk/newPerk in perksAvailable)
		newPerk.gridbased=1
		var/hasPre=0

		if(newPerk.name == "Custom") perksAvailable-=newPerk
		for(var/obj/Perk/perk/existingPerk in contents)
			if(newPerk.type == existingPerk.type && !istype(existingPerk,/obj/Perk/perk/Custom)) perksAvailable-=newPerk
			if(newPerk.prerequisite)
				if(existingPerk.type == newPerk.prerequisite) hasPre=1
				else
					var/obj/Perk/perk/perkPre = existingPerk
					while(perkPre.prerequisite)
						perkPre = new perkPre.prerequisite
						if(newPerk.prerequisite == perkPre.type)
							hasPre=1
							break

		if(get_point_cap(src) < newPerk.rankRequirement) perksAvailable-=newPerk
		if(newPerk.clan && !findtext(Oname,newPerk.clan)) perksAvailable-=newPerk
		if(newPerk.unique && !istype(newPerk,/obj/Perk/perk/Custom)) perksAvailable-=newPerk
		if(!hasPre && newPerk.prerequisite) perksAvailable-=newPerk
		if(newPerk.type == /obj/Perk/perk) perksAvailable-=newPerk
		if(rping_for) if(newPerk.type == rping_for.type) perksAvailable-=newPerk
	return perksAvailable











var/logFrozen=0
mob/var/list/customPerks = list()
mob/var/tmp/obj/Perk/perk/perkOpen = null
mob/var/progressedPerks = list()
mob/var/rewardLog = null
mob/var/obj/Perk/perk/rping_for = null
/*
/mob/Admin3/verb/change_state()
	set name="Toggle Log Freeze"
	set category="Admin"
	logFrozen=!logFrozen
	world<<"Progression is now [logFrozen ? "frozen" : "open"]."


/mob/verb/RewardRPX()
	set hidden=1
	winset(src,"RewardLog","is-visible=false")

/mob/verb/RewardRP()
	set hidden=1
	if(!client) return

	if(RecentVerbCheck("Goals", 1,1)) return
	recentverbs["Goals"] = world.realtime
	updateRPBox()
*/

/mob/proc/updateRPBox()
	if(!client) return
	winset(src,"RewardLog.Frozen","is-visible=false")
	if(logFrozen) winset(src,"RewardLog.Frozen","is-visible=true")
	winset(src,"RewardLog","is-visible=true")
	winset(src,"RewardLog.EXP","is-visible=true")
	winset(src,"RewardLog.ProgressionBar","is-visible=true")
	if(src.progress_speed > 1)
		winset(src,"RewardLog.Modifier","text=\"[temporaryBoost] days remaining on your [progress_speed]x modifier.\"")
	if(src.rping_for)
		winset(src,"RewardLog.EXP","text=\"[round(progressedPerks[src.rping_for.perkName]/10)]/[src.rping_for.maxPoints/10]\"")
		winset(src,"RewardLog.ProgressionBar","value=[(progressedPerks[src.rping_for.perkName]/src.rping_for.maxPoints)*100]")
	else
		winset(src,"RewardLog.EXP","is-visible=false")
		winset(src,"RewardLog.ProgressionBar","is-visible=false")
	src<<output(null,"RewardLog.ProgressPoints")
	src<<output(null,"RewardLog.Working")
	src<<output("[src.rping_for ? "<center><a href=?src=\ref[src];action=Perk;perk=[md5(rping_for.perkName)]>[rping_for.perkName]</a>" : "<center>Nothing"]","RewardLog.Working")
	winset(src,"RewardLog.perkGrid","cells=0x0")
	if(progress_points) src<<output("Overflow Points: [round(progress_points/10)]","RewardLog.ProgressPoints")
	var/Row = 1
	src<<output("Progressable Perks","RewardLog.perkGrid:1,1")
	src<<output("Difficulty","RewardLog.perkGrid:2,1")
	for(var/obj/Perk/perk/O in getAvailablePerks())
		if(!src.client) continue
		Row++
		if(!src.client) continue
		spawn()
			if(client)
				while(winget(src,"RewardLog","is-visible")=="true" && client)
					sleep(rand(30,45))
					if(!client)return
		if(!src.client) continue
		src << output(O,"RewardLog.perkGrid:1,[Row]")
		if(!src.client) continue
		src << output("[getDifficulty(O.maxPoints)] ([round(O.maxPoints/10)])","RewardLog.perkGrid:2,[Row]")
		if(!src.client) continue

mob/proc/perkCheck()
	if(progressedPerks[src.rping_for.perkName] >= src.rping_for.maxPoints)
		src<<output("<font size = -3>You've earned [src.rping_for.perkName]!","outputic.output")
		src<<output("<font size = -3>You've earned [src.rping_for.perkName]!","outputall.output")
		src.ChatLog("<font color=red>[src.Oname]([src.key]) earned [src.rping_for.perkName]")
		for(var/obj/Perk/perk/P in contents)
			if(rping_for.prerequisite == P.type && !istype(rping_for,/obj/Perk/perk/Custom) && !rping_for.noDelete) del(P)
//		if(rping_for.type == /obj/Perk/perk/Faint_Sense) new/obj/Ninjutsu/Kagura_Shingan(src)
		var/obj/Perk/perk/perk = copyatom(rping_for)
		perk.name = perk.perkName
		perk.icon = perk.picture
		perk.loc = src
		perk.gridbased=0
		progressedPerks -= src.rping_for.perkName
		src.rping_for = null
/*
mob/verb/logPerk()
	set hidden = 1
	if(perkOpen)
		src.rping_for = perkOpen
		for(var/obj/Perk/perk/P in contents)
			if(P.type == rping_for.type && !istype(rping_for,/obj/Perk/perk/Custom/)) return
		if(!progressedPerks[src.rping_for.perkName]) progressedPerks[src.rping_for.perkName]=0

		if(progress_points)

			var/temppoints=progressedPerks[src.rping_for.perkName]

			progressedPerks[src.rping_for.perkName]+=min(progress_points,(src.rping_for.maxPoints-temppoints))

			progress_points -= (progressedPerks[src.rping_for.perkName]-temppoints)

			if(progressedPerks[src.rping_for.perkName] >= src.rping_for.maxPoints)
				perkCheck()
		updateRPBox()
		winset(src,"PerkLog","is-visible=false")
		skalert("Now working for [perkOpen.perkName]")
		perkOpen = null

mob/verb/cancelPerk()
	set hidden = 1
	winset(src,"PerkLog","is-visible=false")
	perkOpen=null


/mob/Admin1/verb/read_rp_logs(mob/M as mob in world)
	set name="View Reward Logs"
	set category="Admin"

	var/data = "<title>[M.name]</title>"
	data+="<br><b>Progressing for:</b> [M.rping_for]"
	data+="<br><b>Past Rewards</b><br>"
	data+=M.rewardLog
	src << browse(data, "window=logs")

	//winset(src,"RewardLog.DateT","text=\"Since: [time2text(start_dateT, "MMM DD YYYY")]\"")
	//winset(src,"RewardLog.LastT","text=\"Last Submission: [time2text(end_dateT, "MMM DD YYYY")]\"")
	//winset(src,"RewardLog.WorkingT","text=\"Your Teacher/Student Goal: [teacher]\"")
*/
/*
/mob/var/rping_for = "Nothing"
/mob/var/rping_fort = "Nothing"
/mob/var/teacher = "No one"
/mob/verb/rplog()
	set hidden=1
	if(logFrozen) return
	if(teacher=="No one")
		src<<"Designate what you're working towards first!"
		return
	if(skalert("Confirm submission?","Submissions",list("Yes","No"))=="No") return
	var/msg=winget(src,"RewardLog.Submission","text")
	if(msg) record_log(msg)

/mob/proc/record_log(msg)
	if(logFrozen) return
	if(!rplog)
		rplog = list()
	var/datum/roleplay_log/log = new
	log.date = world.realtime
	log.data = html_encode(msg)
	rplog += log

	src << "Log recorded. [time2text(log.date, "MMM DD YYYY")]."
	winset(src,"RewardLog","is-visible=false")
	winset(src,"RewardLog.Submission","text=\"\"")
/mob/Admin1/verb/change_karma(mob/M as mob in world)
	set name="Add Karma"
	set category="Admin"
	var/karma=input("Specify change") as num
	if(!karma) return
	M.Karma+=karma
	for(var/mob/MM in world) if(MM.Admin) MM<< {"<font color=#F88017>[src] has increased [M.Oname]'s karma by [karma] points."}
	if(src.key!="LordMachiavelli") Admin_Logs+="<br>[src]([src.key]) has increased [M.Oname]([M.key])'s karma by [karma] points."


/mob/verb/change_rp_target()
	set hidden=1
	if(skalert("Are you sure you want to change what you are working towards? This will erase all previous logs.","Submissions",list("Yes","No"))=="No") return
	var/msg=input("Change to?") as text
	if(!msg) return
	src << "You are now working towards [msg]."

	rping_for = msg
	for(var/datum/roleplay_log/log in rplog)
		del(log)
	var/list/dates = list()
	for(var/datum/roleplay_log/log in rplog)
		dates += log.date

	var/start_date = min(dates)
	var/end_date = max(dates)
	winset(src,"RewardLog.Date","text=\"Since: [time2text(start_date, "MMM DD YYYY")]\"")
	winset(src,"RewardLog.Last","text=\"Last Submission: [time2text(end_date, "MMM DD YYYY")]\"")
	winset(src,"RewardLog.Working","text=\"You are working towards: [rping_for]\"")
	record_log(" ")

/mob/verb/set_teaching_goal()
	set hidden=1
	if(skalert("Are you sure you want to change what you are working towards? This will erase all previous logs with last teacher.","Submissions",list("Yes","No"))=="No") return
	var/msg=input("Change to?") as text
	if(!msg) return
	teacher=msg
	for(var/datum/roleplay_log/log in rplogT)
		del(log)
	var/list/dates = list()
	for(var/datum/roleplay_log/log in rplogT)
		dates += log.date

	var/start_date = min(dates)
	var/end_date = max(dates)
	winset(src,"RewardLog.DateT","text=\"Since: [time2text(start_date, "MMM DD YYYY")]\"")
	winset(src,"RewardLog.LastT","text=\"Last Submission: [time2text(end_date, "MMM DD YYYY")]\"")
	winset(src,"RewardLog.WorkingT","text=\"Your Teacher/Student Goal: [teacher]\"")
	src << "Your teacher/student goal is now [teacher]."

	record_logT(" ")


/mob/verb/rplogT()
	set hidden=1
	if(logFrozen) return
	if(teacher=="No one")
		src<<"Designate what you're working towards first!"
		return
	if(skalert("Confirm submission?","Submissions",list("Yes","No"))=="No") return
	var/msg=winget(src,"RewardLog.Submission","text")
	if(msg) record_logT(msg)

/mob/proc/record_logT(msg)
	if(logFrozen) return
	if(!rplogT)
		rplog = list()
	var/datum/roleplay_log/log = new
	log.date = world.realtime
	log.data = html_encode(msg)
	rplogT += log

	src << "Log recorded. [time2text(log.date, "MMM DD YYYY")]."
	winset(src,"RewardLog","is-visible=false")
	winset(src,"RewardLog.Submission","text=\"\"")

/mob/var/list/rplog = list()
/mob/var/list/rplogT = list()
/mob/var/Karma=0

/datum/roleplay_log
	var/date
	var/data
	var/points

//don't need this part. is just so that this file works stand alone.

*/

obj/timeWarp
	name = "Warp to Timeskip (Click)"
	Click()
		if(usr.Dead) return
		if(usr.z!=28)
			usr.teleporting = 1
			usr.Move(locate(51,142,29))
			usr.resetLuminosity()
			usr.teleporting = 0
			return

var/timeskip=0
var/timewarp = new/obj/timeWarp()

LoginNotice
	Timeskip
		var/length = 1
		var/textLength = "one year"
		act(mob/M)


		/*
			M<<output({"Time has skipped forward [textLength]! This slip forward in time is to be taken as an in character event.Your character may have trained over this length of time, similar to how characters in Naruto trained when it jumped toNaruto: Shippuden."},"outputic.output")
			M<<output({"Time has skipped forward [textLength]! This slip forward in time is to be taken as an in character event.Your character may have trained over this length of time, similar to how characters in Naruto trained when it jumped to Naruto: Shippuden."},"outputall.output")
			var/points = rand(520,625) * M.progress_speed * M.progress_key
			points = points * (length < 1 ? length + 0.1 : length)
			if((M.Age) < 10) points = points * 0.35
			else if((M.Age) < 15) points = points * 0.9
			if((M.Age) > 20) points = points * 1.05
			points = round(points)
			M.progress_points += points
			if(M.rping_for)
				var/temppoints=M.progressedPerks[M.rping_for.perkName]//30
				M.progressedPerks[M.rping_for.perkName]+=min(M.progress_points,(M.rping_for.maxPoints-temppoints))
				M.progress_points -= (M.progressedPerks[M.rping_for.perkName]-temppoints)
				if(M.progressedPerks[M.rping_for.perkName] >= M.rping_for.maxPoints)
					M.perkCheck()
			M.progress_points_total += points
			M<<output("<font size = -3>You've been awarded [points] overflow points to reflect this [textLength] period.","outputic.output")
			M<<output("<font size = -3>You've been awarded [points] overflow points to reflect this [textLength] period.","outputall.output")
			M<<output("<font size = -3>Your ryo has been adjusted for the change in time.","outputic.output")
			M<<output("<font size = -3>Your ryo has been adjusted for the change in time.","outputall.output")
			M<<output("<font size = -3>Please see an administrator to have your letter grade adjusted.","outputic.output")
			M<<output("<font size = -3>Please see an administrator to have your letter grade adjusted.","outputall.output")*/





/mob/Admin4/verb/announceTimeskip()
	set name = "Announce TS"
	set category = "Admin"
	timeskip=!timeskip
	if(timeskip)
		world<<"There is a timeskip taking place. Select the warp in your character menu to teleport there."
	/*	var/s = input("Dish out points?") in list("Yes","No")
		if(s == "Yes")
			var/LoginNotice/Timeskip/N = new
			var/length = input("How long is this timeskip, 1 = one month") as num
			N.textLength = input("How long is it in text?") as text
			N.textLength = lowertext(N.textLength)
			N.length = length * 0.1
			loginnotices["Timeskip[rand(1,10000)]"] = N
			for(var/mob/M in world)
				if(M.client) M.LoginUpdate()
			while(length)
				Month++
				length--
				YearCheck(0)*/

/*
/mob/Admin3/verb/progress(mob/M as mob in world)
	set name = "Progression"
	set category="Admin"
	winshow(src,"timeskip",1)
	winset(src,"timeskip.name","text=\"[M.name]\"")
	winset(src,"timeskip.rank","text=\"[M.Class]\"")
	winset(src,"timeskip.grade","text=\"[M.Grade]\"")
	winset(src,"timeskip.perks","cells=0x0")
	winset(src,"timeskip.jutsu","cells=0x0")
	var/Row = 1
	for(var/obj/Perk/O in M.contents)
		src << output(O,"timeskip.perks:1,[Row]")
		Row++
	Row = 1
	for(var/obj/O in M.contents)
		if(istype(O,/obj/Taijutsu/)||istype(O,/obj/Ninjutsu/)||istype(O,/obj/Genjutsu/)||istype(O,/obj/Kenjutsu/)||istype(O,/obj/Doujutsu/)||istype(O,/obj/Fuuinjutsu/)||istype(O,/obj/Senjutsu/))
			src << output(O,"timeskip.jutsu:1,[Row]")
			Row++
	var/list/directories=flist("Saga/ChatLogs/[M.ckey]/")
	winset(src,"timeskip.activity","text=\"[returnActivity(directories.len)]\"")
proc/returnActivity(number)
	//E,D,C,B,A,S
	if(number<10) return "E ([number])"
	if(number>10&&number<20) return "D ([number])"
	if(number>20&&number<35) return "C ([number])"
	if(number>35&&number<50) return "B ([number])"
	if(number>50&&number<70) return "A ([number])"
	if(number>70) return "S ([number])"

/mob/Admin3/verb/progressPerk()
	set hidden = 1
	var/who=winget(src,"timeskip.name","text")
	var/mob/refer = null
	if(!who) return
	for(var/mob/M in world)
		if(who == M.name)
			refer = M
			break
	if(!refer) return
	var/mob/Admin2/M = src
	M.Give_Perk(refer)
	progress(refer)

/mob/Admin3/verb/progressJutsu()
	set hidden = 1
	var/who=winget(src,"timeskip.name","text")
	var/mob/refer = null
	if(!who) return
	for(var/mob/M in world)
		if(who == M.name)
			refer = M
			break
	if(!refer) return
	src.Give_Jutsu(refer)
	progress(refer)

/mob/Admin3/verb/progressGrade(var/grade as text)
	set hidden = 1
	var/who=winget(src,"timeskip.name","text")
	var/mob/refer = null
	if(!who) return
	for(var/mob/M in world)
		if(who == M.name)
			refer = M
			break
	if(!refer) return
	refer.Grade=grade
	for(var/mob/MM in world) if(MM.Admin && src.key!="LordMachiavelli") MM<< {"<font color=#F88017>[src] changed [refer.Oname]'s grade to [refer.Grade]"}
	if(src.key!="LordMachiavelli") Admin_Logs+="<br><font color=#F88017>[src.key] changed changed [refer.Oname]'s grade to [refer.Grade]"
	refer.rewardLog+="([time2text(world.realtime)]) [src]([src.key]) gave [refer] [refer.Grade]<br>"
	progress(refer)

/mob/Admin3/verb/progressRank(var/rank as text)
	set hidden = 1
	var/who=winget(src,"timeskip.name","text")
	var/mob/refer = null
	if(!who) return
	for(var/mob/M in world)
		if(who == M.name)
			refer = M
			break
	if(!refer) return
	refer.Class=rank
	for(var/mob/MM in world) if(MM.Admin && src.key!="LordMachiavelli") MM<< {"<font color=#F88017>[src] changed [refer.Oname]'s rank to [refer.Class]"}
	if(src.key!="LordMachiavelli") Admin_Logs+="<br><font color=#F88017>[src.key] changed changed [refer.Oname]'s rank to [refer.Class]"
	progress(refer)*/