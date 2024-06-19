mob/Bugs/MouseDrag()
	..()
	if(src.displaykey==usr.key)
		mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)
mob/Bugs/New()
	..()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)


mob/Bugs/MouseDrop(o_o,s_l,o_l) //make it so if an object has been dragged to someplace...
	..()
	if(src.Owner == usr.key)
		if(isturf(o_l)) //making sure it was dropped on the map, and not in a statpanel or off the map
			walk_towards(src,o_l)

mob/Bugs
	Bugs
	icon='Bugs.dmi'
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
mob/Bugs
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
			Choices.Add("Unsummon Bugs")
			Choices.Add("Cancel")
			switch(input("Choose Option","",text) in Choices)
				if("Unsummon Bugs")
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


obj/Ninjutsu/Mushi_Yose_no_Jutsu
	icon='Skillcard.dmi'
	icon_state="Bugs"
	Click()
		if(src in usr.contents)
			for(var/mob/Bugs/Bugs/R in world)
				if(R.Owner==usr.key)
					usr << output("<font size = -3>You may only summon one swarm of Bugs at a time.","outputic.output")
					usr << output("<font size = -3>You may only summon one swarm of Bugs at a time.","outputall.output")
					return
			var/mob/Bugs/Bugs/R = new()
			Active=1
			spawn(50) Active=0
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







obj/Ninjutsu/Kikaichuu_no_Jutsu
	icon='Skillcard.dmi'
	icon_state="Kikaichuu"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<usr.MaxChakra*(0.10/skill))
					return
				if(prob(10/skill/skill/skill))
					usr<<output("<font size = -3>Your understanding of the Kikaichuu no Jutsu has increased.","outputic.output")
					usr<<output("<font size = -3>Your understanding of the Kikaichuu no Jutsu has increased.","outputall.output")
					Update()
					skill+=1
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=usr.MaxChakra*(0.20/skill)
				var/obj/BugAbil/A = new
				var/obj/BugTail/C = new
				A.damage = (usr.Ninjutsu/4)+1
				C.damage = (usr.Ninjutsu/4)+1
				usr.Jutsu_Gain()
				A.loc=usr.loc
				A.dir = usr.dir
				walk(A,usr.dir)
				C.loc=usr.loc
				C.dir = usr.dir
				walk(C,usr.dir)
				spawn(45)
					usr.firing=0
					src.Active=0

obj/BugAbil
	icon='Bugs.dmi'
	icon_state="Head"
	density = 1
	var/damage
	New()
		spawn(100)
			del src
	Bump(mob/M)
		if(istype(M,/mob))
			if(M.attackable)
				M.Chakra -= damage/2
				M.Ko()
				del(src)
		if(istype(M,/turf))
			if(M.density)
				del(src)
	/*Move()
		var/obj/BugTrail/A = new
		A.loc = src.loc
		A.dir = src.dir
		var/obj/BugTail/B = new
		B.loc = A.loc
		B.dir = A.dir
		..()*/

obj/BugMiddle
	icon='Bugs.dmi'
	icon_state="Trail"
	density = 1
	var/damage
	New()
		spawn(20)
			del src
obj/BugTail
	icon='Bugs.dmi'
	icon_state="Tail"
	density = 1
	var/damage
	New()
		spawn(20)
			del src


obj/Ninjutsu/Mushi_Dama
	icon='Skillcard.dmi'
	icon_state="Mushidama"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.Chakra<usr.MaxChakra*0.30)
					return
				usr.Chakra-=(usr.MaxChakra*0.30)
				var/list/V = new/list
				for(var/mob/M in oview())
					V.Add(M)
				var/mob/A=input("Who would you like to use the Mushi Dama on?") in V
				if(A==null)
					return
				if(usr.Ninjutsu >= A.Ninjutsu*1.1)
					Active=1
					spawn(50) Active=0
					A.overlays += 'Mushi Dama.dmi'
					A.move=0
					A.Bug=1
					A.Bug()
					A.icon_state="KO"
					usr.MaxGenjutsu += (1 *0.01)
					sleep(150*A.Ninjutsu/usr.Resistance*1.5)
					A.overlays -= 'Mushi Dama.dmi'
					A.move=1
					A.Bug=0
					A.icon_state=""
				else
					usr << output("<font size = -3>[A] resists your Mushi Dama!","outputic.output")
					usr << output("<font size = -3>[A] resists your Mushi Dama!","outputall.output")

mob/var/Bug=0
mob/proc
	Bug()
		while(src.Bug)
			sleep(10)
			src.Chakra -= 10
			if(src.Chakra<=0)
				src.Taijutsu = src.MaxTaijutsu
				src.overlays -= 'Chidori.dmi'
				src.overlays -= 'Rasengan.dmi'
				src.Bug=0
