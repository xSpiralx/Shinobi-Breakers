mob/var/list/jutsurange = list()
mob/var/RangeBox = 0
obj/jutsurange
	icon='JutsuRange.dmi'
mob
	verb
		Toggle_Marker()
				RangeBox=!RangeBox
				src<<output("<font size = -3>You are [JutsuRange ? "now" : "no longer"] able to create markers.","outputic.output")
				src<<output("<font size = -3>You are [JutsuRange ? "now" : "no longer"] able to create markers.","outputall.output")
		Clear_Markers()
			for(var/obj/o in usr.jutsurange)
				del(o)
			jutsurange = list()
/mob/proc/CreateMarker(turf/target_turf)			
	var/obj/jutsurange/b = new /obj/jutsurange
	b.loc = target_turf
	src.jutsurange += b


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
        return