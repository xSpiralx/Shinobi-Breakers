mob/var/Akaigan=0
obj/Doujutsu/Akaigan
	icon='Skillcard.dmi'
	icon_state="Fureagan"
	Click()
		if(src in usr.contents)
			if(!usr.Akaigan)
				if(prob(25/skill/skill/skill))
					if(skill>5)
						return
					skill+=1
				usr.SC()
				usr.Akaigan=1
				usr.overlays += 'Fureagan.dmi'
				usr.Taijutsu += 10
				usr.Agility += 50
			else
				usr.Akaigan=0
				usr.overlays -= 'Fureagan.dmi'
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Agility = usr.MaxAgility

mob/var/drain6=0
mob/proc
	drain6()
		spawn() while(usr.drain6)
			sleep(50)
			usr.Chakra -= 5
			if(usr.Chakra<=0)
				usr.overlays -= 'Fureagan.dmi'
				usr.overlays -= 'Fureagan.dmi'
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Agility = usr.MaxAgility
				usr.Defence = usr.MaxDefence
				usr.drain6=0
				usr.Akaigan=0



mob/FureaBunshin/MouseDrag()
	if(src.displaykey==usr.key)
		mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)
mob/FureaBunshin/New()
	..()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)


mob/FureaBunshin/MouseDrop(o_o,s_l,o_l) //make it so if an object has been dragged to someplace...
	..()
	if(src.displaykey==usr.key)
		if(isturf(o_l)) //making sure it was dropped on the map, and not in a statpanel or off the map
			walk_towards(src,o_l)
mob/FureaBunshin
	var/function
	/*Bump(mob/M)
		..()
		if(istype(M,/mob/))
			if(displaykey==M.key)
				return
			else
				var/damage = src.Taijutsu-M.Defence*rand(1.5,3)
				// M.Health -= damage
				src.attacking = 1
				sleep(5)
				src.attacking = 0*/
	New()
		..()
	Click()
		if(displaykey==usr.key)
			var/list/Choices=new/list
			Choices.Add("Attack Target")
			Choices.Add("Follow")
			Choices.Add("Stay")
			Choices.Add("Destroy Bunshin")
			Choices.Add("Destroy Bunshins")
			Choices.Add("Cancel")
			switch(input("Choose Option","",text) in Choices)
				if("Destroy Bunshins")
					for(var/mob/FureaBunshin/A)
						if(A.displaykey==usr.key)
							usr.Taijutsu += A.experiance
							usr.Strength += A.experiance
							usr.Agility += A.experiance
							usr.Defence += A.experiance
							A.overlays = null
							spawn() flick('Smoke.dmi',A)
							del(A)
				if("Destroy Bunshin")
					usr.Taijutsu += src.experiance
					usr.Strength += src.experiance
					usr.Agility += src.experiance
					usr.Defence += src.experiance
					src.overlays = null
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
obj/Doujutsu/FureaBunshin
	icon='Skillcard.dmi'
	icon_state="OboroBunshin"
	Click()
		if(src in usr.contents)
			var/bunshins=0
			if(usr.Chakra<7.5)
				return
			if(!usr.move)
				return
			for(var/mob/FureaBunshin/Z)
				if(Z.displaykey==usr.key)
					bunshins+=1
			if(bunshins<skill)
				if(prob(10/skill/skill/skill))
					skill+=1
					Update()
				usr.Jutsu_Gain()
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=7.5
				var/mob/A=new/mob/FureaBunshin
				src.Active=1
				flick('Smoke.dmi',A)
				A.Health=1
				A.MaxHealth=1
				A.Chakra=usr.Chakra/10
				A.MaxChakra=usr.MaxChakra/10
				A.Strength=usr.Strength/10
				A.Agility=usr.Agility/10
				A.Defence=usr.Defence/10
				A.Control=usr.Control/10
				A.Resistance=usr.Resistance/10
				A.Taijutsu=usr.Taijutsu/10
				A.Ninjutsu=usr.Ninjutsu/10
				A.Genjutsu=usr.Genjutsu/10
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
				A.name="[usr.name]"
				A.icon=usr.icon
				A.overlays.Add(usr.overlays)
				A.move=1
				src.Active=0
			else
				usr<<output("<font size = -3>You do not have the skill to create this many bunshins.","outputic.output")