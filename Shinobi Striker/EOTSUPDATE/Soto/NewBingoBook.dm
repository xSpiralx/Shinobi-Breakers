/mob/var/tmp/editing_bingobook = 0

mob/verb/BingoBook()
	set hidden = 1
	winset(usr,"BingoBook","is-visible=true")
	winset(usr,"BingoBook.grid1","cells=0x0")
	winset(src,"mainscreen.childtabpanes", "right=BingoBook")
	var/row = 1

	usr << output("<font color=#DDBE0D>Name", "BingoBook.grid1:1,1")
	usr << output("<font color=#DDBE0D>Grade", "BingoBook.grid1:2,1")
	usr << output("<font color=#DDBE0D>Bounty", "BingoBook.grid1:3,1")
	usr << output("<font color=#DDBE0D>Status", "BingoBook.grid1:4,1")

	usr << output("<font color=#DDBE0D>Name", "BingoBook.grid2:1,1")
	usr << output("<font color=#DDBE0D>Moniker", "BingoBook.grid2:1,2")
	usr << output("<font color=#DDBE0D>Village", "BingoBook.grid2:1,3")
	usr << output("<font color=#DDBE0D>Location", "BingoBook.grid2:1,4")

	for(var/obj/BingoBookEntry/k in archive)
		row++
		usr << output(k, "BingoBook.grid1:1,[row]")
		usr << output("[k.grade]-rank", "BingoBook.grid1:2,[row]")
		usr << output("[k.bounty] ryo", "BingoBook.grid1:3,[row]")
		usr << output("Inactive","BingoBook.grid1:4,[row]")

		for(var/mob/d in world)
			if(k.name == d.name && d.client && d.Dead!=1)
				usr << output(null, "BingoBook.grid1:4,[row]")
				usr << output("Active", "BingoBook.grid1:4,[row]")

		if(k.killed)
			usr << output(null, "BingoBook.grid1:4,[row]")
			usr << output("Deceased", "BingoBook.grid1:4,[row]")


mob/verb/BecomeMissingNin()
	set hidden = 1
	if(usr.Village == "None")
		alert("You have already become a missing-nin.")
	else
		switch(input("Are you sure you wish to leave your village and become a missing-ninja? This cannot be undone.","Confirmation") in list("No","Yes"))
			if("No")
				return
			else
				AddToBingoBook()
				usr.Village = "None"
				usr.Class = "Criminal"
				alert("You have chosen to abandon your village.")
				usr.progress_points += 15
				usr.lifetime_progress_points += 15
				archive.save_archive()


mob/proc/AddToBingoBook()
	var/obj/BingoBookEntry/B = new(archive)
	B.name = usr.name
	B.bounty = 0
	B.village = usr.Village
	updateBingoBookGrade()
	updateBingoBookPhoto()
	updateBingoBookPhotoA()
	updateBingoBookPhotoB()

mob/verb/EditProfile()
	set hidden = 1
	profile=input(usr,"Edit","Edit Profile",profile) as message

obj/BingoBookEntry
	var
		grade
		bounty
		village
		moniker = "None"
		icon/lastphoto
		icon/lastphotoA
		icon/lastphotoB
		killed = 0

	Click()

		usr << output("[name]", "BingoBook.grid2:2,1")
		usr << output("[moniker]", "BingoBook.grid2:2,2")
		usr << output("[village]", "BingoBook.grid2:2,3")
		usr << output("Unknown", "BingoBook.grid2:2,4")

		/*for(var/mob/n in world)
			if(name == n.name && n.client)
				updateBingoBookPhoto()
				updateBingoBookPhotoA()
				updateBingoBookPhotoB()
			else*/

		usr << output(null,"BingoBook.Photo")
		usr << output("<center><BIG>\icon[lastphoto]</BIG>","BingoBook.Photo")

		usr << output(null,"BingoBook.PhotoA")
		usr << output("<center><BIG>\icon[lastphotoA]</BIG>","BingoBook.PhotoA")

		usr << output(null,"BingoBook.PhotoB")
		usr << output("<center><BIG>\icon[lastphotoB]</BIG>","BingoBook.PhotoB")


mob
	proc
		updateBingoBookPhoto(var/dirr = SOUTH)
			var/mob/criminal

			for(var/obj/BingoBookEntry/o in archive)
				if (o.name == usr.name)
					criminal = usr

			var/icon/I = icon(criminal.icon,criminal.icon_state,dirr)
			for(var/icon/h in criminal.hair_stack)
				I.Blend(h, ICON_OVERLAY)
			if(criminal.facialhair) I.Blend(icon(criminal.facialhair,criminal.icon_state,dirr),ICON_OVERLAY)
			for(var/obj/items/o in criminal.contents)
				if(o.suffix=="Equipped")
					var/icon/I2 = icon(o.icon,src.icon_state,dirr)
					I.Blend(I2,ICON_OVERLAY)

			I.Crop(11,16,21,32)

			for(var/obj/BingoBookEntry/o in archive)
				if(o.name == usr.name)
					o.lastphoto = I

		updateBingoBookPhotoA(var/dirr = EAST)
			var/mob/criminal


			for(var/obj/BingoBookEntry/o in archive)
				if (o.name == usr.name)
					criminal = usr

			var/icon/I = icon(criminal.icon,criminal.icon_state,dirr)
			for(var/icon/h in criminal.hair_stack)
				var/icon/u = icon(h.icon,src.icon_state,dirr)
				I.Blend(u, ICON_OVERLAY)
			if(criminal.facialhair) I.Blend(icon(criminal.facialhair,criminal.icon_state,dirr),ICON_OVERLAY)
			for(var/obj/items/o in criminal.contents)
				if(o.suffix=="Equipped")
					var/icon/I2 = icon(o.icon,src.icon_state,dirr)
					I.Blend(I2,ICON_OVERLAY)

			I.Crop(9,16,22,32)

			for(var/obj/BingoBookEntry/o in archive)
				if(o.name == criminal.name && criminal.client)
					o.lastphotoA = I

		updateBingoBookPhotoB(var/dirr = NORTH)
			var/mob/criminal


			for(var/obj/BingoBookEntry/o in archive)
				if (o.name == usr.name)
					criminal = usr

			var/icon/I = icon(criminal.icon,criminal.icon_state,dirr)
			for(var/icon/h in criminal.hair_stack)
				var/icon/u = icon(h.icon,src.icon_state,dirr)
				I.Blend(u, ICON_OVERLAY)
			if(criminal.facialhair) I.Blend(icon(criminal.facialhair,criminal.icon_state,dirr),ICON_OVERLAY)
			for(var/obj/items/o in criminal.contents)
				if(o.suffix=="Equipped")
					var/icon/I2 = icon(o.icon,src.icon_state,dirr)
					I.Blend(I2,ICON_OVERLAY)

			I.Crop(11,16,21,32)

			for(var/obj/BingoBookEntry/o in archive)
				if(o.name == criminal.name && criminal.client)
					o.lastphotoB = I

		updateBingoBookGrade()
			for(var/obj/BingoBookEntry/o in archive)
				if(o.name == usr.name)
					if(usr.Grade == "E")
						o.grade = "D"
					if(usr.Grade == "E+")
						o.grade = "D"

					if(usr.Grade == "D-")
						o.grade = "D"
					if(usr.Grade == "D+")
						o.grade = "D"

					if(usr.Grade == "C-")
						o.grade = "C"
					if(usr.Grade == "C")
						o.grade = "C"
					if(usr.Grade == "C+")
						o.grade = "C"

					if(usr.Grade == "B-")
						o.grade = "B"
					if(usr.Grade == "B")
						o.grade = "B"
					if(usr.Grade == "B+")
						o.grade = "B"

					if(usr.Grade == "A-")
						o.grade = "A"
					if(usr.Grade == "A")
						o.grade = "A"
					if(usr.Grade == "A+")
						o.grade = "A"

					if(usr.Grade == "S-")
						o.grade = "S"
					if(usr.Grade == "S")
						o.grade = "S"
					if(usr.Grade == "S+")
						o.grade = "S"

/mob/Admin3/verb/Edit_BingoBook()
	set category = "Admin"
	editing_bingobook = !editing_bingobook
	archive.save_archive()