mob/var/AdminRewardViewing
mob/var/AdminTicketSelected
mob/var/AdminNotes=""
/archive/var/affinitymultiplier = 1
client
	Click(A,B,C)
		if(C == "Perk2.PerkGrid")
			if(istype(A,/obj/jutsu))
				if(usr.Admin)
					var/list/players=list()
					for(var/mob/ZZ in world)
						players+=ZZ
					var/mob/M = input("Choose a player") as mob in world
					if(!istype(A,/obj/jutsu)) return
					switch(input("Are you sure you want to give [M] the perk [A]?") in list ("Yes","No"))
						if("Yes")
							var/obj/Perk/O=copyatom(A)
							M:contents+=O
							for(var/mob/MM in world) if(MM.Admin) MM<< {"<font color=#F88017>[usr] gives [A] to [M]."}
							Admin_Logs+="<br>[usr]([usr.key]) gives [A] to [M]."
							SaveLogs()
						else
							return
			if(istype(A,/obj/items/jutsu_scroll))
				if(usr.Admin)
					var/list/players=list()
					if(!istype(A,/obj/items/jutsu_scroll)) return
					for(var/mob/ZZ in world)
						players+=ZZ
					var/mob/M = input("Choose a player") as mob in world
					switch(input("Are you sure you want to give [M] the perk [A]?") in list ("Yes","No"))
						if("Yes")
							var/obj/Perk/O=copyatom(A)
							M:contents+=O
							for(var/mob/MM in world) if(MM.Admin) MM<< {"<font color=#F88017>[usr] gives [A] to [M]."}
							Admin_Logs+="<br>[usr]([usr.key]) gives [A] to [M]."
							SaveLogs()
						else
							return
			if(istype(A,/mob/))
				if(usr.Admin)
					winset(usr, "MobGrid", "cells=0x0")
					winset(usr,"MobView","is-visible=true")
					usr << output(A,"MobGrid:1,1")
					usr.AdminRewardViewing=A
					var/list/rewardlist=list()
					var/total=0
					var/average=0
					for(var/mob/M in world)
						if(M.client)
							rewardlist+=M.lifetime_progress_points
							total+=M.lifetime_progress_points
					average = "[round(total/rewardlist.len)]"
					usr << output(null,"MobView.average")
					usr << output(null,"MobView.difference")
					usr << output(average,"MobView.average")
					usr << output("[round((total/rewardlist.len) - A:lifetime_progress_points)]","MobView.difference")
					usr<<output(null,"MobView.LogCheck")
					usr:ViewPlayerRPLog(A)
					usr << output(null,"MobView.AdminNotes")
					usr << output(A:AdminNotes,"MobView.AdminNotes")
//		if(C == "NewHelps.NewHelpsGrid" || C == "UpdatedHelps.UpdatedHelpsGrid" || C == "ResolvedHelps.ResolvedHelpsGrid" )
		//	if(istype(A,/obj/GMHelp))
			//	usr.AdminTicketSelected = A
		//		usr << output(null,"GMHelps.GMHelpUser")
		//		usr << output(null,"GMHelps.GMHelpTitle")
		//		usr << output(null, "GMHelps.GMHelpOutput")
		//		usr << output("[A:name]","GMHelps.GMHelpTitle")
			//	usr << output("Key: [A:user] IC: [A:playername]","GMHelps.GMHelpUser")
			//	for(var/msg in A:responses)
		//			usr << output(msg, "GMHelps.GMHelpOutput")
		..()



/*
mob/Admin6
	verb
		SQLTEST()
			set category = "Admin6"
			var/database/db = new ("SSO.db")
			var/database/query/q = new
			world << "[usr.contents]"
			q.Add("INSERT INTO players (name, village, ckey, icon, x, y, z, contents) VALUES (?,?,?,?,?,?,?,?)", usr.name, usr.Village, usr.ckey, usr.icon, usr.x, usr.y, usr.z, usr.contents)
			world << q
			q.Execute(db)
		AddSQLPerkDB()
			set category = "Admin6"
			var/database/db = new ("SSO.db")
			var/database/query/q = new
			var perkicon = input("Please select an icon.") as icon
			var perkname = input("Please select a name") as message
			var stamina_req = input("Please input stamina req") as num
			world << "[usr.contents]"
			q.Add("INSERT INTO perks (name, icon, stamina_req) VALUES (?,?,?)", perkname, perkicon, stamina_req)
			world << q
			q.Execute(db)
		GetSQLPerkDB()
			set category = "Admin6"
			var/database/db = new ("SSO.db")
			var/database/query/q = new
			q.Add("SELECT * FROM perks")
			q.Execute(db)
			while(q.NextRow())
				var/row = q.GetRowData()
				world << q
				world << "test"
				world << row["name"]
				var/obj/jutsu/NewJutsu = new/obj/jutsu(archive)
				NewJutsu.name=row["name"]
				NewJutsu.stamina_req=row["stamina_req"]
				NewJutsu.icon=row["icon"]
				NewJutsu.jutsu_type = "perk"
				world << NewJutsu.name
				*/
/*
mob/Admin5
	verb
		Adjust_Affinity_Multiplier()
			set category = "Admin"
			var/newvalue = input("What is the new value? It is currently [archive.affinitymultiplier]") as num
			if(newvalue == 0)
				usr << "If this was 0 perks would be free."
				return
			archive.affinitymultiplier = newvalue
			archive.save_archive()
*/
mob/Admin3
	verb
		Make_Samurai(mob/M in world)
			set category = "Admin"
			M.contents+=new/obj/items/Weapon/Katana
			M.contents+=new/obj/items/Clothing/Samurai_Robe
			M.contents+=new/obj/items/Weapon/Tanto

		RewardTimerMinusPlusMagic()
			set hidden = 1
			var/Time=input("What is the amount?") as num
			usr << "You input [Time], world realtime is [world.realtime] <br>The difference is [world.realtime - Time].	"
		Player_Progress(var/mob/M in world)
			set category = "Admin"
			M.CanProgress=!M.CanProgress
			usr << "[M] [M.CanProgress ? "can" : "cannot"] progress now."
			for(var/mob/X in world)
				if(X.Admin)
					X << "[usr] has turned [M]'s progress [M.CanProgress ? "on" : "off"]"
			Admin_Logs+="[usr] has turned [M]'s progress [M.CanProgress ? "on" : "off"]"
		VillageCount()
			set category = "Admin"
			var/amount=0
			var/YukigakureCount=0
			var/UzushioCount=0
			var/otocount=0
			var/DeserterCount=0
			for(var/mob/m in world)
				if(m.client) amount++
				if(m.Village=="Uzushiogakure") UzushioCount++
				if(m.Village=="Yukigakure") YukigakureCount++
				if(m.Village=="Otogakure") otocount++
				if(m.Village=="Deserter") DeserterCount++
			usr << "Players: [amount]"
			usr << "Uzushiogakure: [UzushioCount]"
			usr << "Yukigakure: [YukigakureCount]"
			usr << "Otogakure: [otocount]"
			usr << "Rogues: [DeserterCount]"
		RewardSelected()
			set hidden=1
			if(usr.AdminRewardViewing)
				usr:Reward(usr.AdminRewardViewing)
			else
				usr << "ERROR"


		Create_Custom_Jutsu()
			var
				JIcon
				CustomIcon
				JPower=0
				JImpact
				JDmg
				JDef
				JGenPower
				learnreq
			set category = "Admin"
			var/JName=input("What is the Jutsu's name, preferable in English?","English Name")
			var/JName2=input("What is the Jutsu's Name var? This should be Japanese.","Weeb Name")
			switch(input("Is this a Genjutsu?","Genjutsu") in list ("Yes","No"))
				if("Yes")
					JGenPower=input("What is the Genjutsu's power?","Jutsu Rank")
					JPower=1
				if("No")
					JDmg=input("Enter the damage ranking.","Damage")
					JDef=input("Enter the defense ranking.","Defense")
			switch(input("Do you have an icon for this?","Icon") in list ("Yes","No"))
				if("Yes")
					JIcon=input("What is the icon for this perk?","Icon") as icon
					CustomIcon=1
				if("No")
					CustomIcon=0
			var/JRank=input("What is the Jutsu's rank?","Jutsu Rank") in list ("S","A","B","C","D","E")
			var/JSuffix=input("Insert additional Admin Only information for the jutsu.","Suffix") as message
			var/JDesc=input("Enter the Description for the Jutsu","Description") as message
			var/JSDrain=input("Enter the Chakra/Stamina drain.","Chakra and Stamina")
			var/JSpeed=input("Enter the Speed.","Speed")
			var/JTD=input("Enter the Turn Duration","Turn DURATION!")
			var/JMas=input("How many Jutsu Points would it take to master this technique?") as num
			var/JNotes=input("Enter some extra notes about the Jutsu!","Notes") as message
			var/JColor=""
			if(JRank=="S")
				JColor = "red"
				learnreq = 1200
			if(JRank=="A")
				JColor="red"
				learnreq = 600
			if(JRank=="B")
				JColor="blue"
				learnreq = 300
			if(JRank=="C")
				JColor="green"
				learnreq = 150
			if(JRank=="D")
				JColor="grey"
				learnreq = 50
			else
				JColor="white"
			var/obj/jutsu/NewJutsu = new/obj/jutsu(archive)
			NewJutsu.name=JName2
			NewJutsu.suffix=JSuffix
			NewJutsu.mastery_cost = JMas
			if(CustomIcon)
				NewJutsu.icon=JIcon
			else
				NewJutsu.icon='NoIcon.png'
			if(JPower)
				JImpact = "Power: [JGenPower]"
			else
				JImpact = "Damage: [JDmg] Defense: [JDef]"

			NewJutsu.desc={"<font color=white><b><font face="Arial"><font size=1>[JName]</b></font>
<font color=[JColor]><i><font face="Arial"><font size=1>[JRank]-Rank</i></font>
<font color=white><font face="Arial"><font size=1><u><b>Jutsu Information<br></u></b></font>
[JDesc]
<center><font color=white><font face="Tahoma"><font size=1><b><Font color=#A81C1C>\[[JImpact]] <font color=#50CDF3>\[Chakra/Stamina Cost: [JSDrain]]
<font color=#2EC13A>\[Speed: [JSpeed]] <font color=#768177> \[Turn Duration: [JTD]] </b></font><br>
 [JNotes]</center>"}
			NewJutsu.learn_req = learnreq
			archive.save_archive()
		Edit_Mastery_Cost()
			set category ="Admin"
			var/tmp/list/ref = list()
			for(var/obj/jutsu/X in archive.contents)
				ref += X
			var/obj/jutsu/choice = input("Which jutsu would you like to edit?") in ref
			var/choice2 = input("[choice.mastery_cost] jutsu points are needed to master this jutsu currently. What would you like to change it to?") as num
			choice.mastery_cost = choice2

		RewardHistory()
			set category = "Admin"
			winset(usr, "PerkGrid", "cells=0x0")
			var/height = 1
			var/width = 0
			var/list/playerrewards=new/list()
			var/Dayz = input("How many days since players last reward?","Days") as num
			for(var/mob/M in world)
				if(M.client)
					if(Dayz<=round((world.realtime - M.LastRewardTime)/864000))
						playerrewards+=M
			winset(usr,"Perk2","is-visible=true")
			for(var/mob/X in playerrewards)
				if(width>=2)
					width=0
					height+=1
				usr << output(X,"PerkGrid:[++width],[height]")
				usr << output("<font color=white>[X] | Days Passed: [round((world.realtime - X.LastRewardTime)/864000)] | PP: [X.lifetime_progress_points] | Last Reward: [X.LastAdminReward]", "PerkGrid:[++width],[height]")
		CloseMobView()
			set hidden = 1
			winset(usr, "MobGrid", "cells=0x0")
			winset(usr,"MobView","is-visible=false")
			usr << output(null,"MobView.average")
			usr << output(null,"MobView.difference")
			usr<<output(null,"MobView.LogCheck")
			usr << output(null,"MobView.AdminNotes")
		AddNote()
			set hidden = 1
			usr:NoteAdd(usr.AdminRewardViewing)
		ClearNote()
			set hidden = 1
			usr:NoteClear(usr.AdminRewardViewing)

		NoteAdd(mob/M in world)
			set hidden = 1
			var/notes=input("What notes do you want to add? Blank to cancel") as message
			if(notes)
				M.AdminNotes+="[notes]<br>"
		NoteClear(mob/M in world)
			set hidden = 1
			switch(input("Are you sure you want to clear [M]'s notes?") in list ("Yes","No"))
				if("Yes")
					M.AdminNotes=""
				if("No") return
		ViewPlayerRPLog(mob/M in world)
			set category="Admin"
			set hidden = 1
			var/wtf=0
			var/list/Blah=new
			var/View={"<html>
	<head><title></head></title><body>
	<body bgcolor="#000000"><font size=3><font color="#0099FF"><font size=-1><b><i>
	<font color="#00FFFF">**[M]'s Logged Activities**<br>
	</body><html>"}

			LOLWTF
			wtf+=1
			var/XXX=file("Saga/SelfRPLogs/[M.ckey]/[M.ckey][wtf].txt")
			if(fexists(XXX))
				Blah.Add(XXX)
				goto LOLWTF
			else
				if(Blah&&wtf>1)
					var/lawl=input("What one do you want to read?") in Blah
					var/ISF=file2text(lawl)
					View+=ISF
					usr<<"[File_Size(lawl)] File [lawl]"
					usr<<output(View,"MobView.LogCheck")
					SAdmin_Logs+="<br>[usr]([usr.key]) uses views [M]'s playerlogs. ([time2text(world.realtime)])"
					for(var/mob/MM in world) if(MM.ckey=="LordMachiavelli") MM<< {"<font color=#F88017>[src] views [M]'s playerlog."}
				else
					usr<<"No logs found for [M.ckey]"
