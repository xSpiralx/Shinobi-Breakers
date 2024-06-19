mob/var/list/jutsurange = list()
mob/var/RangeBox = 0
obj/jutsurange
	icon='JutsuRange.dmi'
	var/owner
	var/uid = 0
	DblClick()
		if(owner == usr.ckey)
			var/my_choice = alert(usr,"Do you want to delete this group of markers?",,"No","Yes")
			if(my_choice == "No")
				return
			usr.clearMarkersByUid(src.uid)
mob
	verb
		Create_Marker()
			//RangeBox=!RangeBox
			//src<<output("<font size = -3>You are [RangeBox ? "now" : "no longer"] able to create markers.","outputic.output")
			//src<<output("<font size = -3>You are [RangeBox ? "now" : "no longer"] able to create markers.","outputall.output")
			usr.CreateMark()
		Clear_Markers()
			for(var/obj/o in usr.jutsurange)
				del(o)
mob/proc/clearMarkersByUid(var/uid as num)
	if(uid < 1)
		return
	for(var/obj/jutsurange/jr in src.jutsurange)
		if(uid == jr.uid)
			src.jutsurange.Remove(jr)
			del(jr)

/mob/proc/CreateMark()
	//var/obj/jutsurange/b = new /obj/jutsurange
	var/my_uid = rand(1,999)
	//b.owner = src.ckey
	//b.loc = target_turf
	//src.jutsurange += b

	//AoE
	//Line
	//Projectile
	var/my_shape = alert(src,"Choose a shape. The shape will be created in whatever direction you are facing.","Marker","AoE","Line","Projectile")
	switch(my_shape)
		if("Line")
			var/my_h = input("Enter a range between 1-7") as num
			if(my_h < 1)
				my_h = min(my_h,7)
			var/my_c = input("What color") as color
			var/turf/dummy_t = get_step(src,0)
			for(var/mob/M in hearers(16,src))
				if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) continue
				if(M.MindAfflicted)
					M.MindAfflicted << output("<i>[M.MindAfflicted.getStrangerName(src)] creates an [my_h] range Line</i>", "outputall.output")
				else M << output("<i>[M.getStrangerName(src)] creates an [my_h] range Line</i>", "outputall.output")

				M.ChatLog("<font color=red>*[src.name] ([src.strangerName]-[src.key]) creates an [my_h] range Line</i>")
			////////////////////////////
			draw_line_marker(my_uid, my_h, my_c, dummy_t)

		if("AoE")
			var/my_w = input("Enter a width between 1-7") as num
			if(my_w < 1)
				return
			var/my_h = input("Enter a height between 1-7") as num
			if(my_h < 1)
				return
			my_w = min(my_w,7)
			my_h = min(my_h,7)

			var/my_c = input("What color") as color
			var/turf/dummy_t = get_step(src,0)
			///////////////////////////tell everyone
			for(var/mob/M in hearers(16,src))
				if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) continue
				if(M.MindAfflicted)
					M.MindAfflicted << output("<i>[M.MindAfflicted.getStrangerName(src)] creates an [my_w]x[my_h] Aoe</i>", "outputall.output")
				else M << output("<i>[M.getStrangerName(src)] creates an [my_w]x[my_h] Aoe</i>", "outputall.output")

				M.ChatLog("<font color=red>*[src.name] ([src.strangerName]-[src.key]) creates an [my_w]x[my_h] Aoe</i>")
			////////////////////////////
			my_w--
			my_w = round(my_w/2)

			draw_line_marker(my_uid, my_h, my_c, dummy_t)

			for(var/i = 0; i < my_w; i++)
				dummy_t = get_step(dummy_t,turn(src.dir, 90))
				draw_line_marker(my_uid, my_h, my_c, dummy_t)

			dummy_t = get_step(src,0)

			for(var/i = 0; i < my_w; i++)
				dummy_t = get_step(dummy_t,turn(src.dir, -90))
				draw_line_marker(my_uid, my_h, my_c, dummy_t)

			if(src.dir != 1 && src.dir != 2 && src.dir != 4 && src.dir != 8)
				dummy_t = get_step(src,turn(src.dir,-45))
				for(var/i = 0; i < my_w; i++)
					draw_line_marker(my_uid, my_h-1, my_c, dummy_t)
					dummy_t = get_step(dummy_t,turn(src.dir,-90))

				dummy_t = get_step(src,turn(src.dir,45))
				for(var/i = 0; i < my_w; i++)
					draw_line_marker(my_uid, my_h-1, my_c, dummy_t)
					dummy_t = get_step(dummy_t,turn(src.dir,90))
			//var/my_matrix[my_w][my_h]



mob/proc
	draw_line_marker(var/my_uid = 0, my_h as num, my_c as color, my_start)
		if(!my_uid)
			my_uid = rand(1,999)
		var/turf/dummy_t = get_step(my_start,0)
		for(var/j = 0; j < my_h; j++)
			if(locate(/obj/jutsurange/) in get_step(dummy_t,src.dir))
				continue
			var/obj/jutsurange/b = new /obj/jutsurange(get_step(dummy_t,src.dir))
			b.uid = my_uid
			b.color = my_c
			b.owner = src.ckey
			src.jutsurange += b
			dummy_t = get_step(b,0)
/*
			if(alert(src,"Create or delete?","Create or Delete","Create","Delete")=="Create")
				//Yes this shit is backwards, I cba to fix it.
				var width=input("How long is  your technique?") as num
				if(width > 7)
					src<<"This is too large!"
					return
				var length=input("How wide is your technique?") as num
				if(length > 7)
					src<<"This is too large!"
					return
				//Uses this to loop through each line and reset width back to the input, so it's always as wide as it should be
				var currentwidth = width
				//Allows for a special iteration at the beginning, where it puts one right in front of your kisser, then on each side for appropriate width.
				var startlength = length

				if(dir==2)
					while(length)
						var/obj/jutsurange/c = new /obj/jutsurange
						if(startlength == length)
							c.loc = locate(src.x, src.y - 1, src.z)
							src.jutsurange += c
							length--
						else
							var/obj/jutsurange/cc = new /obj/jutsurange
							c.loc = locate(src.x - length, src.y - 1 - currentwidth, src.z)
							cc.loc = locate(src.x + length, src.y - 1 - currentwidth, src.z)
							src.jutsurange += c
							src.jutsurange += cc
							length--
						if(currentwidth==0)
							currentwidth=width
						while(currentwidth)
							if(length > 0)
								var/obj/jutsurange/cc = new /obj/jutsurange
								cc.loc = locate(src.x - length, src.y - 1 - currentwidth, src.z)
								src.jutsurange += cc
								var/obj/jutsurange/b = new /obj/jutsurange
								b.loc = locate(src.x + length, src.y - 1 - currentwidth, src.z)
								src.jutsurange += b
								currentwidth--
							else
								var/obj/jutsurange/cc = new /obj/jutsurange
								cc.loc = locate(src.x - length, src.y - 1 - currentwidth, src.z)
								src.jutsurange += cc
								currentwidth--
				if(dir==1)
					while(length)
						var/obj/jutsurange/c = new /obj/jutsurange
						if(startlength == length)
							c.loc = locate(src.x, src.y + 1, src.z)
							src.jutsurange += c
							length--
						else
							var/obj/jutsurange/cc = new /obj/jutsurange
							c.loc = locate(src.x - length, src.y + 1 + currentwidth, src.z)
							cc.loc = locate(src.x + length, src.y + 1 + currentwidth, src.z)
							src.jutsurange += c
							src.jutsurange += cc
							length--
						if(currentwidth==0)
							currentwidth=width
						while(currentwidth)
							if(length > 0)
								var/obj/jutsurange/cc = new /obj/jutsurange
								cc.loc = locate(src.x - length, src.y + 1 + currentwidth, src.z)
								src.jutsurange += cc
								var/obj/jutsurange/b = new /obj/jutsurange
								b.loc = locate(src.x + length, src.y + 1 + currentwidth, src.z)
								src.jutsurange += b
								currentwidth--
							else
								var/obj/jutsurange/cc = new /obj/jutsurange
								cc.loc = locate(src.x + length, src.y + 1 + currentwidth, src.z)
								src.jutsurange += cc
								currentwidth--
				if(dir==4)
					while(length)
						var/obj/jutsurange/c = new /obj/jutsurange
						if(startlength == length)
							c.loc = locate(src.x + 1, src.y, src.z)
							src.jutsurange += c
							length--
						else
							var/obj/jutsurange/cc = new /obj/jutsurange
							c.loc = locate(src.x + 1 + currentwidth, src.y - length , src.z)
							cc.loc = locate(src.x + 1 + currentwidth, src.y + length, src.z)
							src.jutsurange += c
							src.jutsurange += cc
							length--
						if(currentwidth==0)
							currentwidth=width
						while(currentwidth)
							if(length > 0)
								var/obj/jutsurange/cc = new /obj/jutsurange
								cc.loc = locate(src.x + 1 + currentwidth, src.y - length, src.z)
								src.jutsurange += cc
								var/obj/jutsurange/b = new /obj/jutsurange
								b.loc = locate(src.x + 1 + currentwidth, src.y + length, src.z)
								src.jutsurange += b
								currentwidth--
							else
								var/obj/jutsurange/cc = new /obj/jutsurange
								cc.loc = locate(src.x  + 1 + currentwidth, src.y + length, src.z)
								src.jutsurange += cc
								currentwidth--
				if(dir==8)
					while(length)
						var/obj/jutsurange/c = new /obj/jutsurange
						if(startlength == length)
							c.loc = locate(src.x - 1, src.y, src.z)
							src.jutsurange += c
							length--
						else
							var/obj/jutsurange/cc = new /obj/jutsurange
							c.loc = locate(src.x - 1 - currentwidth, src.y - length , src.z)
							cc.loc = locate(src.x - 1 - currentwidth, src.y + length, src.z)
							src.jutsurange += c
							src.jutsurange += cc
							length--
						if(currentwidth==0)
							currentwidth=width
						while(currentwidth)
							if(length > 0)
								var/obj/jutsurange/cc = new /obj/jutsurange
								cc.loc = locate(src.x - 1 - currentwidth, src.y - length, src.z)
								src.jutsurange += cc
								var/obj/jutsurange/b = new /obj/jutsurange
								b.loc = locate(src.x - 1 - currentwidth, src.y + length, src.z)
								src.jutsurange += b
								currentwidth--
							else
								var/obj/jutsurange/cc = new /obj/jutsurange
								cc.loc = locate(src.x  - 1 - currentwidth, src.y + length, src.z)
								src.jutsurange += cc
								currentwidth--
				else
					usr << "Only NSEW are currently supported."

			else
				for(var/obj/o in src.jutsurange)
					del(o)
*/

/*
mob/var/tmp/list/highlights = list()
obj/tile_highlight
    icon = 'tile highlight.dmi'
mob/Admin2/verb/removeAllTileHighlights()
    set category = "Admin"
    set name = "Remove Tile Checkers"
    for(var/obj/tile_highlight/o in world)
        o.loc = null
    for(var/mob/m in world)
        m.highlights = list()
mob/verb/checkTiles()
    set name = "Create Area"
    set category = "Combat"

    if(highlights.len)
        for(var/obj/i in highlights)
            i.loc = null
            highlights.Remove(i)
        highlights = list()
        return
    var/size = input(src,"How big of a zone are you creating?") as num
    if(size <= 0)
        alert(src,"Too small!")
        return
    if(size > 13)
        alert(src,"Too big!")
        return
    var/color = input(src,"What color?") as color

    var/mob/ControlledMob=src
    if(MindTransfer)
        ControlledMob=MindTransfer
    for(var/turf/t in view(size,ControlledMob))
        var/SameSpot=0
        for(var/obj/tile_highlight/L in highlights)
            if(L.loc == t.loc)
                SameSpot = 1
                break
        if(!SameSpot)
            var/obj/tile_highlight/highlight = new(t)
            highlights.Add(highlight)
            highlight.icon += color
            highlight.layer = 3
            highlight.loc = t
mob/verb/removeTiles()
    set name = "Remove Area"
    set category = "Combat"

    if(highlights.len)
        for(var/obj/i in highlights)
            i.loc = null
            highlights.Remove(i)
        highlights = list()
        return*/