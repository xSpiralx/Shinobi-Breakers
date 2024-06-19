var/KonohagakureNotes={"html><head><title>Konohagukure Village Notes</title><body><body bgcolor="#000000">
<font color=green><font size=3>"}
var/KirigakureNotes={"html><head><title>Kirigakure Village Notes</title><body><body bgcolor="#000000">
<font color=green><font size=3>"}
var/SunagakureNotes={"html><head><title>Sunagakure Village Notes</title><body><body bgcolor="#000000">
<font color=green><font size=3>"}
var/IronNotes={"html><head><title>Northern Temple Notes</title><body><body bgcolor="#000000">
<font color=green><font size=3>"}


mob
	verb
		Village_Board()
			set category="Commands"
			set hidden=1

obj/ToggleGuardHostility
	verb/ToggleGuardHostility()
		set category="Rank"
		switch(alert(usr,"Toggle hostility of all the guards.","What?","Hostile","Peaceful"))
			if("Hostile")
				world<<"<font color=red>Village Information:<font color=white> [usr.Village] is attacking all outsiders!"
				for(var/mob/Guard/M in world)
					if(M.Village == usr.Village)
						M.hostile=1
			if("Peaceful")
				world<<"<font color=red>Village Information:<font color=white> [usr.Village] is no longer attacking all outsiders!"
				for(var/mob/Guard/M in world)
					if(M.Village == usr.Village)
						M.hostile=0
obj/EditVillagePage
	verb
		EditPage()
			set category="Rank"
			set hidden=1
proc/SaveVillageNotes()
	var/savefile/A = new ("Saga/KonohagakureNotes")
	A["[KonohagakureNotes]"]<< KonohagakureNotes
	var/savefile/B = new("Saga/KirigakureNotes")
	B["[KirigakureNotes]"]<< KirigakureNotes
	var/savefile/C = new ("Saga/SunagakureNotes")
	C["[SunagakureNotes]"]<< SunagakureNotes
	var/savefile/X = new ("Saga/IronNotes")
	X["[IronNotes]"]<< IronNotes
proc/LoadVillageNotes()
	if(fexists("Saga/KonohagakureNotes"))
		var/savefile/ZZ =new("Saga/KonohagakureNotes")
		ZZ["[KonohagakureNotes]"]>> KonohagakureNotes
	if(fexists("Saga/KirigakureNotes"))
		var/savefile/XX =new("Saga/KirigakureNotes")
		XX["[KirigakureNotes]"]>> KirigakureNotes
	if(fexists("Saga/SunagakureNotes"))
		var/savefile/YY =new("Saga/SunagakureNotes")
		YY["[SunagakureNotes]"]>> SunagakureNotes
	if(fexists("Saga/IronNotes"))
		var/savefile/YYY =new("Saga/IronNotes")
		YYY["[IronNotes]"]>> IronNotes


obj/Clan
	verb
		Recruit()
			set category = "Clan"
			var/list/V = new/list
			for(var/mob/M in oviewers())
				if(M.client)
					if(M.Clan ==""|M.Clan=="None")
						V.Add(M)
			var/mob/A=input("Who would you like to ask to join your clan?") in V
			if(A==null)
				return
			switch(alert(A,"[usr] has invited you to their clan, [usr.Clan]","","Accept","Deny"))
				if("Accept")
					A.Clan = "[usr.Clan]"
					A.verbs += /obj/Clan/verb/Leave_Clan
					for(var/mob/B in world)
						if(B.Clan=="[usr.Clan]")
							B << "[A] has joined [usr.Clan]"
		Rename()
			set category = "Clan"
			var/list/V = new/list
			for(var/mob/M in oviewers())
				if(M.client)
					if(M.Clan == usr.Clan)
						V.Add(M)
			var/mob/A=input("Who would you like to rename?") in V
			if(A==null)
				return
			var/newname = input(A,"Please choose a first name, your last name will be your new clan name") as text

			A.name = "[A.Clan],[newname]"
			A.Oname = "[A.Clan],[newname]"
			A.generate_hover_name()

		Exile()
			set category = "Clan"
			var/list/V = new/list
			for(var/mob/M in oviewers())
				if(M.client)
					if(M.Clan == usr.Clan)
						V.Add(M)
			var/mob/A=input("Who would you like to exile from [usr.Clan]?") in V
			if(A==null)
				return
			A.Clan="None"
			A.verbs -= /obj/Clan/verb/Leave_Clan
			for(var/obj/Clan/B in usr.contents)
				del(B)

		Announce(msg as text)
			set category = "Clan"
			if(msg=="")
				return
			for(var/mob/M in world)
				if(M.Clan==usr.Clan)
					M << "<center>---Clan Announcement---"
					M << "<center>[msg]"
					M << "<center>--[usr]--"

		Make_Clan_Leader()
			set category = "Clan"
			var/list/V = new/list
			for(var/mob/M in oviewers())
				if(M.client)
					if(M.Clan == usr.Clan)
						V.Add(M)
			var/mob/A=input("Who would you like to make the leader of [usr.Clan]?") in V
			if(A==null)
				return
			usr.contents -= /obj/Clan
			for(var/obj/Clan/B in usr.contents)
				del(B)
			usr.verbs += /obj/Clan/verb/Leave_Clan
			A.verbs -= /obj/Clan/verb/Leave_Clan
			A.contents += /obj/Clan

		Leave_Clan()
			set category = "Clan"
			switch(input("Are you sure you wish to leave your group?") in list("Yes","No"))
				if("Yes")
					usr.Clan = "None"
					usr.verbs -= /obj/Clan
					for(var/obj/Clan/B in usr.contents)
						del(B)