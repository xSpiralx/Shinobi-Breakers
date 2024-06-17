mob/var/Rasengan=0
mob/var/Convert=0
mob/var/Convert2=0
obj/Ninjutsu/Rasengan
	icon='Skillcard.dmi'
	icon_state="Rasengan"
	Click()
		if(src in usr.contents)
			if(!usr.Rasengan)
				if(usr.Chakra<125)
					return
				if(usr.resting)
					return
				if(prob(10/skill/skill/skill))
					skill+=1
					Update()
				usr.MaxTaijutsu += (1 *0.001)
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=125
				usr.Taijutsu *= rand(3.2,3.5)
				usr.Strength *= rand(4.2,5.5)
				usr.overlays += 'Rasengan.dmi'
				src.Active=1
				usr.drain=1
				usr.Rasengan=1
				usr.drain()

			else
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Strength = usr.MaxStrength
				usr.overlays -= 'Rasengan.dmi'
				usr.Rasengan=0
				usr.drain=0

obj/Ninjutsu/Suimen_Hokou_no_Waza
	icon='Skillcard.dmi'
	icon_state="Waterwalk"
	Click()
		if(src in usr.contents)
			if(!usr.Convert)
				if(usr.Chakra<10)
					return
				if(usr.resting)
					return
				if(prob(10/skill/skill/skill))
					skill+=1
					Update()
				usr.Chakra-=10
				src.Active=1
				usr<<output("<font size = -3>You have activated Suimen Hokou no Waza, you have control and balanced chakra to your feet and can now walk on water, climb mountains, and climb trees.","outputic.output")

				usr<<output("<font size = -3>You have activated Suimen Hokou no Waza, you have control and balanced chakra to your feet and can now walk on water, climb mountains, and climb trees.","outputall.output")
				usr.Convert=1
				usr.overlays -= 'Swim.dmi'
				usr.swim=0
			else
				usr<<output("<font size = -3>You have deactivated Suimen Hokou no Waza.","outputic.output")
				usr<<output("<font size = -3>You have deactivated Suimen Hokou no Waza.","outputall.output")
				usr.Convert=0
				src.Active=0


/*obj/Ninjutsu/Kinobori_no_Waza
	var/skill=1
	icon='Skillcard.dmi'
	icon_state="Treeclimb"
	Click()
		if(src in usr.contents)
			if(!usr.Convert2)
				if(usr.Chakra<10)
					return
				if(usr.resting)
					return
				if(prob(10/skill/skill/skill))
					usr<<output("Your understanding of the Tree Climbing has increased."
					skill+=1
				usr.Chakra-=10
				usr<<output("You have activated Kinobori no Waza, you have control chakra to your feet and can now climb up trees."
				src.Active=1
				usr.drain6=1
				usr.Convert2=1
				usr.drain6()

			else
				usr<<output("You have deactivated Kinobori no Waza."
				usr.Convert2=0
				usr.drain6=0*/


/*mob/var/drain6=0
mob/proc
	drain6()
		spawn(10)
		if(usr.drain6)
			usr.Chakra -= 1.5
			usr.drain6()
		if(usr.Chakra<=0)
			usr<<output("You have deactivated Suimen Hokou no Waza."
			usr.Convert2=0
			usr.drain6=0
			usr.drain6()*/





