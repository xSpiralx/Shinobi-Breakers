mob/librarian
	icon='Base_Pale.dmi'
	icon_state=""
	attackable=0
	New()
		spawn()src.AddHair()
		spawn()src.AddOverlays()
		..()
	Click()
		if(usr.libCD)
			usr<<"You've already borrowed a scroll. You have to wait some time before borrowing another."
			return
		var/obj/jutsu/choice
		if(istype(src, /mob/librarian/rogue))
			choice = input("Which scroll would you like to borrow?") in archive.roguescrollinv + "Cancel"
		if(istype(src, /mob/librarian/otogakure))
			choice = input("Which scroll would you like to borrow?") in archive.otogakurescrollinv + "Cancel"
		if(istype(src, /mob/librarian/uzushiogakure))
			choice = input("Which scroll would you like to borrow?") in archive.uzushiogakurescrollinv + "Cancel"
		if(istype(src, /mob/librarian/yukigakure))
			choice = input("Which scroll would you like to borrow?") in archive.yukigakurescrollinv + "Cancel"
		if(choice == "Cancel") return
		var/obj/items/jutsu_scroll/scroll = new
		scroll.name = "{Jutsu formula} [choice.name]"
		scroll.source = choice.name
		var/cost = getlibcost(choice.JutsuRank)
		var/hasryo
		for(var/obj/items/Ryo/R in usr.contents)
			hasryo=R
		if(hasryo)
			if(hasryo:amount >= cost)
				hasryo:amount -= cost
				hasryo:Update()
				usr.contents += scroll
				usr.libCD = 1
				usr.libtimer = elapsedtime + 14

proc/getlibcost(var/i)
	if(i == "A")
		return archive.ARyoCost
	if(i == "B")
		return archive.BRyoCost
	if(i == "C")
		return archive.CRyoCost
	if(i == "D")
		return archive.DRyoCost
	else
		return 3000
mob/proc/Library_CD()
	if(libtimer >= elapsedtime)
		libCD = 0
		src<<"You can now borrow another scroll from the library."

mob/librarian/yukigakure
	name = "Konohagakure Librarian"
mob/librarian/otogakure
	name = "Kirigakure Librarian"
mob/librarian/uzushiogakure
	name = "Sunagakure Librarian"
mob/librarian/rogue
	name = "Rogue Librarian"