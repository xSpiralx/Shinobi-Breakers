//Coding in each one, because fuck the 500 hour load times
turf/RehaulTextures/Outside
	layer=90
	Tent
		icon='Tent.dmi'
		icon_state="1"
	Shelf
		icon='pubrac1.dmi'
		icon_state = "1"
	Shelf2
		icon='pubrac2.dmi'
		icon_state = "1"
	Blacksmithsign
		icon='signbla.dmi'
		icon_state = "1"
	Jail
		icon='signjai.dmi'
		icon_state = "1"
	BigRock
		icon='Rock2.dmi'
		icon_state="1"
	LittleRock
		icon='Rock2.dmi'
		icon_state="2"
	Log1
		icon='Rock2.dmi'
		icon_state="3"
	Log2
		icon='Rock2.dmi'
		icon_state="4"
	Log3
		icon='Rock2.dmi'
		icon_state="5"
	Roots1
		icon='roots.dmi'
		icon_state="1"
	Roots2
		icon='roots.dmi'
		icon_state="2"
	Roots3
		icon='roots.dmi'
		icon_state="3"
	Roots4
		icon='roots.dmi'
		icon_state="4"
	TreeLeafy
		icon='treescool.dmi'
		icon_state="1"
	TreeLightSmall
		icon='treescool.dmi'
		icon_state="2"
	TreeDarkSmall
		icon='treescool.dmi'
		icon_state="3"
	TreeDedass
		icon='treescool.dmi'
		icon_state="4"
	Watertree
		icon='water tree.dmi'
		icon_state="1"
	Caveent
		icon='caveent1.dmi'
		icon_state="1"

		icon='caveent2.dmi'
		icon_state="1"

obj/tacoabitch
	Door
		layer = 30
		icon='new door.dmi'
		icon_state="closed"
		density=1
		var/Opacity=1
		var/password=null
		var/Locked=0
		New()
			..()

			if(Opacity)
				opacity=1
			if(z!=7&&z!=8)
				opacity = 0
				Opacity = 0
		Click()
			if(get_dist(src,usr)>1) return
			if(usr.RecentVerbCheck("Knock", 100,1)) return
			usr.recentverbs["Knock"]=world.realtime
			var/GoesHome=0
			var/turf/T=src.loc
			if(!T) return
			if(istype(T,/turf/WARPERHOMES/)) GoesHome=T

			if(istype(T,/turf/WARPERSUNA/)) GoesHome=T
			if(istype(T,/turf/WARPERCOUNTRY/)) GoesHome=T
			if(GoesHome)
				for(var/mob/M in range(14))
					M<<output("[usr] knocks on the door.","ICout")
					M<<output("[usr] knocks on the door.","OOCout")
				for(var/mob/M in range(14,GoesHome:goingto))
					M<<output("[usr] knocks on the door.","ICout")
					M<<output("[usr] knocks on the door.","OOCout")
			else
				for(var/mob/M in range(14))
					M<<output("[usr] knocks on the door.","ICout")
					M<<output("[usr] knocks on the door.","OOCout")

		proc/Open()
			layer=30
			flick("opening",src)
			icon_state="open"
			if(Opacity) opacity=0
			density=0
			spawn(30)
				layer=30
				flick("closing",src)
				icon_state="closed"
				density=1
				layer=30
				if(Opacity) opacity=1
turf/RehaulTextures/Outside
	Lilypad
		icon='lilypad.dmi'
		icon_state="1"

	Lilypad3
		icon='lilypad.dmi'
		icon_state="lily"
		layer=3.999
	Lilypad2
		icon='lilypad2.dmi'
		icon_state="1"
	Lilypad4
		icon='lilypad2.dmi'
		icon_state="lilypad"
		layer=3.999
	Mushroom
		icon='mushroom.dmi'
		icon_state="1"

	Algae
		icon='algae.dmi'
		icon_state="1"
	Algae1
		icon='algae.dmi'
		icon_state="algae"
		layer=3.999
	Moss
		icon='moss.dmi'
		icon_state="1"
	Moss1
		icon='moss.dmi'
		icon_state="moss"
		layer= 500
		density=1

obj
	kasumisign
		dormsigns
			icon = 'Updatesigns.dmi'
			layer=999999
			sign1
				icon_state = "sign1"
			sign2
				icon_state = "sign2"
			sign3
				icon_state="sign3"
			sign4
				icon_state="sign4"
			sign5
				icon_state = "sign5"
			sign6
				icon_state = "sign6"
			sign7
				icon='Moresigns.dmi'
				icon_state = "sign7"
			sign8
				icon='Moresigns.dmi'
				icon_state = "sign8"
			sign9
				icon='Moresigns.dmi'
				icon_state = "sign9"
			sign10
				icon='Moresigns.dmi'
				icon_state = "sign10"

			tri
				icon_state = "signtri"
			circle
				icon_state="screencir"
			square
				icon_state = "signsqu"
			dol
				icon_state="signdol"
		others
			icon = 'Updatesigns2.dmi'
			dollar
				icon_state="signsal"
			casino
				icon_state="signcas"
		Intmisc
			icon = 'Intmisc.dmi'
			Spasign
				icon_state = "signspa"
			Shelf
				icon_state = "pubrac1"
			Shelf2
				icon_state = "pubrac2"
			Blacksmithsign
				icon_state = "signbla"
			Jail
				icon_state = "signjai"
			tav
				icon_state = "signtav"
			kunairack
				icon_state = "kunairack"
			wallscroll
				icon_state = "wallscroll"
				Click()
					if(icon_state == "wallscrollop")
						icon_state = "wallscroll"
					if(icon_state == "wallscroll")
						icon_state = "wallscrollop"
			katanarack
				icon_state = "katanarack"