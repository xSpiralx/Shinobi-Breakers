obj/Taijutsu/Oukashou
	var/Oukashou=0
	icon='Skillcard.dmi'
	icon_state="Oukashou"
	Click()
		if(src in usr.contents)
			if(!Oukashou)
				if(usr.Chakra<usr.MaxChakra*(0.70/skill))
					return
				if(prob(10/skill/skill/skill))
					usr<<output("Your understanding of the Oukashou Taijutsu Style increased.","outputic.output")
					skill+=1
					Update()
				usr<<output("You draw Chakra to your hands to increase your power.","outputic.output")
				usr.MaxTaijutsu += (1 *0.005)
				usr.Chakra-=usr.MaxChakra*(0.70/skill)
				usr.Taijutsu *= 1.5*(0.70*skill)
				usr.Strength *= 2*(0.70*skill)
				src.Active=1
				Oukashou=1
				usr.Oukashou_drain=1
				usr.Oukashou_drain()
			else
				usr<<output("You withdraw the Chakra from your hand and return to normal.","outputic.output")
				usr.Strength = usr.MaxStrength
				usr.Taijutsu = usr.MaxTaijutsu
				Oukashou=0
				usr.Oukashou_drain=0
				src.Active=0

mob/var/Oukashou_drain=0
mob/proc
	Oukashou_drain()
		spawn()
			while(usr.Oukashou_drain)
				usr.Chakra -= rand(0.5,2.5)
				if(usr.Chakra<=0)
					usr<<output("You withdraw the Chakra from your hand and return to normal.","outputic.output")
					usr.Strength = usr.MaxStrength
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Oukashou_drain=0
					for(var/obj/Taijutsu/Oukashou/B in usr.contents)
						B.Oukashou=0
						B.Active=0

mob/var/Dynamic=0
obj/Taijutsu/Dainamikku_Entorii
	icon='Skillcard.dmi'
	icon_state="Run"


