obj/proc
	transfer(mob/M)
		M.contents += src

mob/var
	tmp/clicked=0


	birthmonth
	birthday
	birthyear
	Class = "Genin"
	Prof = ""
	Clan = "None"
	Occupation = "None"
	Village = ""
	CVillage = ""
	Trait = ""
	PrimaryElement = ""
	SecondaryElement = ""
	TrietaryElement = ""
	Has3rd = 0
	tmp/Selected
	Yen = 100
	displaykey = ""
	attackable = 1
	stat = 0
	Age=0
	Hunger = 0
	MaxHunger= 100
	Health = 100
	MaxHealth = 100
	HealthGain = 1.5
	Stamina = 15
	MaxStamina = 15
	StaminaGain = 0.01
	Student=0
	lx
	ly
	lz
	/*MaxCL=10
	CL = 10*/
	list/WHO=new
	Chakra = 10
	MaxChakra = 10
	ChakraGain = 1.5
	list/birth=list()
//	faceicon = 'facedef.dmi'
//	Ofaceicon = 'facedef.dmi'
	Strength = 1
	MaxStrength = 1
	StrengthGain = 0.01
	Agility = 1
	MaxAgility = 1
	AgilityGain = 0.01
	Offence = 1
	MaxOffence = 1
	OffenceGain = 0.01
	Defence = 1
	MaxDefence = 1
	DefenceGain = 0.01


	Control = 1
	ControlGain = 0.01
	MaxControl = 1
	Resistance = 1
	MaxResistance = 1
	ResistanceGain = 0.01

	Taijutsu = 1
	MaxTaijutsu = 1
	TaijutsuGain = 0.01
	Ninjutsu = 1
	MaxNinjutsu = 1
	NinjutsuGain = 0.01
	Genjutsu = 1
	MaxGenjutsu = 1
	GenjutsuGain = 0.01

	Squad = ""
	SquadName = ""
	SquadLeader = 0
	SquadMember = 0
	SquadM=0

	Profession = "None"

	Cap = 20
	tmp/ShowStats=0
	tmp/ShowInven=0

obj/Stats
	icon='Plus.dmi'
	name="Statistics (Click)"
	Click()
		usr.ShowStats=!usr.ShowStats
obj/Inven
	icon='Plus.dmi'
	name="Inventory (Click)"
	Click()
		usr.ShowInven=!usr.ShowInven
obj/Rank
	icon='Plus.dmi'
	name="Click to Display"
	Click()
		if(usr.RecentVerbCheck("RankDis", 1,1)) return
		usr.recentverbs["RankDis"]=world.realtime
		for(var/mob/M in hearers(usr))
			M<<output("<font size = -3><font color=[usr.SayFont]>[usr]'s rank:</font> [usr.Class] ([get_rank_grade(usr)])","outputic.output")
			M<<output("<font size = -3><font color=[usr.SayFont]>[usr]'s rank:</font> [usr.Class] ([get_rank_grade(usr)])","outputall.output")

/*
obj/bounty_entry
	New(mob/M)
		src.appearance = M.appearance
	Click()
		..()
		if(usr.Admin)
			src.suffix = input("What would you like to change the information to?") as message


mob/Admin3/verb
	makeBounty(mob/M in world)
		set category = "Admin"
		var/obj/bounty_entry/entry = new(M)
		archive.bounty_list += entry
//		save_archive()
	deleteBounty(obj/bounty_entry/C in archive.bounty_list)
		archive.bounty_list -= C
		del(C)
*/

mob/var/contactsOn = 0
mob/var/bountyOn = 1
mob/Stat()
	set background=1
	src.lx=src.x
	src.ly=src.y
	src.lz=src.z
	sleep(rand(1,12))
	if(src.stat)
		if(src.Selected)
			if(statpanel("-[src.Selected]-"))
				stat(src.Selected:contents)
		if(src.selectedClone)
			if(statpanel("[src.selectedClone]"))
				for(var/obj/jutsu/J in selectedClone.contents)
					stat(J)
		if(src.clones.len)

			if(statpanel("NPCs"))
				for(var/mob/M in clones)
					stat(M)
		if(playerViewApps)
			statpanel("Jutsu Apps")
			for(var/jutsuApp/J in archive.contents)
				if(J.submitter_ckey == ckey) stat(J)
		if(Admin)
			if(togglePlayerTab)
				if(statpanel("Players"))
					sleep(4)
					for(var/mob/M)
						if(M.client)
							stat("[M.Class] ([get_rank_grade(M)]), LPP: [M.lifetime_progress_points], Village: [M.Village]", M)
			if(toggleServerTab)
				if(statpanel("Server"))
					stat("CPU","[world.cpu]%")
					stat("Year","[Year]")
					stat("YearSpeed","[YearSpeed]")
					stat("World Gains:","[archive.progress_global_rate]")
					stat("Average Server PP:","[lifetime_progress_average]")
					var/seconds = round(world.time % 600 / 10)
					var/minutes = round(world.time % 3600 / 600)
					var/hours = round(world.time / 36000)
					stat("Server Uptime:","[hours]:[minutes]:[seconds]")
					stat("===============================")
					var/YukigakureCount=0
					var/UzushioCount=0
					var/otocount=0
					var/DeserterCount=0
					var/amount=0
					for(var/mob/m in world)
						if(m.client) amount++
						if(m.Village=="Konohagakure") UzushioCount++
						if(m.Village=="Amegakure") YukigakureCount++
						if(m.Village=="Otogakure") otocount++
						if(m.Village=="Deserter") DeserterCount++
					stat("Village Count")
					stat("Konohagakure","[UzushioCount]")
					stat("Amegakure","[YukigakureCount]")
					stat("Otogakure","[otocount]")
					stat("Rogues","[DeserterCount]")
					stat("Players","[amount]")

			if(editing_databook)
				statpanel("Databook Pages")
				for(var/obj/databook_page/p in archive.contents)
					stat(p)

			if(view_archived_perks)
				statpanel("Archived Perks")
				for(var/obj/jutsu/J in archive.contents)
					if(J.jutsu_type == "perk") stat(J)

			if(view_available_squads)
				statpanel("Available Squads")
				for(var/squad/S in archive.squads)
					stat(S)

			if(view_archived_jutsu)
				statpanel("Archived Jutsu")
				for(var/obj/jutsu/J in archive.contents)
					if(J.jutsu_type <> "perk") stat(J)
			if(adminViewApps)
				statpanel("Admin Apps")
				for(var/jutsuApp/J in archive.contents)
					stat(J)

			if(view_archived_weapons)
				statpanel("Archived Weapons")
				for(var/obj/items/weapons/wep in archive.contents)
					stat(wep)

			if(view_archived_scrolls)
				statpanel("Archived Scrolls")
				for(var/obj/items/jutsu_scroll/scroll in archive.contents)
					stat(scroll)
		if(statpanel("[name]"))
			sleep(rand(4,6))
			stat("Name:","[src.name]")
			if(src.Clan!="None") stat("Clan","You are a member of the [Clan] clan")
			stat("Status","You're a [Class] ([get_rank_grade(src)]) of [Village]")
			stat(RANK)
			//stat("Influence Points:", infpoints)
			//stat("Jutsu Points:", jutsupoints)
			stat("Short description:","You appear as [strangerName]")
			if(Occupation!="None") stat("Occupation","You're a [Occupation]")

			stat("Missions Complete:","D:[missions_completed["D"]] C:[missions_completed["C"]] B:[missions_completed["B"]] A:[missions_completed["A"]] S:[missions_completed["S"]]")

			var/percentage_loss = calculate_percentage_loss()//round(percentage_decline * (years_into_decline / decline_period))
			stat("Age","You are [AgeReturn(Age)] ([100-percentage_loss]% body)")


			if(src.Profession=="None"|src.Profession=="")
			else stat("Profession","You are a [Profession]")
			//stat("Year:","[Year].[Month]")
			stat("Date:","[Day][Days(Day)] of [Months(Month)] in the year [Year+100]")
			stat("Time of Day:","[daytime]")

			if(archive.squads[squad])
				if(archive.squads[squad].mission)
					stat("Mission Status:","[archive.squads[squad].mission.message]")
/*
			var/atLocation = check_location()
			var/EnemiesNear = check_nearby_enemies()
			if(src.onMission)
				if(atLocation != "Yes")
					stat("Mission:","[AgeReturn(missionFail)] minute(s) remaining until mission failure.")
				else
					if(EnemiesNear == "Yes")
						stat("Mission:","Enemy's are nearby. The area must be secured before the mission can be completed.")
					else
						stat("Mission:","[AgeReturn(missionSuccess)] minute(s) remaining until mission completion.")*/


			//stat("Current Arc:","[archive.arc]")


		//	stat(STATISTICS)
		/*	if(ShowStats)
				stat("You have [lowertext(TextPercent(round(strpcnt)))] Physical Strength")
				stat("You have [lowertext(TextPercent(round(agipcnt)))] Agility")
				stat("You have [lowertext(TextPercent(round(offpcnt)))] Offence Ability")
				stat("You have [lowertext(TextPercent(round(defpcnt)))] Defence Ability")
					//	stat("*Chakra Atrributes*","")
				stat("You have [lowertext(TextPercent(round(conpcnt)))] Chakra Control")
				stat("You have [lowertext(TextPercent(round(respcnt)))] Chakra Defense")
					//	stat("*Jutsu Atrributes*","")
				stat("You have [lowertext(TextPercent(round(taipcnt)))] Taijutsu")
				stat("You have [lowertext(TextPercent(round(ninpcnt)))] Ninjutsu")
				stat("You have [lowertext(TextPercent(round(genpcnt)))] Genjutsu")*/
			if(timeskip)
				stat(timewarp)
			stat(INVENTORY)//stat(OOO)
			if(ShowInven)
				stat("--------")
				for(var/obj/items/O in src.contents)
					stat(O)
				for(var/obj/build/Housing/S in contents)
					stat(S)
				stat("--------")

		if(src.contactsOn)
			if(statpanel("Contacts"))
				stat("--------")
				stat("You can set people as contacts by setting their stranger name. You set stranger names by clicking their names in the IC chat box.")
				stat("This is meant for you, as a player, to help keep track of all the people you met, and have some remainders about them.")
				stat("If you wish to modify the contact entry, click on the name of the contact. You can disable seeing this tab using the Options button.")
				stat("--------")
				for(var/i in verifications)
					stat(contacts[i])

	/*	if(src.bountyOn)
			if(statpanel("Bounties"))
				stat("--------")
				stat("You can disable this by clicking the Options button. Those with bounties written here have posters scattered around the land mentioning them and their bounty, as well as being mentioned in the official bounty book. They are common knowledge.")
				stat("--------")
				for(var/obj/O in archive.bounty_list)
					stat(O)*/

		if(src.Byakugan)
			if(statpanel("Byakugan"))
				ShowInven=0
				ShowStats=0
				if(!byak_range_enhance)
					for(var/mob/M in oview(70))
						if(M.invisibility) continue
						stat(getStrangerName(M))
						//stat("Chakra:[round((M.Chakra/M.MaxChakra)*100)]%")
						stat("Location:([DirText(get_dir(src,M))])([get_dist(M,src)])")
						//if(M.Henge) stat("Transformed Individual")
						if(istype(M,/mob/Bunshin/)) stat("Illusionary Clone")
						stat("Chakra: [((M.chakra_current)/M.get_chakra()) * 100]%")
				else
					for(var/mob/M in world)
						if(M.z == src.z && get_dist(src,M) <= 70)
							if(M.invisibility) continue
							stat(getStrangerName(M))
							//stat("Chakra:[round((M.Chakra/M.MaxCfhakra)*100)]%")
							stat("Location:([DirText(get_dir(src,M))])([get_dist(M,src)])")
							//if(M.Henge) stat("Transformed Individual")
							if(istype(M,/mob/Bunshin/)) stat("Illusionary Clone")
							stat("Chakra: [((M.chakra_current)/M.get_chakra()) * 100]%")
				if(!byak_range_enhance2)
					for(var/mob/M in oview(300))
						if(M.invisibility) continue
						stat(getStrangerName(M))
						//stat("Chakra:[round((M.Chakra/M.MaxChakra)*100)]%")
						stat("Location:([DirText(get_dir(src,M))])([get_dist(M,src)])")
						//if(M.Henge) stat("Transformed Individual")
						if(istype(M,/mob/Bunshin/)) stat("Illusionary Clone")
						stat("Chakra: [((M.chakra_current)/M.get_chakra()) * 100]%")
				else
					for(var/mob/M in world)
						if(M.z == src.z && get_dist(src,M) <= 300)
							if(M.invisibility) continue
							stat(getStrangerName(M))
							//stat("Chakra:[round((M.Chakra/M.MaxCfhakra)*100)]%")
							stat("Location:([DirText(get_dir(src,M))])([get_dist(M,src)])")
							//if(M.Henge) stat("Transformed Individual")
							if(istype(M,/mob/Bunshin/)) stat("Illusionary Clone")
							stat("Chakra: [((M.chakra_current)/M.get_chakra()) * 100]%")
		if(src.bunshinList.len)
			if(statpanel("Clones"))
				for(var/mob/M in src.bunshinList)
					stat(M)
		if(src.Sharingan)
			if(statpanel("Sharingan"))
				ShowInven=0
				ShowStats=0
				for(var/mob/M in orange(7))
					if(M.invisibility) continue
					stat(getStrangerName(M))
				//	stat("Chakra:[round((M.Chakra/M.MaxChakra)*100)]%")
					//if(M.Henge) stat("Transformed Individual")
					if(istype(M,/mob/Bunshin/)) stat("Illusionary Clone")

		if(src.Akaigan)
			if(statpanel("Akaigan"))
				ShowInven=0
				ShowStats=0
				for(var/mob/M in orange(30))
					if(M.invisibility) continue
					stat("Health:[round((M.Health/M.MaxHealth)*100)]% ")
				//	stat("Chakra:[round((M.Chakra/M.MaxChakra)*100)]%")
					stat("Chakra Levels:[round((M.Chakra/Chakra))]x")
					stat("Stamina:[round((M.Stamina/M.MaxStamina)*100)]%")
					stat("Location:([DirText(get_dir(src,M))])")
		if(src.Shingan)
			if(statpanel("Sense"))
				ShowInven=0
				ShowStats=0
				if(Shingan == 1)
					for(var/mob/M in orange(10))
						if(M.invisibility) continue
						stat(getStrangerName(M))
						stat("Location:([DirText(get_dir(src,M))])([get_dist(M,src)])")
						stat("Chakra: [get_grade_stat((M.control+M.chakra_boost_pool() + M.stamina) / 2)] - [((M.chakra_current)/M.get_chakra()) * 100]%")
				if(Shingan == 2)


					for(var/mob/M in orange(35))
						if(M.invisibility) continue
						stat(getStrangerName(M))
						stat("Location:([DirText(get_dir(src,M))])([get_dist(M,src)])")
						stat("Chakra: [get_grade_stat((M.control+M.chakra_boost_pool() + M.stamina) / 2)] - [((M.chakra_current)/M.get_chakra()) * 100]%")
						//if(M.Henge) stat("Transformed Individual: [M.Oname]")
						if(istype(M,/mob/Bunshin/)) stat("Illusionary Clone")
				if(Shingan == 3)
					for(var/mob/M in world)
						if(M.z != z) continue
						if(M.invisibility) continue
						stat(getStrangerName(M))
						stat("Location:([DirText(get_dir(src,M))])([get_dist(M,src)])")
						stat("Chakra: [get_grade_stat((M.control+M.chakra_boost_pool() + M.stamina) / 2)] - [((M.chakra_current)/M.get_chakra()) * 100]%")
						//if(M.name != M.Oname) stat("Real Identity: [M.Oname]")
						//if(M.Henge) stat("Transformed Individual: [M.Oname]")
						if(istype(M,/mob/Bunshin/)) stat("Illusionary Clone")
				if(Shingan == 4)
					for(var/mob/M in world)
						if(M.invisibility) continue
						stat(getStrangerName(M))
						stat("Location:([DirText(get_dir(src,M))])([get_dist(M,src)])")
						stat("Chakra: [get_grade_stat((M.control+M.chakra_boost_pool() + M.stamina) / 2)] - [((M.chakra_current)/M.get_chakra()) * 100]%")
						//if(M.name != M.Oname) stat("Real Identity: [M.Oname]")
						//if(M.Henge) stat("Transformed Individual: [M.Oname]")
						if(istype(M,/mob/Bunshin/)) stat("Illusionary Clone")

		if(src.Kagura)
			if(statpanel("Sense"))
				ShowInven=0
				ShowStats=0
				if(Kagura == 1)
					for(var/mob/M in orange(35))
						if(M.invisibility) continue
						stat(getStrangerName(M))
						stat("Location:([DirText(get_dir(src,M))])([get_dist(M,src)])")
						stat("Chakra: [get_grade_stat((M.control+M.chakra_boost_pool() + M.stamina) / 2)] - [((M.chakra_current)/M.get_chakra()) * 100]%")
				if(Kagura == 2)


					for(var/mob/M in world)
						if(M.z == src.z && get_dist(src,M) <= 60)
							if(M.invisibility) continue
							stat(getStrangerName(M))
							stat("Location:([DirText(get_dir(src,M))])([get_dist(M,src)])")
							stat("Chakra: [get_grade_stat((M.control+M.chakra_boost_pool() + M.stamina) / 2)] - [((M.chakra_current)/M.get_chakra()) * 100]%")
							//if(M.Henge) stat("Transformed Individual: [M.Oname]")
							if(istype(M,/mob/Bunshin/)) stat("Illusionary Clone")
				if(Kagura == 3)


					for(var/mob/M in world)
						if(M.z == src.z && get_dist(src,M) <= 100)
							if(M.invisibility) continue
							stat(getStrangerName(M))
							stat("Location:([DirText(get_dir(src,M))])([get_dist(M,src)])")
							stat("Chakra: [get_grade_stat((M.control+M.chakra_boost_pool() + M.stamina) / 2)] - [((M.chakra_current)/M.get_chakra()) * 100]%")
							//if(M.Henge) stat("Transformed Individual: [M.Oname]")
							if(istype(M,/mob/Bunshin/)) stat("Illusionary Clone")



proc/DirText(num)
	if(!isnum(num)) return
	if(num==NORTH) return "North"
	if(num==EAST) return "East"
	if(num==WEST) return "West"
	if(num==SOUTH) return "South"
	if(num==SOUTHEAST) return "South-east"
	if(num==SOUTHWEST) return "South-west"
	if(num==NORTHEAST) return "North-east"
	if(num==NORTHWEST) return "North-west"
	return "Unknown"
proc/TextPercent(num)
	if(!isnum(num)) return 0
	if(num<=5) return "Very Poor"
	if(num<=15&&num>5) return "Poor"
	if(num<=20&&num>15) return "Below Average"
	if(num<=35&&num>20) return "Average"
	if(num<=45&&num>35) return "Above Average"
	if(num<=55&&num>45) return "Good"
	if(num<=65&&num>55) return "Very Good"
	if(num<=75&&num>65) return "Exceptional"
	if(num>75) return "Incredible"

proc/ChakraText(num)
	if(!isnum(num)) return 0
	if(num<=5) return "Absolutely Drained"
	if(num<=15&&num>5) return "Near-empty"
	if(num<=20&&num>15) return "Very Drained"
	if(num<=35&&num>20) return "Drained"
	if(num<=45&&num>35) return "Halved"
	if(num<=55&&num>45) return "Fine"
	if(num<=65&&num>55) return "Plenty"
	if(num<=75&&num>65) return "Close-to full"
	if(num<=99&&num>75) return "Brimming"
	if(num>=100) return "Full"

proc/StaminaText(num)
	if(!isnum(num)) return 0
	if(num<=5) return "Passing Out"
	if(num<=15&&num>5) return "Exhausted"
	if(num<=20&&num>15) return "Very Fatigued"
	if(num<=35&&num>20) return "Fatigued"
	if(num<=45&&num>35) return "Weary"
	if(num<=55&&num>45) return "Tired"
	if(num<=65&&num>55) return "Drowsy"
	if(num<=75&&num>65) return "Rested"
	if(num<=99&&num>75) return "Well Rested"
	if(num>=100) return "Energetic"

proc/HealthText(num)
	if(!isnum(num)) return 0
	if(num<=5) return "Dying"
	if(num<=20&&num>5) return "Gravely Injured"
	if(num<=30&&num>20) return "Very Injured"
	if(num<=40&&num>30) return "Badly Injured"
	if(num<=50&&num>40) return "Injured"
	if(num<=60&&num>50) return "Wounded"
	if(num<=70&&num>60) return "Scratched"
	if(num<=80&&num>70) return "Fairly Healthy"
	if(num<=90&&num>80) return "Healthy"
	if(num<100&&num>90) return "Very Healthy"
	if(num>=100) return "in Perfect Condition"


proc/AgeReturn(num)
	if(!isnum(num)) return 0
	if(num==1) return "One"
	if(num==2) return "Two"
	if(num==3) return "Three"
	if(num==4) return "Four"
	if(num==5) return "Five"
	if(num==6) return "Six"
	if(num==7) return "Seven"
	if(num==8) return "Eight"
	if(num==9) return "Nine"
	if(num==10) return "Ten"
	if(num==11) return "Eleven"
	if(num==12) return "Twelve"
	if(num==13) return "Thirteen"
	if(num==14) return "Fourteen"
	if(num==15) return "Fifteen"
	if(num==16) return "Sixteen"
	if(num==17) return "Seventeen"
	if(num==18) return "Eighteen"
	if(num==19) return "Nineteen"
	if(num==20) return "Twenty"
	if(num==21) return "Twenty-one"
	if(num==22) return "Twenty-two"
	if(num==23) return "Twenty-three"
	if(num==24) return "Twenty-four"
	if(num==25) return "Twenty-five"
	if(num==26) return "Twenty-six"
	if(num==27) return "Twenty-seven"
	if(num==28) return "Twenty-eight"

	if(num==29) return "Twenty-nine"
	if(num==30) return "Thirty"
	if(num==31) return "Thirty-one"
	if(num==32) return "Thirty-two"
	if(num==33) return "Thirty-three"
	if(num==34) return "Thirty-four"
	if(num==35) return "Thirty-five"
	if(num==36) return "Thirty-six"
	if(num==37) return "Thirty-seven"

	if(num==38) return "Thirty-eight"
	if(num==39) return "Thirty-nine"
	if(num==40) return "Fourty"
	if(num==41) return "Fourty-one"
	if(num==42) return "Fourty-two"
	if(num==43) return "Fourty-three"
	if(num==44) return "Fourty-four"
	if(num==45) return "Fourty-five"
	if(num==46) return "Fourty-six"

	if(num==47) return "Fourty-seven"
	if(num==48) return "Fourty-eight"
	if(num==49) return "Fourty-nine"
	if(num==50) return "Fifty"
	if(num==51) return "Fifty-one"
	if(num==52) return "Fifty-two"
	if(num==53) return "Fifty-three"
	if(num==54) return "Fifty-four"
	if(num==55) return "Fifty-five"

	if(num==56) return "Fifty-six"
	if(num==57) return "Fifty-seven"
	if(num==58) return "Fifty-eight"
	if(num==59) return "Fifty-nine"
	if(num==60) return "Sixty"
	if(num==61) return "Sixty-one"
	if(num==62) return "Sixty-two"
	if(num==63) return "Sixty-three"
	if(num==64) return "Sixty-four"

	if(num==65) return "Sixty-five"
	if(num==66) return "Sixty-six"
	if(num==67) return "Sixty-seven"
	if(num==68) return "Sixty-eight"
	if(num==69) return "Sixty-nine"
	if(num==70) return "Seventy"
	if(num==71) return "Seventy-one"
	if(num==72) return "Seventy-two"
	if(num==73) return "Seventy-three"

	if(num==74) return "Seventy-four"
	if(num==75) return "Seventy-five"
	if(num==76) return "Seventy-six"
	if(num==77) return "Seventy-seven"
	if(num==78) return "Seventy-eight"
	if(num==79) return "Seventy-nine"
	if(num==80) return "Eighty"
	if(num==81) return "Eighty-one"
	if(num==82) return "Eighty-two"

	if(num==83) return "Eighty-three"
	if(num==84) return "Eighty-four"
	if(num==85) return "Eighty-five"
	if(num==86) return "Eighty-six"
	if(num==87) return "Eighty-seven"
	if(num==88) return "Eighty-eight"
	if(num==89) return "Eighty-nine"
	if(num==90) return "Ninety"
	if(num==91) return "Ninety-one"

	if(num==92) return "Ninety-two"
	if(num==93) return "Ninety-three"
	if(num==94) return "Ninety-four"
	if(num==95) return "Ninety-five"
	if(num==96) return "Ninety-six"
	if(num==97) return "Ninety-seven"
	if(num==98) return "Ninety-eight"
	if(num==99) return "Ninety-nine"
	if(num==100) return "One-hundred"