/mob/Admin4/verb/call_proc()
	set category = "Admin"
	set name = "Call Proc (Advanced Users)"

	var/target = null
	var/lst[]
	lst = new/list()
	var/returnval = null
	var/class = null

	switch(alert("Proc owned by something?",,"Yes","No"))
		if("Yes")
			class = input("Proc owned by...","Owner") in list("Obj","Mob","Area or Turf","Client","CANCEL ABORT STOP")
			switch(class)
				if("CANCEL ABORT STOP")
					return
				if("Obj")
					target = input("Enter target:","Target",usr) as obj in world
				if("Mob")
					target = input("Enter target:","Target",usr) as mob in world
				if("Area or Turf")
					target = input("Enter target:","Target",usr.loc) as area|turf in world
				if("Client")
					var/list/keys = list()
					for(var/mob/M in world)
						keys += M.client
					target = input("Please, select a player!", "Selection", null, null) as null|anything in keys
		if("No")
			target = null

	var/procname = input("Proc path, eg: /proc/fake_blood","Path:", null)

	var/argnum = input("Number of arguments","Number:",0) as num

	lst.len = argnum // Expand to right length

	var/i
	for(i=1, i<argnum+1, i++) // Lists indexed from 1 forwards in byond

		// Make a list with each index containing one variable, to be given to the proc
		class = input("What kind of variable?","Variable Type") in list("text","num","type","reference","mob reference","icon","file","client","mob's area","CANCEL")
		switch(class)
			if("CANCEL")
				return

			if("text")
				lst[i] = input("Enter new text:","Text",null) as text

			if("num")
				lst[i] = input("Enter new number:","Num",0) as num

			if("type")
				lst[i] = input("Enter type:","Type") in typesof(/obj,/mob,/area,/turf)

			if("reference")
				lst[i] = input("Select reference:","Reference",src) as mob|obj|turf|area in world

			if("mob reference")
				lst[i] = input("Select reference:","Reference",usr) as mob in world

			if("file")
				lst[i] = input("Pick file:","File") as file

			if("icon")
				lst[i] = input("Pick icon:","Icon") as icon

			if("client")
				var/list/keys = list()
				for(var/mob/M in world)
					keys += M.client
				lst[i] = input("Please, select a player!", "Selection", null, null) as null|anything in keys

			if("mob's area")
				var/mob/temp = input("Select mob", "Selection", usr) as mob in world
				lst[i] = temp.loc


	spawn(0)
		if(target)
			returnval = call(target,procname)(arglist(lst))
		else
			returnval = call(procname)(arglist(lst))
	usr << "\blue Proc returned: [returnval ? returnval : "null"]"