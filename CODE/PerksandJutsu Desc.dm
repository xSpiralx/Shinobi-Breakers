
proc/copyatom(atom/a)
	if(!a) return
	var/atom/b = new a.type
	b.name = a.name
	for(var/v in a.vars)
		if(issaved(a.vars[v]))
			if(istype(a.vars[v], /list))
				var/list/x = new/list()
				for(var/val in a.vars[v])
					if(istype(val, /atom))
						x += copyatom(val)
					else
						x += val
				b.vars[v] = x
			else
				b.vars[v] = a.vars[v]
	return b
/*
  proc/copyatom(atom/a)
    if(!a) return
    var/atom/b = new a.type
    b.name = a.name
    for(var/v in a.vars)
        if(issaved(a.vars[v]))
            b.vars[v] = a.vars[v]
    return b*/

var/list/PerkDatabase=list()
var/perkDatabaseLoaded = 0

proc/
	Perk_List_Load()
		if(fexists("Perksave.sav"))
			var/savefile/F=new("Perksave.sav")
			F["Perksave.sav"]>> PerkDatabase
			for(var/obj/Perk/perk/P in PerkDatabase)
				if(!istype(P,/obj/Perk/perk/)) del(P)
			perkDatabaseLoaded = 1
	Perks_List_Save()
		var/savefile/F = new ("Perksave.sav")
		F["Perksave.sav"]<< PerkDatabase
mob/Admin2
	verb
		Copy(var/obj/o in world)
			set category="Admin"
			var/obj/n = copyatom(o)
			n.loc = o.loc
/*		Give_Perk(mob/M in world)
			set category = "Admin"
			var/list/Perks=list()
			for(var/i in typesof(/obj/Perk/perk/) - /obj/Perk/perk)
				Perks+= new i
			var/obj/Perk/P=input("Which perk will you give them?","Database") in Perks
			if(!P) return
			var/obj/Perk/perk/O = new P.type
			M.contents+=O
			for(var/mob/MM in world) if(MM.Admin && src.key!="LordMachiavelli") MM<< {"<font color=#F88017>[src] gives [M] [O.name] perk."}
			if(src.key!="LordMachiavelli") Admin_Logs+="<br>[src]([src.key]) gave [M] a perk ([O.name])"
			M.rewardLog+="([time2text(world.realtime)]) [src]([src.key]) gave [M] [O.name] perk<br>"
			SaveLogs()*/

					//This person is fast, allowing them to both accelerate and maintain an above average speed. (2 OOC tiles)




/*		Give_JutsuDesc(mob/M in world) // Also there Is something wrong with Haku Clan Idk what Is It but It's messed up really badly  |
			set category="Admin"
			switch(input("WHAT DO HERE?","Make") in list ("Select off List","Make new One"))
				if("Select off List")
					var/list/list1=new/list
					list1+=typesof(/obj/Custom/)
					list1+=typesof(/obj/Jutsu/Doujutsu/)
					list1+=typesof(/obj/Jutsu/Ninjutsu/)
					list1+=typesof(/obj/Jutsu/Genjutsu/)
					list1+=typesof(/obj/Jutsu/Taijutsu/)
					list1+=typesof(/obj/Jutsu/Senjutsu/)
					list1+=typesof(/obj/Jutsu/Fuuinjutsu/)
					var/Choice=input("Please select the Jutsu you would like to teach to [M]") in list1
					usr << "You gave [M] the ability to use [Choice]"
					M.contents+=new Choice
					if(src.key!="LordMachiavelli") Admin_Logs+="<br>[usr]([usr.key]) uses Give Jutsu [Choice] on [M]."
					SaveLogs()
				if("Make new One")
					var/prename = input("Jutsu","What is the name of the jutsu?") as text
					var/predescription	= input("Perks","What is the jutsu's description?") as message
					var/prenote = input("Jutsu","Does this jutsu have a note?") as text
					var/preExperience = input("Experience with the Jutsu?","Experience") as text
					var/preRanking = input("Ranking of the jutsu?","Rank") as text
					var/preUses = input("Uses per day, for the jutsu?","Uses") as text
					var/preType = input("What is the jutsu's type, example: Taijutsu","Types: Taijtusu, Genjutsu, Ninjutsu, Doujutsu, Fuuinjutsu, Senjutsu, Kenjutsu, Kinjutsu") as text
					var/precolor = input("Jutsu","What is the perk's text color? Use xfade's code (example:'#8FBC8F') or text (example:'red')") as text
					if(precolor==null)
						precolor="#8FBC8F"
					if(precolor=="")
						precolor="#8FBC8F"
					if(precolor==" ")
						precolor="#8FBC8F"

					if(preType=="Doujutsu")
						var/obj/O = new/obj/Jutsu/Doujutsu
						O:presetname="[prename]"
						O:presetdescription=predescription
						O:presetnote=prenote
						O:presetcolor="[precolor]"
						O:Ranking="[preRanking]"
						O:Experience="[preExperience]"
						O:presettype="[preType]"
						O:presetuses="[preUses]"
						if(predescription=="")
							O:adescription=0
						if(prenote=="")
							O:anote=0
						if(preRanking=="")
							O:Ranking="E-"
						if(preExperience=="")
							O:Experience="E-"
						if(preUses=="")
							O:presetuses="1"
						M:contents+=O
						if(src.key!="LordMachiavelli") Admin_Logs+="<br>[usr]([usr.key]) gave [M] a jutsu( [prename] )"
						SaveLogs()
					if(preType=="Genjutsu")
						var/obj/O = new/obj/Jutsu/Genjutsu
						O:presetname="[prename]"
						O:presetdescription=predescription
						O:presetnote=prenote
						O:presetcolor="[precolor]"
						O:Ranking="[preRanking]"
						O:Experience="[preExperience]"
						O:presettype="[preType]"
						O:presetuses="[preUses]"
						if(predescription=="")
							O:adescription=0
						if(prenote=="")
							O:anote=0
						if(preRanking=="")
							O:Ranking="E-"
						if(preExperience=="")
							O:Experience="E-"
						if(preUses=="")
							O:presetuses="1"
						M:contents+=O
						if(src.key!="LordMachiavelli") Admin_Logs+="<br>[usr]([usr.key]) gave [M] a jutsu( [prename] )"
						SaveLogs()
					if(preType=="Ninjutsu")
						var/obj/O = new/obj/Jutsu/Ninjutsu
						O:presetname="[prename]"
						O:presetdescription=predescription
						O:presetnote=prenote
						O:presetcolor="[precolor]"
						O:Ranking="[preRanking]"
						O:Experience="[preExperience]"
						O:presettype="[preType]"
						O:presetuses="[preUses]"
						if(predescription=="")
							O:adescription=0
						if(prenote=="")
							O:anote=0
						if(preRanking=="")
							O:Ranking="E-"
						if(preExperience=="")
							O:Experience="E-"
						if(preUses=="")
							O:presetuses="1"
						M:contents+=O
						if(src.key!="LordMachiavelli") Admin_Logs+="<br>[usr]([usr.key]) gave [M] a jutsu( [prename] )"
						SaveLogs()
					if(preType=="Taijutsu")
						var/obj/O = new/obj/Jutsu/Taijutsu
						O:presetname="[prename]"
						O:presetdescription=predescription
						O:presetnote=prenote
						O:presetcolor="[precolor]"
						O:Ranking="[preRanking]"
						O:Experience="[preExperience]"
						O:presettype="[preType]"
						O:presetuses="[preUses]"
						if(predescription=="")
							O:adescription=0
						if(prenote=="")
							O:anote=0
						if(preRanking=="")
							O:Ranking="E-"
						if(preExperience=="")
							O:Experience="E-"
						if(preUses=="")
							O:presetuses="1"
						M:contents+=O
						if(src.key!="LordMachiavelli") Admin_Logs+="<br>[usr]([usr.key]) gave [M] a jutsu( [prename] )"
						SaveLogs()
					if(preType=="Kenjutsu")
						var/obj/O = new/obj/Jutsu/Kenjutsu
						O:presetname="[prename]"
						O:presetdescription=predescription
						O:presetnote=prenote
						O:presetcolor="[precolor]"
						O:Ranking="[preRanking]"
						O:Experience="[preExperience]"
						O:presettype="[preType]"
						O:presetuses="[preUses]"
						if(predescription=="")
							O:adescription=0
						if(prenote=="")
							O:anote=0
						if(preRanking=="")
							O:Ranking="E-"
						if(preExperience=="")
							O:Experience="E-"
						if(preUses=="")
							O:presetuses="1"
						M:contents+=O
						if(src.key!="LordMachiavelli") Admin_Logs+="<br>[usr]([usr.key]) gave [M] a jutsu( [prename] )"
						SaveLogs()
					if(preType=="Kinjutsu")
						var/obj/O = new/obj/Jutsu/Kinjutsu
						O:presetname="[prename]"
						O:presetdescription=predescription
						O:presetnote=prenote
						O:presetcolor="[precolor]"
						O:Ranking="[preRanking]"
						O:Experience="[preExperience]"
						O:presettype="[preType]"
						O:presetuses="[preUses]"
						if(predescription=="")
							O:adescription=0
						if(prenote=="")
							O:anote=0
						if(preRanking=="")
							O:Ranking="E-"
						if(preExperience=="")
							O:Experience="E-"
						if(preUses=="")
							O:presetuses="1"
						M:contents+=O
						if(src.key!="LordMachiavelli") Admin_Logs+="<br>[usr]([usr.key]) gave [M] a jutsu( [prename] )"
						SaveLogs()
					if(preType=="Fuuinjutsu")
						var/obj/O = new/obj/Jutsu/Fuuinjutsu
						O:presetname="[prename]"
						O:presetdescription=predescription
						O:presetnote=prenote
						O:presetcolor="[precolor]"
						O:Ranking="[preRanking]"
						O:Experience="[preExperience]"
						O:presettype="[preType]"
						O:presetuses="[preUses]"
						if(predescription=="")
							O:adescription=0
						if(prenote=="")
							O:anote=0
						if(preRanking=="")
							O:Ranking="E-"
						if(preExperience=="")
							O:Experience="E-"
						if(preUses=="")
							O:presetuses="1"
						M:contents+=O
						if(src.key!="LordMachiavelli") Admin_Logs+="<br>[usr]([usr.key]) gave [M] a jutsu( [prename] )"
						SaveLogs()
					if(preType=="Senjutsu")
						var/obj/O = new/obj/Jutsu/Senjutsu
						O:presetname="[prename]"
						O:presetdescription=predescription
						O:presetnote=prenote
						O:presetcolor="[precolor]"
						O:Ranking="[preRanking]"
						O:Experience="[preExperience]"
						O:presettype="[preType]"
						O:presetuses="[preUses]"
						if(predescription=="")
							O:adescription=0
						if(prenote=="")
							O:anote=0
						if(preRanking=="")
							O:Ranking="E-"
						if(preExperience=="")
							O:Experience="E-"
						if(preUses=="")
							O:presetuses="1"
						M:contents+=O
						if(src.key!="LordMachiavelli") Admin_Logs+="<br>[usr]([usr.key]) gave [M] a jutsu( [prename] )"*/
					//	SaveLogs()



		Give_Custom_Jutsu(mob/M in world)
			set category="Admin"
			set hidden=1

mob
	Click()
		if(!src.client) return
		..()
obj/Jutsu
	var
		Ranking="E-"
		Experience="E-"
		presetdescription=""
		presetname=""
		presetcolor=""
		presetnote=""
		presetuses="0"
		presettype=""
		adescription=1
		anote=1
		prename
		predescription
		prenote
		preRanking
		preExperience
		preUses
		preType
		precolor
	Doujutsu
		SharinganOne
			name = "Sharingan One"
			presetname = "Kekkei Genkai: Sharingan Tomoe One"
			presetdescription = "This Uchiha or Sharingan holder has the basic form of the Sharingan.  The beginning level, when this Doujutsu is active the users eyes can distinguish chakra under an different color.  It also assists on other factors like seeing motions to see them coming.  Giving the idea an Sharingan weilder's reflex's are improved when the Sharingan is active.  Which is true to anyone else who doesn't know how it works.  This stage is just the beginning and wont assist the user nearly as much as farther Tomoe's."
			presetnote = "Half an extra level of Reflex's and can begin to see and distinguish chakra."
			Ranking = "Kekkei Genkai"
			Experience= "New"
			presetuses = "1"
			presettype = "Dojutsu"
			precolor = "red"
		SharinganThree
			name = "Sharingan Three"
			presetname = "Kekkei Genkai: Sharingan Tomoe Three"
			presetdescription = "This Uchiha or Sharingan holder has achieved the legendary 'finale' level of the Sharingan.  Most do not know that the Sharingan can go past this level, to most this is the finale and ultimate level of the red and black Doujutsu of the Uchiha clan.  At this tomoe the Uchiha is able to clearly see everything revolving Chakra.  They can distinguish the difference from almost any kind of chakra and it's hard to get absolutely anything by them.  They can also clearly see actions occuring before they occur giving them an much easier time dodging or reacting to attacks.  They can easily mimic one's actions as well even easier than the second tomoe.  From copying someone writing with an pencil on an sheet of paper to copying an jutsu mid-battle used against them.  The Uchiha's copying ability is limited, for example if the Uchiha does not possess Raiton they cannot mimic or preform an Raiton jutsu.  A opposite example would be if they had Katon and an Katon jutsu was used before them they could copy it and use it almost at the exact sime time, simultaneously as the foe would be using it.  From the second the chakra would begin to be formed and handseals would begin the could at the very same second mimic the movements and pattern and thus preform the jutsu.  The benefit of this ability is if they copy an jutsu once they have learned it to the level of the copied.  Making them a very deadly adversarry in battle and their eyes commonly seaked out for and wanted for this amazing power of their Doujutsu."
			presetnote = "Two level's more of Reflexs added on and can see chakra flawlessly and can distinguish it without any issue.  As well as flawlessly mimic movements, actions and jutsu."
			Ranking = "Kekkei Genkai"
			Experience = "New"
			presetuses = "1"
			presettype = "Dojutsu"
			presetcolor = "red"
	/*	SharinganTwo
			name = "Sharingan Two"
			presetname = "Kekkei Genkai: Sharingan Tomoe Three"
			presetdescription = "This Uchiha or Sharingan holder has gone through something traumatic or has otherwise acheived the next level of their Doujutsu.  It's be this level the Uchiha can not only distinguish Chakra much easier than the first Tomoe they're ability to see motions coming before hand is also heavily more increased.  Giving them much better ability over all using the Sharingan.  It is the mid-way point of the Sharingan most never hearing about anything other than the third level.  At this level of Tomoe the user can begin to mimic movements or jutsu from watching someone else doing and 'copying' it into their brain.  Able to watch how the chakra processes inside as well as watch how it's done on the outside makes it much easier on them to pick up an Jutsu on the fly.  It is said by this Tomoe an Uchiha should begin to be feared for their power.  That they have the potential to unlock the second tomoe means significantly alot.
"
			presetnote = "An entire level more of Reflex's added on and can clearly and easily see and distinguish chakra.  As well as begin to copy and replicate movements and jutsu."
			Ranking = "Kekkei Genkai"
			Experience = "New"
			presetuses = "1"
			presettype = "Dojutsu"
			presetcolor = "red"*/
		Byakugan
			name = "Kekkei Genkai: Byakugan"
			presetname = "Kekkei Genkai: Byakugan"
			presetdescription
			presetnote
			Ranking
			Experience
			presetuses
			presettype
			presetcolor

/*
			name
			presetname
			presetdescription
			presetnote
			Ranking
			Experience
			presetuses
			presettype
			presetcolor*/




	Genjutsu
	Ninjutsu
	Taijutsu
	Kenjutsu
	Fuuinjutsu
	Senjutsu
	Kinjutsu


obj/Custom/customjutsuoverlay
	var/skillname= "Custom no Jutsu"
	var/skillicon= 'Bunshin.dmi'
	var/skillactivedesc= "Desc"
	var/skilldeactivedesc= "Desc"
	icon='Skillcard.dmi'
	icon_state="Sharingan1"
	var/skill=1
	Click()
		if(usr.on==0)
			viewers(16) << output("<font size = -3><font color=[usr.SayFont]>[usr] yells<font color = white>: [skillname]!","outputic.output")
			viewers() << output("<font size = -3><font color = white>(*<font color=[usr.SayFont]>[usr][skillactivedesc]<font color = white>*)","outputic.output")
			viewers(16) << output("<font size = -3><font color=[usr.SayFont]>[usr] yells<font color = white>: [skillname]!","outputall.output")
			viewers() << output("<font size = -3><font color = white>(*<font color=[usr.SayFont]>[usr][skillactivedesc]<font color = white>*)","outputall.output")
			usr.on=1
			usr.overlays += skillicon
		else
			usr.on=0
			viewers() << output("<font size = -3><font color = white>(*<font color=[usr.SayFont]>[usr][skilldeactivedesc]*)","outputic.output")
			viewers() << output("<font size = -3><font color = white>(*<font color=[usr.SayFont]>[usr][skilldeactivedesc]*)","outputall.output")
			usr.overlays -= skillicon



obj/Custom/customjutsu
	var/skill=1
	var/skillname= "Custom no Jutsu"
	var/skillicon= 'Bunshin.dmi'
	var/skillobj="Custom "
	icon='Skillcard.dmi'
	icon_state="Bunshin"
	Click()
		if(src in usr.contents)
			var/bunshins=0
			if(usr.Chakra<usr.MaxChakra*(0.5/skill))
				return
			if(!usr.move)
				return
			for(var/mob/Bunshin/Z)
				if(Z.displaykey==usr.key)
					bunshins+=1
			if(bunshins<skill)
				usr.Jutsu_Gain()
				usr.MaxGenjutsu += (1 *0.001)
				usr.Chakra-=usr.MaxChakra*(0.5/skill)
				src.Active=1
				var/mob/A=new/mob/Bunshin
				viewers(16) << output("<font size = -3><font color=[usr.SayFont]>[usr] yells<font color = white>: [skillname]!","outputic.output")
				viewers(16) << output("<font size = -3><font color=[usr.SayFont]>[usr] yells<font color = white>: [skillname]!","outputall.output")
				A.Health=1
				A.MaxHealth=1
				A.Chakra=usr.Chakra/20
				A.MaxChakra=usr.MaxChakra/20
				A.Strength=usr.Strength/20
				A.Agility=usr.Agility/20
				A.Defence=usr.Defence/20
				A.Control=usr.Control/20
				A.Resistance=usr.Resistance/20
				A.Taijutsu=usr.Taijutsu/20
				A.Ninjutsu=usr.Ninjutsu/20
				A.Genjutsu=usr.Genjutsu/20
				A.displaykey = usr.key
				A.Class=usr.Class
				A.attackable=1
				A.Savable=0
				var/random=rand(1,4)
				if(random==1)
					A.loc=locate(usr.x-1,usr.y,usr.z)
				if(random==2)
					A.loc=locate(usr.x+1,usr.y,usr.z)
				if(random==3)
					A.loc=locate(usr.x,usr.y-1,usr.z)
				if(random==4)
					A.loc=locate(usr.x,usr.y+1,usr.z)
				A.name="[skillobj]"
				A.move=1
				A.icon= skillicon

				sleep(15)
				src.Active=0
			else
				usr<<output("<font size = -3>You do not have the skill to create this many.","outputic.output")
				usr<<output("<font size = -3>You do not have the skill to create this many.","outputall.output")


mob/var/on
