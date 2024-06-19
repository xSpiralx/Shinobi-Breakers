mob/var/tmp/Cooking=0
obj/items/Food
	Water
		icon='Fish.dmi'
		icon_state="Bottle"
		Click()
			..()
			if(src in usr.contents)
				del(src)
	Noodles
		icon='Fish.dmi'
		icon_state="Noodles"
obj/items/Cooking
	mouse_opacity=2
	var/InList=0
	var/list/Recipe=list()
	var/MINHUNGER=1
	var/MAXHUNGER=5
	Vegetable_Ramen
		icon='Ramen1.dmi'
		Recipe=list(/obj/items/Food/Noodles,/obj/items/Food/Water,/obj/items/Food/Tomato,/obj/items/Food/Turnip)
		MINHUNGER=20
		MAXHUNGER=37
	Miso_Ramen
		icon='Ramen1.dmi'
		Recipe=list(/obj/items/Food/Noodles,/obj/items/Food/Water,/obj/items/Food/Tomato)
		MINHUNGER=16
		MAXHUNGER=30
	Ramen_Noodles
		icon='Ramen1.dmi'
		Recipe=list(/obj/items/Food/Noodles,/obj/items/Food/Water,/obj/items/Food/Turnip)
		MINHUNGER=16
		MAXHUNGER=30
	Stew
		icon='Ramen1.dmi'
		Recipe=list(/obj/items/Food/Turnip,/obj/items/Food/Water,/obj/items/Food/Ramen)
		MINHUNGER=13
		MAXHUNGER=23
	Casserole
		icon='Casserole.dmi'
		Recipe=list(/obj/items/Food/Turnip,/obj/items/Food/Tomato,/obj/items/Food/Cabbage)
		MINHUNGER=16
		MAXHUNGER=30
	Click()
		..()
		if(usr.contents.Find(src))
			usr<<output("You eat the [src.name]","outputic.output")
			usr<<output("You eat the [src.name]","outputall.output")
			del(src)
			return
		if(CookCheck(usr))
			for(var/O in Recipe)
				var/obj/CO=new O
				for(var/obj/OOO in usr.contents)
					if(CO.type!=OOO.type) continue
					del(OOO)
					break
			var/obj/A=new src.type(usr)

			usr<<output("You successfully cooked a [A.name].","outputic.output")
			usr<<output("You successfully cooked a [A.name].","outputall.output")
			A.name="[usr.name]'s [A.name]"
		else
			usr<<output("You don't have the appropriate ingredients!","outputic.output")
			usr<<output("You don't have the appropriate ingredients!","outputall.output")
			return
	proc/CookCheck(mob/M)
		if(!Recipe.len) return
		var/list/FakeRecipe=list()
		for(var/O in Recipe) FakeRecipe.Add(O)
		for(var/O in Recipe)
			var/obj/CO=new O
			for(var/obj/OOOO in M.contents)
				if(OOOO.type==CO.type)
					FakeRecipe-=OOOO.type
		if(!FakeRecipe.len) return 1
		else return 0

mob/verb/
	CookFinish()
		set hidden=1
		winset(usr,"CookGrid","is-visible=false")
		usr.Cooking=0
		usr.move=1
obj
	LargeCampfire
		icon='largecampfire.dmi'
		layer=99
		mouse_opacity=2

		New()
			..()
			light = new(src.loc)
			light.color=rgb(220,220,220)
			light.mouse_opacity = 0
			on_matrix.Scale(8)
			off_matrix.Scale(0)
			animate(light,transform=on_matrix,time=5)
			sleep(6)
			// And flickering...
			animate(light,color=rgb(220,220,220),time=4,loop=-1)

		Click()
			if(get_dist(usr,src)>1) return
			if(usr.Cooking) return
			usr.Cooking=1
			usr.move=0
			var/i = input(usr,"What would you like to do?","Cooking") in list ("Recipe","Cook","Stomp out")
			switch(i)
				if("Recipe")
					winset(usr,"CookGrid","is-visible=true")
					winset(usr,"CookGrid.Grid","cells=0x0")
					var/Row = 1
					usr<<output(" ","CookGrid.Grid:1,1")
					var/list/CookTypes=typesof(/obj/items/Cooking)
					CookTypes-=/obj/items/Cooking
					for(var/O in CookTypes)
						var/obj/items/Cooking/CO=new O
						Row++
						usr << output(CO,"CookGrid.Grid:1,[Row]")
						spawn()
							while(winget(usr,"CookGrid","is-visible")=="true")
								icon_state="cooking"
								sleep(10)
						var/newrecipe="Recipe: "
						for(var/OO in CO.Recipe)
							var/obj/CCO=new OO
							newrecipe+="[CCO.name] "
						usr << output("[newrecipe]","CookGrid.Grid:2,[Row]")
					icon_state=""
				if("Cook")
					if(locate(/obj/items/Food/Big_Fish,usr.contents))
						usr.Cooking=1
						usr.move=0
						icon_state="cooking"
						usr<<output("You slowly begin cooking your food.","outputic.output")
						usr<<output("You slowly begin cooking your food.","outputall.output")
						sleep(rand(150,350))
						for(var/obj/items/Food/Big_Fish/B in usr.contents)
							del(B)
							usr.contents += new/obj/items/Food/Big_Fish_Fry
						usr<<output("You finish cooking your food.","outputic.output")
						usr<<output("You finish cooking your food.","outputall.output")
						icon_state=""
						usr.move=1
						usr.Cooking=0
						return
					if(locate(/obj/items/Food/Med_Fish,usr.contents))
						usr.Cooking=1
						usr.move=0
						icon_state="cooking"
						usr<<output("You slowly begin cooking your food.","outputic.output")
						usr<<output("You slowly begin cooking your food.","outputall.output")
						sleep(rand(150,350))
						for(var/obj/items/Food/Med_Fish/B in usr.contents)
							del(B)
							usr.contents += new/obj/items/Food/Med_Fish_Fry
						usr<<output("You slowly begin cooking your food.","outputic.output")
						usr<<output("You slowly begin cooking your food.","outputall.output")
						icon_state=""
						usr.move=1
						usr.Cooking=0
						return
					if(locate(/obj/items/Food/Med_Fish2,usr.contents))
						usr.Cooking=1
						usr.move=0
						icon_state="cooking"
						usr<<output("You slowly begin cooking your food.","outputic.output")
						usr<<output("You slowly begin cooking your food.","outputall.output")
						sleep(rand(150,350))
						for(var/obj/items/Food/Med_Fish2/B in usr.contents)
							del(B)
							usr.contents += new/obj/items/Food/Med_Fish2_Fry
						usr<<output("You finish cooking your food.","outputic.output")
						usr<<output("You finish cooking your food.","outputall.output")
						icon_state=""
						usr.move=1
						usr.Cooking=0
						return
					if(locate(/obj/items/Food/Med_Fish3,usr.contents))
						usr.Cooking=1
						usr.move=0
						icon_state="cooking"
						usr<<output("You slowly begin cooking your food.","outputic.output")
						usr<<output("You slowly begin cooking your food.","outputall.output")
						sleep(rand(150,350))
						for(var/obj/items/Food/Med_Fish3/B in usr.contents)
							del(B)
							usr.contents += new/obj/items/Food/Med_Fish3_Fry
						usr<<output("You finish cooking your food.","outputic.output")
						usr<<output("You finish cooking your food.","outputall.output")
						icon_state=""
						usr.move=1
						usr.Cooking=0
						return
					if(locate(/obj/items/Food/Small_Fish,usr.contents))
						usr.Cooking=1
						usr.move=0
						icon_state="cooking"
						usr<<output("You slowly begin cooking your food.","outputic.output")
						usr<<output("You slowly begin cooking your food.","outputall.output")
						sleep(rand(150,350))
						for(var/obj/items/Food/Small_Fish/B in usr.contents)
							del(B)
							usr.contents += new/obj/items/Food/Small_Fish_Fry
						usr<<output("You finish cooking your food.","outputic.output")
						usr<<output("You finish cooking your food.","outputall.output")
						icon_state=""
						usr.move=1
						usr.Cooking=0
						return
			usr.Cooking=0
			usr.move=1
			icon_state=""
obj
	Campfire
		icon='campfire.dmi'
		layer=500
		density=1
		mouse_opacity=2
		luminosity=6
		var
			obj/light/light
			matrix
				on_matrix = matrix()
				off_matrix = matrix()
		New()
			..()
			light = new(src.loc)
			light.color=rgb(220,220,220)
			on_matrix.Scale(8)
			off_matrix.Scale(0)
			animate(light,transform=on_matrix,time=5)
			sleep(6)
			// And flickering...
			animate(light,color=rgb(220,220,220),time=4,loop=-1)

		Click()
			if(get_dist(usr,src)>1) return
			if(usr.Cooking) return
			usr.Cooking=1
			usr.move=0
			var/i = input(usr,"What would you like to do?","Cooking") in list ("Recipe","Cook","Stomp out")
			switch(i)
				if("Recipe")
					winset(usr,"CookGrid","is-visible=true")
					winset(usr,"CookGrid.Grid","cells=0x0")
					var/Row = 1
					usr<<output(" ","CookGrid.Grid:1,1")
					var/list/CookTypes=typesof(/obj/items/Cooking)
					CookTypes-=/obj/items/Cooking
					for(var/O in CookTypes)
						var/obj/items/Cooking/CO=new O
						Row++
						usr << output(CO,"CookGrid.Grid:1,[Row]")
						spawn()
							while(winget(usr,"CookGrid","is-visible")=="true")
								icon_state="cooking"
								sleep(10)
						var/newrecipe="Recipe: "
						for(var/OO in CO.Recipe)
							var/obj/CCO=new OO
							newrecipe+="[CCO.name] "
						usr << output("[newrecipe]","CookGrid.Grid:2,[Row]")
					icon_state=""
				if("Stomp out")
					usr.Cooking=0
					usr.move=1
					for(var/mob/M in hearers(14,usr))
						M<<output("<font color = white><font color=[usr.SayFont]>[M.getStrangerName(usr)] stomps out the fire.<font color = white>","outputic.output")
						M<<output("<font color = white><font color=[usr.SayFont]>[M.getStrangerName(usr)] stomps out the fire.<font color = white>","outputall.output")
					del(src)
				if("Cook")
					if(locate(/obj/items/Food/Big_Fish,usr.contents))
						usr.Cooking=1
						usr.move=0
						icon_state="cooking"
						usr<<output("You slowly begin cooking your food.","outputic.output")
						usr<<output("You slowly begin cooking your food.","outputall.output")
						sleep(rand(150,350))
						for(var/obj/items/Food/Big_Fish/B in usr.contents)
							del(B)
							usr.contents += new/obj/items/Food/Big_Fish_Fry
						usr<<output("You finish cooking your food.","outputic.output")
						usr<<output("You finish cooking your food.","outputall.output")
						icon_state=""
						usr.move=1
						usr.Cooking=0
						return
					if(locate(/obj/items/Food/Med_Fish,usr.contents))
						usr.Cooking=1
						usr.move=0
						icon_state="cooking"
						usr<<output("You slowly begin cooking your food.","outputic.output")
						usr<<output("You slowly begin cooking your food.","outputall.output")
						sleep(rand(150,350))
						for(var/obj/items/Food/Med_Fish/B in usr.contents)
							del(B)
							usr.contents += new/obj/items/Food/Med_Fish_Fry
						usr<<output("You slowly begin cooking your food.","outputic.output")
						usr<<output("You slowly begin cooking your food.","outputall.output")
						icon_state=""
						usr.move=1
						usr.Cooking=0
						return
					if(locate(/obj/items/Food/Med_Fish2,usr.contents))
						usr.Cooking=1
						usr.move=0
						icon_state="cooking"
						usr<<output("You slowly begin cooking your food.","outputic.output")
						usr<<output("You slowly begin cooking your food.","outputall.output")
						sleep(rand(150,350))
						for(var/obj/items/Food/Med_Fish2/B in usr.contents)
							del(B)
							usr.contents += new/obj/items/Food/Med_Fish2_Fry
						usr<<output("You finish cooking your food.","outputic.output")
						usr<<output("You finish cooking your food.","outputall.output")
						icon_state=""
						usr.move=1
						usr.Cooking=0
						return
					if(locate(/obj/items/Food/Med_Fish3,usr.contents))
						usr.Cooking=1
						usr.move=0
						icon_state="cooking"
						usr<<output("You slowly begin cooking your food.","outputic.output")
						usr<<output("You slowly begin cooking your food.","outputall.output")
						sleep(rand(150,350))
						for(var/obj/items/Food/Med_Fish3/B in usr.contents)
							del(B)
							usr.contents += new/obj/items/Food/Med_Fish3_Fry
						usr<<output("You finish cooking your food.","outputic.output")
						usr<<output("You finish cooking your food.","outputall.output")
						icon_state=""
						usr.move=1
						usr.Cooking=0
						return
					if(locate(/obj/items/Food/Small_Fish,usr.contents))
						usr.Cooking=1
						usr.move=0
						icon_state="cooking"
						usr<<output("You slowly begin cooking your food.","outputic.output")
						usr<<output("You slowly begin cooking your food.","outputall.output")
						sleep(rand(150,350))
						for(var/obj/items/Food/Small_Fish/B in usr.contents)
							del(B)
							usr.contents += new/obj/items/Food/Small_Fish_Fry
						usr<<output("You finish cooking your food.","outputic.output")
						usr<<output("You finish cooking your food.","outputall.output")
						icon_state=""
						usr.move=1
						usr.Cooking=0
						return
			usr.Cooking=0
			usr.move=1
			icon_state=""
obj
	DivineTree
		icon='divinetree.dmi'
		layer=500
		density=1
		mouse_opacity=2
		luminosity=6
turf
	CookNode
		name="Stove"
		icon='insideapps.dmi'
		icon_state="stove"
		layer=90000
		density=1
		mouse_opacity=2
		Click()
			if(get_dist(usr,src)>1) return
			if(usr.Cooking) return
			icon_state="stove"
			usr.Cooking=1
			usr.move=0
			if(alert(usr,"What would you like to do, cook from a recipe, or cook your food?","Cooking","Recipe","Cook")=="Recipe")
				winset(usr,"CookGrid","is-visible=true")
				winset(usr,"CookGrid.Grid","cells=0x0")
				var/Row = 1
				usr<<output(" ","CookGrid.Grid:1,1")
				var/list/CookTypes=typesof(/obj/items/Cooking)
				CookTypes-=/obj/items/Cooking
				for(var/O in CookTypes)
					var/obj/items/Cooking/CO=new O
					Row++
					usr << output(CO,"CookGrid.Grid:1,[Row]")
					spawn()
						while(winget(usr,"CookGrid","is-visible")=="true")
							icon_state="stoveon"
							sleep(10)
					var/newrecipe="Recipe: "
					for(var/OO in CO.Recipe)
						var/obj/CCO=new OO
						newrecipe+="[CCO.name] "
					usr << output("[newrecipe]","CookGrid.Grid:2,[Row]")






			if(locate(/obj/items/Food/Big_Fish,usr.contents))
				usr.Cooking=1
				usr.move=0
				usr<<output("You slowly begin cooking your food.","outputic.output")
				usr<<output("You slowly begin cooking your food.","outputall.output")
				icon_state="stoveon"
				sleep(rand(150,350))
				for(var/obj/items/Food/Big_Fish/B in usr.contents)
					del(B)
					usr.contents += new/obj/items/Food/Big_Fish_Fry
				usr<<output("You finish cooking your food.","outputic.output")
				usr<<output("You finish cooking your food.","outputall.output")
				icon_state="stove"
				usr.move=1
				usr.Cooking=0
				return
			if(locate(/obj/items/Food/Med_Fish,usr.contents))
				usr.Cooking=1
				usr.move=0
				usr<<output("You slowly begin cooking your food.","outputic.output")
				usr<<output("You slowly begin cooking your food.","outputall.output")
				icon_state="stoveon"
				sleep(rand(150,350))
				for(var/obj/items/Food/Med_Fish/B in usr.contents)
					del(B)
					usr.contents += new/obj/items/Food/Med_Fish_Fry
				usr<<output("You finish cooking your food.","outputic.output")
				usr<<output("You finish cooking your food.","outputall.output")
				icon_state="stove"
				usr.move=1
				usr.Cooking=0
				return
			if(locate(/obj/items/Food/Med_Fish2,usr.contents))
				usr.Cooking=1
				usr.move=0
				usr<<output("You slowly begin cooking your food.","outputic.output")
				usr<<output("You slowly begin cooking your food.","outputall.output")
				icon_state="stoveon"
				sleep(rand(150,350))
				for(var/obj/items/Food/Med_Fish2/B in usr.contents)
					del(B)
					usr.contents += new/obj/items/Food/Med_Fish2_Fry
				usr<<output("You finish cooking your food.","outputic.output")
				usr<<output("You finish cooking your food.","outputall.output")
				icon_state="stove"
				usr.move=1
				usr.Cooking=0
				return
			if(locate(/obj/items/Food/Med_Fish3,usr.contents))
				usr.Cooking=1
				usr.move=0
				usr<<output("You slowly begin cooking your food.","outputic.output")
				usr<<output("You slowly begin cooking your food.","outputall.output")
				icon_state="stoveon"
				sleep(rand(150,350))
				for(var/obj/items/Food/Med_Fish3/B in usr.contents)
					del(B)
					usr.contents += new/obj/items/Food/Med_Fish3_Fry
				usr<<output("You finish cooking your food.","outputic.output")
				usr<<output("You finish cooking your food.","outputall.output")
				icon_state="stove"
				usr.move=1
				usr.Cooking=0
				return
			if(locate(/obj/items/Food/Small_Fish,usr.contents))
				usr.Cooking=1
				usr.move=0
				usr<<output("You slowly begin cooking your food.","outputic.output")
				usr<<output("You slowly begin cooking your food.","outputall.output")
				icon_state="stoveon"
				sleep(rand(150,350))
				for(var/obj/items/Food/Small_Fish/B in usr.contents)
					del(B)
					usr.contents += new/obj/items/Food/Small_Fish_Fry
				usr<<output("You finish cooking your food.","outputic.output")
				usr<<output("You finish cooking your food.","outputall.output")
				icon_state="stove"
				usr.move=1
				usr.Cooking=0
				return
			usr.Cooking=0
			usr.move=1