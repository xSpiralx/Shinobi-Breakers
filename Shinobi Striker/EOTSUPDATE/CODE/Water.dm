mob/var/tmp/
	onwater=0
	oncliff=0
	waterproc=0
	ontree=0
	onmud=0
	swim=0
turf/Terrain
	icon='Turf.dmi'
	Water
		icon_state="fake"
		Entered(mob/M)
			if(ismob(M)&&M.Convert)
				M.onwater=1
			if(ismob(M)&&M.Convert==0)
				if(!M.overlays.Find('Swim1.dmi')) M.overlays += 'Swim1.dmi'
				M.swim=1
		Exited(mob/M)
			if(ismob(M)&&M.Convert)
				M.onwater=0
			if(ismob(M)&&M.Convert==0)
				M.overlays -= 'Swim1.dmi'
				M.swim=0
				M.onwater=0
		layer=3.9
	Fishing_Spot
		Entered(mob/M)
			if(ismob(M)&&M.Convert==0)
				if(!M.overlays.Find('Swim1.dmi')) M.overlays += 'Swim1.dmi'
				M.swim=1
				M.onwater=1
		Exited(mob/M)
			if(ismob(M)&&M.Convert==0)
				if(!M.overlays.Find('Swim1.dmi')) M.overlays -= 'Swim1.dmi'
				M.swim=0
				M.onwater=0



turf/Terrain
	RuinBuildings
		Houses
			icon='housescountry.dmi'
		RuinWalls123
			icon='ruinwall.dmi'
		Sidewall
			icon='side.dmi'

mob/proc/WaterGain()
	while(src)
		sleep(30)
		if(src.onwater&&!src.KO&&src.Convert)
			if(src.Chakra > 0)
				if(src.Control >= 200||src.Resistance >= 200)
					spawn() src.Jutsu_Gain()
					//if(prob(45))
						//usr.Exp += rand(0.0078,0.017)
					//else
					//	if(random==3)
					//		usr.Exp += rand(0.0030,0.038)
				else
					src.Chakra -= rand(2,4)
					src.MaxChakra += (1 *0.018)
					spawn() src.Jutsu_Gain()

				//	if(prob(75))
				//		usr.Exp += rand(0.015,0.020)
				//	else
				//		if(random==3)
				//			usr.Exp += rand(0.024,0.035)
			else
				for(var/obj/Ninjutsu/Suimen_Hokou_no_Waza/S in src.contents)
					S.Active=0
				src.Convert=0

turf/Terrain
	icon='Turf.dmi'
	Cliff2
		icon_state="cliff2"
		density=1
	Cliff1a
		icon_state="cliff1a"
		density=1
	Cliff2a
		icon_state="cliff2a"
		density=1
turf/Terrain/Cliff
	icon='Turf.dmi'
	icon_state="cliff"
	Entered(mob/M)
		if(ismob(M)&&M.Convert)
			if(src.icon_state=="cliff")
				M.oncliff=1
	Enter(mob/M)
		if(ismob(M))
			if(M.Convert)
				return ..()
			if(src.icon_state=="cliff")
				M<<output("<font size = -3>You struggle to climb up the mountain without chakra padding!","outputic.output")
				M<<output("<font size = -3>You struggle to climb up the mountain without chakra padding!","outputall.output")
				return 0
			else return ..()
		..()

	Exited(mob/M)
		if(ismob(M)&&M.Convert)
			M.oncliff=0
		..()


turf/Terrain/shadow1
	icon='shadow.dmi'

turf/Sound/Wall
	icon='Turf.dmi'
	icon_state="cliff"
	density=1
	opacity=1
turf/Sound/Wall1
	icon='Turf.dmi'
	icon_state="cliff"
	density=0
	opacity=1



mob/proc/CliffGain()
	while(src)
		sleep(30)
		if(src.oncliff&&!src.KO&&src.Convert)
			if(src.Chakra > 0)
				if(src.Control >= 175||src.Resistance >= 175)
					src.Jutsu_Gain()
				//		usr.Exp += rand(0.0078,0.017)
				//	else
				//		if(random==3)
				//			usr.Exp += rand(0.0030,0.038)
				else
					if(overlays.Find('Swim.dmi')) src.overlays-='Swim.dmi'
					src.Chakra -= rand(1,4)
					src.Jutsu_Gain()
					src.MaxStamina += (1 *0.018)
					if(prob(25))
						usr<<output("<font size = -3>Your couldn't balance your chakra properly your hands and ended up losing grip.","outputic.output")
						usr<<output("<font size = -3>Your couldn't balance your chakra properly your hands and ended up losing grip.","outputall.output")
						step(usr,SOUTH)
						step(usr,SOUTH)
						step(usr,SOUTH)
						step(usr,SOUTH)
				//	if(prob(75))
				//		usr.Exp += rand(0.015,0.020)
				//	else
				//		if(random==3)
				//			usr.Exp += rand(0.024,0.035)
			else
				src.Health -= rand(1,3)
				src.Ko()

mob/var/tmp/Fishing=0
mob/Move()
	if(Fishing) return 0
	..()
obj/SparklingWater
	name="Sparkling Water"
	icon='Sparkling.dmi'
	var/BeingUsed=0
	Click()
		var/HasFishingPole=0
		if(usr.RecentVerbCheck("Fishing", 350,1)) return
		if(usr.afk) return
		if(usr.autoafk) return
		if(get_dist(src,usr)>1)
			usr<<output("<font size = -3>You're not close enough to fish here.","outputic.output")
			usr<<output("<font size = -3>You're not close enough to fish here.","outputall.output")
			return
		if(usr.Fishing)
			usr<<output("<font size = -3>You stop fishing.","outputic.output")
			usr<<output("<font size = -3>You stop fishing.","outputall.output")
			usr.Fishing=0
			usr.move=1
			usr.icon_state=""
			src.overlays-=image('fisherpole.dmi',icon_state = "bobber")
			return
		for(var/obj/items/Weapon/Fishing_Rod/F in usr.contents)
			if(F.worn) HasFishingPole=1
		if(!HasFishingPole)
			usr<<output("<font size = -3>You must have a fishing rod equipped to fish!","outputic.output")
			usr<<output("<font size = -3>You must have a fishing rod equipped to fish!","outputall.output")
			return
		usr.Fishing=1
		src.overlays=null
		src.overlays+=image('fisherpole.dmi',icon_state = "bobber")
		usr<<output("<font size = -3>You begin to fish.","outputic.output")
		usr.recentverbs["Fishing"] = world.realtime
		usr.dir=get_dir(usr,src)
		usr.move=0
		usr.icon_state="Attack"
		while(usr.Fishing)
			sleep(1)
			if(!usr.Fishing) return
			if(prob(30)&&usr.Fishing)
				var/obj/A = new/obj/items/Food/Small_Fish
				usr.contents+=A
				usr<<output("<font size = -3>You have caught a [A].","outputic.output")
				usr<<output("<font size = -3>You have caught a [A].","outputall.output")
			sleep(350)
			if(!usr.Fishing) return





turf/Terrain/checkboard
	icon='shogipieces.dmi'
	layer=20
	density=1




