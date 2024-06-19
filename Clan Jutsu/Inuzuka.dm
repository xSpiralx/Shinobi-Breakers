mob/Dog/MouseDrag()
	..()
	if(src.displaykey==usr.key)
		mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)
mob/Dog/New()
	..()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)


mob/Dog/MouseDrop(o_o,s_l,o_l) //make it so if an object has been dragged to someplace...
	..()
	if(src.Owner == usr.key)
		if(isturf(o_l)) //making sure it was dropped on the map, and not in a statpanel or off the map
			walk_towards(src,o_l)

mob/Dog
	icon='Dog.dmi'
	/*Bump(mob/M)
		..()
		if(istype(M,/mob/))
			if(Owner==M.key)
				return
			else
				var/damage = src.Taijutsu-M.Defence*rand(1.5,3)
				// M.Health -= damage
				src.attacking = 1
				sleep(5)
				src.attacking = 0*/

mob/var/Juujin=0
mob/Dog
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
			Choices.Add("Unsummon Dog")
			Choices.Add("Cancel")
			Choices.Add("Juujin Bunshin")
			switch(input("Choose Option","",text) in Choices)
				if("Unsummon Dog")
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
				if("Juujin Bunshin")
					if(src.Chakra<10)
						return
					if(!src.Juujin)
						src.overlays = null
						src.Chakra = usr.Chakra
						src.Taijutsu = usr.Taijutsu
						src.Ninjutsu = usr.Ninjutsu
						src.Genjutsu = src.Genjutsu
						src.Agility = usr.Agility
						src.Strength = usr.Strength
						src.Defence = usr.Defence
						src.Offence = usr.Offence
						src.overlays = usr.overlays
						src.name=usr.name
						src.Juujin=1
						src.Chakra-=10
						if(usr)
							src.icon = usr.icon
						flick('smoke.dmi',src)
					else
						flick('smoke.dmi',src)
						src.overlays = null
						src.name = src.Oname
						generate_hover_name()
						src.Juujin = 0
						src.icon = 'Dog.dmi'
						src.Chakra=usr.Chakra/4
						src.MaxChakra=usr.MaxChakra/4
						src.Strength=usr.Strength/4
						src.Agility=usr.Agility/3
						src.Defence=usr.Defence/4
						src.Offence=usr.Offence/4
						src.Control=usr.Control/3
						src.Resistance=usr.Resistance/3
						src.Ninjutsu=usr.Ninjutsu/2
						src.Genjutsu=usr.Genjutsu/3
						src.Taijutsu = usr.Taijutsu/4



mob/King_Enma/MouseDrag()
	..()
	if(src.displaykey==usr.key)
		mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)
mob/King_Enma/New()
	..()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)


mob/King_Enma/MouseDrop(o_o,s_l,o_l) //make it so if an object has been dragged to someplace...
	..()
	if(src.Owner == usr.key)
		if(isturf(o_l)) //making sure it was dropped on the map, and not in a statpanel or off the map
			walk_towards(src,o_l)

mob/King_Enma
	icon='King Enma.dmi'
	/*Bump(mob/M)
		..()
		if(istype(M,/mob/))
			if(Owner==M.key)
				return
			else
				var/damage = src.Taijutsu-M.Defence*rand(1.5,3)
				// M.Health -= damage
				src.attacking = 1
				sleep(5)
				src.attacking = 0*/
mob/King_Enma
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
			Choices.Add("Unsummon King Enma")
			Choices.Add("Henge: Kongounyoi")
			Choices.Add("Cancel")
			switch(input("Choose Option","",text) in Choices)
				if("Unsummon King Enma")
					flick('Smoke.dmi',src)
					del(src)
				if("Henge: Kongounyoi")
					if(src.Chakra<100)
						return
					usr.contents += new/obj/items/Weapon/Enma_Pole
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


mob/Wolf/MouseDrag()
	..()
	if(src.displaykey==usr.key)
		mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)
mob/Wolf/New()
	..()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)


mob/Wolf/MouseDrop(o_o,s_l,o_l) //make it so if an object has been dragged to someplace...
	..()
	if(src.Owner == usr.key)
		if(isturf(o_l)) //making sure it was dropped on the map, and not in a statpanel or off the map
			walk_towards(src,o_l)

mob/Wolf
	icon='Wolf.dmi'
	/*Bump(mob/M)
		..()
		if(istype(M,/mob/))
			if(Owner==M.key)
				return
			else
				var/damage = src.Taijutsu-M.Defence*rand(1.5,3)
				// M.Health -= damage
				src.attacking = 1
				sleep(5)
				src.attacking = 0*/
mob/Wolf
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
			Choices.Add("Unsummon Wolf")
			Choices.Add("Cancel")
			switch(input("Choose Option","",text) in Choices)
				if("Unsummon Wolf")
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

mob/Cat/MouseDrag()
	..()
	if(src.displaykey==usr.key)
		mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)
mob/Cat/New()
	..()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)


mob/Cat/MouseDrop(o_o,s_l,o_l) //make it so if an object has been dragged to someplace...

	..()
	if(src.Owner == usr.key)
		if(isturf(o_l)) //making sure it was dropped on the map, and not in a statpanel or off the map
			walk_towards(src,o_l)

mob/Cat
	icon='Cat.dmi'
	/*Bump(mob/M)
		..()
		if(istype(M,/mob/))
			if(Owner==M.key)
				return
			else
				var/damage = src.Taijutsu-M.Defence*rand(1.5,3)
				// M.Health -= damage
				src.attacking = 1
				sleep(5)
				src.attacking = 0*/
mob/Cat
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
			Choices.Add("Unsummon Cat")
			Choices.Add("Cancel")
			switch(input("Choose Option","",text) in Choices)
				if("Unsummon Cat")
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

mob/Toad/MouseDrag()
	if(src.displaykey==usr.key)
		mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)
mob/Toad/New()
	..()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)


mob/Toad/MouseDrop(o_o,s_l,o_l) //make it so if an object has been dragged to someplace...
	..()
	if(src.Owner == usr.key)
		if(isturf(o_l)) //making sure it was dropped on the map, and not in a statpanel or off the map
			walk_towards(src,o_l)

mob/Toad
	icon='Toad.dmi'
	/*Bump(mob/M)
		..()
		if(istype(M,/mob/))
			if(Owner==M.key)
				return
			else
				var/damage = src.Taijutsu-M.Defence*rand(1.5,3)
				// M.Health -= damage
				src.attacking = 1
				sleep(5)
				src.attacking = 0*/
mob/Toad
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
			Choices.Add("Unsummon Toad")
			Choices.Add("Cancel")
			switch(input("Choose Option","",text) in Choices)
				if("Unsummon Toad")
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

mob/Slug/MouseDrag()
	if(src.displaykey==usr.key)
		mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)
mob/Slug/New()
	..()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)


mob/Slug/MouseDrop(o_o,s_l,o_l) //make it so if an object has been dragged to someplace...
	..()
	if(src.Owner == usr.key)
		if(isturf(o_l)) //making sure it was dropped on the map, and not in a statpanel or off the map
			walk_towards(src,o_l)

mob/Slug
	icon='Slug.dmi'
	/*Bump(mob/M)
		..()
		if(istype(M,/mob/))
			if(Owner==M.key)
				return
			else
				var/damage = src.Taijutsu-M.Defence*rand(1.5,3)
				// M.Health -= damage
				src.attacking = 1
				sleep(5)
				src.attacking = 0*/
mob/Slug
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
			Choices.Add("Unsummon Slug")
			Choices.Add("Cancel")
			switch(input("Choose Option","",text) in Choices)
				if("Unsummon Slug")
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

mob/Snake/MouseDrag()
	if(src.displaykey==usr.key)
		mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)
mob/Snake/New()
	..()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)


mob/Snake/MouseDrop(o_o,s_l,o_l) //make it so if an object has been dragged to someplace...
	..()
	if(src.Owner == usr.key)
		if(isturf(o_l)) //making sure it was dropped on the map, and not in a statpanel or off the map
			walk_towards(src,o_l)

mob/Snake
	icon='Snake.dmi'
	/*Bump(mob/M)
		..()
		if(istype(M,/mob/))
			if(Owner==M.key)
				return
			else
				var/damage = src.Taijutsu-M.Defence*rand(1.5,3)
				// M.Health -= damage
				src.attacking = 1
				sleep(5)
				src.attacking = 0*/
mob/Snake
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

mob/Med_Snake/MouseDrag()
	if(src.displaykey==usr.key)
		mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)
mob/Med_Snake/New()
	..()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)


mob/Med_Snake/MouseDrop(o_o,s_l,o_l) //make it so if an object has been dragged to someplace...
	..()
	if(src.Owner == usr.key)
		if(isturf(o_l)) //making sure it was dropped on the map, and not in a statpanel or off the map
			walk_towards(src,o_l)

mob/Med_Snake
	icon='MedSnake.dmi'
	/*Bump(mob/M)
		..()
		if(istype(M,/mob/))
			if(Owner==M.key)
				return
			else
				var/damage = src.Taijutsu-M.Defence*rand(1.5,3)
				// M.Health -= damage
				src.attacking = 1
				sleep(5)
				src.attacking = 0*/
mob/Med_Snake
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


mob/Big_Snake/MouseDrag()
	if(Owner==usr.key)
		mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)
mob/Big_Snake/New()
	..()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)


mob/Big_Snake/MouseDrop(o_o,s_l,o_l) //make it so if an object has been dragged to someplace...
	..()
	if(isturf(o_l)) //making sure it was dropped on the map, and not in a statpanel or off the map
		walk_towards(src,o_l)

obj/Big_Snake
	Part1
		icon='Big_Snake.dmi'
		icon_state="1"
		layer=MOB_LAYER+1
		pixel_x = -32
		pixel_y = 32
	Part2
		icon='Big_Snake.dmi'
		icon_state="2"
		layer=MOB_LAYER+1
		pixel_y = 32
	Part3
		icon='Big_Snake.dmi'
		icon_state="3"
		layer=MOB_LAYER+1
		pixel_x = 32
		pixel_y = 32
	Part4
		icon='Big_Snake.dmi'
		icon_state="4"
		layer=MOB_LAYER+1
		pixel_x = -32
	Part5
		icon='Big_Snake.dmi'
		icon_state="6"
		layer=MOB_LAYER+1
		pixel_x = 32
	Part6
		icon='Big_Snake.dmi'
		icon_state="7"
		layer=MOB_LAYER+1
		pixel_x = -32
		pixel_y = -32
	Part7
		icon='Big_Snake.dmi'
		icon_state="8"
		layer=MOB_LAYER+1
		pixel_y = -32
	Part8
		icon='Big_Snake.dmi'
		icon_state="9"
		layer=MOB_LAYER+1
		pixel_x = 32
		pixel_y = -32
mob/Big_Snake
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
			Choices.Add("Unsummon Giant Snake")
			Choices.Add("Cancel")
			switch(input("Choose Option","",text) in Choices)
				if("Unsummon Giant Snake")
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
	Big_Snake
		icon='Big_Snake.dmi'
		icon_state="5"
		New()
			src.overlays += /obj/Big_Frog/Part1
			src.overlays += /obj/Big_Frog/Part2
			src.overlays += /obj/Big_Frog/Part3
			src.overlays += /obj/Big_Frog/Part4
			src.overlays += /obj/Big_Frog/Part5
			src.overlays += /obj/Big_Frog/Part6
			src.overlays += /obj/Big_Frog/Part7
			src.overlays += /obj/Big_Frog/Part8




mob/Med_Toad/MouseDrag()
	if(src.displaykey==usr.key)
		mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)
mob/Med_Toad/New()
	..()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)


mob/Med_Toad/MouseDrop(o_o,s_l,o_l) //make it so if an object has been dragged to someplace...
	..()
	if(src.Owner == usr.key)
		if(isturf(o_l)) //making sure it was dropped on the map, and not in a statpanel or off the map
			walk_towards(src,o_l)

mob/Med_Toad
	icon='MedToad.dmi'
	/*Bump(mob/M)
		..()
		if(istype(M,/mob/))
			if(Owner==M.key)
				return
			else
				var/damage = src.Taijutsu-M.Defence*rand(1.5,3)
				// M.Health -= damage
				src.attacking = 1
				sleep(5)
				src.attacking = 0*/
mob/Med_Toad
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
			Choices.Add("Unsummon Toad")
			Choices.Add("Cancel")
			switch(input("Choose Option","",text) in Choices)
				if("Unsummon Toad")
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



mob/Med_Slug/MouseDrag()
	if(src.displaykey==usr.key)
		mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)
mob/Med_Slug/New()
	..()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)


mob/Med_Slug/MouseDrop(o_o,s_l,o_l) //make it so if an object has been dragged to someplace...
	..()
	if(src.Owner == usr.key)
		if(isturf(o_l)) //making sure it was dropped on the map, and not in a statpanel or off the map
			walk_towards(src,o_l)

mob/Med_Slug
	icon='MedSlug.dmi'
	/*Bump(mob/M)
		..()
		if(istype(M,/mob/))
			if(Owner==M.key)
				return
			else
				var/damage = src.Taijutsu-M.Defence*rand(1.5,3)
				// M.Health -= damage
				src.attacking = 1
				sleep(5)
				src.attacking = 0*/
mob/Med_Slug
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
			Choices.Add("Unsummon Slug")
			Choices.Add("Cancel")
			switch(input("Choose Option","",text) in Choices)
				if("Unsummon Slug")
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










obj/Ninjutsu/Call_Dog
	icon='Skillcard.dmi'
	icon_state="Tame1"
	Click()
		if(src in usr.contents)
			if(usr.Chakra<50)
				return
			for(var/mob/Dog/D in world)
				if(D.Owner==usr.key)
					usr<<output("<font size = -3>You may only summon one Dog at a time.","outputic.output")
					usr<<output("<font size = -3>You may only summon one Dog at a time.","outputall.output")
					return
			usr.Chakra-=50
			Active=1
			spawn(50) Active=0
			var/mob/Dog/D = new()
			D.Owner = usr.key
			D.loc = usr.loc
			D.Chakra=usr.Chakra/4
			D.MaxChakra=usr.MaxChakra/4
			D.Strength=usr.Strength/4
			D.Agility=usr.Agility/3
			D.Defence=usr.Defence/4
			D.Control=usr.Control/3
			D.Resistance=usr.Resistance/3
			D.Ninjutsu=usr.Ninjutsu/2
			D.Genjutsu=usr.Genjutsu/3
			D.Taijutsu = usr.Taijutsu/4
			D.attackable=1
			D.Health=100
			D.MaxHealth=100


obj/Ninjutsu/King_Enma_Summoning
	icon='King Enma.dmi'
	icon_state="Focus"
	Click()
		if(src in usr.contents)
			if(usr.Chakra<150)
				return
			if(locate(/obj/items/Weapon/Enma_Pole,usr.contents))
				usr<<output("<font size = -3>You have already summoned King Enma.","outputic.output")
				usr<<output("<font size = -3>You have already summoned King Enma.","outputall.output")
				return
			for(var/mob/King_Enma/D in world)
				if(D.Owner==usr.key)
					usr<<output("<font size = -3>You have already summoned King Enma.","outputic.output")
					usr<<output("<font size = -3>You have already summoned King Enma.","outputall.output")
					return
			usr.Chakra-=150
			Active=1
			spawn(50) Active=0
			var/mob/King_Enma/D = new()
			D.Owner = usr.key
			D.loc = usr.loc
			D.Chakra=usr.Chakra/2
			D.MaxChakra=usr.MaxChakra/2
			D.Strength=usr.Strength/2
			D.Agility=usr.Agility/3
			D.Defence=usr.Defence/2
			D.Control=usr.Control/3
			D.Resistance=usr.Resistance/3
			D.Ninjutsu=usr.Ninjutsu/2
			D.Genjutsu=usr.Genjutsu/3
			D.Taijutsu = usr.Taijutsu/2
			D.attackable=1
			D.Health=100
			D.MaxHealth=100

obj/Ninjutsu/Slug_Summoning
	icon='Skillcard.dmi'
	icon_state="Slug"
	Click()
		if(src in usr.contents)
			if(usr.Chakra<50)
				return
			for(var/mob/Slug/D in world)
				if(D.Owner==usr.key)
					usr<<output("<font size = -3>You may only summon one Slug at a time.","outputic.output")
					usr<<output("<font size = -3>You may only summon one Slug at a time.","outputall.output")
					return
			usr.Chakra-=50
			Active=1
			spawn(50) Active=0
			var/mob/Slug/D = new()
			D.Owner = usr.key
			D.loc = usr.loc
			D.Chakra=usr.Chakra/4
			D.MaxChakra=usr.MaxChakra/4
			D.Strength=usr.Strength/4
			D.Agility=usr.Agility/3
			D.Defence=usr.Defence/4
			D.Control=usr.Control/3
			D.Resistance=usr.Resistance/3
			D.Ninjutsu=usr.Ninjutsu/2
			D.Genjutsu=usr.Genjutsu/3
			D.Taijutsu = usr.Taijutsu/4
			D.attackable=1
			D.Health=100
			D.MaxHealth=100

obj/Ninjutsu/Toad_Summoning
	icon='Skillcard.dmi'
	icon_state="Toad"
	Click()
		if(src in usr.contents)
			if(usr.Chakra<50)
				return
			for(var/mob/Toad/D in world)
				if(D.Owner==usr.key)
					usr<<output("<font size = -3>You may only summon one Toad at a time.","outputic.output")
					usr<<output("<font size = -3>You may only summon one Toad at a time.","outputall.output")
					return
			usr.Chakra-=50
			Active=1
			spawn(50) Active=0
			var/mob/Toad/D = new()
			D.Owner = usr.key
			D.loc = usr.loc
			D.Chakra=usr.Chakra/5
			D.MaxChakra=usr.MaxChakra/5
			D.Strength=usr.Strength/5
			D.Agility=usr.Agility/5
			D.Defence=usr.Defence/5
			D.Control=usr.Control/5
			D.Resistance=usr.Resistance/5
			D.Ninjutsu=usr.Ninjutsu/5
			D.Genjutsu=usr.Genjutsu/3
			D.Taijutsu = usr.Taijutsu/5
			D.attackable=1
			D.Health=100
			D.MaxHealth=100

obj/Ninjutsu/Gamatumichi_Summoning
	var/Kuchiyoseskill=1
	icon='Skillcard.dmi'
	icon_state="Gamatumichi"
	Click()
		if(src in usr.contents)
			for(var/mob/Summoning/Big_Frog/E in world)
				if(E.Owner==usr.key)
					usr<<output("<font size = -3>You may only summon one Toad at a time.","outputic.output")
					usr<<output("<font size = -3>You may only summon one Toad at a time.","outputall.output")
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
			var/mob/Summoning/Big_Frog/E = new()
			E.Owner = usr.key
			E.loc = usr.loc
			E.Health=100
			E.MaxHealth=100
			E.Chakra=usr.Chakra/1.5*rand(1.5,3)
			E.MaxChakra=usr.MaxChakra/1.5*rand(1.5,3)
			E.Strength=usr.Strength/1.5*rand(1.5,3)
			E.Agility=usr.Agility/2.5*rand(1.5,3)
			E.Defence=usr.Defence/2*rand(1.5,3)
			E.Control=usr.Control/1*rand(1.5,3)
			E.Resistance=usr.Resistance/1.5*rand(1.5,3)
			E.Taijutsu=usr.Taijutsu/1.5*rand(1.5,3)
			E.Ninjutsu=usr.Ninjutsu/2*rand(1.5,3)
			E.Genjutsu=usr.Genjutsu/1*rand(1.5,3)

obj/Ninjutsu/Nitsuki_Summoning
	var/Kuchiyoseskill=1
	icon='Skillcard.dmi'
	icon_state="Nitsuki"
	Click()
		if(src in usr.contents)
			for(var/mob/Big_Snake/Big_Snake/E in world)
				if(E.Owner==usr.key)
					usr<<output("<font size = -3>You may only summon one Snake at a time.","outputic.output")
					usr<<output("<font size = -3>You may only summon one Snake at a time.","outputall.output")
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
			var/mob/Big_Snake/Big_Snake/E = new()
			E.Owner = usr.key
			E.loc = usr.loc
			E.Health=100
			E.MaxHealth=100
			E.Chakra=usr.Chakra/1.5*rand(1.5,3)
			E.MaxChakra=usr.MaxChakra/1.5*rand(1.5,3)
			E.Strength=usr.Strength/1.5*rand(1.5,3)
			E.Agility=usr.Agility/2.5*rand(1.5,3)
			E.Defence=usr.Defence/2*rand(1.5,3)
			E.Control=usr.Control/1*rand(1.5,3)
			E.Resistance=usr.Resistance/1.5*rand(1.5,3)
			E.Taijutsu=usr.Taijutsu/1.5*rand(1.5,3)
			E.Ninjutsu=usr.Ninjutsu/2*rand(1.5,3)
			E.Genjutsu=usr.Genjutsu/1*rand(1.5,3)

obj/Ninjutsu/Wolf_Summoning
	icon='Skillcard.dmi'
	icon_state="Tame2"
	Click()
		if(src in usr.contents)
			if(usr.Chakra<70)
				return
			for(var/mob/Wolf/W in world)
				if(W.Owner==usr.key)
					usr<<output("<font size = -3>You may only summon one Wolf at a time.","outputic.output")
					usr<<output("<font size = -3>You may only summon one Wolf at a time.","outputall.output")
					return
			usr.Chakra-=70
			Active=1
			spawn(50) Active=0
			var/mob/Wolf/W = new()
			W.Owner = usr.key
			W.loc = usr.loc
			W.Chakra=usr.Chakra/2
			W.MaxChakra=usr.MaxChakra/2
			W.Strength=usr.Strength/2
			W.Agility=usr.Agility/3
			W.Defence=usr.Defence/4
			W.Control=usr.Control/3
			W.Resistance=usr.Resistance/3
			W.Ninjutsu=usr.Ninjutsu/2
			W.Genjutsu=usr.Genjutsu/3
			W.Taijutsu = usr.Taijutsu/2
			W.attackable=1
			W.Health=100
			W.MaxHealth=100


obj/Ninjutsu/Snake_Summoning
	icon='Skillcard.dmi'
	icon_state="Snake"
	Click()
		if(src in usr.contents)
			if(usr.Chakra<50)
				return
			for(var/mob/Snake/S in world)
				if(S.Owner==usr.key)
					usr<<output("<font size = -3>You may only summon one Snake at a time.","outputic.output")
					usr<<output("<font size = -3>You may only summon one Snake at a time.","outputall.output")
					return
			usr.Chakra-=50
			Active=1
			spawn(50) Active=0
			var/mob/Snake/S = new()
			S.Owner = usr.key
			S.loc = usr.loc
			S.Chakra=usr.Chakra/5
			S.MaxChakra=usr.MaxChakra/5
			S.Strength=usr.Strength/5
			S.Agility=usr.Agility/5
			S.Defence=usr.Defence/6
			S.Control=usr.Control/3
			S.Resistance=usr.Resistance/5
			S.Ninjutsu=usr.Ninjutsu/2
			S.Genjutsu=usr.Genjutsu/3
			S.Taijutsu = usr.Taijutsu/5
			S.attackable=1
			S.Health=100
			S.MaxHealth=100

obj/Ninjutsu/Medium_Snake_Summoning
	icon='Skillcard.dmi'
	icon_state="MedSnake"
	Click()
		if(src in usr.contents)
			if(usr.Chakra<170)
				return
			for(var/mob/Med_Snake/S in world)
				if(S.Owner==usr.key)
					usr<<output("<font size = -3>You may only summon one Snake at a time.","outputic.output")
					usr<<output("<font size = -3>You may only summon one Snake at a time.","outputall.output")
					return
			usr.Chakra-=170
			Active=1
			spawn(50) Active=0
			var/mob/Med_Snake/S = new()
			S.Owner = usr.key
			S.loc = usr.loc
			S.Chakra=usr.Chakra/2
			S.MaxChakra=usr.MaxChakra/2
			S.Strength=usr.Strength/2
			S.Agility=usr.Agility/3
			S.Defence=usr.Defence/4
			S.Control=usr.Control/3
			S.Resistance=usr.Resistance/3
			S.Ninjutsu=usr.Ninjutsu/2
			S.Genjutsu=usr.Genjutsu/3
			S.Taijutsu = usr.Taijutsu/2
			S.attackable=1
			S.Health=100
			S.MaxHealth=100

obj/Ninjutsu/Medium_Slug_Summoning
	icon='Skillcard.dmi'
	icon_state="MedSlug"
	Click()
		if(src in usr.contents)
			if(usr.Chakra<150)
				return
			for(var/mob/Med_Slug/S in world)
				if(S.Owner==usr.key)
					usr<<output("<font size = -3>You may only summon one Slug at a time.","outputic.output")
					usr<<output("<font size = -3>You may only summon one Slug at a time.","outputall.output")
					return
			usr.Chakra-=150
			Active=1
			spawn(50) Active=0
			var/mob/Med_Slug/S = new()
			S.Owner = usr.key
			S.loc = usr.loc
			S.Chakra=usr.Chakra/2
			S.MaxChakra=usr.MaxChakra/2
			S.Strength=usr.Strength/2
			S.Agility=usr.Agility/3
			S.Defence=usr.Defence/4
			S.Control=usr.Control/3
			S.Resistance=usr.Resistance/3
			S.Ninjutsu=usr.Ninjutsu/2
			S.Genjutsu=usr.Genjutsu/3
			S.Taijutsu = usr.Taijutsu/2
			S.attackable=1
			S.Health=100
			S.MaxHealth=100

obj/Ninjutsu/Medium_Toad_Summoning
	icon='Skillcard.dmi'
	icon_state="MedToad"
	Click()
		if(src in usr.contents)
			if(usr.Chakra<150)
				return
			for(var/mob/Med_Toad/S in world)
				if(S.Owner==usr.key)
					usr<<output("<font size = -3>You may only summon one Toad at a time.","outputic.output")
					usr<<output("<font size = -3>You may only summon one Toad at a time.","outputall.output")
					return
			usr.Chakra-=150
			Active=1
			spawn(50) Active=0
			var/mob/Med_Toad/S = new()
			S.Owner = usr.key
			S.loc = usr.loc
			S.Chakra=usr.Chakra/2
			S.MaxChakra=usr.MaxChakra/2
			S.Strength=usr.Strength/2
			S.Agility=usr.Agility/3
			S.Defence=usr.Defence/4
			S.Control=usr.Control/3
			S.Resistance=usr.Resistance/3
			S.Ninjutsu=usr.Ninjutsu/2
			S.Genjutsu=usr.Genjutsu/3
			S.Taijutsu = usr.Taijutsu/2
			S.attackable=1
			S.Health=100
			S.MaxHealth=100


obj/Ninjutsu/Cat_Summoning
	icon='Skillcard.dmi'
	icon_state="Tame3"
	Click()
		if(src in usr.contents)
			if(usr.Chakra<50)
				return
			for(var/mob/Cat/C in world)
				if(C.Owner==usr.key)
					usr<<output("<font size = -3>You may only summon one Cat at a time.","outputic.output")
					usr<<output("<font size = -3>You may only summon one Cat at a time.","outputall.output")
					return
			usr.Chakra-=50
			Active=1
			spawn(50) Active=0
			var/mob/Cat/C = new()
			C.Owner = usr.key
			C.loc = usr.loc
			C.Chakra=usr.Chakra/5
			C.MaxChakra=usr.MaxChakra/5
			C.Strength=usr.Strength/6
			C.Agility=usr.Agility/5
			C.Defence=usr.Defence/4
			C.Control=usr.Control/5
			C.Resistance=usr.Resistance/5
			C.Ninjutsu=usr.Ninjutsu/2
			C.Genjutsu=usr.Genjutsu/3
			C.Taijutsu = usr.Taijutsu/5
			C.attackable=1
			C.Health=100
			C.MaxHealth=100




mob/Log
	Log
		icon='Log.dmi'
		icon_state="Train"




/*obj/Ninjutsu/Tame
	var/Owner = null
	icon='Skillcard.dmi'
	icon_state="Tame"
	Click()
		if(mob/Animals/Wolf in oview(1))
			Owner=usr.key*/

obj/Gatsuga
	icon='Gatsu.dmi'
	icon_state=""
	layer=MOB_LAYER+1
	var/damage
	New()
		spawn(100)
			del src
	Bump(mob/M)
		if(istype(M,/mob))
			if(M.attackable)
				// M.Health -= damage
				M.Ko()
				del(src)
		if(istype(M,/turf))
			if(M.density)
				del(src)
	/*Move()
		var/obj/GatsugaTrail/A = new
		A.loc = src.loc
		A.dir = src.dir
		..()*/

obj/GatsugaTrail
	icon='Gatsuga!.dmi'
	icon_state="Trail"
	layer=MOB_LAYER+5
	var/damage
	New()
		spawn(100)
			del src

mob/var/Gatsuga=0
obj/Ninjutsu/Gatsuga
	var/Gatsuga=0
	icon='Skillcard.dmi'
	icon_state="Gatsuga"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.Gatsuga)
					return
				if(usr.firing)
					return
				if(usr.Chakra<70)
					return
				if(prob(10/skill/skill/skill))
					skill+=1
					Update()
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=70
				usr.Strength *=2
				usr.Agility *=4
				usr.overlays+= new/obj/Gatsuga
				var/obj/A = new/obj/GatsugaTrail(usr.loc)
				var/obj/B = new/obj/GatsugaTrail(usr.loc)
				walk_to(A,usr,1,1)
				walk_to(B,A,1,1)
				usr.Gatsuga=1
				usr.Jutsu_Gain()
				sleep(110)
				usr.Strength=usr.MaxStrength
				usr.Agility=usr.MaxAgility
				usr.overlays-= new/obj/Gatsuga
				src.Active=0
				usr.Gatsuga=0
	/*Move()
		var/obj/GatsugaTrail/A = new
		A.loc = src.loc
		A.dir = src.dir
		..()*/



/*Gatsuga
	Part1
		icon='Gatsuga!.dmi'
		icon_state=""
		layer=MOB_LAYER+5
		pixel_x = -32
		pixel_y = -32
	Part2
		icon='Gatsuga!.dmi'
		icon_state="Trail"
		layer=MOB_LAYER+5
		pixel_x = 32
	Part3
		icon='Gatsuga!.dmi'
		icon_state="Trail"
		layer=MOB_LAYER+1
		pixel_x = -32
		pixel_y = -32
	Part4
		icon='Gatsuga!.dmi'
		icon_state="Trail"
		layer=MOB_LAYER+1
		pixel_y = 32
		pixel_x = -32
	Part5
		icon='Gatsuga!.dmi'
		icon_state="Trail"
		layer=MOB_LAYER+1
		pixel_y = -32
		pixel_x = -32
obj/Inuzuka
	Gatsuga
		icon='Gatsuga!.dmi'
		icon_state=""
		layer=MOB_LAYER+5
		New()
			src.overlays += /obj/Gatsuga/Part2*/
