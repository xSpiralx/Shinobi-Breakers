
mob/var
	treesOnDay = 0
	timeofTrees = 0



mob/proc
	canCut()
		if(time2text(world.realtime,"DD") == src.timeofTrees)
			if(treesOnDay >= src.getTreeMax())
				return 0
		else
			treesOnDay = 0
		return 1

	getTreeMax()
		if(src.stamina > 50)
			return 45
		if(src.stamina > 25)
			return 30
		return 20


turf/newtrees
	var/gathered=0
	var/beingMined=0
	var/Gatherable=1
	var/DonatorBoost = 1
	New()
		..()
		gathered=rand(5,15)
		icon_state=""
		Gatherable=1
	proc/TreeDepleted()
		if(Gatherable<=0)
			//world.log << "TREEEEEEEEDepleted"
			mouse_opacity=0
			icon_state = "1"
			sleep(rand(259200,342300))
			spawn(700*(rand(10,15)))
			gathered=rand(5,15)
			icon_state=""
			mouse_opacity=1
			Gatherable=1

	Click()
		if(get_dist(src,usr)>1) return
		var/obj/items/Weapon/Axe/Ref
		var/hasaxe=0
		if(!usr.canCut())
			usr<<output("<font size = -3>You're reached your limit of tree cutting for today.","outputic.output")
			usr<<output("<font size = -3>You've reached your limit of tree cutting for today.","outputall.output")
			return
		for(var/obj/items/Weapon/Axe/P in usr.contents)
			if(P&&P.worn)
				hasaxe=1
				Ref = P
				DonatorBoost=1
				break
		for(var/obj/items/Weapon/Subscriber_Axe/P in usr.contents)
			if(P&&P.worn)
				hasaxe=1
				Ref = P
				DonatorBoost=2
				break
		if(usr.afk) return
		if(usr.autoafk) return
		if(beingMined)
			usr<<output("<font size = -3>Someone is already chopping away here!","outputic.output")
			usr<<output("<font size = -3>Someone is already chopping away here!","outputall.output")
			return
		if(!hasaxe)
			usr<<output("<font size = -3>You require a axe equipped to mine this!","outputic.output")
			usr<<output("<font size = -3>You require a axe equipped to mine this!","outputall.output")
			return
		if(usr.Mining)
			usr<<output("<font size = -3>You stop cutting.","outputic.output")
			usr<<output("<font size = -3>You stop cutting.","outputall.output")
			usr.Mining=0
			usr.move=1
			usr.icon_state=""
			beingMined = 0
			return
		Ref.durability -= 2
		if(Ref.durability <= 0)
			if(usr.Mining)
				usr.Mining = 0
				return
			Ref.worn = 0
			Ref.suffix=""
			usr.Weapon=0
			usr.overlays -= Ref.icon
			del(Ref)

			usr<<output("<font size = -3>Your axe breaks.","outputic.output")
			usr<<output("<font size = -3>Your axe breaks.","outputall.output")
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
		var/hasmineral=0
/*		for(var/obj/items/Wood/R in usr.contents)
			hasmineral=R
		if(hasmineral)
			hasmineral:amount+=gathered
			hasmineral:Update()
		else
			var/obj/items/Wood/B = new(usr)
			B.amount = gathered*/
		while(usr.Mining)
			sleep(1)
			if(!usr.Mining) return
			if(usr.afk)
				usr.Mining=0
				usr.move=1
				usr.icon_state=""
				return
			if(usr.autoafk)
				usr.Mining=0
				usr.move=1
				usr.icon_state=""
				return
			sleep(30)
			if(prob(80))
				for(var/obj/items/Wood/R in usr.contents)
					hasmineral=R
				if(hasmineral)
					hasmineral:amount+=round(gathered * DonatorBoost)
					hasmineral:Update()
					usr<<output("<font size = -3>You get [gathered * DonatorBoost] wood from the tree..","outputic.output")
					usr<<output("<font size = -3>You get [gathered * DonatorBoost] wood from the tree.","outputall.output")
					usr.treesOnDay++
					usr.timeofTrees = time2text(world.realtime,"DD")
					Gatherable = 0
				else
					var/obj/items/Wood/B = new(usr)
					B.amount = gathered * DonatorBoost
					usr<<output("<font size = -3>You get [gathered * DonatorBoost] wood from the tree..","outputic.output")
					usr<<output("<font size = -3>You get [gathered * DonatorBoost] wood from the tree.","outputall.output")
					usr.treesOnDay++
					usr.timeofTrees = time2text(world.realtime,"DD")
					Gatherable = 0
			if(!Gatherable)

				icon_state = "1"
				beingMined = 0
				spawn() TreeDepleted()
				usr.Mining=0
				usr.move=1
				usr.icon_state=""
				return
			sleep(150)

			if(!usr.Mining) return

	TreeA
		icon='Tree.dmi'
		layer= 46
	TreeB
		icon='TreeA.dmi'
		layer= 46
	TreeC
		icon='TreeB.dmi'
		layer= 46
	TreeD
		icon='TreeC.dmi'
		layer= 46
	TreeE
		icon='TreeD.dmi'
		layer= 46
turf/newtreescash
	TreeB
		//icon='tree123.dmi'
		layer= 3
	Treeshadow
		icon='treesplease.dmi'
		layer= 22
	Tree23
		icon='treet1.dmi'
		layer= 23
	Tree40
		icon='treet1.dmi'
		layer= 40
	Tree50
		icon='treet1.dmi'
		layer= 50
	Tree70
		icon='treet1.dmi'
		layer= 70
turf/newtreesoverlay
	layer=MOB_LAYER+3
	TreeA
		icon='Tree.dmi'
		layer= 46
	TreeB
		icon='TreeA.dmi'
		layer= 46
	TreeC
		icon='TreeB.dmi'
		layer= 46
	TreeD
		icon='TreeC.dmi'
		layer= 46
	TreeE
		icon='TreeD.dmi'
		layer= 46