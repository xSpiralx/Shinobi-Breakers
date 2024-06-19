obj/Sawarabi
	Wall
		icon = 'Kaguya1.dmi'
		icon_state="Sawarabi"
		density = 1
		var/damage
		New()
			flick("Rise",src)
			spawn(200)
				del src




obj/Taijutsu/Tessenka_no_Mai
	var/Tessenka=0
	icon='Skillcard.dmi'
	icon_state="Tessenka no Mai"
	Click()
		if(src in usr.contents)
			if(!Tessenka)
				if(usr.Chakra<90)
					return
				if(prob(10/skill/skill/skill))
					skill+=1
					Update()
				usr.MaxTaijutsu += (1 *0.001)
				usr.Chakra-=90
				usr.Taijutsu *= 5.5
				usr.overlays += 'Tessenka.dmi'
				src.Active=1
				Tessenka=1
			else
				usr.Taijutsu = usr.MaxTaijutsu
				usr.overlays -= 'Tessenka.dmi'
				Tessenka=0
				src.Active=0

obj/Taijutsu/Yanagi_no_Mai
	var/Yanagi=0
	icon='Skillcard.dmi'
	icon_state="Yanagi"
	Click()
		if(src in usr.contents)
			if(!Yanagi)
				if(usr.Chakra<60)
					return
				if(prob(10/skill/skill/skill))
					skill+=1
					Update()
				usr.MaxTaijutsu += (1 *0.001)
				usr.Chakra-=60
				usr.Taijutsu *= 2
				usr.overlays += 'Yanagi.dmi'
				src.Active=1
				Yanagi=1
			else
				usr.Taijutsu = usr.MaxTaijutsu
				usr.overlays -= 'Yanagi.dmi'
				Yanagi=0
				src.Active=0

obj/Taijutsu/Tsubaki_no_Mai
	var/Tsubaki=0
	icon='Skillcard.dmi'
	icon_state="Tsubaki"
	Click()
		if(src in usr.contents)
			if(!Tsubaki)
				if(usr.Chakra<30)
					return
				if(prob(10/skill/skill/skill))
					skill+=1
					Update()
				usr.MaxTaijutsu += (1 *0.001)
				usr.Chakra-=30
				usr.Taijutsu *= 1.5
				usr.overlays += 'Tsubaki.dmi'
				src.Active=1
				Tsubaki=1
			else
				usr.Taijutsu = usr.MaxTaijutsu
				usr.overlays -= 'Tsubaki.dmi'
				Tsubaki=0
				src.Active=0

obj/Taijutsu/Tessenka_no_Mai_Hana
	var/Hana=0
	icon='Skillcard.dmi'
	icon_state="Tessenka no Mai Hana"
	Click()
		if(src in usr.contents)
			if(!Hana)
				if(usr.Chakra<80)
					return
				if(prob(10/skill/skill/skill))
					skill+=1
					Update()
				usr.MaxTaijutsu += (1 *0.001)
				usr.Chakra-=80
				usr.Taijutsu *= 3.5
				usr.Agility *= 1.5
				usr.overlays += 'Hana.dmi'
				src.Active=1
				Hana=1
			else
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Agility = usr.MaxAgility
				usr.overlays -= 'Hana.dmi'
				Hana=0
				src.Active=0

obj/Taijutsu/Karamatsu_no_Mai
	var/Karamatsu=0
	icon='Skillcard.dmi'
	icon_state="Karamatsu no Mai"
	Click()
		if(src in usr.contents)
			if(!Karamatsu)
				if(usr.Chakra<4)
					return
				if(prob(10/skill/skill/skill))
					skill+=1
					Update()
				usr.MaxDefence += (1 *0.001)
				usr.Chakra-=80
				usr.Defence *= 5.5
				usr.Resistance *= 2.5
				usr.overlays += 'Karamatsu.dmi'
				src.Active=1
				Karamatsu=1
			else
				usr.Defence = usr.MaxDefence
				usr.Resistance = usr.MaxResistance
				usr.overlays -= 'Karamatsu.dmi'
				Karamatsu=0
				src.Active=0


obj/Taijutsu/Sawarabi_no_Mai
	icon='Skillcard.dmi'
	icon_state="Sawarabi"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<150)
					return
				if(prob(10/skill/skill/skill))
					skill+=0.5
					Update()
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=150
				for(var/mob/M in oview(5,usr))
					// M.Health -= damage
					M.Ko()
				var/obj/Sawarabi/Wall/A = new
				var/obj/Sawarabi/Wall/B = new
				var/obj/Sawarabi/Wall/C = new
				var/obj/Sawarabi/Wall/D = new
				var/obj/Sawarabi/Wall/E = new
				var/obj/Sawarabi/Wall/F = new
				var/obj/Sawarabi/Wall/G = new
				var/obj/Sawarabi/Wall/H = new
				var/obj/Sawarabi/Wall/I = new
				var/obj/Sawarabi/Wall/J = new
				var/obj/Sawarabi/Wall/K = new
				var/obj/Sawarabi/Wall/L = new
				var/obj/Sawarabi/Wall/M = new
				var/obj/Sawarabi/Wall/N = new
				var/obj/Sawarabi/Wall/O = new
				var/obj/Sawarabi/Wall/P = new
				var/obj/Sawarabi/Wall/Q = new
				usr.Jutsu_Gain()
				if(usr.dir==NORTH)
					A.loc = locate(usr.x,usr.y+1,usr.z)
					B.loc = locate(usr.x-1,usr.y+2,usr.z)
					C.loc = locate(usr.x-1,usr.y+1,usr.z)
					D.loc = locate(usr.x+2,usr.y-1,usr.z)
					E.loc = locate(usr.x+2,usr.y+1,usr.z)
					F.loc = locate(usr.x+3,usr.y+2,usr.z)
					G.loc = locate(usr.x-1,usr.y+3,usr.z)
					H.loc = locate(usr.x,usr.y+2,usr.z)
					I.loc = locate(usr.x+4,usr.y-1,usr.z)
					J.loc = locate(usr.x-3,usr.y-1,usr.z)
					K.loc = locate(usr.x-4,usr.y+4,usr.z)
					L.loc = locate(usr.x,usr.y-4,usr.z)
					M.loc = locate(usr.x-4,usr.y+1,usr.z)
					N.loc = locate(usr.x-2,usr.y+1,usr.z)
					O.loc = locate(usr.x-1,usr.y-1,usr.z)
					P.loc = locate(usr.x-2,usr.y-3,usr.z)
					Q.loc = locate(usr.x-2,usr.y-4,usr.z)
				if(usr.dir==EAST)
					A.loc = locate(usr.x,usr.y+1,usr.z)
					B.loc = locate(usr.x-1,usr.y+2,usr.z)
					C.loc = locate(usr.x-1,usr.y+1,usr.z)
					D.loc = locate(usr.x+2,usr.y-1,usr.z)
					E.loc = locate(usr.x+2,usr.y+1,usr.z)
					F.loc = locate(usr.x+3,usr.y+2,usr.z)
					G.loc = locate(usr.x-1,usr.y+3,usr.z)
					H.loc = locate(usr.x,usr.y+2,usr.z)
					I.loc = locate(usr.x+4,usr.y-1,usr.z)
					J.loc = locate(usr.x-3,usr.y-1,usr.z)
					K.loc = locate(usr.x-4,usr.y+4,usr.z)
					L.loc = locate(usr.x,usr.y-4,usr.z)
					M.loc = locate(usr.x-4,usr.y+1,usr.z)
					N.loc = locate(usr.x-2,usr.y+1,usr.z)
					O.loc = locate(usr.x-1,usr.y-1,usr.z)
					P.loc = locate(usr.x-2,usr.y-3,usr.z)
					Q.loc = locate(usr.x-2,usr.y-4,usr.z)
				if(usr.dir==SOUTH)
					A.loc = locate(usr.x,usr.y+1,usr.z)
					B.loc = locate(usr.x-1,usr.y+2,usr.z)
					C.loc = locate(usr.x-1,usr.y+1,usr.z)
					D.loc = locate(usr.x+2,usr.y-1,usr.z)
					E.loc = locate(usr.x+2,usr.y+1,usr.z)
					F.loc = locate(usr.x+3,usr.y+2,usr.z)
					G.loc = locate(usr.x-1,usr.y+3,usr.z)
					H.loc = locate(usr.x,usr.y+2,usr.z)
					I.loc = locate(usr.x+4,usr.y-1,usr.z)
					J.loc = locate(usr.x-3,usr.y-1,usr.z)
					K.loc = locate(usr.x-4,usr.y+4,usr.z)
					L.loc = locate(usr.x,usr.y-4,usr.z)
					M.loc = locate(usr.x-4,usr.y+1,usr.z)
					N.loc = locate(usr.x-2,usr.y+1,usr.z)
					O.loc = locate(usr.x-1,usr.y-1,usr.z)
					P.loc = locate(usr.x-2,usr.y-3,usr.z)
					Q.loc = locate(usr.x-2,usr.y-4,usr.z)
				if(usr.dir==WEST)
					A.loc = locate(usr.x,usr.y+1,usr.z)
					B.loc = locate(usr.x-1,usr.y+2,usr.z)
					C.loc = locate(usr.x-1,usr.y+1,usr.z)
					D.loc = locate(usr.x+2,usr.y-1,usr.z)
					E.loc = locate(usr.x+2,usr.y+1,usr.z)
					F.loc = locate(usr.x+3,usr.y+2,usr.z)
					G.loc = locate(usr.x-1,usr.y+3,usr.z)
					H.loc = locate(usr.x,usr.y+2,usr.z)
					I.loc = locate(usr.x+4,usr.y-1,usr.z)
					J.loc = locate(usr.x-3,usr.y-1,usr.z)
					K.loc = locate(usr.x-4,usr.y+4,usr.z)
					L.loc = locate(usr.x,usr.y-4,usr.z)
					M.loc = locate(usr.x-4,usr.y+1,usr.z)
					N.loc = locate(usr.x-2,usr.y+1,usr.z)
					O.loc = locate(usr.x-1,usr.y-1,usr.z)
					P.loc = locate(usr.x-2,usr.y-3,usr.z)
					Q.loc = locate(usr.x-2,usr.y-4,usr.z)
				spawn(45)
					usr.firing=0
					src.Active=0