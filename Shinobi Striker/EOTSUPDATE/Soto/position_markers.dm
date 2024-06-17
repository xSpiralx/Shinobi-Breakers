
mob/var/positionMarkers[1]

position_marker
	parent_type = /obj

	var/obj/counter
	var/creation_time
	var/owner
	layer = 999
	alpha = 155

	New(mob/user,num)
		..()
		icon = user.get_flat_icon()
		loc = user.loc
		dir = user.dir
		creation_time = world.realtime
		owner = user.key

		vis_contents += counter = new
		counter.filters += filter(type="outline",size=0.5)
		counter.maptext = "<font color=white size=1 face='Calibri'><font valign=top><center><b>[num]"
		counter.maptext_x = 10
		counter.maptext_y = 5

	Click()
		if(usr.key == owner)
			var/choice = input(usr,"Delete this marker?") in list("No","Yes")
			if(choice == "Yes")
				for(var/mob/M in hearers(16))
					M << output("[M.getStrangerName(usr)] has deleted position marker [counter.maptext]","outputall.output")
				usr.positionMarkers.Remove(src)
				del(src)
		else
			if(length(hearers(1)) > 0)
				for(var/mob/M2 in hearers(1))
					if(M2.key == owner)
						M2.Click()

	DblClick()
		if(length(hearers(1)) > 0)
			for(var/mob/M2 in hearers(1))
				if(M2.key == owner)
					M2.DblClick()

mob/verb/position_marker()
	var/position_marker/marker = new(usr,"[positionMarkers.len]")
	positionMarkers.Add(marker)

mob/verb/clear_position_markers()
	for(var/position_marker/p in world)
		if(p.owner == key)
			p.loc = null
	positionMarkers = new/list(1)