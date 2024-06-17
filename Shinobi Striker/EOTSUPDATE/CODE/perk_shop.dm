
/*

Cody 6/8/2019



Sorting by Perk Type, many many more perk types.verb

Avainer 3/1/2017
Current Sortings: Skill | Spec
skill_sorting = All | Core | Will | Alignment | Misc


7/1/2017 extension
	parents: shopWindow
	children: PerkShop , JutsuShop
	Topic() call
	switchPerk()
	switchJutsu()

*/



/*client
	Click(A,B,C)
		if(C == "PerkShop.PerkShopGrid")
			if(istype(A,/obj/jutsu/))
				usr.databaseperk=A
				usr.refreshpublicdatabasemini()
				return
		if(C == "JutsuShop.JutsuShopGrid")
			if(istype(A,/obj/jutsu/))
				usr.databasejutsu=A
				usr.refreshjutsudatabasemini()
				return
		..()
*/

mob/var/tmp/obj/jutsu/perk/databaseperk

mob/var/tmp/shopChoice = "PerkShop"


mob
	var
		tmp/chosen_sorting="Skill"
		tmp/skill_sorting = "All"
		PublicDBOpen=0
	verb

		BuySelectedPerk()
			set hidden = 1
			switch(input("Are you sure you wish to buy this perk [src.databaseperk.name]?","Confirmation") in list("No","Yes"))
				if("No")
					return
				if("Yes")
					var/reqs = check_reqs(src.databaseperk)
					var/cost_reduction = 0
					var/cost_multiplier = 1
					var/additional_cost = 0
					var/has_element = FALSE

					if(reqs != "Pass")
						alert(src,reqs)
						return

					if(HasPerk("Natural Gift"))
						cost_reduction = 2


					if(src.databaseperk.name in list("Katon Training",
													 "Suiton Training",
													 "Doton Training",
													 "Raiton Training",
													 "Fuuton Training"))

						if(HasPerk("Katon Training"))
							has_element = TRUE
							cost_multiplier+=1

						if(HasPerk("Suiton Training"))
							has_element = TRUE
							cost_multiplier+=1

						if(HasPerk("Doton Training"))
							has_element = TRUE
							cost_multiplier+=1

						if(HasPerk("Raiton Training"))
							has_element = TRUE
							cost_multiplier+=1

						if(HasPerk("Fuuton Training"))
							has_element = TRUE
							cost_multiplier+=1


					var/rank_req = check_rank(src.databaseperk)
					if(rank_req != "Pass")
						if(rank_req == "Too High")
							alert(src,"As of right now, this perk is beyond your capabilities.")
							return
						var/confirmation = input(src,rank_req,"Confirmation") in list("No","Yes")
						if(confirmation != "Yes")
							return
						additional_cost = src.databaseperk.point_cost

					if(has_element)
						var/confirm = input(src,"You already have learned [cost_multiplier - 1] element(s), learning another will cost you [(src.databaseperk.point_cost - cost_reduction + additional_cost) * cost_multiplier] points, are you sure?") in list("No","Yes")
						if(confirm != "Yes")
							return

					if(progress_points >= (src.databaseperk.point_cost - cost_reduction + additional_cost) * cost_multiplier)
						if(core_slots >= src.databaseperk.core_cost)
							if(!teach_jutsu(src.databaseperk))
								alert("You already have [src.databaseperk]")
								return
							else
								progress_points -= (src.databaseperk.point_cost - cost_reduction + additional_cost) * cost_multiplier
								core_slots -= (src.databaseperk.core_cost)

								alert(src, "You have purchased [src.databaseperk] for [(src.databaseperk.point_cost - cost_reduction + additional_cost) * cost_multiplier] point(s)")

								//SLOTH the loop to delete core perks
								/*
								for(var/obj/jutsu/k in src.contents)
									if(k.progresses_into == src.databaseperk.name)
										del(k)
								*/
					else
						alert(src, "You don't have enough points ([progress_points]/[src.databaseperk.point_cost])")
			character_box.update_info(src)
			src.databaseperk = null



		PublicDatabase()
			set hidden = 1
			usr.PublicDBOpen=1
			winset(usr, "JutsuShopGrid","cells=0x0")
			winset(usr, "PerkShopGrid", "cells=0x0")
			winset(usr,"ShopWindow","is-visible=true")
			refreshpublicdatabase()
			refreshpublicjutsu()

		ClosePublicDatabase()
			set hidden = 1
			winset(usr,"ShopWindow","is-visible=false")
			usr.PublicDBOpen=0
		PublicDatabaseRefresh()
			set hidden = 1
			winset(usr, "PerkShopGrid", "cells=0x0")
			winset(usr,"PerkShop","is-visible=true")
			refreshpublicdatabase()

		SortSpecPerks()
			set hidden = 1
			src.chosen_sorting = "Spec"
			src.refreshpublicdatabase()


		SortSkillPerks()
			set hidden = 1
			src.chosen_sorting = "Skill"
			src.skill_sorting = "All"
			src.refreshpublicdatabase()
		SortInnerSkills()
			set hidden = 1
			if(src.chosen_sorting == "Skill")
				src.skill_sorting = input("Which sorting would you like?") in list("All","Will","Skill","Misc","Alignment","Uchiha","Inuzuka","Kaguya","Puppet","Aburame","Senju","Hyuuga","Hozuki","Sarutobi","Yuki","Taijutsu","Genjutsu","Medical","Fuuinjutsu","Scout","Sensory","Fuuton","Katon","Suiton","Doton","Raiton")
			refreshpublicdatabase()
	proc
		switchPerks()
			shopChoice = "PerkShop"
			winset(usr,"ShopWindow.child2", "left=PerkShop")
			refreshpublicdatabase()
		switchJutsu()
			world << "Here"
			shopChoice = "JutsuShop"
			winset(usr,"ShopWindow.child2", "left=JutsuShop")
			refreshpublicjutsu()


		refreshpublicdatabasemini()
			if(istype(src.databaseperk,/obj/jutsu/))
				src<<output(null,"PerkShop.Name")
				src<<output("[src.databaseperk.name]","PerkShop.Name")
				src<<output(null,"PerkShop.Desc")
				src<<output(null,"PerkShop.Reqs")
				src<<output("<center>[src.databaseperk.desc]\nNote: [src.databaseperk.perk_note ? src.databaseperk.perk_note : ""]</center>","PerkShop.Desc")


				var/p = ""
				for(var/req in src.databaseperk.prerequisites)
					p += "[req]"
					if(req != src.databaseperk.prerequisites[src.databaseperk.prerequisites.len])
						p += ", "
				if(src.databaseperk.control_req) p += "[src.databaseperk.control_req ? ", " : ""][get_grade_stat(src.databaseperk.control_req)] grade control "
				if(src.databaseperk.stamina_req) p += "[src.databaseperk.stamina_req ? ", " : ""][get_grade_stat(src.databaseperk.stamina_req,1)] grade stamina "
				if(src.databaseperk.strength_req) p += "[src.databaseperk.strength_req ? ", " : ""][get_grade_stat(src.databaseperk.strength_req)] grade strength "
				if(src.databaseperk.speed_req) p += "[src.databaseperk.speed_req ? ", " : ""][get_grade_stat(src.databaseperk.speed_req)] grade speed "
				if(src.databaseperk.agility_req) p += "[src.databaseperk.agility_req ? ", " : ""][get_grade_stat(src.databaseperk.agility_req)] grade agility "
				if(src.databaseperk.endurance_req) p += "[src.databaseperk.endurance_req ? ", " : ""][get_grade_stat(src.databaseperk.endurance_req)] grade endurance "
				if(p == "") p = "None"



				if(src.databaseperk.perk_type == "Gen2")
					src<<output("<center>[p]<br>PP Cost: [src.databaseperk.point_cost]</center>","PerkShop.Reqs")
				else
					src<<output("<center>[p]<br>PP Cost: [src.databaseperk.point_cost]</center>","PerkShop.Reqs")



		refreshpublicdatabase()
			if(!src.PublicDBOpen) return
			winset(src,"PerkShop.PPDisplay","text=\"[src.progress_points]\"")
			var/list/display_list = list()
			if(chosen_sorting == "Spec") //spec sorting handled here
				for(var/obj/jutsu/perk in archive)
					if(perk.perk_type == "Gen2")
						display_list += perk

			else //skill sorting here, more complex than spec which is gone under one category as of the moment

				switch(skill_sorting)
					if("Will")
						for(var/obj/jutsu/p in archive)
							if(p.perk_type == "Will" && p.jutsu_type == "perk")
								display_list += p
					if("Skill")
						for(var/obj/jutsu/p in archive)
							if(p.perk_type == "Skill" && p.jutsu_type == "perk")
								display_list += p
					if("Misc")
						for(var/obj/jutsu/p in archive)
							if(p.perk_type == "Misc" && p.jutsu_type == "perk")
								display_list += p
					if("Alignment")
						for(var/obj/jutsu/p in archive)
							if(p.perk_type == "Alignment" && p.jutsu_type == "perk")
								display_list += p
					//Start for Issac
					if("Uchiha")
						for(var/obj/jutsu/p in archive)
							if(p.perk_type == "Uchiha" && p.jutsu_type == "perk")
								display_list += p
					if("Inuzuka")
						for(var/obj/jutsu/p in archive)
							if(p.perk_type == "Inuzuka" && p.jutsu_type == "perk")
								display_list += p
					if("Kaguya")
						for(var/obj/jutsu/p in archive)
							if(p.perk_type == "Kaguya" && p.jutsu_type == "perk")
								display_list += p
					if("Puppet")
						for(var/obj/jutsu/p in archive)
							if(p.perk_type == "Puppet" && p.jutsu_type == "perk")
								display_list += p
					if("Aburame")
						for(var/obj/jutsu/p in archive)
							if(p.perk_type == "Aburame" && p.jutsu_type == "perk")
								display_list += p
					if("Senju")
						for(var/obj/jutsu/p in archive)
							if(p.perk_type == "Senju" && p.jutsu_type == "perk")
								display_list += p
					if("Hyuuga")
						for(var/obj/jutsu/p in archive)
							if(p.perk_type == "Hyuuga" && p.jutsu_type == "perk")
								display_list += p
					if("Hozuki")
						for(var/obj/jutsu/p in archive)
							if(p.perk_type == "Hozuki" && p.jutsu_type == "perk")
								display_list += p
					if("Sarutobi")
						for(var/obj/jutsu/p in archive)
							if(p.perk_type == "Sarutobi" && p.jutsu_type == "perk")
								display_list += p
					if("Yuki")
						for(var/obj/jutsu/p in archive)
							if(p.perk_type == "Yuki" && p.jutsu_type == "perk")
								display_list += p
					if("Taijutsu")
						for(var/obj/jutsu/p in archive)
							if(p.perk_type == "Taijutsu" && p.jutsu_type == "perk")
								display_list += p
					if("Genjutsu")
						for(var/obj/jutsu/p in archive)
							if(p.perk_type == "Genjutsu" && p.jutsu_type == "perk")
								display_list += p
					if("Medical")
						for(var/obj/jutsu/p in archive)
							if(p.perk_type == "Medical" && p.jutsu_type == "perk")
								display_list += p
					if("Fuuinjutsu")
						for(var/obj/jutsu/p in archive)
							if(p.perk_type == "Fuuinjutsu" && p.jutsu_type == "perk")
								display_list += p
					if("Scout")
						for(var/obj/jutsu/p in archive)
							if(p.perk_type == "Scout" && p.jutsu_type == "perk")
								display_list += p
					if("Sensory")
						for(var/obj/jutsu/p in archive)
							if(p.perk_type == "Sensory" && p.jutsu_type == "perk")
								display_list += p
					if("Fuuton")
						for(var/obj/jutsu/p in archive)
							if(p.perk_type == "Fuuton" && p.jutsu_type == "perk")
								display_list += p
					if("Katon")
						for(var/obj/jutsu/p in archive)
							if(p.perk_type == "Katon" && p.jutsu_type == "perk")
								display_list += p
					if("Suiton")
						for(var/obj/jutsu/p in archive)
							if(p.perk_type == "Suiton" && p.jutsu_type == "perk")
								display_list += p
					if("Doton")
						for(var/obj/jutsu/p in archive)
							if(p.perk_type == "Doton" && p.jutsu_type == "perk")
								display_list += p
					if("Raiton")
						for(var/obj/jutsu/p in archive)
							if(p.perk_type == "Raiton" && p.jutsu_type == "perk")
								display_list += p
					if("All")
						for(var/obj/jutsu/p in archive)
							if(p.jutsu_type == "perk")
								if(p.perk_type == "Core" || !p.perk_type || p.perk_type == "Hidden")
									continue
								display_list += p



			winset(usr, "PerkShopGrid", "cells=0x0") //displaying done here
			var/height = 1
			var/width = 0
			for(var/obj/jutsu/O in display_list)
				if(width>=3)
					width=0
					height+=1
				usr << output(O, "PerkShopGrid:[++width],[height]")


		//Display clicked
			if(istype(src.databaseperk,/obj/jutsu/))
				usr<<output(null,"PerkShop.Name")
				usr<<output("[src.databaseperk.name]","PerkShop.Name")
				usr<<output(null,"PerkShop.Desc")
				usr<<output(null,"PerkShop.Reqs")
				usr<<output("<center>[src.databaseperk.desc]\nNote: [src.databaseperk.perk_note ? src.databaseperk.perk_note : ""]</center>","PerkShop.Desc")


				var/p = ""
				for(var/req in src.databaseperk.prerequisites)
					p += "[req]"
					if(req != src.databaseperk.prerequisites[src.databaseperk.prerequisites.len])
						p += ", "
				if(src.databaseperk.control_req) p += "[src.databaseperk.control_req ? ", " : ""][get_grade_stat(src.databaseperk.control_req)] grade control "
				if(src.databaseperk.stamina_req) p += "[src.databaseperk.stamina_req ? ", " : ""][get_grade_stat(src.databaseperk.stamina_req,1)] grade stamina "
				if(src.databaseperk.strength_req) p += "[src.databaseperk.strength_req ? ", " : ""][get_grade_stat(src.databaseperk.strength_req)] grade strength "
				if(src.databaseperk.speed_req) p += "[src.databaseperk.speed_req ? ", " : ""][get_grade_stat(src.databaseperk.speed_req)] grade speed "
				if(src.databaseperk.agility_req) p += "[src.databaseperk.agility_req ? ", " : ""][get_grade_stat(src.databaseperk.agility_req)] grade agility "
				if(src.databaseperk.endurance_req) p += "[src.databaseperk.endurance_req ? ", " : ""][get_grade_stat(src.databaseperk.endurance_req)] grade endurance "
				if(p == "") p = "None"



				if(src.databaseperk.perk_type == "Gen2")
					src<<output("<center>[p]<br>PP Cost: [src.databaseperk.point_cost]</center>","PerkShop.Reqs")
				else
					src<<output("<center>[p]<br>PP Cost: [src.databaseperk.point_cost]</center>","PerkShop.Reqs")




		//	if(!src.databaseperk.icon_save)
		//		src.databaseperk.icon_save = icon(src.databaseperk.icon,"")
		//	var/newPicture = fcopy_rsc(src.databaseperk.icon_save)

		//	winset(usr,"PerkShop.PerksImage","image=\ref[newPicture]")


obj/jutsu
	var/icon/icon_save
obj/jutsu/perk/
	proc
		getPerkReq() //grabs requirements of perk to display



mob/verb/SearchPublicGrid()
	set hidden = 1
	var/t = winget(src,"PerkShop.SearchField","text")
	var/list/KK=list()
	switch(input("Choose an option to search within","Spec or Skill?") in list ("Both","Spec","Skill"))
		if("Both")

			for(var/obj/jutsu/perk in archive)
				if(perk.perk_type == "Core"||!perk.perk_type || perk.perk_type == "Hidden")
					continue
				if(perk.perk_type == "Gen2")

					if(findtext(perk.name,t))
						KK += perk


			for(var/obj/jutsu/p in archive)
				if(p.perk_type == "Core"||!p.perk_type || p.perk_type == "Hidden")
					continue
				if(p.jutsu_type == "perk")

					if(findtext(p.name,t))
						KK += p




		if("Spec")
			for(var/obj/jutsu/perk in archive)
				if(perk.perk_type == "Core"||!perk.perk_type || perk.perk_type == "Hidden")
					continue
				if(perk.perk_type == "Gen2")
					if(findtext(perk.name,t))
						KK += perk
		else
			for(var/obj/jutsu/p in archive)
				if(p.perk_type == "Core"||!p.perk_type || p.perk_type == "Hidden")
					continue
				if(p.jutsu_type == "perk")
					if(findtext(p.name,t))
						KK += p

	if(!KK.len)
		alert("No results for [t]")
		return
	winset(usr, "PerkShopGrid", "cells=0x0")
	var/height = 1
	var/width = 0
	for(var/obj/O in KK)

		if(width>=3)
			width=0
			height+=1
		usr << output(O, "PerkShopGrid:[++width],[height]")






//Jutsu section
var/list/worldSortings = list("All","Water","Fire","Wind","Earth","Lightning","Weaponist","Taijutsu","Kenjutsu","Fuuinjutsu","Genjutsu","Medical")
mob
	var
		tmp/jutsuSorting = "All"
/mob/var/region = ""

obj/jutsu
	var/sorting = ""
	var/region = ""

/obj/var/grants_region

mob/var/tmp/obj/jutsu/databasejutsu
mob
	verb
		JutsuDatabaseSorting()
			set hidden = 1
			jutsuSorting = input("Which one?") in worldSortings
			refreshpublicjutsu()

	proc

		refreshjutsudatabasemini()


			if(istype(src.databasejutsu,/obj/jutsu/))
				src<<output(null,"JutsuShop.Name")
				src<<output("[src.databasejutsu.name]","JutsuShop.Name")
				src<<output(null,"JutsuShop.Desc")
				src<<output(null,"JutsuShop.Reqs")
				src<<output("<center>[src.databasejutsu.desc]\nNote: [src.databasejutsu.perk_note ? src.databasejutsu.perk_note : ""]</center>","JutsuShop.Desc")


				var/p = ""
				for(var/req in src.databasejutsu.prerequisites)
					p += "[req]"
					if(req != src.databasejutsu.prerequisites[src.databasejutsu.prerequisites.len])
						p += ", "
				if(src.databasejutsu.control_req) p += "[src.databasejutsu.control_req ? ", " : ""][get_grade_stat(src.databasejutsu.control_req)] grade control "
				if(src.databasejutsu.stamina_req) p += "[src.databasejutsu.stamina_req ? ", " : ""][get_grade_stat(src.databasejutsu.stamina_req,1)] grade stamina "
				if(src.databasejutsu.strength_req) p += "[src.databasejutsu.strength_req ? ", " : ""][get_grade_stat(src.databasejutsu.strength_req)] grade strength "
				if(src.databasejutsu.speed_req) p += "[src.databasejutsu.speed_req ? ", " : ""][get_grade_stat(src.databasejutsu.speed_req)] grade speed "
				if(src.databasejutsu.agility_req) p += "[src.databasejutsu.agility_req ? ", " : ""][get_grade_stat(src.databasejutsu.agility_req)] grade agility "
				if(src.databasejutsu.endurance_req) p += "[src.databasejutsu.endurance_req ? ", " : ""][get_grade_stat(src.databasejutsu.endurance_req)] grade endurance "
				if(p == "") p = "None"




				src<<output("<center>[p]<br>PP Cost: [src.databasejutsu.point_cost]</center>","JutsuShop.Reqs")




		refreshpublicjutsu()
			if(!src.PublicDBOpen) return
			winset(src,"JutsuShop.PPDisplay","text=\"[src.progress_points]\"")
			var/list/display_list = list()


			if(jutsuSorting == "All")
				for(var/obj/jutsu/perk in archive)
					if(perk.perk_type == "perk")
						continue
					if(perk.jutsu_type == "Jutsu" || perk.is_public_effect == 1)
						display_list += perk
			else
				for(var/obj/jutsu/perk in archive)
					if(jutsuSorting == perk.sorting)
						if(perk.perk_type == "perk")
							continue
						if(perk.jutsu_type == "Jutsu"|| perk.is_public_effect == 1)
							display_list += perk

			for(var/obj/jutsu/perk in archive)
				for(var/obj/o in src)
					if(o.grants_region && o.grants_region == perk.region)
						display_list += perk



			winset(usr, "JutsuShopGrid", "cells=0x0") //displaying done here
			var/height = 1
			var/width = 0
			for(var/obj/jutsu/O in display_list)
				if(width>=3)
					width=0
					height+=1
				usr << output(O, "JutsuShopGrid:[++width],[height]")


		//Display clicked
			if(istype(src.databasejutsu,/obj/jutsu/))
				src<<output(null,"JutsuShop.Name")
				src<<output("[src.databasejutsu.name]","JutsuShop.Name")
				src<<output(null,"JutsuShop.Desc")
				src<<output(null,"JutsuShop.Reqs")
				src<<output("<center>[src.databasejutsu.desc]\nNote: [src.databasejutsu.perk_note ? src.databasejutsu.perk_note : ""]</center>","JutsuShop.Desc")


				var/p = ""
				for(var/req in src.databasejutsu.prerequisites)
					p += "[req]"
					if(req != src.databasejutsu.prerequisites[src.databasejutsu.prerequisites.len])
						p += ", "
				if(usr.databasejutsu.control_req) p += "[src.databasejutsu.control_req ? ", " : ""][get_grade_stat(src.databasejutsu.control_req)] grade control "
				if(usr.databasejutsu.stamina_req) p += "[src.databasejutsu.stamina_req ? ", " : ""][get_grade_stat(src.databasejutsu.stamina_req,1)] grade stamina "
				if(usr.databasejutsu.strength_req) p += "[src.databasejutsu.strength_req ? ", " : ""][get_grade_stat(src.databasejutsu.strength_req)] grade strength "
				if(usr.databasejutsu.speed_req) p += "[src.databasejutsu.speed_req ? ", " : ""][get_grade_stat(src.databasejutsu.speed_req)] grade speed "
				if(usr.databasejutsu.agility_req) text += "[src.databasejutsu.agility_req ? ", " : ""][get_grade_stat(src.databasejutsu.agility_req)] grade agility "
				if(usr.databasejutsu.endurance_req) text += "[src.databasejutsu.endurance_req ? ", " : ""][get_grade_stat(src.databasejutsu.endurance_req)] grade endurance "
				if(p == "") p = "None"




				src<<output("<center>[p]<br>PP Cost: [src.databasejutsu.point_cost]</center>","JutsuShop.Reqs")

mob/verb
	BuySelectedJutsu()
		set hidden = 1

		switch(input("Are you sure you wish to purchase [src.databasejutsu.name]?","Confirmation") in list("No","Yes"))
			if("No")
				return
		//checks for requirements



		//req check success, buying perk now
	/*	var/list/listed_requirements = src.databasejutsu.prerequisites.Copy()
		for(var/obj/jutsu/jutsu in src)
			if(jutsu.name in listed_requirements)
				listed_requirements -= jutsu.name
			else
				for(var/r in jutsu.encapsulates)
					if(r in listed_requirements)
						listed_requirements -= r
		if(listed_requirements.len || (control + control_boost()) < src.databasejutsu.control_req || (stamina + stamina_boost()) < src.databasejutsu.stamina_req)
			var/text = "You don't meet the requirements for [src.databasejutsu] ( "
			for(var/t in listed_requirements)
				text += "[t][length(text) > 45 ? ", " : ""] "
			if(src.databasejutsu.control_req) text += "[get_grade_stat(src.databasejutsu.control_req)] grade control[length(text) > 45 ? ", " : ""] "
			if(src.databasejutsu.stamina_req) text += "[get_grade_stat(src.databasejutsu.stamina_req)] grade stamina "
			text += ")"
			alert(src, text)
			return*/
		var/reqs = check_reqs(src.databasejutsu)
		if(reqs != "Pass")
			alert(src,reqs)
			return

		for(var/obj/items/Ryo/R in usr.contents)
			if(R.amount>=src.databasejutsu.ryo_cost)
				if(progress_points >= src.databasejutsu.point_cost)
					if(!teach_jutsu(src.databasejutsu))
						alert("You already have [src.databasejutsu]")
						return
					else
						R.amount-=src.databasejutsu.ryo_cost
						R.Update()
						progress_points -= src.databasejutsu.point_cost
						if(src.databasejutsu.unique_tech == 1)
							alert(src,"You have created [src.databasejutsu] for [src.databasejutsu.point_cost] point(s).")
						else
							alert(src, "You have purchased [src.databasejutsu] for [src.databasejutsu.ryo_cost] ryo.")
				else
					alert(src,"You do not have enough points ([progress_points]/[src.databasejutsu.point_cost]) point(s).")
			else
				alert(src, "You do not have enough ryo.")

		character_box.update_info(src)
		src.databasejutsu = null

mob/verb/SearchPublicJutsu()
	set hidden = 1
	var/t = winget(src,"JutsuShop.SearchField","text")
	var/list/KK=list()


	for(var/obj/jutsu/perk in archive)
		if(perk.perk_type == "perk")
			continue
		if(perk.jutsu_type == "Jutsu"|| perk.is_public_effect == 1)

			if(findtext(perk.name,t))
				KK += perk




	if(!KK.len)
		alert("No results for [t]")
		return
	winset(usr, "JutsuShopGrid", "cells=0x0")
	var/height = 1
	var/width = 0
	for(var/obj/O in KK)

		if(width>=2)
			width=0
			height+=1
		usr << output(O, "JutsuShopGrid:[++width],[height]")


mob/verb
	ShowJutsuShop()
		set hidden = 1
		winset(usr,"ShopWindow.jutsuButton","image=\ref[jutsuSelected]")
		winset(src,"ShopWindow.perkButton", "image=\ref[perkBlank]")
		winset(src,"ShopWindow.shopp","left=JutsuShop")

	ShowPerkShop()
		set hidden = 1
		winset(usr,"ShopWindow.jutsuButton","image=\ref[jutsuBlank]")
		winset(src,"ShopWindow.perkButton", "image=\ref[perkSelected]")
		winset(src,"ShopWindow.shopp","left=PerkShop")
mob/Admin5
	verb
		/*
		Make_Public(obj/jutsu/Jutsu in archive)
			set category = null
			if(Jutsu.perk_type == "perk")
				alert("This is a perk, use this only on jutsu.")
				return
			Jutsu.jutsu_type = "Jutsu"
			Jutsu.sorting = input("What sorting?") in worldSortings
			Jutsu.point_cost = input("Point cost?") as num
			alert("Remember to set control/stamina reqs and prereqs using edit!")
			*/
		Update_All_Jutsu()
			set category = "Admin"
			for(var/obj/jutsu/a in archive)
				a.last_edit = world.realtime

		Make_Public(obj/jutsu/Jutsu in archive)
			set category = null
			if(Jutsu.perk_type == "perk")
				alert("This is a perk, use this only on jutsu.")
				return

			var/my_choice = input(usr,"Would you like to add this to the public database") in list("No","Yes")
			if(my_choice == "No")
				return

			var/my_choice2 = input(usr,"Would you like to add this to a village database or clan database?") in list("Village","Clan")
			switch(my_choice2)
				if("Village")
					var/my_choice3 = input(usr,"Choose a village library to add [Jutsu.name] to. A jutsu can exist in multiple libraries.") in ActiveVillages + "Otogakure"
					Jutsu.can_purchase.Add(my_choice3)

				if("Clan")
					var/my_choice3 = input(usr,"Choose a clan library to add [Jutsu.name] to. A jutsu can exist in multiple libraries.") in list("Inuzuka", "Nara", "Hoshigaki", "Hozuki", "Hyuuga", "Kaguya", "Uchiha", "Uzumaki", "Senju", "Yuki", "Ukiyo", "Aburame","Sarutobi")
					Jutsu.can_purchase.Add(my_choice3)

		Remove_Public(obj/jutsu/Jutsu in archive)
			set category = null
			if(Jutsu.perk_type == "perk")
				alert("This is a perk, use this only on jutsu.")
				return
			var/my_choice = alert(usr, "This will remove the jutsu from all libraries. Are you sure?",, "No","Yes")
			if(my_choice == "No")
				return
			Jutsu.can_purchase = list()