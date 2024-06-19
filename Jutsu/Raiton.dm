//Jibashi and Ikazuchi Hakai
mob/var/Juuken=0
obj/var/Active=0
obj/Taijutsu/Jibashi
	var/Jibashi=0
	icon='Skillcard.dmi'
	icon_state="Jibashi"
	Click()
		if(src in usr.contents)
			if(!Jibashi)
				if(usr.Chakra<4)
					return
				if(prob(10/skill/skill/skill))
					usr<<output("Your understanding of the Raiton: Jibashi no Jutsu has increased.","outputic.output")
					skill+=1
					Update()
				usr.MaxTaijutsu += (1 *0.001)
				usr.Chakra-=4
				usr.Taijutsu *= 1.5
				usr.overlays += 'Jibashi.dmi'
				src.Active=1
				Jibashi=1
			else
				usr.Taijutsu = usr.MaxTaijutsu
				usr.overlays -= 'Jibashi.dmi'
				Jibashi=0
				src.Active=0
obj/Taijutsu/Juuken
	icon='Skillcard.dmi'
	icon_state="Juuken"
	Click()
		if(src in usr.contents)
			if(!usr.Juuken)
				if(usr.Chakra<8)
					return
				if(prob(10/skill/skill/skill))
					usr<<output("Your understanding of the Juuken has increased.","outputic.output")
					skill+=1
					Update()
				usr.MaxTaijutsu += (1 *0.001)
				usr.Chakra-=8
				usr<<output("Your have activated Hyuuga Style Secret Technique Juuken.","outputic.output")
				usr.Taijutsu *= 1.8
				usr.overlays += 'Juuken.dmi'
				src.Active=1
				usr.Juuken=1
			else
				usr.Taijutsu = usr.MaxTaijutsu
				usr.overlays -= 'Juuken.dmi'
				usr<<output("Your have deactivated Juuken.","outputic.output")
				usr.Juuken=0
				src.Active=0

obj/Ninjutsu/Ikazuchi
	icon='Skillcard.dmi'
	icon_state="IkazuchiHakai"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<50)
					return
				if(prob(10/skill/skill/skill))
					usr<<output("Your understanding of the Raiton: Ikazuchi Hakai no Jutsu has increased.","outputic.output")
					skill+=1
					Update()
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=50
				var/obj/IkazuchiAbil/A = new
				A.damage = rand(25,50)/5+skill
				viewers(16)<<output("<font color=[usr.SayFont]>[usr] yells<font color = white>: Raiton: Ikazuchi Hakai no Jutsu!","outputic.output")
				usr.Jutsu_Gain()
				A.loc=usr.loc
				A.dir = usr.dir
				walk(A,usr.dir)
				spawn(45)
					usr.firing=0
					src.Active=0

obj/Ninjutsu/Ikadzuchi_no_Kiba
	icon='Skillcard.dmi'
	icon_state="Ikadzuchi"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<100)
					return
				if(prob(10/skill/skill/skill))
					usr<<output("Your understanding of the Raiton: Ikadzuchi no Kiba has increased.","outputic.output")
					skill+=1
					Update()
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=100
				var/obj/IkadzuchiAbil/A = new
				A.damage = rand(80,150)/5+skill
				viewers(16)<<output("<font color=[usr.SayFont]>[usr] yells<font color = white>: Raiton: Ikadzuchi no Kiba!","outputic.output")
				usr.Jutsu_Gain()
				A.loc=usr.loc
				A.dir = usr.dir
				walk(A,usr.dir)
				spawn(45)
					usr.firing=0
					src.Active=0

obj/Ninjutsu/Raikyuu
	icon='Skillcard.dmi'
	icon_state="Raikyuu"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<120)
					return
				if(prob(10/skill/skill/skill))
					usr<<output("Your understanding of the Raiton: Raikyuu no Jutsu has increased.","outputic.output")
					skill+=1
					Update()
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=120
				var/obj/Raikyuu/A = new
				A.damage = rand(100,150)/5+skill
				viewers(16)<<output("<font color=[usr.SayFont]>[usr] yells<font color = white>: Raiton: Raikyuu no Jutsu!","outputic.output")
				usr.Jutsu_Gain()
				A.loc=usr.loc
				A.dir = usr.dir
				walk(A,usr.dir)
				spawn(45)
					usr.firing=0
					src.Active=0

obj/Ninjutsu/Raiton_no_Yoroi
	var/Yoroi=0
	icon='Skillcard.dmi'
	icon_state="Raiton Yoroi"
	Click()
		if(src in usr.contents)
			if(!Yoroi)
				if(usr.Chakra<100)
					return
				if(prob(10/skill/skill/skill))
					usr<<output("Your understanding of the Raiton: Yoroi no Jutsu has increased.","outputic.output")
					skill+=1
					Update()
				usr.MaxTaijutsu += (1 *0.001)
				usr.Chakra-=100
				usr.Taijutsu *= 2.5
				usr.Agility *= 2.5
				usr.overlays += 'Yoroi.dmi'
				src.Active=1
				Yoroi=1
			else
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Agility = usr.MaxAgility
				usr.overlays -= 'Yoroi.dmi'
				Yoroi=0
				src.Active=0

obj/IkazuchiAbil
	icon='Raiton.dmi'
	icon_state="Ikazuchi Hakai"
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
		var/obj/IkazuchiTrail/A = new
		A.loc = src.loc
		A.dir = src.dir
		..()

obj/IkazuchiTrail
	icon='Raiton.dmi'
	icon_state="Ikazuchi Hakai"
	density = 1
	var/damage
	New()
		spawn(20)
			del src


obj/Raikyuu
	icon='Raikyuu.dmi'
	icon_state=""
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


obj/IkadzuchiAbil
	icon='Kiba.dmi'
	icon_state=""
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
		var/obj/IkadzuchiTrail/A = new
		A.loc = src.loc
		A.dir = src.dir
		..()

obj/IkadzuchiTrail
	icon='Kiba.dmi'
	icon_state=""
	density = 1
	var/damage
	New()
		spawn(20)
			del src


obj/Chidori_Senbon
	icon='Chidori-Senbon.dmi'
	icon_state=""
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


