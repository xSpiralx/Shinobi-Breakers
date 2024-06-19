/*
proc/save_archive()
		//var/savefile/S = new("Archived_Jutsu")
		//S["Archived_Jutsu"] << src

		//world.log << "ARCHIVE: Attempting to save archive..."

		var/savefile/a = new("archive_savefiles/archive_jutsu")
		var/list/l_a = list()
		for(var/obj/jutsu/x in archive)
			if(x.jutsu_type <> "perk")
				l_a += x
		a["archive_list_storage"] << l_a
		//world.log << "ARCHIVE: Saved archive_jutsu."

/proc/load_archive()
	world.log << "ARCHIVE: Attempting to load archive files..."

	//archive = new/archive

	if(fexists("archive_savefiles/archive_jutsu"))
		var/savefile/a = new("archive_savefiles/archive_jutsu")
		var/list/l_a = list()
		a["archive_list_storage"] >> l_a
		archive.contents += l_a
		world.log << "ARCHIVE: Loaded archive_jutsu."
	world.log << "ARCHIVE: Load complete."

	*/
proc/Save_NPCs()
	var/savefile/F=new("archive_savefiles/NPCs")
	var/list/URBs = list()
	var/list/WSs = list()
	var/list/YRBs = list()
	for(var/mob/NPC/Uzushio_Resource_Broker/M in world)
		M.saved_x=M.x
		M.saved_y=M.y
		M.saved_z=M.z
		URBs+=M
	F["URB"] << URBs
	for(var/mob/NPC/Yuki_Resource_Broker/H in world)
		H.saved_x=H.x
		H.saved_y=H.y
		H.saved_z=H.z
		YRBs+=H
	F["YRB"] << YRBs
	for(var/mob/NPC/Weapon_Salesman/X in world)
		X.saved_x=X.x
		X.saved_y=X.y
		X.saved_z=X.z
		WSs+=X
	F["WS"] << WSs
proc/Load_NPCs()
	if(fexists("archive_savefiles/NPCs"))
		world.log << "ARCHIVE: Loaded NPCs."
		var/savefile/F=new("archive_savefiles/NPCs")
		var/list/A = list()
		var/list/D = list()
		var/list/P = list()
		F["YRB"] >> A
		if(!A) return
		for(var/mob/NPC/Yuki_Resource_Broker/B in world) if(B.loc) del(B)
		for(var/mob/NPC/Yuki_Resource_Broker/C in A)
			world.log << "[C]"
			C.loc = locate(C.saved_x,C.saved_y,C.saved_z)
		F["URB"] >> P
		for(var/mob/NPC/Uzushio_Resource_Broker/Z in world) if(Z.loc) del(Z)
		for(var/mob/NPC/Uzushio_Resource_Broker/X in P)
			world.log << "[X]"
			X.loc = locate(X.saved_x,X.saved_y,X.saved_z)
		F["WS"] >> D
		if(!D) return
		for(var/mob/NPC/Weapon_Salesman/E in world) if(E.loc) del(E)
		for(var/mob/NPC/Weapon_Salesman/G in D)
			G.loc = locate(G.saved_x,G.saved_y,G.saved_z)


mob/Admin3/verb
	Set_Owner(mob/M in world)
		set category = "Admin"
		var/list/Brokers = new/list()
		for(var/mob/NPC/Uzushio_Resource_Broker/X in world)
			Brokers+=X
		for(var/mob/NPC/Yuki_Resource_Broker/Z in world)
			Brokers+=Z
		var/Selected=input("Set who as owner?") in Brokers
		Selected:Owner = M.ckey
		M.contents += new/obj/ResourceAdmin
obj/ResourceAdmin
	rank=1
	verb
		Modify_Broker()
			set category = "Rank"
			var/list/InView = new/list()
			for(var/mob/NPC/Uzushio_Resource_Broker/X in view(4))
				InView +=x
			var/Selected=input("Modify which Broker?") in InView
			switch(input("What resource do you want to modify?") in list ("Wood","Minerals","Cotton","Roots"))
				if("Wood")
					Selected:WR = input("What do you want to set the rate to? The current rate is [Selected:WR]") as num
					return

mob/NPC
	Yuki_Resource_Broker
		var/Owner=""
		icon='Base_Pale.dmi'
		icon_state=""
		attackable=0
		var/Deactive=0
		var/Ryo=5000
		var/tier=1
		var/Wood=10000
		var/Minerals=10000
		var/Roots=2000
		var/Cotton=2000
		var/CR=5
		var/RR=1
		var/MR=0.5
		var/WR=1
		New()
			spawn()src.AddHair()
			spawn()src.AddOverlays()
			..()


		Click()
			if(get_dist(src,usr)>2) return
			if(usr.Village != "Amegakure")
				usr<<output("<font size = -3>Yukigakure Broker: I only do business with Amegakure citizens!","outputic.output")
				return
			if(Deactive)
				usr<<output("<font size = -3>This shopkeeper is out of stock!","outputic.output")
				usr<<output("<font size = -3>This shopkeeper is out of stock!","outputall.output")
				return
			var/X=usr.CustomInput("What can I help you with?","Resource Broker",list("Exchange Resources to Ryo.","Nevermind"))
			if(!X) return
			switch(X:name)
				if("Nevermind")
					closeShop()
					return
				if("Exchange Resources to Ryo.")
					var/list/Items=list()


					for(var/obj/items/Ryo/delRyo in usr.contents)
						if(delRyo.amount <= 0)
							del(delRyo)

					for(var/obj/items/Roots/delRyo in usr.contents)
						if(delRyo.amount <= 0)
							del(delRyo)

					for(var/obj/items/Cotton/delRyo in usr.contents)
						if(delRyo.amount <= 0)
							del(delRyo)
					for(var/obj/items/Wood/delRyo in usr.contents)
						if(delRyo.amount <= 0)
							del(delRyo)
					var obj/items/Ryo/R = locate() in usr
					if(!R)
						var/obj/items/Ryo/Z=new(usr)
						Z.amount=1
						Z.Update()


					var obj/items/Bars/minerals = locate() in usr
					if(minerals)
						Items += "Minerals"
					var obj/items/Roots/root = locate() in usr
					if(root)
						Items += "Roots"
					var obj/items/Cotton/cotton = locate() in usr
					if(cotton)
						Items += "Cotton"
					var obj/items/Wood/wood = locate() in usr
					if(wood)
						Items += "Wood"


					switch(input("Which would you like to sell?") in Items+"Cancel")

						if("Minerals")
							var/Selling = input("How much are you selling? You have [minerals.amount]") as num
							if(Selling > minerals.amount || Selling < 0)
								usr <<output("<font size = -3>Broker: You can't sell me more than you actually have...","outputic.output")
								return
							else
								Minerals += Selling
								for(var/obj/items/Ryo/ryo in usr.contents)
									ryo.amount += MR*Selling
									ryo.Update()

									break
								Ryo -= MR*Selling
								Minerals += Selling
								minerals.amount -= Selling
								minerals.Update()
								if(minerals.amount <= 0)
									del(minerals)
								usr<<output("<font size = -3>The shopkeeper hands you [MR*Selling] Ryo for this item.","outputic.output")
								usr<<output("<font size = -3>The shopkeeper hands you [MR*Selling] Ryo for this item.","outputall.output")


			/*			if("Roots")
							var/Selling = input("How much are you selling? You have [root.amount]") as num
							if(Selling > root.amount || Selling < 0)
								usr <<output("<font size = -3>Broker: You can't sell me more than you actually have...","outputic.output")
								return
							else
								Roots += Selling
								for(var/obj/items/Ryo/ryo in usr.contents)
									ryo.amount += RR*Selling
									ryo.Update()
									break
								Ryo -= RR*Selling
								Roots += Selling
								root.amount -= Selling
								root.Update()
								if(root.amount <= 0)
									del(root)
								usr<<output("<font size = -3>The shopkeeper hands you [RR*Selling] Ryo for this item.","outputic.output")
								usr<<output("<font size = -3>The shopkeeper hands you [RR*Selling] Ryo for this item.","outputall.output")
						if("Cotton")
							var/Selling = input("How much are you selling? You have [cotton.amount]") as num
							if(Selling > cotton.amount || Selling < 0)
								usr <<output("<font size = -3>Broker: You can't sell me more than you actually have...","outputic.output")
								return
							else
								Cotton += Selling
								for(var/obj/items/Ryo/ryo in usr.contents)
									ryo.amount += CR*Selling
									ryo.Update()
									break
								Ryo -= CR*Selling

								Cotton += Selling

								cotton.amount -= Selling
								cotton.Update()
								if(cotton.amount <= 0)
									del(cotton)
								usr<<output("<font size = -3>The shopkeeper hands you [CR*Selling] Ryo for this item.","outputic.output")
								usr<<output("<font size = -3>The shopkeeper hands you [CR*Selling] Ryo for this item.","outputall.output")*/
						if("Wood")

							var/Selling = input("How much are you selling? You have [wood.amount]") as num
							if(Selling > wood.amount || Selling < 0)
								usr <<output("<font size = -3>Broker: You can't sell me more than you actually have...","outputic.output")
								return
							else
								Wood += Selling
								for(var/obj/items/Ryo/ryo in usr.contents)
									ryo.amount += WR*Selling
									ryo.Update()
									break
								Ryo -= WR*Selling
								Wood += Selling
								wood.amount -= Selling
								wood.Update()
								if(wood.amount <= 0)
									del(wood)
								usr<<output("<font size = -3>The shopkeeper hands you [WR*Selling] Ryo for this item.","outputic.output")
								usr<<output("<font size = -3>The shopkeeper hands you [WR*Selling] Ryo for this item.","outputall.output")


				if("Purchase")
					var/I=usr.updateShopListing("What would you like to buy?","Resources",list("Roots","Wood","Minerals","Cotton","Cancel"))
					if(!I) return
					switch(I:name)
						if("Cancel")
							usr.prompt.answer = "Cancel"
							usr.closeShop()
							return
					/*	if("Cotton")
							var obj/items/Ryo/R = locate() in usr
							if(!R)
								return
							var/amount = input("How many would you like to buy? Your ryo is [R.amount], and exhange rate is [CR]") as num
							var/decimal=num2text(amount)
							if(findtext(decimal,".",1,0)) return
							if(amount < 1)
								return
							if(R.amount < (CR*amount))
								alert("You do not have enough ryo to purchase this.")
								return
							R.amount -= CR*amount
							R.Update()

							var obj/items/Cotton/W = locate() in usr
							if(!W)
								var/obj/items/Cotton/B = new()
								B.amount = amount
								B.Update()
								usr.contents += B
							else
								W.amount += amount
								W.Update()

							usr.closeShop()

						if("Roots")
							var obj/items/Ryo/R = locate() in usr
							if(!R)
								return
							var/amount = input("How many would you like to buy? Your ryo is [R.amount], and exhange rate is [RR]") as num
							var/decimal=num2text(amount)
							if(findtext(decimal,".",1,0)) return
							if(amount < 1)
								return
							if(R.amount < (RR*amount))
								alert("You do not have enough ryo to purchase this.")
								return
							R.amount -= RR*amount
							R.Update()

							var obj/items/Roots/W = locate() in usr
							if(!W)
								var/obj/items/Roots/B = new()
								B.amount = amount
								B.Update()
								usr.contents += B
							else
								W.amount += amount
								W.Update()

							usr.closeShop()
*/

						if("Minerals")
							var obj/items/Ryo/R = locate() in usr
							if(!R)
								return
							var/amount = input("How many would you like to buy? Your ryo is [R.amount], and exhange rate is [MR]") as num
							var/decimal=num2text(amount)
							if(findtext(decimal,".",1,0)) return
							if(amount < 1)
								return
							if(R.amount < (MR*amount))
								alert("You do not have enough ryo to purchase this.")
								return
							R.amount -= MR*amount
							R.Update()

							var obj/items/Bars/W = locate() in usr
							if(!W)
								var/obj/items/Bars/B = new()
								B.amount = amount
								B.Update()
								usr.contents += B
							else
								W.amount += amount
								W.Update()

							usr.closeShop()
mob/NPC
	Uzushio_Resource_Broker
		var/Owner=""
		icon='Base_Pale.dmi'
		icon_state=""
		attackable=0
		var/Deactive=0
		var/Ryo=5000
		var/tier=1
		var/Wood=10000
		var/Minerals=10000
		var/Roots=2000
		var/Cotton=2000
		var/CR=5
		var/RR=1
		var/MR=0.5
		var/WR=1
		New()
			spawn()src.AddHair()
			spawn()src.AddOverlays()
			..()


		Click()
			if(get_dist(src,usr)>2) return
			if(usr.Village != "Konohagakure")
				usr<<output("<font size = -3>Uzushiogakure Broker: I only do business with Konohagakure citizens!","outputic.output")
				return
			if(Deactive)
				usr<<output("<font size = -3>This shopkeeper is out of stock!","outputic.output")
				usr<<output("<font size = -3>This shopkeeper is out of stock!","outputall.output")
				return
			var/X=usr.CustomInput("What can I help you with?","Resource Broker",list("Exchange Resources to Ryo.","Nevermind"))
			if(!X) return
			switch(X:name)
				if("Nevermind")
					closeShop()
					return
				if("Exchange Resources to Ryo.")
					var/list/Items=list()


					for(var/obj/items/Ryo/delRyo in usr.contents)
						if(delRyo.amount <= 0)
							del(delRyo)

					for(var/obj/items/Roots/delRyo in usr.contents)
						if(delRyo.amount <= 0)
							del(delRyo)

					for(var/obj/items/Cotton/delRyo in usr.contents)
						if(delRyo.amount <= 0)
							del(delRyo)
					for(var/obj/items/Wood/delRyo in usr.contents)
						if(delRyo.amount <= 0)
							del(delRyo)
					var obj/items/Ryo/R = locate() in usr
					if(!R)
						var/obj/items/Ryo/Z=new(usr)
						Z.amount=1
						Z.Update()


					var obj/items/Bars/minerals = locate() in usr
					if(minerals)
						Items += "Minerals"
					var obj/items/Roots/root = locate() in usr
					if(root)
						Items += "Roots"
					var obj/items/Cotton/cotton = locate() in usr
					if(cotton)
						Items += "Cotton"
					var obj/items/Wood/wood = locate() in usr
					if(wood)
						Items += "Wood"


					switch(input("Which would you like to sell?") in Items+"Cancel")

						if("Minerals")
							var/Selling = input("How much are you selling? You have [minerals.amount]") as num
							if(Selling > minerals.amount || Selling < 0)
								usr <<output("<font size = -3>Broker: You can't sell me more than you actually have...","outputic.output")
								return
							else
								Minerals += Selling
								for(var/obj/items/Ryo/ryo in usr.contents)
									ryo.amount += MR*Selling
									ryo.Update()

									break
								Ryo -= MR*Selling
								Minerals += Selling
								minerals.amount -= Selling
								minerals.Update()
								if(minerals.amount <= 0)
									del(minerals)
								usr<<output("<font size = -3>The shopkeeper hands you [MR*Selling] Ryo for this item.","outputic.output")
								usr<<output("<font size = -3>The shopkeeper hands you [MR*Selling] Ryo for this item.","outputall.output")


			/*			if("Roots")
							var/Selling = input("How much are you selling? You have [root.amount]") as num
							if(Selling > root.amount || Selling < 0)
								usr <<output("<font size = -3>Broker: You can't sell me more than you actually have...","outputic.output")
								return
							else
								Roots += Selling
								for(var/obj/items/Ryo/ryo in usr.contents)
									ryo.amount += RR*Selling
									ryo.Update()
									break
								Ryo -= RR*Selling
								Roots += Selling
								root.amount -= Selling
								root.Update()
								if(root.amount <= 0)
									del(root)
								usr<<output("<font size = -3>The shopkeeper hands you [RR*Selling] Ryo for this item.","outputic.output")
								usr<<output("<font size = -3>The shopkeeper hands you [RR*Selling] Ryo for this item.","outputall.output")
						if("Cotton")
							var/Selling = input("How much are you selling? You have [cotton.amount]") as num
							if(Selling > cotton.amount || Selling < 0)
								usr <<output("<font size = -3>Broker: You can't sell me more than you actually have...","outputic.output")
								return
							else
								Cotton += Selling
								for(var/obj/items/Ryo/ryo in usr.contents)
									ryo.amount += CR*Selling
									ryo.Update()
									break
								Ryo -= CR*Selling

								Cotton += Selling

								cotton.amount -= Selling
								cotton.Update()
								if(cotton.amount <= 0)
									del(cotton)
								usr<<output("<font size = -3>The shopkeeper hands you [CR*Selling] Ryo for this item.","outputic.output")
								usr<<output("<font size = -3>The shopkeeper hands you [CR*Selling] Ryo for this item.","outputall.output")*/
						if("Wood")

							var/Selling = input("How much are you selling? You have [wood.amount]") as num
							if(Selling > wood.amount || Selling < 0)
								usr <<output("<font size = -3>Broker: You can't sell me more than you actually have...","outputic.output")
								return
							else
								Wood += Selling
								for(var/obj/items/Ryo/ryo in usr.contents)
									ryo.amount += WR*Selling
									ryo.Update()
									break
								Ryo -= WR*Selling
								Wood += Selling
								wood.amount -= Selling
								wood.Update()
								if(wood.amount <= 0)
									del(wood)
								usr<<output("<font size = -3>The shopkeeper hands you [WR*Selling] Ryo for this item.","outputic.output")
								usr<<output("<font size = -3>The shopkeeper hands you [WR*Selling] Ryo for this item.","outputall.output")


				if("Purchase")
					var/I=usr.updateShopListing("What would you like to buy?","Resources",list("Roots","Wood","Minerals","Cotton","Cancel"))
					if(!I) return
					switch(I:name)
						if("Cancel")
							usr.prompt.answer = "Cancel"
							usr.closeShop()
							return
					/*	if("Cotton")
							var obj/items/Ryo/R = locate() in usr
							if(!R)
								return
							var/amount = input("How many would you like to buy? Your ryo is [R.amount], and exhange rate is [CR]") as num
							var/decimal=num2text(amount)
							if(findtext(decimal,".",1,0)) return
							if(amount < 1)
								return
							if(R.amount < (CR*amount))
								alert("You do not have enough ryo to purchase this.")
								return
							R.amount -= CR*amount
							R.Update()

							var obj/items/Cotton/W = locate() in usr
							if(!W)
								var/obj/items/Cotton/B = new()
								B.amount = amount
								B.Update()
								usr.contents += B
							else
								W.amount += amount
								W.Update()

							usr.closeShop()

						if("Roots")
							var obj/items/Ryo/R = locate() in usr
							if(!R)
								return
							var/amount = input("How many would you like to buy? Your ryo is [R.amount], and exhange rate is [RR]") as num
							var/decimal=num2text(amount)
							if(findtext(decimal,".",1,0)) return
							if(amount < 1)
								return
							if(R.amount < (RR*amount))
								alert("You do not have enough ryo to purchase this.")
								return
							R.amount -= RR*amount
							R.Update()

							var obj/items/Roots/W = locate() in usr
							if(!W)
								var/obj/items/Roots/B = new()
								B.amount = amount
								B.Update()
								usr.contents += B
							else
								W.amount += amount
								W.Update()

							usr.closeShop()
*/

						if("Minerals")
							var obj/items/Ryo/R = locate() in usr
							if(!R)
								return
							var/amount = input("How many would you like to buy? Your ryo is [R.amount], and exhange rate is [MR]") as num
							var/decimal=num2text(amount)
							if(findtext(decimal,".",1,0)) return
							if(amount < 1)
								return
							if(R.amount < (MR*amount))
								alert("You do not have enough ryo to purchase this.")
								return
							R.amount -= MR*amount
							R.Update()

							var obj/items/Bars/W = locate() in usr
							if(!W)
								var/obj/items/Bars/B = new()
								B.amount = amount
								B.Update()
								usr.contents += B
							else
								W.amount += amount
								W.Update()

							usr.closeShop()
/*
						if("Wood")
							var obj/items/Ryo/R = locate() in usr
							if(!R)
								return
							var/amount = input("How many would you like to buy? Your ryo is [R.amount], and exhange rate is [WR]") as num
							var/decimal=num2text(amount)
							if(findtext(decimal,".",1,0)) return
							if(amount < 1)
								return
							if(R.amount < (WR*amount))
								alert("You do not have enough ryo to purchase this.")
								return
							R.amount -= WR*amount
							R.Update()

							var obj/items/Wood/W = locate() in usr
							if(!W)
								var/obj/items/Wood/B = new()
								B.amount = amount
								B.Update()
								usr.contents += B
							else
								W.amount += amount
								W.Update()

							usr.closeShop()
*/
/*mob/NPC
	Uzushio_Resource_Broker
		var/Owner=""
		icon='Base_Pale.dmi'
		icon_state=""
		attackable=0
		var/Deactive=0
		var/Ryo=5000
		var/tier=1
		var/Wood=10000
		var/Minerals=10000
		var/Roots=2000
		var/Cotton=2000
		var/CR=5
		var/RR=5
		var/MR=5
		var/WR=5
		New()
			spawn()src.AddHair()
			spawn()src.AddOverlays()
			..()
		Click()
			if(get_dist(src,usr)>2) return
			if(Deactive)
				usr<<output("<font size = -3>This shopkeeper is out of stock!","outputic.output")
				usr<<output("<font size = -3>This shopkeeper is out of stock!","outputall.output")
				return
			var/X=usr.CustomInput("What can I help you with?","Resource Broker",list("Purchase","Sell","Nevermind"))
			if(!X) return
			switch(X:name)
				if("Nevermind")
					closeShop()
					return
				if("Sell")
					var/list/Items=list()
					for(var/obj/items/I in usr.contents)
						if(istype(I,/obj/items/Bars)) Items["[I.name]"]=I
						if(istype(I,/obj/items/Roots)) Items["[I.name]"]=I
						if(istype(I,/obj/items/Cotton)) Items["[I.name]"]=I
						if(istype(I,/obj/items/Wood)) Items["[I.name]"]=I
					if(!Items.len)
						usr<<output("<font size = -3>You have nothing of value!","outputic.output")
						usr<<output("<font size = -3>You have nothing of value!","outputall.output")
						return
					var/Choice=usr.CustomInput("What would you like to sell?","Resource Broker",Items)
					var/obj/items/O=Items["[Choice]"]
					if(!O) return
					if(istype(O,/obj/items/Bars/))
						var/MineralAmount=0
						for(var/obj/items/Bars/M in usr.contents)
							MineralAmount=M:amount
						var/hasryo=0
						for(var/obj/items/Ryo/R in usr.contents)
							hasryo=R
						var/Selling=input("How many do you want to sell? You have [MineralAmount]") as num
						if(Selling>MineralAmount)
							usr <<output("<font size = -3>Broker: You can't sell me more than you actually have...","outputic.output")
							return
						if(Selling>=Minerals)
							Minerals+=Selling
							Ryo-=MR*Selling
							for(var/obj/items/Bars/M in usr.contents)
								M:amount-=Selling
							if(hasryo)
								hasryo:amount+=MR*Selling
								hasryo:Update()
							else
								var/obj/items/Ryo/R=new(usr)
								R.amount=MR*Selling
								R.Update()

						usr<<output("<font size = -3>The shopkeeper hands you [MR*Selling] Ryo for this item.","outputic.output")
						usr<<output("<font size = -3>The shopkeeper hands you [MR*Selling] Ryo for this item.","outputall.output")
						return
					if(istype(O,/obj/items/Roots/))
						var/MineralAmount=0
						for(var/obj/items/Roots/M in usr.contents)
							MineralAmount=M:amount
						var/hasryo=0
						for(var/obj/items/Ryo/R in usr.contents)
							hasryo=R
						var/Selling=input("How many do you want to sell? You have [MineralAmount]") as num
						if(Selling>MineralAmount)
							usr <<output("<font size = -3>Broker: You can't sell me more than you actually have...","outputic.output")
							return
						if(Selling>=Minerals)
							Roots+=Selling
							Ryo-=RR*Selling
							for(var/obj/items/Roots/M in usr.contents)
								M:amount-=Selling
							if(hasryo)
								hasryo:amount+=RR*Selling
								hasryo:Update()
							else
								var/obj/items/Ryo/R=new(usr)
								R.amount=RR*Selling
								R.Update()
						usr<<output("<font size = -3>The shopkeeper hands you [RR*Selling] Ryo for this item.","outputic.output")
						usr<<output("<font size = -3>The shopkeeper hands you [RR*Selling] Ryo for this item.","outputall.output")
						del(O)
						return
					if(istype(O,/obj/items/Cotton/))
						var/MineralAmount=0
						for(var/obj/items/Cotton/M in usr.contents)
							MineralAmount=M:amount
						var/hasryo=0
						for(var/obj/items/Ryo/R in usr.contents)
							hasryo=R
						var/Selling=input("How many do you want to sell? You have [MineralAmount]") as num
						if(Selling>MineralAmount)
							usr <<output("<font size = -3>Broker: You can't sell me more than you actually have...","outputic.output")
							return
						if(Selling>=Minerals)
							Cotton+=Selling
							Ryo-=CR*Selling
							for(var/obj/items/Cotton/M in usr.contents)
								M:amount-=Selling
							if(hasryo)
								hasryo:amount+=CR*Selling
								hasryo:Update()
							else
								var/obj/items/Ryo/R=new(usr)
								R.amount=CR*Selling
								R.Update()
						usr<<output("<font size = -3>The shopkeeper hands you [CR*Selling] Ryo for this item.","outputic.output")
						usr<<output("<font size = -3>The shopkeeper hands you [CR*Selling] Ryo for this item.","outputall.output")
						del(O)
						return
					if(istype(O,/obj/items/Wood/))
						var/MineralAmount=0 //total amount
						for(var/obj/items/Wood/M in usr.contents)
							MineralAmount=M:amount



						var/hasryo=0
						for(var/obj/items/Ryo/R in usr.contents)
							hasryo=R
						var/Selling=input("How many do you want to sell? You have [MineralAmount]") as num
						if(Selling>MineralAmount)
							usr <<output("<font size = -3>Broker: You can't sell me more than you actually have...","outputic.output")
							return
						if(Selling>=Minerals)
							Wood+=Selling
							Ryo-=WR*Selling
							for(var/obj/items/Wood/M in usr.contents)
								M.amount-=Selling
							if(hasryo)
								hasryo:amount+=WR*Selling
								hasryo:Update()
							else
								var/obj/items/Ryo/R=new(usr)
								R.amount=WR*Selling
								R.Update()
						usr<<output("<font size = -3>The shopkeeper hands you [WR*Selling] Ryo for this item.","outputic.output")
						usr<<output("<font size = -3>The shopkeeper hands you [WR*Selling] Ryo for this item.","outputall.output")
						del(O)
						return
				if("Purchase")
					var/I=usr.updateShopListing("What would you like to buy?","Resources",list("Roots","Wood","Minerals","Cotton","Cancel"))
					if(!I) return
					switch(I:name)
						if("Cancel")
							usr.prompt.answer = "Cancel"
							usr.closeShop()
							return
						if("Roots")
							for(var/obj/items/Ryo/R in usr.contents)
								if(R.amount>=RR)
									var/obj/A = new/obj/items/Roots
									var/amount = input("How many would you like to purchase? The rate is [RR].") as num
									var/decimal=num2text(amount)
									if(findtext(decimal,".",1,0)) return
									amount = amount*RR
									if(amount<1)
										return
									if(amount<=R.amount)
										R.amount -= amount
										R.Update()
										amount = amount/5
										Ryo -= amount
										var/hasroot=0
										for(var/obj/items/Roots/RR in usr.contents)
											hasroot=RR
										if(hasroot)
											hasroot:amount+=amount
											hasroot:suffix = "You current have [hasroot:amount] in this stack"
											del(A)
											return
										usr << "[A] [A:amount]"
										A:amount = amount
									usr.contents+=A
									A.suffix = "You current have [A:amount] in this stack"
									usr.closeShop()
									break
								else
									usr << "Roots cost [RR] Ryo!"
						if("Minerals")
							for(var/obj/items/Ryo/R in usr.contents)
								if(R.amount>=RR)
									var/obj/A = new/obj/items/Bars
									var/amount = input("How many would you like to purchase? The rate is [MR].") as num
									var/decimal=num2text(amount)
									if(findtext(decimal,".",1,0)) return
									amount = amount*MR
									if(amount<1)
										return
									if(amount<=R.amount)
										R.amount -= amount
										R.Update()
										amount = amount/5
										Ryo -= amount
										var/hasroot=0
										for(var/obj/items/Bars/RR in usr.contents)
											hasroot=RR
										if(hasroot)
											hasroot:amount+=amount
											hasroot:suffix = "You current have [hasroot:amount] in this stack"
											del(A)
											return
										usr << "[A] [A:amount]"
										A:amount = amount
									usr.contents+=A
									A.suffix = "You current have [A:amount] in this stack"
									usr.closeShop()
									break
								else
									usr << "Minerals cost [MR] Ryo!"
						if("Wood")
							for(var/obj/items/Ryo/R in usr.contents)
								if(R.amount>=RR)
									var/obj/A = new/obj/items/Wood
									var/amount = input("How many would you like to purchase? The rate is [WR].") as num
									var/decimal=num2text(amount)
									if(findtext(decimal,".",1,0)) return
									amount = amount*WR
									if(amount<1)
										return
									if(amount<=R.amount)
										R.amount -= amount
										R.Update()
										amount = amount/5
										Ryo -= amount
										var/hasroot=0
										for(var/obj/items/Wood/RR in usr.contents)
											hasroot=RR
										if(hasroot)
											hasroot:amount+=amount
											hasroot:suffix = "You current have [hasroot:amount] in this stack"
											del(A)
											return
										usr << "[A] [A:amount]"
										A:amount = amount
									usr.contents+=A
									A.suffix = "You current have [A:amount] in this stack"
									usr.closeShop()
									break
								else
									usr << "Cotton costs [CR] Ryo!"*/


	Weapon_Salesman
		icon='Base_Pale.dmi'
		icon_state=""
		attackable=0
		var/Deactive=0
		var/Ryo=0
		var/tier=1
		var/KS=40
		var/SS=100
		var/SES=100
		var/WS=3
		var/WMS=8
		New()
			spawn()src.AddHair()
			spawn()src.AddOverlays()
			..()
		Click()
			if(get_dist(src,usr)>2) return
			if(Deactive)
				usr<<output("<font size = -3>This shopkeeper is out of stock!","outputic.output")
				usr<<output("<font size = -3>This shopkeeper is out of stock!","outputall.output")
				return
			if(tier==1)
				startMisc:
				var/I=usr.updateShopListing("What would you like to buy?","Shopkeep",list("Wakizashi (3500 Ryo)","Kunai (15 Ryo)","Senbon (5 Ryo)","Shuriken (10 Ryo)","Windmill (150 Ryo)","Cancel"))
				if(!I) return
				switch(I:name)
					if("Cancel")
						usr.prompt.answer = "Cancel"
						usr.closeShop()
						return
					if("Wakizashi (3500 Ryo)")
						if(WS<=0) return
						for(var/obj/items/Ryo/R in usr.contents)
							if(R.amount>=3500)
								R.amount-=3500
								R.Update()
								var/obj/A = new/obj/items/Weapon/Tanto
								usr.contents+=A
								usr.closeShop()
								WS-=1
								break
							else
								usr << "Wakizahi cost 3500 Ryo!"
						goto startMisc
					if("Kunai (15 Ryo)")
						for(var/obj/items/Ryo/R in usr.contents)
							if(R.amount>=15)
								R.amount-=15
								R.Update()
								var/obj/A = new/obj/items/Weapon/Kunai
								usr.contents+=A
								usr.closeShop()
								KS-=1
								break
							else
								usr << "Kunai's cost 15 Ryo!"
					if("Senbon (5 Ryo)")
						for(var/obj/items/Ryo/R in usr.contents)
							if(R.amount>=5)
								R.amount-=5
								R.Update()
								var/obj/A = new/obj/items/Weapon/Senbon
								var/amount = input("How many would you like to purchase?\n(An extra 5 Ryo is required per Senbon)") as num
								var/decimal=num2text(amount)
								if(findtext(decimal,".",1,0)) return
								amount = amount*5
								if(amount<1)
									return
								if(amount<=R.amount)
									R.amount -= amount
									R.Update()
									amount = amount/5
									var/hasshuri=0
									for(var/obj/items/Weapon/Senbon/RR in usr.contents)
										hasshuri=RR
									if(hasshuri)
										hasshuri:senbon+=amount
										hasshuri:suffix = "You current have [hasshuri:senbon] in this stack"
										SES-=amount
										del(A)
										return
									A:senbon = amount
								usr.contents+=A
								SES-=amount
								A.suffix = "You current have [A:senbon] in this stack"
								usr.closeShop()
								break
							else
								usr << "Senbon's cost 5 Ryo!"
					if("Shuriken (10 Ryo)")
						for(var/obj/items/Ryo/R in usr.contents)
							if(R.amount>=10)
								R.amount-=10
								R.Update()
								var/obj/A = new/obj/items/Weapon/Shuriken
								var/amount = input("How many would you like to purchase?\n(An extra 5 Ryo is required per Shuriken)") as num
								var/decimal=num2text(amount)
								if(findtext(decimal,".",1,0)) return
								amount = amount*5
								if(amount<=0)
									return
								if(amount<=R.amount)
									R.amount -= amount
									R.Update()
									amount = amount/5
									var/hasshuri=0
									for(var/obj/items/Weapon/Shuriken/RR in usr.contents)
										hasshuri=RR
									if(hasshuri)
										hasshuri:shuriken+=amount
										hasshuri:suffix = "You current have [hasshuri:shuriken] in this stack"
										del(A)
										SS-=amount
										return
									A:shuriken = amount
								usr.contents+=A
								SS-=amount
								A.suffix = "You current have [A:shuriken] in this stack"
								usr.closeShop()
								break
							else
								usr << "Shuriken's cost 10 Ryo!"
					if("Windmill (150 Ryo)")
						for(var/obj/items/Ryo/R in usr.contents)
							if(R.amount>=150)
								R.amount-=150
								R.Update()
								var/obj/A = new/obj/items/Weapon/Windmill
								usr.contents+=A
								usr.closeShop()
								WMS-=1
								break
							else
								usr << "Windmill's cost 150 Ryo!"
			if(tier==2)
				startMisc:
				var/I=usr.updateShopListing("What would you like to buy?","Shopkeep",list("Naginata (14000 Ryo)","Zanbatou (15000 Ryo)","Armguard (6000 Ryo)","Back Shuriken (4000 Ryo)","Bo-staff (7000 Ryo)","Katana (8000 Ryo)","Wakizashi (3500 Ryo)","Kunai (15 Ryo)","Senbon (5 Ryo)","Shuriken (10 Ryo)","Explosive Tag (250 Ryo)",/*"Training Log",*/"Cancel"))
				if(!I) return
				switch(I:name)
					if("Cancel")
						usr.prompt.answer = "Cancel"
						usr.closeShop()
						return
					if("Kyodai Sensu (9500 Ryo)")
						usr.addShopItem(new/obj/items/Weapon/Kyodai_Sensu,9500)
						goto startMisc
					if("Armguard (6000 Ryo)")
						usr.addShopItem(new/obj/items/Clothing/Arm_Guard,6000)
						goto startMisc
					if("Dagger (500 Ryo)")
						usr.addShopItem(new/obj/items/Weapon/Dagger,500)
						goto startMisc
					if("Gunbai (25000 Ryo)")
						usr.addShopItem(new/obj/items/Weapon/Gunbai,25000)
						goto startMisc
					if("Naginata (14000 Ryo)")
						usr.addShopItem(new/obj/items/Weapon/Naginata,14000)
						goto startMisc
					if("Claymore (20000 Ryo)")
						usr.addShopItem(new/obj/items/Weapon/Claymore,20000)
						goto startMisc
					if("Zanbatou (15000 Ryo)")
						usr.addShopItem(new/obj/items/Weapon/Zanbatou,15000)
						goto startMisc
					if("Katana (8000 Ryo)")
						usr.addShopItem(new/obj/items/Weapon/Katana,8000)
						goto startMisc
					if("Longsword (12000 Ryo)")
						usr.addShopItem(new/obj/items/Weapon/Longsword,12000)
						goto startMisc
					if("Bo-staff (7000 Ryo)")
						usr.addShopItem(new/obj/items/Weapon/Bostaff,7000)
						goto startMisc
					if("Rapier (7500 Ryo)")
						usr.addShopItem(new/obj/items/Weapon/Rapier,7500)
						goto startMisc
					if("Wakizashi (3500 Ryo)")
						usr.addShopItem(new/obj/items/Weapon/Tanto,3500)
						goto startMisc
					if("Kunai (15 Ryo)")
						for(var/obj/items/Ryo/R in usr.contents)
							if(R.amount>=15)
								R.amount-=15
								R.Update()
								var/obj/A = new/obj/items/Weapon/Kunai
								usr.contents+=A
								usr.closeShop()
								break
							else
								usr << "Kunai's cost 15 Ryo!"
					if("Explosive Tag (250 Ryo)")
						for(var/obj/items/Ryo/R in usr.contents)
							if(R.amount>=250)
								R.amount-=250
								R.Update()
								var/obj/A = new/obj/items/Weapon/Explosive_Tag
								usr.contents+=A
								usr.closeShop()
								break
							else
								usr << "Explosive Tag's cost 250 Ryo!"
					/*if("Training Log")
						if(usr.Ryo>=250)
							usr.Ryo-=250
							var/obj/A = new/obj/items/Weapon/Log
							usr.contents+=A
						else
							usr << "Log's cost 250 Ryo!"*/

					if("Soldier Pill")
						for(var/obj/items/Ryo/R in usr.contents)
							if(R.amount>=50)
								R.amount-=50
								R.Update()
								var/obj/A = new/obj/items/Pills/Soldier_Pill
								usr.contents+=A
								usr.closeShop()
								break
							else
								usr << "Soldier Pill's cost 50 Ryo!"

					if("Senbon (5 Ryo)")
						for(var/obj/items/Ryo/R in usr.contents)
							if(R.amount>=5)
								R.amount-=5
								R.Update()
								var/obj/A = new/obj/items/Weapon/Senbon
								var/amount = input("How many would you like to purchase?\n(An extra 5 Ryo is required per Senbon)") as num
								var/decimal=num2text(amount)
								if(findtext(decimal,".",1,0)) return
								amount = amount*5
								if(amount<1)
									return
								if(amount<=R.amount)
									R.amount -= amount
									R.Update()
									amount = amount/5
									var/hasshuri=0
									for(var/obj/items/Weapon/Senbon/RR in usr.contents)
										hasshuri=RR
									if(hasshuri)
										hasshuri:senbon+=amount
										hasshuri:suffix = "You current have [hasshuri:senbon] in this stack"
										del(A)
										return
									A:senbon = amount
								usr.contents+=A
								A.suffix = "You current have [A:senbon] in this stack"
								usr.closeShop()
								break
							else
								usr << "Senbon's cost 5 Ryo!"

					if("Shuriken (10 Ryo)")
						for(var/obj/items/Ryo/R in usr.contents)
							if(R.amount>=10)
								R.amount-=10
								R.Update()
								var/obj/A = new/obj/items/Weapon/Shuriken
								var/amount = input("How many would you like to purchase?\n(An extra 5 Ryo is required per Shuriken)") as num
								var/decimal=num2text(amount)
								if(findtext(decimal,".",1,0)) return
								amount = amount*5
								if(amount<=0)
									return
								if(amount<=R.amount)
									R.amount -= amount
									R.Update()
									amount = amount/5
									var/hasshuri=0
									for(var/obj/items/Weapon/Shuriken/RR in usr.contents)
										hasshuri=RR
									if(hasshuri)
										hasshuri:shuriken+=amount
										hasshuri:suffix = "You current have [hasshuri:shuriken] in this stack"
										del(A)
										return
									A:shuriken = amount
								usr.contents+=A
								A.suffix = "You current have [A:shuriken] in this stack"
								usr.closeShop()
								break
							else
								usr << "Shuriken's cost 10 Ryo!"

					if("Back Shuriken (4000 Ryo)")
						usr.addShopItem(new/obj/items/Weapon/Giant_Shuriken,4000)
						goto startMisc

					if("Windmill (150 Ryo)")
						for(var/obj/items/Ryo/R in usr.contents)
							if(R.amount>=150)
								R.amount-=150
								R.Update()
								var/obj/A = new/obj/items/Weapon/Windmill
								usr.contents+=A
								usr.closeShop()
								break
							else
								usr << "Windmill's cost 150 Ryo!"

/*
var/BankAcc = list()
mob/NPC
	Tsuniverse_Bank
		icon='Base_Pale.dmi'
		icon_state=""
		attackable = 0
		var/Deactive = 0
		var/BankRyo = 0
		var/BankAcc = list()
	verb/SignUp()
		BankAcc += list(usr.key)
	Click()
		switch(input("Welcome to the Tsuniverse Bank, How can I help you?") in list ("Sign Up", "Deposit", "Withdraw","Cancel"))
			if("Sign Up")
				BankAcc += list(usr.key)

				*/