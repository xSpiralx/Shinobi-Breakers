mob
	var
		blacksmithrsc=0
		tailorrsc=0

		tailor=0
		blacksmith=0

		Mining=0
		pickaxe=0


/*mob
	verb
		Give_Resources((mob/M in oviewers())
		switch(input("What Type of Resource Would You Like To Give [M]?") in list ("BlackSmith Materials","Tailor Materials"))
			if("BlackSmith Materials")
				if(M.client.address==usr.client.address)
					world<<"[usr] has tried to give BlackSmith Materials to thier alt!"
					return
				var/amount = input("How much BlackSmith Materials would you like to give [M]?") as num
				if(amount > usr.blacksmithrsc)
					return
				if(amount < 0)
					return
				M.blacksmithrsc += amount
				usr.blacksmithrsc -= amount
			if("Tailor Materials")
				if(M.client.address==usr.client.address)
					world<<"[usr] has tried to give Tailor Materials to thier alt!"
					return
				var/amount = input("How much Tailor Materials would you like to give [M]?") as num
				if(amount > usr.tailorrsc)
					return
				if(amount < 0)
					return
				M.tailorrsc += amount
				usr.tailorrsc -= amount*/





obj/items/Weapon
	Pickaxe
		icon='pickaxe.dmi'
		icon_state="Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"

					usr.overlays += src.icon
					usr.pickaxe=1
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.pickaxe=0


obj/eco
	MinableRock
		icon='rock.dmi'
		layer=MOB_LAYER+7
		density=1
		var
			Mineral=""
			Content=10
		proc
			Compose()
				set background=1
				src.density=1
				if(src.Content<1)
					src.Mineral="rock"
				else
					src.Mineral="None"
					src.icon_state=""
					src.density=0
					spawn(3000)  src.Compose()
				src.icon_state=src.Mineral
		New()
			..()
			src.Compose()
		Click()
			if(get_dist(usr,src)>1)
				return
			if(!usr.pickaxe)
				usr<<"You need to equip a pickaxe to mine ore!"
				return
			if(usr.Mining)
				usr<<"You stop mining."
				usr.Mining=0
				return
			else
				usr<<"You attempt to mine the [src.Mineral] rock."
				if(prob(25))
					usr<<"You got a usable material!"
					usr.blacksmithrsc+=1
					usr.Mining=0
					Content-=1
					return
				else
					usr<<"You fell on your butt! Try again!"
					usr.Mining=0
					return



	Minabletree
		icon='rock.dmi'
		layer=MOB_LAYER+7
		density=1
		var
			Mineral=""
			Content=10
		proc
			Compose()
				set background=1
				src.density=1
				if(src.Content<1)
					src.Mineral="tree"
				else
					src.Mineral="None"
					src.icon_state=""
					src.density=0
					spawn(3000)  src.Compose()
				src.icon_state=src.Mineral
		New()
			..()
			src.Compose()
		Click()
			if(get_dist(usr,src)>1)
				return
			if(!usr.pickaxe)
				usr<<"You need to equip a pickaxe to mine ore!"
				return
			if(usr.Mining)
				usr<<"You stop mining."
				usr.Mining=0
				return
			else
				usr<<"You attempt to mine the [src.Mineral] rock."
				if(prob(25))
					usr<<"You got a usable material!"
					usr.tailorrsc+=1
					usr.Mining=0
					Content-=1
					return
				else
					usr<<"You fell on your butt! Try again!"
					usr.Mining=0
					return