turf/BurrAdditionsTerrain
	BurrBunker
		icon = 'BurBunk.dmi'
	FrozenSnowy
		icon = 'FrozenSnowy.dmi'
		FrozenSnowy2
			icon = 'FrozenSnowy2.dmi'
		FrozenSnowy3
			icon = 'FrozenSnowy3.dmi'
	IceCliffEdgeRight
		icon = 'DiffTurf.dmi'
		icon_state = "2,0a"

		ICliffEdgeRight
			icon = 'DiffTurf.dmi'
			icon_state = "2,0a"

		IceCliffEdgeLeft
			icon = 'DiffTurf.dmi'
			icon_state = "3,0a"
		IceCliffEdgeURight
			icon = 'DiffTurf.dmi'
			icon_state = "4,4a"
		IceCliffEdgeULeft
			icon= 'DiffTurf.dmi'
			icon_state = "4,4b"

		IceCaveEntrance
			icon = 'DiffTurf.dmi'
			icon_state = "1,0a"
		CliffBottomLeft
			icon = 'CliffBottomLeft.dmi'
		CliffBottomRight
		icon = 'CliffBottomRight.dmi'

/obj/targets
	targetdummy
		icon = 'Training Dummy.dmi'
		density = 1

	targetpractice
		icon = 'Target Practice.dmi'
		density = 1

turf/BurrBlood
	icon = 'bloodtesting.dmi'
	layer = 600

	BloodSplatterL
		layer = 600
		icon = 'bloodlight.dmi'

	BloodSplatterR
		layer = 600
		icon = 'regblood.dmi'

	SnowBloodHeavy
		icon = 'bloodsnow.dmi'
		icon_state = "0,1a"
	Wack
		icon = 'BigBoss.dmi'

	SnowBloodLight
		icon = 'bloodsnow.dmi'
		icon_state = "1,1a"

	BloodSplatter2
		icon = 'straightblood.dmi'

	Bloodsplatter3
		icon = 'angledblood.dmi'

turf/FrozenLake
	icon = 'frozenw.dmi'

turf/BurrencyWOOD
	WallCenter
		icon = 'shimowallmid.dmi'
	WallRightBot
		icon = 'shimowallbottomright.dmi'
	WallRightMid
		icon = 'shimowallmidright.dmi'
	WallLeftMid
		icon = 'shimowallmidleft.dmi'
	WallBottom
		icon = 'shimowallbottom.dmi'
	WallBottomL
		icon = 'shimowallbottomL.dmi'
	CrestOfWall
		icon = 'VillGateCrest.dmi'
	CrestWalk
		icon = 'VillGateWalkCrest.dmi'
	CrestEdgeL
		icon = 'VillGateLCrest.dmi'
	CrestEdgeR
		icon = 'VillGateRCrest.dmi'
	CrestBorder
		icon = 'VillGateCrestBorder.dmi'
	BorderLeft
		icon = 'BrokenShit.dmi'
		icon_state = "Roof8"
	BorderRight
		icon = 'BrokenShit.dmi'
		icon_state = "Roof9"

turf/BurrSnowHomes
	Hizes
		icon = 'shme.dmi'
		CrackaHize
			icon = 'snwpris.dmi'
		RichHizeNoKidz
			icon = 'shme4.dmi'
		NoKidzTop
			icon = 'shme4.dmi'
			icon_state = "2"
		PoeManHize
			icon = 'shme3.dmi'
		WhiteHizeWitKidsz
			icon = 'shme2.dmi'
		WitKidzTop
			icon = 'shme2.dmi'
			icon_state= "2"
		BigShit
			icon = 'kag.dmi'
			right
				icon = 'kag.dmi'
				icon_state = "2"
			roof
				icon = 'kag.dmi'
				icon_state = "3"
			roofcorner
				icon = 'kag.dmi'
				icon_state = "4"
	VendorShit
		icon = 'vendorfix.dmi'
		BrownRoofL
			icon = 'vendorfix.dmi'
			icon_state = "e6"
		BrownRoofR
			icon = 'vendorfix.dmi'
			icon_state = "e7"
		BrownRoofM
			icon = 'vendorfix.dmi'
			icon_state = "e3"
		BrownRoofComp
			icon = 'vendorfix.dmi'
			icon_state = "c"
		BrownDIYR
			icon = 'vendorfix.dmi'
			icon_state = "g1"
		BrownDIYL
			icon = 'vendorfix.dmi'
			icon_state = "g2"
		BrownDIYM
			icon = 'vendorfix.dmi'
			icon_state = "g3"
		TopSectionL
			icon = 'vendorfix.dmi'
			icon_state = "base2"
		TopSectionM
			icon = 'vendorfix.dmi'
			icon_state = "base3"
		TopSectionR
			icon = 'vendorfix.dmi'
			icon_state = "base4"
		TableL
			icon = 'vendorfix.dmi'
			icon_state = "aw1"
		TableR
			icon = 'vendorfix.dmi'
			icon_state = "aw2"
		TableC
			icon = 'vendorfix.dmi'
			icon_state = "aw3"
		Gshuk
			icon = 'vendorfix.dmi'
			icon_state = "gshuk"
		Senbon
			icon = 'vendorfix.dmi'
			icon_state = "sen"
		Shuriken
			icon = 'vendorfix.dmi'
			icon_state = "shur"
		Tag
			icon = 'vendorfix.dmi'
			icon_state = "tag"
		Kunai
			icon = 'vendorfix.dmi'
			icon_state = "kunai"
		Anvil
			icon = 'anvil1.dmi'
		WorkBench
			icon = 'workbench1.dmi'
		Boxes
			icon = 'vendorfix.dmi'
			icon_state = "1"
			Box1
				icon = 'vendorfix.dmi'
				icon_state = "2"
			Box2
				icon = 'vendorfix.dmi'
				icon_state = "3"
			Box3
				icon = 'vendorfix.dmi'
				icon_state = "1a"
	HizeDoe
		is_door = 1
		density = 1
		var/password = null
		var/Locked = 0
		HizeDoeWorking
			is_door = 1
			icon = 'HizeDoe.dmi'
			icon_state = "closed"
			opening_state = "opening"
			opened_state = "open"
			closed_state = "closed"
			closing_state = "closing"

		HizeDoeTop
			icon = 'DoeTop4Hize.dmi'
		HizeDoeKage
			icon = 'KageD.dmi'
	OutHize
		icon = 'OutHize.dmi'

		WorkingPotty
			is_door = 1
			density = 1
			icon = 'outhouseint.dmi'
			icon_state = "Open"
			verb
				open()
					if(get_dist(src,usr)>1) return
					//set src in view(1)
					icon_state = "Open"
					density = 0
					for(var/mob/person in view(15))
						person << output("[person.getStrangerName(usr)] has opened the seat on the shitter.", "outputall.output")
				close()
					if(get_dist(src,usr)>1) return
					//set src in view(1)
					icon_state = "Closed"
					density = 1
					for(var/mob/person in view(15))
						person << output("[person.getStrangerName(usr)] has closed the seat on the shitter.", "outputall.output")
				flush()
					set src in view(1)
					for(var/mob/person in view (15))
						person << output("[person.getStrangerName(usr)] tried to break the fourth wall!", "outputall.output")

	/*		Click()
				if(get_dist(src,usr)>1) return
					icon_state = "Closed"
				if(icon_state == "Closed")
					icon_state = "Open"
				for(var/mob/person in view(15))
					person << output("[person.getStrangerName(usr)] flips the toilet seat.", "outputall.output")
		*/

	SnowPath
		icon = 'SnowPath.dmi'

		More
			icon = 'SnowPath.dmi'
			icon_state = "3"

		More2
			icon = 'SnowPath.dmi'
			icon_state = "2"

		SnwEdgeFixBotLeft
			icon = 'snow.dmi'
			icon_state = "gl2"
		SnwEdgeFixTopLeft
			icon = 'snow.dmi'
			icon_state = "gl3"

turf/BurrInteriors
	WoodInteriorFloor
		icon = 'interior.dmi'
		icon_state = "floor"
	Decorations
		icon = 'deerhead.dmi'
		BrokenInteriorShit
			icon = 'brokeninteriorshit.dmi'
			EmptyBowl
				icon = 'brokeninteriorshit.dmi'
				icon_state = "empty"
			CounterItem1
				icon = 'brokeninteriorshit.dmi'
				icon_state = "stuff2"
			Counteritem2
				icon = 'brokeninteriorshit.dmi'
				icon_state = "stuff3"
			Counteritem3
				icon = 'brokeninteriorshit.dmi'
				icon_state = "stuff4"
			EmptyBowl
				icon = 'brokeninteriorshit.dmi'
				icon_state = "ramen"
			Mask
				icon = 'brokeninteriorshit.dmi'
				icon_state = "oopi"

		BearSkin
			icon = 'bearskin.dmi'
			Small
				icon = 'bearskin.dmi'
				icon_state = "small"
		WallSpear
			icon = 'burrspeardecoration.dmi'
			Reverse
				icon = 'burrspeardecoration.dmi'
				icon_state = "reverse"
		ShitBucket
			icon = 'shitbucket.dmi'
		BearStatue
			icon = 'bearstatue.dmi'
		Cot
			icon = 'Cot.dmi'
			LeftHalf
				icon = 'Cot.dmi'
				icon_state = "doubleL"
			RightHalf
				icon = 'Cot.dmi'
				icon_state = "doubleR"
		FixedCot
			icon = 'Cot.dmi'
			LeftHalfB
				icon = 'Cot.dmi'
				icon_state = "0,0"
			LeftHalfT
				icon = 'Cot.dmi'
				icon_state = "0,1"
			RightHalfT
				icon = 'Cot.dmi'
				icon_state = "m0,1"
			RightLeftB
				icon = 'Cot.dmi'
				icon_state = "m0,0"
			SingleCot
				icon = 'Cot.dmi'
				icon_state = "singleb"
				SingleTop
					icon = 'Cot.dmi'
					icon_state = "singlet"

			Blankets
				RippedBlanket
					icon = 'Cot.dmi'
					icon_state = "leftrippedblanket"
					LeftBlanketTop
						icon = 'Cot.dmi'
						icon_state = "leftblankettop"
					RightBlanket
						icon = 'Cot.dmi'
						icon_state = "rightrippedblanket"
						RightBlanketTop
							icon = 'Cot.dmi'
							icon_state = "rightrippedblankettop"
					Dafifties
						icon = 'Cot.dmi'
						icon_state = "32,501"


				SingleBlankets
					icon = 'Cot.dmi'
					icon_state = "singleblankett"

					SingleCleanB
						icon = 'Cot.dmi'
						icon_state = "singlecleanb"
					SingleDirtyB
						icon = 'Cot.dmi'
						icon_state = "singleblanketb"

		CotBlankets
			icon = 'Cot.dmi'
			icon_state = "1"
			BigL
				icon = 'Cot.dmi'
				icon_state = "2"
			BigR
				icon = 'Cot.dmi'
				icon_state = "3"
			Dirty
				icon = 'Cot.dmi'
				icon_state = "blanket"
			DirtyL
				icon = 'Cot.dmi'
				icon_state = "blanketL"
			DirtyR
				icon = 'Cot.dmi'
				icon_state = "blanketR"
			LeftHalf
				icon = 'Cot.dmi'
				icon_state = "doubleL"
			RightHalf
				icon = 'Cot.dmi'
				icon_state = "doubleR"

			ShelfR
				icon = 'insideapps.dmi'
			ShelfL
				icon = 'insideapps.dmi'
				icon_state= "smid2"

			ShelfM
				icon = 'insideapps.dmi'
				icon_state = "smid3"

				Scrolls
					icon = 'insideapps.dmi'
					icon_state = "a1"
				Scrolls2
					icon = 'insideapps.dmi'
					icon_state = "a2"
				Scrolls3
					icon = 'insideapps.dmi'
					icon_state = "a4"
				Scrolls4
					icon = 'insideapps.dmi'
					icon_state = "a7"
		BurrShelves
			icon = 'shelves.dmi'
			BrokenVersionBL
				icon = 'brokeninteriorshit.dmi'
				icon_state = "0,0"
				BrokenVersionTR
					icon = 'brokeninteriorshit.dmi'
					icon_state = "1,1"
				BrokenVersionBR
					icon = 'brokeninteriorshit.dmi'
					icon_state = "1,0"
				BrokenVersionTL
					icon = 'brokeninteriorshit.dmi'
					icon_state = "0,1"
		Counterz
			icon = 'BrokenShit.dmi'
		/*	LeftEnd
				icon = 'BrokenShit.dmi'
				icon_state = "left end"

			RightEnd
				icon = 'BrokenShit.dmi'
				icon_state = "right end"
			LeftWedge
				icon = 'BrokenShit.dmi'
				icon_state = "leftwedge"
			RightWedge
				icon = 'BrokenShit.dmi'
				icon_state = "rightwedge"
			*/
			UpperCenter
				icon = 'BrokenShit.dmi'
				icon_state = "weirdcenter"
			RightLong
				icon = 'BrokenShit.dmi'
				icon_state = "arightend"

			LeftLong
				icon = 'BrokenShit.dmi'
				icon_state = "aleftend"
			RightLongTop
				icon = 'BrokenShit.dmi'
				icon_state = "arightendtop"
			ButtEnd
				icon = 'BrokenShit.dmi'
				icon_state = "vend"
		MiscWalls
			icon = 'BrokenShit.dmi'
			icon_state = "elevationwall"

			InsideStep
				icon = 'BrokenShit.dmi'
				icon_state = "insidesteps"

			InteriorBorders
				icon ='BrokenShit.dmi'
				icon_state = "bordertop"
				BorderRight
					icon = 'BrokenShit.dmi'
					icon_state = "borderright"
				BorderLeft
					icon = 'BrokenShit.dmi'
					icon_state = "borderleft"
		MiscFloor
			icon = 'BrokenShit.dmi'
			WoodFloor
				icon = 'BrokenShit.dmi'
				icon_state = "floor4"
			WoodFloor2
				icon = 'BrokenShit.dmi'
				icon_state = "floor5"
			WoodFloor3
				icon = 'BrokenShit.dmi'
				icon_state = "floor6"
			WoodFloor4
				icon = 'BrokenShit.dmi'
				icon_state = "6floor"
			WoodFloor5
				icon = 'BrokenShit.dmi'
				icon_state = "5floor"
			WoodFloor6
				icon = 'BrokenShit.dmi'
				icon_state = "floor51"
			WoodFloor7
				icon = 'BrokenShit.dmi'
				icon_state = "114floor"
			WoodFloor8
				icon = 'BrokenShit.dmi'
				icon_state = "1floor51"
			WoodFloor9
				icon = 'BrokenShit.dmi'
				icon_state = "114floor1"

			WoodFloor10
				icon = 'BrokenShit.dmi'
				icon_state = "floor16"
	WoodWall
		icon = 'interior.dmi'
		icon_state = "wall"
		WallTop
			icon = 'interior.dmi'
			icon_state = "walltop"
		WallTopL
			icon = 'interior.dmi'
			icon_state = "walltopl"
		WallTopR
			icon = 'interior.dmi'
			icon_state = "walltopr"
		WallBottom
			icon = 'interior.dmi'
			icon_state = "wallbottom"
		WallBottomL
			icon = 'interior.dmi'
			icon_state = "wallbottomleft"
		WallBottomR
			icon = 'interior.dmi'
			icon_state = "wallbottomright"
		WallEndL
			icon = 'interior.dmi'
			icon_state = "wallend2"
		WallEndR
			icon = 'interior.dmi'
			icon_state = "wallend"
		RightCorner
			icon = 'interior.dmi'
			icon_state = "corner1"
		LeftCorner
			icon = 'interior.dmi'
			icon_state = "corner2"
	InsideBorder
		density = 1
		icon = 'insideroof.dmi'
		VeryTopLeft
			icon = 'insideroof.dmi'
			icon_state = "9"
		VeryTopRight
			icon = 'insideroof.dmi'
			icon_state = "7"
		VeryTopMiddle
			icon = 'insideroof.dmi'
			icon_state = "6"
		TopLeft
			icon = 'insideroof.dmi'
			icon_state = "2"
		TopOnly
			icon = 'insideroof.dmi'
			icon_state = "a4"
		TopRight
			icon = 'insideroof.dmi'
			icon_state = "3"
		RightOnly
			icon = 'insideroof.dmi'
			icon_state = "a3"
		LeftOnly
			icon = 'insideroof.dmi'
			icon_state = "a2"
		LeftRight
			icon = 'insideroof.dmi'
			icon_state = "5"
		BottomOnly
			icon = 'insideroof.dmi'
			icon_state = "a1"
		BottomRight
			icon = 'insideroof.dmi'
			icon_state = "4"
		BottomLeft
			icon = 'insideroof.dmi'
			icon_state = "1"
	Doorway
		icon = 'interior.dmi'
		icon_state = "doorway"
		RDoorway
			icon = 'ihaidoorway.dmi'
			icon_state = "right"
		LDoorway
			icon = 'ihaidoorway.dmi'
			icon_state = "left"
			layer = 6
		UseThis
			icon = 'ihaidoorway.dmi'

obj/BurrStatues
	icon = 'BrokenShit.dmi'
	icon_state = "bigbase"

	FujinStatue
		icon = 'finishedstate.dmi'

obj/BurrMiscObj
	icon = 'inucage.dmi'
	WideCage
		icon = 'inucage.dmi'
		icon_state ="wide"
		BL
			icon = 'inucage.dmi'
			icon_state = "0,0"
			BR
				icon = 'inucage.dmi'
				icon_state = "1,0"
			TL
				icon = 'inucage.dmi'
				icon_state = "0,1"
			TR
				icon = 'inucage.dmi'
				icon_state = "1,1"
			TTR
				icon = 'inucage.dmi'
				icon_state = "0,2"
			TTL
				icon = 'inucage.dmi'
				icon_state = "1,2"
		Statues
			icon = 'Statues.dmi'
			LongerOne
				icon = 'Statues.dmi'
				icon_state = "statue"
		Corpse
			icon = 'Statues.dmi'
			icon_state = "corpse"
		Carvan
			icon = 'carvan.dmi'
			icon_state = "north"
			Left
				icon = 'carvan.dmi'
				icon_state = "left"
			Right
				icon = 'carvan.dmi'
				icon_state = "right"
turf/BurrturfFixes
	Entrance
		icon = 'caveinsidefix.dmi'
		icon_state = "Ent"

	Edges
		icon = 'caveinsidefix.dmi'
		icon_state = "cliff1"
		EdgeR
			icon = 'caveinsidefix.dmi'
			icon_state = "cliff2"
	CaveLighting
		icon = 'caveinsidefix.dmi'
		icon_state = "fon1"
		Left
			icon = 'caveinsidefix.dmi'
			icon_state = "fon"
		Right
			icon = 'caveinsidefix.dmi'
			icon_state = "fon2"

	WideEntrance
		icon = 'caveinsidefix.dmi'
		icon_state = "widecave"


obj/BurrMiscObj
	CotRework
		icon = 'Cot.dmi'
		icon_state = "singlenew"
		Top
			icon = 'Cot.dmi'
			icon_state = "singlenewtop"
	Gates
		icon = 'new123.dmi'
		icon_state = "RO"
		LeftSide
			icon = 'new123.dmi'
			icon_state = "LO"

		Closed
			icon = 'new123.dmi'
			icon_state = "RC"
			ClosedLeft
				icon = 'new123.dmi'
				icon_state = "LC"

obj
	var
		is_door = 0
		opened_state= "opened"
		opening_state= "opening"
		closing_state= "closing"
		closed_state= "closed"

	proc
		ObjDoorProc()
			flick(opening_state,src)
			icon_state=opened_state
			density=0
			spawn(20)
				flick(closing_state,src)
				icon_state=closed_state
				density=1

turf
	var
		is_door = 0
		opened_state = "opened"
		opening_state = "opening"
		closing_state = "closing"
		closed_state = "closed"

	proc
		DoorProc()
			flick(opening_state,src)
			icon_state=opened_state
			density=0
			spawn(20)
				flick(closing_state,src)
				icon_state=closed_state
				density=1
/*
mob
	Bump(obj/A)
		..()
		if(!istype(A,/obj/building/DoorL)&&!istype(A,/obj/building/DoorR)&&!istype(A,/obj/SnwDoors)&&!istype(A,/obj/ShimoKageDoor)&&!istype(A,/obj/SnwKageDoor)&&!istype(A,/obj/SnwInterior/Door)&&!istype(A,/obj/PrisonDoe))
			return
		if(A:is_door && usr.getPerk("Lockpick"))
			/*A:Open()*/
			A:ObjDoorProc()
			return
		if(A:is_door)
			if(istype(A, /obj/PrisonDoe))
				var/haskey = 0
				for(var/obj/items/Key/K in src)
					if(K.Passcode==A:password) haskey = 1
				if(!A:Locked) haskey=1
				if(A:Locked && !haskey) return
			A:ObjDoorProc() */
mob
	Bump(turf/B)
		if(!istype(B,/turf/BurrSnowHomes/HizeDoe/HizeDoeKage)&&!istype(B,/turf/BurrSnowHomes/HizeDoe/HizeDoeWorking)&&!istype(B,/turf/BurrSnowHomes/OutHize/WorkingPotty))
			return
		if(B:is_door)
			B:DoorProc()
/*

		()
			icon = 'caveinsidefix.dmi'
			icon_state = ""

		()
			icon = 'caveinsidefix.dmi'
			icon_state = ""

		()
			icon = 'caveinsidefix.dmi'
			icon_state = "" */