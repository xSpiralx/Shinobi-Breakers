//Dragonfire and Housenka
//Goryuka - Dragon
//Gokakyu  - Fire ball
//Hibashiri - Circle of Fire
mob/var/firing=0
mob/var
	infire=0
	fireproc=0

mob/proc/Fire()
	sleep(1)
	if(src.infire&&!src.KO&&!src.fireproc)
		src.fireproc=1
		src.Health -= rand(1,3)
		src.Ko()
		src.fireproc=0
		spawn(30)
			src.Fire()
	else
		src.infire=0


obj/Endan
	icon = 'Katon.dmi'
	icon_state="Endan"
	density = 1
	layer = MOB_LAYER+1
	New()
		spawn(70)
			del src
obj/HibashiriAbil
	Wall
		icon = 'Katon.dmi'
		icon_state="flame2"
		density = 1
		New()
			spawn(1500)
				del src

	Start
		icon = 'Katon.dmi'
		icon_state="flame1"
		density = 1
		New()
			spawn(1500)
				del src
	End
		icon = 'Katon.dmi'
		icon_state="flame3"
		density = 1
		New()
			spawn(1500)
				del src


obj/Icons/Goukakyuu
	TopCenter
		icon = 'Icons/Goukakyuu.dmi'
		icon_state="2"
		layer = MOB_LAYER+1
		Entered(mob/M)
			if(ismob(M))
				M.infire=1
				M.Fire()
		Exited(mob/M)
			if(ismob(M))
				M.infire=0
		New()
			spawn(100)
				del src
	MidCenter
		icon = 'Icons/Goukakyuu.dmi'
		icon_state="5"
		layer = MOB_LAYER+1
		Entered(mob/M)
			if(ismob(M))
				M.infire=1
				M.Fire()
		Exited(mob/M)
			if(ismob(M))
				M.infire=0
		New()
			spawn(100)
				del src
	MidLeft
		icon = 'Icons/Goukakyuu.dmi'
		icon_state="4"
		layer = MOB_LAYER+1
		Entered(mob/M)
			if(ismob(M))
				M.infire=1
				M.Fire()
		Exited(mob/M)
			if(ismob(M))
				M.infire=0
		New()
			spawn(100)
				del src

	Left
		icon = 'Icons/Goukakyuu.dmi'
		icon_state="1"
		layer = MOB_LAYER+1
		Entered(mob/M)
			if(ismob(M))
				M.infire=1
				M.Fire()
		Exited(mob/M)
			if(ismob(M))
				M.infire=0
		New()
			spawn(100)
				del src
	Right
		icon = 'Icons/Goukakyuu.dmi'
		icon_state="3"
		layer = MOB_LAYER+1
		Entered(mob/M)
			if(ismob(M))
				M.infire=1
				M.Fire()
		Exited(mob/M)
			if(ismob(M))
				M.infire=0
		New()
			spawn(100)
				del src
	MidRight
		icon = 'Icons/Goukakyuu.dmi'
		icon_state="6"
		layer = MOB_LAYER+1
		Entered(mob/M)
			if(ismob(M))
				M.infire=1
				M.Fire()
		Exited(mob/M)
			if(ismob(M))
				M.infire=0
		New()
			spawn(100)
				del src

	BottomLeft
		icon = 'Icons/Goukakyuu.dmi'
		icon_state="7"
		layer = MOB_LAYER+1
		Entered(mob/M)
			if(ismob(M))
				M.infire=1
				M.Fire()
		Exited(mob/M)
			if(ismob(M))
				M.infire=0
		New()
			spawn(100)
				del src
	BottomRight
		icon = 'Icons/Goukakyuu.dmi'
		icon_state="9"
		layer = MOB_LAYER+1
		Entered(mob/M)
			if(ismob(M))
				M.infire=1
				M.Fire()
		Exited(mob/M)
			if(ismob(M))
				M.infire=0
		New()
			spawn(100)
				del src
	BottomCenter
		icon = 'Icons/Goukakyuu.dmi'
		icon_state="8"
		layer = MOB_LAYER+1
		Entered(mob/M)
			if(ismob(M))
				M.infire=1
				M.Fire()
		Exited(mob/M)
			if(ismob(M))
				M.infire=0
		New()
			spawn(100)
				del src
	/*Trail
		icon = 'Icons/Goukakyuu2.dmi'
		icon_state="trail"
		layer = MOB_LAYER+1
		Entered(mob/M)
			if(ismob(M))
				M.infire=1
				M.Fire()
		Exited(mob/M)
			if(ismob(M))
				M.infire=0
		New()
			spawn(100)
			del src*/



obj/Ninjutsu/Hibashiri
	icon='Skillcard.dmi'
	icon_state="Hibashiri"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<40)
					return
				if(prob(10/skill/skill/skill))
					usr<<output("<font size = -3>Your understanding of the Hibashiri no Jutsu has increased.","outputic.output")
					skill+=1
					Update()
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=40
				var/obj/HibashiriAbil/Wall/A = new
				A.dir=usr.dir
				usr.Jutsu_Gain()
				if(usr.dir==NORTH)
					A.loc = locate(usr.x,usr.y+1,usr.z)
				if(usr.dir==EAST)
					A.loc = locate(usr.x+1,usr.y,usr.z)
				if(usr.dir==SOUTH)
					A.loc = locate(usr.x,usr.y-1,usr.z)
				if(usr.dir==WEST)
					A.loc = locate(usr.x-1,usr.y,usr.z)
				spawn(45)
					usr.firing=0
					src.Active=0

				if(skill>=5)
					if(prob(10/skill/skill/skill))
						usr<<output("<font size = -3>Your understanding of the Hibashiri no Jutsu has increased.","outputic.output")
						skill+=1
						Update()
					usr.firing=1
					src.Active=1
					usr.MaxNinjutsu += (1 *0.001)
					usr.Chakra-=usr.MaxChakra*(0.10/skill)
					var/obj/HibashiriAbil/Start/B = new
					var/obj/HibashiriAbil/End/C = new
					B.dir=usr.dir
					C.dir=usr.dir
					usr.Jutsu_Gain()
					if(usr.dir==NORTH)
						B.loc = locate(usr.x-1,usr.y+1,usr.z)
						C.loc = locate(usr.x+1,usr.y+1,usr.z)
					if(usr.dir==EAST)
						B.loc = locate(usr.x+1,usr.y+1,usr.z)
						C.loc = locate(usr.x+1,usr.y-1,usr.z)
					if(usr.dir==SOUTH)
						B.loc = locate(usr.x-1,usr.y-1,usr.z)
						C.loc = locate(usr.x+1,usr.y-1,usr.z)
					if(usr.dir==WEST)
						B.loc = locate(usr.x-1,usr.y+1,usr.z)
						C.loc = locate(usr.x-1,usr.y-1,usr.z)
					spawn(45)
						usr.firing=0
						src.Active=0




obj/Ninjutsu/Goukakyuu
	icon='Skillcard.dmi'
	icon_state="Goukakyuu"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<10)
					return
				if(prob(10/skill/skill/skill))
					usr<<output("<font size = -3>Your understanding of the Icons/Goukakyuu no Jutsu has increased.","outputic.output")
					skill+=1
					Update()
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=10


				spawn(100)
					usr.firing=0
					src.Active=0
				sleep(90)
				usr.move=1

obj/Ninjutsu/Housenka
	icon='Skillcard.dmi'
	icon_state="Housenka"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<50)
					return
				if(prob(10/skill/skill/skill))
					usr<<output("<font size = -3>Your understanding of the Katon: Housenka no Jutsu has increased.","outputic.output")
					skill+=1
					Update()
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=50
				var/obj/HousenkaAbil/A = new
				var/obj/HousenkaAbil/B = new
				var/obj/HousenkaAbil/C = new



				if(usr.dir==NORTH)
					A.loc=usr.loc
					B.loc=locate(usr.x-1,usr.y,usr.z)
					C.loc=locate(usr.x+1,usr.y,usr.z)
				if(usr.dir==SOUTH)
					A.loc=usr.loc
					B.loc=locate(usr.x-1,usr.y,usr.z)
					C.loc=locate(usr.x+1,usr.y,usr.z)
				if(usr.dir==EAST)
					A.loc=locate(usr.x,usr.y+1,usr.z)
					B.loc=usr.loc
					C.loc=locate(usr.x,usr.y-1,usr.z)
				if(usr.dir==WEST)
					A.loc=locate(usr.x,usr.y+1,usr.z)
					B.loc=usr.loc
					C.loc=locate(usr.x,usr.y-1,usr.z)

				A.dir = usr.dir
				B.dir = usr.dir
				C.dir = usr.dir
				walk(A,usr.dir)
				walk(B,usr.dir)
				walk(C,usr.dir)
				spawn(45)
					usr.firing=0
					src.Active=0

obj/Medium_Endan
	/*Part1
		icon_state="1"
		layer=MOB_LAYER+1
		pixel_x = -32*/
	Part2
		icon_state="2"
		layer=MOB_LAYER+1
		pixel_x = 32
	Part3
		icon_state="3"
		pixel_y = 32
	Part4
		icon_state="4"
		layer=MOB_LAYER+1
		pixel_x = 32
		pixel_y = 32

obj/Medium_Endan
	icon='Katon.dmi'
	icon_state="1"
	layer=MOB_LAYER+1
	New()
		/*src.overlays += /obj/Medium_Endan/Part1*/
		src.overlays += /obj/Medium_Endan/Part2
		src.overlays += /obj/Medium_Endan/Part3
		src.overlays += /obj/Medium_Endan/Part4

obj/Ninjutsu/Dai_Endan
	icon='Skillcard.dmi'
	icon_state="Endan"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<60)
					return
				if(prob(10/skill/skill/skill))
					usr<<output("<font size = -3>Your understanding of the Katon:Dai Endan no Jutsu has increased.","outputic.output")
					skill+=1
					Update()
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=60
				var/obj/Medium_Endan/A = new
				usr.Jutsu_Gain()
				if(usr.dir==NORTH)
					A.loc = locate(usr.x,usr.y+1,usr.z)
					A.dir = usr.dir
					sleep(10)
					A.loc = locate(usr.x-1,usr.y+1,usr.z)
					A.dir = usr.dir
				if(usr.dir==SOUTH)
					A.loc = locate(usr.x,usr.y-2,usr.z)
					A.dir = usr.dir
					sleep(10)
					A.loc = locate(usr.x-1,usr.y-2,usr.z)
					A.dir = usr.dir
				if(usr.dir==EAST)
					A.loc = locate(usr.x+2,usr.y,usr.z)
					A.dir = usr.dir
				if(usr.dir==WEST)
					A.loc = locate(usr.x-2,usr.y,usr.z)
					A.dir = usr.dir



obj/Ninjutsu/Kage_Shuriken
	icon='Skillcard.dmi'
	icon_state="Kage Shuriken"
	Click()
		if(src in usr.contents)
			if(locate(/obj/items/Weapon/Shuriken,usr.contents))
				if(!usr.move)
					return
				if(usr.firing)
					return
				if(usr.Chakra<15)
					return
				if(prob(10/skill/skill/skill))
					usr<<output("<font size = -3>Your understanding of the Kage Shuriken no Jutsu has increased.","outputic.output")
					skill+=1
					Update()
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=15
				var/obj/Shuriken/A = new
				var/obj/Shuriken/B = new
				var/obj/Shuriken/C = new


				if(usr.dir==NORTH)
					A.loc=usr.loc
					B.loc=locate(usr.x-1,usr.y,usr.z)
					C.loc=locate(usr.x+1,usr.y,usr.z)
				if(usr.dir==SOUTH)
					A.loc=usr.loc
					B.loc=locate(usr.x-1,usr.y,usr.z)
					C.loc=locate(usr.x+1,usr.y,usr.z)
				if(usr.dir==EAST)
					A.loc=locate(usr.x,usr.y+1,usr.z)
					B.loc=usr.loc
					C.loc=locate(usr.x,usr.y-1,usr.z)
				if(usr.dir==WEST)
					A.loc=locate(usr.x,usr.y+1,usr.z)
					B.loc=usr.loc
					C.loc=locate(usr.x,usr.y-1,usr.z)


				A.dir = usr.dir
				B.dir = usr.dir
				C.dir = usr.dir
				walk(A,usr.dir)
				walk(B,usr.dir)
				walk(C,usr.dir)
				spawn(45)
					usr.firing=0
					src.Active=0

				if(skill>=10)
					if(prob(10/skill/skill/skill))
						usr<<output("<font size = -3>Your understanding of the Kage Shuriken no Jutsu has increased.","outputic.output")
						skill+=1
						Update()
					usr.firing=1
					src.Active=1
					usr.MaxNinjutsu += (1 *0.001)
					usr.Chakra-=usr.MaxChakra*(0.10/skill)
					var/obj/Shuriken/D = new
					var/obj/Shuriken/E = new
					var/obj/Shuriken/F = new
					D.damage = rand(25,50)/5+skill
					E.damage = rand(25,50)/5+skill
					F.damage = rand(25,50)/5+skill
					usr.Jutsu_Gain()


					if(usr.dir==NORTH)
						D.loc=usr.loc
						E.loc=locate(usr.x-1,usr.y,usr.z)
						F.loc=locate(usr.x+1,usr.y,usr.z)
					if(usr.dir==SOUTH)
						D.loc=usr.loc
						E.loc=locate(usr.x-1,usr.y,usr.z)
						F.loc=locate(usr.x+1,usr.y,usr.z)
					if(usr.dir==EAST)
						D.loc=locate(usr.x,usr.y+1,usr.z)
						E.loc=usr.loc
						F.loc=locate(usr.x,usr.y-1,usr.z)
					if(usr.dir==WEST)
						D.loc=locate(usr.x,usr.y+1,usr.z)
						E.loc=usr.loc
						F.loc=locate(usr.x,usr.y-1,usr.z)

					sleep(8)
					D.dir = usr.dir
					E.dir = usr.dir
					F.dir = usr.dir
					walk(D,usr.dir)
					walk(E,usr.dir)
					walk(F,usr.dir)
					spawn(45)
						usr.firing=0
						src.Active=0



obj/Ninjutsu/Kage_Kunai
	icon='Skillcard.dmi'
	icon_state="Kage Kunai"
	Click()
		if(src in usr.contents)
			if(locate(/obj/items/Weapon/Kunai,usr.contents))
				if(!usr.move)
					return
				if(usr.firing)
					return
				if(usr.Chakra<15)
					return
				if(prob(10/skill/skill/skill))
					usr<<output("<font size = -3>Your understanding of the Kage Kunai no Jutsu has increased.","outputic.output")
					skill+=1
					Update()
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=15
				var/obj/Kunai/A = new
				var/obj/Kunai/B = new
				var/obj/Kunai/C = new
				A.damage = rand(25,50)/5+skill
				B.damage = rand(25,50)/5+skill
				C.damage = rand(25,50)/5+skill
				usr.Jutsu_Gain()


				if(usr.dir==NORTH)
					A.loc=usr.loc
					B.loc=locate(usr.x-1,usr.y,usr.z)
					C.loc=locate(usr.x+1,usr.y,usr.z)
				if(usr.dir==SOUTH)
					A.loc=usr.loc
					B.loc=locate(usr.x-1,usr.y,usr.z)
					C.loc=locate(usr.x+1,usr.y,usr.z)
				if(usr.dir==EAST)
					A.loc=locate(usr.x,usr.y+1,usr.z)
					B.loc=usr.loc
					C.loc=locate(usr.x,usr.y-1,usr.z)
				if(usr.dir==WEST)
					A.loc=locate(usr.x,usr.y+1,usr.z)
					B.loc=usr.loc
					C.loc=locate(usr.x,usr.y-1,usr.z)


				A.dir = usr.dir
				B.dir = usr.dir
				C.dir = usr.dir
				walk(A,usr.dir)
				walk(B,usr.dir)
				walk(C,usr.dir)
				spawn(45)
					usr.firing=0
					src.Active=0

				if(skill>=10)
					if(prob(10/skill/skill/skill))
						usr<<output("<font size = -3>Your understanding of the Kage Kunai no Jutsu has increased.","outputic.output")
						skill+=1
						Update()
					usr.firing=1
					src.Active=1
					usr.MaxNinjutsu += (1 *0.001)
					usr.Chakra-=usr.MaxChakra*(0.10/skill)
					var/obj/Kunai/D = new
					var/obj/Kunai/E = new
					var/obj/Kunai/F = new
					D.damage = rand(25,50)/5+skill
					E.damage = rand(25,50)/5+skill
					F.damage = rand(25,50)/5+skill
					usr.Jutsu_Gain()


					if(usr.dir==NORTH)
						D.loc=usr.loc
						E.loc=locate(usr.x-1,usr.y,usr.z)
						F.loc=locate(usr.x+1,usr.y,usr.z)
					if(usr.dir==SOUTH)
						D.loc=usr.loc
						E.loc=locate(usr.x-1,usr.y,usr.z)
						F.loc=locate(usr.x+1,usr.y,usr.z)
					if(usr.dir==EAST)
						D.loc=locate(usr.x,usr.y+1,usr.z)
						E.loc=usr.loc
						F.loc=locate(usr.x,usr.y-1,usr.z)
					if(usr.dir==WEST)
						D.loc=locate(usr.x,usr.y+1,usr.z)
						E.loc=usr.loc
						F.loc=locate(usr.x,usr.y-1,usr.z)

					sleep(8)
					D.dir = usr.dir
					E.dir = usr.dir
					F.dir = usr.dir
					walk(D,usr.dir)
					walk(E,usr.dir)
					walk(F,usr.dir)
					spawn(45)
						usr.firing=0
						src.Active=0


obj/AmaterasuAbil
	icon='Katon.dmi'
	icon_state="Ama"
	density = 1
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

obj/HousenkaAbil
	icon='Katon.dmi'
	icon_state="housenka"
	density = 1
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
