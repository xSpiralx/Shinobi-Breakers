mob/var/tmp/Red=0
mob/var/tmp/Green=0
mob/var/tmp/Yellow=0
mob/var/tmp/Soldier=0
mob/var/tmp/Seishingan=0
mob/var/tmp/Hero=0
mob/var/ShurikenSkill=1
mob/var/WindmillSkill=1
mob/var/KunaiSkill=1
mob/var/SenbonSkill=1
mob/var/Headbands
mob/var/OInjuries
mob/var/Obloodtype


obj/items/Ryo
	icon='Ryo.dmi'
	var/amount
	var/ipowner
	var/tmp/owner
	proc/Update()
		spawn(2)
			suffix="[amount]"
			if(amount>250&&amount<1000) icon_state = "more1"
			if(amount>=1000&&amount<5000) icon_state = "more2"
			if(amount>=5000) icon_state = "more3"
			if(amount<=0) del(src)
	New()
		..()
		spawn(2) Update()
obj/items
	layer=80
	var/worn=0
	var/subItem = 0
	Nichibotsu_Ring
		icon='Akatsuki_Ring.dmi'
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "Equipped"
				else
					src.worn = 0
					src.suffix=""

	Click()
		if(usr.MindTransfer)
			if(istype(usr.MindTransfer,/mob/Clone/))
				var/mob/Clone/M = usr.MindTransfer
				if(get_dist(src,M)<=1)
					if(istype(src,/obj/items/Ryo))
						var/hasryo=0
						if(src:ipowner==usr.client.address&&usr!=src:owner) return
						for(var/obj/items/Ryo/R in M.Contents)
							hasryo=R
						if(hasryo)
							hasryo:amount+=src:amount
							hasryo:Update()
							del(src)
							return
					if(istype(src,/obj/items/Bars))
						var/hasmineral=0
						if(src:ipowner==usr.client.address&&usr!=src:owner) return
						for(var/obj/items/Bars/R in M.Contents)
							hasmineral=R
						if(hasmineral)
							hasmineral:amount+=src:amount
							hasmineral:Update()
							del(src)
							return
					if(istype(src,/obj/items/Roots))
						var/hasmineral=0
						if(src:ipowner==usr.client.address&&usr!=src:owner) return
						for(var/obj/items/Roots/R in M.Contents)
							hasmineral=R
						if(hasmineral)
							hasmineral:amount+=src:amount
							hasmineral:Update()
							del(src)
							return
					if(istype(src,/obj/items/Cotton))
						var/hasmineral=0
						if(src:ipowner==usr.client.address&&usr!=src:owner) return
						for(var/obj/items/Cotton/R in M.Contents)
							hasmineral=R
						if(hasmineral)
							hasmineral:amount+=src:amount
							hasmineral:Update()
							del(src)
							return
					if(istype(src,/obj/items/Weapon/Shuriken))
						var/hasshuri=0
						for(var/obj/items/Weapon/Shuriken/R in M.Contents)
							hasshuri=R
						if(hasshuri)
							hasshuri:shuriken+=src:shuriken
							hasshuri:suffix = "You current have [hasshuri:shuriken] in this stack"
							del(src)
							return
					if(istype(src,/obj/items/Weapon/Senbon))
						var/hassenbon=0
						for(var/obj/items/Weapon/Senbon/R in M.Contents)
							hassenbon=R
						if(hassenbon)
							hassenbon:senbon+=src:senbon
							hassenbon:suffix = "You current have [hassenbon:senbon] in this stack"
							del(src)
							return
					if(istype(src,/obj/items/Weapon/Torch))
						icon_state="Inv"
					if(istype(src,/mob/Log/Log))
						viewers() << "<font size = -3><font color = white>(*<font color=[M.SayFont]>[M]picks up the Log<font color = white>*)"
					M.Contents+=src
					M.Capacity+=src.Weight
					src.loc=null
					for(var/mob/X in hearers(13))
						if(X.MindTransfer) if(X == X.MindTransfer.MindAfflicted) continue
						if(X.MindAfflicted)
							X.MindAfflicted << output("<font size = -3><font color = white><font color=[M.SayFont]>[X.MindAfflicted.getStrangerName(M)] picks up [src].<font color = white>","outputic.output")
							X.MindAfflicted << output("<font size = -3><font color = white><font color=[M.SayFont]>[X.MindAfflicted.getStrangerName(M)] picks up [src].<font color = white>","outputall.output")
						else
							X << output("<font size = -3><font color = white><font color=[M.SayFont]>[X.getStrangerName(M)] picks up [src].<font color = white>","outputic.output")
							X << output("<font size = -3><font color = white><font color=[M.SayFont]>[X.getStrangerName(M)] picks up [src].<font color = white>","outputall.output")

		..()
	verb
		Pick_Up()
			set src in oview(1)
			if(istype(src,/obj/items/Ryo))
				var/hasryo=0
				if(src:ipowner==usr.client.address&&usr!=src:owner) return
				for(var/obj/items/Ryo/R in usr.contents)
					hasryo=R
				if(hasryo)
					hasryo:amount+=src:amount
					hasryo:Update()
					del(src)
					return
			if(istype(src,/obj/items/Bars))
				var/hasmineral=0
				if(src:ipowner==usr.client.address&&usr!=src:owner) return
				for(var/obj/items/Bars/R in usr.contents)
					hasmineral=R
				if(hasmineral)
					hasmineral:amount+=src:amount
					hasmineral:Update()
					del(src)
					return
			if(istype(src,/obj/items/TungstenBars))
				var/hasmineral=0
				if(src:ipowner==usr.client.address&&usr!=src:owner) return
				for(var/obj/items/TungstenBars/R in usr.contents)
					hasmineral=R
				if(hasmineral)
					hasmineral:amount+=src:amount
					hasmineral:Update()
					del(src)
					return
			if(istype(src,/obj/items/AdamantineBars))
				var/hasmineral=0
				if(src:ipowner==usr.client.address&&usr!=src:owner) return
				for(var/obj/items/AdamantineBars/R in usr.contents)
					hasmineral=R
				if(hasmineral)
					hasmineral:amount+=src:amount
					hasmineral:Update()
					del(src)
					return
			if(istype(src,/obj/items/Roots))
				var/hasmineral=0
				if(src:ipowner==usr.client.address&&usr!=src:owner) return
				for(var/obj/items/Roots/R in usr.contents)
					hasmineral=R
				if(hasmineral)
					hasmineral:amount+=src:amount
					hasmineral:Update()
					del(src)
					return
			if(istype(src,/obj/items/Cotton))
				var/hasmineral=0
				if(src:ipowner==usr.client.address&&usr!=src:owner) return
				for(var/obj/items/Cotton/R in usr.contents)
					hasmineral=R
				if(hasmineral)
					hasmineral:amount+=src:amount
					hasmineral:Update()
					del(src)
					return
			if(istype(src,/obj/items/Wood))
				var/hasmineral=0
				if(src:ipowner==usr.client.address&&usr!=src:owner) return
				for(var/obj/items/Wood/R in usr.contents)
					hasmineral=R
				if(hasmineral)
					hasmineral:amount+=src:amount
					hasmineral:Update()
					del(src)
					return
			if(istype(src,/obj/items/Missions/Trash_1))
				usr.Trash+=1
			if(istype(src,/obj/items/Missions/Trash_2))
				usr.Trash+=1
			if(istype(src,/obj/items/Weapon/Windmill))
				var/hasmill=0
				for(var/obj/items/Weapon/Windmill/R in usr.contents)
					hasmill=R
				if(hasmill)
					hasmill:shuriken+=src:shuriken
					hasmill:suffix = "You current have [hasmill:shuriken] in this stack"
					del(src)
					return
			if(istype(src,/obj/items/Weapon/Dagger))
				var/hasdagger=0
				for(var/obj/items/Weapon/Dagger/R in usr.contents)
					hasdagger=R
				if(hasdagger)
					hasdagger:shuriken+=src:shuriken
					hasdagger:suffix = "You current have [hasdagger:shuriken] in this stack"
					del(src)
					return
			if(istype(src,/obj/items/Weapon/Katana))
				var/haskatana=0
				for(var/obj/items/Weapon/Katana/R in usr.contents)
					haskatana=R
				if(haskatana)
					haskatana:shuriken+=src:shuriken
					haskatana:suffix = "You current have [haskatana:shuriken] in this stack"
					del(src)
					return
			if(istype(src,/obj/items/Weapon/Explosive_Tag))
				var/hastag=0
				for(var/obj/items/Weapon/Explosive_Tag/R in usr.contents)
					hastag=R
				if(hastag)
					hastag:shuriken+=src:shuriken
					hastag:suffix = "You current have [hastag:shuriken] in this stack"
					del(src)
					return
			if(istype(src,/obj/items/Weapon/Kunai))
				var/haskunai=0
				for(var/obj/items/Weapon/Kunai/R in usr.contents)
					haskunai=R
				if(haskunai)
					haskunai:shuriken+=src:shuriken
					haskunai:suffix = "You current have [haskunai:shuriken] in this stack"
					del(src)
					return
			if(istype(src,/obj/items/Weapon/Shuriken))
				var/hasshuri=0
				for(var/obj/items/Weapon/Shuriken/R in usr.contents)
					hasshuri=R
				if(hasshuri)
					hasshuri:shuriken+=src:shuriken
					hasshuri:suffix = "You current have [hasshuri:shuriken] in this stack"
					del(src)
					return
			if(istype(src,/obj/items/Weapon/Senbon))
				var/hassenbon=0
				for(var/obj/items/Weapon/Senbon/R in usr.contents)
					hassenbon=R
				if(hassenbon)
					hassenbon:senbon+=src:senbon
					hassenbon:suffix = "You current have [hassenbon:senbon] in this stack"
					del(src)
					return
			if(istype(src,/obj/items/Weapon/Torch))
				icon_state="Inv"
			if(istype(src,/mob/Log/Log))
				viewers() << "<font size = -3><font color = white>(*<font color=[usr.SayFont]>[usr]picks up the Log<font color = white>*)"
			src.Move(usr)
			for(var/mob/M in hearers(13))
				M << output("<font size = -3><font color = white><font color=[usr.SayFont]>[M.getStrangerName(usr)] picks up [src].<font color = white>","outputic.output")
				M << output("<font size = -3><font color = white><font color=[usr.SayFont]>[M.getStrangerName(usr)] picks up [src].<font color = white>","outputall.output")

		Drop()
			set src in usr.contents
			if(src.subItem)
				return
			if(istype(src,/obj/items/Weapon/Torch))
				icon_state="Burning"
			if(istype(src,/obj/items/Ryo))
				var/amounts = input(usr,"How much Ryo would you like to drop?","Drop",1) as num
				if(!isnum(amounts)) return
				if(amounts>src:amount||amounts<=0) return
				var/decimal=num2text(amounts)
				if(findtext(decimal,".",1,0)) return
				src:Update()
				var/obj/items/Ryo/R=new(usr.loc)
				R:amount=amounts
				src:amount-=amounts
				R:ipowner=usr.client.address
				R:owner=usr
				step(R,usr.dir)
				R:Update()
				if(R.loc)
					for(var/mob/M in R.loc)
						if(M&&M.client)
							if(M.client.address==usr.client.address) return
							for(var/mob/hearer in hearers(15,M))
								hearer<<output("<font size = -3>[hearer.getStrangerName(usr)] hands [hearer.getStrangerName(M)] a stack of [R] ([R:amount]).","outputic.output")
								hearer<<output("<font size = -3>[hearer.getStrangerName(usr)] hands [hearer.getStrangerName(M)] a stack of [R] ([R:amount]).","outputall.output")
							R.Move(M)
							break
				return
			if(istype(src,/obj/items/Bars))
				var/amounts = input(usr,"How many minerals would you like to drop?","Drop",1) as num
				if(!isnum(amounts)) return
				if(amounts>src:amount||amounts<=0) return
				var/decimal=num2text(amounts)
				if(findtext(decimal,".",1,0)) return
				var/obj/items/Bars/R=new(usr.loc)
				R:amount=amounts
				src:amount-=amounts
				R:ipowner=usr.client.address
				R:owner=usr
				step(R,usr.dir)
				src:Update()
				if(R.loc)
					for(var/mob/M in R.loc)
						if(M&&M.client)
							if(M.client.address==usr.client.address) return
							for(var/mob/hearer in hearers(15,M))
								hearer<<output("<font size = -3>[hearer.getStrangerName(usr)] hands [hearer.getStrangerName(M)] a stack of [R] ([R:amount]).","outputic.output")
								hearer<<output("<font size = -3>[hearer.getStrangerName(usr)] hands [hearer.getStrangerName(M)] a stack of [R] ([R:amount]).","outputall.output")
							R.Move(M)
							break
				return
			if(istype(src,/obj/items/TungstenBars))
				var/amounts = input(usr,"How many minerals would you like to drop?","Drop",1) as num
				if(!isnum(amounts)) return
				if(amounts>src:amount||amounts<=0) return
				var/decimal=num2text(amounts)
				if(findtext(decimal,".",1,0)) return
				var/obj/items/TungstenBars/R=new(usr.loc)
				R:amount=amounts
				src:amount-=amounts
				R:ipowner=usr.client.address
				R:owner=usr
				step(R,usr.dir)
				src:Update()
				if(R.loc)
					for(var/mob/M in R.loc)
						if(M&&M.client)
							if(M.client.address==usr.client.address) return
							for(var/mob/hearer in hearers(15,M))
								hearer<<output("<font size = -3>[hearer.getStrangerName(usr)] hands [hearer.getStrangerName(M)] a stack of [R] ([R:amount]).","outputic.output")
								hearer<<output("<font size = -3>[hearer.getStrangerName(usr)] hands [hearer.getStrangerName(M)] a stack of [R] ([R:amount]).","outputall.output")
							R.Move(M)
							break
				return
			if(istype(src,/obj/items/AdamantineBars))
				var/amounts = input(usr,"How many minerals would you like to drop?","Drop",1) as num
				if(!isnum(amounts)) return
				if(amounts>src:amount||amounts<=0) return
				var/decimal=num2text(amounts)
				if(findtext(decimal,".",1,0)) return
				var/obj/items/AdamantineBars/R=new(usr.loc)
				R:amount=amounts
				src:amount-=amounts
				R:ipowner=usr.client.address
				R:owner=usr
				step(R,usr.dir)
				src:Update()
				if(R.loc)
					for(var/mob/M in R.loc)
						if(M&&M.client)
							if(M.client.address==usr.client.address) return
							for(var/mob/hearer in hearers(15,M))
								hearer<<output("<font size = -3>[hearer.getStrangerName(usr)] hands [hearer.getStrangerName(M)] a stack of [R] ([R:amount]).","outputic.output")
								hearer<<output("<font size = -3>[hearer.getStrangerName(usr)] hands [hearer.getStrangerName(M)] a stack of [R] ([R:amount]).","outputall.output")
							R.Move(M)
							break
				return

			if(istype(src,/obj/items/Cotton))
				var/amounts = input(usr,"How much cotton would you like to drop?","Drop",1) as num
				if(!isnum(amounts)) return
				if(amounts>src:amount||amounts<=0) return
				var/decimal=num2text(amounts)
				if(findtext(decimal,".",1,0)) return
				var/obj/items/Cotton/R=new(usr.loc)
				R:amount=amounts
				src:amount-=amounts
				R:ipowner=usr.client.address
				R:owner=usr
				step(R,usr.dir)
				src:Update()
				if(R.loc)
					for(var/mob/M in R.loc)
						if(M&&M.client)
							if(M.client.address==usr.client.address) return
							for(var/mob/hearer in hearers(15,M))
								hearer<<output("<font size = -3>[hearer.getStrangerName(usr)] hands [hearer.getStrangerName(M)] a stack of [R] ([R:amount]).","outputic.output")
								hearer<<output("<font size = -3>[hearer.getStrangerName(usr)] hands [hearer.getStrangerName(M)] a stack of [R] ([R:amount]).","outputall.output")
							R.Move(M)
							break
				return
			if(istype(src,/obj/items/Wood))
				var/amounts = input(usr,"How much cotton would you like to drop?","Drop",1) as num
				if(!isnum(amounts)) return
				if(amounts>src:amount||amounts<=0) return
				var/decimal=num2text(amounts)
				if(findtext(decimal,".",1,0)) return
				var/obj/items/Wood/R=new(usr.loc)
				R:amount=amounts
				src:amount-=amounts
				R:ipowner=usr.client.address
				R:owner=usr
				step(R,usr.dir)
				src:Update()
				if(R.loc)
					for(var/mob/M in R.loc)
						if(M&&M.client)
							if(M.client.address==usr.client.address) return
							for(var/mob/hearer in hearers(15,M))
								hearer<<output("<font size = -3>[hearer.getStrangerName(usr)] hands [hearer.getStrangerName(M)] a stack of [R] ([R:amount]).","outputic.output")
								hearer<<output("<font size = -3>[hearer.getStrangerName(usr)] hands [hearer.getStrangerName(M)] a stack of [R] ([R:amount]).","outputall.output")
							R.Move(M)
							break
				return
			if(istype(src,/obj/items/Roots))
				var/amounts = input(usr,"How many roots would you like to drop?","Drop",1) as num
				if(!isnum(amounts)) return
				if(amounts>src:amount||amounts<=0) return
				var/decimal=num2text(amounts)
				if(findtext(decimal,".",1,0)) return
				var/obj/items/Roots/R=new(usr.loc)
				R:amount=amounts
				src:amount-=amounts
				R:ipowner=usr.client.address
				R:owner=usr
				step(R,usr.dir)
				src:Update()
				if(R.loc)
					for(var/mob/M in R.loc)
						if(M&&M.client)
							if(M.client.address==usr.client.address) return
							for(var/mob/hearer in hearers(15,M))
								hearer<<output("<font size = -3>[hearer.getStrangerName(usr)] hands [hearer.getStrangerName(M)] a stack of [R] ([R:amount]).","outputic.output")
								hearer<<output("<font size = -3>[hearer.getStrangerName(usr)] hands [hearer.getStrangerName(M)] a stack of [R] ([R:amount]).","outputall.output")
							R.Move(M)
							break
				return
			if(istype(src,/obj/items/Weapon/Dagger))
				var/amount = input(usr,"How many daggers would you like to drop? you current have [src:shuriken] in this stack.\n(Enter 0 to cancel)") as num
				if(amount==0||amount>src:shuriken||amount<=0)
					return
				var/decimal=num2text(amount)
				if(findtext(decimal,".",1,0)) return
				src:shuriken-=amount
				suffix = "You current have [src:shuriken] in this stack"
				var/obj/items/Weapon/Dagger/A = new
				A.shuriken=amount
				if(A.shuriken<=0)
					del(src)
				A.Move(usr.loc)
				step(A,usr.dir)
				if(src:shuriken<=0) del(src)
				if(src.loc)
					for(var/mob/M in src.loc)
						if(M&&M.client)
							if(M.client.address==usr.client.address) return
							for(var/mob/hearer in hearers(15,M))
								hearer<<output("<font size = -3>[hearer.getStrangerName(usr)] hands [hearer.getStrangerName(M)] some [src].","outputic.output")
								hearer<<output("<font size = -3>[hearer.getStrangerName(usr)] hands [hearer.getStrangerName(M)] some [src].","outputall.output")
							src.Move(M)
							break
				return
			if(istype(src,/obj/items/Weapon/Katana))
				var/amount = input(usr,"How many katana would you like to drop? you current have [src:shuriken] in this stack.\n(Enter 0 to cancel)") as num
				if(amount==0||amount>src:shuriken||amount<=0)
					return
				var/decimal=num2text(amount)
				if(findtext(decimal,".",1,0)) return
				src:shuriken-=amount
				suffix = "You current have [src:shuriken] in this stack"
				var/obj/items/Weapon/Katana/A = new
				A.shuriken=amount
				if(A.shuriken<=0)
					del(src)
				A.Move(usr.loc)
				step(A,usr.dir)
				if(src:shuriken<=0) del(src)
				if(src.loc)
					for(var/mob/M in src.loc)
						if(M&&M.client)
							if(M.client.address==usr.client.address) return
							for(var/mob/hearer in hearers(15,M))
								hearer<<output("<font size = -3>[hearer.getStrangerName(usr)] hands [hearer.getStrangerName(M)] some [src].","outputic.output")
								hearer<<output("<font size = -3>[hearer.getStrangerName(usr)] hands [hearer.getStrangerName(M)] some [src].","outputall.output")
							src.Move(M)
							break
				return
			if(istype(src,/obj/items/Weapon/Windmill))
				var/amount = input(usr,"How many windmills would you like to drop? you current have [src:shuriken] in this stack.\n(Enter 0 to cancel)") as num
				if(amount==0||amount>src:shuriken||amount<=0)
					return
				var/decimal=num2text(amount)
				if(findtext(decimal,".",1,0)) return
				src:shuriken-=amount
				suffix = "You current have [src:shuriken] in this stack"
				var/obj/items/Weapon/Windmill/A = new
				A.shuriken=amount
				if(A.shuriken<=0)
					del(src)
				A.Move(usr.loc)
				step(A,usr.dir)
				if(src:shuriken<=0) del(src)
				if(src.loc)
					for(var/mob/M in src.loc)
						if(M&&M.client)
							if(M.client.address==usr.client.address) return
							for(var/mob/hearer in hearers(15,M))
								hearer<<output("<font size = -3>[hearer.getStrangerName(usr)] hands [hearer.getStrangerName(M)] some [src].","outputic.output")
								hearer<<output("<font size = -3>[hearer.getStrangerName(usr)] hands [hearer.getStrangerName(M)] some [src].","outputall.output")
							src.Move(M)
							break
				return
			if(istype(src,/obj/items/Weapon/Explosive_Tag))
				var/amount = input(usr,"How many explosive tags would you like to drop? you current have [src:shuriken] in this stack.\n(Enter 0 to cancel)") as num
				if(amount==0||amount>src:shuriken||amount<=0)
					return
				var/decimal=num2text(amount)
				if(findtext(decimal,".",1,0)) return
				src:shuriken-=amount
				suffix = "You current have [src:shuriken] in this stack"
				var/obj/items/Weapon/Explosive_Tag/A = new
				A.shuriken=amount
				if(A.shuriken<=0)
					del(src)
				A.Move(usr.loc)
				step(A,usr.dir)
				if(src:shuriken<=0) del(src)
				if(src.loc)
					for(var/mob/M in src.loc)
						if(M&&M.client)
							if(M.client.address==usr.client.address) return
							for(var/mob/hearer in hearers(15,M))
								hearer<<output("<font size = -3>[hearer.getStrangerName(usr)] hands [hearer.getStrangerName(M)] some [src].","outputic.output")
								hearer<<output("<font size = -3>[hearer.getStrangerName(usr)] hands [hearer.getStrangerName(M)] some [src].","outputall.output")
							src.Move(M)
							break
				return
			if(istype(src,/obj/items/Weapon/Kunai))
				var/amount = input(usr,"How many kunai would you like to drop? you current have [src:shuriken] in this stack.\n(Enter 0 to cancel)") as num
				if(amount==0||amount>src:shuriken||amount<=0)
					return
				var/decimal=num2text(amount)
				if(findtext(decimal,".",1,0)) return
				src:shuriken-=amount
				suffix = "You current have [src:shuriken] in this stack"
				var/obj/items/Weapon/Kunai/A = new
				A.shuriken=amount
				if(A.shuriken<=0)
					del(src)
				A.Move(usr.loc)
				step(A,usr.dir)
				if(src:shuriken<=0) del(src)
				if(src.loc)
					for(var/mob/M in src.loc)
						if(M&&M.client)
							if(M.client.address==usr.client.address) return
							for(var/mob/hearer in hearers(15,M))
								hearer<<output("<font size = -3>[hearer.getStrangerName(usr)] hands [hearer.getStrangerName(M)] some [src].","outputic.output")
								hearer<<output("<font size = -3>[hearer.getStrangerName(usr)] hands [hearer.getStrangerName(M)] some [src].","outputall.output")
							src.Move(M)
							break
				return
			if(istype(src,/obj/items/Weapon/Shuriken))
				var/amount = input(usr,"How many shuriken would you like to drop? you current have [src:shuriken] in this stack.\n(Enter 0 to cancel)") as num
				if(amount==0||amount>src:shuriken||amount<=0)
					return
				var/decimal=num2text(amount)
				if(findtext(decimal,".",1,0)) return
				src:shuriken-=amount
				suffix = "You current have [src:shuriken] in this stack"
				var/obj/items/Weapon/Shuriken/A = new
				A.shuriken=amount
				if(A.shuriken<=0)
					del(src)
				A.Move(usr.loc)
				step(A,usr.dir)
				if(src:shuriken<=0) del(src)
				if(src.loc)
					for(var/mob/M in src.loc)
						if(M&&M.client)
							if(M.client.address==usr.client.address) return
							for(var/mob/hearer in hearers(15,M))
								hearer<<output("<font size = -3>[hearer.getStrangerName(usr)] hands [hearer.getStrangerName(M)] some [src].","outputic.output")
								hearer<<output("<font size = -3>[hearer.getStrangerName(usr)] hands [hearer.getStrangerName(M)] some [src].","outputall.output")
							src.Move(M)
							break
				return
			if(istype(src,/obj/items/Weapon/Log))
				var/mob/Log/Log/A = new
				A.loc=usr.loc
				A.Health=100
				A.MaxHealth=100
				A.Defence=usr.Defence/5
				A.attackable=1
				A.Savable=0
				del(src)
			if(istype(src,/obj/items/Weapon/Senbon))
				var/amount = input(usr,"How many senbon would you like to drop? you current have [src:senbon] in this stack.\n(Enter 0 to cancel)") as num
				if(amount==0||amount>src:senbon||amount<=0)
					return
				var/decimal=num2text(amount)
				if(findtext(decimal,".",1,0)) return
				src:senbon-=amount
				suffix = "You current have [src:senbon] in this stack"
				var/obj/items/Weapon/Senbon/A = new
				A.senbon=amount
				if(A.senbon<=0)
					del(src)
				A.Move(usr.loc)
				step(A,usr.dir)
				if(src:senbon<=0) del(src)
				if(src.loc)
					for(var/mob/M in src.loc)
						if(M&&M.client)
							if(M.client.address==usr.client.address) return
							for(var/mob/hearer in hearers(15,M))
								hearer<<output("<font size = -3>[hearer.getStrangerName(usr)] hands [hearer.getStrangerName(M)] some [src].","outputic.output")
								hearer<<output("<font size = -3>[hearer.getStrangerName(usr)] hands [hearer.getStrangerName(M)] some [src].","outputall.output")
							src.Move(M)
							break
				return
			if(!src.worn)
				src.Move(usr.loc)
				step(src,usr.dir)
				if(src.loc)
					for(var/mob/M in src.loc)
						if(M&&M.client)
							if(M.client.address==usr.client.address) return

							for(var/mob/hearer in hearers(15,M))
								hearer<<output("<font size = -3>[hearer.getStrangerName(usr)] hands [hearer.getStrangerName(M)] a [src].","outputic.output")
								hearer<<output("<font size = -3>[hearer.getStrangerName(usr)] hands [hearer.getStrangerName(M)] a [src].","outputall.output")
							src.Move(M)
							break
	InuzukaEyeMarkings
		name = "Inuzuka Eye Makeup"
		icon = 'InuMarkings.dmi'
		icon_state="Inv"
	AcadFemale
		name="Academy Uniform"
		icon='academyfemale.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	AcadMale
		name="Academy Uniform"
		icon='academymale1.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Nichibotsu_Cloak
		name="Akatsuki Cloak"
		icon='Akatsuki_Cloak.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Tobi_Mask
		icon='Tobi.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon


obj/items/Pills
	Akimichi_Pills
		icon='Pills.dmi'

		craftRank = "Pharmacist"
		craftChance = 30
		craftCost = 70

		verb/Open()
			set src in usr.contents
			var/obj/items/Pills/Green/A = new()
			var/obj/items/Pills/Yellow/B = new()
			var/obj/items/Pills/Red/C = new()
			usr.contents += A
			usr.contents += B
			usr.contents += C
			del(src)

	Soldier_Pill
		icon='Pills.dmi'
		icon_state="4"

		craftRank = "Pharmacist"
		craftChance = 40
		craftCost = 35

		Click()
			..()
			if(src in usr.contents)
				if(usr.Health<10)
					return
				if(usr.Soldier)
					return
				usr.Health -=(usr.MaxHealth*0.20)
				usr.Stamina -=(usr.MaxStamina*0.50)
				usr.Taijutsu *= 1.5
				usr.Defence *= 1.7
				usr.Chakra *= 1.7
				usr.Soldier=1
				del(src)
				sleep(300)
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Defence = usr.MaxDefence
				usr.Chakra = usr.MaxChakra/2
				usr.Soldier=0

	Seishingan_drug
		icon='CS.dmi'
		icon_state="Seishingan drug"
		Click()
			..()
			if(src in usr.contents)
				if(usr.Seishingan)
					return
				usr.Poison=1
				usr.Seishingan=1
				spawn(30)
				usr.Poison()
				sleep(800)
				usr.Poison=0
				del(src)

	Green
		icon='Pills.dmi'
		icon_state="1"
		Click()
			..()
			if(src in usr.contents)
				if(usr.Health<=25)
					return
				if(usr.Yellow)
					return
				if(usr.Red)
					return
				usr.Health -=25
				usr.Taijutsu *= 2
				usr.Defence *= 2.7
				usr.contents += new/obj/Ninjutsu/Bubun_Baika_no_Jutsu
				usr.Green=1
				del(src)
				sleep(300)
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Defence = usr.MaxDefence
				usr.Green=0
	Yellow
		icon='Pills.dmi'
		icon_state="2"
		Click()
			..()
			if(src in usr.contents)
				if(usr.Health<10)
					return
				if(usr.Green)
					return
				if(usr.Red)
					return
				usr.Health -=50
				usr.Taijutsu *= 3.8
				usr.Defence *= 4
				usr.Yellow=1
				del(src)
				sleep(500)
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Defence = usr.MaxDefence
				usr.Yellow=0
	Red
		icon='Pills.dmi'
		icon_state="3"
		Click()
			..()
			if(src in usr.contents)
				if(usr.Health<=75)
					return
				if(usr.Yellow)
					return
				if(usr.Green)
					return
				usr.Health -=75
				usr.Taijutsu *= 7.8
				usr.Defence *= 5
				usr.Agility *= 6
				usr.overlays += 'Wings.dmi'
				usr.Red=1
				usr.contents += new/obj/Taijutsu/Choudan_Bakugeki
				del(src)
				sleep(800)
				usr.overlays -= 'Wings.dmi'
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Defence = usr.MaxDefence
				usr.Agility = usr.MaxAgility
				usr.Red=0
				usr.contents -= /obj/Taijutsu/Choudan_Bakugeki

	Heros_Water
		icon='Heros Water.dmi'
		icon_state=""
		Click()
			..()
			if(src in usr.contents)
				if(usr.Health<=75)
					return
				usr.Stamina = (usr.MaxStamina/2)
				usr.Health = usr.MaxHealth
				usr.Chakra *= 10
				usr.Ninjutsu *= 6.2
				usr.Taijutsu *= 7.8
				usr.Defence *= 5
				usr.Agility *= 6
				usr.overlays += 'Heros Chakra.dmi'
				usr.Hero=1
				del(src)
				sleep(1)
				usr.overlays -= 'Heros Chakra.dmi'
				usr.MaxTaijutsu /= 2
				usr.MaxDefence /= 2
				usr.MaxAgility /= 2
				usr.Ninjutsu = usr.MaxNinjutsu
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Defence = usr.MaxDefence
				usr.Agility = usr.MaxAgility
				usr.Hero=0



obj/items/Scrolls
	Nichibotsu_Clothing
		name="Akatsuki Clothing"
		icon='Mscroll.dmi'
		icon_state="5"
		verb/Summon_Clothing()
			set src in usr.contents
			var/obj/items/Clothing/Nichibotsu_Cloak/A = new()
			var/obj/items/Clothing/Nichibotsu_Hat/B = new()
			usr.contents += A
			usr.contents += B
	Earth_Scroll
		icon='scroll1.dmi'
		icon_state="Earth"
	Heaven_Scroll
		icon='scroll1.dmi'
		icon_state="Heaven"
	Scroll
		var/Sealed=0
		var/readstate="read"
		var/defaultstate=""
		icon='Mscroll.dmi'
		var/profile2={"<html><head><center><title>Scroll</title></center></head><body>Text goes here</body>"}
		verb/Seal_Scroll()
			if(alert(usr,"Are you sure you want to do this? It will permanently prevent anything from being modified.","Alert","Yes","No")=="No") return
			Sealed=1
		verb/Write_Scroll()
			if(Sealed)
				usr<<output("<font size = -3>This scroll is sealed.","outputic.output")
				usr<<output("<font size = -3>This scroll is sealed.","outputall.output")
				return
			profile2=input(usr,"Edit","Edit Profile",profile2) as message
		verb/Rename_Scroll()
			if(Sealed)
				usr<<output("<font size = -3>This scroll is sealed.","outputic.output")
				usr<<output("<font size = -3>This scroll is sealed.","outputall.output")
				return
			name=input(usr,"Edit Name","Edit Name",name) as text
			if(length(name)>20 || length(name)<3)
				usr.custom_alert("The name must be between 3 and 20 characters.")
				src.name = "Scroll"
				return
			if(uppertext(src.name) == src.name)
				usr.custom_alert("Your name may not consist entirely of capital letters.")
				src.name = "Scroll"
				return
			if(filter_characters(src.name)!=src.name)
				usr.custom_alert("\"[src.name]\" contains an invalid character.  Allowed characters are:\n[allowed_characters_name]")
				name = "Scroll"
				return
			if(name==""||findtext(name,"\n"))
				usr.custom_alert("You name contains an invalid character.")
				name="Scroll"
				return

		Click()
			if(src in usr.contents)
				usr<<browse(src.profile2,"window=[src];size=500x350")
				icon_state=readstate
				sleep(50)
				icon_state=defaultstate
		New()
			..()
			if(prob(50))
				icon='scroll1.dmi'
				icon_state="scroll2"
				defaultstate="scroll2"
				readstate="read2"
	BingoBook
		icon='Icons/The Extras!/Bingo Book.dmi'
		var/profile10={"<html><head><center><title>Bingo Book</title></center></head><body>Text goes here</body>"}
		verb/Write_Book()
			profile10=input(usr,"Edit","Edit Profile",profile10) as message
		Click()
			..()
			if(src in usr.contents)
				usr<<browse(src.profile10,"window=[src];size=500x350")
				icon_state="read"
				sleep(50)
				icon_state=""
	Weapon_Scroll
		name="Weapons Scroll"
		icon='Mscroll.dmi'
		Click()
			..()
			if(src in usr.contents)
				var/obj/items/Weapon/Kunai/A = new()
				var/obj/items/Weapon/Windmill/B = new()
				var/obj/items/Weapon/Shuriken/C = new()
				usr.contents += A
				usr.contents += B
				usr.contents += C
				icon_state="read"
				del(src)
	Kage_Clothing
		name="Hokage Clothing"
		icon='Mscroll.dmi'
		verb/Summon_Clothing()
			set src in usr.contents
			var/obj/items/Clothing/Kage_Suit/A = new()
			var/obj/items/Clothing/Kage_Hat/B = new()
			usr.contents += A
			usr.contents += B
	MizuKage_Clothing
		icon='Mscroll.dmi'
		verb/Summon_Clothing()
			set src in usr.contents
			var/obj/items/Clothing/MizuKage_Suit/A = new()
			var/obj/items/Clothing/MizuKage_Hat/B = new()
			usr.contents += A
			usr.contents += B
	KazeKage_Clothing
		icon='Mscroll.dmi'
		verb/Summon_Clothing()
			set src in usr.contents
			var/obj/items/Clothing/KazeKage_Suit/A = new()
			var/obj/items/Clothing/KazeKage_Hat/B = new()
			usr.contents += A
			usr.contents += B
	TsuchiKage_Clothing
		icon='Scrolls.dmi'
		verb/Summon_Clothing()
			set src in usr.contents
			var/obj/items/Clothing/TsuchiKage_Suit/A = new()
			var/obj/items/Clothing/TsuchiKage_Hat/B = new()
			usr.contents += A
			usr.contents += B
	Toad_Summoning
		icon='scroll1.dmi'
		icon_state="Tscroll"
		var/Kuchiyoseskill=1
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
					usr.overlays -= src.icon
		verb/Summon_Gamatumichi()
			set src in usr.contents
			for(var/mob/Summoning/Big_Frog/E in world)
				if(E.Owner==usr.key)
					usr << "You may only summon one Toad at a time."
					return
			if(usr.Chakra<usr.MaxChakra*(0.80/Kuchiyoseskill))
				return
			if(!usr.move)
				return
				if(prob(10/Kuchiyoseskill/Kuchiyoseskill/Kuchiyoseskill))
					usr<<"Your understanding of the Kuchiyose no Jutsu has increased."
					Kuchiyoseskill+=1
			usr.Jutsu_Gain()
			usr.MaxNinjutsu += (1 *0.002)
			usr.Chakra-=usr.MaxChakra*(0.80/Kuchiyoseskill)
			var/mob/Summoning/Big_Frog/E = new()
			E.Owner = usr.key
			E.loc = usr.loc
			E.Health=100
			E.MaxHealth=100
			E.Chakra=usr.Chakra/1.5*rand(1.5,3)
			E.MaxChakra=usr.MaxChakra/1.5*rand(1.5,3)
			E.Strength=usr.Strength/1.5*rand(1.5,3)
			E.Agility=usr.Agility/2.5*rand(1.5,3)
			E.Defence=usr.Defence/2*rand(1.5,3)
			E.Control=usr.Control/1*rand(1.5,3)
			E.Resistance=usr.Resistance/1.5*rand(1.5,3)
			E.Taijutsu=usr.Taijutsu/1.5*rand(1.5,3)
			E.Ninjutsu=usr.Ninjutsu/2*rand(1.5,3)
			E.Genjutsu=usr.Genjutsu/1*rand(1.5,3)

			icon_state="Tread"
			sleep(50)
			icon_state="Tscroll"
obj/items/Clothing
	Custom_Clothing
		name="Custom Clothing"
		icon='academymale1.dmi'
		icon_state="Inv"
		var/changed=0

		craftRank = "Tailor"
		craftChance = 60
		craftCost = 60

		verb/Set_Icon()
			if(changed) return
			if(alert(usr,"Are you sure you want to set an icon? You can only do this once.","Alert","Yes","No")=="No") return
			src.icon=input("Please select an icon.") as icon
			changed=1
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
					usr.overlays -= src.icon

	Custom_Equipment
		icon='academymale1.dmi'
		icon_state="Inv"
		var/changed=0
		name = "Custom Armor"
		craftRank = "Veteran Blacksmith"
		craftChance = 60
		craftCost = 9000

		verb/Set_Icon()
			if(changed) return
			if(alert(usr,"Are you sure you want to set an icon? You can only do this once.","Alert","Yes","No")=="No") return
			src.icon=input("Please select an icon.") as icon
			changed=1
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
					usr.overlays -= src.icon
	Custom_Weapon
		icon='academymale1.dmi'
		icon_state="Inv"
		var/changed=0

		craftRank = "Veteran Blacksmith"
		craftChance = 60
		craftCost = 9000

		verb/Set_Icon()
			if(changed) return
			if(alert(usr,"Are you sure you want to set an icon? You can only do this once.","Alert","Yes","No")=="No") return
			src.icon=input("Please select an icon.") as icon
			changed=1
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
					usr.overlays -= src.icon
	BYONDHat
		name="BYOND Hat"
		icon='BYONDMEMHAT.dmi'
		icon_state="Inv"
		var/icon/HairIcon
		var/HairColor
		Drop()
			if(!usr.Admin)
				usr<<output("<font size = -3>You can't seem to drop this.","outputic.output")
				usr<<output("<font size = -3>You can't seem to drop this.","outputall.output")
				return
			..()
		Pick_Up()
			if(!usr.Admin)
				usr<<output("<font size = -3>It slips through your grasp!","outputic.output")
				usr<<output("<font size = -3>It slips through your grasp!","outputall.output")
				return
			..()
		verb/ColorHair()
			set name="Hat Hair Color"
			var/list/colors=usr.ColorInput("Please select your hat hair color")
			HairColor=colors
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)
					if(!usr.client.IsByondMember()&&!usr.Admin)
						usr<<output("<font size = -3>This hat slips off your head!","outputic.output")
						usr<<output("<font size = -3>This hat slips off your head!","outputall.output")
						return
					src.worn = 1
					src.suffix = "Equipped"
					if(usr.Gender=="female")
						HairIcon='BYONDMEMHAThairoverlayFemale.dmi'
						HairIcon+=HairColor
					else
						HairIcon='BYONDMEMHAThairoverlayMale.dmi'
						HairIcon+=HairColor
					usr.overlays+=HairIcon
					usr.overlays += src.icon


				else
					src.worn = 0
					src.suffix=""
					usr.overlays -= src.icon


					usr.overlays-=src.HairIcon
	Yamato_HeadBand
		name="Yamato-style Headband"
		icon='H_Headband.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Nichibotsu_Cloak
		name="Akatsuki Cloak"
		icon='Akatsuki_Cloak.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Straw_Hat
		name="Straw Hat"
		icon='Straw Hat.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Scarf
		icon='normalscarf.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Collared_Robes
		name="Collared Robes"
		icon='uchiharobes.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Nichibotsu_Hat
		name="Akatsuki Hat"
		icon='Akatsuki_Hat.dmi'
		icon_state="Inv"
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "Equipped"
					usr.Oname="[usr.name]"
					usr.name = "**Concealed Figure**"
					usr.generate_hover_name()


					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.name = "[usr.Oname]"
					usr.generate_hover_name()


					usr.overlays -= src.icon

	Sound_Outfit
		icon='Clothing_Sound.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Sound_Four
		icon='Sound_Four.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Coat
		name="Longcoat"
		icon='Clothing_Coat.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Hooded_Cloak
		icon='ANBU Cloak.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Subscriber_Mask
		icon='Kitsune Mask.dmi'
		name = "Subscriber Mask"
		var/Codename="Masked Figure"
		craftRank = "Trained Blacksmith"
		Description = "A mask that hides the users identity."
		craftChance = 60
		craftCost = 15000
		verb/Codename()
			Codename=input(usr,"Edit Codename","Edit Codename",Codename) as text
			if(length(Codename)>20 || length(Codename)<3)
				usr.custom_alert("The Codename must be between 3 and 20 characters.")
				src.Codename = "Masked Figure"
				return
			if(uppertext(src.Codename) == src.Codename)
				usr.custom_alert("Your Codename may not consist entirely of capital letters.")
				src.Codename = "Masked Figure"
				return
			if(filter_characters(src.Codename)!=src.Codename)
				usr.custom_alert("\"[src.Codename]\" contains an invalid character.  Allowed characters are:\n[allowed_characters_name]")
				Codename = "Masked Figure"
				return
			if(Codename==""||findtext(Codename,"\n"))
				usr.custom_alert("You Codename contains an invalid character.")
				Codename="Masked Figure"
				return
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn && !usr.masked)
					src.worn = 1
					src.suffix = "Equipped"
					usr.Oprofile = usr.profile
					usr.profile = null
					usr.SayFont = initial(usr.SayFont)
					usr.Oname="[usr.name]"
					usr.masked = Codename

					usr.name = Codename
					usr.generate_hover_name()
					usr.overlays += src.icon
					usr.Obloodtype=usr.bloodtype
					usr.OInjuries=usr.Injuries
					usr.bloodtype="?"
					usr.Injuries="?"
				else
					src.worn = 0
					src.suffix=""
					usr.masked = 0
					usr.name = usr.Oname
					usr.generate_hover_name()
					usr.profile = usr.Oprofile
					usr.SayFont = usr.OSayFont
					usr.bloodtype=usr.Obloodtype
					usr.Injuries=usr.OInjuries
					usr.overlays -= src.icon
		Drop()
			if(!usr.Admin)
				del(src)
			..()
		Pick_Up()
			..()
	Fancy_Top
		icon='tux.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	TowelF
		icon='towelf.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	TowelM
		icon='towelm.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Kimono
		icon='Clothing_Kimono.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Skirt
		icon='skirt.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Tilted_Belt
		icon='tiltingbelt.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Swordsman_Pants
		name="Swordsman Pants"
		icon='Swordsman Pants(Black).dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Bowtie
		icon='bowtie.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Tie
		icon='tie.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Dress
		icon='sidetankdress.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Sidecut_Dress
		icon='singlestrapmidtankdress.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon


	Female_Coat
		name="Female Longcoat"
		icon='Clothing_Coat2.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Gloves
		icon='Clothing_Gloves.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Vest
		icon='Clothing_Vest.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Belt
		icon='Clothing_Belt.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Slash
		name="Sash"
		icon='Clothing_Slash.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Leaf_Jounin
		name="Leaf Jumpsuit"
		icon='NewIcons/Leaf_Jounin.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Rain_Jounin
		name="Rain Jumpsuit"
		icon = 'Clothing_RAINJounin.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Hachimon_Master
		icon='Guy.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Toad_Sage
		icon='Toad_Sage.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Slug_Sage
		icon='Slug_Sage.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Snake_Sage
		icon='Snake_Sage.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Leaf_Chunin
		name="Leaf Flak-jacket"
		icon='NewIcons/Chuunin_Konoha.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Rock_Chunin
		name="Uzushiogakure Flak-jacket"
		icon='Clothing_RockChuunin.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Rain_Chunin
		name="Rain Flak-jacket"
		icon = 'Clothing_RAINChuunin.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Pants
		icon='Clothing_Pants.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Suna_Jounin
		name="Sand Jumpsuit"
		icon='NewIcons/Suna_Jounin.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Suna_Chunin
		name="Sand Flak-jacket"
		icon='NewIcons/Chuunin_Suna.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Suna_Cloak
		name="Desert Cloak"
		icon='Clothing_Suna_Cloak.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Suna_Head_Scarf
		name="Desert Wrap"
		icon='Clothing_Suna.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon




	Mist_Jounin
		name="Mist Jumpsuit"
		icon='NewIcons/Kiri_Jounin.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Mist_Chunin
		name="Mist Flak-jacket"
		icon='NewIcons/Chuunin_Kiri.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Shirt
		name="T-shirt"
		icon='Clothing_Shirt.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Hood
		icon='hood.dmi'
		icon_state="Inv"
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


					usr.overlays -= src.icon

	Backwards_Scarf
		icon='Clothing_Backwards-Scarf.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Collared_Shirt
		icon='Clothing_highcollar.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Shoes
		icon='Clothing_Shoes.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Long_Shoes
		icon='Clothing_Long Shoes.dmi'
		name="Knee Boots"
		New()
			del(src)
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
					usr.overlays -= src.icon
	Shorts
		icon='Shorts.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Holster
		name="Kunai Holster"
		icon='Holster.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Suna_Dusterblack
		name="Suna Duster"
		icon='NewIcons/Suna_Dusterblack.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Wristbands
		name="Wristbands"
		icon='NewIcons/Wristbands.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Vest_Hokage
		name="Hokage Vest"
		icon='NewIcons/Vest_Hokage.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Sleeveturtle
		name="Sleeveless Turtle Neck"
		icon='sleevelessturtleneck.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Sash
		icon='sash.dmi'
		icon_state="Inv"
		var/Assigned=0
		var/Scratched=0
		var/Vill
		New()
			..()
			spawn() Update()
		proc/Update()
			if(Vill == "None")
				Assigned = 0
			while(!Assigned)
				sleep(rand(1,5))
				var/mob/M=loc
				if(!ismob(M)) return
				if(!Assigned)
					icon_state="Inv"
					Vill="[M.Clan]"
					Assigned=1
			if(!Vill)
				var/mob/M=loc
				if(!ismob(M)) return
				Vill="[M.Clan]"
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "Equipped"
					usr.overlays += src.icon
					usr.Headbands=Vill
					usr.mouse_over_pointer=image('Symbols.dmi',"[Vill]")
				else
					src.worn = 0
					src.suffix=""
					usr.overlays -= src.icon
					usr.mouse_over_pointer=image('Symbols.dmi',"None")
					usr.Headbands=null




	Headband
		icon='Cody/Icons/Headbandnew_1.dmi'
		icon_state="Inv"
		var/Assigned=0
		var/Scratched=0
		var/Vill
		New()
			..()
			spawn() Update()
		proc/Update()
			while(!Assigned)
				sleep(rand(1,5))
				var/mob/M=loc
				if(!ismob(M)) return
				if(!Assigned)
					icon_state="Inv"
					Vill="[M.Clan]"
					Assigned=1
			if(!Vill)
				var/mob/M=loc
				if(!ismob(M)) return
				Vill="[M.Clan]"
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "Equipped"
					usr.overlays += src.icon
					usr.Headbands=Vill
					usr.mouse_over_pointer=image('Symbols.dmi',"[Vill]")
				else
					src.worn = 0
					src.suffix=""
					usr.overlays -= src.icon
					usr.mouse_over_pointer=image('Symbols.dmi',"None")
					usr.Headbands=null
		verb/Change_Headband()
			set name="Headband Style"
			if(src.worn)
				src.worn = 0
				src.suffix=""
				usr.overlays -= src.icon
			switch(input(" How would you like to wear your Headband?") in list("Scratch Out","Normal","Neck","Leg",/*"Bandanna",*/"Kakashi","Choji Style","Waist","Over Eyes","Hairpin Style","Sakura Style","Arm","Zabuza Style","Cancel"))
				if("Scratch Out")
					if(Scratched) return
					if(alert(usr,"Are you sure you want to scratch out your headband?!","Alert","Yes","No")=="No") return
					var/LastVill=src.icon_state
					src.icon_state="Missing[LastVill]"
					src.Vill="Scratched [Vill]"
					src.Scratched=1
				if("Kakashi")
					src.icon='Kakashi.dmi'
				if("Normal")
					src.icon='Headband.dmi'
				if("Leg")
					src.icon='Leg.dmi'
				if("Waist")
					src.icon='Waist.dmi'
				if("Choji Style")
					src.icon='Choji-Style.dmi'
				if("Neck")
					src.icon='Neck.dmi'
				if("Arm")
					src.icon='armheadband.dmi'
				if("Over Eyes")
					src.icon='eyeheadband.dmi'
				if("Hairpin Style")
					src.icon='hairpinheadband.dmi'
				if("Sakura Style")
					src.icon='sakuraheadband.dmi'
				if("Zabuza Style")
					src.icon='ZabuzaH.dmi'
	Cloak
		icon='Clothing_Cloak.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Robe
		name="Hoodie"
		icon='Clothing_Cloak2.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Contacts
		name="Contacts"
		icon='Contacts.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Boots
		icon='Clothing_Boots.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Glasses
		icon='Glasses.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Anbu_Armor
		icon='Clothing_Anbu.dmi'
		icon_state="Inv"
		name = "Light Armor"

		Description = "Covers Torso and arms only. It has a durability of C and does not add to the user's endurance. Does not negate blunt damage, instead reduces its force. If the blunt damage's strength is above C, the armour will break and the blunt damage will be reduced by two steps. This negates E damage completely and can tank D-grade damage four times before breaking."
		craftRank = "Trained Blacksmith"
		craftChance = 60
		craftCost = 6000

		Weight=4
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
					usr.overlays -= src.icon
	Anbu_Mask_Red
		icon='Cat ANBU.dmi'
		icon_state="Inv"
		name = "Porcelain Mask"
		var/Codename="Masked Figure"
		craftRank = "Trained Blacksmith"
		Description = "Provides D durability to the face. Negates D blunt damage and below, but can be cut with D damage and above."
		craftChance = 60
		craftCost = 15000
		verb/Codename()
			Codename=input(usr,"Edit Codename","Edit Codename",Codename) as text
			if(length(Codename)>20 || length(Codename)<3)
				usr.custom_alert("The Codename must be between 3 and 20 characters.")
				src.Codename = "Masked Figure"
				return
			if(uppertext(src.Codename) == src.Codename)
				usr.custom_alert("Your Codename may not consist entirely of capital letters.")
				src.Codename = "Masked Figure"
				return
			if(filter_characters(src.Codename)!=src.Codename)
				usr.custom_alert("\"[src.Codename]\" contains an invalid character.  Allowed characters are:\n[allowed_characters_name]")
				Codename = "Masked Figure"
				return
			if(Codename==""||findtext(Codename,"\n"))
				usr.custom_alert("You Codename contains an invalid character.")
				Codename="Masked Figure"
				return
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn && !usr.masked)
					src.worn = 1
					src.suffix = "Equipped"
					usr.Oprofile = usr.profile
					usr.profile = null
					usr.SayFont = initial(usr.SayFont)
					usr.Oname="[usr.name]"
					usr.masked = Codename

					usr.name = Codename
					usr.generate_hover_name()
					usr.overlays += src.icon
					usr.Obloodtype=usr.bloodtype
					usr.OInjuries=usr.Injuries
					usr.bloodtype="?"
					usr.Injuries="?"
				else
					src.worn = 0
					src.suffix=""
					usr.masked = 0
					usr.name = usr.Oname
					usr.generate_hover_name()
					usr.profile = usr.Oprofile
					usr.SayFont = usr.OSayFont
					usr.bloodtype=usr.Obloodtype
					usr.Injuries=usr.OInjuries
					usr.overlays -= src.icon


	Anbu_Mask_Blue
		icon='Cat ANBU.dmi'
		icon_state="Inv"
		name = "Porcelain Mask"
		var/Codename="Masked Figure"
		verb/Codename()
			Codename=input(usr,"Edit Codename","Edit Codename",Codename) as text
			if(length(Codename)>20 || length(Codename)<3)
				usr.custom_alert("The Codename must be between 3 and 20 characters.")
				src.Codename = "Masked Figure"
				return
			if(uppertext(src.Codename) == src.Codename)
				usr.custom_alert("Your Codename may not consist entirely of capital letters.")
				src.Codename = "Masked Figure"
				return
			if(filter_characters(src.Codename)!=src.Codename)
				usr.custom_alert("\"[src.Codename]\" contains an invalid character.  Allowed characters are:\n[allowed_characters_name]")
				Codename = "Masked Figure"
				return
			if(Codename==""||findtext(Codename,"\n"))
				usr.custom_alert("You Codename contains an invalid character.")
				Codename="Masked Figure"
				return
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn && !usr.masked)
					src.worn = 1
					src.suffix = "Equipped"
					usr.Oprofile = usr.profile
					usr.profile = null
					usr.SayFont = initial(usr.SayFont)
					usr.Oname="[usr.name]"
					usr.name = Codename
					usr.generate_hover_name()


					usr.overlays += src.icon
					usr.masked = Codename
					usr.Obloodtype=usr.bloodtype
					usr.OInjuries=usr.Injuries
					usr.bloodtype="?"
					usr.Injuries="?"
				else
					src.worn = 0
					src.suffix=""
					usr.masked = 0
					usr.name = usr.Oname
					usr.generate_hover_name()
					usr.profile = usr.Oprofile
					usr.SayFont = usr.OSayFont
					usr.bloodtype=usr.Obloodtype
					usr.Injuries=usr.OInjuries


					usr.overlays -= src.icon
	Long_Sleeved_Shirt
		icon='Clothing_LongShirt.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Jacket
		name="Jump Jacket"
		icon='Clothing_Jacket.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Naruto_Jacket
		icon='Naruto_Jacket.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Arm_Guard
		icon='automailmetalarmright.dmi'
		icon_state="Inv"
		Description = "This has a durability of C and does not add to the user's endurance. Does not negate blunt damage, instead reduces its force. If the blunt damage's strength is above C, the armour will break and the blunt damage will be reduced by two steps. This negates E damage completely and can tank D-grade damage three times before breaking."
		craftRank = "Trained Blacksmith"
		craftChance = 60
		craftCost = 3000

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
					usr.overlays -= src.icon
	Naruto_Shippuuden_Jacket
		icon='Naruto_Shippuuden.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon


	Sasuke_Suit
		icon='Sasuke_Suit.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Arm_Band
		icon='Arm Band.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Sleeveless_Jacket
		icon='ShortJacket.dmi'
		icon_state="Inv"
		New()
			del(src)
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
					usr.overlays -= src.icon
	Facemask
		icon='Clothing_Facemask.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Kage_Suit
		icon='Clothing_KageLeaf.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Kakashi_Suit
		icon='Clothing_Kakashi.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	backpouch
		name = "Backpouch"
		icon='Backpouch.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	First_Hokage_Suit
		icon='1st Hokage.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	AmekageSuit
		icon='Clothing_Amekage.dmi'
		icon_state="Inv"
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "Equipped"
					usr.Oname="[usr.name]"
					usr.generate_hover_name()


					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.name = "[usr.Oname]"
					usr.generate_hover_name()


					usr.overlays -= src.icon
	Samurai_Armor
		icon = 'Samurai Armor.dmi'
		icon_state="Inv"
		Description = "This covers the entire body and has a durability of B and does not add to the user's endurance. Using this reduces your agility by one grade and movement speed by three tiles. This debuff is reduced to a one step and one tile debuff if the perk 'Heavy Armor Proficiency' is present. Blunt damage below B is lowered by an entire grade. D damage and below is completely negated. It takes three focused C damage strikes on the same spot to crack this armour. Damage equal to or above B can break through the armour. Blunt damage that breaks the armour is reduced by two steps. (Debuffs only apply to moving one�s body.)"
		craftRank = "Trained Blacksmith"
		craftChance = 60
		craftCost = 3500

		Weight=6
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
					usr.overlays -= src.icon

	Samurai_Helmet
		icon = 'samuraihelm.dmi'
		icon_state="Inv"
		Description = "This covers the head only and has a durability of B and does not add to the user's endruance. Using this reduces your agility by one grade.. This debuff is reduced to a one step debuff if the perk 'Heavy Armor Proficiency' is present. Blunt damage below B is lowered by an entire grade. D damage and below is completely negated. It takes three focused C damage strikes on the same spot to crack this armour. Damage equal to or above B can break through the armour. Blunt damage that breaks the armour is reduced by two steps. "
		craftRank = "Trained Blacksmith"
		craftChance = 60
		craftCost = 3000

		Weight=6
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
					usr.overlays -= src.icon

	Kage_Hat
		icon='Kage_Hat.dmi'
		icon_state="Inv"
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


					usr.overlays -= src.icon
	Curse_Seal_Container
		icon='CS.dmi'
		Click()
			..()
			if(src in usr.contents)
				if(!usr.Seishingan)
					return
				if(!src.worn)
					src.worn = 1
					src.suffix = "Equipped"
					usr.Houin=0


					usr.overlays += src.icon
					usr.move=0
					sleep(rand(1000,2200))
					src.worn = 0
					src.suffix=""


					usr.overlays -= src.icon
					usr.move=1
					if(usr.Earth_HasCurseSeal)
						usr.Earth_HasCurseSeal2=1
					if(usr.Stone_HasCurseSeal)
						usr.Stone_HasCurseSeal2=1
					if(usr.Heaven_HasCurseSeal)
						usr.Heaven_HasCurseSeal2=1
					del(src)


	MizuKage_Suit
		name="Mizukage Suit"
		icon='Clothing_KiriKage.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	MizuKage_Hat
		name="Mizukage Hat"
		icon='KiriKage_Hat.dmi'
		icon_state="Inv"
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


					usr.overlays -= src.icon

	KazeKage_Suit
		name="Kazekage Suit"
		icon='Clothing_SunaKage.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	KazeKage_Hat
		name="Kazekage Hat"
		icon='Suna_Hat.dmi'
		icon_state="Inv"
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


					usr.overlays -= src.icon
	TsuchiKage_Suit
		name="Tsuchikage Suit"
		icon='Clothing_TsuchiKage.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	TsuchiKage_Hat
		name="Tsuchikage Hat"
		icon='Tsuchi_Hat.dmi'
		icon_state="Inv"
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


					usr.overlays -= src.icon

	Medical_Suit
		icon='Clothing_Medical.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	Medical_Hat
		icon='Clothing_Medic-Hat.dmi'
		icon_state="Inv"
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


					usr.overlays -= src.icon

	Aburame_Jacket
		icon='Aburame JacketSSO2.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Port_Hat
		icon='Ace Hat.dmi'
		icon_state="Inv"
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


					usr.overlays -= src.icon

	Toad_Sage_Mask
		icon='ANBU Toad Mask SS.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Arm_ClothLeft
		icon='Arm Wrap Left.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Arm_ClothRight
		icon='Arm Wrap Right.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Bahamut_Garb
		icon='Bahamut Garb.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Chest_Bandage
		icon='Bandage_Chest(1).dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Chest_Patch
		icon='Bandage_Chest.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Bra
		icon='Bra.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Chuck_Norris_Hat
		icon='Black Hat.dmi'
		icon_state="Inv"
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


					usr.overlays -= src.icon

	Clothing_Keyo
		icon='Clothes Keyo1.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Back_Scrolls
		icon='Clothing_Backscrolls1.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Back_Shield
		icon='Clothing_Backshield1.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Flowing_Cloak
		icon='Clothing_Flowing Cloak.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Jet_Jacket
		icon='Clothing_Jet Jacket.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Tribal_Mask
		icon='Clothing_Mask01.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

/*	Rein_Uniform
		icon='Custom 4th Hokage Cloak.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon */

	Demon_Brother_Headband
		icon='Demon Headband.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Demon_Brother_Clothes
		icon='Demon bro gear.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Demon_Brother_Cloak
		icon='Demon bro cloak.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Dosu_Poncho
		icon='Dosu_Poncho.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Edward_Elric_Shirt
		icon='Elric Shirt.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Eye_Wrap
		icon='Eye Band.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Face_Wrappings
		icon='Face_Bandages.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Hood_Shin_Coat
		icon='Ghetto Shin Coat.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Obito_Goggles
		icon='Goggles.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Axe_Guitar
		icon='guitar axe.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Blindfold
		icon='White headband.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Tracker_Mask
		icon='Haku Mask.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Hand_Wraps
		icon='Hand Wraps (SS).dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Insomniac_Eyes
		icon='Insomniac Eyes.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Hijikata_Robes
		icon='Hijikata Robe.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Memori_Eyes
		icon='Memori Drake Eyes.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Natsu_Top
		icon='Natsu Top.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Natsu_Bottoms
		icon='Natsu bottoms.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Obito_Jacket
		icon='Obito Jacket.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Radio_Comm
		icon='Radio.dmi'
		icon_state="Inv"
		var/Freq="1.00"
		var/Toggled=0
		verb/Change_Frequency()
			set src in usr.contents
			Freq=input(usr,"Change frequency (Current is [Freq])") as num
			if(Freq<=0) Freq="1.00"
			Freq=num2text(Freq)
			name = "Radio Comm ([Freq])"
		verb/Toggle()
			Toggled=!Toggled
			usr<<output("<font size = -3>Your radio is now [Toggled ? "on" : "off"].","outputic.output")
			usr<<output("<font size = -3>Your radio is now [Toggled ? "on" : "off"].","outputall.output")
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
					usr.overlays -= src.icon

	Wings
		icon='Raven Wings.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Red_Scroll
		icon='Red Scroll.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Rib_Wrappings
		icon='Rib-bandages.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Sham_Cloak
		icon='Sham Cloak.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Shino_Coat
		icon='Shino Coat.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Tilted_Headband
		icon='Sideways_Band.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon
	SinX_Shirt_Dark
		icon='SinX shirt Dark V.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	SinX_Shirt
		icon='SinX shirt.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Ningetsu_Jacket
		icon='SS_Red-Collar Jacket.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Kurapika_Robe
		icon='Uriahima Robe.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon



	Armored_Faceplate
		icon='H_Headband.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Gas_Mask
		icon='Gas Mask.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon

	Kitsune_Mask
		icon='Kitsune Mask.dmi'
		icon_state="Inv"
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
					usr.overlays -= src.icon




mob/var/insideTent
obj/tent/warper/
	var/goTo = null
	var/Type = null

	Cross(atom/movable/O)
		if(!istype(O,/mob/)) return 0
		var/mob/M = O
		if(!M.client) ..()
		if(M.teleporting) return
		M.insideTent = (Type == "To" ? loc : null)
		if(!goTo) ..()
		M.teleporting = 1
		M.density = 0
		M.Move(goTo)
		M.density = 1
		if(M.chakraOverlay) M.chakraOverlay.loc = M.loc
		M.teleporting = 0
obj/items/tinderbox
	name="Tinderbox"
	icon='tinderbox.dmi'
	var/uses=3
	verb/Make_Fire()
		if(usr.z==27 || usr.z == 29 || usr.z == 28 || usr.z == 20 || usr.z == 13 || usr.z == 12 || usr.z == 11 || usr.z == 8)

			usr<<output("You can't make a campfire here!","outputic.output")
			usr<<output("You can't make a campfire here!","outputall.output")
			return
		new/obj/Campfire(usr.loc)
		uses--
		for(var/mob/M in hearers(14,usr))
			M<<output("<font size = -3><font color = white><font color=[usr.SayFont]>A <i>kquish</i> is heard as [M.getStrangerName(usr)] lights a fire with their tinderbox.<font color = white>","outputic.output")
			M<<output("<font size = -3><font color = white><font color=[usr.SayFont]>A <i>kquish</i> is heard as [M.getStrangerName(usr)] lights a fire with their tinderbox.<font color = white>","outputall.output")
		if(uses<=0) del(src)
obj/items/tentKit
	name = "Tent Kit"
	icon='tentkit.dmi'
	verb/Setup()
		if(usr.z==27 || usr.z == 29 || usr.z == 28 || usr.z == 20 || usr.z == 13 || usr.z == 12 || usr.z == 11 || usr.z == 8)
			usr<<output("You can't pitch a tent here!","outputic.output")
			usr<<output("You can't pitch a tent here!","outputall.output")
			return
		new/obj/tent/tent(usr.loc)
		for(var/mob/M in hearers(14,usr))
			M<<output("<font size = -3><font color = white><font color=[usr.SayFont]>[M.getStrangerName(usr)] unpacks their tent.<font color = white>","outputic.output")
			M<<output("<font size = -3><font color = white><font color=[usr.SayFont]>[M.getStrangerName(usr)] unpacks their tent.<font color = white>","outputall.output")
		del(src)
turf/tent/tentinterior
	icon='Small Tent Interior.dmi'
obj/tents/tentfloor
	icon='Tent Back Wall.dmi'
obj/tents/tentshadow
	icon='tentfloor.dmi'
obj/tents/tentshadow
	icon='Tent Pole.dmi'
obj/tent/tent

	layer = 60
	icon = 'tent.dmi'
	var/obj/tent/warper/warper = null
	var/obj/tent/warper/insideWarper = null
	verb/Dismantle()
		set src in oview(1)
		src.verbs -= /obj/tent/tent/verb/Dismantle
		new/obj/items/tentKit(usr)
		for(var/mob/M in hearers(14,usr))
			M<<output("<font size = -3><font color = white><font color=[usr.SayFont]>[M.getStrangerName(usr)] packs up the tent.<font color = white>","outputic.output")
			M<<output("<font size = -3><font color = white><font color=[usr.SayFont]>[M.getStrangerName(usr)] packs up the tent.<font color = white>","outputall.output")
		for(var/turf/T in block(locate(insideWarper.x-2,insideWarper.y,27),locate(insideWarper.x+2,insideWarper.y+6,27)))
			for(var/obj/items/O in T)
				O.loc=src.loc
			for(var/mob/M in T)
				M.teleporting = 1
				M.density = 0
				M.loc = src.loc
				M.density = 1
				if(M.chakraOverlay) M.chakraOverlay.loc = M.loc
				M.teleporting = 0
		del(src)
	proc/findInterior()
		var foundInterior=0
		var xModify = 0
		var yModify = 0
		while(!foundInterior)
			sleep(1)
			var/turf/O = locate(4+xModify,2+yModify,27)
			var/warpFound = 0
			for(var/obj/tent/warper/w in O)
				warpFound = 1
			if(!warpFound)
				foundInterior = 1
				return O
			else
				xModify+=5
				if(xModify>=world.maxx)
					xModify=0
					yModify+=7
					if(yModify>=world.maxy) break
		if(!foundInterior)
			world<<"Interior for tent not found."
	proc/buildWarper()
		var/turf/T = findInterior()
		if(!T)
			world<<"Cannot build tent interior."
			return
		insideWarper = new(T)
		insideWarper.goTo = locate(x+1,y-1,z)
		insideWarper.Type = "From"
		warper = new/obj/tent/warper(locate(x+1,y,z))
		warper.goTo = locate(insideWarper.x-1,insideWarper.y,insideWarper.z)
		warper.Type = "To"
	New()
		..()
		spawn()
			if(!insideWarper&&!warper) buildWarper()
	Del()
		del(insideWarper)
		if(warper) del(warper)
		..()

































