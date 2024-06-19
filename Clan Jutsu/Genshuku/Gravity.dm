mob/var/Gravityeye=0
obj/Doujutsu/Gravity_Eyes
	icon='Skillcard.dmi'
	icon_state="GravityEyes"
	Click()
		if(src in usr.contents)
			if(!usr.Gravityeye)
				usr.Gravityeye=1
				usr.overlays += 'Gravity Eyes.dmi'
			else
				usr.Gravityeye=0
				usr.overlays -= 'Gravity Eyes.dmi'


obj/Taijutsu/Gravity_Fist
	var/Gravity_Fist=0
	icon='Skillcard.dmi'
	icon_state="GravityFist"
	Click()
		if(src in usr.contents)
			if(!Gravity_Fist)
				if(usr.Chakra<4)
					return
				usr.MaxTaijutsu += (1 *0.001)
				usr.Chakra-=4
				usr.Taijutsu *= 1.5
				usr.overlays += 'Gravity Fist.dmi'
				src.Active=1
				Gravity_Fist=1
			else
				usr.Taijutsu = usr.MaxTaijutsu
				usr.overlays -= 'Gravity Fist.dmi'
				Gravity_Fist=0
				src.Active=0




obj/Ninjutsu
	Gravity_Distortion
		icon='Skillcard.dmi'
		icon_state="GravityDistort"
		Click()
			if(src in usr.contents)
				if(usr.move)
					if(usr.Chakra<usr.MaxChakra*0.45)
						return
					usr.Chakra-=(usr.MaxChakra*0.45)
					var/list/V = new/list
					for(var/mob/M in oview())
						V.Add(M)
					var/mob/A=input("Who would you like to use the Ninjutsu on?") in V
					if(A==null)
						return
					if(usr.Ninjutsu >= A.Ninjutsu*1.3)
						A.move=0
						A.magen=1
						A.overlays += 'Gravity moves.dmi'
						usr.MaxNinjutsu += (1 *0.01)
						sleep(50)
						if(A.magen)
							A.move=1
							A.overlays -= 'Gravity moves.dmi'
							A.Health -= (usr.Ninjutsu/4)+1
					else
						usr<<output("<font size = -3>[A] resists your Ninjutsu!","outputic.output")