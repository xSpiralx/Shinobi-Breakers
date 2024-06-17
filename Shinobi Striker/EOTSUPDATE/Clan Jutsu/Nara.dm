mob/var
	doing=0
	kagemane=0
	doingkagemane=0
	captured=0


obj/Kagemane
	icon='Kagemane.dmi'
	icon_state="Head"
	density=1
	Bump(mob/M)
		if(istype(M,/mob))
			if(M.attackable&&!M.captured)
				M.move=0
				M.captured=1
				sleep(rand(250,400))
				M.captured=0
				M.move=1
				del(src)

		if(istype(M,/turf))
			if(M.density)
				del(src)

	Move()
		var/obj/KagemaneTrail/A = new
		A.loc = src.loc
		A.dir = src.dir
		..()


obj/Kagemane/MouseDrag()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)
obj/Kagemane/New()
	..()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)


obj/Kagemane/MouseDrop(o_o,s_l,o_l) //make it so if an object has been dragged to someplace...

	..()
	if(isturf(o_l)) //making sure it was dropped on the map, and not in a statpanel or off the map
		walk_towards(src,o_l)


obj/Ninjutsu/Kagemane
	icon='Skillcard.dmi'
	icon_state="Possession"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<usr.MaxChakra*(0.30/skill))
					return
				if(!usr.Nara)
					return
				if(prob(10/skill/skill/skill))
					skill+=1
					Update()
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=usr.MaxChakra*(0.30/skill)
				usr.doing = 1
				usr.kagemane=1
				usr.move=0
				var/obj/Kagemane/H = new /obj/Kagemane
				H.loc = usr.loc
				H.dir = usr.dir
				H.density=1
				usr.client.perspective=EYE_PERSPECTIVE
				usr.client.eye=H
				usr.controlled=H
				for(H in view(25))
					usr.kagemane=1
					sleep(2.5*usr.Ninjutsu)
					del(H)
					usr.kagemane=0
					usr.move=1
					usr.doing=0
					usr.client.perspective=EYE_PERSPECTIVE
					usr.client.eye=usr
					usr.controlled=null
					usr.firing=0
					src.Active=0
			else
				usr.kagemane=0
				usr.move=1
				usr.doing=0
				usr.client.perspective=EYE_PERSPECTIVE
				usr.client.eye=usr
				usr.controlled=null
				usr.firing=0
				src.Active=0




obj
	KagemaneTrail
		icon='Kagemane.dmi'
		icon_state="Trail"
		density = 0
		New()
			spawn(200)
				del src






obj/Ninjutsu/Kage_Kubi_Shibari_no_Jutsu
	icon='Skillcard.dmi'
	icon_state="Neckbind"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.Chakra<usr.MaxChakra*0.30)
					return
				usr.Chakra-=(usr.MaxChakra*0.30)
				var/list/V = new/list
				for(var/mob/M in oview())
					V.Add(M)
				var/mob/A=input("Who would you like to use Kage Kubi Shibari no Jutsu on?") in V
				if(A==null)
					return
				if(A.move)
					return
				if(!A.captured)
					return
				if(usr.Ninjutsu >= A.Resistance*1.1)
					A.overlays += 'Neckbind.dmi'
					A.move=0
					A.Health -= (usr.Ninjutsu/3)+1
					A.icon_state="Focus"
					usr.MaxNinjutsu += (1 *0.01)
					sleep(15)
					A.overlays -= 'Neckbind.dmi'
					A.move=1
					A.icon_state=""
					A.Ko()
				else
					usr<<output("<font size = -3>[A] resists your Kage Kubi Shibari no Jutsu!","outputic.output")
					usr<<output("<font size = -3>[A] resists your Kage Kubi Shibari no Jutsu!","outputall.output")