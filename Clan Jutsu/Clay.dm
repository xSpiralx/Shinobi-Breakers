mob/Bird/MouseDrag()
	..()
	if(src.displaykey==usr.key)
		mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)
mob/Bird/New()
	..()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)


mob/Bird/MouseDrop(o_o,s_l,o_l) //make it so if an object has been dragged to someplace...
	..()
	if(src.Owner == usr.key)
		if(isturf(o_l)) //making sure it was dropped on the map, and not in a statpanel or off the map
			walk_towards(src,o_l)

mob/Bird
	Bird
	icon='Kibaku Nendo.dmi'
	density=0
	/*Bump(mob/M)
		..()
		if(istype(M,/mob/))
			if(Owner==M.key)
				return
			else
				var/damage = src.Taijutsu
				M.Chakra -= damage
				src.attacking = 1
				sleep(5)
				src.attacking = 0*/
mob/Bird
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
			Choices.Add("Unsummon Bird")
			Choices.Add("Cancel")
			switch(input("Choose Option","",text) in Choices)
				if("Unsummon Bird")
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


obj/Ninjutsu/Kibaku_Nendo
	icon='Skillcard.dmi'
	icon_state="Bird"
	Click()
		if(src in usr.contents)
			for(var/mob/Bird/Bird/R in world)
				if(R.Owner==usr.key)
					usr<<output("<font size = -3>You may only summon one Clay Bird at a time.","outputic.output")
					usr<<output("<font size = -3>You may only summon one Clay Bird at a time.","outputall.output")
					return
			var/mob/Bird/Bird/R = new()
			R.Owner = usr.key
			R.loc = usr.loc
			R.Chakra=usr.Chakra/5
			R.MaxChakra=usr.MaxChakra/5
			R.Strength=usr.Strength/6
			R.Agility=usr.Agility/5
			R.Defence=usr.Defence/4
			R.Control=usr.Control/5
			R.Resistance=usr.Resistance/5
			R.Ninjutsu=usr.Ninjutsu/2
			R.Genjutsu=usr.Genjutsu/3
			R.Taijutsu = usr.Taijutsu/5
			R.attackable=1
			R.Health=100
			R.MaxHealth=100