

mob
	var/dailyRyo = 0
	proc/checkSubscription()
		return
		//src << "Thank you for being a subscriber. Your subscription will expire on [time2text(src.return_sub_days(),"DD/MM/YYYY")]"



	verb/donationPage()
		set hidden = 1
		return
		src << "DM Dani"








obj/items/Clothing
	var/last_edit
	Sub_Custom_Clothing
		name="Custom Clothing"
		icon='academymale1.dmi'
		icon_state="Inv"
		var/changed=0
		subItem = 1

		craftRank = "Tailor"
		craftChance = 60
		craftCost = 60

		verb/Delete_Item()
			if(worn)
				return
			else
				del(src)


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


mob/NPC

	Sub_Shopkeeper
		icon='Base_Pale.dmi'
		icon_state=""
		attackable=0
		New()
			spawn()src.AddHair()
			spawn()src.AddOverlays()
			..()
		Click()
			if(get_dist(src,usr)>2) return

			usr.barberShop = 0
			usr.skinCreate = 0

			var/X=usr.CustomInput("What can I help you with?","Subscriber Shopkeep",list("Custom Clothing"/*,"Daily Bonus Ryo",*/,"Sub Shop","Nevermind"))
			if(!X) return
			switch(X:name)
				if("Nevermind")
					closeShop()
					return

				if("Custom Clothing")
					var/obj/items/Ryo/R = locate() in usr
					if(R != null)
						if(R.amount >= 50)
							R.amount -= 50
							R.Update()
							usr<<output("You pay [50] ryo for the Custom Clothing.","outputall.output")
							var/obj/items/Clothing/Sub_Custom_Clothing/C = new()
							usr.contents += C
							usr.closeShop()
							return


					usr<<output("That item is [50] ryo! Come back when you have more money.","outputall.output")
					return


				if("Ryo to Minerals")
					for(var/obj/items/Ryo/R in usr.contents)
						var/obj/A = new/obj/items/Bars
						var/amount = input("How much would you like to transfer? Ratio is 2:1","Ryo to Minerals") as num
						var/decimal=num2text(amount)
						if(findtext(decimal,".",1,0)) return

						if(amount<1)
							return
						if(amount<=R.amount)
							R.amount -= amount
							R.Update()
							amount = amount/2
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
				if("Daily Bonus Ryo")
					if(world.realtime - usr.dailyRyo > 864000)
						usr.dailyRyo = world.realtime
						var/amount = 200
						var/obj/items/Ryo/R = locate() in usr
						if(!R)
							R = new(usr)
							R.amount = amount
							R.Update()

						else
							R.amount += amount
							R.Update()
					else


						usr<<output("You're still on your daily cooldown for another [(864000-(world.realtime-usr.dailyRyo))/(600*60)] hours!","outputic.output")
						usr<<output("You're still on your daily cooldown for another [(864000-(world.realtime-usr.dailyRyo))/(600*60)] hours!","outputall.output")


				if("Sub Shop")
					var/I=usr.CustomInput("What would you like to see?","Shopkeep",list("Clothing","Nothing"))
					if(!I) return
					switch(I:name)//obj/items/Weapon/Rope
						if("Nothing")
							closeShop()
							return

						if("Clothing")
							startClothes:
							var/Z=usr.updateShopListing("What would you like to buy? All clothes are 50 Ryo.","Shopkeep",list("Bandana","Black Robes","Copper Necklace","Boxing Gloves","Subscriber Hat","Double Backpouch","Guitar","Traditional Blue Kimono","Subscriber Ponco","Subscriber Samurai Robes","Cancel"))
							if(!Z) return
							switch(Z:name)
								if("Nothing")
									closeShop()
								if("Subscriber Samurai Robes")
									var/obj/A = new/obj/items/Clothing/SamuraiRobesSub
									usr.addShopItem(A,50)
									goto startClothes
								if("Subscriber Poncho")
									var/obj/A = new/obj/items/Clothing/PonchoSub
									usr.addShopItem(A,50)
									goto startClothes
								if("Traditional Blue Kimono")
									var/obj/A = new/obj/items/Clothing/KimonoSub
									usr.addShopItem(A,50)
									goto startClothes
								if("Bandana")
									var/obj/A = new/obj/items/Clothing/Bandana
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,50)
									goto startClothes
								if("Black Robes")
									var/obj/A = new/obj/items/Clothing/BRobes
									usr.addShopItem(A,50)
									goto startClothes
								if("Poncho")
									var/obj/A = new/obj/items/Clothing/PonchoSub

									usr.addShopItem(A,50)
									goto startClothes
								if("Boxing Gloves")
									var/obj/A = new/obj/items/Clothing/BoxingGloves

									usr.addShopItem(A,50)
									goto startClothes
								if("Copper Necklace")
									var/obj/A = new/obj/items/Clothing/CopperN
									usr.addShopItem(A,50)
									goto startClothes

								if("Double Backpouch")
									var/obj/A = new/obj/items/Clothing/DoublePouch
									usr.addShopItem(A,50)
									goto startClothes
								if("Subscriber Hat")
									var/obj/A = new/obj/items/Clothing/SubHat
									usr.addShopItem(A,50)
									goto startClothes
								if("Guitar")
									var/obj/A = new/obj/items/Clothing/Guitar
									usr.addShopItem(A,50)
									goto startClothes

obj/items/Clothing
	Bandana
		icon = 'Bandana.dmi'
		icon_state = "Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "Equipped"
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.overlays -= src.icon

	BRobes
		name = "Black Robes"
		icon = 'black robes.dmi'

		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "Equipped"
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.overlays -= src.icon

	BoxingGloves
		name = "Boxing Gloves"
		icon = 'Boxing gloves.dmi'
		icon_state = "Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "Equipped"
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.overlays -= src.icon

	CopperN
		icon = 'Copper Necklace.dmi'
		icon_state = "Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "Equipped"
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.overlays -= src.icon
	SubHat
		name = "Subscriber Hat"
		icon = 'Custom hat.dmi'
		icon_state = "Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "Equipped"
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.overlays -= src.icon

	DoublePouch
		name = "Backpouch"
		icon = 'Double Pouch.dmi'
		icon_state = "Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "Equipped"
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.overlays -= src.icon

	Guitar
		icon = 'Instrument.dmi'
		icon_state = "Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "Equipped"
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.overlays -= src.icon

	KimonoSub
		name = "Subscriber Kimono"
		icon = 'KimonoSub.dmi'
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "Equipped"
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.overlays -= src.icon
	PonchoSub
		name = "Poncho"
		icon = 'Poncho.dmi'
		icon_state = "Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "Equipped"
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.overlays -= src.icon
	SamuraiRobesSub
		name = "Samurai Robes"
		icon = 'Samurai Robes.dmi'
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "Equipped"
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.overlays -= src.icon

