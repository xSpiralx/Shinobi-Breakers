mob/NPC
	Mineral_Salesman
		var/NPCVillage = "Yukigakure"
		icon='Base_Pale.dmi'
		icon_state=""
		attackable=0
		New()
			spawn()src.AddHair()
			spawn()src.AddOverlays()
			..()
		Click()
			if(get_dist(src,usr)>2) return
			var/X=usr.CustomInput("What can I help you with?","Mineral Store",list("Minerals","Nevermind"))
			if(!X) return
			switch(X:name)
				if("Nevermind")
					closeShop()
					return
				if("Minerals")
					for(var/obj/items/Ryo/R in usr.contents)
						var/amount = input("How much would you like to transfer? Ratio is 2:1","Ryo to Minerals") as num
						var/decimal=num2text(amount)
						if(findtext(decimal,".",1,0)) return
						if(amount<1)
							return
						if(amount<=R.amount)
							if(NPCVillage == "Yukigakure")
								archive.Yukigakure += amount
							if(NPCVillage == "Sunagakure")
								archive.Sunagakure += amount
							archive.save_archive()
							R.amount -= amount
							R.Update()
							amount = amount/2
							var/hasmineral=0
							for(var/obj/items/Bars/B in usr.contents)
								hasmineral=B
							if(hasmineral)
								hasmineral:amount+=round(amount)
								hasmineral:Update()
							else
								var/obj/items/Bars/BB = new(usr)
								BB.amount = round(amount)
						usr.closeShop()
						break