mob/var/Shiki=0
mob/var/Mujin=0
mob/var/Fuuin=0
mob/var/Houin=0

/*obj/Fuuinjutsu/Genryuu_Kyuu_Fuujin
	icon='Skillcard.dmi'
	icon_state="Genryuu"
	Click()*/


obj/Fuuinjutsu/Gogyou_Fuuin
	icon='Skillcard.dmi'
	icon_state="Gogyou Fuuin"
	var/curseskill=1
	Click()
		if(src in usr.contents)
			if(usr.firing)
				return
			if(usr.Chakra<(20/curseskill))
				return
			for(var/mob/M in get_step(usr,usr.dir))
				if(M.Fuuin)
					return
				Active=1
				spawn(50) Active=0
				usr.firing=1
				M.UnKo()
				M.MaxChakra-=(M.MaxChakra/3)
				M<<output("<font size = -3>You have been hit in the stomach by [usr]","outputic.output")
				usr.Chakra-=(350/curseskill)
				M.Fuuin=1
				curseskill+=(0.01*2)
				sleep(50)
				usr.firing=0

obj/Fuuinjutsu/Gogyou_Kaiin
	icon='Skillcard.dmi'
	icon_state="Gogyou Kaiin"
	var/curseskill=1
	Click()
		if(src in usr.contents)
			if(usr.firing)
				return
			if(usr.Chakra<(20/curseskill))
				return
			for(var/mob/M in get_step(usr,usr.dir))
				if(!M.Fuuin)
					return
				usr.firing=1
				Active=1
				spawn(50) Active=0
				M.UnKo()
				M.MaxChakra+=(M.MaxChakra*2)
				usr.Chakra-=(350/curseskill)
				M.Fuuin=0
				curseskill+=(0.01*2)
				sleep(50)
				usr.firing=0

obj/Fuuinjutsu/Fuuja_Houin
	icon='Skillcard.dmi'
	icon_state="Hiraishin"
	var/curseskill=1
	Click()
		if(src in usr.contents)
			if(usr.firing)
				return
			if(usr.Chakra<(20/curseskill))
				return
			for(var/mob/M in get_step(usr,usr.dir))
				if(M.Houin)
					return
				if(M.HasCurseSeal2)
					return
				if(M.Earth_HasCurseSeal2)
					return
				if(M.Heaven_HasCurseSeal2)
					return
				if(M.Stone_HasCurseSeal2)
					return
				else
					usr.firing=1
					Active=1
					spawn(50) Active=0
					M.UnKo()
					M<<output("<font size = -3>[usr] has placed a seal atop your neck.","outputic.output")
					usr.Chakra-=(350/curseskill)
					M.Houin=1
					curseskill+=(0.01*2)
					sleep(50)
					usr.firing=0

obj/Fuuinjutsu/Shikoku_Mujin
	icon='Skillcard.dmi'
	icon_state="Shikoku Mujin"
	Click()
		if(src in usr.contents)
			if(usr.Mujin)
				return
			if(usr.Chakra<10)
				return
			usr.Chakra-=100
			usr.Mujin=1
			Active=1
			spawn(50) Active=0
			sleep(5)
			var/obj/items/Clothing/Curse_Seal_Container/D = new()
			D.loc = usr.loc
			sleep(4000)
			usr.Mujin=0


obj/Fuuinjutsu/Shiki_Fuujin
	icon='Skillcard.dmi'
	icon_state="Shiki"
	Click()
		if(src in usr.contents)
			if(usr.Chakra<20)
				return
			for(var/mob/Shiki/Shinigami/D in world)
				if(D.Owner==usr.key)
					usr<<output("<font size = -3>You have already summoned Shinigami the Death God.","outputic.output")
					return
			usr.Chakra-=500
			var/mob/Shiki/Shinigami/D = new()
			D.Owner = usr.key
			D.loc = usr.loc
			D.Chakra=usr.Chakra/2
			D.MaxChakra=usr.MaxChakra/2
			D.Strength=usr.Strength/2
			D.Agility=usr.Agility/3
			D.Defence=usr.Defence/2
			D.Control=usr.Control/3
			D.Resistance=usr.Resistance/3
			D.Ninjutsu=usr.Ninjutsu/2
			D.Genjutsu=usr.Genjutsu/3
			D.Taijutsu = usr.Taijutsu/2
			D.attackable=0
			D.Health=100
			D.MaxHealth=100

mob/Shiki
	var/function
	var/Owner = null
	New()
		..()
	Click()
		if(Owner==usr.key)
			var/list/Choices=new/list
			Choices.Add("Remove Soul")
			Choices.Add("Unsummon Shinigami")
			Choices.Add("Cancel")
			switch(input("Choose Option","",text) in Choices)
				if("Unsummon Shinigami")
					flick('Smoke.dmi',src)
					del(src)
				if("Remove Soul")
					if(usr.Chakra<usr.MaxChakra*0.80)
						return
					if(usr.Health<usr.MaxHealth*0.30)
						usr.Shiki=1
					usr.Chakra-=(usr.MaxChakra*0.80)
					usr.Health-=(usr.MaxHealth*0.30)
					var/list/V = new/list
					for(var/mob/M in oview(2))
						V.Add(M)
					var/mob/A=input("Who would you like to use Shiki Fuujin on?","Cancel") in V
					if(A==null)
						return
					if(usr.Shiki)
						A.Health-=40
						A.MaxHealth-=40
						sleep(5)
						usr.loc=locate(142,153,25)
						usr.resetLuminosity()
						flick('Smoke.dmi',src)
						del(src)
						return
					sleep(5)
					A.loc=locate(142,153,25)
					A.move=1
					usr.loc=locate(142,153,25)
					flick('Smoke.dmi',src)
					del(src)



	Shinigami
		icon='Shiki.dmi'
//		New()
//			src.overlays += /obj/Shinigami/Part1
//			src.overlays += /obj/Shinigami/Part2
//			src.overlays += /obj/Shinigami/Part3
//			src.overlays += /obj/Shinigami/Part4
//			src.overlays += /obj/Shinigami/Part5
//			src.overlays += /obj/Shinigami/Part6
//			src.overlays += /obj/Shinigami/Part7
//			src.overlays += /obj/Shinigami/Part8

