mob/var/Hermit=0
obj/Senjutsu/Hermit_Mode
	icon='Skillcard.dmi'
	icon_state="Hermit"
	Click()
		if(src in usr.contents)
			if(!usr.Hermit)
				if(usr.Chakra<333)
					return
				if(prob(15/skill/skill/skill))
					skill+=0.5
				usr.Hermit=1
				usr.MaxChakra*=skill
				usr.Taijutsu *= 1.7
				usr.Control+=(usr.Control/1.5)
				viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s iris' turn yellow as a horizontal line replaces there pupil and the area around there eyes darken<font color = white>*)"
				usr.overlays += 'SageMode.dmi'
				usr.drain3=1
				usr.drain3()
			else
				usr.Hermit=0
				usr.Control=usr.MaxControl
				usr.MaxChakra/=1.5
				usr.Taijutsu = usr.MaxTaijutsu
				viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s eyes return to normal as the color around them fades<font color = white>*)"
				usr.overlays -= 'SageMode.dmi'
				usr.drain3=0

mob/var/drain3=0
mob/proc
	drain3()
		spawn() while(usr.drain3)
			sleep(10)
			usr.Chakra -= 40
			if(usr.Chakra<=0)
				usr.Hermit=0
				usr.Control=usr.MaxControl
				usr.MaxChakra/=1.5
				viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s eyes return to normal as the color around them fades<font color = white>*)"
				usr.overlays -= 'SageMode.dmi'
				usr.drain3=0

mob/Summoning/MouseDrag()
	..()
	if(Owner==usr.key)
		mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)
mob/Summoning/New()
	..()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)


mob/Summoning/MouseDrop(o_o,s_l,o_l) //make it so if an object has been dragged to someplace...
	..()
	if(isturf(o_l)) //making sure it was dropped on the map, and not in a statpanel or off the map
		walk_towards(src,o_l)

obj/Big_Frog
	Part1
		icon_state="1"
		layer=MOB_LAYER+1
		pixel_x = -32
		pixel_y = 32
	Part2
		icon_state="2"
		layer=MOB_LAYER+1
		pixel_y = 32
	Part3
		icon_state="3"
		layer=MOB_LAYER+1
		pixel_x = 32
		pixel_y = 32
	Part4
		icon_state="4"
		layer=MOB_LAYER+1
		pixel_x = -32
	Part5
		icon_state="6"
		layer=MOB_LAYER+1
		pixel_x = 32
	Part6
		icon_state="7"
		layer=MOB_LAYER+1
		pixel_x = -32
		pixel_y = -32
	Part7
		icon_state="8"
		layer=MOB_LAYER+1
		pixel_y = -32
	Part8
		icon_state="9"
		layer=MOB_LAYER+1
		pixel_x = 32
		pixel_y = -32


mob/Summoning
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
			Choices.Add("Unsummon Gamatumichi")
			Choices.Add("Cancel")
			switch(input("Choose Option","",text) in Choices)
				if("Unsummon Gamatumichi")
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
	Big_Frog
		icon='Big_Frog.dmi'
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








