var/Kyokugi=0
obj/Small_Bat/MouseDrag()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)
obj/Small_Bat/New()
	..()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)


obj/Small_Bat/MouseDrop(o_o,s_l,o_l) //make it so if an object has been dragged to someplace...
	..()

	if(isturf(o_l)) //making sure it was dropped on the map, and not in a statpanel or off the map
		walk_towards(src,o_l)

obj/Ninjutsu/Small_Bat_Summoning
	var/Kuchiyoseskill=1
	icon='Bat.dmi'
	icon_state="Skill"
	Click()
		if(src in usr.contents)
			for(var/mob/Small_Bat/E in world)
				if(E.Owner==usr.key)
					usr<<output("<font size = -3>You may only summon one Bat at a time.","outputic.output")
					usr<<output("<font size = -3>You may only summon one Bat at a time.","outputall.output")
					return
			if(usr.Chakra<usr.MaxChakra*(0.80/Kuchiyoseskill))
				return
			if(!usr.move)
				return
				if(prob(10/Kuchiyoseskill/Kuchiyoseskill/Kuchiyoseskill))
					Kuchiyoseskill+=1
					Update()
			Active=1
			spawn(50) Active=0
			usr.Jutsu_Gain()
			usr.MaxNinjutsu += (1 *0.002)
			usr.Chakra-=usr.MaxChakra*(0.80/Kuchiyoseskill)
			var/mob/Small_Bat/E = new()
			E.Owner = usr.key
			E.loc = usr.loc
			E.Health=100
			E.MaxHealth=100
			E.Chakra=usr.Chakra/1.2*rand(1.5,3)
			E.MaxChakra=usr.MaxChakra/1.2*rand(1.5,3)
			E.Strength=usr.Strength/1.2*rand(1.5,3)
			E.Agility=usr.Agility/2.2*rand(1.5,3)
			E.Defence=usr.Defence/1.8*rand(1.5,3)
			E.Control=usr.Control/1*rand(1.5,3)
			E.Resistance=usr.Resistance/1.2*rand(1.5,3)
			E.Taijutsu=usr.Taijutsu/1.2*rand(1.5,3)
			E.Ninjutsu=usr.Ninjutsu/1.8*rand(1.5,3)
			E.Genjutsu=usr.Genjutsu/1*rand(1.5,3)
mob/Small_Bat
	icon='Bat.dmi'
	var/function
	var/Owner = null
	New()
		..()
	Click()
		if(Owner==usr.key)
			var/list/Choices=new/list
			Choices.Add("Attack Target")
			Choices.Add("Follow")
			Choices.Add("Stay")
			Choices.Add("Unsummon Bat")
			Choices.Add("Cancel")
			switch(input("Choose Option","",text) in Choices)
				if("Unsummon Bat")
					flick('Smoke.dmi',src)
					del(src)
				if("Follow")
					function=1
					spawn while(function==1)
						sleep(5)
						if(prob(20)) step_rand(src)
						else step_towards(src,usr)
				if("Stay") function=2
				if("Attack Target")
					function=3
					var/mob/list/Targets=new/list
					for(var/mob/M in oviewers(12)) Targets.Add(M)
					var/mob/Choice=input("Attack who?") in Targets
					for(var/mob/M in oviewers(12)) if(Choice==M)
						spawn while(function==3)
							sleep(20)
							if(prob(10)) step_rand(src)
							else step_towards(src,M)
							BunshinAttack()
obj/Medium_Bat/MouseDrag()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)
obj/Medium_Bat/New()
	..()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)


obj/Medium_Bat/MouseDrop(o_o,s_l,o_l) //make it so if an object has been dragged to someplace...

	..()
	if(isturf(o_l)) //making sure it was dropped on the map, and not in a statpanel or off the map
		walk_towards(src,o_l)

obj/Ninjutsu/Medium_Bat_Summoning
	var/Kuchiyoseskill=1
	icon='MedBat.dmi'
	icon_state="Skill"
	Click()
		if(src in usr.contents)
			for(var/mob/Medium_Bat/E in world)
				if(E.Owner==usr.key)
					usr<<output("<font size = -3>You may only summon one Bat at a time.","outputic.output")
					usr<<output("<font size = -3>You may only summon one Bat at a time.","outputall.output")
					return
			if(usr.Chakra<usr.MaxChakra*(0.80/Kuchiyoseskill))
				return
			if(!usr.move)
				return
				if(prob(10/Kuchiyoseskill/Kuchiyoseskill/Kuchiyoseskill))
					Kuchiyoseskill+=1
					Update()
			Active=1
			spawn(50) Active=0
			usr.Jutsu_Gain()
			usr.MaxNinjutsu += (1 *0.002)
			usr.Chakra-=usr.MaxChakra*(0.80/Kuchiyoseskill)
			var/mob/Medium_Bat/E = new()
			E.Owner = usr.key
			E.loc = usr.loc
			E.Health=100
			E.MaxHealth=100
			E.Chakra=usr.Chakra/1.8*rand(1.5,3)
			E.MaxChakra=usr.MaxChakra/1.8*rand(1.5,3)
			E.Strength=usr.Strength/1.8*rand(1.5,3)
			E.Agility=usr.Agility/2.6*rand(1.5,3)
			E.Defence=usr.Defence/2*rand(1.5,3)
			E.Control=usr.Control/1*rand(1.5,3)
			E.Resistance=usr.Resistance/1.8*rand(1.5,3)
			E.Taijutsu=usr.Taijutsu/1.8*rand(1.5,3)
			E.Ninjutsu=usr.Ninjutsu/2.1*rand(1.5,3)
			E.Genjutsu=usr.Genjutsu/1*rand(1.5,3)
mob/Medium_Bat
	icon='MedBat.dmi'
	var/function
	var/Owner = null
	New()
		..()
	Click()
		if(Owner==usr.key)
			var/list/Choices=new/list
			Choices.Add("Attack Target")
			Choices.Add("Follow")
			Choices.Add("Stay")
			Choices.Add("Unsummon Snake")
			Choices.Add("Cancel")
			switch(input("Choose Option","",text) in Choices)
				if("Unsummon Snake")
					flick('Smoke.dmi',src)
					del(src)
				if("Follow")
					function=1
					spawn while(function==1)
						sleep(5)
						if(prob(20)) step_rand(src)
						else step_towards(src,usr)
				if("Stay") function=2
				if("Attack Target")
					function=3
					var/mob/list/Targets=new/list
					for(var/mob/M in oviewers(12)) Targets.Add(M)
					var/mob/Choice=input("Attack who?") in Targets
					for(var/mob/M in oviewers(12)) if(Choice==M)
						spawn while(function==3)
							sleep(20)
							if(prob(10)) step_rand(src)
							else step_towards(src,M)
							BunshinAttack()