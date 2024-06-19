mob/var
	Kyuubi=0
	HasKyuubi=0
	Kyuubi1=0
	HasKyuubi1=0
	Kyuubi2=0
	HasKyuubi2=0

obj/Kyuubi
	rank=1
	verb
		Unleash_Bijuu()
			set category="Bijuu"
			if(!usr.Kyuubi&&usr.HasKyuubi)
				usr.overlays += 'kyuubi.dmi'
				usr.Kyuubi=1
				sleep(150)
				usr.overlays -= 'kyuubi.dmi'
				usr.overlays += 'Sharingan.dmi'
				usr.Strength *= 1.6
				usr.Chakra *=3
				usr.Taijutsu *= 2
				usr.Agility *= 1.7
				return
			if(!usr.Kyuubi1&&usr.HasKyuubi1)
				usr.overlays += 'Kyuubi1.dmi'
				usr.overlays += 'Sharingan.dmi'
				usr.Kyuubi1=1
				usr.Strength *= 1.8
				usr.Chakra *=6
				usr.Taijutsu *= 2
				usr.Agility *= 2.2
				usr.contents += new/obj/Ninjutsu/Kyuubi_Chakra
				usr.contents += new/obj/Ninjutsu/Kyuubi_Roar
				return
			if(!usr.Kyuubi2&&usr.HasKyuubi2)
				usr.overlays -= 'Kyuubi1.dmi'
				usr.overlays += 'Kyuubi2.dmi'
				usr.overlays += 'Sharingan.dmi'
				usr.Kyuubi2=1
				usr.Strength *= 2.4
				usr.Chakra *=10
				usr.Taijutsu *= 4.2
				usr.Agility *= 3
				return
		Control_Bijuu()
			set category="Bijuu"
			if(usr.Kyuubi2)
				usr.Kyuubi2_Revert()
				usr.overlays += 'Kyuubi1.dmi'
				usr.Chakra = usr.MaxChakra
				usr.Strength = usr.MaxStrength
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Agility = usr.MaxAgility
				for(var/obj/Ninjutsu/Kyuubi_Chakra/A in usr.contents)
					del(A)
				for(var/obj/Ninjutsu/Kyuubi_Roar/B in usr.contents)
					del(B)
				return
			if(usr.Kyuubi1)
				usr.Kyuubi1_Revert()
				usr.overlays += 'kyuubi.dmi'
				usr.Chakra = usr.MaxChakra
				usr.Strength = usr.MaxStrength
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Agility = usr.MaxAgility
				for(var/obj/Ninjutsu/Kyuubi_Chakra/A in usr.contents)
					del(A)
				for(var/obj/Ninjutsu/Kyuubi_Roar/B in usr.contents)
					del(B)
				return
			if(usr.Kyuubi)
				usr.Kyuubi_Revert()
				usr.Chakra = usr.MaxChakra
				usr.Strength = usr.MaxStrength
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Agility = usr.MaxAgility
				for(var/obj/Ninjutsu/Kyuubi_Chakra/A in usr.contents)
					del(A)
				for(var/obj/Ninjutsu/Kyuubi_Roar/B in usr.contents)
					del(B)
				return
mob/proc
	Kyuubi1_Revert()
		if(usr.Kyuubi1)
			src.overlays -= 'Kyuubi1.dmi'
			usr.overlays -= 'Sharingan.dmi'
			src.Kyuubi1=0
			for(var/obj/Ninjutsu/Kyuubi_Chakra/A in usr.contents)
				del(A)
			for(var/obj/Ninjutsu/Kyuubi_Roar/B in usr.contents)
				del(B)
	Kyuubi2_Revert()
		if(usr.Kyuubi2)
			src.overlays -= 'Kyuubi2.dmi'
			usr.overlays -= 'Sharingan.dmi'
			src.Kyuubi2=0
			for(var/obj/Ninjutsu/Kyuubi_Chakra/A in usr.contents)
				del(A)
			for(var/obj/Ninjutsu/Kyuubi_Roar/B in usr.contents)
				del(B)
	Kyuubi_Revert()
		if(usr.Kyuubi)
			src.overlays -= 'kyuubi.dmi'
			usr.overlays -= 'Sharingan.dmi'
			src.Kyuubi=0
			for(var/obj/Ninjutsu/Kyuubi_Chakra/A in usr.contents)
				del(A)
			for(var/obj/Ninjutsu/Kyuubi_Roar/B in usr.contents)
				del(B)


obj/RoarAbil
	icon = 'Kyuubi Hands.dmi'
	icon_state="Roar"
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

obj/KyuubiAbil
	icon = 'Kyuubi Hands.dmi'
	icon_state="Hand"
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
	Move()
		var/obj/KyuubiTrail/A = new
		A.loc = src.loc
		A.dir = src.dir
		..()

obj/KyuubiTrail
	icon='Kyuubi Hands.dmi'
	icon_state="Tail"
	density = 1
	var/damage
	New()
		spawn(20)
			del src

obj/Ninjutsu/Kyuubi_Chakra
	icon='Skillcard.dmi'
	icon_state="Kyuubi"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<usr.MaxChakra*(0.25/skill))
					return
				if(prob(10/skill/skill/skill))
					usr<<output("<font size = -3>Your understanding of Kyuubi's Chakra has increased.","outputic.output")
					skill+=1
					Update()
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=usr.MaxChakra*(0.25/skill)
				var/obj/KyuubiAbil/A = new
				A.damage = rand(70,120)/5+skill
				viewers(16)<<output("<font size = -3><font color=[usr.SayFont]>[usr] yells<font color = white>: Rawr!","outputic.output")
				usr.Jutsu_Gain()
				A.loc=usr.loc
				A.dir = usr.dir
				usr.client.perspective=EYE_PERSPECTIVE
				usr.client.eye=A
				usr.controlled=A
				sleep(20*skill)
				usr.client.perspective=EYE_PERSPECTIVE
				usr.client.eye=usr
				usr.controlled=null
				walk(A,A.dir)
				spawn(45)
					usr.firing=0
					src.Active=0
			else
				usr.client.perspective=EYE_PERSPECTIVE
				usr.client.eye=usr
				usr.controlled=null



obj/Ninjutsu/Kyuubi_Roar
	icon='Skillcard.dmi'
	icon_state="Roar"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<usr.MaxChakra*(0.30/skill))
					return
				if(prob(10/skill/skill/skill))
					usr<<output("<font size = -3>Your understanding of Kyuubi's Roar has increased.","outputic.output")
					skill+=1
					Update()
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=usr.MaxChakra*(0.30/skill)
				var/obj/RoarAbil/A = new
				var/obj/RoarAbil/B = new
				var/obj/RoarAbil/C = new
				var/obj/RoarAbil/D = new
				var/obj/RoarAbil/E = new
				var/obj/RoarAbil/F = new
				var/obj/RoarAbil/G = new
				var/obj/RoarAbil/H = new
				A.damage = rand(50,100)/5+skill
				B.damage = rand(50,100)/5+skill
				C.damage = rand(50,100)/5+skill
				D.damage = rand(50,100)/5+skill
				E.damage = rand(50,100)/5+skill
				F.damage = rand(50,100)/5+skill
				G.damage = rand(50,100)/5+skill
				H.damage = rand(50,100)/5+skill
				viewers(16)<<output("<font size = -3><font color=[usr.SayFont]>[usr] yells<font color = white>: Rawr!","outputic.output")
				usr.Jutsu_Gain()


				if(usr.dir==NORTH)
					A.loc=usr.loc
					B.loc=usr.loc
					C.loc=usr.loc
					D.loc=usr.loc
					E.loc=usr.loc
					F.loc=usr.loc
					G.loc=usr.loc
					H.loc=usr.loc
				if(usr.dir==SOUTH)
					A.loc=usr.loc
					B.loc=usr.loc
					C.loc=usr.loc
					D.loc=usr.loc
					E.loc=usr.loc
					F.loc=usr.loc
					G.loc=usr.loc
					H.loc=usr.loc
				if(usr.dir==EAST)
					A.loc=usr.loc
					B.loc=usr.loc
					C.loc=usr.loc
					D.loc=usr.loc
					E.loc=usr.loc
					F.loc=usr.loc
					G.loc=usr.loc
					H.loc=usr.loc
				if(usr.dir==WEST)
					A.loc=usr.loc
					B.loc=usr.loc
					C.loc=usr.loc
					D.loc=usr.loc
					E.loc=usr.loc
					F.loc=usr.loc
					G.loc=usr.loc
					H.loc=usr.loc

				A.dir = NORTH
				B.dir = SOUTH
				C.dir = EAST
				D.dir = WEST
				E.dir = NORTHWEST
				F.dir = SOUTHEAST
				G.dir = NORTHEAST
				H.dir = SOUTHWEST
				walk(A,NORTH)
				walk(B,SOUTH)
				walk(C,EAST)
				walk(D,WEST)
				walk(E,NORTHWEST)
				walk(F,SOUTHEAST)
				walk(G,NORTHEAST)
				walk(H,SOUTHWEST)
				spawn(45)
					usr.firing=0
					src.Active=0