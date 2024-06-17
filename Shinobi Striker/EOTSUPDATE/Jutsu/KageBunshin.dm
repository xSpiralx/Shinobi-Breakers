mob/KageBunshin/MouseDrag()
	..()
	if(src.displaykey==usr.key)
		mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)
mob/KageBunshin/New()
	..()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)


mob/KageBunshin/MouseDrop(o_o,s_l,o_l) //make it so if an object has been dragged to someplace...
	..()
	if(src.displaykey==usr.key)
		if(isturf(o_l)) //making sure it was dropped on the map, and not in a statpanel or off the map
			walk_towards(src,o_l)
mob/var/experiance=0
mob/KageBunshin
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
		spawn() Run()
	Click()
		if(displaykey==usr.key)
			var/list/Choices=new/list
			Choices.Add("Attack Target")
			Choices.Add("Follow")
			Choices.Add("Stay")
			Choices.Add("Destroy Bunshin")
			Choices.Add("Destroy Bunshins")
			Choices.Add("Clone POV")
			Choices.Add("Cancel")
			switch(input("Choose Option","",text) in Choices)


				if("Clone POV")
					if(!usr.MindTransfer)
						usr.MindTransfer=src
						src.MindAfflicted=usr
						usr.client.eye=src
						usr.client.perspective=EYE_PERSPECTIVE
						return
					if(usr.MindTransfer)
						usr.MindTransfer.MindAfflicted=0
						usr.MindTransfer=null
						usr.client.eye=usr
						usr.client.perspective=EYE_PERSPECTIVE
						return
				if("Destroy Bunshins")
					if(!src) return
					if(usr.MindTransfer)
						usr.MindTransfer.MindAfflicted=0
						usr.MindTransfer=null
						usr.client.eye=usr
						usr.client.perspective=EYE_PERSPECTIVE
					usr.bunshinList -= src
					for(var/mob/KageBunshin/A)
						if(A==src) continue
						if(A.displaykey==usr.key)
							usr.Taijutsu += A.experiance
							usr.Strength += A.experiance
							usr.Agility += A.experiance
							usr.Defence += A.experiance
							usr.bunshinList -= A
							A.overlays = null
							spawn() flick('Smoke.dmi',A)
							del(A)
					del(src)
				if("Destroy Bunshin")
					if(!src) return
					if(usr.MindTransfer)
						usr.MindTransfer.MindAfflicted=0
						usr.MindTransfer=null
						usr.client.eye=usr
						usr.client.perspective=EYE_PERSPECTIVE
					usr.Taijutsu += src.experiance
					usr.Strength += src.experiance
					usr.Agility += src.experiance
					usr.Defence += src.experiance
					usr.bunshinList -= src
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
							sleep(10)
							if(prob(10)) step_rand(src)
							else step_towards(src,M)
							BunshinAttack()

obj/Ninjutsu/KageBunshin
	icon='Skillcard.dmi'
	icon_state="KageBunshin"
	Click()
		if(src in usr.contents)
			var/bunshins=0
			if(usr.Chakra<55)
				return
			if(!usr.move)
				return
			for(var/mob/KageBunshin/Z)
				if(Z.displaykey==usr.key)
					bunshins+=1
			if(bunshins<skill)
				if(prob(10/skill/skill/skill))
					usr<<output("<font size = -3>Your understanding of the Kage Bunshin no Jutsu has increased.","outputic.output")
					skill+=1
					Update()
				usr.Jutsu_Gain()
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=55
				src.Active=1
				var/mob/A=new/mob/KageBunshin
				var/mob/B=new/mob/KageBunshin
				var/mob/C=new/mob/KageBunshin
				usr.bunshinList+=A
				usr.bunshinList+=B
				usr.bunshinList+=C
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
				A.SayFont = usr.SayFont
				A.OSayFont = usr.OSayFont
				A.Taijutsu=usr.Taijutsu/10
				A.Ninjutsu=usr.Ninjutsu/10
				A.Genjutsu=usr.Genjutsu/10
				A.displaykey = usr.key
				A.Class=usr.Class
				A.attackable=1
				A.Savable=0
				A.Age = usr.Age
				A.bloodtype = usr.bloodtype
				A.Weight = usr.Weight
				A.Height = usr.Height
				A.Injuries = usr.Injuries
				A.Headbands = usr.Headbands
				A.mouse_over_pointer = usr.mouse_over_pointer
				A.generate_hover_name()
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
				flick('Smoke.dmi',B)
				B.Health=1
				B.MaxHealth=1
				B.Chakra=usr.Chakra/10
				B.MaxChakra=usr.MaxChakra/10
				B.Strength=usr.Strength/10
				B.Agility=usr.Agility/10
				B.Defence=usr.Defence/10
				B.Control=usr.Control/10
				B.Resistance=usr.Resistance/10
				B.Taijutsu=usr.Taijutsu/10
				B.Ninjutsu=usr.Ninjutsu/10
				B.Genjutsu=usr.Genjutsu/10
				B.displaykey = usr.key
				B.Class=usr.Class
				B.attackable=1
				B.Savable=0
				B.Age = usr.Age
				B.bloodtype = usr.bloodtype
				B.Weight = usr.Weight
				B.Height = usr.Height
				B.Injuries = usr.Injuries
				B.Headbands = usr.Headbands
				B.mouse_over_pointer = usr.mouse_over_pointer

				B.generate_hover_name()
				B.SayFont = usr.SayFont
				B.OSayFont = usr.OSayFont
				var/random2=rand(1,4)
				if(random2==1)
					B.loc=locate(usr.x-1,usr.y,usr.z)
				if(random2==2)
					B.loc=locate(usr.x+1,usr.y,usr.z)
				if(random2==3)
					B.loc=locate(usr.x,usr.y-1,usr.z)
				if(random2==4)
					B.loc=locate(usr.x,usr.y+1,usr.z)
				B.name="[usr.name]"
				B.icon=usr.icon
				B.overlays.Add(usr.overlays)
				B.move=1
				flick('Smoke.dmi',C)
				C.Health=1
				C.MaxHealth=1
				C.Chakra=usr.Chakra/10
				C.MaxChakra=usr.MaxChakra/10
				C.Strength=usr.Strength/10
				C.Agility=usr.Agility/10
				C.Defence=usr.Defence/10
				C.Control=usr.Control/10
				C.Resistance=usr.Resistance/10
				C.Taijutsu=usr.Taijutsu/10
				C.Ninjutsu=usr.Ninjutsu/10
				C.Genjutsu=usr.Genjutsu/10
				C.displaykey = usr.key
				C.Class=usr.Class
				C.attackable=1
				C.Savable=0
				C.Age = usr.Age
				C.bloodtype = usr.bloodtype
				C.Weight = usr.Weight
				C.Height = usr.Height
				C.Injuries = usr.Injuries
				C.Headbands = usr.Headbands
				C.mouse_over_pointer = usr.mouse_over_pointer
				C.generate_hover_name()
				C.SayFont = usr.SayFont
				C.OSayFont = usr.OSayFont
				var/random3=rand(1,4)
				if(random3==1)
					C.loc=locate(usr.x-1,usr.y,usr.z)
				if(random3==2)
					C.loc=locate(usr.x+1,usr.y,usr.z)
				if(random3==3)
					C.loc=locate(usr.x,usr.y-1,usr.z)
				if(random3==4)
					C.loc=locate(usr.x,usr.y+1,usr.z)
				C.name="[usr.name]"
				C.icon=usr.icon
				C.overlays.Add(usr.overlays)
				C.move=1
				if(skill>=20)
					var/mob/D=new/mob/KageBunshin
					var/mob/E=new/mob/KageBunshin
					var/mob/F=new/mob/KageBunshin
					var/mob/G=new/mob/KageBunshin
					var/mob/H=new/mob/KageBunshin
					var/mob/I=new/mob/KageBunshin
					usr.bunshinList+=D
					usr.bunshinList+=E
					usr.bunshinList+=F
					usr.bunshinList+=G
					usr.bunshinList+=H
					usr.bunshinList+=I
					flick('Smoke.dmi',D)
					D.Health=1
					D.MaxHealth=1
					D.Chakra=usr.Chakra/10
					D.MaxChakra=usr.MaxChakra/10
					D.Strength=usr.Strength/10
					D.Agility=usr.Agility/10
					D.Defence=usr.Defence/10
					D.Control=usr.Control/10
					D.Resistance=usr.Resistance/10
					D.Taijutsu=usr.Taijutsu/10
					D.Ninjutsu=usr.Ninjutsu/10
					D.Genjutsu=usr.Genjutsu/10
					D.displaykey = usr.key
					D.Class=usr.Class
					D.attackable=1
					D.Savable=0
					D.Age = usr.Age
					D.bloodtype = usr.bloodtype
					D.Weight = usr.Weight
					D.Height = usr.Height
					D.Injuries = usr.Injuries
					D.Headbands = usr.Headbands
					D.mouse_over_pointer = usr.mouse_over_pointer
					D.generate_hover_name()
					var/random1=rand(1,4)
					if(random1==1)
						D.loc=locate(usr.x-2,usr.y,usr.z)
					if(random1==2)
						D.loc=locate(usr.x+2,usr.y,usr.z)
					if(random1==3)
						D.loc=locate(usr.x,usr.y-2,usr.z)
					if(random1==4)
						D.loc=locate(usr.x,usr.y+2,usr.z)
					D.name="[usr.name]"
					D.icon=usr.icon
					D.overlays.Add(usr.overlays)
					D.move=1

					D.SayFont = usr.SayFont
					D.OSayFont = usr.OSayFont
					flick('Smoke.dmi',E)
					E.Health=1
					E.MaxHealth=1
					E.Chakra=usr.Chakra/10
					E.MaxChakra=usr.MaxChakra/10
					E.Strength=usr.Strength/10
					E.Agility=usr.Agility/10
					E.Defence=usr.Defence/10
					E.Control=usr.Control/10
					E.Resistance=usr.Resistance/10
					E.Taijutsu=usr.Taijutsu/10
					E.Ninjutsu=usr.Ninjutsu/10
					E.Genjutsu=usr.Genjutsu/10
					E.displaykey = usr.key
					E.Class=usr.Class
					E.attackable=1
					E.Savable=0
					E.Age = usr.Age
					E.bloodtype = usr.bloodtype
					E.Weight = usr.Weight
					E.Height = usr.Height
					E.Injuries = usr.Injuries
					E.Headbands = usr.Headbands
					E.mouse_over_pointer = usr.mouse_over_pointer
					E.generate_hover_name()
					E.SayFont = usr.SayFont
					E.OSayFont = usr.OSayFont
					var/random20=rand(1,4)
					if(random20==1)
						E.loc=locate(usr.x-2,usr.y,usr.z)
					if(random20==2)
						E.loc=locate(usr.x+2,usr.y,usr.z)
					if(random20==3)
						E.loc=locate(usr.x,usr.y-2,usr.z)
					if(random20==4)
						E.loc=locate(usr.x,usr.y+2,usr.z)
					E.name="[usr.name]"
					E.icon=usr.icon
					E.overlays.Add(usr.overlays)
					E.move=1
					flick('Smoke.dmi',F)
					F.Health=1
					F.MaxHealth=1
					F.Chakra=usr.Chakra/10
					F.MaxChakra=usr.MaxChakra/10
					F.Strength=usr.Strength/10
					F.Agility=usr.Agility/10
					F.Defence=usr.Defence/10
					F.Control=usr.Control/10
					F.Resistance=usr.Resistance/10
					F.Taijutsu=usr.Taijutsu/10
					F.Ninjutsu=usr.Ninjutsu/10
					F.Genjutsu=usr.Genjutsu/10
					F.displaykey = usr.key
					F.Class=usr.Class
					F.attackable=1
					F.Savable=0
					F.Age = usr.Age
					F.bloodtype = usr.bloodtype
					F.Weight = usr.Weight
					F.Height = usr.Height
					F.Injuries = usr.Injuries
					F.Headbands = usr.Headbands
					F.mouse_over_pointer = usr.mouse_over_pointer
					F.generate_hover_name()
					F.SayFont = usr.SayFont
					F.OSayFont = usr.OSayFont
					var/random30=rand(1,4)
					if(random30==1)
						F.loc=locate(usr.x-2,usr.y,usr.z)
					if(random30==2)
						F.loc=locate(usr.x+2,usr.y,usr.z)
					if(random30==3)
						F.loc=locate(usr.x,usr.y-2,usr.z)
					if(random30==4)
						F.loc=locate(usr.x,usr.y+2,usr.z)
					F.name="[usr.name]"
					F.icon=usr.icon
					F.overlays.Add(usr.overlays)
					F.move=1
					flick('Smoke.dmi',G)
					G.Health=1
					G.MaxHealth=1
					G.Chakra=usr.Chakra/10
					G.MaxChakra=usr.MaxChakra/10
					G.Strength=usr.Strength/10
					G.Agility=usr.Agility/10
					G.Defence=usr.Defence/10
					G.Control=usr.Control/10
					G.Resistance=usr.Resistance/10
					G.Taijutsu=usr.Taijutsu/10
					G.Ninjutsu=usr.Ninjutsu/10
					G.Genjutsu=usr.Genjutsu/10
					G.displaykey = usr.key
					G.Class=usr.Class
					G.attackable=1
					G.Savable=0
					G.Age = usr.Age
					G.bloodtype = usr.bloodtype
					G.Weight = usr.Weight
					G.Height = usr.Height
					G.Injuries = usr.Injuries
					G.Headbands = usr.Headbands
					G.mouse_over_pointer = usr.mouse_over_pointer
					G.generate_hover_name()
					G.SayFont = usr.SayFont
					G.OSayFont = usr.OSayFont
					var/random11=rand(1,4)
					if(random11==1)
						G.loc=locate(usr.x-2,usr.y,usr.z)
					if(random11==2)
						G.loc=locate(usr.x+2,usr.y,usr.z)
					if(random11==3)
						G.loc=locate(usr.x,usr.y-2,usr.z)
					if(random11==4)
						G.loc=locate(usr.x,usr.y+2,usr.z)
					G.name="[usr.name]"
					G.icon=usr.icon
					G.overlays.Add(usr.overlays)
					G.move=1
					flick('Smoke.dmi',H)
					H.Health=1
					H.MaxHealth=1
					H.Chakra=usr.Chakra/10
					H.MaxChakra=usr.MaxChakra/10
					H.Strength=usr.Strength/10
					H.Agility=usr.Agility/10
					H.Defence=usr.Defence/10
					H.Control=usr.Control/10
					H.Resistance=usr.Resistance/10
					H.Taijutsu=usr.Taijutsu/10
					H.Ninjutsu=usr.Ninjutsu/10
					H.Genjutsu=usr.Genjutsu/10
					H.displaykey = usr.key
					H.Class=usr.Class
					H.attackable=1
					H.SayFont = usr.SayFont
					H.OSayFont = usr.OSayFont
					H.Savable=0
					H.Age = usr.Age
					H.bloodtype = usr.bloodtype
					H.Weight = usr.Weight
					H.Height = usr.Height
					H.Injuries = usr.Injuries
					H.Headbands = usr.Headbands
					H.mouse_over_pointer = usr.mouse_over_pointer
					H.generate_hover_name()
					var/random21=rand(1,4)
					if(random21==1)
						H.loc=locate(usr.x-2,usr.y+1,usr.z)
					if(random21==2)
						H.loc=locate(usr.x+2,usr.y-1,usr.z)
					if(random21==3)
						H.loc=locate(usr.x+1,usr.y-2,usr.z)
					if(random21==4)
						H.loc=locate(usr.x-1,usr.y+2,usr.z)
					H.name="[usr.name]"
					H.icon=usr.icon
					H.overlays.Add(usr.overlays)
					H.move=1
					flick('Smoke.dmi',I)
					I.Health=1
					I.MaxHealth=1
					I.Chakra=usr.Chakra/10
					I.MaxChakra=usr.MaxChakra/10
					I.Strength=usr.Strength/10
					I.Agility=usr.Agility/10
					I.Defence=usr.Defence/10
					I.Control=usr.Control/10
					I.Resistance=usr.Resistance/10
					I.Taijutsu=usr.Taijutsu/10
					I.Ninjutsu=usr.Ninjutsu/10
					I.Genjutsu=usr.Genjutsu/10
					I.displaykey = usr.key
					I.Class=usr.Class
					I.attackable=1
					I.Savable=0
					I.Age = usr.Age
					I.bloodtype = usr.bloodtype
					I.Weight = usr.Weight
					I.Height = usr.Height
					I.Injuries = usr.Injuries
					I.Headbands = usr.Headbands
					I.mouse_over_pointer = usr.mouse_over_pointer
					I.generate_hover_name()
					I.SayFont = usr.SayFont
					I.OSayFont = usr.OSayFont
					var/random31=rand(1,4)
					if(random31==1)
						I.loc=locate(usr.x-2,usr.y+1,usr.z)
					if(random31==2)
						I.loc=locate(usr.x+2,usr.y-1,usr.z)
					if(random31==3)
						I.loc=locate(usr.x+1,usr.y-2,usr.z)
					if(random31==4)
						I.loc=locate(usr.x-1,usr.y+2,usr.z)
					I.name="[usr.name]"
					I.icon=usr.icon
					I.overlays.Add(usr.overlays)
					I.move=1
				sleep(25)
				src.Active=0
			else
				usr<<output("<font size = -3>You do not have the skill to create this many bunshins.","outputic.output")



obj/Ninjutsu/TajuuKageBunshin
	skill=4
	icon='Skillcard.dmi'
	icon_state="KageBunshin"
	Click()
		if(src in usr.contents)
			var/bunshins=0
			if(usr.Chakra<140)
				return
			if(!usr.move)
				return
			for(var/mob/KageBunshin/Z)
				if(Z.displaykey==usr.key)
					bunshins+=1
			if(bunshins<skill)
				if(prob(10/skill/skill/skill))
					usr<<output("<font size = -3>Your understanding of the Tajuu Kage Bunshin no Jutsu has increased.","outputic.output")
					skill+=1
				usr.Jutsu_Gain()
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=140
				var/mob/A=new/mob/KageBunshin
				var/mob/B=new/mob/KageBunshin
				var/mob/C=new/mob/KageBunshin
				var/mob/D=new/mob/KageBunshin
				usr.bunshinList+=A
				usr.bunshinList+=B
				usr.bunshinList+=C
				usr.bunshinList+=D
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
				A.Age = usr.Age
				A.SayFont = usr.SayFont
				A.OSayFont = usr.OSayFont
				A.bloodtype = usr.bloodtype
				A.Weight = usr.Weight
				A.Height = usr.Height
				A.Injuries = usr.Injuries
				A.Headbands = usr.Headbands
				A.mouse_over_pointer = usr.mouse_over_pointer
				A.generate_hover_name()
				var/random1=rand(1,4)
				if(random1==1)
					A.loc=locate(usr.x-1,usr.y,usr.z)
				if(random1==2)
					A.loc=locate(usr.x+1,usr.y,usr.z)
				if(random1==3)
					A.loc=locate(usr.x,usr.y-1,usr.z)
				if(random1==4)
					A.loc=locate(usr.x,usr.y+1,usr.z)
				A.name="[usr.name]"
				A.icon=usr.icon
				A.overlays.Add(usr.overlays)
				A.move=1
				src.Active=0
				flick('Smoke.dmi',B)
				B.Health=1
				B.MaxHealth=1
				B.Chakra=usr.Chakra/10
				B.MaxChakra=usr.MaxChakra/10
				B.Strength=usr.Strength/10
				B.Agility=usr.Agility/10
				B.Defence=usr.Defence/10
				B.Control=usr.Control/10
				B.Resistance=usr.Resistance/10
				B.Taijutsu=usr.Taijutsu/10
				B.Ninjutsu=usr.Ninjutsu/10
				B.Genjutsu=usr.Genjutsu/10
				B.displaykey = usr.key
				B.Class=usr.Class
				B.attackable=1
				B.Savable=0
				B.Age = usr.Age
				B.bloodtype = usr.bloodtype
				B.Weight = usr.Weight
				B.Height = usr.Height
				B.Injuries = usr.Injuries
				B.Headbands = usr.Headbands
				B.mouse_over_pointer = usr.mouse_over_pointer
				B.generate_hover_name()
				B.SayFont = usr.SayFont
				B.OSayFont = usr.OSayFont
				var/random2=rand(1,4)
				if(random2==1)
					B.loc=locate(usr.x-1,usr.y,usr.z)
				if(random2==2)
					B.loc=locate(usr.x+1,usr.y,usr.z)
				if(random2==3)
					B.loc=locate(usr.x,usr.y-1,usr.z)
				if(random2==4)
					B.loc=locate(usr.x,usr.y+1,usr.z)
				B.name="[usr.name]"
				B.icon=usr.icon
				B.overlays.Add(usr.overlays)
				B.move=1
				src.Active=0
				flick('Smoke.dmi',C)
				C.Health=1
				C.MaxHealth=1
				C.Chakra=usr.Chakra/10
				C.MaxChakra=usr.MaxChakra/10
				C.Strength=usr.Strength/10
				C.Agility=usr.Agility/10
				C.Defence=usr.Defence/10
				C.Control=usr.Control/10
				C.Resistance=usr.Resistance/10
				C.Taijutsu=usr.Taijutsu/10
				C.Ninjutsu=usr.Ninjutsu/10
				C.Genjutsu=usr.Genjutsu/10
				C.displaykey = usr.key
				C.Class=usr.Class
				C.attackable=1
				C.Savable=0
				C.Age = usr.Age
				C.bloodtype = usr.bloodtype
				C.Weight = usr.Weight
				C.Height = usr.Height
				C.Injuries = usr.Injuries
				C.Headbands = usr.Headbands
				C.mouse_over_pointer = usr.mouse_over_pointer
				C.generate_hover_name()
				C.SayFont = usr.SayFont
				C.OSayFont = usr.OSayFont
				var/random3=rand(1,4)
				if(random3==1)
					C.loc=locate(usr.x-1,usr.y,usr.z)
				if(random3==2)
					C.loc=locate(usr.x+1,usr.y,usr.z)
				if(random3==3)
					C.loc=locate(usr.x,usr.y-1,usr.z)
				if(random3==4)
					C.loc=locate(usr.x,usr.y+1,usr.z)
				C.name="[usr.name]"
				C.icon=usr.icon
				C.overlays.Add(usr.overlays)
				C.move=1
				src.Active=0
				flick('Smoke.dmi',D)
				D.Health=1
				D.MaxHealth=1
				D.Chakra=usr.Chakra/10
				D.MaxChakra=usr.MaxChakra/10
				D.Strength=usr.Strength/10
				D.Agility=usr.Agility/10
				D.Defence=usr.Defence/10
				D.Control=usr.Control/10
				D.Resistance=usr.Resistance/10
				D.Taijutsu=usr.Taijutsu/10
				D.Ninjutsu=usr.Ninjutsu/10
				D.Genjutsu=usr.Genjutsu/10
				D.displaykey = usr.key
				D.Class=usr.Class
				D.attackable=1
				D.Savable=0
				D.Age = usr.Age
				D.SayFont = usr.SayFont
				D.OSayFont = usr.OSayFont
				D.bloodtype = usr.bloodtype
				D.Weight = usr.Weight
				D.Height = usr.Height
				D.Injuries = usr.Injuries
				D.Headbands = usr.Headbands
				D.mouse_over_pointer = usr.mouse_over_pointer
				D.generate_hover_name()
				var/random4=rand(1,4)
				if(random4==1)
					D.loc=locate(usr.x-1,usr.y,usr.z)
				if(random4==2)
					D.loc=locate(usr.x+1,usr.y,usr.z)
				if(random4==3)
					D.loc=locate(usr.x,usr.y-1,usr.z)
				if(random4==4)
					D.loc=locate(usr.x,usr.y+1,usr.z)
				D.name="[usr.name]"
				D.icon=usr.icon
				D.overlays.Add(usr.overlays)
				D.move=1
				src.Active=0
			else
				usr<<output("<font size = -3>You do not have the skill to create this many bunshins.","outputic.output")