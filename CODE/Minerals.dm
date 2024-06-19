mob/var/tmp/Mining=0







/world/New()
	..()
	spawn(50)
		for(var/turf/Terrain/Grassd/t in world)
			if(prob(1)) if(prob(40)) new/obj/Craftables/Plant(t)
		for(var/turf/Terrain/Grass/Center/t in world)
			if(prob(1)) if(prob(40)) new/obj/Craftables/Plant(t)
		for(var/turf/Terrain/Grasslight/t in world)
			if(prob(1)) if(prob(40)) new/obj/Craftables/Plant(t)
obj/Craftables/Mineral
	icon='rock.dmi'
	icon_state="rock"
	density=1
	var/Minerals
	var/beingMined = 0
	New()
		..()
		Minerals=rand(20,60)
		var/state=num2text(Minerals)
		icon_state="rock [copytext(state,1,2)]"
		if(prob(45)) del(src)
	proc/Depleted()
		spawn()
			mouse_opacity=0
			var/Location=loc
			src.loc=null
			spawn(60*(rand(10,15))) src.loc=Location
			Minerals=rand(20,60)
			var/state=num2text(Minerals)
			icon_state="rock [copytext(state,1,2)]"
			mouse_opacity=1
	Click()
		if(get_dist(src,usr)>1) return
		var/haspick=0
		for(var/obj/items/Weapon/Pickaxe/P in usr.contents)
			if(P&&P.worn) haspick=1
		for(var/obj/items/Weapon/Subscriber_Pickaxe/P in usr.contents)
			if(P&&P.worn) haspick=2
		if(usr.afk) return
		if(usr.autoafk) return
		if(beingMined)
			usr<<output("<font size = -3>Someone is already chipping away here!","outputic.output")
			usr<<output("<font size = -3>Someone is already chipping away here!","outputall.output")
			return
		if(!haspick)
			usr<<output("<font size = -3>You require a pickaxe equipped to mine this!","outputic.output")
			usr<<output("<font size = -3>You require a pickaxe equipped to mine this!","outputall.output")
			return
		if(usr.Mining)
			usr<<output("<font size = -3>You stop mining.","outputic.output")
			usr<<output("<font size = -3>You stop mining.","outputall.output")
			usr.Mining=0
			usr.move=1
			usr.icon_state=""
			beingMined = 0
			return
		usr.Mining=1
		usr.move=0
		src.beingMined=1
		usr<<output("<font size = -3>You begin to mine.","outputic.output")
		usr<<output("<font size = -3>You begin to mine.","outputall.output")
		usr.recentverbs["Mining"] = world.realtime
		usr.dir=get_dir(usr,src)
		usr.icon_state="Weapon"
		usr.miningRock = src
		usr.showMiningGame()

obj/Craftables/Plant
	icon='Farming.dmi'
	icon_state="cotton2"
	var/plantType
	New()
		..()
		plantType=pick("cotton","root","root")
		icon_state="[plantType][rand(1,2)]"
	Click()
		if(get_dist(src,usr)>1) return
		if(plantType == "cotton")
			var/hasmineral=0
			for(var/obj/items/Cotton/R in usr.contents)
				hasmineral=R
			if(hasmineral)
				hasmineral:amount+=1
				hasmineral:Update()
			else
				var/obj/items/Cotton/B = new(usr)
				B.amount = 1
		else
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
		del(src)
/*
if(usr.RecentVerbCheck("Fishing", 100,1)) return
		if(get_dist(src,usr)>1)
			usr<<output("You're not close enough to fish here.","outputic.output")
			return
		if(usr.Fishing)
			usr<<output("You stop fishing.","outputic.output")
			usr.Fishing=0
			usr.move=1
			usr.icon_state=""
			src.overlays-=image('fisherpole.dmi',icon_state = "bobber")
			return
		for(var/obj/items/Weapon/Fishing_Rod/F in usr.contents)
			if(F.worn) HasFishingPole=1
		if(!HasFishingPole)
			usr<<output("You must have a fishing rod equipped to fish!","outputic.output")
			return
		usr.Fishing=1
		src.overlays=null
		src.overlays+=image('fisherpole.dmi',icon_state = "bobber")
		usr<<output("You begin to fish.","outputic.output")
		usr.recentverbs["Fishing"] = world.realtime
		usr.dir=get_dir(usr,src)
		usr.move=0
		usr.icon_state="Attack"
		while(usr.Fishing)
			sleep(1)
			if(!usr.Fishing) return
			var/random=rand(1,35)
*/

obj/items/Roots
	icon='Farming.dmi'
	icon_state="roots"
	name="Roots"
	var/amount=0
	var/ipowner
	var/tmp/owner
	proc/Update()
		set background=1
		suffix="[amount]"
		if(amount == 0)
			del(src)
	New()
		..()
		spawn(3) Update()

obj/items/Cotton
	icon='Farming.dmi'
	icon_state="cotton"
	name="Cotton"
	var/amount=0
	var/ipowner
	var/tmp/owner
	proc/Update()
		set background=1
		suffix="[amount]"
		if(amount == 0)
			del(src)
	New()
		..()
		spawn(3) Update()

obj/items/Wood
	icon = 'resources.dmi'
	icon_state="ts"
	name="Lumber"
	var/amount=0
	var/ipowner
	var/tmp/owner
	proc/Update()
		set background=1
		suffix="[amount]"
		if(amount == 0)
			del(src)
	New()
		..()
		spawn(3) Update()

obj/items/Bars
	icon='resources.dmi'
	icon_state="bs"
	name="Iron Minerals"
	var/amount=0
	var/ipowner
	var/tmp/owner
	proc/Update()
		set background=1
		suffix="[amount]"
		if(amount == 0)
			del(src)
	New()
		..()
		spawn(3) Update()
obj/items/TungstenBars
	icon='resources.dmi'
	icon_state="bs"
	name="Tungsten Minerals"
	var/amount=0
	var/ipowner
	var/tmp/owner
	proc/Update()
		set background=1
		suffix="[amount]"
		if(amount == 0)
			del(src)
	New()
		..()
		spawn(3) Update()
obj/items/AdamantineBars
	icon='resources.dmi'
	icon_state="bs"
	name="Adamantine Minerals"
	var/amount=0
	var/ipowner
	var/tmp/owner
	proc/Update()
		set background=1
		suffix="[amount]"
		if(amount == 0)
			del(src)
	New()
		..()
		spawn(3) Update()


obj/items/Weapon
	Axe
		var/durability = 100
		icon='AXE.dmi'
		icon_state="Inv"
		craftRank = "Weapon-Smith"
		craftChance = 60
		craftCost = 400
		verb/Examine_Durability()

			usr<<"Durability is [durability]%"
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
				else
					if(usr.Mining)
						usr<<"You cannot unequip this while you're mining!"
						return
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon

	Subscriber_Axe
		var/durability = 100
		icon='AXE.dmi'
		icon_state="Inv"

		verb/Examine_Durability()

			usr<<"Durability is [durability]%"
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
				else
					if(usr.Mining)
						usr<<"You cannot unequip this while you're mining!"
						return
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
		Drop()
			if(!usr.Admin)
				del(src)
			..()
		Pick_Up()
			..()

	Pickaxe
		icon='pickaxe.dmi'
		icon_state="Inv"
		craftRank = "Weapon-Smith"
		craftChance = 60
		craftCost = 400

		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
					usr.Taijutsu *= 1.7
					usr.Agility *= 0.4
				else
					if(usr.Mining)
						usr<<"You cannot unequip this while you're mining!"
						return
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Agility = usr.MaxAgility
	Subscriber_Pickaxe
		icon='pickaxe.dmi'
		icon_state="Inv"
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
					usr.Taijutsu *= 1.7
					usr.Agility *= 0.4
				else
					if(usr.Mining)
						usr<<"You cannot unequip this while you're mining!"
						return
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Agility = usr.MaxAgility
		Drop()
			if(!usr.Admin)
				del(src)
			..()
		Pick_Up()
			..()
obj/Mining/Rock
	icon = 'minerals.dmi'
	icon_state = "1"
	New()
		..()
		icon_state=num2text(rand(3,5))
	MouseEntered()
		src.overlays+='hover.dmi'
	MouseExited()
		src.overlays-='hover.dmi'
	Click()
		var/mob/M = usr
		if(!M.miningGame) return
		M.miningGame.durability--
		src.lowerValue(M)
		for(var/obj/Mining/Rock/O in orange(1,src))
			O.lowerValue(M)
		winset(usr,"Map.score","value=[M.miningGame.score]")
		winset(usr,"Map.durability","value=[M.miningGame.durability*5]")
		if(M.miningGame.durability<=0)
			M.miningGame.scoreHaul(M)
			M.miningRock.Depleted()

			M.hideMiningGame()
	proc/lowerValue(var/mob/M)
		if(!M.miningGame) return
		icon_state=num2text( max( text2num(icon_state)-1 ,0 ) )
		if(icon_state=="0")
			M.miningGame.score+=0.5

mob/var/tmp/obj/Mining/gameStart/miningGame = null
mob/var/tmp/obj/Craftables/Mineral/miningRock = null
obj/Mining/gameStart
	var/mob/player = null
	var/score = 0
	var/DonatorBoost = 1
	var/durability = 20
	var/mintype = "Iron"
	proc/scoreHaul(var/mob/M)
		for(var/obj/items/Weapon/Subscriber_Pickaxe/PP in M.contents)
			if(PP&&PP.worn) DonatorBoost=2
	/*	if(prob(20))
			mintype = "Tungsten"
		if(prob(10))
			mintype = "Adamantine"*/
		M<<output("<font size = -3>You manage to haul [round(score/10  * DonatorBoost)] [mintype] minerals from the rock.","outputic.output")
		M<<output("<font size = -3>You manage to haul [round(score/10 * DonatorBoost)] [mintype] minerals from the rock.","outputall.output")
		if(mintype == "Iron")
			var/hasmineral=0
			for(var/obj/items/Bars/R in M.contents)
				hasmineral=R
			if(hasmineral)
				hasmineral:amount+=round(score/10 * DonatorBoost)
				hasmineral:Update()
			else
				var/obj/items/Bars/B = new(M)
				B.amount = round(score/10  * DonatorBoost)
	/*	if(mintype == "Tungsten")
			var/hasmineral=0
			for(var/obj/items/TungstenBars/R in M.contents)
				hasmineral=R
			if(hasmineral)
				hasmineral:amount+=round(score  * DonatorBoost)
				hasmineral:Update()
			else
				var/obj/items/TungstenBars/B = new(M)
				B.amount = round(score  * DonatorBoost)
		if(mintype == "Adamantine")
			var/hasmineral=0
			for(var/obj/items/AdamantineBars/R in M.contents)
				hasmineral=R
			if(hasmineral)
				hasmineral:amount+=round(score  * DonatorBoost)
				hasmineral:Update()
			else
				var/obj/items/AdamantineBars/B = new(M)
				B.amount = round(score  * DonatorBoost)*/
mob/verb/
	quitMining()
		set hidden = 1
		hideMiningGame()
mob/proc
	showMiningGame()
		if(miningGame) return
		miningGame = new/obj/Mining/gameStart()
		miningGame.loc=findGameZone()
		src.client.eye=miningGame
		src.client.perspective=EYE_PERSPECTIVE
		winshow(src,"Map.score",1)
		winshow(src,"Map.durability",1)
		winshow(src,"Map.scor",1)
		winshow(src,"Map.dura",1)
		winshow(src,"Map.quit",1)
	hideMiningGame()
		src.client.eye=src
		src.client.perspective=EYE_PERSPECTIVE
		for(var/obj/Mining/Rock/R in range(7,miningGame))
			R.icon_state=num2text(rand(1,5))
		del(miningGame)
		miningGame = null
		Mining=0
		move=1
		icon_state=""
		src<<output("<font size = -3>You stop mining.","outputic.output")
		src<<output("<font size = -3>You stop mining.","outputall.output")
		miningRock.beingMined=0
		miningRock = null
		winshow(src,"Map.score",0)
		winshow(src,"Map.durability",0)
		winshow(src,"Map.quit",0)
		winshow(src,"Map.scor",0)
		winshow(src,"Map.dura",0)


	findGameZone()
		var/foundGameZone = 0
		var xModify = 0
		var yModify = 0
		while(!foundGameZone)
			sleep(1)
			var/turf/O = locate(9+xModify,9+yModify,26)
			var/gameFound = 0
			for(var/obj/Mining/gameStart/s in O)
				gameFound = 1
			if(!gameFound)
				foundGameZone = 1
				return O
			else
				xModify+=19
				if(xModify>=world.maxx)
					xModify=0
					yModify+=19
					if(yModify>=world.maxy) break