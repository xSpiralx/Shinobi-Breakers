
obj/items/Weapon/Farming/Tools
	icon = 'Farming.dmi'
	Hoe
		icon='hoe.dmi'
		icon_state = "Inv"
	Pruners
		icon='Pruners.dmi'
		icon_state = "Inv"
	Watering_Can
		icon='watercan.dmi'
		icon_state = "Inv"
	Click()
		..()
		if(src in usr.contents)
			if(!src.worn)


				src.worn = 1
				src.suffix = "Equipped"
				usr.overlays += src.icon
			else
				src.worn = 0
				src.suffix=""
				usr.Weapon=0
				usr.overlays -= src.icon
obj/items/Farming/
	Plants
		Seeds
			icon = 'Farming.dmi'
			icon_state = "Seed Stage 1"
			var/
				Life = 100
				Planter
				GP1 = 600 //Groth Period 1 = From Seed to Sapling
				GP2 = 600 //Groth Period 2 = Sapling to Mature Plant
				SS1 = "Seed Stage 1" //Seed Icon_state
				SS2 = "Seed Stage 2" //Sapling Icon_state
				obj/items/Farming/Plants/SS3 = /obj/items/Farming/Plants //Final Stage, can be potted
				Dead = "Dead" // Dead Icon_state
				var/Timed
				var/Sun
				var/Shade
				var/Prune
				var/RequiredLevel
				list/Conditions = list("Water" = 1, "TooMuchWater" = 3,"Water2" = 3, "TooMuchWater2" = 6, "Nutrition" = 1, "Shade" = 0, "Sun" = 55,"Prune" = 5)
			verb/Plant()

				var/turf/K = usr.loc
				if(!usr.getPerk("Farmer"))
					usr<<output("This requires the Farmer perk!","outputall.output")
					return
				if(!K.Organic)
					usr<<output("You can't plant this here!","outputic.output")
					usr<<output("You can't plant this here!","outputall.output")
					return
				for(var/obj/items/Farming/Plants/P in K)
					if(P)
						usr<<output("You can't plant this here!","outputic.output")
						usr<<output("You can't plant this here!","outputall.output")
						return
				usr<<output("You plant the [src.name]","outputic.output")
				usr<<output("You plant the [src.name]","outputall.output")
				Planter = usr.ckey
				if(!K.Hoed) Life -= 75 // If the earth isn't hoed, the plant is very unhealthy.
				icon_state = SS1
				src.verbs -= /obj/items/verb/Pick_Up
				src.verbs -= /obj/items/verb/Drop
				src.loc = K
				Grow1()

			proc/
				Grow1()
					set background = 1
					var/Timer = GP1
					var/turf/T = src.loc
					spawn(1)
						while(src && Timer)
							if(Life <= 0 || Prune >= 10)
								if(icon_state == SS1)
									del src
								else
									icon_state = Dead
									spawn(1000) del src

							if(daytime=="Day" || daytime == "Dawn") Sun += 1
							else Shade += 1

							Timer -= 10
							sleep(10)
						if(T.Nutrition >= Conditions["Nutrition"])
							Life += 40
						else
							Life -= 5
						if(T.Water < Conditions["Water"])
							Life -= 75
						if(T.Water >= Conditions["TooMuchWater"])
							Life -= 75
						//if(Conditions["Shade"] < 0)
						//	Life -= Sun
					//	if(Conditions["Sun"] < 0)
						//	Life -= Shade
						if(Prune)
							Life -= 75
						if(Life <= 0)
							icon_state = Dead
							spawn(1000) del src
						else	Grow2()
				Grow2()
					set background = 1
					var/Timer = GP2
					var/turf/T = src.loc
					icon_state = SS2
					spawn(1)
						while(src && Timer)
							if(Life <= 0 || Prune >= 10)
								if(icon_state == SS1)
									del src
								else
									icon_state = Dead
									spawn(1000) del src
							if(daytime=="Day" || daytime == "Dawn") Sun += 1
							if(daytime=="Night" || daytime == "Dusk") Shade += 1
							Timer -= 10
							sleep(10)
						if(T.Water < Conditions["Water2"])
							Life -= 75
						if(T.Water >= Conditions["TooMuchWater2"])
							Life -= 75
						if(Prune < Conditions["Prune"])
							Life -= 75
						if(Life <= 0)
							icon_state = Dead
							spawn(1000) del src
						var/obj/items/Farming/Plants/P = new SS3
						P.loc = src.loc
						del src


obj/items/Farming/Plants/Seeds
	icon='Farming.dmi'
	icon_state="seeds"
	Click()
		..()
		if(get_dist(src,usr)>1) return
		if(!usr.getPerk("Farmer"))
			usr<<output("This requires the Farmer perk!","outputall.output")
			return

		if(alert(usr,"Prune the plant?","Prune","Yes","No")=="No") return
		var/HasHoe=0
		for(var/obj/items/Weapon/Farming/Tools/Pruners in usr)
			HasHoe=1
		if(!HasHoe)
			usr<<output("You need a pair of pruners to trim the plant!","outputic.output")
			usr<<output("You need a pair of pruners to trim the plant!","outputall.output")
			return
		if(world.realtime-Timed < 30)
			usr<<output("Please wait until pruning again.","outputic.output")
			usr<<output("Please wait until pruning again.","outputall.output")
			return
		var/turf/T = get_step(usr.loc,usr.dir)
		for(var/obj/items/Farming/Plants/Seeds/S in T)
			S.Prune += 1
			usr<<output("You prune the [S.name], it has now been pruned [S.Prune] times.","outputic.output")
			usr<<output("You prune the [S.name], it has now been pruned [S.Prune] times.","outputall.output")
			Timed = world.realtime
	Turnip_Seeds
		GP1 = 1200 //Groth Period 1 = From Seed to Sapling
		GP2 = 1500 //Groth Period 2 = Sapling to Mature Plant
		SS1 = "Seed Stage 1" //Seed Icon_state
		SS2 = "Seed Stage 2" //Sapling Icon_state
		SS3 = /obj/items/Farming/Plants/Turnip//Final Stage, can be potted
		Dead = "Dead" // Dead Icon_state
		Conditions = list("Water" = 3, "TooMuchWater" = 4,"Water2" = 1, "TooMuchWater2" = 2, "Nutrition" = 1, "Shade" = 2000, "Sun" = 0,"Prune" = 2)

	Cotton_Seeds
		GP1 = 1500 //Groth Period 1 = From Seed to Sapling
		GP2 = 2000 //Groth Period 2 = Sapling to Mature Plant
		SS1 = "Seed Stage 1" //Seed Icon_state
		SS2 = "Seed Stage 2" //Sapling Icon_state
		SS3 = /obj/items/Farming/Plants/Cotton//Final Stage, can be potted
		Dead = "Dead" // Dead Icon_state
		Conditions = list("Water" = 3, "TooMuchWater" = 4,"Water2" = 1, "TooMuchWater2" = 2, "Nutrition" = 2, "Shade" = 2200, "Sun" = 0,"Prune" = 3)
	Root_Seeds
		GP1 = 1500 //Groth Period 1 = From Seed to Sapling
		GP2 = 2000 //Groth Period 2 = Sapling to Mature Plant
		SS1 = "Seed Stage 1" //Seed Icon_state
		SS2 = "Seed Stage 2" //Sapling Icon_state
		SS3 = /obj/items/Farming/Plants/Root//Final Stage, can be potted
		Dead = "Dead" // Dead Icon_state
		Conditions = list("Water" = 2, "TooMuchWater" = 3,"Water2" = 3, "TooMuchWater2" = 4, "Nutrition" = 1, "Shade" = 2200, "Sun" = 0,"Prune" = 1)
	Carrot_Seeds
		GP1 = 1500 //Groth Period 1 = From Seed to Sapling
		GP2 = 2000 //Groth Period 2 = Sapling to Mature Plant
		SS1 = "Seed Stage 1" //Seed Icon_state
		SS2 = "Seed Stage 2" //Sapling Icon_state
		SS3 = /obj/items/Farming/Plants/Carrot//Final Stage, can be potted
		Dead = "Dead" // Dead Icon_state
		Conditions = list("Water" = 3, "TooMuchWater" = 4,"Water2" = 1, "TooMuchWater2" = 2, "Nutrition" = 2, "Shade" = 2200, "Sun" = 0,"Prune" = 3)
	Cabbage_Seeds
		GP1 = 900 //Groth Period 1 = From Seed to Sapling
		GP2 = 1200 //Groth Period 2 = Sapling to Mature Plant
		SS1 = "Seed Stage 1" //Seed Icon_state
		SS2 = "Seed Stage 2" //Sapling Icon_state
		SS3 = /obj/items/Farming/Plants/Cabbage//Final Stage, can be potted
		Dead = "Dead" // Dead Icon_state
		Conditions = list("Water" = 2, "TooMuchWater" = 3,"Water2" = 3, "TooMuchWater2" = 4, "Nutrition" = 3, "Shade" = 2700, "Sun" = 0,"Prune" = 2)
	Tomato_Seeds
		GP1 = 1400 //Groth Period 1 = From Seed to Sapling
		GP2 = 1900 //Groth Period 2 = Sapling to Mature Plant
		SS1 = "Seed Stage 1" //Seed Icon_state
		SS2 = "Seed Stage 2" //Sapling Icon_state
		SS3 = /obj/items/Farming/Plants/Tomato//Final Stage, can be potted
		Dead = "Dead" // Dead Icon_state
		Conditions = list("Water" = 1, "TooMuchWater" = 2,"Water2" = 2, "TooMuchWater2" = 3, "Nutrition" = 2, "Shade" = 2000, "Sun" = 0,"Prune" = 1)

obj/items/Farming/Plants/
	icon = 'Farming.dmi'
	Turnip
		icon_state="Seed Stage 3 Turnip"
		Pick_Up()
			new/obj/items/Food/Turnip(usr)
			del(src)
	Carrot
		icon_state="Seed Stage 3 Carrot"
		Pick_Up()
			new/obj/items/Food/Carrot(usr)
			del(src)
	Cabbage
		icon_state="Seed Stage 3 Cabbage"
		Pick_Up()
			new/obj/items/Food/Cabbage(usr)
			del(src)
	Tomato
		icon_state="Seed Stage 3 Tomato"
		Pick_Up()
			new/obj/items/Food/Tomato(usr)
			del(src)
	Cotton
		icon='Farming.dmi'
		icon_state="cotton_farm"
		var/plantType="cotton"
		Click()
			if(get_dist(src,usr)>1) return
			var/hasmineral=0
			for(var/obj/items/Cotton/R in usr.contents)
				hasmineral=R
			if(hasmineral)
				hasmineral:amount+=1
				hasmineral:Update()
			else
				var/obj/items/Cotton/B = new(usr)
				B.amount = 1
			usr<<output("<font size = -3>You pick the [plantType]","outputic.output")
			usr<<output("<font size = -3>You pick the [plantType]","outputall.output")
			del(src)


	Root
		icon='Farming.dmi'
		icon_state="root_farm"
		var/plantType="root"
		Click()
			if(get_dist(src,usr)>1) return
			var/hasmineral=0
			for(var/obj/items/Roots/R in usr.contents)
				hasmineral=R
			if(hasmineral)
				hasmineral:amount+=1
				hasmineral:Update()
			else
				var/obj/items/Roots/B = new(usr)
				B.amount = 1
			usr<<output("<font size = -3>You pick the [plantType]","outputic.output")
			usr<<output("<font size = -3>You pick the [plantType]","outputall.output")

			if(usr.getPerk("Herbalist"))
				if(prob(15))
					usr<<output("<font size = -3>Due to your skill as a Herbalist, you find an extra root.","outputall.output")
					if(hasmineral)
						hasmineral:amount+=1
						hasmineral:Update()
			del(src)











turf/
	Click()
		if(!Organic) return
		if(!Hoed)
			var/HasHoe=0
			for(var/obj/items/Weapon/Farming/Tools/Hoe/H in usr)
				if(H.worn) HasHoe=1
			if(!HasHoe)
				usr<<output("You need a hoe equipped to till the ground!","outputic.output")
				usr<<output("You need a hoe equipped to till the ground!","outputall.output")
				return
			var/turf/T = get_step(usr.loc,usr.dir)
			if(T!=src) return
			usr.move=0
			if(!T.Organic)
				usr<<output("You should probably try somewhere else.","outputic.output")
				usr<<output("You should probably try somewhere else.","outputall.output")
				usr.move=1
				return
			for(var/mob/M in hearers())
				M<<output("[M.getStrangerName(usr)] begins to hoe the ground.","outputic.output")
				M<<output("[M.getStrangerName(usr)] begins to hoe the ground.","outputall.output")
			usr.icon_state="Weapon"
			sleep(200)
			if(usr) usr.icon_state=""
			T.Hoed = 1
			T.HoedCheck()
			for(var/turf/F in range(1,T))
				if(F.Hoed)
					F.HoedCheck()
			for(var/mob/M in hearers())
				if(usr) M<<output("[M.getStrangerName(usr)] has hoed the ground.","outputic.output")
				if(usr) M<<output("[M.getStrangerName(usr)] has hoed the ground.","outputall.output")
			if(usr) usr.move=1
			return
		var/HasHoe=0
		for(var/obj/items/Weapon/Farming/Tools/Watering_Can/W in usr)
			if(W.worn) HasHoe=1
		if(!HasHoe)
			usr<<output("You need a water can equipped to water the ground!","outputic.output")
			usr<<output("You need a water can equipped to water the ground!","outputall.output")
			return
		var/turf/T = get_step(usr.loc,usr.dir)
		if(T!=src) return
		usr.icon_state="Attack"
		sleep(20)
		usr.icon_state=""
		T.Water += 1
		usr<<output("You water the ground. It now has a water content of [T.Water].","outputic.output")
		usr<<output("You water the ground. It now has a water content of [T.Water].","outputall.output")
		if(T.Water <= 2)
			T.overlays += image('Farming.dmi', "Watered")
		spawn(600)
			T.Water -= 1
			T.overlays -= image('Farming.dmi', "Watered")
	DblClick()
		set category = "Commands"
		if(get_dist(src,usr)>1) return
		if(!Organic) return
		usr<<output("[name] Water Content: <font color = blue> [Water]","outputic.output")
		usr<<output("[name] Nutrition Level: [Nutrition]","outputic.output")
		usr<<output("[name] Water Content: <font color = blue> [Water]","outputall.output")
		usr<<output("[name] Nutrition Level: [Nutrition]","outputall.output")
	var/Hoed = 0
	var/Organic = 0
	var/Nutrition = 1
	var/Water = 0
	proc/HoedCheck()
		if(!Organic) return
		var/TOP = 0
		var/BOTTOM = 0
		var/LEFT = 0
		var/RIGHT = 0
		var/Istate
		var/turf/D
		D = get_step(src,NORTH)
		if(D.Hoed) TOP = 1
		D = get_step(src,SOUTH)
		if(D.Hoed) BOTTOM = 1
		D = get_step(src,EAST)
		if(D.Hoed) RIGHT = 1
		D = get_step(src,WEST)
		if(D.Hoed) LEFT = 1
		if(TOP && !BOTTOM && !LEFT && !RIGHT)
			Istate = "Loner Bottom"
		if(!TOP && BOTTOM && !LEFT && !RIGHT)
			Istate = "Loner Top"
		if(!TOP && !BOTTOM && LEFT && !RIGHT)
			Istate = "Loner Right"
		if(!TOP && !BOTTOM && !LEFT && RIGHT)
			Istate = "Loner Left"
		if(TOP && BOTTOM && !LEFT && !RIGHT)
			Istate = "Bridge Up/Down"
		if(!TOP && !BOTTOM && LEFT && RIGHT)
			Istate = "Bridge Left/Right"
		if(TOP && BOTTOM && LEFT && RIGHT)
			Istate = "Center"
		if(!TOP && !BOTTOM && !LEFT && !RIGHT)
			Istate = "Single"
		if(TOP && !BOTTOM && LEFT && !RIGHT)
			Istate = "Bottom Right"
		if(TOP && !BOTTOM && !LEFT && RIGHT)
			Istate = "Bottom Left"
		if(!TOP && BOTTOM && LEFT && !RIGHT)
			Istate = "Top Right"
		if(!TOP && BOTTOM && !LEFT && RIGHT)
			Istate = "Top Left"
		if(TOP && !BOTTOM && LEFT && RIGHT)
			Istate = "Bottom"
		if(!TOP && BOTTOM && LEFT && RIGHT)
			Istate = "Top"
		if(TOP && BOTTOM && !LEFT && RIGHT)
			Istate = "Left"
		if(TOP && BOTTOM && LEFT && !RIGHT)
			Istate = "Right"
		if(!Istate)
			Istate = "Center"
		overlays -= image('Farming.dmi', Hoed)
		overlays += image('Farming.dmi', Istate)
		Hoed = Istate


