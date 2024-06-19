mob/var/Chidori=0
obj/Ninjutsu/Chidori
	icon='Skillcard.dmi'
	icon_state="Chidori"
	Click()
		if(src in usr.contents)
			if(!usr.Chidori)
				if(usr.Chakra<22)
					return
				if(usr.resting)
					return
				if(prob(10/skill/skill/skill))
					usr<<output("<font size = -3>Your understanding of the Raiton: Chidori has increased.","outputic.output")
					usr<<output("<font size = -3>Your understanding of the Raiton: Chidori has increased.","outputall.output")
					skill+=1
					Update()
				usr.MaxTaijutsu += (1 *0.001)
				usr.Chakra-=20
				usr.Taijutsu *= rand(3,3.5)
				usr.Strength *= rand(3,3.5)
				usr.overlays += 'Chidori.dmi'
				usr.drain=1
				usr.Chidori=1
				Active=1
				spawn(50) Active=0
				usr.drain()
				if(usr.Heaven_CurseSeal2)
					usr.MaxTaijutsu += (1 *0.001)
					usr.Chakra-=400
					usr.Taijutsu *= rand(4,5.5)
					usr.Strength *= rand(4,6.5)
					usr.overlays += 'Dark-Chidori.dmi'
					usr.drain=1
					usr.Chidori=1
					usr.drain()
			else
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Strength = usr.MaxStrength
				usr.overlays -= 'Chidori.dmi'
				usr.overlays -= 'Dark-Chidori.dmi'
				usr.Chidori=0
				usr.drain=0


mob/var/drain=0
mob/proc
	drain()
		spawn() while(usr.drain)
			sleep(10)
			usr.Chakra -= 10
			if(usr.Chakra<=0)
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Strength = usr.MaxStrength
				usr.overlays -= 'Chidori.dmi'
				usr.overlays -= 'Dark-Chidori.dmi'
				usr.overlays -= 'Rasengan.dmi'
				usr.drain=0


obj/Ninjutsu/Chidori_Senbon
	icon='Skillcard.dmi'
	icon_state="Chidori Senbon"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(!usr.Chidori)
					return
				if(usr.Chakra<usr.MaxChakra*(0.45/skill))
					return
				if(prob(10/skill/skill/skill))
					usr<<output("<font size = -3>Your understanding of the Chidori Senbon no Jutsu has increased.","outputic.output")
					usr<<output("<font size = -3>Your understanding of the Chidori Senbon no Jutsu has increased.","outputall.output")
					skill+=1
					Update()
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=usr.MaxChakra*(0.45/skill)
				var/obj/Chidori_Senbon/A = new
				var/obj/Chidori_Senbon/B = new
				var/obj/Chidori_Senbon/C = new
				var/obj/Chidori_Senbon/D = new
				var/obj/Chidori_Senbon/E = new
				var/obj/Chidori_Senbon/F = new
				A.damage = rand(25,70)/5+skill
				B.damage = rand(25,70)/5+skill
				C.damage = rand(25,70)/5+skill
				D.damage = rand(25,70)/5+skill
				E.damage = rand(25,70)/5+skill
				F.damage = rand(25,70)/5+skill
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


				A.dir = usr.dir
				B.dir = usr.dir
				C.dir = usr.dir
				walk(A,usr.dir)
				walk(B,usr.dir)
				walk(C,usr.dir)
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

