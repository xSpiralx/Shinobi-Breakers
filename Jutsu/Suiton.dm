//Suiryuudan and Suirou
obj/SuiryuudanAbil
	icon = 'Suiton.dmi'
	icon_state="SuiryuudanHead"
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
		var/obj/SuiryuudanTrail/A = new
		A.loc = src.loc
		A.dir = src.dir
		..()
turf/WaterFall
	icon='Turf.dmi'
	icon_state="Fall"
	layer=MOB_LAYER+1
obj/Water2
	icon='Turf.dmi'
	icon_state="water"
	layer=MOB_LAYER+1
	New()
		spawn(500)
			del src

obj/Water
	density=1
	var/damage
	New()
		spawn(300)
			del src
	Bump(mob/M)
		if(istype(M,/mob))
			if(M.attackable)
				// M.Health -= damage
				M.Ko()
				layer=MOB_LAYER+1
				del(src)
		if(istype(M,/turf))
			if(M.density)
				del(src)

	Move()
		var/obj/Water2/A = new
		A.loc = src.loc
		A.dir = src.dir
		..()
obj/Baku
	density=1
	var/damage
	New()
		spawn(300)
			del src
	Bump(mob/M)
		if(istype(M,/mob))
			if(M.attackable)
				// M.Health -= damage
				M.Ko()
				layer=MOB_LAYER+1
				del(src)
		if(istype(M,/turf))
			if(M.density)
				del(src)
	Move()
		var/obj/Baku1/A = new
		A.loc = src.loc
		A.dir = src.dir
		..()

obj/Baku2L
	density=1
	var/damage
	New()
		spawn(300)
			del src
	Bump(mob/M)
		if(istype(M,/mob))
			if(M.attackable)
				// M.Health -= damage
				M.Ko()
				layer=MOB_LAYER+1
				del(src)
		if(istype(M,/turf))
			if(M.density)
				del(src)
	Move()
		var/obj/BakuL/A = new
		A.loc = src.loc
		A.dir = src.dir
		..()

obj/Baku3R
	density=1
	var/damage
	New()
		spawn(300)
			del src
	Bump(mob/M)
		if(istype(M,/mob))
			if(M.attackable)
				// M.Health -= damage
				M.Ko()
				layer=MOB_LAYER+1
				del(src)
		if(istype(M,/turf))
			if(M.density)
				del(src)
	Move()
		var/obj/BakuR/A = new
		A.loc = src.loc
		A.dir = src.dir
		..()
obj/Baku1
	icon='Suiton.dmi'
	icon_state="Bottom mid"
	layer=MOB_LAYER+1
	var/damage
	New()
		spawn(300)
			del src
	Bump(mob/M)
		if(istype(M,/mob))
			if(M.attackable)
				// M.Health -= damage
				M.Ko()
				layer=MOB_LAYER+1
				del(src)
		if(istype(M,/turf))
			if(M.density)
				del(src)

	Move()
		var/obj/Baku2/A = new
		A.loc = src.loc
		A.dir = src.dir
		..()

obj/Baku2
	icon='Suiton.dmi'
	icon_state="Top mid"
	layer=MOB_LAYER+1
	var/damage
	New()
		spawn(300)
			del src


obj/BakuL
	icon='Suiton.dmi'
	icon_state="Bottom left"
	layer=MOB_LAYER+1
	var/damage
	New()
		spawn(300)
			del src
	Bump(mob/M)
		if(istype(M,/mob))
			if(M.attackable)
				// M.Health -= damage
				M.Ko()
				layer=MOB_LAYER+1
				del(src)
		if(istype(M,/turf))
			if(M.density)
				del(src)

	Move()
		var/obj/Baku2/A = new
		A.loc = src.loc
		A.dir = src.dir
		..()

obj/BakuL2
	icon='Suiton.dmi'
	icon_state="Top left"
	layer=MOB_LAYER+1
	var/damage
	New()
		spawn(300)
			del src


obj/BakuR
	icon='Suiton.dmi'
	icon_state="Bottom right"
	layer=MOB_LAYER+1
	var/damage
	New()
		spawn(300)
			del src
	Bump(mob/M)
		if(istype(M,/mob))
			if(M.attackable)
				// M.Health -= damage
				M.Ko()
				layer=MOB_LAYER+1
				del(src)
		if(istype(M,/turf))
			if(M.density)
				del(src)

	Move()
		var/obj/Baku2/A = new
		A.loc = src.loc
		A.dir = src.dir
		..()

obj/BakuR2
	icon='Suiton.dmi'
	icon_state="Top right"
	layer=MOB_LAYER+1
	var/damage
	New()
		spawn(300)
			del src

obj/SuiryuudanTrail
	icon='Suiton.dmi'
	icon_state="SuiryuudanBody"
	density = 1
	var/damage
	New()
		spawn(20)
			del src

obj/Ninjutsu/Suiryuudan
	icon='Skillcard.dmi'
	icon_state="Suiryuudan"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<usr.MaxChakra*(0.45/skill))
					return
				if(prob(10/skill/skill/skill))
					usr<<output("Your understanding of the Suiton: Suiryuudan no Jutsu has increased.","outputic.output")
					skill+=1
					Update()
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=usr.MaxChakra*(0.45/skill)
				var/obj/SuiryuudanAbil/A = new
				A.damage = rand(70,120)/5+skill
				viewers(16)<<output("<font color=[usr.SayFont]>[usr] yells<font color = white>: Suiton: Suiryuudan no Jutsu!","outputic.output")
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
obj/SuirouAbil
	icon='Suiton.dmi'
	icon_state="Suirou"
	layer = MOB_LAYER+1

obj/Ninjutsu/Suirou
	icon='Skillcard.dmi'
	icon_state="Suirou"
	Click()
		if(src in usr.contents)
			for(var/mob/M in get_step(usr,usr.dir))
				if((M.Ninjutsu+M.Resistance) <= (usr.Ninjutsu+usr.Control))
					if(usr.Chakra<usr.MaxChakra*(0.45/skill))
						return
					if(usr.firing)
						return
					if(usr.move)
						usr.firing=1
						src.Active=1
						viewers(16)<<output("<font color=[usr.SayFont]>[usr] yells<font color = white>: Suiton: Suirou no Jutsu!","outputic.output")
						usr.MaxNinjutsu += (1 *0.001)
						usr.Chakra-=usr.MaxChakra*(0.45/skill)
						M.move=0
						M.overlays += new/obj/SuirouAbil
						usr.move=0
						sleep(rand(200,400))
						M.move=1
						usr.move=1
						M.overlays -= new/obj/SuirouAbil
						spawn(45)
							usr.firing=0
							src.Active=0

obj/Ninjutsu/Daibakufu_no_Jutsu
	icon='Skillcard.dmi'
	icon_state="Daibakufu"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<50)
					return
				if(prob(10/skill/skill/skill))
					usr<<output("Your understanding of the Suiton: Daibakufu no Jutsu has increased.","outputic.output")
					skill+=1
					Update()
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=50
				var/obj/Water/A = new
				var/obj/Water/B = new
				var/obj/Water/C = new
				var/obj/Water/D = new
				A.damage = rand(55,90)/5+skill
				B.damage = rand(50,80)/5+skill
				C.damage = rand(50,80)/5+skill
				D.damage = rand(55,90)/5+skill
				viewers(16)<<output("<font color=[usr.SayFont]>[usr] yells<font color = white>: Suiton: Daibakufu no Jutsu!","outputic.output")
				usr.Jutsu_Gain()


				if(usr.dir==NORTH)
					A.loc=usr.loc
					B.loc=locate(usr.x-1,usr.y,usr.z)
					C.loc=locate(usr.x+1,usr.y,usr.z)
					D.loc=locate(usr.x+2,usr.y,usr.z)
				if(usr.dir==SOUTH)
					A.loc=usr.loc
					B.loc=locate(usr.x-1,usr.y,usr.z)
					C.loc=locate(usr.x+1,usr.y,usr.z)
					D.loc=locate(usr.x+2,usr.y,usr.z)
				if(usr.dir==EAST)
					A.loc=locate(usr.x,usr.y+1,usr.z)
					B.loc=usr.loc
					C.loc=locate(usr.x,usr.y-1,usr.z)
					D.loc=locate(usr.x,usr.y+2,usr.z)
				if(usr.dir==WEST)
					A.loc=locate(usr.x,usr.y+1,usr.z)
					B.loc=usr.loc
					C.loc=locate(usr.x,usr.y-1,usr.z)
					D.loc=locate(usr.x,usr.y+2,usr.z)

				A.dir = usr.dir
				B.dir = usr.dir
				C.dir = usr.dir
				D.dir = usr.dir
				walk(A,usr.dir)
				walk(B,usr.dir)
				walk(C,usr.dir)
				walk(D,usr.dir)
				spawn(45)
					usr.firing=0
					src.Active=0

obj/Ninjutsu/Goshokuzame_no_Jutsu
	icon='Skillcard.dmi'
	icon_state="Suikoudan"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<usr.MaxChakra*(0.50/skill))
					return
				if(prob(10/skill/skill/skill))
					usr<<output("Your understanding of the Goshokuzame no Jutsu has increased.","outputic.output")
					skill+=1
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=usr.MaxChakra*(0.50/skill)
				var/obj/SharkAbil/A = new
				sleep(5)
				var/obj/SharkMiddle/B = new
				sleep(5)
				var/obj/SharkTail/C = new
				A.damage = (usr.Ninjutsu/4)+1
				B.damage = (usr.Ninjutsu/4)+1
				C.damage = (usr.Ninjutsu/4)+1
				viewers(16)<<output("<font color=[usr.SayFont]>[usr] yells<font color = white>: Goshokuzame no Jutsu!","outputic.output")
				usr.Jutsu_Gain()
				A.loc=usr.loc
				A.dir = usr.dir
				walk(A,usr.dir)
				B.loc=A.loc
				B.dir = A.dir
				walk(B,A.dir)
				C.loc=B.loc
				C.dir = B.dir
				walk(C,B.dir)
				spawn(45)
				usr.firing=0
				src.Active=0

obj/SharkAbil
	icon='Suiton.dmi'
	icon_state="1"
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
		/*var/obj/SharkMiddle/A = new
		A.loc = src.loc
		A.dir = src.dir
		var/obj/SharkTail/B = new
		B.loc = A.loc
		B.dir = A.dir
		..()*/

obj/SharkMiddle
	icon='Suiton.dmi'
	icon_state="2"
	density = 1
	var/damage
	New()
		spawn(20)
			del src
obj/SharkTail
	icon='Suiton.dmi'
	icon_state="3"
	density = 1
	var/damage
	New()
		spawn(20)
			del src



obj/Ninjutsu/Baku_Suishouha
	icon='Skillcard.dmi'
	icon_state="Daibakufu"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<50)
					return
				if(prob(10/skill/skill/skill))
					usr<<output("Your understanding of the Suiton: Baku Suishouha no Jutsu has increased.","outputic.output")
					skill+=1
					Update()
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=50
				var/obj/Baku/A = new
				var/obj/Baku2L/B = new
				var/obj/Baku/C = new
				var/obj/Baku3R/D = new
				A.damage = rand(65,100)/5+skill
				B.damage = rand(60,90)/5+skill
				C.damage = rand(60,90)/5+skill
				D.damage = rand(65,100)/5+skill
				viewers(16)<<output("<font color=[usr.SayFont]>[usr] yells<font color = white>: Suiton: Baku Suishouha no Jutsu!","outputic.output")
				usr.Jutsu_Gain()


				if(usr.dir==NORTH)
					A.loc=usr.loc
					B.loc=locate(usr.x-1,usr.y,usr.z)
					C.loc=locate(usr.x+1,usr.y,usr.z)
					D.loc=locate(usr.x+2,usr.y,usr.z)
				if(usr.dir==SOUTH)
					A.loc=usr.loc
					B.loc=locate(usr.x-1,usr.y,usr.z)
					C.loc=locate(usr.x+1,usr.y,usr.z)
					D.loc=locate(usr.x+2,usr.y,usr.z)
				if(usr.dir==EAST)
					B.loc=locate(usr.x,usr.y+1,usr.z)
					A.loc=usr.loc
					C.loc=locate(usr.x,usr.y-1,usr.z)
					D.loc=locate(usr.x,usr.y-2,usr.z)
				if(usr.dir==WEST)
					B.loc=locate(usr.x,usr.y+1,usr.z)
					A.loc=usr.loc
					C.loc=locate(usr.x,usr.y-1,usr.z)
					D.loc=locate(usr.x,usr.y-2,usr.z)

				A.dir = usr.dir
				B.dir = usr.dir
				C.dir = usr.dir
				D.dir = usr.dir
				walk(A,usr.dir)
				walk(B,usr.dir)
				walk(C,usr.dir)
				walk(D,usr.dir)
				spawn(45)
					usr.firing=0
					src.Active=0

obj/Suijinheki2
	icon = 'Suiton.dmi'
	icon_state="1,2"
	layer=MOB_LAYER+1
	New()
		flick("Rise2",src)
		spawn(195)
			del src
obj/Suijinheki
	icon = 'Suiton.dmi'
	icon_state="1,1"
	density = 1
	New()
		flick("Rise",src)
		spawn(200)
			del src

obj/Suijinheki3
	icon = 'Suiton.dmi'
	icon_state="1,3"
	layer=MOB_LAYER+1
	New()
		flick("Rise3",src)
		spawn(190)
			del src

obj/Ninjutsu/Suijinheki
	icon='Skillcard.dmi'
	icon_state="Suijinheki"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<50)
					return
				if(prob(10/skill/skill/skill))
					usr<<output("Your understanding of the Suijinheki no Jutsu has increased.","outputic.output")
					skill+=1
					Update()
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=usr.MaxChakra*(0.50/skill)
				var/obj/Suijinheki/A = new
				var/obj/Suijinheki2/B = new
				var/obj/Suijinheki3/C = new
				A.dir=usr.dir
				B.dir=usr.dir
				C.dir=usr.dir
				usr.Jutsu_Gain()
				if(usr.dir==NORTH)
					A.loc = locate(usr.x,usr.y+1,usr.z)
					B.loc = locate(usr.x,usr.y+2,usr.z)
					C.loc = locate(usr.x,usr.y+3,usr.z)
				if(usr.dir==EAST)
					A.loc = locate(usr.x+1,usr.y,usr.z)
					B.loc = locate(usr.x+1,usr.y+1,usr.z)
					C.loc = locate(usr.x+1,usr.y-1,usr.z)
				if(usr.dir==SOUTH)
					A.loc = locate(usr.x,usr.y-3,usr.z)
					B.loc = locate(usr.x,usr.y-2,usr.z)
					C.loc = locate(usr.x,usr.y-1,usr.z)
				if(usr.dir==WEST)
					A.loc = locate(usr.x-1,usr.y,usr.z)
					B.loc = locate(usr.x-1,usr.y+1,usr.z)
					C.loc = locate(usr.x-1,usr.y-1,usr.z)
				spawn(45)
					usr.firing=0
					src.Active=0



