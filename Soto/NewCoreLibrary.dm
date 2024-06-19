mob/verb/Core_Library()
	set hidden = 1
	winset(usr,"CoreList","is-visible=true")
	winset(src,"CoreList.Photo","image=\ref[fcopy_rsc('core_listpic.png')]")
	winset(src,"CoreList.Photo","image-mode=stretch")
	winset(usr,"CoreList.grid","cells=0x0")
	winset(src,"mainscreen.childtabpanes", "right=CoreList")
	var/row = 1

	usr << output("<font color=#DDBE0D>Perk", "CoreList.grid:1,1")
	usr << output("<font color=#DDBE0D>Slots", "CoreList.grid:2,1")
	usr << output("<font color=#DDBE0D>Cost", "CoreList.grid:3,1")
	usr << output("<font color=#DDBE0D>Purchase", "CoreList.grid:4,1")

	usr << output(null, "CoreList.LeftOverCores")
	usr << output("<center>You have [usr.core_slots] slot(s) remaining", "CoreList.LeftOverCores")

	for(var/obj/jutsu/o in archive)
		if(o.jutsu_type == "perk" && o.perk_type == "Core")
			row++
			usr << output("<a href=?src=\ref[usr];action=Perk;perk=[md5(o.name)]>[o.name]", "CoreList.grid:1,[row]")
			usr << output("[o.core_cost]", "CoreList.grid:2,[row]")
			usr << output("[o.point_cost] point(s)", "CoreList.grid:3,[row]")
			usr << output("<a href=?src=\ref[usr];action=Purchase;perk=[md5(o.name)]>Buy</a>", "CoreList.grid:4,[row]")



obj/jutsu/var/core_cost = 0
mob/var/core_slots = 10