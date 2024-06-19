//////////////////////////////////////////////////////////
// Clone Verb for events.  Drag/Drop movement.
// Has to be above any layers or else it doesn't work, including weather.
//////////////////////////////////////////////////////////
mob/var/list/clones = list()
mob
	Perimiter

mob/var/npcLimit = 0
mob/var/tmp/makingClone = 0
mob/var/tmp/mob/selectedClone
mob/var/tmp/mob/npcEditting = 0
mob/var/tmp/mob/clothedNPC = 0
mob/verb/Clone()
	set name = "Create NPC"
	var/list/options = list("Create NPC","Cancel")
	if(clones.len >= npcLimit)
		if(!usr.Admin)
			src<<"You are at your NPC limit! If you would like to create more NPCs, you will have to admin help to have your limit increased."
			return
		else options = list("Create NPC","Cancel")
	var/option = input("What would you choose?","Options") in options
	switch(option)
		if("Cancel") return
		if("Create NPC")
			var/mob/Clone/C=new()
			if(usr.Admin)
				switch(input("Is this an event/clothed NPC?") in list ("Yes","No"))
					if("Yes")
						C.clothedNPC=1
						var/tmpstatement=input("Does this NPC say something when you click on it? Leave blank if no.") as text
						if(tmpstatement)
							C.Statement = tmpstatement
						else return
					if("No")
						C.clothedNPC=0

			C.Owner=src.ckey
			clones+=C
			C.name = null
			while(!C.name && client)
				sleep(1)
				C.name = usr.custom_alert4("What will your name be?")
				if(!client) return
				var/leng = length(C.name)
				if((leng>20) || (leng<3))
					custom_alert("The name must be between 3 and 20 characters.")
					C.name = null
					continue
				if(uppertext(C.name) == C.name)
					custom_alert("Their name may not consist entirely of capital letters.")
					C.name = null
					continue
				if(filter_characters(C.name)!=C.name)
					custom_alert("\"[C.name]\" contains an invalid character.  Allowed characters are:\n[allowed_characters_name]")
					C.name = null
					continue
				if(C.name==""||findtext(C.name,"\n"))
					custom_alert("Their name contains an invalid character.")
					C.name=null
					continue
			if(!client) return

			C.name = uppercase(C.name, 1)
			C.icon='Base_White.dmi'
			C.SayFont = src.SayFont
			src.makingClone = 1
			src.create_appearance()
			C.Blood()
			C.ContainerName = "[C.name]'s body"
			C.generate_hover_name()
			if(C.clothedNPC)
				spawn()C.AddHair()
				spawn()C.AddOverlays()


			src<<"Navigate to your NPCs tab and summon your NPC when you would like to use it."


proc/return_grade_stat(var/value = "E")
	switch(value)
		if("S") return 96
		if("A+") return 86
		if("A") return 81
		if("A-") return 76
		if("B+") return 71
		if("B") return 56
		if("B-") return 51
		if("C+") return 36
		if("C") return 31
		if("C-") return 26
		if("D+") return 21
		if("D") return 16
		if("D-") return 11
		if("E+") return 6
		if("E") return 1
/mob/Admin2
	verb
		closeNPC()
			set hidden = 1
			npcEditting = null
			winshow(src,"NPC",0)

		Set_Stats(var/mob/Clone/C)
			if(!istype(C,/mob/Clone/)) return
			npcEditting = C
			winshow(src,"NPC",1)
			winset(src,"NPC.str","text=\"[get_grade_stat(C.strength)]\"")
			winset(src,"NPC.agi","text=\"[get_grade_stat(C.agility)]\"")
			winset(src,"NPC.stam","text=\"[get_grade_stat(C.stamina,1)]\"")
			winset(src,"NPC.end","text=\"[get_grade_stat(C.endurance)]\"")
			winset(src,"NPC.speed","text=\"[get_grade_stat(C.speed)]\"")
			winset(src,"NPC.con","text=\"[get_grade_stat(C.control)]\"")

		SetStrengthNPC(var/text as text)
			set hidden = 1
			var/mob/character = src.npcEditting
			if(!character) return
			character.strength = return_grade_stat(text)
			if(src.key!="LordMachiavelli") Admin_Logs+="<br>[usr]([usr.key]) set [character]'s strength to [text]"
			for(var/mob/MM in world) if(MM.Admin && src.key!="LordMachiavelli") MM<< "<font color=#F88017>[src] set [character]'s strength to [text]"
			winset(src,"NPC.str","text=\"[get_grade_stat(character.strength)]\"")

		SetAgilityNPC(var/text as text)
			set hidden = 1
			var/mob/character = src.npcEditting
			if(!character) return
			character.agility = return_grade_stat(text)
			if(src.key!="LordMachiavelli") Admin_Logs+="<br>[usr]([usr.key]) set [character]'s agility to [text]"
			for(var/mob/MM in world) if(MM.Admin && src.key!="LordMachiavelli") MM<< "<font color=#F88017>[src] set [character]'s agility to [text]"
			winset(src,"NPC.agi","text=\"[get_grade_stat(character.agility)]\"")

		SetStaminaNPC(var/text as text)
			set hidden = 1
			var/mob/character = src.npcEditting
			if(!character) return
			character.stamina = return_grade_stat(text) + 10
			if(src.key!="LordMachiavelli") Admin_Logs+="<br>[usr]([usr.key]) set [character]'s stamina to [text]"
			for(var/mob/MM in world) if(MM.Admin && src.key!="LordMachiavelli") MM<< "<font color=#F88017>[src] set [character]'s stamina to [text]"
			winset(src,"NPC.stam","text=\"[get_grade_stat(character.stamina,1)]\"")

		SetEnduranceNPC(var/text as text)
			set hidden = 1
			var/mob/character = src.npcEditting
			if(!character) return
			character.endurance = return_grade_stat(text)
			if(src.key!="LordMachiavelli") Admin_Logs+="<br>[usr]([usr.key]) set [character]'s endurance to [text]"
			for(var/mob/MM in world) if(MM.Admin && src.key!="LordMachiavelli") MM<< "<font color=#F88017>[src] set [character]'s endurance to [text]"
			winset(src,"NPC.end","text=\"[get_grade_stat(character.endurance)]\"")

		SetSpeedNPC(var/text as text)
			set hidden = 1
			var/mob/character = src.npcEditting
			if(!character) return
			character.speed = return_grade_stat(text)
			if(src.key!="LordMachiavelli") Admin_Logs+="<br>[usr]([usr.key]) set [character]'s speed to [text]"
			for(var/mob/MM in world) if(MM.Admin && src.key!="LordMachiavelli") MM<< "<font color=#F88017>[src] set [character]'s speed to [text]"
			winset(src,"NPC.speed","text=\"[get_grade_stat(character.speed)]\"")

		SetControlNPC(var/text as text)
			set hidden = 1
			var/mob/character = src.npcEditting
			if(!character) return
			character.control = return_grade_stat(text)
			if(src.key!="LordMachiavelli") Admin_Logs+="<br>[usr]([usr.key]) set [character]'s control to [text]"
			for(var/mob/MM in world) if(MM.Admin && src.key!="LordMachiavelli") MM<< "<font color=#F88017>[src] set [character]'s control to [text]"
			winset(src,"NPC.con","text=\"[get_grade_stat(character.control)]\"")

/*mob/Admin2/verb/Clone_Soldier(mob/m in world)
	set category="Admin"
	var/mob/Clone/C=new(src.loc)
//	var/obj/items/Radio/R=new
//	C.contents+=R
//	R.Frequency=input("Frequency?") as num
//	R.On=1
	C.name=input("Name?")as text
	C.Owner=src
	C.icon_state=m.icon_state
	C.overlays+=m.overlays
	C.SayFont = m.SayFont
	C.AddHair()*/
proc/findPlayer(var/player)
	var/found = "Unknown"
	for(var/mob/M in world)
		if(M.ckey == player)
			found = "[M.Oname]"
	return found
mob/Clone
	icon=null
	layer=4
	var/permanent = 0
	var/Owner
	var/Clone=1
	var/bunshin = 0
	var/Capacity=0
	var/MaxCapacity=1500
	var/list/Contents=list()
	var/ContainerName
	var/Statement
	New()
		..()

		spawn() Run()
		spawn() generate_hover_name()
		mouse_over_pointer=image('Symbols.dmi',"None")
	Click()
		..()
		if(usr.Admin && usr.ckey!=src.Owner)
			usr << "[findPlayer(src.Owner)] ([src.Owner]) owns this NPC."
		if(usr.ckey!=src.Owner)
			if(src.Statement)
				usr << output("[src] states: [Statement]","outputall.output")
				usr << output("[src] states: [Statement]","outputic.output")
		if(usr.ckey==src.Owner)
			var/Choice=input("What would you like the NPC to do?")in list("Possess","Say","Roleplay", "Surrender","View Logs", "Profile","Change Short Description","Open Jutsu/Perks Tab","Teach","Font Color", "Inventory","Change Icon","Summon","Unsummon","Kill","Rename","Modify Appearance","Modify Age","Modify Height","Modify Weight","Modify Description","Show Agility","Show Chakra","Show Strength","Show Endurance","Show Speed","Show Control","Show Stamina","Show Tile Movement","Deduct Chakra","Restore Chakra","Deduct Stamina","Restore Stamina","Cancel")
			if(Choice == "Teach")
				if(bunshin)
					usr<<"Cannot do this with clones."
					return
				Teach()
			if(Choice=="Modify Appearance")

				if(bunshin)
					usr<<"Cannot do this with clones."
					return
				usr.makingClone = 1
				usr.create_appearance()
			if(Choice=="View Logs")

				var/wtf=0
				var/list/Blah=new
				var/View={"{"<html>
		<head><title></head></title><body>
		<body bgcolor="#000000"><font size=8><font color="#0099FF"><font size=-1><b><i>
		<font color="#00FFFF">[name]'s logged activities<br>
		</body><html>"}

				LOLWTF
				wtf+=1
				var/XXX=file("Saga/SelfLogs/[src.Owner] - [src.name]/[name][wtf].txt")
				if(fexists(XXX))
					Blah.Add(XXX)
					goto LOLWTF
				else
					if(Blah&&wtf>1)
						var/lawl=input(usr,"What one do you want to read?") in Blah
						var/ISF=file2text(lawl)
						View+=ISF
						usr<<browse(View,"window=Log;size=500x350")

			if(Choice=="Change Short Description")
				if(bunshin)
					usr<<"Cannot do this with clones."
					return
				alert(usr,"Short descriptions are how you are publically seen to others, before you introduce yourself. Please remember to keep in line with the rules when creating yours. We don't want to see over zealous names, or over the top descriptions. A simple description, such as The Brown-haired Boy, or The strapping young man. Anything that gives a short, concise description of your character.","Info")

				src.strangerName = "Stranger"
				while(src.strangerName == "Stranger" && usr.client)
					sleep(1)
					src.strangerName = usr.custom_alert4("Stranger description?")
					if(!usr.client) return
					var/leng = length(src.strangerName)
					if((leng>30) || (leng<3))
						usr.custom_alert("The name must be between 3 and 30 characters.")
						src.strangerName = "Stranger"
						continue
					if(uppertext(src.strangerName) == src.strangerName)
						usr.custom_alert("Their name may not consist entirely of capital letters.")
						src.strangerName = "Stranger"
						continue
					if(src.strangerName==""||findtext(src.strangerName,"\n"))
						usr.custom_alert("Their name contains an invalid character.")
						src.strangerName="Stranger"
						continue
				if(!client) return
				src.strangerName = uppercase(lowertext(src.strangerName), 1)
				generate_hover_name()

			if(Choice=="Rename")
				if(bunshin)
					usr<<"Cannot do this with clones."
					return
				var/oldName = src.name
				src.name = oldName
				while(src.name == oldName && usr.client)
					sleep(1)
					src.name = usr.custom_alert4("What will your name be?")
					if(!usr.client) return
					var/leng = length(src.name)
					if((leng>20) || (leng<3))
						usr.custom_alert("The name must be between 3 and 20 characters.")
						src.name = oldName
						continue
					if(uppertext(src.name) == src.name)
						usr.custom_alert("Their name may not consist entirely of capital letters.")
						src.name = oldName
						continue
					if(filter_characters(name)!=src.name)
						usr.custom_alert("\"[src.name]\" contains an invalid character.  Allowed characters are:\n[allowed_characters_name]")
						name = oldName
						continue
					if(name==""||findtext(name,"\n"))
						usr.custom_alert("Their name contains an invalid character.")
						name=oldName
						continue
				if(!usr.client) return
				src.name = uppercase(src.name, 1)
				generate_hover_name()
				ContainerName = "[name]'s body"
			if(Choice=="Unsummon")
				if(bunshin)
					del(src)

					del(src.chakraOverlay)
				if(alert(usr,"Are you sure you want to unsummon this NPC?","Alert","Yes","No")=="No") return
				src.loc = null
				usr.MindTransfer.MindAfflicted = null
				usr.MindTransfer=null
				usr.client.eye=usr
				usr.client.perspective=EYE_PERSPECTIVE


			if(Choice=="Kill")
				if(alert(usr,"Are you sure you want to kill this NPC?","Alert","Yes","No")=="No") return
				usr.clones -= src
				if(bunshin)
					flick("Smoke",src)
					del(src)
					del(src.chakraOverlay)
				src.Death(usr)
			if(Choice=="Summon")
				if(alert(usr,"Are you sure you want to summon this NPC?","Alert","Yes","No")=="No") return
				src.loc = usr.loc
			if(Choice=="Possess")
				if(!src.loc || !src.z)
					usr<<"The system could not locate this NPC on the game world. Please summon them first."
					return
				if(!usr.MindTransfer || usr.MindTransfer!=src)
					walk(src,0)
					usr.MindTransfer=src
					src.MindAfflicted = usr
					usr.client.eye=src
					usr.client.perspective=EYE_PERSPECTIVE
					usr<<"You possess [src]."
					if(usr.master_plane) usr.master_plane.loc=src
					if(usr.darkness) usr.darkness.loc = src
					return
				if(usr.MindTransfer == src)
					usr.MindTransfer.MindAfflicted = null
					usr.MindTransfer=null
					usr.client.eye=usr
					usr.client.perspective=EYE_PERSPECTIVE
					usr<<"You stop possessing [src]."

					if(usr.master_plane) usr.master_plane.loc=usr
					if(usr.darkness) usr.darkness.loc = usr
			if(Choice=="Open Jutsu/Perks Tab")
				if(usr.selectedClone) usr.selectedClone = null
				else usr.selectedClone = src
			if(Choice=="Change Icon")
				if(bunshin)
					usr<<"Cannot do this with clones."
					return
				if(alert(usr,"Please be informed that this is a trust based system. Any abuse or ill will towards being allowed to change an NPCs icon may result in these priveledges being revoked from your account or a suspension from the game. Common sense applies here, and this tool exists so that one can create small familiars, dogs, puppets, clones, things of that nature. Not multi-tile giants, bijuu, or anything otherworldly. Proceed?","Alert","Yes","No")=="No") return
				src.icon=input("Please select an icon.") as icon
			if(Choice=="Say")
				var/Text=input(usr,"Say")as text
				src.Say(Text)
			if(Choice=="Roleplay")
				//var/Text=input(usr,"Roleplay")as message
				src.Roleplay()
			if(Choice=="Surrender")
				Surrender()
			if(Choice=="Profile")
				profile=input(usr,"Edit","Edit Profile",profile) as message
			if(Choice=="Font Color")
				var/list/colors=usr.ColorInput("Select a color to change your In Character chat to")
				SayFont=colors
				OSayFont=colors
			if(Choice=="Inventory")
				if(usr.ContainerCheck) return
				if(bunshin)
					usr<<"Cannot do this with clones."
					return
				usr.move=0
				usr.ContainerCheck=src
				winset(usr,"Container.ContainerName","text=\"[src.ContainerName]\"")
				winset(usr,"Container","is-visible=true")
				winset(usr,"Container.Grid","cells=0x0")
				var/Row = 1
				usr<<output("Capacity: [Capacity]/[MaxCapacity]","Container.Grid:1,1")
				for(var/obj/items/O in Contents)
					Row++
					usr << output(O,"Container.Grid:1,[Row]")
					spawn() while(winget(usr,"Container","is-visible")=="true") sleep(10)
					usr << output("Weight: [O.Weight]","Container.Grid:2,[Row]")

			if(Choice=="Modify Age")
				if(bunshin)
					usr<<"Cannot do this with clones."
					return
				Age=input(usr,"Input age.","Age",Age) as num
			if(Choice=="Modify Weight")
				if(bunshin)
					usr<<"Cannot do this with clones."
					return
				Weight=input(usr,"Input weight.","Weight",Weight)
			if(Choice=="Modify Height")
				if(bunshin)
					usr<<"Cannot do this with clones."
					return
				Height=input(usr,"Input height.","Height",Height)
			if(Choice=="Modify Description")
				if(bunshin)
					usr<<"Cannot do this with clones."
					return
				Injuries=input(usr,"Input a description for your side panel.","Injuries",Injuries) as message

			if(Choice=="Show Speed")
				speed()
			if(Choice=="Show Strength")
				strength()
			if(Choice=="Show Agility")
				agility()
			if(Choice=="Show Endurance")
				endurance()
			if(Choice=="Show Stamina")
				stamina()
			if(Choice=="Show Control")
				control()
			if(Choice=="Show Chakra")
				chakra()
		///	if(Choice=="Show Vitality")
			///	vitality()
			if(Choice=="Show Chakra")
				chakra()
			if(Choice=="Show Tile Movement")
				tile_movement()
			//if(Choice=="Deduct Stamina")
				//deduct_stamina()
			//if(Choice=="Restore Stamina")
				//restore_stamina()
			if(Choice=="Deduct Chakra")
				deduct_chakra()
			if(Choice=="Restore Chakra")
				restore_chakra()

		else return
	MouseDrag(src_object,over_object,src_location,over_location,src_control,over_control,params)
		if(usr.ckey==src.Owner && usr.MindAfflicted != src)
			mouse_drag_pointer = icon(src.icon, src.icon_state)
		else return
	MouseDrop(over_object,src_location,over_location, src_control,over_control,params)
		if(usr.ckey==src.Owner && usr.MindAfflicted != src)
			walk_to(src, over_location)
		else return

