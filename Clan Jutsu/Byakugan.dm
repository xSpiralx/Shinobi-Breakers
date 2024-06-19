mob/var/Byakugan=0
mob/var/Mark=0
obj/jutsu/Byakugan
	icon='Skillcard.dmi'
	icon_state="Byakugan"
	Click()
		if(src in usr.contents)
			if(!usr.Hyuuga)
				return
				usr.Byakugan=1
				usr.overlays += 'Hyuuga.dmi'
				usr.sight |= SEE_MOBS
				usr.see_invisible = 1


			else
				usr.sight &= ~SEE_MOBS
				usr.see_invisible = 0
				usr.Byakugan=0
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Agility = usr.MaxAgility
				usr.drain5=0
				if(!usr.Hyuuga)
					usr.overlays -= 'Hyuuga.dmi'


mob/var/drain5=0
mob/proc
	drain5()
		spawn() while(usr.drain5)
			sleep(70)
			usr.Chakra -= 3
			if(usr.Chakra<=0)
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Agility = usr.MaxAgility
				usr.Defence = usr.MaxDefence
				usr.drain5=0
				usr.Byakugan=0
				if(!usr.Hyuuga)
					usr.overlays -= 'Hyuuga.dmi'

obj/Ninjutsu/Control_Branch
	icon='Skillcard.dmi'
	icon_state="Byakugan"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.Chakra<usr.MaxChakra*0.30)
					return
				usr.Chakra-=(usr.MaxChakra*0.30)
				var/list/V = new/list
				for(var/mob/M in oview())
					V.Add(M)
				var/mob/A=input("Who would you like to use the Hyuuga Secret Control on?") in V
				if(A==null)
					return
				if(A.Mark)
					A.move=0
					A.drain=1
					A.drain()
					A.icon_state="KO"
					usr.MaxGenjutsu += (1 *0.01)
					sleep(200)
					A.move=1
					A.drain=0
					A.icon_state=""
				else
					usr<<output("<font size = -3>[A] isn't part of the Hyuuga Branch Family!","outputic.output")
					usr<<output("<font size = -3>[A] isn't part of the Hyuuga Branch Family!","outputall.output")


//obj/Ninjutsu/Hakke_Kuushou

