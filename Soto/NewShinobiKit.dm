mob/var/shinobikit_limit = 5
mob/var/shinobikit_current = 0

mob/var/list/ShinobiKit = list()


mob/verb/ShinobiKitOpen()
	set hidden = 1
	winset(usr,"ShinobiKit.grid","cells=0x0")
	winset(src,"mainscreen.childtabpanes", "right=ShinobiKit")
	var/row = 1

	usr << output("<b>Contents","ShinobiKit.grid:1,1")
	usr << output("<b><center>Slots ([shinobikit_current]/[shinobikit_limit])","ShinobiKit.grid:2,1")

	for(var/obj/items/weapons/o in usr.ShinobiKit)
		row++
		usr << output(o,"ShinobiKit.grid:1,[row]")
		usr << output("<center>[o.slots] slot(s)","ShinobiKit.grid:2,[row]")




obj/items/weapons
	MouseDrop(A,B,C,D,E,F)
		var/math = usr.shinobikit_current + src.slots
		if(E == "ShinobiKit.grid")
			if(src in usr.contents)
				if(!src.kitexcluded && math <= usr.shinobikit_limit)
					usr.ShinobiKit += src
					usr.contents -= src
					usr.shinobikit_current += src.slots
					//usr << "You have added [src.name] to your shinobi kit."
					for(var/mob/M in viewers(16))
						M << output("<font size=-2><font color=white>[M.getStrangerName(usr)] has added <a href=?databook_[databookname]>[name]</a> to their shinobi kit. This item takes up [src.slots] slots</font>", "outputall.output")
					usr.ShinobiKitOpen()

		if(E == "tabpane.info1")
			if(src in usr.ShinobiKit)
				usr.ShinobiKit -= src
				usr.contents += src
				usr.shinobikit_current -= src.slots
				//usr << "You have removed [src.name] from your shinobi kit."
				for(var/mob/M in viewers(16))
					M << output("<font size=-2><font color=white>[M.getStrangerName(usr)] has removed <a href=?databook_[databookname]>[name]</a> from their shinobi kit.</font>", "outputall.output")
				usr.ShinobiKitOpen()