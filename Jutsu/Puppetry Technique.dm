mob/var/PuppetPoison=0
mob/Puppet/MouseDrag()
	if(src.displaykey==usr.key)
		mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)
mob/Puppet/New()
	..()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)


mob/Puppet/MouseDrop(o_o,s_l,o_l) //make it so if an object has been dragged to someplace...
	..()
	if(src.displaykey==usr.key)
		if(isturf(o_l)) //making sure it was dropped on the map, and not in a statpanel or off the map
			walk_towards(src,o_l)
mob/Puppet
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
mob/Puppet
	var/function
	New()
		..()
	Click()
		if(displaykey==usr.key)
			var/list/Choices=new/list
			Choices.Add("Attack Target")
			Choices.Add("Follow")
			Choices.Add("Stay")
			Choices.Add("Doku Kiri Jigoku")
			Choices.Add("Destroy Puppet")
			Choices.Add("Destroy Puppets")
			Choices.Add("Cancel")
			switch(input("Choose Option","",text) in Choices)
				if("Doku Kiri Jigoku")
					var/obj/Poison_Bomb/A = new
					A.damage = (src.Ninjutsu/10)+1
					viewers(16)<<output("<font color=[usr.SayFont]>[usr] yells<font color = white>: Doku Kiri Jigoku!","outputic.output")
					A.loc=src.loc
					A.dir = src.dir
					walk(A,src.dir)
				if("Destroy Puppets")
					for(var/mob/Puppet/A)
						if(A==src) continue
						if(A.displaykey==usr.key)
							usr.Taijutsu += A.experiance
							usr.Strength += A.experiance
							usr.Agility += A.experiance
							usr.Defence += A.experiance
							A.overlays = null
							spawn() flick('Smoke.dmi',A)
							del(A)
					del(src)
				if("Destroy Puppet")
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

obj/Ninjutsu/Kugutsu_no_Jutsu
	var/Puppetskill=1
	icon='Skillcard.dmi'
	icon_state="Puppet"
	Click()
		if(src in usr.contents)
			var/Puppets=0
			if(usr.Chakra<20)
				return
			if(!usr.move)
				return
			for(var/mob/Puppet/Z)
				if(Z.displaykey==usr.key)
					Puppets+=1
			if(Puppets<Puppetskill)
				if(prob(10/Puppetskill/Puppetskill/Puppetskill)&&Puppetskill<11)
					usr<<output("Your understanding of the Kugutsu no Jutsu has increased.","outputic.output")
					Puppetskill+=1
					Update()
				usr.Jutsu_Gain()
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=20
				var/mob/A=new/mob/Puppet
				src.Active=1
				viewers(16)<<output("<font color=[usr.SayFont]>[usr] yells<font color = white>: Kugutsu no Jutsu!","outputic.output")
				flick('Smoke.dmi',A)
				A.Cap=usr.Cap
				A.Health=usr.Health/10
				A.MaxHealth=usr.MaxHealth/10
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
				A.name="Puppet"
				A.icon='Puppets.dmi'
				A.move=1
				spawn(45) src.Active=0
			else
				usr<<output("You do not have the skill to create this many Puppets.","outputic.output")

mob/proc
	Puppet_Poison()
		while(src.PuppetPoison)
			src.Health -= rand(1,3)
			src.Ko()
			sleep(rand(80,200))

mob/DPuppet/MouseDrag()
	if(src.displaykey==usr.key)
		mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)
mob/DPuppet/New()
	..()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)


mob/DPuppet/MouseDrop(o_o,s_l,o_l) //make it so if an object has been dragged to someplace...
	..()
	if(src.displaykey==usr.key)
		if(isturf(o_l)) //making sure it was dropped on the map, and not in a statpanel or off the map
			walk_towards(src,o_l)
mob/DPuppet
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
mob/DPuppet
	var/function
	New()
		..()
	Click()
		if(displaykey==usr.key)
			var/list/Choices=new/list
			Choices.Add("Attack Target")
			Choices.Add("Follow")
			Choices.Add("Stay")
			Choices.Add("Doku Kiri Jigoku")
			Choices.Add("Destroy Puppet")
			Choices.Add("Destroy Puppets")
			Choices.Add("Cancel")
			switch(input("Choose Option","",text) in Choices)
				if("Doku Kiri Jigoku")
					var/obj/Poison_Bomb/A = new
					A.damage = (src.Ninjutsu/10)+1
					viewers(16)<<output("<font color=[usr.SayFont]>[usr] yells<font color = white>: Doku Kiri Jigoku!","outputic.output")
					A.loc=src.loc
					A.dir = src.dir
					walk(A,src.dir)
				if("Destroy Puppet")
					for(var/mob/Puppet/A)
						if(A.displaykey==usr.key)
							usr.Taijutsu += A.experiance
							usr.Strength += A.experiance
							usr.Agility += A.experiance
							usr.Defence += A.experiance
							A.overlays = null
							spawn() flick('Smoke.dmi',A)
							del(A)
				if("Destroy Puppets")
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

obj/Ninjutsu/Deyuaru_Kugutsu_no_Jutsu
	var/Puppetskill=1
	icon='Puppet2.dmi'
	icon_state=""
	Click()
		if(src in usr.contents)
			var/Puppets=0
			if(usr.Chakra<20)
				return
			if(!usr.move)
				return
			for(var/mob/DPuppet/Z)
				if(Z.displaykey==usr.key)
					Puppets+=1
			if(Puppets<Puppetskill)
				if(prob(5/Puppetskill/Puppetskill/Puppetskill)&&Puppetskill<11)
					usr<<output("Your understanding of the Deyuaru Kugutsu no Jutsu has increased.","outputic.output")
					Puppetskill+=1
					Update()
				usr.Jutsu_Gain()
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=20
				var/mob/A=new/mob/DPuppet
				src.Active=1
				viewers(16)<<output("<font color=[usr.SayFont]>[usr] yells<font color = white>: Deyuaru Kugutsu no Jutsu!","outputic.output")
				flick('Smoke.dmi',A)
				A.Cap=usr.Cap
				A.Health=usr.Health/2
				A.MaxHealth=usr.MaxHealth/2
				A.Chakra=usr.Chakra/2
				A.MaxChakra=usr.MaxChakra/2
				A.Strength=usr.Strength/2
				A.Agility=usr.Agility/2
				A.Defence=usr.Defence/2
				A.Control=usr.Control/2
				A.Resistance=usr.Resistance/2
				A.Taijutsu=usr.Taijutsu/2
				A.Ninjutsu=usr.Ninjutsu/2
				A.Genjutsu=usr.Genjutsu/2
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
				A.name="Puppet"
				A.icon='Puppet2.dmi'
				A.move=1
				spawn(45) src.Active=0
			else
				usr<<output("You do not have the skill to create this many Puppets.","outputic.output")



obj/Poison_Bomb
	icon='Poison.dmi'
	icon_state="Throw"
	density=1
	var/damage
	New()
		..()
		spawn(40) del(src)
	Bump(mob/M)
		if(istype(M,/mob))
			if(M.attackable)
				if(M.Weapon&&M.attacking)
					if(get_step(M,src))
						walk(src,0)
						var/obj/P_Smoke/A=new()
						var/obj/P_Smoke/B=new()
						var/obj/P_Smoke/C=new()
						var/obj/P_Smoke/D=new()
						var/obj/P_Smoke/E=new()
						var/obj/P_Smoke/F=new()
						var/obj/P_Smoke/G=new()
						var/obj/P_Smoke/H=new()
						var/obj/P_Smoke/I=new()
						A.loc=locate(M.x-1,M.y,M.z)
						B.loc=locate(M.x-1,M.y-1,M.z)
						C.loc=locate(M.x-1,M.y+1,M.z)
						D.loc=locate(M.x,M.y-1,M.z)
						E.loc=locate(M.x,M.y,M.z)
						F.loc=locate(M.x,M.y+1,M.z)
						G.loc=locate(M.x+1,M.y-1,M.z)
						H.loc=locate(M.x+1,M.y,M.z)
						I.loc=locate(M.x+1,M.y+1,M.z)
						M.PuppetPoison=1
						M.Puppet_Poison()
						del(src)

					else
						// M.Health -= damage/M.Defence*1.2
						M.Ko()
						spawn() flick('Explode.dmi',M)
						del(src)
						var/obj/P_Smoke/A=new()
						var/obj/P_Smoke/B=new()
						var/obj/P_Smoke/C=new()
						var/obj/P_Smoke/D=new()
						var/obj/P_Smoke/E=new()
						var/obj/P_Smoke/F=new()
						var/obj/P_Smoke/G=new()
						var/obj/P_Smoke/H=new()
						var/obj/P_Smoke/I=new()
						A.loc=locate(M.x-1,M.y,M.z)
						B.loc=locate(M.x-1,M.y-1,M.z)
						C.loc=locate(M.x-1,M.y+1,M.z)
						D.loc=locate(M.x,M.y-1,M.z)
						E.loc=locate(M.x,M.y,M.z)
						F.loc=locate(M.x,M.y+1,M.z)
						G.loc=locate(M.x+1,M.y-1,M.z)
						H.loc=locate(M.x+1,M.y,M.z)
						I.loc=locate(M.x+1,M.y+1,M.z)
						M.PuppetPoison=1
						M.Puppet_Poison()

				else
					// M.Health -= damage/M.Defence*1.2
					M.Ko()
					var/obj/P_Smoke/A=new()
					var/obj/P_Smoke/B=new()
					var/obj/P_Smoke/C=new()
					var/obj/P_Smoke/D=new()
					var/obj/P_Smoke/E=new()
					var/obj/P_Smoke/F=new()
					var/obj/P_Smoke/G=new()
					var/obj/P_Smoke/H=new()
					var/obj/P_Smoke/I=new()
					A.loc=locate(M.x-1,M.y,M.z)
					B.loc=locate(M.x-1,M.y-1,M.z)
					C.loc=locate(M.x-1,M.y+1,M.z)
					D.loc=locate(M.x,M.y-1,M.z)
					E.loc=locate(M.x,M.y,M.z)
					F.loc=locate(M.x,M.y+1,M.z)
					G.loc=locate(M.x+1,M.y-1,M.z)
					H.loc=locate(M.x+1,M.y,M.z)
					I.loc=locate(M.x+1,M.y+1,M.z)
					M.PuppetPoison=1
					M.Puppet_Poison()
					del(src)
			else
				del(src)
		if(istype(M,/turf))
			if(M.density)
				walk(src,0)
				var/obj/P_Smoke/A=new()
				var/obj/P_Smoke/B=new()
				var/obj/P_Smoke/C=new()
				var/obj/P_Smoke/D=new()
				var/obj/P_Smoke/E=new()
				var/obj/P_Smoke/F=new()
				var/obj/P_Smoke/G=new()
				var/obj/P_Smoke/H=new()
				var/obj/P_Smoke/I=new()
				A.loc=locate(M.x-1,M.y,M.z)
				B.loc=locate(M.x-1,M.y-1,M.z)
				C.loc=locate(M.x-1,M.y+1,M.z)
				D.loc=locate(M.x,M.y-1,M.z)
				E.loc=locate(M.x,M.y,M.z)
				F.loc=locate(M.x,M.y+1,M.z)
				G.loc=locate(M.x+1,M.y-1,M.z)
				H.loc=locate(M.x+1,M.y,M.z)
				I.loc=locate(M.x+1,M.y+1,M.z)
				del(src)



obj/P_Smoke
	icon='Poison.dmi'
	icon_state="1"
	layer=9
	New()
		..()
		spawn(1)
			icon_state="2"
			spawn(1)
				icon_state="3"
				spawn(1)
					icon_state="4"
					spawn(1)
						icon_state="5"
						spawn(1)
							del src





