/*
mob/var/InventoryOpen = 0

mob/verb/Inventory()
	set hidden = 1
	winset(usr,"money","cells=0x0")

	if(usr.InventoryOpen == 1)
		winshow(src,"Inventory",0)
		usr.InventoryOpen = 0
	else
		winshow(src,"Inventory",1) //Show the inventory window!
		usr.InventoryOpen = 1


		for(var/Grid/G in src.client.screen)
			del(G)   //Clear the inventory before generating everything inside.
		for(var/Column = 1 to 11) for(var/Row = 1 to 9) //Create a grid composed of 11 columns and 5 rows.
			var/Grid/G = new
			G.screen_loc = "Inv:[Column],[Row]"
			src.client.screen += G
		for(var/obj/items/I in src.contents)
			if(I.name != "Ryo")
				src.AddItems(I) //Generate the items on slots.

		for(var/obj/items/Ryo/R in src.contents)
			usr << output("[num2text(R.amount)]","money:1,1")

mob/proc/AddItems(obj/items/I)
	for(var/Grid/G in src.client.screen)
		if(G.used) continue
		I.screen_loc = G.screen_loc ; src.client.screen+=I
		G.used =1 ; return

Grid
	parent_type = /obj
	icon = 'NewInventory.dmi'
	icon_state = "Grid"
	var/used = 0
*/