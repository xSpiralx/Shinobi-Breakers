


var/create_object_html = null

mob/Admin3/verb/CreateMovableObject()
	set name = "Create Item Interface"
	set category = "Event"
	if(!create_object_html)
		var/objectjs = null
		objectjs = jointext(typesof(/atom/movable), ";")
		create_object_html = file2text('galion/html/create_object.html')
		create_object_html = replacetext(create_object_html, "null /* object types */", "\"[objectjs]\"")

	src << browse(replacetext(create_object_html, "/* ref src */", "\ref[src]"), "window=create_object;size=425x475")

mob/Topic(href, href_list)
	..()
	if(href_list["object_list"])



	//	var/atom/new_object

//		var/atom/loc = usr.loc

		var/dirty_paths
		if(istext(href_list["object_list"]))
			dirty_paths = list(href_list["object_list"])
		else if(istype(href_list["object_list"], /list))
			dirty_paths = href_list["object_list"]

		var/paths = list()

		for(var/dirty_path in dirty_paths)
			var/path = text2path(dirty_path)
			if(!path)
				continue
			else if(!ispath(path, /obj) && !ispath(path, /turf) && !ispath(path, /mob))
				continue
			paths += path

		if(!paths)
			world << "NO"
			alert("The path list you sent is empty")
			return
		if(length(paths) > 5)
			world << "NONO"
			alert("Select fewer object types, (max 5)")
			return

	//	var/atom/target //Where the object will be spawned

		var/where = href_list["object_where"]
		switch(where)
			if("onfloor")
				for(var/path in paths)
					new path(locate(x, y, z))
			if("inmarked")
				for(var/path in paths)
					var/atom/O = new path
					if(ismob(Selected))
						var/mob/mmm = Selected
						mmm.contents += O
					else
						usr << "You don't have anybody selected."