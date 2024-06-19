obj/ShukkakuHand
	icon = 'Shukkaku Arm.dmi'
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
		var/obj/ShukakkuTrail/A = new
		A.loc = src.loc
		A.dir = src.dir
		..()

obj/ShukakkuTrail
	icon='Shukkaku Arm.dmi'
	icon_state="trail"
	density = 1
	var/damage
	New()
		spawn(20)
			del src

obj/Ninjutsu/Shukkaku_Arm
	icon='Shukkaku Arm.dmi'
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<usr.MaxChakra*(0.25/skill))
					return
				if(prob(10/skill/skill/skill))
					usr<<output("Your understanding of Shukaku's Body has increased!","outputic.output")
					skill+=1
					Update()
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=usr.MaxChakra*(0.25/skill)
				var/obj/ShukkakuHand/A = new
				A.damage = rand(70,120)/5+skill
				viewers(16)<<output("<font color=[usr.SayFont]>[usr] yells<font color = white>: Grrahh","outputic.output")
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