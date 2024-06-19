/*IDEAS
Implant Rods into corpse's
Change which you control
Bunshin commands on others.
*/
mob/var/atom/movable/controlled
mob/Move(l,d)
	if(controlled)
		step(controlled,d)
		//..()// This makes it so the person controlling the mob will move, if you don't want this to happen then just delete this line.
	else return ..()


mob/var
	Rinnegan=0
	RinActive=0
obj/Doujutsu/Rinnegan
	icon='Skillcard.dmi'
	icon_state="Rinnegan"
	Click()
		if(src in usr.contents)
			if(usr.RinActive)
				return
			if(!usr.Rinnegan)
				usr.Rinnegan=1
				usr.RinActive=1
				usr.MaxControl+=(usr.MaxControl/1.5)
				usr.MaxNinjutsu+=(usr.MaxNinjutsu/1.5)
				usr.overlays += 'Eyes_Rinnegan.dmi'
				usr.contents += new/obj/Doujutsu/Create_Body
				usr.contents += new/obj/Doujutsu/Control_Body
				usr.contents += new/obj/Doujutsu/Summon_Body
				usr.Rinnegan()


/*obj/Doujutsu/Banshou_Tenin
	icon='Skillcard.dmi'
	icon_state="Rinnegan"
	Click()
		if(src in usr.contents)
			Pull2(usr,src)

proc
	Pull2(atom/movable/Start,atom/End)    //Proc to shoot a missile
		var/obj/Pull/A=new(Start)       //and pull whatever mob/obj
		step(A,usr.dir)                   //that it hits with a density
		if(!A) return                     //of 1 within 4 squares of the
		step(A,usr.dir)                   //users direction
		if(!A) return
		step(A,usr.dir)
		if(!A) return
		step(A,usr.dir)
		del A
obj                                  //this is the obj that pulls
	Pull                         //a mob when it hits it
		density = 1
		var/atom/M
		Bump(mob/M)
			..()
			density = 0
			if(istype(M,/mob))
				step(M,get_dir(M,src));del src*/

mob/proc
	Rinnegan()
		if(src.Rinnegan)

			for(var/mob/M in oviewers())
				if(!istype(M,/mob/Bunshin/))
					for(var/I in src.client.images)
						del(I)
					var/image/I = new('Base_Sharingan.dmi',M,"[M.icon_state]",FLY_LAYER)
					client.images += I
			spawn(50)
				src.Rinnegan()

mob/var
	body1=0
	body2=0
	body3=0
	body4=0
	body5=0
	body6=0

obj/Doujutsu
	Control_Body
		icon='Skillcard.dmi'
		icon_state="Rinnegan"
		Click()
			if(src in usr.contents)
				var/list/V = new/list
				for(var/mob/Rinnegan_Body/M in oviewers())
					if(M.displaykey==usr.key)
						V.Add(M)
				var/mob/A=input("Which body would you like to take control of?","Cancel") in V
				if(A==null)
					return
				//usr.client.perspective=MOB_PERSPECTIVE
				usr.client.perspective=EYE_PERSPECTIVE
				usr.client.eye=A
				usr.controlled=A


	Create_Body
		icon='Skillcard.dmi'
		icon_state="Rinnegan"
		Click()
			if(src in usr.contents)
				for(var/mob/M in get_step(usr,usr.dir))
					if(M.Dead)
						if(!usr.body1)
							usr.body1=1
							var/mob/A=new/mob/Rinnegan_Body
							flick('Bunshin.dmi',A)
							A.body1=1
							A.Health=usr.Health
							A.MaxHealth=usr.MaxHealth
							A.Chakra=usr.Chakra
							A.MaxChakra=usr.MaxChakra
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
							A.Savable=1
							A.icon=M.icon
							A.overlays = M.overlays
							A.overlays += 'Eyes_Rinnegan.dmi'
							A.name = "[usr.name]'s First Body"
							A.loc = M.loc
							return
						if(!usr.body2)
							usr.body2=1
							var/mob/A=new/mob/Rinnegan_Body
							flick('Bunshin.dmi',A)
							A.body2=1
							A.Health=usr.Health
							A.MaxHealth=usr.MaxHealth
							A.Chakra=usr.Chakra
							A.MaxChakra=usr.MaxChakra
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
							A.Savable=1
							A.icon=M.icon
							A.overlays = M.overlays
							A.overlays += 'Eyes_Rinnegan.dmi'
							A.name = "[usr.name]'s Second Body"
							A.loc = M.loc
							return
						if(!usr.body3)
							usr.body3=1
							var/mob/A=new/mob/Rinnegan_Body
							flick('Bunshin.dmi',A)
							A.body3=1
							A.Health=usr.Health
							A.MaxHealth=usr.MaxHealth
							A.Chakra=usr.Chakra
							A.MaxChakra=usr.MaxChakra
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
							A.Savable=1
							A.icon=M.icon
							A.overlays = M.overlays
							A.overlays += 'Eyes_Rinnegan.dmi'
							A.name = "[usr.name]'s Third Body"
							A.loc = M.loc
							return
						if(!usr.body4)
							usr.body4=1
							var/mob/A=new/mob/Rinnegan_Body
							flick('Bunshin.dmi',A)
							A.body4=1
							A.Health=usr.Health
							A.MaxHealth=usr.MaxHealth
							A.Chakra=usr.Chakra
							A.MaxChakra=usr.MaxChakra
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
							A.Savable=1
							A.icon=M.icon
							A.overlays = M.overlays
							A.overlays += 'Eyes_Rinnegan.dmi'
							A.name = "[usr.name]'s Fourth Body"
							A.loc = M.loc
							return
						if(!usr.body5)
							usr.body5=1
							var/mob/A=new/mob/Rinnegan_Body
							flick('Bunshin.dmi',A)
							A.body5=1
							A.Health=usr.Health
							A.MaxHealth=usr.MaxHealth
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
							A.Savable=1
							A.icon=M.icon
							A.overlays = M.overlays
							A.overlays += 'Eyes_Rinnegan.dmi'
							A.name = "[usr.name]'s Fifth Body"
							A.loc = M.loc
							return
						if(!usr.body6)
							usr.body6=1
							var/mob/A=new/mob/Rinnegan_Body
							flick('Bunshin.dmi',A)
							A.body6=1
							A.Health=usr.Health
							A.MaxHealth=usr.MaxHealth
							A.Chakra=usr.Chakra
							A.MaxChakra=usr.MaxChakra
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
							A.Savable=1
							A.icon=M.icon
							A.overlays = M.overlays
							A.overlays += 'Eyes_Rinnegan.dmi'
							A.name = "[usr.name]'s Sixth Body"
							A.loc = M.loc
							return
						M.loc=locate(142,153,25)
						M.move=1
						M.Dead=1

	Summon_Body
		icon='Skillcard.dmi'
		icon_state="Rinnegan"
		Click()
			if(src in usr.contents)
				var/list/V = new/list
				for(var/mob/Rinnegan_Body/M in usr.contents)
					if(M.displaykey==usr.key)
						V.Add(M)
				var/mob/A=input("Which body would you like to take summon?") in V
				if(A==null)
					return
				A.loc = usr.loc

mob/Rinnegan_Body/MouseDrag()
	if(src.displaykey==usr.key)
		mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)

mob/Rinnegan_Body/New()
	..()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)


mob/Rinnegan_Body/MouseDown(o_o,s_l,o_l) //make it so if an object has been dragged to someplace...
	if(src.displaykey==usr.key)
		if(isturf(o_l)) //making sure it was dropped on the map, and not in a statpanel or off the map
			walk_towards(src,o_l)

mob/Rinnegan_Body
	var/function
	New()
		..()
	Click()
		if(displaykey==usr.key)
			var/list/Choices=new/list
			Choices.Add("Attack Target")
			Choices.Add("Follow")
			Choices.Add("Stay")
			Choices.Add("Rename")
			Choices.Add("Unsummon Body")
			Choices.Add("UnControl Body")
			Choices.Add("Cancel")
			switch(input("Choose Option","",text) in Choices)
				if("Follow")
					function=1
					spawn while(function==1)
						sleep(5)
						if(prob(20)) step_rand(src)
						else step_towards(src,usr)
				if("Stay") function=2
				if("Rename")
					var/name = input("What would you like to call this body?") as text
					if(name=="")
						return
					else
						src.name=name
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
				if("Unsummon Body")
					flick('Smoke.dmi',src)
					usr.contents += src
				if("UnControl Body")
					usr.client.perspective=EYE_PERSPECTIVE
					usr.client.eye=usr
					usr.controlled=null
					src<<output("<font size = -3>You are no longer controlling a Body.","outputic.output")
					src<<output("<font size = -3>You are no longer controlling a Body.","outputall.output")