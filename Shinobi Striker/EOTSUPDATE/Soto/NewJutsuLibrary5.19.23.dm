mob/verb/Jutsu_Library()
	set hidden = 1
	winset(usr,"JutsuList","is-visible=true")
	winset(usr,"JutsuList.grid","cells=0x0")
	winset(src,"JutsuList.Photo","image=\ref[fcopy_rsc('jutsu_listpic.png')]")
	winset(src,"JutsuList.Photo","image-mode=stretch")
	winset(src,"mainscreen.childtabpanes", "right=JutsuList")
	var/row = 1

	usr << output("<font color=#DDBE0D>Jutsu", "JutsuList.grid:1,1")
	usr << output("<font color=#DDBE0D>Requirements", "JutsuList.grid:2,1")
	usr << output("<font color=#DDBE0D>Rank", "JutsuList.grid:3,1")
	usr << output("<font color=#DDBE0D>Cost", "JutsuList.grid:4,1")
	usr << output("<font color=#DDBE0D>Purchase", "JutsuList.grid:5,1")

	usr << output(null, "JutsuList.LeftOverCores")

	for(var/obj/jutsu/o in archive)
		if(o.jutsu_type == "perk" || o.unique_tech) return

		if(usr.Clan in o.can_purchase)
			row++
			usr << output("<a href=?src=\ref[usr];action=Preview;perk=[md5(o.name)]>[o.name]</a>", "JutsuList.grid:1,[row]")

			var/requirements
			for(var/i in o.prerequisites)
				requirements += requirements ? "<br>[i]" : "[i]"

			usr << output("[requirements]", "JutsuList.grid:2,[row]")
			usr << output("[o.jutsu_rank]", "JutsuList.grid:3,[row]")
			usr << output("[o.ryo_cost] ryo", "JutsuList.grid:4,[row]")
			usr << output("<a href=?src=\ref[usr];action=Purchase;perk=[md5(o.name)]>Buy</a>", "JutsuList.grid:5,[row]")

		if(usr.Village in o.can_purchase)
			row++
			usr << output("<a href=?src=\ref[usr];action=Preview;perk=[md5(o.name)]>[o.name]</a>", "JutsuList.grid:1,[row]")

			var/requirements
			for(var/i in o.prerequisites)
				requirements += requirements ? "<br>[i]" : "[i]"

			usr << output("[requirements]", "JutsuList.grid:2,[row]")
			usr << output("[o.jutsu_rank]", "JutsuList.grid:3,[row]")
			usr << output("[o.ryo_cost] ryo", "JutsuList.grid:4,[row]")
			usr << output("<a href=?src=\ref[usr];action=Purchase;perk=[md5(o.name)]>Buy</a>", "JutsuList.grid:5,[row]")


obj/jutsu/var
	ryo_cost = 10
	jutsu_rank = "C-Rank"
	jutsu_village = "Locked"
	jutsu_village2 = "Locked"
	jutsu_clan = "Locked"
	unique_tech = 0

	english_name = ""
	video = "..."

	list/can_purchase = list()



mob/verb/Unique_List()
	set hidden = 1
	winset(usr,"UniqueList","is-visible=true")
	winset(usr,"UniqueList.grid","cells=0x0")
	winset(src,"mainscreen.childtabpanes", "right=UniqueList")
	winset(src,"UniqueList.Photo","image=\ref[fcopy_rsc('unique_listpic.jpeg')]")
	winset(src,"UniqueList.Photo","image-mode=stretch")
	var/row = 1

	usr << output("<font color=#DDBE0D>Unique", "UniqueList.grid:1,1")
	usr << output("<font color=#DDBE0D>Requirements", "UniqueList.grid:2,1")
	usr << output("<font color=#DDBE0D>Rank", "UniqueList.grid:3,1")
	usr << output("<font color=#DDBE0D>Cost", "UniqueList.grid:4,1")
	usr << output("<font color=#DDBE0D>Purchase", "UniqueList.grid:5,1")

	usr << output(null, "JutsuList.LeftOverCores")

	for(var/obj/jutsu/o in archive)
		if(o.jutsu_type != "perk" && o.unique_tech == 1)
			row++
			usr << output("[o.name]", "UniqueList.grid:1,[row]")

			var/requirements
			for(var/i in o.prerequisites)
				requirements += requirements ? "<br>[i]" : "[i]"

			usr << output("[requirements]", "UniqueList.grid:2,[row]")
			usr << output("[o.jutsu_rank]", "UniqueList.grid:3,[row]")
			usr << output("[o.point_cost] point(s)", "UniqueList.grid:4,[row]")
			usr << output("<a href=?src=\ref[usr];action=Purchase;perk=[md5(o.name)]>Create</a>", "UniqueList.grid:5,[row]")
