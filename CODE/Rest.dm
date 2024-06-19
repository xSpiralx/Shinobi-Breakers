mob/var/tmp/resting=0
mob/var/tmp/allowmed=1
mob/verb
	Meditate()
		set category = "Combat"
		set name="Rest"
	//	if(src.RecentVerbCheck("Meditate", 1,1)) return
		var/mob/controlMob = src
		if(MindTransfer) controlMob = MindTransfer
		if(controlMob.Cooking)
			return
		if(controlMob.Mining)
			return
		if(controlMob.Fishing)
			return
		if(controlMob.KO)
			return
		if(controlMob.onwater||controlMob.oncliff||controlMob.ontree)
			src << output("<font size = -3>You can't meditate while your training!","outputic.output")
			src << output("<font size = -3>You can't meditate while your training!","outputall.output")
			return
		if(controlMob.benchresting||controlMob.bedresting)
			return
		if(!controlMob.resting&&controlMob.move&&controlMob.allowmed)
			controlMob.recentverbs["Meditate"]=world.realtime
			controlMob.resting=1
			controlMob.meditate=1
			controlMob.icon_state="Focus"
			controlMob.move=0
			controlMob.rest()
			controlMob.meditate()
		else
			controlMob.resting=0
			controlMob.icon_state=""
			controlMob.move=1
			controlMob.meditate=0


mob/proc
	rest()
		sleep(10)
		if(!src) return
		while(src.resting)
			sleep(50)
			if(src.Chakra < src.MaxChakra)
				src.Chakra += (src.RegenChakra*1.10)
				if(src.Chakra > src.MaxChakra)
					src.Chakra = src.MaxChakra

			if(src.Stamina < src.MaxStamina)
				src.Stamina += (src.MaxStamina/45)
				if(src.Stamina > src.MaxStamina)
					src.Stamina = src.MaxStamina


			if(src.Health < src.MaxHealth)
				src.Health += (src.RegenHealth*0.5)
				if(src.Health > src.MaxHealth)
					src.Health = src.MaxHealth

			if(src.Strength < src.MaxStrength)
				src.Strength += (src.MaxStrength/20)
				if(src.Strength > src.MaxStrength)
					src.Strength = src.MaxStrength

			if(src.Agility < src.MaxAgility)
				src.Agility += (src.MaxAgility/20)
				if(src.Agility > src.MaxAgility)
					src.Agility = src.MaxAgility

			if(src.Defence < src.MaxDefence)
				src.Defence += (src.MaxDefence/20)
				if(src.Defence > src.MaxDefence)
					src.Defence = src.MaxDefence

			if(src.Offence < src.MaxOffence)
				src.Offence += (src.MaxOffence/5)
				if(src.Offence > src.MaxOffence)
					src.Offence = src.MaxOffence

			if(src.Control < src.MaxControl)
				src.Control += (src.MaxControl/20)
				if(src.Control > src.MaxControl)
					src.Control = src.MaxControl

			if(src.Resistance < src.MaxResistance)
				src.Resistance += (src.MaxResistance/20)
				if(src.Resistance > src.MaxResistance)
					src.Resistance = src.MaxResistance

			if(src.Taijutsu < src.MaxTaijutsu)
				src.Taijutsu += (src.MaxTaijutsu/20)
				if(src.Taijutsu > src.MaxTaijutsu)
					src.Taijutsu = src.MaxTaijutsu

			if(src.Ninjutsu < src.MaxNinjutsu)
				src.Ninjutsu += (src.MaxNinjutsu/20)
				if(src.Ninjutsu > src.MaxNinjutsu)
					src.Ninjutsu = src.MaxNinjutsu

			if(src.Genjutsu < src.MaxGenjutsu)
				src.Genjutsu += (src.MaxGenjutsu/20)
				if(src.Genjutsu > src.MaxGenjutsu)
					src.Genjutsu = src.MaxGenjutsu

mob/var/bedresting=0
mob/proc
	bedrest()
		while(src.bedresting)
			sleep(25)
			if(src.Chakra < src.MaxChakra)
				src.Chakra += (src.RegenChakra*4.8)
				if(src.Chakra > src.MaxChakra)
					src.Chakra = src.MaxChakra

			if(src.Stamina < src.MaxStamina)
				src.Stamina += (src.MaxStamina/20)
				if(src.Stamina > src.MaxStamina)
					src.Stamina = src.MaxStamina


			if(src.Health < src.MaxHealth)
				src.Health += (src.RegenHealth*3.8)
				if(src.Health > src.MaxHealth)
					src.Health = src.MaxHealth

			if(src.Strength < src.MaxStrength)
				src.Strength += (src.MaxStrength/20)
				if(src.Strength > src.MaxStrength)
					src.Strength = src.MaxStrength

			if(src.Agility < src.MaxAgility)
				src.Agility += (src.MaxAgility/20)
				if(src.Agility > src.MaxAgility)
					src.Agility = src.MaxAgility


			if(src.Offence < src.MaxOffence)
				src.Offence += (src.MaxOffence/20)
				if(src.Offence > src.MaxOffence)
					src.Offence = src.MaxOffence

			if(src.Defence < src.MaxDefence)
				src.Defence += (src.MaxDefence/20)
				if(src.Defence > src.MaxDefence)
					src.Defence = src.MaxDefence

			if(src.Control < src.MaxControl)
				src.Control += (src.MaxControl/20)
				if(src.Control > src.MaxControl)
					src.Control = src.MaxControl

			if(src.Resistance < src.MaxResistance)
				src.Resistance += (src.MaxResistance/20)
				if(src.Resistance > src.MaxResistance)
					src.Resistance = src.MaxResistance

			if(src.Taijutsu < src.MaxTaijutsu)
				src.Taijutsu += (src.MaxTaijutsu/20)
				if(src.Taijutsu > src.MaxTaijutsu)
					src.Taijutsu = src.MaxTaijutsu

			if(src.Ninjutsu < src.MaxNinjutsu)
				src.Ninjutsu += (src.MaxNinjutsu/20)
				if(src.Ninjutsu > src.MaxNinjutsu)
					src.Ninjutsu = src.MaxNinjutsu

			if(src.Genjutsu < src.MaxGenjutsu)
				src.Genjutsu += (src.MaxGenjutsu/20)
				if(src.Genjutsu > src.MaxGenjutsu)
					src.Genjutsu = src.MaxGenjutsu

mob/var/benchresting=0
mob/proc
	benchrest()
		while(src.benchresting)
			sleep(50)
			if(src.Chakra < src.MaxChakra)
				src.Chakra += (src.RegenChakra*3.5)
				if(src.Chakra > src.MaxChakra)
					src.Chakra = src.MaxChakra

			if(src.Stamina < src.MaxStamina)
				src.Stamina += (src.MaxStamina/20)
				if(src.Stamina > src.MaxStamina)
					src.Stamina = src.MaxStamina


			if(src.Health < src.MaxHealth)
				src.Health += (src.RegenHealth*2.5)
				if(src.Health > src.MaxHealth)
					src.Health = src.MaxHealth

			if(src.Strength < src.MaxStrength)
				src.Strength += (src.MaxStrength/20)
				if(src.Strength > src.MaxStrength)
					src.Strength = src.MaxStrength

			if(src.Agility < src.MaxAgility)
				src.Agility += (src.MaxAgility/20)
				if(src.Agility > src.MaxAgility)
					src.Agility = src.MaxAgility


			if(src.Offence < src.MaxOffence)
				src.Offence += (src.MaxOffence/20)
				if(src.Offence > src.MaxOffence)
					src.Offence = src.MaxOffence

			if(src.Defence < src.MaxDefence)
				src.Defence += (src.MaxDefence/20)
				if(src.Defence > src.MaxDefence)
					src.Defence = src.MaxDefence

			if(src.Control < src.MaxControl)
				src.Control += (src.MaxControl/20)
				if(src.Control > src.MaxControl)
					src.Control = src.MaxControl

			if(src.Resistance < src.MaxResistance)
				src.Resistance += (src.MaxResistance/20)
				if(src.Resistance > src.MaxResistance)
					src.Resistance = src.MaxResistance

			if(src.Taijutsu < src.MaxTaijutsu)
				src.Taijutsu += (src.MaxTaijutsu/20)
				if(src.Taijutsu > src.MaxTaijutsu)
					src.Taijutsu = src.MaxTaijutsu

			if(src.Ninjutsu < src.MaxNinjutsu)
				src.Ninjutsu += (src.MaxNinjutsu/20)
				if(src.Ninjutsu > src.MaxNinjutsu)
					src.Ninjutsu = src.MaxNinjutsu

			if(src.Genjutsu < src.MaxGenjutsu)
				src.Genjutsu += (src.MaxGenjutsu/20)
				if(src.Genjutsu > src.MaxGenjutsu)
					src.Genjutsu = src.MaxGenjutsu


mob/var/meditate=0
mob/proc
	meditate()
		while(src.resting)
			sleep(100)
			src.MaxChakra += (1 *0.013)
		//	src.Exp += (1 *0.0015)


