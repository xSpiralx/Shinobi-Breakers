obj/items
	var
		databookname

obj/items
	DblClick()
		for(var/mob/M in hearers(16, usr))
			M << output("<font size=-2><font color=white>[M.getStrangerName(usr)] showed the description for: <a href=?databook_[databookname]>[name]</a>!</font>", "outputall.output")
