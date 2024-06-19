obj/var
	newbie = 0

mob
	var/tmp/list/shopOverlays=list()
	var/tmp/shopCost=0
	var/tmp/barberShop=0
	var/tmp/skinCreate=0

	proc
		updateShopListing(title,message,inputs[],paths)
			if(!client) return
			if(!inputs) inputs = new/list
			if(!inputs.len)
				inputs.len = 1
				inputs[1] = "Broken!"
			winset(src,"shop.button14","is-visible=true")
			winset(src,"shop.title","text = '[title]'")
			src << output(null,"shop.message")
			src << output("[message]","shop.message")
			winset(src,"shop.grid","cells=0x0")
			var/Row=1
			src << output(null,"shop.grid")
			src << output("","shop.grid:1,1")
			for(var/X in inputs)
				Row++
				var/obj/Copy/I=new
				I.name=X
				I.row=Row
				src.CurrentGrid+=I
				src << output(null,"shop.grid:1,[Row]")
				src << output(I,"shop.grid:1,[Row]")
				continue
			winset(src,"shop","is-visible=true")
			if(skinCreate)
				winset(src,"shop.button14","is-visible=false")
			src.copy = "waiting"
			updateShopPreview()
			while(src.copy=="waiting")
				sleep(4)
			var/C = src.copy
			src.copy=null
			src.CurrentGrid=list()
			winset(src,"shop","is-visible=false")
			return C
		updateShopPreview(var/dirr = SOUTH)
			src << output(null,"shop.shopPreview")
			var/icon/I = icon(src.icon,src.icon_state,dirr)

			for(var/icon/h in hair_stack)
				I.Blend(h, ICON_OVERLAY)
			if(src.facialhair) I.Blend(icon(src.facialhair,src.icon_state,dirr),ICON_OVERLAY)
			//if(src.underhair) I.Blend(icon(src.underhair,src.icon_state,dirr),ICON_OVERLAY)
			//if(src.overhair) I.Blend(icon(src.overhair,src.icon_state,dirr),ICON_OVERLAY)
			//if(src.facialhair) I.Blend(icon(src.facialhair,src.icon_state,dirr),ICON_OVERLAY)
			for(var/obj/items/o in src)
				if(o.suffix=="Equipped")
					var/icon/I2 = icon(o.icon,src.icon_state,dirr)
					I.Blend(I2,ICON_OVERLAY)
			for(var/obj/o in src.shopOverlays)
				var/icon/I2 = icon(o.icon,src.icon_state,dirr)
				I.Blend(I2,ICON_OVERLAY)
			src << output("<center><br><BIG>\icon[I]</BIG>","shop.shopPreview")
		addShopItem(var/item,var/cost)
			src.shopCost += cost
			src.shopOverlays += item
			src.updateShopPreview()
	verb
		resetOverlayPreview()
			set hidden = 1
			src << output(null,"shop.shopPreview")
			src.shopOverlays=list()
			var/icon/I = icon(src.icon,src.icon_state,SOUTH)

			for(var/icon/h in hair_stack)
				I.Blend(h, ICON_OVERLAY)
			if(src.facialhair) I.Blend(icon(src.facialhair,src.icon_state,SOUTH),ICON_OVERLAY)
			//if(src.underhair) I.Blend(icon(src.underhair,src.icon_state,SOUTH),ICON_OVERLAY)
			//if(src.overhair) I.Blend(icon(src.overhair,src.icon_state,SOUTH),ICON_OVERLAY)
			//if(src.facialhair) I.Blend(icon(src.facialhair,src.icon_state,SOUTH),ICON_OVERLAY)
			for(var/obj/items/o in src)
				if(o.suffix=="Equipped")
					var/icon/I2 = icon(o.icon,src.icon_state,SOUTH)
					I.Blend(I2,ICON_OVERLAY)
			src.shopCost = 0
			src << output("<center><br><BIG>\icon[I]</BIG>","shop.shopPreview")
		rotateShopPreviewEast()
			set hidden = 1
			updateShopPreview(EAST)
		rotateShopPreviewWest()
			set hidden = 1
			updateShopPreview(WEST)
		rotateShopPreviewSouth()
			set hidden = 1
			updateShopPreview(SOUTH)
		rotateShopPreviewNorth()
			set hidden = 1
			updateShopPreview(NORTH)
		purchaseShopOverlays()
			set hidden = 1
			if(barberShop)
				if(alert("Confirm this cut?","Purchase","Yes","No")=="No") return
				src.closeShop()
				//Hair()
				return
			if(skinCreate)
				if(alert("Confirm skin tone?","Skintone","Yes","No")=="No") return
				src.closeShop()
				return
			if(!shopCost) return
			for(var/obj/items/Ryo/R in src.contents)
				if(alert("Purchase these items for $[src.shopCost]?","Purchase","Yes","No")=="No") return
				if(R.amount>=src.shopCost)
					R.amount-=src.shopCost
					R.Update()
					for(var/obj/o in src.shopOverlays)
						var/obj/n = copyatom(o)
						n.loc = src
						if(src.z == 19)
							n.newbie = 1
					src<<"You hand the shopkeep $[src.shopCost] for the items."
					src.shopCost = 0
					break
				else
					src.custom_alert("You don't have enough cash for this purchase!","Error!")
					break
			src.closeShop()

		closeShop()
			set hidden = 1
			if(!client) return
			src.copy=null
			src.CurrentGrid=list()
			winset(src,"shop","is-visible=false")
			shopCost = 0
			skinCreate = 0
			shopOverlays = list()
			barberShop = null