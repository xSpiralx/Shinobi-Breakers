obj/Ninjutsu/Reito
	icon='Hyou Dagger.dmi'
	icon_state=""
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<=0) return
				if(usr.Chakra < 50)
					return
				if(prob(10/skill/skill/skill))
					skill+=1
					Update()
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1*0.001)
				usr.Chakra-=50
				var/obj/HyouDagger/A = new
				A.damage = rand(60,120)/5+skill
				usr.Jutsu_Gain()
				A.loc=usr.loc
				A.dir = usr.dir
				walk(A,usr.dir)
				spawn(45)
					usr.firing=0
					src.Active=0


obj/HyouDagger
	icon='Hyou Dagger.dmi'
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
				step(M,usr.dir)
		if(istype(M,/turf))
			if(M.density)
				del(src)
