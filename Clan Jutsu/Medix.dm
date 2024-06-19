/*
Techniques
Shosen no Jutsu - Healing Other (UnKO's)
In'yu Shometsu - Self Heal
Ranshinsho - Causes them to move funny
Deddo Kontan no Jutsu - Ressurection
*/
mob/var/Kyuuin=0
mob/var/Mesu=0
obj/Ninjutsu/Shosen
	icon='Skillcard.dmi'
	icon_state="Shosen"
	var/healskill=1
	Click()
		if(src in usr.contents)
			if(usr.firing)
				return
			if(usr.Chakra<(33/healskill))
				return
			for(var/mob/M in get_step(usr,usr.dir))
				usr.firing=1
				Active=1
				spawn(50) Active=0
				M.UnKo()
				M.Health=M.MaxHealth
				M<<output("<font size = -3>You have been healed to full Health by [usr]","outputic.output")
				usr.Chakra-=(150/healskill)
				healskill+=(0.01*2)
				sleep(50)
				usr.firing=0

obj/Ninjutsu/Saikan_Chuushutsu_no_Jutsu
	icon='Skillcard.dmi'
	icon_state="Saikan"
	var/healskill=1
	Click()
		if(src in usr.contents)
			if(usr.firing)
				return
			if(usr.Chakra<(33/healskill))
				return
			if(usr.PuppetPoison)
				usr.Health=usr.MaxHealth/2
				usr.PuppetPoison=0
				usr.Chakra-=(150/healskill)
				healskill+=(0.01*2)
			for(var/mob/M in get_step(usr,usr.dir))
				if(!M.PuppetPoison)
					return
				Active=1
				spawn(50) Active=0
				usr.firing=1
				M.UnKo()
				M.Health=M.MaxHealth/2
				M.PuppetPoison=0
				usr.Chakra-=(150/healskill)
				healskill+=(0.01*2)
				sleep(50)
				usr.firing=0

obj/Ninjutsu/Kishou_Tensi_no_Jutsu
	icon='Skillcard.dmi'
	icon_state="Deddo"
	var/healskill=1
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.Chakra<usr.MaxChakra*0.80)
					return
				usr.Chakra-=(usr.MaxChakra*0.80)
				usr.Health-=(usr.MaxHealth*0.30)
				var/list/V = new/list
				for(var/mob/M in world)
					if(M.Dead) V.Add(M)
				var/mob/B=input("Who would you like to Ressurect?","Cancel") in V
				if(B==null)
					return
				if(!B.Dead)
					return
				if(B.Dead)
					B.loc=locate(usr.x,usr.y,usr.z)
					B.resetLuminosity()
					B.y-=1
					B.onwater=0
					B.Dead=0
					usr.MaxNinjutsu += (1 *0.01)
					usr.Dead=1
					usr.Death(usr)

obj/Ninjutsu/Shometsu
	icon='Skillcard.dmi'
	icon_state="Shosen"
	var/healskill=1
	Click()
		if(src in usr.contents)
			if(usr.firing)
				return
			if(usr.Chakra<(10/healskill))
				return
			Active=1
			spawn(50) Active=0
			usr.firing=1
			usr.Health=usr.MaxHealth
			usr.Chakra-=(10/healskill)
			healskill+=(0.01*2)
			sleep(50)
			usr.firing=0

obj/Ninjutsu/Chakra_Kyuuin_Jutsu
	icon='Skillcard.dmi'
	icon_state="Kyuuin"
	var/healskill=1
	Click()
		if(src in usr.contents)
			if(usr.firing)
				return
			if(usr.Chakra<(33/healskill))
				return
			for(var/mob/M in get_step(usr,usr.dir))
				Active=1
				spawn(50) Active=0
				usr.firing=1
				M.Kyuuin=1
				M.Kyuuin()
				usr.Chakra-=(150/healskill)
				usr.overlays += 'Scalpel.dmi'
				healskill+=(0.01*2)
				sleep(rand(80,200))
				usr.firing=0
				M.Kyuuin=0
				usr.overlays -= 'Scalpel.dmi'


obj/Ninjutsu/Chakra_no_Mesu
	icon='Skillcard.dmi'
	icon_state="Kyuuin"
	var/healskill=1
	Click()
		if(src in usr.contents)
			if(usr.firing)
				return
			if(usr.Chakra<(33/healskill))
				return
			for(var/mob/M in get_step(usr,usr.dir))
				Active=1
				spawn(50) Active=0
				usr.firing=1
				M.Mesu=1
				M.Mesu()
				M.Health-=4
				usr.overlays += 'Scalpel.dmi'
				usr.Chakra-=(100/healskill)
				healskill+=(0.01*2)
				sleep(rand(50,200))
				usr.firing=0
				usr.overlays -= 'Scalpel.dmi'
				sleep(rand(200,400))
				M.Mesu=0
mob/proc/Mesu()
	if(usr.Mesu)
		if(usr.dir==NORTH)
			step(usr,SOUTH)
		if(usr.dir==EAST)
			step(usr,WEST)
		if(usr.dir==SOUTH)
			step(usr,NORTH)
		if(usr.dir==WEST)
			step(usr,EAST)
		sleep(3)
		usr.client:dir = EAST
		sleep(3)
		usr.client:dir = SOUTH
		sleep(3)
		usr.client:dir = WEST
		sleep(3)
		usr.client:dir = NORTH
		usr.times+=1
		spawn(10)
			usr.Mesu()

mob/var/times=0

mob/proc
	Kyuuin()
		if(usr.Kyuuin)
			usr.Health -= rand(1,3)
			usr.Chakra -= rand(1,3)
			usr.Ko()
			spawn(15)
				usr.Kyuuin()


obj/Ninjutsu/Saikan_Chuushutsu_no_Jutsu
	icon='Skillcard.dmi'
	icon_state="Shosen"
	Click()
		if(src in usr.contents)
			if(usr.firing)
				return
			if(usr.Chakra<(10/healskill))
				return
			for(var/mob/M in get_step(usr,usr.dir))
				usr.firing=1
				M.UnKo()
				M.Health=M.MaxHealth
				usr.Chakra-=(150/healskill)
				healskill+=(0.01*2)
				sleep(50)
				usr.firing=0




