/mob/Admin4/verb/cmd_mass_modify_object_variables(obj/O as obj|mob|turf|area in world)
	set category = "Admin"
	set name = "Edit Variables (Mass edit)"
	set desc="(target) Edit a target item's variables"
	src.mass_modify_variables(O)

/mob/proc/mass_modify_variables(var/atom/O)

	var/list/names = list()
	for (var/V in O.vars)
		names += V

	names = names

	var/variable = input("Which var?","Var") as null|anything in names
	if(!variable)
		return
	var/default
	var/var_value = O.vars[variable]
	var/dir

	if(isnull(var_value))
		usr << "Unable to determine variable type."

	else if(isnum(var_value))
		usr << "Variable appears to be <b>NUM</b>."
		default = "num"
		dir = 1

	else if(istext(var_value))
		usr << "Variable appears to be <b>TEXT</b>."
		default = "text"

	else if(isloc(var_value))
		usr << "Variable appears to be <b>REFERENCE</b>."
		default = "reference"

	else if(isicon(var_value))
		usr << "Variable appears to be <b>ICON</b>."
		var_value = "\icon[var_value]"
		default = "icon"

	else if(istype(var_value,/atom) || istype(var_value,/datum))
		usr << "Variable appears to be <b>TYPE</b>."
		default = "type"

	else if(istype(var_value,/list))
		usr << "Variable appears to be <b>LIST</b>."
		usr << "Cannot mass edit lists."
		default = "list"
		return

	else if(istype(var_value,/client))
		usr << "Variable appears to be <b>CLIENT</b>."
		usr << "Cannot mass edit clients."
		default = "cancel"
		return

	else
		usr << "Variable appears to be <b>FILE</b>."
		usr << "Cannot mass edit files."
		default = "file"
		return

	usr << "Variable contains: [var_value]"
	if(dir)
		switch(var_value)
			if(1)
				dir = "NORTH"
			if(2)
				dir = "SOUTH"
			if(4)
				dir = "EAST"
			if(8)
				dir = "WEST"
			if(5)
				dir = "NORTHEAST"
			if(6)
				dir = "SOUTHEAST"
			if(9)
				dir = "NORTHWEST"
			if(10)
				dir = "SOUTHWEST"
			else
				dir = null
		if(dir)
			usr << "If a direction, direction is: [dir]"

	var/class = input("What kind of variable?","Variable Type",default) as null|anything in list("text",
		"num","type","reference","mob reference", "icon","file","list","edit referenced object","restore to default")

	if(!class)
		return

	switch(class)

		if("restore to default")
			O.vars[variable] = initial(O.vars[variable])

		if("edit referenced object")
			return .(O.vars[variable])

		if("text")
			O.vars[variable] = input("Enter new text:","Text",\
				O.vars[variable]) as text

		if("num")
			O.vars[variable] = input("Enter new number:","Num",\
				O.vars[variable]) as num

		if("type")
			O.vars[variable] = input("Enter type:","Type",O.vars[variable]) \
				in typesof(/obj,/mob,/area,/turf)

		if("reference")
			O.vars[variable] = input("Select reference:","Reference",\
				O.vars[variable]) as mob|obj|turf|area in world

		if("mob reference")
			O.vars[variable] = input("Select reference:","Reference",\
				O.vars[variable]) as mob in world

		if("file")
			O.vars[variable] = input("Pick file:","File",O.vars[variable]) \
				as file

		if("icon")
			O.vars[variable] = input("Pick icon:","Icon",O.vars[variable]) \
				as icon

	for(var/atom/A)
		if(A.type == O.type)
			A.vars[variable] = O.vars[variable]