/*

1/1/2017 avainer


external will be stored in Saga/Character Sheets/[ckey]

date is stored in DD/MM/YY no need for realtime so you can append entries the next day if you need to
*/

obj/char_sheet_msg
	var
		info = null
		lock = 0
		date = ""
		title= ""




mob/var/tmp/list/entries = list()
mob/var/goals
mob/var/rewardDate

mob/proc

	loadCharacterSheet()
		if(!fexists("Saga/Character Sheets/[src.ckey].sav"))
			src.saveCharacterSheet()
		else
			var/savefile/F = new("Saga/Character Sheets/[src.ckey].sav")
			F["entries"] >> src.entries
			F["Goals"] >> src.goals
			F["rewardDate"] >> src.rewardDate


			saveCharacterSheet()
	saveCharacterSheet()
		var/savefile/F=new("Saga/Character Sheets/[src.ckey].sav")
		F["entries"] << src.entries
		F["CharName"] << src.name
		F["Goals"] << src.goals
		F["rewardDate"] << src.rewardDate
		F["points"] << src.lifetime_progress_points
		F["lastOn"] << src.lastOn
		F["Sub"] << src.Donator

		//Saving Perks + Jutsu
		var/perks = ""
		for(var/obj/jutsu/P in src)
			perks += "[P.name] "
		F["Perks"] << perks
		//Saving Stats
		F["Stats"] << "[get_grade_stat(src.strength)] [get_grade_stat(src.endurance)] [get_grade_stat(src.agility)] [get_grade_stat(src.speed)] [get_grade_stat(src.stamina)] [get_grade_stat(src.control)]"

//mob control

mob/
	proc/
		flushOwnProgression()

			src << output(null, "char_sheet.outputCharSheet")
			src << output(null, "char_sheet.goalsOut")

			src.loadCharacterSheet()

			for(var/obj/char_sheet_msg/entry in src.entries)
				src << output("[html_encode(entry.title)] - [html_encode(entry.date)] - [html_encode(entry.info)]", "char_sheet.outputCharSheet")
				src << output("<br>","char_sheet.outputCharSheet")
			src << output(goals, "char_sheet.goalsOut")



	verb/
		OwnGoalsChange()
			set hidden = 1
			src.goals = input(src,"What would you like to change your goals to? These goals can be long term goals, uniques, or jutsu that you can not achieve through IC means but desire.","Goals",src.goals) as message
			saveCharacterSheet()
			flushOwnProgression()

		CloseProgression()
			set hidden = 1
			winshow(src,"char_sheet",0)

		OwnProgression() //loads and displays the mob's char sheet
			set hidden = 1
			winshow(src,"char_sheet",1)
			flushOwnProgression()

		OwnProgressionAppend()
			set hidden = 1

			var/obj/char_sheet_msg/C = new()
			C.date = input("What is the date of this? Use DD/MM/YY format!") as text

			var/title=""
			while(length(title) == 0)
				title= input("Title?") as text

			C.title = title
			C.info = input(src,"Describe what happened, be concise and specific:","Entry Information") as message

			src.entries += C
			src.saveCharacterSheet()
			src.flushOwnProgression()


		OwnProgressionEdit()
			//uses references to get the wanted entry then append it
			set hidden = 1

			var/list/choices = list()
			for(var/obj/char_sheet_msg/C in src.entries)
				if(C.lock == 0)
					choices += "[C.title] - [C.date]"
			var/chosen_one = input("Which one do you want to edit?") in choices + "Cancel"
			if(chosen_one == "Cancel") return

			var/obj/char_sheet_msg/chosen_entry
			for(var/obj/char_sheet_msg/C in src.entries)
				if(C.lock == 0)
					if("[chosen_one]"== "[C.title] - [C.date]")
						chosen_entry = C
						break

			chosen_entry.date = input("What is the date of this? Use DD/MM/YY format!") as text
			var/title=""
			while(length(title) == 0)
				title= input("What is the title of this entry?") as text
			chosen_entry.info = input(src,"Describe what happened, be concise and specific:","Entry Information") as message
			chosen_entry.title = title
			src.saveCharacterSheet()
			src.flushOwnProgression()

		OwnProgressionDelete()

			set hidden = 1

			var/list/choices = list()
			for(var/obj/char_sheet_msg/C in src.entries)
				if(C.lock == 0)
					choices += "[C.title] - [C.date]"
			var/chosen_one = input("Which one do you want to delete?") in choices + "Cancel"

			if(chosen_one == "Cancel") return

			var/obj/char_sheet_msg/chosen_entry
			for(var/obj/char_sheet_msg/C in src.entries)
				if(C.lock == 0)
					if("[chosen_one]"	== "[C.title] - [C.date]")
						chosen_entry = C
						break

			src << "Deleted: [chosen_entry.date] - [chosen_entry.title] - [chosen_entry.info]"
			src.entries -= chosen_entry

			src.saveCharacterSheet()
			src.flushOwnProgression()



mob/var/tmp/mob/admin_selected = null

mob/Admin3/verb

/*
RewardCharSheetAdm
EditCharSheetAdm
AdmNameLabel
*/
	CheckCharacterSheet(mob/M in world)
		admin_selected = M

		winshow(src,"admin_char_sheet",1)
		winset(src,"admin_char_sheet.AdmNameLabel","text='[M.name]'")
		winset(src,"admin_char_sheet.DateLabel","text='[M.rewardDate]'")
		src << output(null, "admin_char_sheet.output1")
		src << output(null, "admin_char_sheet.goalsOutTwo")
	//	src.loadCharacterSheet()

		for(var/obj/char_sheet_msg/entry in M.entries)
			src << output("[html_encode(entry.title)] - [html_encode(entry.date)] - [html_encode(entry.info)]", "admin_char_sheet.output1")
		src << output(M.goals, "admin_char_sheet.goalsOutTwo")

	RewardCharSheetAdm()
		set hidden = 1


		var/obj/char_sheet_msg/review = new()

		review.date = time2text(world.realtime,"DD/MM/YYYY")
		review.title = "Admin Review by [src.key]"
		review.info = input("What's your review? This will appear in the player's character sheet. Include the given reward here:") as message

		admin_selected.entries += review

		for(var/obj/char_sheet_msg/entry in admin_selected.entries)
			entry.lock = 1
		admin_selected.rewardDate = time2text(world.realtime,"DD/MM/YYYY")
		admin_selected.saveCharacterSheet()
		src.CheckCharacterSheet(admin_selected)


	ViewPlayerLogSheet()
		set hidden = 1
		var/View={"{"<html>
<head><title></head></title><body>
<body bgcolor="#000000"><font size=8><font color="#0099FF"><font size=-1><b><i>
<font color="#00FFFF">**[admin_selected]'s Logged Activities**<br>
</body><html>"}
		var/Choicee = input("View which one?") in flist("SSO/ChatLogs/[admin_selected.ckey]/")
		var/Choice = file("SSO/ChatLogs/[admin_selected.ckey]/[Choicee]")
		var/ISF=file2text(Choice)
		View+=ISF
		usr<<"[File_Size(Choice)] File [Choice]"
		usr<<browse(View,"window=Log;size=500x350")
		SAdmin_Logs+="<br>[usr]([usr.key]) uses views [admin_selected]'s playerlogs. ([time2text(world.realtime)])"
		for(var/mob/MM in world) if(MM.ckey=="LordMachiavelli") MM<< {"<font color=#F88017>[src] views [admin_selected]'s playerlog in rewards from ([time2text(world.realtime)])."}



world/Topic()
	..()
	var/savefile/F = new(world.Import())
	handle_file(F)

proc/
	handle_file(savefile/sent_file)


		var/obj/rewardSheet/review = new()
		var/bonus = 0
		var/address = null

		sent_file["review"] >> review

		address = review.name
		var/done = 0
		for(var/mob/M in world)
			if(M.ckey == address && !M.loc==locate(37,239,28))

				var/jutsuGive = review.perkAward
				var/perkGive = review.jutsuAward
				var/obj/char_sheet_msg/entry = new()
				entry.date = review.date
				entry.title = review.title
				entry.info = review.info
				bonus = review.bonus
				M.entries += entry
				for(var/obj/char_sheet_msg/entryy in M.entries)
					entryy.lock = 1
				M.rewardDate = time2text(world.realtime,"DD/MM/YYYY")
				M.saveCharacterSheet()

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
					M << output("You've been rewarded [bonus] point(s) for your logs.", "outputall.output")

				if(jutsuGive != "None")
					M.givePerk("[jutsuGive]")
					M << output("You've been rewarded [perkGive] for your logs.", "outputall.output")
				if(perkGive != "None")
					M.givePerk("[perkGive]")
					M << output("You've been rewarded [perkGive] for your logs.", "outputall.output")

				if(M.character_box)
					M.character_box.update_stats(M)

				Reward_Logs+="<br><font color= #99ffcc><b>[time2text(world.realtime,"Day DD hh:mm")]</b>: MANUAL REWARD:</font>Log Check Export gave [M]([M.key]) a [bonus] reward. || Perk:[perkGive] jutsu:[jutsuGive]"

				SaveLogs()
				done = 1
				break

		if(done == 0)
			rewards += review
			SaveRewards()

var/list/rewards = list()


mob/proc/checkOfflineReward()
	var/obj/rewardSheet/given
	var/found = 0
	for(var/obj/rewardSheet/reward in rewards)
		if(reward.name == src.ckey)
			given = reward
			found = 1
			break
	if(found == 0)
		return
	var/obj/char_sheet_msg/review = new()
	review.info = given.info
	review.date = given.date
	review.title= given.title
	var/bonus = given.bonus
	var/jutsuGive = given.perkAward
	var/perkGive = given.jutsuAward
	rewards -= given
	SaveRewards()
	src.entries += review
	for(var/obj/char_sheet_msg/entry in src.entries)
		entry.lock = 1
	src.rewardDate = time2text(world.realtime,"DD/MM/YYYY")
	src.saveCharacterSheet()



	if(src.total_stats() + src.stat_points + bonus >= src.stat_cap)
		if(src.stat_cap - src.total_stats() - src.stat_points > 0)

			src << output("You've been rewarded [src.stat_cap - src.total_stats() - src.stat_points] point(s)", "outputall.ouatput")
			src.progress_points += src.stat_cap - src.total_stats() - src.stat_points
			src.lifetime_progress_points += src.stat_cap - src.total_stats() - src.stat_points
			src.stat_points += src.stat_cap - src.total_stats() - src.stat_points
		else
			return
	else
		src.progress_points += bonus
		src.lifetime_progress_points += bonus
		src.stat_points += bonus
		src << output("You've been rewarded [bonus] point(s) for your logs.", "outputall.output")
	if(jutsuGive != "None")
		src.givePerk("[jutsuGive]")
		src << output("You've been rewarded [jutsuGive] for your logs.", "outputall.output")
	if(perkGive != "None")
		src.givePerk("[perkGive]")
		src << output("You've been rewarded [perkGive] for your logs.", "outputall.output")
	/*if(src.lifetime_progress_points > 69 && !src.DiscountActive)
		src.ActivateDiscount()
		src << output("You've unlocked your unique trait: [src.Trait].", "outputall.output")*/
	if(src.character_box)
		src.character_box.update_stats(src)
	Reward_Logs+="<br><font color= #99ffcc><b>[time2text(world.realtime,"Day DD hh:mm")]</b>: MANUAL REWARD:</font>Log Check Export gave [src]([src.key]) a [bonus] reward.|| Perk:[perkGive] jutsu:[jutsuGive]"
	SaveLogs()

mob/proc/ActivateDiscount()
	src.DiscountActive = 1
	switch(src.Trait)
		if("Katon")
			src.PerkAffinity = "Katon"
		if("Suiton")
			src.PerkAffinity = "Suiton"
		if("Raiton")
			src.PerkAffinity = "Raiton"
		if("Doton")
			src.PerkAffinity = "Doton"
		if("Fuuton")
			src.PerkAffinity = "Fuuton"
		if("Fuuinjutsu")
			src.PerkAffinity = "Fuuinjutsu"
		if("Medical")
			src.PerkAffinity = "Medical"
		if("Taijutsu")
			src.PerkAffinity = "Taijutsu"
		if("Genjutsu")
			src.PerkAffinity = "Genjutsu"
		if("Genius")
			src.PerkAffinity = "Genius"
		if("Hardworker")
			src.PerkAffinity = "Hardworker"
	src.trait_text = null
	character_box.update_stats(src)
	character_box.update_info(src)

proc/SaveRewards()
	var/savefile/S=new("Rewards.sav")
	S["Rewards"]<<rewards

proc/LoadRewards() if(fexists("Rewards.sav"))
	var/savefile/S=new("Rewards.sav")
	S["Rewards"]>>rewards


obj
	rewardSheet
		var
			date
			title
			info
			bonus
			perkAward
			jutsuAward