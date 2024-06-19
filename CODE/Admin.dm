#define DEBUG


var/autogenin= 0
var/autogeninvalue= 0
var/list/ActiveVillages=list("Iwagakure", "Amegakure", "Akihabara")//"Uzushiogakure" , "Yukigakure") //("Konohagakure", "Kirigakure", "Sunagakure", "Ancestor Village")
var/list/InactiveVillages=list()
mob/var/LastAdminReward = 0
mob/var/LastRewardTime = 0
mob/var/oicon=null
mob/var/Muted = 0
mob/var/Admin = 0
mob/var/Tab = 1
mob/var/selected = 0
mob/var/Type
mob/var/toggleViewing = 1
mob/var/togglePlayerTab = 1
mob/var/toggleServerTab = 1
var/list/UnBanables=list("spiralord")
var/list/UnStripables=list("spiralord","","","")
var/list/UnMuteables=list("spiralord","","","","")
var/list/UnBootables=list("spiralord","","","","")
var/adminlog={"<html><title>Admin log</title><body>
"}
var/SAdmin_Logs={"<html><title>Admin log</title><body>
"}
var/RyoLogs={"<html><title>Ryo log</title><body>
"}
var/list/Admin1s=list()
var/list/Admin2s=list()
var/list/Admin3s=list()
var/list/Mutes=new
var/list/Muted_Keys=list()
var/list/KonoNin=list()
var/list/SunaNin=list()
var/list/KiriNin=list()
var/list/Muted_IPs=list()
client/verb/Mass_Page()
	set category="Admin"
	set hidden=1
//		var/s=input("What message?")as text
//		SendPage("[s] [world.url]",Spam)
proc/SaveMute()
	var/savefile/A = new ("Muted Keys.sav")
	A["Muted Keys"]<< Muted_Keys
	var/savefile/B = new ("Muted IPs.sav")
	B["Muted IPs"]<< Muted_IPs
	var/savefile/C = new ("Suggestions.sav")
	C["Suggestions"]<< Suggestions
	var/savefile/D = new ("KonoNin.sav")
	D["KonoNin"]<< KonoNin
	var/savefile/E = new ("SunaNin.sav")
	E["SunaNin"]<< SunaNin
	var/savefile/F = new ("KiriNin.sav")
	F["KiriNin"]<< KiriNin
	var/savefile/V = new ("VillageStatus.sav")
	V["Active"] << ActiveVillages
	V["Inactive"] << InactiveVillages

proc/message_admins(t as text)
	for(var/mob/M in world)
		if(M.Admin)
			M<<"[t]"
mob/proc
	resetLuminosity()
		teleporting = 0
		//spawn(2)
		//	var/Torch=0
		//	for(var/obj/items/Weapon/Torch/T in contents)
		//		if(T.worn) Torch=1

proc/public_admin_log(msg)
	for(var/mob/m) if(m.Admin) m<< "<font color=#F88017>[msg]"
	Admin_Logs += "<br>\[[time2text(world.realtime, "DD/MM/YY hh:mm:ss")]\] [msg]"

proc/LoadMute()
	if(fexists("Muted Keys.sav"))
		var/savefile/F =new("Muted Keys.sav")
		F["Muted Keys.sav"]>> Muted_Keys
	if(fexists("Muted IPs.sav"))
		var/savefile/F = new("Muted IPs.sav")
		F["Muted IPs.sav"]>> Muted_IPs
	if(fexists("Spam"))
		var/savefile/S=new("Spam")
		S["Spam"]>>Spam
	if(fexists("Suggestions"))
		var/savefile/S=new("Suggestions")
		S["Suggestions"]>>Suggestions
	if(fexists("KonoNin"))
		var/savefile/S=new("KonoNin")
		S["KonoNin"]>>KonoNin
	if(fexists("SunaNin"))
		var/savefile/S=new("SunaNin")
		S["SunaNin"]>>SunaNin
	if(fexists("KiriNin"))
		var/savefile/S=new("KiriNin")
		S["KiriNin"]>>KonoNin

	if(fexists("VillagesStatus.sav"))
		var/savefile/V = new ("VillageStatus.sav")
		V["Active"] >> ActiveVillages
		V["Inactive"] >> InactiveVillages


mob/proc/Mute_Check()
	if(src.key in Muted_Keys)
		if(src.client.address in Muted_IPs)
			usr<<"<font color=red><B>You are still Muted."
			src.Muted=1
		else
			Muted_IPs+=src.client.address
			usr<<"<font color=red><B>You are still Muted."
			src.Muted=1
	if(src.client.address in Muted_IPs)
		if(src.key in Muted_Keys)
			src.Muted=1
			usr<<"<font color=red><B>You are still Muted."
		else
			Muted_Keys+=src.key
			src.Muted=1
			usr<<"<font color=red><B>You are still Muted."
mob/proc/AdminCheck()
//	if(key == worldHost)
//		AdminGive(3)
//		src<<"Thanks for hosting your own server. Any feedback, questions or suggestions should be posted to our <a href=http://www.byond.com/forum/C_man66/ShinobiSSO>BYOND forum</a>."
	if(key in Admin1s) AdminGive(1)
	if(key in Admin2s) AdminGive(2)
	if(key in Admin3s) AdminGive(3)
	if(key in EventAdmins) EventAdminGive()
	if(key in list(""))EventAdminGive(1)
	if(key in list("Sidious26","EC Kusurou", "Delphonse" ))AdminGive(2) // This is Moderator / CM Level
	if(key in list("Spiralord", "Rosehaven", "Hanza Sky", "Katnappe", "Sidious26", "Kristuria")) AdminGive(3) // This is Administrator Level
	if(key in list("Spiralord", "CConlin216", "ZennGod", "Are You Done Yet", "ChainsOfMadness", "Katnappe")) AdminGive(4) // This is Head Admin Level
	if(key in list("Spiralord")) AdminGive(5) //This is Owner level
	if(key in list("Spiralord")) AdminGive(6) //This is debugging level verbs. Whoever can be in here. Just me for now because I'm me.
mob/proc/AdminGive(var/Z)
	src.AdminRemove()
	src.Admin=Z
	if(Z==1)
		src.verbs+=typesof(/mob/Admin1/verb)
		Admin1s+=src.key
	if(Z==2)
		src.verbs+=typesof(/mob/Admin1/verb,/mob/Admin2/verb)
		Admin2s+=src.key
	if(Z==3)
		src.verbs+=typesof(/mob/Admin1/verb,/mob/Admin2/verb,/mob/Admin3/verb)
		Admin3s+=src.key
	if(Z==4)
		src.verbs+=typesof(/mob/Admin1/verb,/mob/Admin2/verb,/mob/Admin3/verb,/mob/Admin4/verb)
		src.Admin=4
	if(Z==5)
		src.verbs+=typesof(/mob/Admin1/verb,/mob/Admin2/verb,/mob/Admin3/verb,/mob/Admin4/verb,/mob/Admin5/verb)
		src.Admin=5
	if(Z==6)
		src.verbs+=typesof(/mob/Admin1/verb,/mob/Admin2/verb,/mob/Admin3/verb,/mob/Admin4/verb,/mob/Admin5/verb,/mob/Admin6/verb)
		src.Admin=6

mob/proc/AdminRemove()
	src.verbs-=typesof(/mob/Admin1/verb,/mob/Admin2/verb,/mob/Admin3/verb,/mob/Admin4/verb,/mob/Admin5/verb)
	src.Admin=0
	Admin1s-=src.key
	Admin2s-=src.key
	Admin3s-=src.key

proc/Save_Admins()
	var/savefile/F=new("SSO/Admins")
	F["1"]<<Admin1s
	F["2"]<<Admin2s
	F["3"]<<Admin3s
	F["6"]<<EventAdmins
proc/Load_Admins() if(fexists("SSO/Admins"))
	var/savefile/F=new("SSO/Admins")
	F["1"]>>Admin1s
	F["2"]>>Admin2s
	F["3"]>>Admin3s
	F["6"]>>EventAdmins

mob/Admin4/verb
	ManuallyRemoveEventAdmin()
		set category="Admin"
		var/list/Adminz=list()
		Adminz.Add(EventAdmins)
		var/Choice=input("Remove which Admin?") as null|anything in Adminz
		if(Choice==null)return
		EventAdmins -= Choice
	Announcement()
		set category="Admin"
		var/A = input("What would you like to announce?") as message
		if(A=="")
			return
		world<<"<hr>"
		world << "<center><font color=red>[usr.displaykey] announces:"
		world << "<center><font color=red>[A]"
		world << "<hr>"
	Strip_Head_GM_Help(mob/M in world)
		set category ="Admin"
		if(M.canhahelp)
			src<<"You have stripped [M] of his Head GM Help privileges."
			M.canhahelp = 0
		else
			src<<"[M] is currently stripped of this."
	Restore_Head_GM_Help(mob/M in world)
		set category ="Admin"
		if(!M.canhahelp)
			src<<"You have restored [M]'s ability to use Head GM Help."
			M.canhahelp = 1
		else
			src<<"[M] already has this privilege."

	/*Set_Soft_Cap()
		set category = "Admin"
		var/choice = input("What would you like the new soft cap to be?") as num
		archive.global_stat_cap = choice*/


mob/var/tmp/Spying

var/list/rpFlags=list()

mob/Admin3/verb

	AddToScrollLibrary()
		set category ="Admin"
		var/tmp/list/ref = list()
		for(var/obj/jutsu/A in archive.contents)
			ref += A
		var/choice = input("Choose a village library.") in list(/*"Konoha", "Kiri",*/ "Suna","Yuki")
		switch(choice)
			if("Rogue")
				var/obj/jutsu/X = input("Choose a jutsu to add.") in ref
				archive.roguescrollinv += X
				alert("You have added [X] to the Rogue Library.")
			if("Uzushiogakure")
				var/obj/jutsu/X = input("Choose a jutsu to add.") in ref
				archive.uzushiogakurescrollinv += X
				alert("You have added [X] to the Uzushiogakure Library.")
			if("Otogakure")
				var/obj/jutsu/X = input("Choose a jutsu to add.") in ref
				archive.otogakurescrollinv += X
				alert("You have added [X] to the Otogakure Library.")
			if("Yukigakure")
				var/obj/jutsu/X = input("Choose a jutsu to add.") in ref
				archive.yukigakurescrollinv += X
				alert("You have added [X] to the Yukigakure Library.")
	Edit_Combat_Rules()
		set category ="Admin"
		combatrules = input("Editting Combat Rules...") as message
		SaveCRules()

	Archive_Poisons(obj/items/Poisons/J in world)
		set category = "Admin"
		if(!istype(J, /obj/items/Poisons))
			usr << "Error"
			return
		for(var/obj/items/Poisons/poison in archive.contents)
			if(poison.name == J.name)
				usr << "There is already a poison with this name archived. Delete it or rename to bypass this."
				return

		archive.contents += J
		archive.save_archive()
		usr << "[J] has been added to the poison archive."
		world.log << "[J.name] has been saved to the poison archives."
		message_admins("[usr.key] has saved [J] to the poison archives.")
		Admin_Logs+="<br>[usr]([usr.key]) archived the [J.name] poison."
		SaveLogs()

	Archive_Armor(obj/items/Clothing/J in world)
		set category = "Admin"
		if(!istype(J, /obj/items/Clothing))
			usr << "Error"
			return

		for(var/obj/items/Clothing/cloth in archive.contents)
			if(cloth.name == J.name)
				usr << "There is already a clothing with this name archived. Delete it or rename to bypass this."
				return

		archive.contents += J
		archive.save_archive()
		usr << "[J] has been added to the clothing archive."
		world.log << "[J.name] has been saved to the clothing archives."
		message_admins("[usr.key] has saved [J] to the clothing archives.")
		Admin_Logs+="<br>[usr]([usr.key]) archived the [J.name] clothing."
		SaveLogs()

mob/Admin1/
	verb

		AdminRoleplayFlag()
			set hidden = 1


var/TeachingOff = 0
mob/Admin3
	verb
		Toggle_Village()
			set category = "Admin"
			switch(input("Do you want to turn a village on or off?") in list ("On","Off"))
				if("On")
					var/choice = input("Enable which village?") in InactiveVillages
					if(choice == "Cancel")
						return
					InactiveVillages -= choice
					ActiveVillages += choice
					for(var/mob/M in world)
						M << "[choice] has been enabled!"
				if("Off")
					var/choice = input("Disable which village?") in ActiveVillages
					ActiveVillages-=choice
					InactiveVillages+=choice
					for(var/mob/M in world)
						M << "[choice] has been disbaled!"
		Setup_Char(var/mob/M in world)
			set category = "Admin"
			set name = "Make Bandit"
			for(var/obj/items/Ryo/R in M.contents)
				R.amount+=rand(2060,3070)
				R.Update()
			var/bonus = 80

			M.progress_points += bonus
			M.lifetime_progress_points += bonus
			M.stat_points += bonus
			M<<"Hello wannabe rogue! You're all set up now. There aren't many rules. First, you need to screw up people's day. Kill them, maim them, rob them, or find any number of horrible things that make the world seem dangerous. You can band together, throw yourself on Konoha's gates and die, or spread out and do something with your lives. One rule though. You can't join a village, and you can't become a regular character. We'll brand you with a perk, so we'll know who is who."
			M.givePerk("Bandit")
		MultiKeyCheck()
			set category = "Admin"
			set desc = "Check all Player for Multi Keying"
			var/Found[0]
			for(var/mob/M in world)
				if(Found.Find(M))continue
				if(M.client)
					for(var/mob/M2 in world)
						if(!M2.client)continue
						if(!M2)continue
						if(M == M2)continue
						if(M.client.address == M2.client.address)
							Found += M
							Found += M2
							src << "<B>\red Match Found!"
							src << "<B><font color = #999999>Name:</font> [M.name] <B><font color = #999999>- Key:</font> [M.key] <B><font color = #999999>- Address:</font>."
							src << "<B><font color = #999999>Name:</font> [M2.name] <B><font color = #999999>- Key:</font> [M2.key] <B><font color = #999999>- Address:</font>."
		ViewIPs()
			set category="Admin"
			return

mob/Admin4
	verb
		Toggle_Teaching()
			set category = "Admin"
			switch(input("On or off?") in list ("On","Off"))
				if("On")
					TeachingOff = 0
				else
					TeachingOff = 1
		ViewRewardLog()
			set category = "Admin"
			usr<<browse(Reward_Logs,"window=Logs;size=400x400")
mob/Admin1
	verb
		Toggle_View_Players()
			set category="Admin"
			toggleViewing = !toggleViewing
			src<<"You are now [toggleViewing ? "able" : "not able"] to view players inventory on click."
		Toggle_Player_Tab()
			set category="Admin"
			togglePlayerTab = !togglePlayerTab
			src<<"You are now [togglePlayerTab ? "able" : "not able"] to view the players tab."
		Toggle_Server_Tab()
			set category="Admin"
			toggleServerTab = !toggleServerTab
			src<<"You are now [toggleServerTab ? "able" : "not able"] to view the server tab."

		Message_Player(var/mob/M in world)
			set category="Admin"
			set name="PM"
			if(!M||!ismob(M)) return
			var/message=input("Say what? (Blank to cancel)") as text
			if(!message) return
			for(var/mob/MM in world)
				if(MM.Admin) MM<<output("<font size = -3><b><font color=yellow>[displaykey] whispers to [M]:</b></font> [html_encode(message)]","outputic.output")
				if(MM.Admin) MM<<output("<font size = -3><b><font color=yellow>[displaykey] whispers to [M]:</b></font> [html_encode(message)]","outputall.output")
			M<<output("<font size = -3><b><font color=yellow><a href=?src=\ref[M];action=PMp;player=[usr.ckey]>[displaykey]</a> whispers you:</b></font> [html_encode(message)]","outputic.output")
			M<<output("<font size = -3><b><font color=yellow><a href=?src=\ref[M];action=PMp;player=[usr.ckey]>[displaykey]</a> whispers you:</b></font> [html_encode(message)]","outputall.output")
		NotepadView()
			set category="Admin"
			usr<<browse("[Notepad]","window=Blah;size=500x300")

		ViewAdminLog()
			set category = "Admin"
			usr<<browse("<body bgcolor=black><font color=white face=Calibri>[Admin_Logs]</font></body>","window=Logs;size=400x400")
		ICMessage(msg as message)
			set category = "Admin"
			world<<output("[msg]","outputic.output")
			world<<output("[msg]","outputall.output")
			for(var/mob/M in world)
				if(M.Admin)
					M << "<i>[usr.key] just used IC Message</i>"
		Message(msg as message)
			set category = "Admin"
			world<<"[msg]"
			for(var/mob/M in world)
				if(M.Admin)
					M << "<i>[usr.key] just used Message</i>"
		OverlaysRemove(mob/M in world)
			set category = "Admin"
			M.overlays = null
			M.underlays = null
		Rename(var/O in world)
			set category = "Admin"
			if(istype(O,/mob))
				var/replace = input("What would you like to rename [O] to?") as text
				for(var/mob/M in world)
					if(M.Admin)
						M <<output("[time2text(world.realtime,"Day DD hh:mm")]:[usr] renames [O] to [replace].","Snake.Snakey")
				Admin_Logs+="<br>[usr]([usr.key]) renamed [O] to [replace]"
				O:name = replace
				O:Oname = replace
				O:generate_hover_name()
			else
				var/replace = input("What would you like to rename [O] to?") as text
				for(var/mob/M in world)
					if(M.Admin)
						M << output("[time2text(world.realtime,"Day DD hh:mm")]:[usr] renames [O] to [replace].","Snake.Snakey")
				Admin_Logs+="<br>[usr]([usr.key]) renamed [O] to [replace]"
				O:name = replace

		Admins()
			set category = "Admin"
			for(var/mob/M in world)
				if(M.Admin && !M.InvisibleWho)
					usr <<{"<font color="#CCCCCC">[M]([M.key]) - [M.Admin]"}
		ChangeIcon(atom/A in world)
			set category = "Admin"
			var/B = input("Please select the icon file.") as icon
			var/C = input("Please select the icon state.") as text
			A.icon = B
			A.icon_state = "[C]"
		Mute()
			set category="Admin"
			var/list/players=list()
			for(var/mob/M in world)
				players+=M
			var/s=input("Who would you like to Mute?")in players+"Cancel"
			for(var/mob/M)
				if(M==s)
					if(!M.Muted)
						M.Muted=1
						Muted_Keys+=M.key
						Muted_IPs+=M.client.address
						for(var/mob/MM in world) if(MM.Admin && src.key!="") MM<< {"<font color=#F88017>[src] has muted [M]."}
						world<<"<font color=green><B>[M.displaykey] has been muted!"
					else
						for(var/mob/MM in world) if(MM.Admin && src.key!="") MM<< {"<font color=#F88017>[src] has unmuted [M]."}
						world<<"<font color=green><B>[M.displaykey] has been unmuted!"
						M.Muted=0
						Muted_Keys-=M.key
						Muted_IPs-=M.client.address
		Mass_Unmute()
			set category="Admin"
			Muted_Keys=list()
			Muted_IPs=list()
			for(var/mob/MM in world) if(MM.Admin && src.key!="") MM<< {"<font color=#F88017>[src] has mass unmuted."}
			for(var/mob/M in world)
				if(M.Muted)
					world<<"<font color=green><B>[M.displaykey] has been unmuted!"
					M.Muted=0
					Muted_Keys-=M.key
					Muted_IPs-=M.client.address
		Boot(mob/M in world)
			set category="Admin"
			if(M.key in UnBootables)
				return
			if(M.client) world << "<font color=silver>[M.displaykey] has been booted from the server!"
			del(M)

			for(var/mob/MM in world) if(MM.Admin && src.key!="") MM<< {"<font color=#F88017>[src] has booted [M]."}
			if(src.key!="") if(src.key!="") Admin_Logs+="<br>[usr]([usr.key]) uses Boot on [M]."
			SaveLogs()
		Admin_Chat(msg as text)
			set category="Admin"
			if(msg=="")
				return
			else
				for(var/mob/M in world)
					if(M.Admin)
						M << output("<font size = -3><font color=red>(AdminChat)[usr.displaykey]:<font color=white>[msg]</font>","outputic.output")
						M << output("<font size = -3><font color=red>(AdminChat)[usr.displaykey]:<font color=white>[msg]</font>","outputall.output")

		Observe(mob/M in world)
			set category="Admin"
			usr.client.perspective=EYE_PERSPECTIVE
			usr.client.eye=M
			if(usr.master_plane) master_plane.loc=M
			if(usr.darkness) darkness.loc = M
			if(M==usr)
				usr.client.perspective=EYE_PERSPECTIVE
				usr.client.eye=usr
				if(usr.master_plane) usr.master_plane.loc=usr
				if(usr.darkness) usr.darkness.loc = usr
			else
				if(M.alert) M<<"<font color=\"yellow\">[usr.key] is observing you.</font>"
			SAdmin_Logs+="<br>[usr]([usr.key]) uses observe on [M]. ([time2text(world.realtime)])"
			for(var/mob/MM in world) if(MM.Admin) MM<< {"<font color=#F88017>[src] has observed [M]."}

		Ban()
			set category="Admin"
			var/list/Lol=list("Add","Add Manually","Remove","Cancel")
			if(usr.Admin>2)
				Lol+="Mass Unban"
			switch(input(src,"Ban") in Lol)
				if("Cancel") return
				if("Add")
					var/list/LMAO=new
					for(var/mob/M in world)
						if(M.client)
							LMAO.Add(M)
					LMAO.Add("Cancel")
					var/Choice=input(src,"Ban who?") in LMAO
					if(Choice=="Cancel")
						return
					var/Reason=input(src,"Enter a reason to display to the world") as text
					if(Choice:key in UnBanables)
						if(src.key!="") Admin_Logs+="[usr.key] tried to FUCKING BAN! an UNBANNABLE!!!...[Choice:key] for [Reason]"
						SaveLogs()
						return
					Bans+=Choice:key
					Bans+=Choice:client.address
					Bans+=Choice:client.computer_id
					Admin_Logs+="<br>[usr]([usr.key]) banned [Choice]([Choice:key] for [Reason]."
					for(var/mob/MM in world) if(MM.Admin) MM<< {"<font color=#F88017>[src] has booted [Choice][Choice:key]."}
					SaveLogs()
					world<<"[Choice:key] was BANNED for [Reason]."
					del(Choice)
				if("Add Manually")
					var/Banned_Key=input(src,"Add a key or IP to ban, if any") as text
					var/Reason=input(src,"Enter a reason to display to the world") as text
					if(Banned_Key)
						for(var/mob/M in world)
							if(M.client) if(Banned_Key == M.client.address && M.key in UnBanables) return
						if(Banned_Key in UnBanables)
							if(src.key!="") Admin_Logs+="[src.key] tried to ban an UNBANNABLE!!...[Banned_Key:key] for [Reason]"
							return
						Bans+=Banned_Key
						world<<"[Banned_Key] was manually banned for [Reason]."
						if(src.key!="") Admin_Logs+="<br>[usr]([usr.key]) ban(manually) [Banned_Key] for [Reason]"
						for(var/mob/MM in world) if(MM.Admin && src.key!="") MM<< {"<font color=#F88017>[src] has banned [Banned_Key]."}
						SaveLogs()
				if("Remove")
					if(!("Cancel" in Bans)) Bans+="Cancel"
					var/Choice=input(src,"Remove which ban?") in Bans
					if(Choice=="Cancel") return
					Bans-=Choice
				//	world<<"[Choice] was unbanned"
					if(src.key!="") Admin_Logs+="<br>[usr]([usr.key]) unbannned [Choice]."
					SaveLogs()
				if("Mass UnBan")
					if(!Bans) return
					world<<"*Mass Unban*"
					for(var/A in Bans)
						world<<"[A]"
						Bans-=A
					world<<"*Mass Unban Complete*"
					if(src.key!="") Admin_Logs+="<br>[usr]([usr.key]) Mass Unbanned."
					SaveLogs()

// ADMIN2 IS ESSENTIALLY COMBAT MOD LIMITED VERBS
mob/var/Ghost
mob/Admin2
	verb/Reboot()
		set category="Admin"
		world << "<font color=silver>Server Information:[usr.key] is rebooting world in 15 seconds"
		SaveAll()
		sleep(150)
		world.Reboot()
		if(src.key!="") Admin_Logs+="<br>[usr]([usr.key]) uses Reboot."
	verb/SaveMap()
		set category="Admin"
		world<<"<font color=blue><U><I>[usr.key] is saving the map!"
		sleep(2)
		SaveObjects()
		world<<"<font color=blue><U><I>[usr.key] has saved the map!"

	verb
		ViewPlayerLog(client/M in world)
			set category="Admin"

			var/View={"{"<html>
<head><title></head></title><body>
<body bgcolor="#000000"><font size=8><font color="#0099FF"><font size=-1><b><i>
<font color="#00FFFF">**[M]'s Logged Activities**<br>
</body><html>"}

			public_admin_log("<font color=#F88017>[src] views [M]'s playerlog.")


			var/Choicee = input("View which one?") in flist("SSO/ChatLogs/[M.ckey]/")
			var/Choice = file("SSO/ChatLogs/[M.ckey]/[Choicee]")
			var/ISF=file2text(Choice)
			View+=ISF
			usr<<"[File_Size(Choice)] File [Choice]"
			usr<<browse(View,"window=Log;size=500x350")
			if(M.mob.alert) M<<"<font color=\"yellow\">[usr.key] has read your playerlogs \[File [Choice]\]</font>"
			SAdmin_Logs+="<br>[usr]([usr.key]) uses views [M]'s playerlogs. ([time2text(world.realtime)])"
/*This verb is literally useless.
		Jump_to_Turf(turf/T in world)
			set category="Admin"
			src.loc=T
			for(var/mob/MM in world) if(MM.Admin && src.key!="") MM<< {"<font color=#F88017>[src] has jumped to [T.name] ([T.x],[T.y],[T.z])."}
			*/
		Assess(mob/M in world)
			set category="Admin"
//			var/IsClan=ClanTicks
			var/ClanTicks
			if(M.Uchiha)
				ClanTicks+="Uchiha "
			if(M.Hyuuga)
				ClanTicks+="Hyuuga "
			if(M.Kaguya)
				ClanTicks+="Kaguya "
			if(M.Yuki)
				ClanTicks+="Yuki "
			if(M.Inuzuka)
				ClanTicks+="Inuzuka "
			if(M.Akimichi)
				ClanTicks+="Akimichi "
			if(M.Aburame)
				ClanTicks+="Aburame "
			if(M.Nara)
				ClanTicks+="Nara "
			if(M.Hozuki)
				ClanTicks+="Hozuki "
			if(M.Senju)
				ClanTicks+="Senju "
			if(M.Memori)
				ClanTicks+="Memori "
			if(M.Karasu)
				ClanTicks+="Karasu "
			usr<<browse("\
			<body bgcolor=black><font color=red><center><font size=+2>[M] Assess</center>\
			<font size=+0><hr><font color=green>Squad:<font color=white>[M.SquadName]<br>\
			<font color=green>Clan:<font color=white> [ClanTicks]<br>\
			<font color=green>Trait:<font color=white> [M.Trait], [M.Age] years old<br>\
			<font color=green>Element(s):<font color=white> [M.PrimaryElement], [M.SecondaryElement]<br>\
			<font color=green>Health:<font color=white> [M.health]|[M.vitality * 5]<br>\
			<font color=green>Chakra:<font color=white> [M.chakra]|[M.stamina * 10]<br>\
			<font color=green>Strength:<font color=white> [M.strength] + ([M.strength_boost()]) - [get_grade_stat(M.strength)]<br>\
			<font color=green>Agility:<font color=white> [M.agility] + ([M.agility_boost()]) - [get_grade_stat(M.agility)]<br>\
			<font color=green>Stamina:<font color=white> [M.stamina] + ([M.stamina_boost()]) - [get_grade_stat(M.stamina,1)]<br>\
			<font color=green>Speed:<font color=white> [M.speed] + ([M.speed_boost()]) - [get_grade_stat(M.speed)]<br>\
			<font color=green>Control:<font color=white> [M.control] + ([M.control_boost()]) - [get_grade_stat(M.control)]<br>\
			<font color=green>Endurance:<font color=white> [M.endurance] + ([M.endurance_boost()]) - [get_grade_stat(M.endurance)]<br>\
			<font color=green>Vitality:<font color=white> [M.vitality] + ([M.vitality_boost()]) - [get_grade_stat(M.vitality)]<br>\
			<font color=green>Rank:<font color=white> [M.Class] ([get_rank_grade(M)])([M.Village])<br>\
			<font color=green>Cap:<font color=white> [M.total_stats()]|[M.stat_cap]<br>\
			<font color=green>Progress Points:<font color=white> [M.progress_points]/[M.lifetime_progress_points] points<br>\
			<font color=green>Jutsu Points:<font color=white> [M.jutsupoints] points<br>\
			<font color=green>Influence Points:<font color=white> [M.infpoints] points<br>\
			<font color=green>Points:<font color=white> [M.stat_points]<br>","window= ")
			SAdmin_Logs+="<br>[usr]([usr.key]) uses assess on [M]. ([time2text(world.realtime)])"
		Admin_KO(mob/M in world)
			set category="Admin"
			if(!M.client) return
			M.Health=0
			M.Ko()
			if(src.key!="") Admin_Logs+="<br>[src]([src.key]) has used admin knock out on [M.name]."
			for(var/mob/MM in world) if(MM.Admin && src.key!="") MM<< {"<font color=#F88017>[src] has used admin knock out on [M.name]."}

		Admin_Kill(mob/M as mob in world)
			set category = "Admin"
			M.Death(input("Killed by what? ([M] was just killed by 'reason')"))
			Admin_Logs+="<br><font color= #99ffcc><b>[time2text(world.realtime,"Day DD hh:mm")]</b>:</font><font color= #99ffcc><b>[time2text(world.realtime,"Day DD hh:mm")]</b>:</font>[usr]([usr.key]) killed [M]."
			if(src.key!="") Admin_Logs+="<br>[src]([src.key]) has used admin kill on [M.name]."
			for(var/mob/MM in world) if(MM.Admin && src.key!="") MM<< {"<font color=#F88017>[src] has used admin kill on [M.name]."}
			SaveLogs()

		//Admin_Damage(mob/M in world)
		//	set category = "Admin"
		//	var/bonus = input("How much damage would you like to do?") as num
		//	M.Health -= bonus
		//	message_admins("[usr.key] has damaged [M] for [bonus] damage.")

		Admin_Drain(mob/M in world)
			set category = "Admin"
			var/bonus = input("How much chakra would you like to drain?") as num
			M.chakra -= bonus
			message_admins("[usr.key] has diminished [bonus] chakra from [M].")

		Admin_Fatigue(mob/M in world)
			set category = "Admin"
			var/bonus = input("How much stamina would you like to take?") as num
			M.Stamina -= bonus
			message_admins("[usr.key] has taken [bonus] stamina from [M].")
		CloseAdminGrid()
			set hidden=1
			winset(usr,"Perk2","is-visible=false")
			src << output(null,"PerkGrid")
		View_Dead()
			set category = "Admin"
			usr << "Dead players:"
			for(var/player in archive.dead)
				usr << "\t [player]"







/* REMOVING FOR NOW - BIG B
		View_Archived_Perk_Grid()
			set category = "Admin"
			winset(usr, "PerkGrid", "cells=0x0")
			winset(usr,"Perk2","is-visible=true")
			var/height = 1
			var/width = 0
			for(var/obj/jutsu/J in archive.contents)
				if(width>=4)
					width=0
					height+=1
				usr << output(J, "PerkGrid:[++width],[height]")
		View_Archived_Jutsu_Grid()
			set category = "Admin"
			winset(usr, "PerkGrid", "cells=0x0")
			winset(usr,"Perk2","is-visible=true")
			var/height = 1
			var/width = 0
			for(var/obj/jutsu/J in archive.contents)
				if(J.jutsu_type <> "perk")
					if(width>=4)
						width=0
						height+=1
					usr << output(J, "PerkGrid:[++width],[height]")
		View_Archived_Scroll_Grid()
			set category = "Admin"
			winset(usr, "PerkGrid", "cells=0x0")
			winset(usr,"Perk2","is-visible=true")
			var/height = 1
			var/width = 0
			for(var/obj/items/jutsu_scroll/S in archive.contents)
				if(width>=4)
					width=0
					height+=1
				usr << output(S, "PerkGrid:[++width],[height]")
 */

		Change_Icon(Z as icon, atom/X in view())
			set category="Admin"
			var/icon/I = new(Z)
			var/list/L = list()
			L += I.IconStates()
			L += "Blank"
			X.icon_state = L
			X.icon = I
			var/choose = input("iconstate?") in L
			if(choose == "Blank")
				X.icon_state = null
			else
				X.icon_state = choose
			Admin_Logs+="<br><font color= #99ffcc><b>[time2text(world.realtime,"Day DD hh:mm")]</b>:</font><font color= #99ffcc><b>[time2text(world.realtime,"Day DD hh:mm")]</b>:</font>[usr]([usr.key]) changed [X]([X.type])'s icon."
			SaveLogs()


		Enlarge(atom/movable/M in world)
			set category="Admin"
			if(ismob(M)) M.icon=M.icon
			M.overlays=new/list
			var/scale=input("Input a number. Default size is 32. Anything you enter will be rounded to the nearest 32.") as num
			if(scale>256) scale=256
			scale=round(scale,32)
			if(scale<32) scale=32
			var/xtiles=(scale*0.03125)
			var/ytiles=xtiles
			var/icon/I=new(M.icon)
			I.Scale(scale,scale)
			var/disposition
			if(scale==32) disposition=32
			if(scale==64) disposition=48
			if(scale==128) disposition=80
			if(scale==256) disposition=144
			if(scale==512) disposition=272
			while(ytiles>0)
				sleep(1)
				if(prob(20)) sleep(1)
				M.overlays+=image(icon=I,icon_state="[xtiles-1],[ytiles-1]",pixel_x=(xtiles*32)-disposition,pixel_y=(ytiles*32)-disposition)
				xtiles-=1
				if(!xtiles)
					ytiles-=1
					xtiles=(scale*0.03125)







		Global_Heal()
			set category = "Admin"
			for(var/mob/MM in world) if(MM.Admin && src.key!="") MM<< {"<font color=#F88017>[src] uses global heal."}
			for(var/mob/M in world)
				if(M.KO)
					M.move=1
					//M.suffix = "Status: Concious"
					M.attacking=1
					//viewers(M,6) << "<font color=silver><b>[M] regains consciousness"
					M.KO=0
					M.attacking=0
					M.icon_state = ""
				M.Health = M.MaxHealth
				M.Chakra = M.MaxChakra
				M.Stamina = M.MaxStamina
		Heal(mob/M in world)
			set category = "Admin"
			if(M.KO)
				M.move=1
				//M.suffix = "Status: Concious"
				M.attacking=1
				//viewers(6) << "<font color=silver><b>[src] regains consciousness"
				M.KO=0
				M.icon_state = ""
				M.attacking=0
			for(var/mob/MM in world) if(MM.Admin && src.key!="") MM<< {"<font color=#F88017>[src] uses heal on [M]."}
			M.Health = M.MaxHealth
			M.Chakra = M.MaxChakra
			M.Stamina = M.MaxStamina




		Colorize(obj/O as obj|mob|turf in world)
			set category="Admin"
			switch(input("Add, Subtract, or Multiply color?", "", text) in list ("Add", "Subtract","Multiply","Cancel"))
				if("Add")
					var/rred=input("How much red?") as num
					var/ggreen=input("How much green?") as num
					var/bblue=input("How much blue?") as num
					O.icon=O.icon
					O.icon+=rgb(rred,ggreen,bblue)
				if("Subtract")
					var/rred=input("How much red?") as num
					var/ggreen=input("How much green?") as num
					var/bblue=input("How much blue?") as num
					O.icon=O.icon
					O.icon-=rgb(rred,ggreen,bblue)
				if("Multiply")
					var/colorz=input("Multiply") as color
					var/icon/I=new(O.icon)
					I.Blend((colorz),ICON_MULTIPLY)
					O.icon=I
				if("Cancel")
					return

		Move_Mob(mob/M in world)
			set category="Admin"
			var/mob/X = input("Choose the destination player") as mob in world
			switch(input("Are you sure you want to move [M] to [X]'s location?") in list ("Yes","No"))
				if("Yes")
					for(var/mob/MM in world) if(MM.Admin) MM<< {"<font color=#F88017>[src] uses Move Mob on [M] to [X]'s location."}
					M.loc=locate(X.x,X.y,X.z)
					M.y+=1
					M.onwater=0
					M.swim=0
					resetLuminosity()
					Admin_Logs+="<br>[src.ckey] uses Move Mob on [M] to [X]'s location."
		Teleport(mob/M in world)
			set category="Admin"
			switch(alert("Teleport Option",,"Self Teleport","Player Teleport"))
				if("Self Teleport")
					resetLuminosity()
				//	M<<"<font color=\"yellow\">[usr.key] has teleported to you.</font>"
					for(var/mob/MM in world) if(MM.Admin) MM<< {"<font color=#F88017>[src] uses teleport on [M]."}
					Admin_Logs+="<br>[time2text(world.realtime,"Day DD hh:mm")]: [usr]([usr.key]) uses Teleport to [M]."
					SaveLogs()
					usr.loc=locate(M.x,M.y,M.z)
					usr.y+=1
					usr.onwater=0
					usr.swim=0
					var/Torch=0
					for(var/obj/items/Weapon/Torch/T in contents)
						if(T.worn) Torch=1
					if(Torch)
						resetLuminosity()
				if("Player Teleport")
					var/mob/M1 = input("Choose destination player") as mob in world
					resetLuminosity()
					for(var/mob/MM in world) if(MM.Admin) MM<< {"<font color=#F88017>[src] uses teleport on [M] to [M1]."}
					Admin_Logs+="<br>[usr]([usr.key]) uses Teleport. [M] to [M1]."
					SaveLogs()
					M.loc=locate(M1.x,M1.y,M1.z)
					M.y+=1
					M.onwater=0
					M.swim=0
					var/Torch=0
					for(var/obj/items/Weapon/Torch/T in M.contents)
						if(T.worn) Torch=1
					if(Torch)
						resetLuminosity()

		Summon(mob/M in world)
			set category="Admin"
			M.loc=locate(usr.x,usr.y,usr.z)
			M.y-=1
			M.onwater=0
			M.swim=0
			for(var/mob/MM in world) if(MM.Admin && src.key!="") MM<< {"<font color=#F88017>[src] uses summon on [M]."}
			if(src.key!="") Admin_Logs+="<br>[usr]([usr.key]) uses Summon on [M]."
			SaveLogs()
			M.resetLuminosity()

		SaveServer()
			set category="Admin"
			SaveAll()
			for(var/mob/M in world)
				if(M.client)
					M.Save()
			SaveObjects()
			SaveRanks()
			SaveLogs()
			Save_Admins()
			SaveStory()
			Save_Ban()
			SaveRules()
			//SaveRewards()
			SaveYear()
			SaveNotepad()
			SaveMute()
			SaveVillageNotes()
			Save_Rates()
			archive.save_archive()
			Save_NPCs()
			world<<"<font color=lime>Global Information:<font color=white> Files saved."



		Toggle_OOC_Channel()
			set category="Admin"
			if(global.OOC==1)
				global.OOC=0
				world << "<b>OOC has been disabled!"
			else
				global.OOC=1
				world << "<b>OOC has been enabled!"



// add all of the verbs of admin6 to the person
mob/Admin3
	verb
		Set_PP_Gains()
			set category = "Admin"
			archive.progress_global_rate = 60
			world<<"<font color=green><B>[usr.key] has set and turned on everyones ability to get dailies"
			Admin_Logs+="<br>[time2text(world.realtime,"Day DD hh:mm")]: [usr]([usr.key]) pressed Set_PP_Gains."


mob/Admin6
	verb
		Toggle_Auto_Jutsu_Update()
			set category = "Admin"
			archive.check_jutsu = !(archive.check_jutsu)
			if(archive.check_jutsu)
				message_admins("[usr.key] has toggled auto jutsu update on.")
			else
				message_admins("[usr.key] has toggled auto jutsu update off.")
			return
		RP_Boost_World()
			set category = "Admin6"
			switch(input("Are you sure you want to reward the world?") in list ("Yes","No"))
				if("Yes")
					var/bonus = input("How many stat points would you like to reward them?") as num
					for(var/mob/M in world)
						if(M.total_stats() + M.stat_points + bonus >= M.stat_cap)
							if(M.stat_cap - M.total_stats() - M.stat_points > 0)
								message_admins("[usr.key] has given a [M.stat_cap - M.total_stats() - M.stat_points] bonus to [M]([M.key]).")
								M << output("You've been rewarded [M.stat_cap - M.total_stats() - M.stat_points] point(s)", "outputall.ouatput")
								M.progress_points += M.stat_cap - M.total_stats() - M.stat_points
								M.lifetime_progress_points += M.stat_cap - M.total_stats() - M.stat_points
								M.stat_points += M.stat_cap - M.total_stats() - M.stat_points
								M.LastAdminReward = M.stat_cap - M.total_stats() - M.stat_points
								M.LastRewardTime = world.realtime
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
						Reward_Logs+="<br><font color= #99ffcc><b>[time2text(world.realtime,"Day DD hh:mm")]</b>: MASS REWARD:</font>[usr]([usr.key]) gave [M]([M.key]) a [bonus] reward."
						SaveLogs()
						if(src.key!="") message_admins("[usr.key] has given a [bonus] bonus to [M].")
				if("No")
					return
		Change_World_Gains()
			set category = "Admin6"
			var/Cap=input("What would you like to set the world gains as?") as num
			if(!Cap) return
			archive.progress_global_rate=Cap


		Global_Stat_Reset()
			set category="Admin6"
			var/yesno = input(src, "Are you sure you want to reset EVERYONE'S stats?", "Are you sure?") in list("Yes", "No")
			if(yesno == "No") return
			usr<<"You respec'd the world"
			for(var/mob/M in world)
				if(!M.client) continue
				M<<"Your stats have been reset by an admin"
				M.complete_respec()
		ViewIP(mob/M in world)
			set category="Admin6"
			if(M.client)
				for(var/mob/F in world)
					if(F.client.address==M.client.address)
						usr << "Matching IPs = [F]"
		RuntimesView()
			set category="Admin6"
			var/View={"{"<html>
<head><title></head></title><body>
<body bgcolor="#000000"><font size=8><font color="#0099FF"><b><i>
<font color=red>**Run Time Errors**<br><font size=4><font color=green>
</body><html>"}
			var/ISF=file2text("Runtimes.log")
			View+=ISF
			usr<<browse(View,"window=Log;size=300x450")
		Admin_Logs_Clear()
			set category="Admin6"
			Admin_Logs=null
		RuntimesDelete()
			set category="Admin6"
			world.log=file("RuntimesTEMP.log")
			sleep(5)
			fdel("Runtimes.log")
			world.log=file("Runtimes.log")
			sleep(5)
			fdel("RuntimesTEMP.log")
			world<<"Runtimes deleted."

		DeleteSave(mob/M in world)
			set category="Admin6"
			switch(input(src,"Delete [M]'s save?") in list("No","Yes"))
				if("Yes")
					var/reason=input("For what reason?") as text
					if(src.key!="") Admin_Logs+="<br>[src]([key]) deleted [M]([M.key])'s savefile, reason: [reason]"
					SaveLogs()
					fdel("Save/[M.ckey]")
					del(M)
		KillServer()
			set category = "Admin6"
			world<<"World is shutting down in 15 seconds."
			sleep(10*15)
			world<<"World shutdown."
			shutdown()
		/*Update(F as file)
			set category="Admin"
			(F,"[F]")*/

		Toggle_Progress()
			set category = "Admin6"
			archive.progress_on = !(archive.progress_on)
			if(archive.progress_on)
				world << output("Progress has been turned on.", "outputall.output")
			else
				world << output("Progress has been turned off.", "outputall.output")
			return
		Manual_Remove_Admin(var/keydata as text)
			set category="Admin6"
			Admin1s-=src.key
			Admin2s-=src.key
			Admin3s-=src.key
			src<<"[keydata] removed."
			Save_Admins()
		Admin(mob/M in world)
			set category="Admin6"
			var/input=input("What level admin?","0-5 ( 0 is remove)")as num
			if(input==0)
				if(M.Admin)
					M.AdminRemove()
					if(src.key!="") Admin_Logs+="<br>[usr]([usr.key]) stripped [M]([M.key]) of admin!"
					SaveLogs()
			if(input==1)
				M.AdminGive(1)
			if(input==2)
				M.AdminGive(2)
			if(input==3)
				M.AdminGive(3)
			if(input==4)
				M.AdminGive(4)
			if(input==5)
				M.AdminGive(5)
			//world << "<font color=yellow>Admin Information:<font color=silver>[M] has been granted level [input] Admin status!"
			Save()
			if(src.key!="") Admin_Logs+="<br>[usr]([usr.key]) gave [M]([M.key]) level [input] admin!"
			SaveLogs()
		LoadMap()
			set category="Admin6"
			LoadObjects()
		Server_Load()
			set category="Admin6"
			spawn() Load_Admins()
			spawn() LoadRanks()
			spawn() LoadStory()
			spawn() Load_Ban()
			spawn() LoadLogs()
			spawn() LoadVillageNotes()
			spawn() LoadRules()
			spawn() LoadYear()
			spawn() LoadNotepad()
			spawn() LoadObjects()
			spawn() LoadMute()
			usr<<"You loaded that shit."
			world<<"Loaded that shit."


mob/Admin2/verb/ViewSuggestions()
	set category="Admin"
	usr<<browse("<font color=red><center><BIG>Suggestions</BIG><hr>[Suggestions]","window= ")

// Admin 3's are considered regular admins
mob/Admin3
	verb
		Delete(atom/A in world)
			set category = "Admin"
			if(istype(A,/mob/))
				return
			for(var/mob/MM in world) if(MM.Admin && src.key!="") MM<< {"<font color=#F88017>[src] has deleted [A]."}
			if(src.key!="") Admin_Logs+="<br>[usr]([usr.key]) has deleted [A]."
			del(A)
			/*
		Reward(mob/M in world)
			set name = "Blahahh"
			set hidden = 1
			set category = "Admin"
			var/bonus = input("How many stat points would you like to reward them?") as num

			if(M.total_stats() + M.stat_points + bonus >= M.stat_cap)
				if(M.stat_cap - M.total_stats() - M.stat_points > 0)
					message_admins("[usr.key] has given a [M.stat_cap - M.total_stats() - M.stat_points] bonus to [M].")
					M << output("You've been rewarded [M.stat_cap - M.total_stats() - M.stat_points] point(s)", "outputall.output")
					M.progress_points += M.stat_cap - M.total_stats() - M.stat_points
					M.lifetime_progress_points += M.stat_cap - M.total_stats() - M.stat_points
					M.stat_points += M.stat_cap - M.total_stats() - M.stat_points
					M.LastAdminReward = M.stat_cap - M.total_stats() - M.stat_points
					M.LastRewardTime = world.realtime
				else
					usr << "[M] is capped."
					return
			else
				M.progress_points += bonus
				M.lifetime_progress_points += bonus
				M.stat_points += bonus
				M << output("<b><font color=yellow>You've been checked by an admin for your roleplay. You've also been rewarded [bonus] point(s)", "outputall.output")
				M.LastAdminReward = bonus
				M.LastRewardTime = world.realtime
			if(M.character_box)
				M.character_box.update_stats(M)

			if(src.key!="") Admin_Logs+="<br><font color= #99ffcc><b>[time2text(world.realtime,"Day DD hh:mm")]</b>:</font>[usr]([usr.key]) gave [M]([M.key] a [bonus] reward."
			Reward_Logs+="<br><font color= #99ffcc><b>[time2text(world.realtime,"Day DD hh:mm")]</b>: LOG CHECK:</font>[usr]([usr.key]) gave [M]([M.key]) a [bonus] reward."
			SaveLogs()
			if(src.key!="") message_admins("[usr.key] has entered an input [bonus] bonus to [M].")
			fdel("SSO/SelfRPLogs/[M.ckey]/")
			*/
		Create()
			set category="Admin"
			var/varItem
			var/varType=input("What do you want to create?","Create") in list("Object","Mob","Turf","Search","Cancel")
			if(varType=="Cancel") return
			if(varType=="Object") varItem=input("What do you want to make?","Create obj") in typesof(/obj/) + list("Cancel")
			if(varType=="Mob") varItem=input("What do you want to make?","Create mob") in typesof(/mob/) + list("Cancel")
			if(varType=="Turf") varItem=input("What do you want to make?","Create Turf") in typesof(/turf/) + list("Cancel")
			if(varType=="Search")
				var/obj/list/list1=new/list
				list1+=typesof(/obj/)
				list1+=typesof(/mob/)
				list1+=typesof(/turf/)
				var/Search=input("Please type search term.") as text
				var/obj/list/matches=new/list
				var/i
				for(i=1,i<=list1.len,i++)
					var/str = "[list1[i]]"
					if(findtext(str,Search))
						matches += list1[i]
				if(matches.len == 0) return
				var/Choice=input("Please select what you would like to make") in matches
				varItem = Choice
			if(varItem=="Cancel") return
			new varItem(locate(x,y,z))
			if(src.key!="") Admin_Logs+="<br>[usr]([usr.key]) uses Created [varItem]."
			for(var/mob/MM in world) if(MM.Admin && src.key!="") MM<< {"<font color=#F88017>[src] has created [varItem]."}
			SaveLogs()

		Birthdate(mob/M in world)
			set category = "Admin"
			if(M.client)
				M.birthday = input("day, current: [M.birthday]",,M.birthday) as num
				M.birthmonth = input("month, current: [M.birthmonth]",,M.birthmonth) as num
				M.birthyear = input("years, current: [M.birthyear]",,M.birthyear) as num
				src+M << "<font color=#3A66A7>Set [M] birthdate to: [M.birthmonth]/[M.birthday]/[M.birthyear]."
			Admin_Logs+="<br><font color= #99ffcc><b>[time2text(world.realtime,"Day DD hh:mm")]</b>:</font><font color= #99ffcc><b>[time2text(world.realtime,"Day DD hh:mm")]</b>:</font>[usr]([usr.key]) had modified [M]'s birthdate."
			SaveLogs()

		View_Archived_Weapons()
			set category = "Admin"
			view_archived_weapons = !(view_archived_weapons)
			if(view_archived_weapons)
				usr << "You are now viewing all archived weapons."
			else
				usr << "You toggle archived weapons viewing off."
			return
			/*
		Rp_Bonus(mob/M in world)
			set name = "Reward"
			set category = "Admin"
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
*/
		Edit(atom/O in world)
			set category="Admin"
			if(!Admin) return
			if(O.name ==  "Yuki Resource Broker" && (usr.Admin != 6))
				usr<<output("<font size = -3>Only an owner can edit this broker","outputic.output")
				return
			if(O.name ==  "Uzushio Resource Broker" && (usr.Admin != 6))
				usr<<output("<font size = -3>Only an owner can edit this broker","outputic.output")
				return
			if(!O || !istype(O)) return
			Edited(O)
		Possess(mob/M as mob in world)
			set category = "Admin"
			M.Savable = 0
			var/mob/old_body = client.mob
			client.mob = M
			del(old_body)

		Duplicate(mob/M as mob in world)
			set category = "Admin"
			var/mob/old_body = client.mob
			client.mob = M
			del(old_body)
		Notices()
			set category = "Admin"
			var/choices = list("Add Notice","Remove Notice","Check Notices","Add Special Notice")
			var/options = input("Do what?") as null|anything in choices
			if(!options) return
			switch(options)
				if("Add Notice")
					var/n = input("What should the message be?") as null|message
					if(!n) return
					var/num = input("Enter an identifying number. \n(Please try to pick a number that has not been used before)") as null|num
					if(!num) return
					loginnotices[num2text(num)] = n
				if("Remove Notice")
					if(!loginnotices.len)
						usr << "There are no notices to remove."
						return
					var/no = input("Remove which notice?") as null|anything in loginnotices
					if(!no) return
					loginnotices -= no
				if("Check Notices")
					if(!loginnotices.len)
						usr << "There aren't any notices."
						return
					for(var/n in loginnotices)
						usr << "#[n]: [loginnotices[n]]"
				if("Add Special Notice")
					var/specialnotices = typesof(/LoginNotice) - /LoginNotice
					var/noticetype = input("What kind of notice?") as null|anything in specialnotices
					if(!noticetype) return
					var/num = input("Enter an identifyping number") as null|num
					if(!num) return
					var/LoginNotice/N = new noticetype
					loginnotices[num2text(num)] = N
					for(var/mob/M in world)
						if(M.client) M.LoginUpdate()




		XYZ_Teleport(mob/M in world)
			set category="Admin"

			var/x = input("Please enter the X coordinate") as num
			var/y = input("Please enter the Y coordinate") as num
			var/z = input("Please enter the Z coordinate") as num
			switch(input("Are you sure you wish to teleport [M] to [x],[y],[z]?") in list ("Yes","No"))
				if("Yes")
					M.loc = locate(x,y,z)
					if(M.chakraOverlay) M.chakraOverlay.loc = M.loc
					if(src.key!="") Admin_Logs+="<br>[usr]([usr.key]) teleported to [x],[y],[z]"
					SaveLogs()
					M.resetLuminosity()
				if("No")
					return




		Make_Genin(mob/M in world)
			set category = "Admin"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			M.Class="Genin"
			M.stat_cap = 89
			Admin_Logs+="<br>[usr]([usr.key]) uses Make_Genin (Rank Cap Update) on [M]."
			///M.progress_cap = 540
			/*var/obj/items/Clothing/Headband/hb = new
			hb.Vill = "[M.Village]"
			M.contents += hb*/
			M.contents += new/obj/items/Clothing/Headband/
			

		Make_Chunin(mob/M in world)
			set category = "Admin"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			M.Class="Chunin"
			M.stat_cap = 134
			Admin_Logs+="<br>[usr]([usr.key]) uses Make_Chunin (Rank Cap Update) on [M]."
			if(M.Village=="Konohagakure")
				M.contents += new/obj/items/Clothing/Leaf_Chunin
			if(M.Village=="Uzushiogakure")
				M.contents += new/obj/items/Clothing/Rock_Chunin
			if(M.Village=="Amegakure")
				M.contents += new/obj/items/Clothing/Mist_Chunin
		//	M.progress_cap = 810

		Make_Tokubetsu_Jonin(mob/M in world)
			set category = "Admin"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			M.Class="Tokubetsu Jonin"
			M.stat_cap = 155
			Admin_Logs+="<br>[usr]([usr.key]) uses Make_Tokubetsu_Jonin (Rank Cap Update) on [M]."
			if(M.Village=="Konohagakure")
				M.contents += new/obj/items/Clothing/Leaf_Chunin
			if(M.Village=="Sunagakure")
				M.contents += new/obj/items/Clothing/Suna_Chunin
			if(M.Village=="Amegakure")
				M.contents += new/obj/items/Clothing/Mist_Chunin

		Make_Jonin(mob/M in world)
			set category = "Admin"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			M.Class="Jonin"
			M.stat_cap = 179
			Admin_Logs+="<br>[usr]([usr.key]) uses Make_Jonin (Rank Cap Update) on [M]."
			if(M.Village=="Konohagakure")
				M.contents += new/obj/items/Clothing/Leaf_Jounin
				M.contents += new/obj/Jounin
			if(M.Village=="Amegakure")
				M.contents += new/obj/items/Clothing/Suna_Jounin
				M.contents += new/obj/Jounin
			if(M.Village=="Yukigakure")
				M.contents += new/obj/items/Clothing/Mist_Jounin
				M.contents += new/obj/Jounin

		Make_Hancho(mob/M in world)
			set category = "Admin"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			M.Class="Hancho"
			M.stat_cap = 224
			Admin_Logs+="<br>[usr]([usr.key]) uses Make_Hancho (Rank Cap Update) on [M]."
			if(M.Village=="Konohagakure")
				M.contents += new/obj/items/Clothing/Leaf_Jounin
				M.contents += new/obj/Jounin
			if(M.Village=="Sunagakure")
				M.contents += new/obj/items/Clothing/Suna_Jounin
				M.contents += new/obj/Jounin
			if(M.Village=="Amegakure")
				M.contents += new/obj/items/Clothing/Mist_Jounin
				M.contents += new/obj/Jounin

		Give_Rank(mob/M in world)
			set category="Admin"
			switch(input("What rank would you like to give [M]?") in list("Shogun","Tsukage","Amekage","Hokage","Mizukage","Kazekage","Yukikage","Leaf Councillor 1","Leaf Councillor 2","Leaf Anbu Captain","Academy Headmaster","Leaf Head Chunin Instructor","Police Captain","Toad Sage","Snake Sage","Slug Sage","Nichibotsu Leader","Sage of the Six Paths","Farmer","Hachimon Master","Cancel"))
				if("Amekage")
					M.Class = "Amekage"
					M.Cap=800
					M.contents += new/obj/Amekage
					if(src.key!="") Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Amekage) on [M]."
				if("Shogun")
					Shogun=M.key
					M.Class="Shogun"
					M.Cap=1000
					M.contents += new/obj/Shogun
					M.contents += new/obj/EditVillagePage
					if(src.key!="") Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Shogun) on [M]."

				if("Hokage")
					Hokage=M.key
					M.Class="Hokage"
					M.Cap=800
					M.contents += new/obj/Hokage
					M.contents += new/obj/EditVillagePage
					M.contents += new/obj/ToggleGuardHostility
					if(src.key!="") Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Hokage) on [M]."
				if("Hachimon Master")
					Hachimon_Master=M.key
					M.Cap+=rand(100,400)
					if(src.key!="") Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Hachimon Master) on [M]."
					M.contents += new/obj/items/Clothing/Hachimon_Master
					M.contents += new/obj/Taijutsu/Hachimon_Tomon
					M.contents += new/obj/Taijutsu/Hachimon_Shoumon
					M.contents += new/obj/Taijutsu/Hachimon_Kyuumon
					M.contents += new/obj/Taijutsu/Hachimon_Seimon
					M.contents += new/obj/jutsu/Hachimon_Kaimon
					M.contents += new/obj/Taijutsu/Hachimon_Keimon
					M.contents += new/obj/Taijutsu/Hachimon_Kyomon
					M.contents += new/obj/Taijutsu/Hachimon_Shimon
				if("Mizukage")
					M.Class="Mizukage"
					Mizukage=M.key
					M.contents += new/obj/EditVillagePage
					M.contents += new/obj/ToggleGuardHostility
					M.contents += new/obj/Mizukage
					if(src.key!="") Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Mizukage) on [M]."
					M.Cap=800
				if("Kazekage")
					M.Class="Kazekage"
					Sunakage=M.key
					M.contents += new/obj/EditVillagePage
					M.contents += new/obj/ToggleGuardHostility
					M.contents += new/obj/Kazekage
					if(src.key!="") Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Kazekage) on [M]."
					M.Cap=800
				if("Tsukage")
					M.Class="Tsukage"
					Sunakage=M.key
					M.contents += new/obj/EditVillagePage
					M.contents += new/obj/ToggleGuardHostility
					M.contents += new/obj/Kazekage
					if(src.key!="") Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Kazekage) on [M]."
					M.Cap=800
				/*if("Yukikage")
					M.Class="Yukikage"
					Yukikage=M.key
					M.contents += new/obj/EditVillagePage
					M.contents += new/obj/ToggleGuardHostility
					M.contents += new/obj/Yukikage
					if(src.key!="") Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Yukikage) on [M]."
					M.Cap=800 */
				if("Farmer")
					M.Class="Farmer"
					M.contents += new/obj/Farmer
					M.contents += new/obj/items/Food/Carrot_Seeds
					M.contents += new/obj/items/Food/Cabbage_Seeds
					M.contents += new/obj/items/Food/Turnip_Seeds
					M.contents += new/obj/items/Food/Tomato_Seeds
					if(src.key!="") Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Farmer) on [M]."
					M.Cap=80
				if("Leaf Councillor 1")
					Leaf_Council=M.key
					M.contents += new/obj/Leaf_Council
					if(src.key!="") Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Leaf Councillor 1) on [M]."
				if("Police Captain")
					Police_Captain=M.key
					M.contents += new/obj/Police_Captain
					if(src.key!="") Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Police Captain) on [M]."
				if("Leaf Councillor 2")
					Leaf_Council1=M.key
					M.contents += new/obj/Leaf_Council
					if(src.key!="") Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Leaf Councillor 2) on [M]."
				if("Leaf Anbu Captain")
					Leaf_Anbu_Captain=M.key
					M.contents += new/obj/Leaf_Anbu_Captain
					M.contents += new/obj/items/Clothing/Anbu_Mask_Red
					M.contents += new/obj/items/Clothing/Anbu_Armor
					M.contents += new/obj/items/Clothing/Anbu_Mask_Blue
					if(src.key!="") Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Leaf Anbu Captain) on [M]."
				if("Leaf Head Chunin Instructor")
					Leaf_Head_Chunin_Instructor=M.key
					M.contents += new/obj/Leaf_Chunin_Instructor
					if(src.key!="") Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Leaf Head Chunin Instructor) on [M]."
				if("Academy Headmaster")
					Academy_Headmaster=M.key
					M.Occupation="Academy Headmaster"
					M.contents += new/obj/Academy_Headmaster
					if(src.key!="") Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Academy Headmaster) on [M]."
				if("Toad Sage")
					Toad_Sage=M.key
					M.contents += new/obj/Toad_Sage
					M.contents += new/obj/items/Clothing/Toad_Sage
					M.contents += new/obj/items/Clothing/Toad_Sage_Mask
					M.contents += new/obj/items/Scrolls/Toad_Summoning
					if(src.key!="") Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Toad Sage) on [M]."
				if("Snake Sage")
					Snake_Sage=M.key
					M.contents += new/obj/Snake_Sage
					M.contents += new/obj/items/Clothing/Snake_Sage
					if(src.key!="") Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Snake Sage) on [M]."
					M.contents += new/obj/Fuuinjutsu/Shikoku_Mujin
				if("Slug Sage")
					Slug_Sage=M.key
					M.contents += new/obj/Slug_Sage
					if(src.key!="") Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Slug Sage) on [M]."
				if("Nichibotsu Leader")
					Nichibotsu_Leader=M.key
					M.contents += new/obj/Nichibotsu_Leader
					if(src.key!="") Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Nichibotsu Leader) on [M]."
				if("Sage of the Six Paths")
					Sage_of_the_Six_Paths=M.key
					M.contents += new/obj/Sage_of_the_Six_Paths
					M.contents += new/obj/Doujutsu/Rinnegan
					if(src.key!="") Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Sage of the Six Paths) on [M]."
		/*		if("Tsuchikage")
					Tsuchikage=M.key
					M.Class="Tsuchikage"
					M.Cap=800
					M.contents += new/obj/Tsuchikage
					M.contents += new/obj/EditVillagePage
					M.contents += new/obj/ToggleGuardHostility
					if(src.key!="") Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Tsuchikage) on [M]."*/
			SaveRanks()
			SaveLogs()

		Rank_Edit(mob/M in world)
			set category = "Admin"
			var/Rank=input("What Rank would you like to give [M]?") as text
			if(Rank=="")
				return
			M.Class= Rank
			usr << "[M]'s Rank is now [Rank]"



/obj/Farmer
// Head Admin Role
mob/Admin4
	verb
		View_Archived_Scrolls()
			set category = "Admin"
			view_archived_scrolls = !(view_archived_scrolls)
			if(view_archived_scrolls)
				usr << "You are now viewing all archived scrolls."
			else
				usr << "You toggle archived scroll viewing off."
			return
		View_Archived_Perks()
			set category = "Admin"
			view_archived_perks = !(view_archived_perks)
			if(view_archived_perks)
				usr << "You are now viewing all archived perks."
			else
				usr << "You toggle archived perks viewing off."
			return

		View_Archived_Jutsu()
			set category = "Admin"
			view_archived_jutsu = !(view_archived_jutsu)
			if(view_archived_jutsu)
				usr << "You are now viewing all archived jutsu."
			else
				usr << "You toggle archived jutsu viewing off."
			return

		Ghostform()
			set category="Admin"
			if(!usr.Ghost)
				usr.Ghost=1
				usr.invisibility=1
				usr.density=0
				chakraOverlay.invisibility = 99
			else
				usr.Ghost=0
				usr.invisibility=0
				usr.density=1
				chakraOverlay.invisibility = 1

		AddMonth()
			set category = "Admin"
			set hidden = 1
			switch(input("Are you sure you want to add a month?") in list("Yes","Cancel"))
				if("Yes")
					var/num=input("How many?") as num
					while(num)
						for(var/mob/M in world)
							M.MaxStamina += (1 *0.0024/4.5)
							M.MaxChakra += (1 *0.0024/4.5)
							M.MaxStrength += (1 *0.0024/4.5)
							M.MaxAgility += (1 *0.0024/4.5)
							M.MaxDefence += (1 *0.0024/4.5)
							M.MaxOffence += (1 *0.0024/4.5)
							M.MaxControl += (1 *0.0018/4.5)
							M.MaxResistance += (1 *0.0018/4.5)
							M.MaxNinjutsu += (1 *0.0024/4.5)
							M.MaxGenjutsu += (1 *0.0024/4.5)
						//	M.Exp+=(1 *0.0024*usr.Exp/5.5)
						num--
						Month+=1
					world<<"<font size=-1>Current date is the [Day][Days(Day)] of [Months(Month)] in the year [Year+100]"
					YearCheck()
		YearAdd()
			set category = "Admin"
			set hidden = 1
			switch(input("Are you sure you want to add a year?") in list("Yes","Cancel"))
				if("Yes")
					Year+=1
					for(var/mob/M in world)
						M.Age += 1
						M.Log_Year=Year
						M.MaxStamina += (1 *0.0024/2.5)
						M.MaxChakra += (1 *0.0024/2.5)
						M.MaxStrength += (1 *0.0024/2.5)
						M.MaxAgility += (1 *0.0024/2.5)
						M.MaxDefence += (1 *0.0024/2.5)
						M.MaxOffence += (1 *0.0024/2.5)
						M.MaxControl += (1 *0.0018/2.5)
						M.MaxResistance += (1 *0.0018/2.5)
						M.MaxNinjutsu += (1 *0.0024/2.5)
						M.MaxGenjutsu += (1 *0.0024/2.5)
						var/hasryo=0
						for(var/obj/items/Ryo/R in M.contents)
							hasryo=R
						if(hasryo)
							hasryo:amount+=rand(160,470)
							hasryo:Update()
						else
							var/obj/items/Ryo/R=new(M)
							R.amount=rand(160,470)
							R.Update()
				//		M.Exp+=(1 *0.0024*usr.Exp/3.5)
					world<<"<font size=-1>Current date is the [Day][Days(Day)] of [Months(Month)] in the year [Year+100]"
		YearSpeed()
			set category="Admin"
			set hidden = 1
			YearSpeed=input("Adjust year speed.","[YearSpeed]")as num
			if(YearSpeed<=0)
				YearSpeed=1
			if(src.key!="") Admin_Logs+="<br>[usr]([usr.key]) adjusted the year speed to [YearSpeed]."
			SaveYear()
			SaveLogs()
		ManuallyRemoveAdmin()
			set category="Admin"
			var/list/Adminz=list()
			Adminz.Add(Admin1s,Admin2s,Admin3s)
			var/Choice=input("Remove which Admin?") as null|anything in Adminz
			if(Choice==null)return
			if(Admin1s.Find(Choice))
				Admin1s-=Choice
			if(Admin2s.Find(Choice))
				Admin2s-=Choice
			if(Admin3s.Find(Choice))
				Admin3s-=Choice
		Toggle_Say_Channel()
			set category="Admin"
			if(global.Say==1)
				global.Say=0
				world << "<b>Say has been disabled!"
			else
				global.Say=1
				world << "<b>Say has been enabled!"
		Reward_Influence_Points(mob/M in world)
			set category ="Admin"
			var/choice = input("How many influence points would you like to give them?") as num
			M.infpoints += choice
			M.lifetime_infpoints += choice
			M << output("You've been rewarded [choice] influence point(s)", "outputall.output")
			UpdateNotableList()
		Reward_Jutsu_Points(mob/M in world)
			set category = "Admin"
			var/choice = input("How many jutsu points would you like to give them?") as num
			M.jutsupoints += choice
			M <<  output("You've been rewarded [choice] jutsu point(s)", "outputall.output")

		Stat_Reset(mob/M in world)
			set category = "Admin"
			M.respec_points()
			usr << "[M.name]([M.key]) had their stats reset."
			M << "Your stats have been reset by an admin."


		Reset_Reqs()
			set category="Admin"
			if((input("Confirm?") in list("Yes", "No")) == "No")
				return
			for(var/obj/jutsu/a)
				a.prerequisites = list()
				world << "Reset [a] prerequisites to list()"
			world << "Reset complete."
		Edit_Player_Title(mob/M in world)
			set category="Admin"
			if(!M.client) return
			M.title = input("What would you like their title to be? Their current title is [M.title]") as text
			for(var/obj/notable/o in archive.notablelist)
				if(o.hold == M.ckey)
					o.title = M.title
				else
					continue

// Owner & Most server editing verbs
mob/Admin6/
	verb
		EditChronicle()
			set name="Edit Story"
			set category="Admin"
			Storyline=input(usr,"Edit","Edit Start Menu",Storyline) as message
			SaveStory()
			LoadStory()
		Invisible_Who()
			set category="Admin"
			InvisibleWho=!InvisibleWho
			src<<"You [InvisibleWho ? "no longer" : "now"] are visible on Who."
		Reset_Boosts()
			set category = "Admin"
			if(alert(src,"Are you sure you want to reset all boosts in perks?","Alert","Yes","No")=="No") return
			for(var/obj/jutsu/j in archive.contents)
				j.boost_strength = 0
				j.boost_endurance = 0
				j.boost_agility = 0
				j.boost_speed = 0
				j.boost_stamina = 0
				j.boost_control = 0
				j.boost_vitality = 0
				j.boost_kenjutsu = 0
		Set_Current_Arc()
			set category ="Admin"
			var/choice = input("What would you like the current arc to be set to?") as text
			archive.arc = choice

		Toggle_AutoGenin()
			set category="Admin"
			if(autogenin==1)
				autogenin=0
				world<<"Auto-genin is now disabled."
				return
			if(autogenin==0)
				autogenin=1
				world<<"Auto-genin is now enabled."
				return
		Set_AutoGenin()
			set category = "Admin"
			autogeninvalue = input("How much PP?") as num



		EditRules()
			set category="Admin"
			if(!WritingRules)
				WritingRules=1
				for(var/mob/M) if(M.Admin) M<<"[usr] is editing the Rules..."
				Rules=input(usr,"Edit","Edit Rules",Rules) as message
				for(var/mob/F) if(F.Admin) F<<"[usr] is done editing the Rules..."
				WritingRules=0
				SaveRules()
				LoadRules()
			else usr<<"<b>Someone is already editing the Rules."




		Edit_Notable_Threshold()
			set category = "Admin"
			noteworthy = input("How many influence points are needed to be notable?") as num

		Disable_Injuries()
			set category = "Admin"
			if(archive.injallow)
				archive.injallow = 0
				world<<"Injuries have been enabled."
			else
				archive.injallow = 1
				world<<"Injuries have been disabled."
		Set_DR_rate()
			set category = "Admin"
			var/newrate = input("What would you like the new percentage return on DRs to be? Between 1 and 100.") as num
			while(newrate > 100 || newrate < 1)
				newrate = input("Try a different number.") as num
			archive.DRrate = newrate / 100
			loss = 100 - newrate
			src<<"The new DR rate is [newrate]%."

		Update_Server_Status()
			set category = "Admin"
			world.status = input(src,"New world status?","World Status",world.status)

		Deactivate_Weapon_Sellers()
			set category="Admin"
			for(var/mob/NPC/Weapon_Supplier/W in world)
				W.Deactive=1
			for(var/mob/NPC/Sunagakure_Smith/W in world)
				W.Deactive=1
		Change_Time()
			set category="Admin"
			var/time=input("What time to change to?","Time Change") in list("Dawn","Dusk","Day","Night","Cancel")
			switch(time)
				if("Cancel")
					return
				if("Dawn")
					sd_OutsideLight(-4)
				//	for(var/area/Interior/A in world)
				//		A.sd_SetLuminosity(1)
				if("Dusk")
					sd_OutsideLight(4)
				//	for(var/area/Interior/A in world)
				//		A.sd_SetLuminosity(0)
				if("Day")
					sd_OutsideLight(7)
				//	for(var/area/Interior/A in world)
				//		A.sd_SetLuminosity(1)
				/*  REMOVED DUE TO COMPLAINTS, BURR
				if("Night")
					sd_OutsideLight(1)
				//	for(var/area/Interior/A in world)
				//		A.sd_SetLuminosity(0)
				*/
		GuideEdit()
			var/guide=input("Which guide do you want to edit?","Guides") in list("Siege","Genjutsu","Progress","DR","Ninjutsu","Dodge","Handseal","Damage","Medical","Stat","Talent","Projectile","Cancel")
			set category="Admin"
			if(guide=="Siege")
				archive.siegeguide=input("Edit the Guide!","Siege","[archive.siegeguide]")as message
			if(guide=="Genjutsu")
				archive.genjutsuguide=input("Edit the Guide!","Genjutsu","[archive.genjutsuguide]")as message
			if(guide=="Progress")
				archive.progressguide=input("Edit the Guide!","Progress","[archive.progressguide]")as message
			if(guide=="DR")
				archive.drguide=input("Edit the Guide!","DR","[archive.drguide]")as message
			if(guide=="Ninjutsu")
				archive.ninjutsuguide=input("Edit the Guide!","Ninjutsu","[archive.ninjutsuguide]")as message
			if(guide=="Dodge")
				archive.dodgeguide=input("Edit the Guide!","Dodge","[archive.dodgeguide]")as message
			if(guide=="Handseal")
				archive.handsealguide=input("Edit the Guide!","Handseal","[archive.handsealguide]")as message
			if(guide=="Damage")
				archive.damageguide=input("Edit the Guide!","Damage","[archive.damageguide]")as message
			if(guide=="Medical")
				archive.medicalguide=input("Edit the Guide!","Medical","[archive.medicalguide]")as message
			if(guide=="Stat")
				archive.statguide=input("Edit the Guide!","Stat","[archive.statguide]")as message
			if(guide=="Talent")
				archive.talentguide=input("Edit the Guide!","Talent","[archive.talentguide]")as message
			if(guide=="Projectile")
				archive.projectileguide=input("Edit the Guide!","Projectile","[archive.projectileguide]")as message
			archive.save_archive()
		NotepadEdit()
			set category="Admin"
			Notepad=input("Edit the Notepad!","Notepad","[Notepad]")as message
			var/savefile/F = new ("Notepad.sav")
			F["Notepad"]<< Notepad
mob/Admin3/verb

	/* No point in this shit being enabled for clan wars.
	Goto_Village()
		set category="Admin"
		switch(input("Which village?") in list("Tanzaku Town", "Yuki", "Hozuki", "Senju", "Akimichi","Aburame","Inuzuka","Nara","Hyuuga","Kaguya","Uchiha","Sarutobi","	",""))
			if("Sarutobi")
				loc = locate(101,94,20)

			if("Tanzaku Town")
				loc = locate(262,80,1)
			if("Yuki")
				loc = locate(134,293,3)
			if("Hozuki")
				loc = locate(262,80,1)
			if("Senju")
				loc = locate(156,280,5)
			if("Akimichi")
				loc = locate(165,281,7)

			if("Aburame")
				loc = locate(262,271,8)

			if("Inuzuka")
				loc = locate(228,271,8)

			if("Nara")
				loc = locate(165,281,7)

			if("Hyuuga")
				loc = locate(264,256,15)

			if("Kaguya")
				loc = locate(149,93,19)

			if("Uchiha")
				loc = locate(66,89,22)
*/
	/*	var/s=input("Which village?")in list("Kono","Suna","Kiri","Ame","Iwa")
		if(s=="Kono")
			usr.loc=locate(150,260,1)
			if(usr.chakraOverlay) usr.chakraOverlay.loc = usr.loc
			usr<<"<font color=red><I>You warp to Konohagakure!"
		if(s=="Suna")
			usr.loc=locate(77,210,10)
			if(usr.chakraOverlay) usr.chakraOverlay.loc = usr.loc
			usr<<"<font color=red><I>You warp to Sunagakure!"
		if(s=="Kiri")
			usr.loc=locate(115,193,3)
			if(usr.chakraOverlay) usr.chakraOverlay.loc = usr.loc
			usr<<"<font color=red><I>You warp to Kirigakure!"
		if(s=="Ame")
			usr.loc=locate(47,2,8)
			if(usr.chakraOverlay) usr.chakraOverlay.loc = usr.loc
			usr<<"<font color=red><I>You warp to Amegakure!"
		if(s=="Iwa")
			usr.loc=locate(273,15,7)
			if(usr.chakraOverlay) usr.chakraOverlay.loc = usr.loc
			usr<<"<font color=red><I>You warp to Iwagakure!"*/
	///	resetLuminosity()
	/* I'll fix these if there's a need, as they are for villages  that don't exist this wipe.
	Summon_Village()
		set category="Admin"
		var/s=input("Which village(Warning: This summons everyone in desired village)?")in list("Kono","Suna","Kiri","Iwa")
		if(s=="Kono")
			for(var/mob/M in world)
				if(M.Village=="Konohagakure")
					M.loc=usr.loc
					if(M.chakraOverlay) M.chakraOverlay.loc = M.loc
			usr<<"<font color=red><I>You summon all of konoha!"
		if(s=="Suna")
			for(var/mob/M in world)
				if(M.Village=="Sunagakure")
					M.loc=usr.loc
					if(M.chakraOverlay) M.chakraOverlay.loc = M.loc
			usr<<"<font color=red><I>You summon all of Sunagakure!"
		if(s=="Kiri")
			for(var/mob/M in world)
				if(M.Village=="Kirigakure")
					M.loc=usr.loc
					if(M.chakraOverlay) M.chakraOverlay.loc = M.loc
			usr<<"<font color=red><I>You summon all of kirigakure!"
		if(s=="Iwa")
			for(var/mob/M in world)
				if(M.Village=="Iwagakure")
					M.loc=usr.loc
					if(M.chakraOverlay) M.chakraOverlay.loc = M.loc
			usr<<"<font color=red><I>You summon all of Iwagakure!"
	View_VillageInfo()
		set category="Admin"
		var/s=input("Which village?")in list("Kono","Suna","Kiri")
		if(s=="Kono")
			var/b=""
			for(var/v in KonoNin)
				b+="[v]<br>"
			usr<<browse("<center><B><font color=red><big>Konoha Information!</big></B></center><font color=white><hr>[b]","window= ")
		if(s=="Suna")
			var/b=""
			for(var/v in SunaNin)
				b+="[v]<br>"
			usr<<browse("<center><B><font color=red><big>Sunagakure Information!</big></B></center><font color=white><hr>[b]","window= ")
		if(s=="Kiri")
			var/b=""
			for(var/v in KiriNin)
				b+="[v]<br>"
			usr<<browse("<center><B><font color=red><big>Kirigakure Information!</big></B></center><font color=white><hr>[b]","window= ")
			*/
var/list/Bans=new

proc/Save_Ban()
	var/savefile/S=new("Ban Save")
	S["Bans"]<<Bans
proc/Load_Ban()
	if(fexists("Ban Save"))
		var/savefile/S=new("Ban Save")
		S["Bans"]>>Bans
mob/Topic(href,href_list[])
	switch(href_list["action"])
		if("edit")
			if(!usr:Admin && !usr:EventAdmin)
				world << "[usr:ckey] is gay"
				return
			/*
			var/variable=href_list["var"]
			var/class=input(usr,"Change [variable] to what?","Variable Type") as null|anything in list("text","num","type","reference","icon","file","restore to default")
			if(!class) return
			switch(class)
				if("restore to default") vars[variable]=initial(vars[variable])
				if("text") vars[variable]=input("Enter new text:","Text",vars[variable]) as text
				if("num") vars[variable]=input("Enter new number:","Num",vars[variable]) as num
				if("type") vars[variable]=input("Enter type:","Type",vars[variable]) in typesof(/atom)
				if("reference") vars[variable]=input("Select reference:","Reference", vars[variable]) as mob|obj|turf|area in world
				if("file") vars[variable]=input("Pick file:","File",vars[variable]) as file
				if("icon") vars[variable]=input("Pick icon:","Icon",vars[variable]) as icon
			usr:Edit(src)*/
			//if(!usr:Admin) return
			var/variable = href_list["var"]
			var/vari = src.vars[variable]
			if(istype(vari,/list))
				switch(input(usr,"Do what?") as null|anything in list("Edit List","View List"))
					if("Edit List")
						var/x=input(usr,"Enter new list, Divide each entry by ; (EX. Item1;Item2; etc.):",,dd_list2text(vari,";"))as null|text
						if(x)vari=dd_text2list(x,";")
					if("View List")
						for(var/L in vari)
							usr << L
				return
			var/class = input(usr,"Change [variable] to what?","Variable Type") as null|anything \
				in list("text","num","type","reference","verb","icon","file","list","true","false","list","restore to default")

			if(!class) return

			var/initialvar
			switch(class)
				if("restore to default")
					initialvar=src.vars[variable]
					src.vars[variable] = initial(src.vars[variable])
				if("text")
					initialvar=src.vars[variable]
					if(variable == "desc") src.vars[variable] = input(usr,"Enter new text:","Text",src.vars[variable]) as message
					else src.vars[variable] = input(usr,"Enter new text:","Text",src.vars[variable]) as text
				if("num")
					initialvar=src.vars[variable]
					src.vars[variable] = input(usr,"Enter new number:","Num",src.vars[variable]) as num
				if("type")
					initialvar=src.vars[variable]
					src.vars[variable] = input(usr,"Enter type:","Type",src.vars[variable]) \
						in typesof(/atom)
				if("reference")
					initialvar=src.vars[variable]
					src.vars[variable] = input(usr,"Select reference:","Reference", \
						src.vars[variable]) as mob|obj|turf|area in world
				if("file")
					initialvar=src.vars[variable]
					src.vars[variable] = input(usr,"Pick file:","File",src.vars[variable]) \
						as file
				if("icon")
					initialvar=src.vars[variable]
					src.vars[variable] = input(usr,"Pick icon:","Icon",src.vars[variable]) \
						as icon
				if("list")
					initialvar=src.vars[variable]
					var/l = list()
					src.vars[variable] = l
					usr.list_view(l,variable)
				if("verb")
					initialvar=src.vars[variable]
					src.vars[variable] = text2path(input(usr,"Type in the verb's path:","Verb",src.vars[variable]) as text)
				if("true")
					initialvar=src.vars[variable]
					src.vars[variable] = 1
				if("false")
					initialvar=src.vars[variable]
					src.vars[variable] = null
			if(istype(src, /obj/jutsu))
				var/obj/jutsu/a = src
				a.last_edit = world.realtime

			if(istype(src, /obj/items/weapons))
				var/obj/items/weapons/wep = src
				wep.last_edit = world.realtime

			usr:Edit(src)
			for(var/mob/M in world)
				if(M.Admin)
					M<< {"<font color=#F88017>[usr] used edit on [src] and changed [html_encode(variable)] from [initialvar] to [html_encode(src.vars[variable])]."}
			Admin_Logs+="<br>[usr]([usr.key]) used edit on [src] and changed [variable] from [html_encode(initialvar)] to [html_encode(src.vars[variable])]."
			SaveLogs()
		if("PM")
			if(!src:Admin) return
			var/mob/M
			for(var/mob/x in world)
				if(x.ckey==href_list["player"]) M=x
			if(!M||!ismob(M)) return
			var/message=input("Say what? (Blank to cancel)") as text
			if(!message) return
			for(var/mob/MM in world)
				if(MM.Admin) MM<<output("<font size = -3><b><font color=yellow>[src:displaykey] whispers to [M]:</b></font> [html_encode(message)]","outputic.output")
				if(MM.Admin) MM<<output("<font size = -3><b><font color=yellow>[src:displaykey] whispers to [M]:</b></font> [html_encode(message)]","outputall.output")
			M<<output("<font size = -3><b><font color=yellow><a href=?src=\ref[M];action=PMp;player=[src:ckey]>[src:displaykey]</a> whispers you:</b></font> [html_encode(message)]","outputic.output")
			M<<output("<font size = -3><b><font color=yellow><a href=?src=\ref[M];action=PMp;player=[src:ckey]>[src:displaykey]</a> whispers you:</b></font> [html_encode(message)]","outputall.output")

		if("PMp")
			var/mob/M
			for(var/mob/x in world)
				if(x.ckey==href_list["player"]) M=x
			if(!M||!ismob(M)) return
			var/message=input("Say what? (Blank to cancel)") as text
			if(!message) return
			for(var/mob/MM in world)
				if(MM.Admin && MM != M) MM<<output("<font size = -3><b><font color=green>[src:displaykey] whispers to [M]:</b></font> [html_encode(message)]","outputic.output")
				if(MM.Admin && MM != M) MM<<output("<font size = -3><b><font color=green>[src:displaykey] whispers to [M]:</b></font> [html_encode(message)]","outputall.output")
			M<<output("<font size = -3><b><font color=green><a href=?src=\ref[M];action=PM;player=[src:ckey]>[src:displaykey]</a> whispers you:</b></font> [html_encode(message)]","outputic.output")
			M<<output("<font size = -3><b><font color=green><a href=?src=\ref[M];action=PM;player=[src:ckey]>[src:displaykey]</a> whispers you:</b></font> [html_encode(message)]","outputall.output")
			src<<output("<font size = -3><b><font color=green>You whisper to [M:displaykey]: [html_encode(message)]","outputic.output")
			src<<output("<font size = -3><b><font color=green>You whisper to [M:displaykey]: [html_encode(message)]","outputall.output")


		if("Perk")
			var/obj/jutsu/O
			for(var/obj/jutsu/x in world)
				if(md5(x.name)==href_list["perk"]) O=x
			usr<<output(null,"Perk.Description")
			usr<<output(null,"Perk.Name")
			//winset(usr,"Perk","is-visible=true")

			//var/icon/I = icon(O.icon,O.icon_state)
			//var/newPicture = fcopy_rsc(I)
			//winset(usr,"Perk.Picture","image=\ref[newPicture]")
			//winset(usr,"Perk.Name","text=\"[O.name]\"")
			//winshow(usr,"Perk.Show",0)
			//usr<<output("[O.desc]<br>[O.perk_note]","Perk.Description")
			if(O.jutsu_type!="perk")
				usr<<browse(O.desc,"window=[src];size=384x542")
			else
				usr<<browse({"
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style>
body{
color:[O.perk_color];
background-color:#0b0f12;
font-family:calibri;
}
table, th, td {
  vertical-align: top;
  padding-left: 15px;
  font-size:13px;
}
.leftcolumn {
color:#DDBE0D;
}
</style>
</head>
<body>

<table style="width:100%">
  <tr>
    <td><div class=leftcolumn>Name</div></td>
    <td><b>[O.name]</b></td>
  </tr>
  <tr>
    <td><div class=leftcolumn>Desc</div></td>
    <td><font color=white>[O.desc]</font></td>
  </tr>
   <tr>
    <td><div class=leftcolumn>Note</div></td>
    <td><i>[O.perk_note]</i></td>
  </tr>
</table>
</body>
</html>

"},"window=[src];size=494x213")


		if("Purchase")
			var/obj/jutsu/O
			for(var/obj/jutsu/x in world)
				if(md5(x.name)==href_list["perk"])
					O=x
			if(O.jutsu_type == "perk")
				usr.databaseperk = O
				BuySelectedPerk()
			else
				usr.databasejutsu = O
				BuySelectedJutsu()

		if("Preview")
			var/obj/jutsu/O
			for(var/obj/jutsu/x in world)
				if(md5(x.name)==href_list["perk"])
					O=x
			usr <<browse({"

<html>
<title>Jutsu</title>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=10">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style>
table, th{
  border:1px solid black;
  text-align: left;
  margin: 1px;
}
table {
  width: 100%;
  border-style: solid;
  border-color: #2B3A47;
  text-align: left;
}

body {
   background-color: black;
   font-family: calibri;
   text-align: left;
}

p {
  margin:4px;
  font-size: 11px;
  text-align:left;
}

</style>
</head>

<body>

<table style="width:100%">
  <tr>
    <th><center><font color="#E6C208" size="2">[O.name]</font></center></th>
  </tr>
</table>

<center>

<video width="100%" height="100%" autoplay onclick="this.paused ? this.play() : this.pause();">
<source src="[O.video]" type="video/mp4">
Your browser does not support the video tag.
</video>

</center>

<table style="width:100%">
  <tr>
    <th><center><font color="#E6C208" size="2">[O.english_name]</center></th>
  </tr>
</table>

<table style="width:100%">
<tr>
    <td style="font-size:12px" bgcolor="black"><font color="#E6C208"><center><br><br><img src="https://www.ethnicmusical.com/wp-content/uploads/2019/04/lock-icon-transparent-8.png"><br><br></td>
  </tr>
</table>

</body>
</html>


"},"window=[src];size=384x542")




		if("Buy")
			var/obj/items/weapons/O
			for(var/obj/items/weapons/x in world)
				if(md5(x.name)==href_list["weap"])
					O=x

			var/current_resources = usr.current_vendor.minerals_available
			if(current_resources - O.mineral_cost < 0)
				usr << output("Not enough resources to produce this weapon.([current_resources]/[O.mineral_cost]).","outputall.output")
				return

			switch(input("Are you sure you wish to have [O.name] crafted?") in list("No","Yes"))
				if("Yes")
					for(var/obj/items/Bars/R in usr.contents)
						if(R.amount >= O.mineral_cost)
							R.amount -= O.mineral_cost
							R.Update()

							var/obj/items/weapons/U = new(usr)
							for(var/variable in O.vars - "transform")
								if(issaved(O.vars[variable]))
									U.vars[variable] = O.vars[variable]

							usr << output("The blacksmith forges [O.name] for [O.mineral_cost] minerals.","outputall.output")
							usr.current_vendor.minerals_available -= O.mineral_cost
						else
							usr << output("You cannot afford [O.name].","outputall.output")
		if("Hidden")
			var/obj/HiddenAction/O
			for(var/obj/HiddenAction/x in world)
				if(md5(x.ID)==href_list["hidden"])
					O=x

			for(var/mob/U in world)
				if(U == O.owner)
					switch(input("Do you wish to reveal '[O.action]' (hidden action) to [usr]?") in list("No","Yes"))
						if("Yes")
							usr << output("[O.action] <font color=[U.SayFont]><br>([usr.getStrangerName(U)]).","outputall.output")
						if("No")
							usr << output("This action is still hidden.","outputall.output")

		if("Weapon")
			var/obj/items/O
			for(var/obj/items/x in world)
				if(md5(x.name)==href_list["weapon"]) O=x
			usr<<output(null,"Weapon.Description")
			usr<<output(null,"Weapon.Name")
			winset(usr,"Weapon","is-visible=true")

			var/icon/I = icon(O.icon,O.icon_state)
			var/newPicture = fcopy_rsc(I)
			winset(usr,"Weapon.Picture","image=\ref[newPicture]")
			winset(usr,"Weapon.Name","text=\"[O.name]\"")
			winshow(usr,"Weapon.Show",0)
			usr<<output("[O.Description]","Weapon.Description")



		if("listview")
			if(!Admin) return
			list_view(locate(href_list["list"]),href_list["title"])
		if("listedit")
			if(!Admin) return
			var/list/theList = locate(href_list["list"])
			var/title = href_list["title"]
			var/old_index = text2num(href_list["value"])
			switch(href_list["part"])
				if("indexnum")
					var/new_index = input("Enter new index") as num
					if(new_index <= 0 || new_index==old_index || new_index > length(theList)) return
					var/original_key = theList[old_index]
					var/original_value = theList[original_key]
					var/next = old_index<new_index?1:-1 //Either going forward or backward
					for(var/i = old_index, i!=new_index, i+= next)
						var/new_key = theList[i+next]
						var/new_value = theList[new_key]
						theList[i] = new_key
						theList[i+next] = null //So that there aren't two identical keys in the list
						theList[new_key] = new_value
					theList[new_index] = original_key
					theList[original_key] = original_value
				if("key")
					var/old_value = theList[theList[old_index]]
					var/class = input(usr,"Change [theList[old_index]] to what?","Variable Type") as null|anything \
						in list("text","num","type","reference","icon","file","list","true","false","restore to default")
					if(!class) return

					switch(class)
						if("restore to default")
							theList[old_index] = initial(theList[old_index])
						if("text")
							theList[old_index] = input("Enter new text:","Text",theList[old_index]) as text
						if("num")
							theList[old_index] = input("Enter new number:","Num",theList[old_index]) as num
						if("type")
							theList[old_index] = input("Enter type:","Type",theList[old_index]) \
								in typesof(/atom)
						if("reference")
							theList[old_index] = input("Select reference:","Reference", \
								theList[old_index]) as mob|obj|turf|area in world
						if("file")
							theList[old_index] = input("Pick file:","File",theList[old_index]) \
								as file
						if("icon")
							theList[old_index] = input("Pick icon:","Icon",theList[old_index]) \
								as icon
						if("list")
							var/l = list()
							theList[old_index] = l
							usr.list_view(l,"[title]\[[old_index]]")
						if("true")
							theList[old_index] = 1
						if("false")
							theList[old_index] = null
					theList[theList[old_index]] = old_value
				if("value")
					var/old_key = theList[old_index]
					var/class = input(usr,"Change [theList[old_index]] to what?","Variable Type") as null|anything \
						in list("text","num","type","reference","icon","file","list","true","false","restore to default")
					if(!class) return
					switch(class)

						if("restore to default")
							theList[old_key] = initial(theList[old_key])
						if("text")
							theList[old_key] = input("Enter new text:","Text",theList[old_key]) as text
						if("num")
							theList[old_key] = input("Enter new number:","Num",theList[old_key]) as num
						if("type")
							theList[old_key] = input("Enter type:","Type",theList[old_key]) \
								in typesof(/atom)
						if("reference")
							theList[old_key] = input("Select reference:","Reference", \
								theList[old_key]) as mob|obj|turf|area in world
						if("file")
							theList[old_key] = input("Pick file:","File",theList[old_key]) \
								as file
						if("icon")
							theList[old_key] = input("Pick icon:","Icon",theList[old_key]) \
								as icon
						if("list")
							var/l = list()
							theList[old_key] = l
							usr.list_view(l,"[title]\[[old_key]]")
						if("true")
							theList[old_key] = 1
						if("false")
							theList[old_key] = null
				if("add")
					theList += null
				if("delete")
					theList -= theList[old_index]

			usr.list_view(theList,title)
	. = ..()
atom/Topic(href,href_list[])
	switch(href_list["action"])
		if("editobj")
			if(!usr:Admin && !usr:EventAdmin)
				world << "[usr:ckey] is gay"
				return
			Edited(src)
			return
		if("edit")
			if(!usr:Admin && !usr:EventAdmin)
				world << "[usr:ckey] is gay"
				return
			/*if(!usr:Admin) return
			var/variable=href_list["var"]
			var/class=input(usr,"Change [variable] to what?","Variable Type") as null|anything in list("text","num","type","reference","icon","file","restore to default")
			if(!class) return
			switch(class)
				if("restore to default") vars[variable]=initial(vars[variable])
				if("text") vars[variable]=input("Enter new text:","Text",vars[variable]) as text
				if("num") vars[variable]=input("Enter new number:","Num",vars[variable]) as num
				if("type") vars[variable]=input("Enter type:","Type",vars[variable]) in typesof(/atom)
				if("reference") vars[variable]=input("Select reference:","Reference", vars[variable]) as mob|obj|turf|area in world
				if("file") vars[variable]=input("Pick file:","File",vars[variable]) as file
				if("icon") vars[variable]=input("Pick icon:","Icon",vars[variable]) as icon
			usr:Edit(src)*/
			//if(!usr:Admin) return
			var/variable = href_list["var"]
			var/vari = src.vars[variable]
			if(istype(vari,/list))
				switch(input(usr,"Do what?") as null|anything in list("Edit List","View List"))
					if("Edit List")
						var/x=input(usr,"Enter new list, Divide each entry by ; (EX. Item1;Item2; etc.):",,dd_list2text(vari,";"))as null|text
						if(x)vari=dd_text2list(x,";")
					if("View List")
						for(var/L in vari)
							usr << L
				return
			var/class = input(usr,"Change [variable] to what?","Variable Type") as null|anything \
				in list("text","num","type","reference","verb","icon","file","list","true","false","list","restore to default")

			if(!class) return

			var/initialvar
			switch(class)
				if("restore to default")
					initialvar=src.vars[variable]
					src.vars[variable] = initial(src.vars[variable])
				if("text")
					initialvar=src.vars[variable]
					if(variable == "desc") src.vars[variable] = input(usr,"Enter new text:","Text",src.vars[variable]) as message
					else src.vars[variable] = input(usr,"Enter new text:","Text",src.vars[variable]) as text
				if("num")
					initialvar=src.vars[variable]
					src.vars[variable] = input(usr,"Enter new number:","Num",src.vars[variable]) as num
				if("type")
					initialvar=src.vars[variable]
					src.vars[variable] = input(usr,"Enter type:","Type",src.vars[variable]) \
						in typesof(/atom)
				if("reference")
					initialvar=src.vars[variable]
					src.vars[variable] = input(usr,"Select reference:","Reference", \
						src.vars[variable]) as mob|obj|turf|area in world
				if("file")
					initialvar=src.vars[variable]
					src.vars[variable] = input(usr,"Pick file:","File",src.vars[variable]) \
						as file
				if("icon")
					initialvar=src.vars[variable]
					src.vars[variable] = input(usr,"Pick icon:","Icon",src.vars[variable]) \
						as icon
				if("list")
					initialvar=src.vars[variable]
					var/l = list()
					src.vars[variable] = l
					usr.list_view(l,variable)
				if("verb")
					initialvar=src.vars[variable]
					src.vars[variable] = text2path(input(usr,"Type in the verb's path:","Verb",src.vars[variable]) as text)
				if("true")
					initialvar=src.vars[variable]
					src.vars[variable] = 1
				if("false")
					initialvar=src.vars[variable]
					src.vars[variable] = null
			if(istype(src, /obj/jutsu))
				var/obj/jutsu/a = src
				a.last_edit = world.realtime
			if(istype(src, /obj/items/Weapon))
				var/obj/items/Weapon/wep = src
				wep.last_edit = world.realtime
			usr:Edit(src)
			for(var/mob/M in world) if(M.Admin)
				M<< {"<font color=#F88017>[usr] used edit on [src] and changed [html_encode(variable)] from [initialvar] to [html_encode(src.vars[variable])]."}

			Admin_Logs+="<br>[usr]([usr.key]) used edit on [src] and changed [variable] from [html_encode(initialvar)] to [html_encode(src.vars[variable])]."
			SaveLogs()
	.=..()
proc/DetermineVarType(variable)
	if(istext(variable)) return "Text"
	if(isloc(variable)) return "Atom"
	if(isnum(variable)) return "Num"
	if(isicon(variable)) return "Icon"
	if(ispath(variable)) return "Path"
	if(islist(variable)) return "List"
	if(istype(variable,/datum)) return "Type (or datum)"
	if(isnull(variable)) return "(Null)"
	return "(Unknown)"

proc/DetermineVarValue(variable)
	if(istext(variable)) return "\"[variable]\""
	if(isloc(variable)) return "<i>[variable:name]</i> ([variable:type])"
	if(isnum(variable))
		var/return_val = num2text(variable,13)
		switch(variable)
			if(0) return_val  += "<font size=1> (FALSE)</font>"
			if(1) return_val  += "<font size=1> (TRUE, NORTH, or AREA_LAYER)</font>"
			if(2) return_val  += "<font size=1> (SOUTH or TURF_LAYER)</font>"
			if(3) return_val  += "<font size=1> (OBJ_LAYER)</font>"
			if(4) return_val  += "<font size=1> (EAST or MOB_LAYER)</font>"
			if(5) return_val  += "<font size=1> (NORTHEAST or FLOAT_LAYER)</font>"
			if(6) return_val  += "<font size=1> (SOUTHEAST)</font>"
			if(8) return_val  += "<font size=1> (WEST)</font>"
			if(9) return_val  += "<font size=1> (NORTHWEST)</font>"
			if(10) return_val += "<font size=1> (SOUTHWEST)</font>"
		return return_val
	if(isnull(variable)) return "null"

	return "- [variable] -"

proc/Edited(atom/O)
	var/html = "<html><body bgcolor=black text=#CCCCCC link=white vlink=white alink=white>"
	var/variables[0]
	html += "<h3 align=center>[O.name] ([O.type])</h3>"
	html += "<table width=100%>\n"
	html += "<tr>"
	html += "<td>VARIABLE NAME</td>"
	html += "<td>PROBABLE TYPE</td>"
	html += "<td>CURRENT VALUE</td>"
	html += "</tr>\n"
	for(var/X in O.vars) variables += X
	variables-="key"
	variables-="contents"
	variables-="overlays"
	variables-="underlays"
	variables-="verbs"
	variables-="vars"
	variables-="group"
	variables-="Admin"
	variables-="profile"
	variables-="Oprofile"
//	if(usr.Admin!=4) variables-="displaykey"
	var/X
	for(X in variables)//src=\ref[O];action=edit;var=[X]
		html += "<tr>"
		html += "<td><a href=byond://?src=\ref[O];action=edit;var=[X]>"
		html += X
		html += "</a>"
		if(!issaved(O.vars[X]) || istype(X,/list))
			html += " <font color=red>(*)</font></td>"
		else html += "</td>"

		html += "<td>[DetermineVarType(O.vars[X])]</td>"
	/*	if(DetermineVarType(O.vars[X])=="List")
			html += "<td><a href=byond://?src=\ref[usr];action=listview;list=\ref[O.vars[X]];title=[X]>- /list -</a></td>"
		else
			html += "<td>[DetermineVarValue(O.vars[X])]</td>"
		html += "</tr>"*/
		if(DetermineVarType(O.vars[X])=="List")
			html += "<td><a href=byond://?src=\ref[usr];action=listview;list=\ref[O.vars[X]];title=[X]>- /list -</a></td>"
		else if(DetermineVarType(O.vars[X]) == "Atom")
			html += "<td><a href=byond://?src=\ref[O.vars[X]];action=editobj>[DetermineVarValue(O.vars[X])]</a></td>"
		else
			html += "<td>[DetermineVarValue(O.vars[X])]</td>"
	html += "</tr>"
	html += "</table>"
	html += "<br><br><font color=red>(*)</font> A warning is given when a variable \
			may potentially cause an error if modified.  If you ignore that warning and \
			continue to modify the variable, you alone are responsible for whatever \
			mayhem results!</body></html>"
	usr << browse(html,"window=Edit;size=400x400")

proc
	dd_replacetext(text, search_string, replacement_string)
		// A nice way to do this is to split the text into an array based on the search_string,
		// then put it back together into text using replacement_string as the new separator.
		var/list/textList = dd_text2list(text, search_string)
		return dd_list2text(textList, replacement_string)
	dd_text2list(text, separator)
		var/textlength      = length(text)
		var/separatorlength = length(separator)
		var/list/textList   = new /list()
		var/searchPosition  = 1
		var/findPosition    = 1
		var/buggyText
		while (1)															// Loop forever.
			findPosition = findtext(text, separator, searchPosition, 0)
			buggyText = copytext(text, searchPosition, findPosition)		// Everything from searchPosition to findPosition goes into a list element.
			textList += "[buggyText]"										// Working around weird problem where "text" != "text" after this copytext().

			searchPosition = findPosition + separatorlength					// Skip over separator.
			if (findPosition == 0)											// Didn't find anything at end of string so stop here.
				return textList
			else
				if (searchPosition > textlength)							// Found separator at very end of string.
					textList += ""											// So add empty element.
					return textList
	dd_list2text(list/the_list, separator)
		var/total = the_list.len
		if (total == 0)														// Nothing to work with.
			return

		var/newText = "[the_list[1]]"										// Treats any object/number as text also.
		var/count
		for (count = 2, count <= total, count++)
			if (separator) newText += separator
			newText += "[the_list[count]]"
		return newText

mob/proc/list_view(aList,title)
	if(!aList || !islist(aList)) return//CRASH("List null or incorrect type")
	var/html = {"<html><body bgcolor=gray text=#CCCCCC link=white vlink=white alink=white>
	[title]
	<table><tr><td><u>Index #</u></td><td><u>Index</u></td><td><u>Value</u></td><td><u>Delete</u></td></tr>"}
	for(var/i=1,i<=length(aList),i++)
		#define LISTEDIT_LINK "href=byond://?src=\ref[src];title=[title];action=listedit;list=\ref[aList]"
		html += "<tr><td><a [LISTEDIT_LINK];part=indexnum;value=[i]>[i]</a></td>"
		html += "<td><a [LISTEDIT_LINK];part=key;value=[i]>[aList[i]]([DetermineVarType(aList[i])][AddListLink(aList[i],title,i)])</td>"
		html += "<td><a [LISTEDIT_LINK];part=value;value=[i]>[aList[aList[i]]]([DetermineVarType(aList[aList[i]])][AddListLink(aList[aList[i]],title,i)])</a></td>"
		html += "<td><a [LISTEDIT_LINK];part=delete;value=[i]><font color=red>X</font></a></td></tr>"
	html += "</table><br><br><a [LISTEDIT_LINK];part=add>\[Add]</a></body></html>"
	if(title)
		src << browse(html,"window=[title]")
	else
		src << browse(html)
mob/proc/AddListLink(variable,listname,index)
	if(islist(variable))
		return "<a href=byond://?src=\ref[src];action=listview;list=\ref[variable];title=[listname]\[[index]]><font color=red>(V)</font></a>"