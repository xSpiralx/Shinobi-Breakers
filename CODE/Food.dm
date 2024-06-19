obj/items/Poisons
	Low_Grade_Poison
		icon='Farming.dmi'
		icon_state="low"
		layer=80
		name="Slow Acting Paralytic Poison"

		craftRank = "Herbalist"
		craftChance = 50
		craftCost = 50

		Click()
			..()
			if(src in usr.contents)
				del(src)
	Medium_Grade_Poison
		icon='Farming.dmi'
		icon_state="medium"
		layer=80
		name="Fast Acting Paralytic Poison"

		craftRank = "Herbalist"
		craftChance = 40
		craftCost = 100

		Click()
			..()
			if(src in usr.contents)
				del(src)
	High_Grade_Poison
		icon='Farming.dmi'
		icon_state="high"
		layer=80

		craftRank = "Herbalist"
		craftChance = 30
		craftCost = 150
		name="Immediate Paralytic Poison"

		Click()
			..()
			if(src in usr.contents)
				del(src)


	Slow_Acting_Neurotic_Venom
		icon='Farming.dmi'
		icon_state="low"
		layer=80

		craftRank = "Herbalist"
		craftChance = 50
		craftCost = 70

		Click()
			..()
			if(src in usr.contents)
				del(src)
	Fast_Acting_Neurotic_Venom
		icon='Farming.dmi'
		icon_state="medium"
		layer=80

		craftRank = "Herbalist"
		craftChance = 40
		craftCost = 150

		Click()
			..()
			if(src in usr.contents)
				del(src)
	Immediate_Neurotic_Venom
		icon='Farming.dmi'
		icon_state="high"
		layer=80

		craftRank = "Herbalist"
		craftChance = 30
		craftCost = 200

		Click()
			..()
			if(src in usr.contents)
				del(src)


	Dizzying_Poison
		icon='Farming.dmi'
		icon_state="low"
		layer=80

		craftRank = "Herbalist"
		craftChance = 50
		craftCost = 30

		Click()
			..()
			if(src in usr.contents)
				del(src)
	Hallucination_Poison
		icon='Farming.dmi'
		icon_state="medium"
		layer=80

		craftRank = "Herbalist"
		craftChance = 50
		craftCost = 80

		Click()
			..()
			if(src in usr.contents)
				del(src)
	Frenzy_Inducing_Poison
		icon='Farming.dmi'
		icon_state="high"
		layer=80

		craftRank = "Herbalist"
		craftChance = 30
		craftCost = 150

		Click()
			..()
			if(src in usr.contents)
				del(src)

obj/items/Food
	Bread
		icon='foodandstuff.dmi'
		icon_state="celery"
		layer=80
		Click()
			..()
			if(src in usr.contents)
				del(src)
	Celery
		icon='foodandstuff.dmi'
		icon_state="celery"
		layer=80
		Click()
			..()
			if(src in usr.contents)
				del(src)
	Beer
		icon='foodandstuff.dmi'
		icon_state="beer"
		layer=80
		Click()
			..()
			if(src in usr.contents)
				del(src)
	Shishcabob
		icon='foodandstuff.dmi'
		icon_state="shishcabob"
		layer=80
		Click()
			..()
			if(src in usr.contents)
				del(src)
	Apple_Juice
		icon='foodandstuff.dmi'
		icon_state="orangejuice"
		layer=80
		Click()
			..()
			if(src in usr.contents)
				del(src)
	Orange_Juice
		icon='foodandstuff.dmi'
		icon_state="orangejuice"
		layer=80
		Click()
			..()
			if(src in usr.contents)
				del(src)
	Orange
		icon='foodandstuff.dmi'
		icon_state="orange"
		layer=80
		Click()
			..()
			if(src in usr.contents)
				del(src)
	Apple
		icon='foodandstuff.dmi'
		icon_state="apple"
		layer=80
		Click()
			..()
			if(src in usr.contents)
				del(src)
	Egg
		icon='foodandstuff.dmi'
		icon_state="egg"
		layer=80
		Click()
			if(src in usr.contents)
				del(src)
	Milk
		icon='foodandstuff.dmi'
		icon_state="milk"
		layer=80
		Click()
			..()
			if(src in usr.contents)
				del(src)

	Ramen
		icon='Ramen1.dmi'
		icon_state=""
		layer=80
		Click()
			..()
			if(src in usr.contents)
				del(src)

	Konoha_steak
		icon='steak.dmi'
		icon_state=""
		layer=80
		Click()
			..()
			if(src in usr.contents)
				del(src)

	Vegetable_Ramen
		icon='Ramen1.dmi'
		icon_state="1"
		layer=80
		Click()
			..()
			if(src in usr.contents)
				del(src)
	Miso_Ramen
		icon='Ramen1.dmi'
		icon_state="2"
		layer=80
		Click()
			..()
			if(src in usr.contents)
				del(src)

	Big_Fish
		icon='Fish.dmi'
		icon_state="26"
		var/size
		layer=80
		New()
			..()
			size=rand(13.1,14.5)
			name="[size]\" Largemouth Bass"
		Click()
			..()
			if(src in usr.contents)
				usr<<output("You should probably cook this first.","outputic.output")
				usr<<output("You should probably cook this first.","outputall.output")
				return
	Big_Fish_Fry
		icon='Fish.dmi'
		icon_state="Fry"
		name="Cooked Largemouth Bass"
		layer=80
		Click()
			..()
			if(src in usr.contents)
				del(src)

	Med_Fish
		icon='Fish.dmi'
		icon_state="65"
		var/size
		layer=80
		New()
			..()
			size=rand(10.1,12.8)
			name="[size]\" Smallmouth Bass"
		Click()
			..()
			if(src in usr.contents)
				usr<<output("You should probably cook this first.","outputic.output")
				usr<<output("You should probably cook this first.","outputall.output")
				return
	Med_Fish_Fry
		icon='Fish.dmi'
		icon_state="Fry2"
		name="Cooked Smallmouth Bass"
		layer=80
		Click()
			..()
			if(src in usr.contents)
				del(src)

	Med_Fish2
		icon='Fish.dmi'
		icon_state="63"
		var/size
		layer=80
		New()
			..()
			size=rand(9.6,13.4)
			name="[size]\" Smallmouth Bass"
		Click()
			..()
			if(src in usr.contents)
				usr<<output("You should probably cook this first.","outputic.output")
				usr<<output("You should probably cook this first.","outputall.output")
				return

	Med_Fish2_Fry
		icon='Fish.dmi'
		icon_state="Fry4"
		name="Cooked Smallmouth Bass"
		layer=80
		Click()
			..()
			if(src in usr.contents)
				del(src)

	Med_Fish3
		icon='Fish.dmi'
		icon_state="68"
		var/size
		layer=80
		New()
			..()
			size=rand(10.1,12.8)
			name="[size]\" Smallmouth Bass"
		Click()
			..()
			if(src in usr.contents)
				usr<<output("You should probably cook this first.","outputic.output")
				usr<<output("You should probably cook this first.","outputall.output")
				return
	Med_Fish3_Fry
		icon='Fish.dmi'
		icon_state="Fry3"
		name="Cooked Smallmouth Bass"
		layer=80
		Click()
			..()
			if(src in usr.contents)
				del(src)

	Small_Fish
		icon='Fish.dmi'
		icon_state="54"
		var/size
		layer=80
		New()
			..()
			size=rand(6.1,9.4)
			name="[size]\" Perch"
		Click()
			..()
			if(src in usr.contents)
				usr<<output("You should probably cook this first.","outputic.output")
				usr<<output("You should probably cook this first.","outputall.output")
				return
	Small_Fish_Fry
		icon='Fish.dmi'
		icon_state="Fry5"
		name="Cooked Perch"
		layer=80
		Click()
			..()
			if(src in usr.contents)
				del(src)

	Carrot_Seeds
		icon='Farm.dmi'
		icon_state="seeds"
	Turnip_Seeds
		icon='Farm.dmi'
		icon_state="Tuseeds"
	Cabbage_Seeds
		icon='Farm.dmi'
		icon_state="Cseeds"
	Tomato_Seeds
		icon='Farm.dmi'
		icon_state="Tseeds"
		/*verb
			Plant()
				if(var/obj/items/Food/Carrot_Seeds in usr.contents)
					set src in oview(0)
					var/obj/items/Food/Carrot_Seeds/S = new/obj/items/Food/Carrot_Seeds(usr.loc)
					sleep(100)//time until it is fully grown!
					del(S)
					new/obj/items/Food/Carrot(src.loc)*/



	Senbon
		icon='Senbon.dmi'
		icon_state="Inv"
		var/senbon=1
		verb/Throw()
			if(prob(10/usr.SenbonSkill/usr.SenbonSkill/usr.SenbonSkill))
				usr.SenbonSkill+=rand(0.5,1)
			var/obj/Senbon/A = new
			A.damage = (usr.SenbonSkill/1.7)+2
			A.loc=usr.loc
			A.dir = usr.dir
			walk(A,usr.dir)
			if(senbon==1)
				del(src)
				return
			senbon-=1
			src.suffix = "You current have [src.senbon] in this stack"

	Ninja_Flaks
		icon='food.dmi'
		icon_state="Ninjaflaks"
		name="Bag of Ninja Flaks"
		layer=80
		Click()
			..()
			if(src in usr.contents)
				del(src)
	Soda
		icon='Coke.dmi'
		icon_state="Coke"
		layer=80
		New()
			..()
			icon_state=pick("Coke","Dew","Grape")
			if(icon_state=="Coke") name="Goke"
			if(icon_state=="Dew") name="Zrite"
			if(icon_state=="Grape") name="Foopalaid"
		Click()
			..()
			if(src in usr.contents)
				del(src)

	Carrot
		icon='Farm.dmi'
		icon_state="carrot2"
		Click()
			..()
			if(src in usr.contents)
				del(src)

	Turnip
		icon='Farm.dmi'
		icon_state="turnip2"
		Click()
			..()
			if(src in usr.contents)
				del(src)

	Cabbage
		icon='Farm.dmi'
		icon_state="cabbage2"
		Click()
			..()
			if(src in usr.contents)
				del(src)
	Tomato
		icon='Farm.dmi'
		icon_state="tomato2"
		Click()
			..()
			if(src in usr.contents)
				del(src)
turf/SodaNode
	name="Soda Machine"
	icon='Misc Effects.dmi'
	icon_state="2"
	layer=999999999
	density=1
	mouse_opacity=2
	Click()
		if(get_dist(usr,src)>1) return
		for(var/obj/items/Ryo/R in usr.contents)
			if(R.amount>=7)
				R.amount-=7
				R.Update()
				var/obj/A = new/obj/items/Food/Soda
				usr.contents+=A
				usr<<output("You insert 7 Ryo, and a [A.name] dispenses out of the machine.","outputic.output")
				usr<<output("You insert 7 Ryo, and a [A.name] dispenses out of the machine.","outputall.output")
				break
			else
				usr<<output("Soda costs 7 Ryo!","outputic.output")
				usr<<output("Soda costs 7 Ryo!","outputall.output")
turf/SnackNode
	name="Snack Machine"
	icon='Misc Effects.dmi'
	icon_state="2"
	layer=999999999
	density=1
	mouse_opacity=2
	Click()
		if(get_dist(usr,src)>1) return
		for(var/obj/items/Ryo/R in usr.contents)
			if(R.amount>=10)
				R.amount-=10
				R.Update()
				var/obj/A = new/obj/items/Food/Ninja_Flaks
				usr.contents+=A
				usr<<output("You insert 10 Ryo, and a [A.name] dispenses out of the machine.","outputic.output")
				usr<<output("You insert 10 Ryo, and a [A.name] dispenses out of the machine.","outputall.output")
				break
			else
				usr<<output("Snacks costs 10 Ryo!","outputic.output")
				usr<<output("Snacks costs 10 Ryo!","outputall.output")
turf/Papers
	icon='newstand.dmi'
	icon_state="2"
	layer=99999999
	mouse_opacity=2
	Click()
		if(get_dist(usr,src)>1) return
		LoadStory()
		usr<<browse(Storyline,"window=Storyline;size=500x350")


turf
	Soil
		icon = 'Dirt.dmi'
		Organic=1
		layer=3
	SunaSand
		icon = 'SunaSand3.dmi'
		layer=1
	DesertTree1
		icon = 'Suna1x2.dmi'
		icon_state = "deadtree"
		layer=3
	DesertCactus
		icon = 'Suna1x2.dmi'
		icon_state = "cactus"
		layer=3
	DesertFlora1
		icon = 'Suna1x1.dmi'
		icon_state = "flora1"
		layer=3
		density=1
	DesertFlora2
		icon = 'Suna1x1.dmi'
		icon_state = "flora2"
		layer=3
		density=1
	DesertFlora3
		icon = 'Suna1x1.dmi'
		icon_state = "flora3"
		layer=3
		density=1
	DesertRock
		icon = 'Suna1x1.dmi'
		icon_state = "rock"
		layer=3
		density=1
	DesertPalm
		icon = 'SunaPalm.dmi'
		layer=3
		density=1

obj

	Fire
		icon = 'Turf.dmi'
		icon_state="firewood"
	//	luminosity=5
		verb
			Cook()
				if(locate(/obj/items/Food/Big_Fish,usr.contents))
					set src in oview(1)
					sleep(rand(150,350))
					for(var/obj/items/Food/Big_Fish/B in usr.contents)
						del(B)
						usr.contents += new/obj/items/Food/Big_Fish_Fry
				if(locate(/obj/items/Food/Med_Fish,usr.contents))
					set src in oview(1)
					sleep(rand(150,350))
					for(var/obj/items/Food/Med_Fish/B in usr.contents)
						del(B)
						usr.contents += new/obj/items/Food/Med_Fish_Fry
				if(locate(/obj/items/Food/Med_Fish2,usr.contents))
					set src in oview(1)
					sleep(rand(150,350))
					for(var/obj/items/Food/Med_Fish2/B in usr.contents)
						del(B)
						usr.contents += new/obj/items/Food/Med_Fish2_Fry
				if(locate(/obj/items/Food/Med_Fish3,usr.contents))
					set src in oview(1)
					sleep(rand(150,350))
					for(var/obj/items/Food/Med_Fish3/B in usr.contents)
						del(B)
						usr.contents += new/obj/items/Food/Med_Fish3_Fry
				if(locate(/obj/items/Food/Small_Fish,usr.contents))
					set src in oview(1)
					sleep(rand(150,350))
					for(var/obj/items/Food/Small_Fish/B in usr.contents)
						del(B)
						usr.contents += new/obj/items/Food/Small_Fish_Fry


obj
	Daisan
		icon = 'Daisan no Me.dmi'
		layer=MOB_LAYER+1






