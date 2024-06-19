/*turf/var
	minesOpen = 1
*/
turf/BongAdded
	Sakujak
		layer=999
		density=0
		icon='sakujak.dmi'
		icon_state=""
	Shingen
		layer=999
		density=0
		icon='shingen.dmi'
		icon_state=""

	Swingset
		layer=4
		density =0
		icon='swingset.dmi'
	Teetertotter
		layer=4
		density =0
		icon='teetertotter.dmi'
	Teetertotter2
		layer=4
		density =0
		icon='teetertotter2.dmi'


turf/BongWarpers
	Start
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			M.teleporting = 0
			M.density = 1
			usr.spawn_point()
	MinesInside
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		GoingInA
			goingto=/turf/BongWarpers/MinesOut/GoingOutA
		GoingInB
			goingto=/turf/BongWarpers/MinesOut/GoingOutB
		GoingInC
			goingto=/turf/BongWarpers/MinesOut/GoingOutC
		GoingInD
			goingto=/turf/BongWarpers/MinesOut/GoingOutD
	MinesOut
		layer=999
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			if(!minesOpen)
				return
			if(minesOpen)
				density=0
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
		GoingOutA
			goingto=/turf/BongWarpers/MinesInside/GoingInA
		GoingOutB
			goingto=/turf/BongWarpers/MinesInside/GoingInB
		GoingOutC
			goingto=/turf/BongWarpers/MinesInside/GoingInC
		GoingOutD
			goingto=/turf/BongWarpers/MinesInside/GoingInD
	MinesAlert
		layer=999
		density=0
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			if(!minesOpen)
				usr<<output("The Katabami Gold mines are closed!","outputic.output")
				usr<<output("The Katabami Gold mines are closed!","outputall.output")
				return

	TutIsland
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		Barber
			Entrance
				L
					goingto=/turf/BongWarpers/TutIsland/Barber/Inside/ExitL
				R
					goingto=/turf/BongWarpers/TutIsland/Barber/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/BongWarpers/TutIsland/Barber/Entrance/L
				ExitR
					goingto=/turf/BongWarpers/TutIsland/Barber/Entrance/R
		Clothing
			Entrance
				L
					goingto=/turf/BongWarpers/TutIsland/Clothing/Inside/ExitL
				R
					goingto=/turf/BongWarpers/TutIsland/Clothing/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/BongWarpers/TutIsland/Clothing/Entrance/L
				ExitR
					goingto=/turf/BongWarpers/TutIsland/Clothing/Entrance/R


turf/BongWarpers/Iwa
	Spa
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		Entrance
			L
				goingto=/turf/BongWarpers/Iwa/Spa/Inside/ExitL
			R
				goingto=/turf/BongWarpers/Iwa/Spa/Inside/ExitR
		Inside
			ExitL
				goingto=/turf/BongWarpers/Iwa/Spa/Entrance/L
			ExitR
				goingto=/turf/BongWarpers/Iwa/Spa/Entrance/R
		BackdoorENT
			L
				goingto=/turf/BongWarpers/Iwa/Spa/BackdoorEX/ExitL
			R
				goingto=/turf/BongWarpers/Iwa/Spa/BackdoorEX/ExitR
		BackdoorEX
			ExitL
				goingto=/turf/BongWarpers/Iwa/Spa/BackdoorENT/L
			ExitR
				goingto=/turf/BongWarpers/Iwa/Spa/BackdoorENT/R
		CaveEntrance
			L
				goingto=/turf/BongWarpers/Iwa/Spa/CaveExit/ExitL
			M
				goingto=/turf/BongWarpers/Iwa/Spa/CaveExit/ExitM
			R
				goingto=/turf/BongWarpers/Iwa/Spa/CaveExit/ExitR
		CaveExit
			ExitL
				goingto=/turf/BongWarpers/Iwa/Spa/CaveEntrance/L
			ExitM
				goingto=/turf/BongWarpers/Iwa/Spa/CaveEntrance/M
			ExitR
				goingto=/turf/BongWarpers/Iwa/Spa/CaveEntrance/R
		RCaveEntrance
			L
				goingto=/turf/BongWarpers/Iwa/Spa/RCaveExit/ExitL
			M
				goingto=/turf/BongWarpers/Iwa/Spa/RCaveExit/ExitM
			R
				goingto=/turf/BongWarpers/Iwa/Spa/RCaveExit/ExitR
		RCaveExit
			ExitL
				goingto=/turf/BongWarpers/Iwa/Spa/RCaveEntrance/L
			ExitM
				goingto=/turf/BongWarpers/Iwa/Spa/RCaveEntrance/M
			ExitR
				goingto=/turf/BongWarpers/Iwa/Spa/RCaveEntrance/R

	IwaMans
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		Entrance
			L
				goingto=/turf/BongWarpers/Iwa/IwaMans/Inside/ExitL
			R
				goingto=/turf/BongWarpers/Iwa/IwaMans/Inside/ExitR
			Mid
				goingto=/turf/BongWarpers/Iwa/IwaMans/Inside/ExitMid
		Inside
			UpL
				goingto=/turf/BongWarpers/Iwa/IwaMans/Inside/SecondL
			UpMid
				goingto=/turf/BongWarpers/Iwa/IwaMans/Inside/SecondMid
			UpR
				goingto=/turf/BongWarpers/Iwa/IwaMans/Inside/SecondR
			SecondL
				goingto=/turf/BongWarpers/Iwa/IwaMans/Inside/UpL
			SecondMid
				goingto=/turf/BongWarpers/Iwa/IwaMans/Inside/UpMid
			SecondR
				goingto=/turf/BongWarpers/Iwa/IwaMans/Inside/UpR
			ExitL
				goingto=/turf/BongWarpers/Iwa/IwaMans/Entrance/L
			ExitR
				goingto=/turf/BongWarpers/Iwa/IwaMans/Entrance/R
			ExitMid
				goingto=/turf/BongWarpers/Iwa/IwaMans/Entrance/Mid
	Cafe
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		Entrance
			L
				goingto=/turf/BongWarpers/Iwa/Cafe/Inside/ExitL
			R
				goingto=/turf/BongWarpers/Iwa/Cafe/Inside/ExitR
		Inside
			ExitL
				goingto=/turf/BongWarpers/Iwa/Cafe/Entrance/L
			ExitR
				goingto=/turf/BongWarpers/Iwa/Cafe/Entrance/R
	Prison
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		Entrance
			L
				goingto=/turf/BongWarpers/Iwa/Prison/Inside/ExitL
			R
				goingto=/turf/BongWarpers/Iwa/Prison/Inside/ExitR
		Inside
			ExitL
				goingto=/turf/BongWarpers/Iwa/Prison/Entrance/L
			ExitR
				goingto=/turf/BongWarpers/Iwa/Prison/Entrance/R
	Academy
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		Entrance
			L
				goingto=/turf/BongWarpers/Iwa/Academy/Inside/ExitL
			R
				goingto=/turf/BongWarpers/Iwa/Academy/Inside/ExitR
		Inside
			ExitL
				goingto=/turf/BongWarpers/Iwa/Academy/Entrance/L
			ExitR
				goingto=/turf/BongWarpers/Iwa/Academy/Entrance/R
	Hospital
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		Entrance
			L
				goingto=/turf/BongWarpers/Iwa/Hospital/Inside/ExitL
			R
				goingto=/turf/BongWarpers/Iwa/Hospital/Inside/ExitR
		Inside
			ExitL
				goingto=/turf/BongWarpers/Iwa/Hospital/Entrance/L
			ExitR
				goingto=/turf/BongWarpers/Iwa/Hospital/Entrance/R
		FirstFloor
			BasementL
				goingto=/turf/BongWarpers/Iwa/Hospital/Basement/L
			BasementR
				goingto=/turf/BongWarpers/Iwa/Hospital/Basement/R
			SecondL
				goingto=/turf/BongWarpers/Iwa/Hospital/FirstFloor/UpstairsL
			SecondR
				goingto=/turf/BongWarpers/Iwa/Hospital/FirstFloor/UpstairsR
			UpstairsL
				goingto=/turf/BongWarpers/Iwa/Hospital/FirstFloor/SecondL
			UpstairsR
				goingto=/turf/BongWarpers/Iwa/Hospital/FirstFloor/SecondR
			RoofL
				goingto=/turf/BongWarpers/Iwa/Hospital/FirstFloor/RL
			RoofR
				goingto=/turf/BongWarpers/Iwa/Hospital/FirstFloor/RR
			RL
				goingto=/turf/BongWarpers/Iwa/Hospital/FirstFloor/RoofL
			RR
				goingto=/turf/BongWarpers/Iwa/Hospital/FirstFloor/RoofR
		Basement
			L
				goingto=/turf/BongWarpers/Iwa/Hospital/FirstFloor/BasementL
			R
				goingto=/turf/BongWarpers/Iwa/Hospital/FirstFloor/BasementR

	Weapon
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		Entrance
			L
				goingto=/turf/BongWarpers/Iwa/Weapon/Inside/ExitL
			R
				goingto=/turf/BongWarpers/Iwa/Weapon/Inside/ExitR
		Inside
			ExitL
				goingto=/turf/BongWarpers/Iwa/Weapon/Entrance/L
			ExitR
				goingto=/turf/BongWarpers/Iwa/Weapon/Entrance/R

	Barber
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		Entrance
			L
				goingto=/turf/BongWarpers/Iwa/Barber/Inside/ExitL
			R
				goingto=/turf/BongWarpers/Iwa/Barber/Inside/ExitR
		Inside
			ExitL
				goingto=/turf/BongWarpers/Iwa/Barber/Entrance/L
			ExitR
				goingto=/turf/BongWarpers/Iwa/Barber/Entrance/R

	Tailor
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		Entrance
			L
				goingto=/turf/BongWarpers/Iwa/Tailor/Inside/ExitL
			R
				goingto=/turf/BongWarpers/Iwa/Tailor/Inside/ExitR
		Inside
			ExitL
				goingto=/turf/BongWarpers/Iwa/Tailor/Entrance/L
			ExitR
				goingto=/turf/BongWarpers/Iwa/Tailor/Entrance/R
	Uchiha
		U1
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			Entrance
				L
					goingto=/turf/BongWarpers/Iwa/Uchiha/U1/Inside/ExitL
				R
					goingto=/turf/BongWarpers/Iwa/Uchiha/U1/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/BongWarpers/Iwa/Uchiha/U1/Entrance/L
				ExitR
					goingto=/turf/BongWarpers/Iwa/Uchiha/U1/Entrance/R
	LargeHouse
		LH1
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			Entrance
				L
					goingto=/turf/BongWarpers/Iwa/LargeHouse/LH1/Inside/ExitL
				R
					goingto=/turf/BongWarpers/Iwa/LargeHouse/LH1/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/BongWarpers/Iwa/LargeHouse/LH1/Entrance/L
				ExitR
					goingto=/turf/BongWarpers/Iwa/LargeHouse/LH1/Entrance/R
		LH2
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			Entrance
				L
					goingto=/turf/BongWarpers/Iwa/LargeHouse/LH2/Inside/ExitL
				R
					goingto=/turf/BongWarpers/Iwa/LargeHouse/LH2/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/BongWarpers/Iwa/LargeHouse/LH2/Entrance/L
				ExitR
					goingto=/turf/BongWarpers/Iwa/LargeHouse/LH2/Entrance/R
		LH3
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			Entrance
				L
					goingto=/turf/BongWarpers/Iwa/LargeHouse/LH3/Inside/ExitL
				R
					goingto=/turf/BongWarpers/Iwa/LargeHouse/LH3/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/BongWarpers/Iwa/LargeHouse/LH3/Entrance/L
				ExitR
					goingto=/turf/BongWarpers/Iwa/LargeHouse/LH3/Entrance/R
		LH4
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			Entrance
				L
					goingto=/turf/BongWarpers/Iwa/LargeHouse/LH4/Inside/ExitL
				R
					goingto=/turf/BongWarpers/Iwa/LargeHouse/LH4/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/BongWarpers/Iwa/LargeHouse/LH4/Entrance/L
				ExitR
					goingto=/turf/BongWarpers/Iwa/LargeHouse/LH4/Entrance/R
		LH5
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			Entrance
				L
					goingto=/turf/BongWarpers/Iwa/LargeHouse/LH5/Inside/ExitL
				R
					goingto=/turf/BongWarpers/Iwa/LargeHouse/LH5/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/BongWarpers/Iwa/LargeHouse/LH5/Entrance/L
				ExitR
					goingto=/turf/BongWarpers/Iwa/LargeHouse/LH5/Entrance/R
	SmallHouse
		SH1
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			Entrance
				L
					goingto=/turf/BongWarpers/Iwa/SmallHouse/SH1/Inside/ExitL
				R
					goingto=/turf/BongWarpers/Iwa/SmallHouse/SH1/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/BongWarpers/Iwa/SmallHouse/SH1/Entrance/L
				ExitR
					goingto=/turf/BongWarpers/Iwa/SmallHouse/SH1/Entrance/R
		SH2
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			Entrance
				L
					goingto=/turf/BongWarpers/Iwa/SmallHouse/SH2/Inside/ExitL
				R
					goingto=/turf/BongWarpers/Iwa/SmallHouse/SH2/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/BongWarpers/Iwa/SmallHouse/SH2/Entrance/L
				ExitR
					goingto=/turf/BongWarpers/Iwa/SmallHouse/SH2/Entrance/R
		SH3
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			Entrance
				L
					goingto=/turf/BongWarpers/Iwa/SmallHouse/SH3/Inside/ExitL
				R
					goingto=/turf/BongWarpers/Iwa/SmallHouse/SH3/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/BongWarpers/Iwa/SmallHouse/SH3/Entrance/L
				ExitR
					goingto=/turf/BongWarpers/Iwa/SmallHouse/SH3/Entrance/R
		SH4
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			Entrance
				L
					goingto=/turf/BongWarpers/Iwa/SmallHouse/SH4/Inside/ExitL
				R
					goingto=/turf/BongWarpers/Iwa/SmallHouse/SH4/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/BongWarpers/Iwa/SmallHouse/SH4/Entrance/L
				ExitR
					goingto=/turf/BongWarpers/Iwa/SmallHouse/SH4/Entrance/R
		SH5
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			Entrance
				L
					goingto=/turf/BongWarpers/Iwa/SmallHouse/SH5/Inside/ExitL
				R
					goingto=/turf/BongWarpers/Iwa/SmallHouse/SH5/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/BongWarpers/Iwa/SmallHouse/SH5/Entrance/L
				ExitR
					goingto=/turf/BongWarpers/Iwa/SmallHouse/SH5/Entrance/R
		SH6
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			Entrance
				L
					goingto=/turf/BongWarpers/Iwa/SmallHouse/SH6/Inside/ExitL
				R
					goingto=/turf/BongWarpers/Iwa/SmallHouse/SH6/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/BongWarpers/Iwa/SmallHouse/SH6/Entrance/L
				ExitR
					goingto=/turf/BongWarpers/Iwa/SmallHouse/SH6/Entrance/R
		SH7
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			Entrance
				L
					goingto=/turf/BongWarpers/Iwa/SmallHouse/SH7/Inside/ExitL
				R
					goingto=/turf/BongWarpers/Iwa/SmallHouse/SH7/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/BongWarpers/Iwa/SmallHouse/SH7/Entrance/L
				ExitR
					goingto=/turf/BongWarpers/Iwa/SmallHouse/SH7/Entrance/R
		SH8
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			Entrance
				L
					goingto=/turf/BongWarpers/Iwa/SmallHouse/SH8/Inside/ExitL
				R
					goingto=/turf/BongWarpers/Iwa/SmallHouse/SH8/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/BongWarpers/Iwa/SmallHouse/SH8/Entrance/L
				ExitR
					goingto=/turf/BongWarpers/Iwa/SmallHouse/SH8/Entrance/R
		EH1
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			Entrance
				L
					goingto=/turf/BongWarpers/Iwa/SmallHouse/EH1/Inside/ExitL
				R
					goingto=/turf/BongWarpers/Iwa/SmallHouse/EH1/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/BongWarpers/Iwa/SmallHouse/EH1/Entrance/L
				ExitR
					goingto=/turf/BongWarpers/Iwa/SmallHouse/EH1/Entrance/R
		EH2
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			Entrance
				L
					goingto=/turf/BongWarpers/Iwa/SmallHouse/EH2/Inside/ExitL
				R
					goingto=/turf/BongWarpers/Iwa/SmallHouse/EH2/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/BongWarpers/Iwa/SmallHouse/EH2/Entrance/L
				ExitR
					goingto=/turf/BongWarpers/Iwa/SmallHouse/EH2/Entrance/R
		EH3
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			Entrance
				L
					goingto=/turf/BongWarpers/Iwa/SmallHouse/EH3/Inside/ExitL
				R
					goingto=/turf/BongWarpers/Iwa/SmallHouse/EH3/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/BongWarpers/Iwa/SmallHouse/EH3/Entrance/L
				ExitR
					goingto=/turf/BongWarpers/Iwa/SmallHouse/EH3/Entrance/R
		EH4
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			Entrance
				L
					goingto=/turf/BongWarpers/Iwa/SmallHouse/EH4/Inside/ExitL
				R
					goingto=/turf/BongWarpers/Iwa/SmallHouse/EH4/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/BongWarpers/Iwa/SmallHouse/EH4/Entrance/L
				ExitR
					goingto=/turf/BongWarpers/Iwa/SmallHouse/EH4/Entrance/R
		EH5
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			Entrance
				L
					goingto=/turf/BongWarpers/Iwa/SmallHouse/EH5/Inside/ExitL
				R
					goingto=/turf/BongWarpers/Iwa/SmallHouse/EH5/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/BongWarpers/Iwa/SmallHouse/EH5/Entrance/L
				ExitR
					goingto=/turf/BongWarpers/Iwa/SmallHouse/EH5/Entrance/R
		EH6
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			Entrance
				L
					goingto=/turf/BongWarpers/Iwa/SmallHouse/EH6/Inside/ExitL
				R
					goingto=/turf/BongWarpers/Iwa/SmallHouse/EH6/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/BongWarpers/Iwa/SmallHouse/EH6/Entrance/L
				ExitR
					goingto=/turf/BongWarpers/Iwa/SmallHouse/EH6/Entrance/R
		EH7
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			Entrance
				L
					goingto=/turf/BongWarpers/Iwa/SmallHouse/EH7/Inside/ExitL
				R
					goingto=/turf/BongWarpers/Iwa/SmallHouse/EH7/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/BongWarpers/Iwa/SmallHouse/EH7/Entrance/L
				ExitR
					goingto=/turf/BongWarpers/Iwa/SmallHouse/EH7/Entrance/R

turf/BongWarpers/Ame
	AmeMans
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		Entrance
			L
				goingto=/turf/BongWarpers/Ame/AmeMans/Inside/ExitL
			R
				goingto=/turf/BongWarpers/Ame/AmeMans/Inside/ExitR
			Mid
				goingto=/turf/BongWarpers/Ame/AmeMans/Inside/ExitMid
		Inside
			UpL
				goingto=/turf/BongWarpers/Ame/AmeMans/Inside/SecondL
			UpMid
				goingto=/turf/BongWarpers/Ame/AmeMans/Inside/SecondMid
			UpR
				goingto=/turf/BongWarpers/Ame/AmeMans/Inside/SecondR
			SecondL
				goingto=/turf/BongWarpers/Ame/AmeMans/Inside/UpL
			SecondMid
				goingto=/turf/BongWarpers/Ame/AmeMans/Inside/UpMid
			SecondR
				goingto=/turf/BongWarpers/Ame/AmeMans/Inside/UpR
			ExitL
				goingto=/turf/BongWarpers/Ame/AmeMans/Entrance/L
			ExitR
				goingto=/turf/BongWarpers/Ame/AmeMans/Entrance/R
			ExitMid
				goingto=/turf/BongWarpers/Ame/AmeMans/Entrance/Mid
			SecondUpL
				goingto=/turf/BongWarpers/Ame/AmeMans/Inside/ThirdDownL
			SecondUpR
				goingto=/turf/BongWarpers/Ame/AmeMans/Inside/ThirdDownR
			ThirdDownL
				goingto=/turf/BongWarpers/Ame/AmeMans/Inside/SecondUpL
			ThirdDownR
				goingto=/turf/BongWarpers/Ame/AmeMans/Inside/SecondUpR
	Cafe
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		Entrance
			L
				goingto=/turf/BongWarpers/Ame/Cafe/Inside/ExitL
			R
				goingto=/turf/BongWarpers/Ame/Cafe/Inside/ExitR
		Inside
			ExitL
				goingto=/turf/BongWarpers/Ame/Cafe/Entrance/L
			ExitR
				goingto=/turf/BongWarpers/Ame/Cafe/Entrance/R
		SecondFloor
			UpL
				goingto=/turf/BongWarpers/Ame/Cafe/SecondFloor/DownL
			UpR
				goingto=/turf/BongWarpers/Ame/Cafe/SecondFloor/DownR
			DownL
				goingto=/turf/BongWarpers/Ame/Cafe/SecondFloor/UpL
			DownR
				goingto=/turf/BongWarpers/Ame/Cafe/SecondFloor/UpR
		ThirdFloor
			UpL
				goingto=/turf/BongWarpers/Ame/Cafe/ThirdFloor/DownL
			UpR
				goingto=/turf/BongWarpers/Ame/Cafe/ThirdFloor/DownR
			UpM
				goingto=/turf/BongWarpers/Ame/Cafe/ThirdFloor/DownM
			DownL
				goingto=/turf/BongWarpers/Ame/Cafe/ThirdFloor/UpL
			DownR
				goingto=/turf/BongWarpers/Ame/Cafe/ThirdFloor/UpR
			DownM
				goingto=/turf/BongWarpers/Ame/Cafe/ThirdFloor/UpM
		FourthFloor
			UpL
				goingto=/turf/BongWarpers/Ame/Cafe/FourthFloor/DownL
			UpR
				goingto=/turf/BongWarpers/Ame/Cafe/FourthFloor/DownR
			UpM
				goingto=/turf/BongWarpers/Ame/Cafe/FourthFloor/DownM
			DownL
				goingto=/turf/BongWarpers/Ame/Cafe/FourthFloor/UpL
			DownM
				goingto=/turf/BongWarpers/Ame/Cafe/FourthFloor/UpM
			DownR
				goingto=/turf/BongWarpers/Ame/Cafe/FourthFloor/UpR
		FifthFloor
			UpL
				goingto=/turf/BongWarpers/Ame/Cafe/FifthFloor/DownL
			UpR
				goingto=/turf/BongWarpers/Ame/Cafe/FifthFloor/DownR
			UpM
				goingto=/turf/BongWarpers/Ame/Cafe/FifthFloor/DownM
			DownL
				goingto=/turf/BongWarpers/Ame/Cafe/FifthFloor/UpL
			DownM
				goingto=/turf/BongWarpers/Ame/Cafe/FifthFloor/UpM
			DownR
				goingto=/turf/BongWarpers/Ame/Cafe/FifthFloor/UpR
	Prison
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		Entrance
			L
				goingto=/turf/BongWarpers/Ame/Prison/Inside/ExitL
			R
				goingto=/turf/BongWarpers/Ame/Prison/Inside/ExitR
		Inside
			ExitL
				goingto=/turf/BongWarpers/Ame/Prison/Entrance/L
			ExitR
				goingto=/turf/BongWarpers/Ame/Prison/Entrance/R
		SecondFloor
			UpL
				goingto=/turf/BongWarpers/Ame/Prison/SecondFloor/DownL
			UpR
				goingto=/turf/BongWarpers/Ame/Prison/SecondFloor/DownR
			DownL
				goingto=/turf/BongWarpers/Ame/Prison/SecondFloor/UpL
			DownR
				goingto=/turf/BongWarpers/Ame/Prison/SecondFloor/UpR
		ThirdFloor
			UpL
				goingto=/turf/BongWarpers/Ame/Prison/ThirdFloor/DownL
			UpR
				goingto=/turf/BongWarpers/Ame/Prison/ThirdFloor/DownR
			DownL
				goingto=/turf/BongWarpers/Ame/Prison/ThirdFloor/UpL
			DownR
				goingto=/turf/BongWarpers/Ame/Prison/ThirdFloor/UpR
	Academy
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		Entrance
			L
				goingto=/turf/BongWarpers/Ame/Academy/Inside/ExitL
			R
				goingto=/turf/BongWarpers/Ame/Academy/Inside/ExitR
		Inside
			ExitL
				goingto=/turf/BongWarpers/Ame/Academy/Entrance/L
			ExitR
				goingto=/turf/BongWarpers/Ame/Academy/Entrance/R
		Basement
			UpL
				goingto=/turf/BongWarpers/Ame/Academy/Basement/DownL
			UpM
				goingto=/turf/BongWarpers/Ame/Academy/Basement/DownM
			UpR
				goingto=/turf/BongWarpers/Ame/Academy/Basement/DownR
			DownL
				goingto=/turf/BongWarpers/Ame/Academy/Basement/UpL
			DownM
				goingto=/turf/BongWarpers/Ame/Academy/Basement/UpM
			DownR
				goingto=/turf/BongWarpers/Ame/Academy/Basement/UpR
		SecondFloor
			UpL
				goingto=/turf/BongWarpers/Ame/Academy/SecondFloor/DownL
			UpM
				goingto=/turf/BongWarpers/Ame/Academy/SecondFloor/DownM
			UpR
				goingto=/turf/BongWarpers/Ame/Academy/SecondFloor/DownR
			DownL
				goingto=/turf/BongWarpers/Ame/Academy/SecondFloor/UpL
			DownM
				goingto=/turf/BongWarpers/Ame/Academy/SecondFloor/UpM
			DownR
				goingto=/turf/BongWarpers/Ame/Academy/SecondFloor/UpR
		ThirdFloor
			UpL
				goingto=/turf/BongWarpers/Ame/Academy/ThirdFloor/DownL
			UpM
				goingto=/turf/BongWarpers/Ame/Academy/ThirdFloor/DownM
			UpR
				goingto=/turf/BongWarpers/Ame/Academy/ThirdFloor/DownR
			DownL
				goingto=/turf/BongWarpers/Ame/Academy/ThirdFloor/UpL
			DownM
				goingto=/turf/BongWarpers/Ame/Academy/ThirdFloor/UpM
			DownR
				goingto=/turf/BongWarpers/Ame/Academy/ThirdFloor/UpR
		FourthFloor
			UpL
				goingto=/turf/BongWarpers/Ame/Academy/FourthFloor/DownL
			UpM
				goingto=/turf/BongWarpers/Ame/Academy/FourthFloor/DownM
			UpR
				goingto=/turf/BongWarpers/Ame/Academy/FourthFloor/DownR
			DownL
				goingto=/turf/BongWarpers/Ame/Academy/FourthFloor/UpL
			DownM
				goingto=/turf/BongWarpers/Ame/Academy/FourthFloor/UpM
			DownR
				goingto=/turf/BongWarpers/Ame/Academy/FourthFloor/UpR
	Hospital
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		Entrance
			L
				goingto=/turf/BongWarpers/Ame/Hospital/Inside/L
			R
				goingto=/turf/BongWarpers/Ame/Hospital/Inside/R
		Inside
			L
				Entered(mob/M)
					if(!ismob(M)) return
					if(M.teleporting) return
					M.teleporting = 1
					M.density = 0
					M.Move(locate(146, 205, 18))
					M.teleporting = 0
					M.density = 1
			R
				Entered(mob/M)
					if(!ismob(M)) return
					if(M.teleporting) return
					M.teleporting = 1
					M.density = 0
					M.Move(locate(147, 205, 18))
					M.teleporting = 0
					M.density = 1
		Basement
			UpL
				goingto=/turf/BongWarpers/Ame/Hospital/Basement/DownL
			UpM
				goingto=/turf/BongWarpers/Ame/Hospital/Basement/DownM
			UpR
				goingto=/turf/BongWarpers/Ame/Hospital/Basement/DownR
			DownL
				goingto=/turf/BongWarpers/Ame/Hospital/Basement/UpL
			DownM
				goingto=/turf/BongWarpers/Ame/Hospital/Basement/UpM
			DownR
				goingto=/turf/BongWarpers/Ame/Hospital/Basement/UpR
		SecondFloor
			UpL
				goingto=/turf/BongWarpers/Ame/Hospital/SecondFloor/DownL
			UpM
				goingto=/turf/BongWarpers/Ame/Hospital/SecondFloor/DownM
			UpR
				goingto=/turf/BongWarpers/Ame/Hospital/SecondFloor/DownR
			DownL
				goingto=/turf/BongWarpers/Ame/Hospital/SecondFloor/UpL
			DownM
				goingto=/turf/BongWarpers/Ame/Hospital/SecondFloor/UpM
			DownR
				goingto=/turf/BongWarpers/Ame/Hospital/SecondFloor/UpR
		ThirdFloor
			UpL
				goingto=/turf/BongWarpers/Ame/Hospital/ThirdFloor/DownL
			UpM
				goingto=/turf/BongWarpers/Ame/Hospital/ThirdFloor/DownM
			UpR
				goingto=/turf/BongWarpers/Ame/Hospital/ThirdFloor/DownR
			DownL
				goingto=/turf/BongWarpers/Ame/Hospital/ThirdFloor/UpL
			DownM
				goingto=/turf/BongWarpers/Ame/Hospital/ThirdFloor/UpM
			DownR
				goingto=/turf/BongWarpers/Ame/Hospital/ThirdFloor/UpR
		FourthFloor
			UpL
				goingto=/turf/BongWarpers/Ame/Hospital/FourthFloor/DownL
			UpM
				goingto=/turf/BongWarpers/Ame/Hospital/FourthFloor/DownM
			UpR
				goingto=/turf/BongWarpers/Ame/Hospital/FourthFloor/DownR
			DownL
				goingto=/turf/BongWarpers/Ame/Hospital/FourthFloor/UpL
			DownM
				goingto=/turf/BongWarpers/Ame/Hospital/FourthFloor/UpM
			DownR
				goingto=/turf/BongWarpers/Ame/Hospital/FourthFloor/UpR

	Market
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		Entrance
			L
				goingto=/turf/BongWarpers/Ame/Market/Inside/ExitL
			R
				goingto=/turf/BongWarpers/Ame/Market/Inside/ExitR
		Inside
			ExitL
				goingto=/turf/BongWarpers/Ame/Market/Entrance/L
			ExitR
				goingto=/turf/BongWarpers/Ame/Market/Entrance/R
		SecondFloor
			UpL
				goingto=/turf/BongWarpers/Ame/Market/SecondFloor/DownL
			UpM
				goingto=/turf/BongWarpers/Ame/Market/SecondFloor/DownM
			UpR
				goingto=/turf/BongWarpers/Ame/Market/SecondFloor/DownR
			DownL
				goingto=/turf/BongWarpers/Ame/Market/SecondFloor/UpL
			DownM
				goingto=/turf/BongWarpers/Ame/Market/SecondFloor/UpM
			DownR
				goingto=/turf/BongWarpers/Ame/Market/SecondFloor/UpR
		ThirdFloor
			UpL
				goingto=/turf/BongWarpers/Ame/Market/ThirdFloor/DownL
			UpR
				goingto=/turf/BongWarpers/Ame/Market/ThirdFloor/DownR
			UpM
				goingto=/turf/BongWarpers/Ame/Market/ThirdFloor/DownM
			DownL
				goingto=/turf/BongWarpers/Ame/Market/ThirdFloor/UpL
			DownR
				goingto=/turf/BongWarpers/Ame/Market/ThirdFloor/UpR
			DownM
				goingto=/turf/BongWarpers/Ame/Market/ThirdFloor/UpM
		FourthFloor
			UpL
				goingto=/turf/BongWarpers/Ame/Market/FourthFloor/DownL
			UpR
				goingto=/turf/BongWarpers/Ame/Market/FourthFloor/DownR
			UpM
				goingto=/turf/BongWarpers/Ame/Market/FourthFloor/DownM
			DownL
				goingto=/turf/BongWarpers/Ame/Market/FourthFloor/UpL
			DownM
				goingto=/turf/BongWarpers/Ame/Market/FourthFloor/UpM
			DownR
				goingto=/turf/BongWarpers/Ame/Market/FourthFloor/UpR
		FifthFloor
			UpL
				goingto=/turf/BongWarpers/Ame/Market/FifthFloor/DownL
			UpR
				goingto=/turf/BongWarpers/Ame/Market/FifthFloor/DownR
			UpM
				goingto=/turf/BongWarpers/Ame/Market/FifthFloor/DownM
			DownL
				goingto=/turf/BongWarpers/Ame/Market/FifthFloor/UpL
			DownM
				goingto=/turf/BongWarpers/Ame/Market/FifthFloor/UpM
			DownR
				goingto=/turf/BongWarpers/Ame/Market/FifthFloor/UpR
	LApmt1
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		Entrance
			L
				goingto=/turf/BongWarpers/Ame/LApmt1/Inside/ExitL
			R
				goingto=/turf/BongWarpers/Ame/LApmt1/Inside/ExitR
		Inside
			ExitL
				goingto=/turf/BongWarpers/Ame/LApmt1/Entrance/L
			ExitR
				goingto=/turf/BongWarpers/Ame/LApmt1/Entrance/R
		SecondFloor
			UpL
				goingto=/turf/BongWarpers/Ame/LApmt1/SecondFloor/DownL
			UpM
				goingto=/turf/BongWarpers/Ame/LApmt1/SecondFloor/DownM
			UpR
				goingto=/turf/BongWarpers/Ame/LApmt1/SecondFloor/DownR
			DownL
				goingto=/turf/BongWarpers/Ame/LApmt1/SecondFloor/UpL
			DownM
				goingto=/turf/BongWarpers/Ame/LApmt1/SecondFloor/UpM
			DownR
				goingto=/turf/BongWarpers/Ame/LApmt1/SecondFloor/UpR
		ThirdFloor
			UpL
				goingto=/turf/BongWarpers/Ame/LApmt1/ThirdFloor/DownL
			UpR
				goingto=/turf/BongWarpers/Ame/LApmt1/ThirdFloor/DownR
			UpM
				goingto=/turf/BongWarpers/Ame/LApmt1/ThirdFloor/DownM
			DownL
				goingto=/turf/BongWarpers/Ame/LApmt1/ThirdFloor/UpL
			DownR
				goingto=/turf/BongWarpers/Ame/LApmt1/ThirdFloor/UpR
			DownM
				goingto=/turf/BongWarpers/Ame/LApmt1/ThirdFloor/UpM
		FourthFloor
			UpL
				goingto=/turf/BongWarpers/Ame/LApmt1/FourthFloor/DownL
			UpR
				goingto=/turf/BongWarpers/Ame/LApmt1/FourthFloor/DownR
			UpM
				goingto=/turf/BongWarpers/Ame/LApmt1/FourthFloor/DownM
			DownL
				goingto=/turf/BongWarpers/Ame/LApmt1/FourthFloor/UpL
			DownM
				goingto=/turf/BongWarpers/Ame/LApmt1/FourthFloor/UpM
			DownR
				goingto=/turf/BongWarpers/Ame/LApmt1/FourthFloor/UpR

	LApmt2
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		Entrance
			L
				goingto=/turf/BongWarpers/Ame/LApmt2/Inside/ExitL
			R
				goingto=/turf/BongWarpers/Ame/LApmt2/Inside/ExitR
		Inside
			ExitL
				goingto=/turf/BongWarpers/Ame/LApmt2/Entrance/L
			ExitR
				goingto=/turf/BongWarpers/Ame/LApmt2/Entrance/R
		SecondFloor
			UpL
				goingto=/turf/BongWarpers/Ame/LApmt2/SecondFloor/DownL
			UpM
				goingto=/turf/BongWarpers/Ame/LApmt2/SecondFloor/DownM
			UpR
				goingto=/turf/BongWarpers/Ame/LApmt2/SecondFloor/DownR
			DownL
				goingto=/turf/BongWarpers/Ame/LApmt2/SecondFloor/UpL
			DownM
				goingto=/turf/BongWarpers/Ame/LApmt2/SecondFloor/UpM
			DownR
				goingto=/turf/BongWarpers/Ame/LApmt2/SecondFloor/UpR
		ThirdFloor
			UpL
				goingto=/turf/BongWarpers/Ame/LApmt2/ThirdFloor/DownL
			UpR
				goingto=/turf/BongWarpers/Ame/LApmt2/ThirdFloor/DownR
			UpM
				goingto=/turf/BongWarpers/Ame/LApmt2/ThirdFloor/DownM
			DownL
				goingto=/turf/BongWarpers/Ame/LApmt2/ThirdFloor/UpL
			DownR
				goingto=/turf/BongWarpers/Ame/LApmt2/ThirdFloor/UpR
			DownM
				goingto=/turf/BongWarpers/Ame/LApmt2/ThirdFloor/UpM
		FourthFloor
			UpL
				goingto=/turf/BongWarpers/Ame/LApmt1/FourthFloor/DownL
			UpR
				goingto=/turf/BongWarpers/Ame/LApmt1/FourthFloor/DownR
			UpM
				goingto=/turf/BongWarpers/Ame/LApmt1/FourthFloor/DownM
			DownL
				goingto=/turf/BongWarpers/Ame/LApmt1/FourthFloor/UpL
			DownM
				goingto=/turf/BongWarpers/Ame/LApmt1/FourthFloor/UpM
			DownR
				goingto=/turf/BongWarpers/Ame/LApmt1/FourthFloor/UpR

	NApmt1
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		Entrance
			L
				goingto=/turf/BongWarpers/Ame/NApmt1/Inside/ExitL
			R
				goingto=/turf/BongWarpers/Ame/NApmt1/Inside/ExitR
		Inside
			ExitL
				goingto=/turf/BongWarpers/Ame/NApmt1/Entrance/L
			ExitR
				goingto=/turf/BongWarpers/Ame/NApmt1/Entrance/R
		SecondFloor
			UpL
				goingto=/turf/BongWarpers/Ame/NApmt1/SecondFloor/DownL
			UpM
				goingto=/turf/BongWarpers/Ame/NApmt1/SecondFloor/DownM
			UpR
				goingto=/turf/BongWarpers/Ame/NApmt1/SecondFloor/DownR
			DownL
				goingto=/turf/BongWarpers/Ame/NApmt1/SecondFloor/UpL
			DownM
				goingto=/turf/BongWarpers/Ame/NApmt1/SecondFloor/UpM
			DownR
				goingto=/turf/BongWarpers/Ame/NApmt1/SecondFloor/UpR
		ThirdFloor
			UpL
				goingto=/turf/BongWarpers/Ame/NApmt1/ThirdFloor/DownL
			UpR
				goingto=/turf/BongWarpers/Ame/NApmt1/ThirdFloor/DownR
			UpM
				goingto=/turf/BongWarpers/Ame/NApmt1/ThirdFloor/DownM
			DownL
				goingto=/turf/BongWarpers/Ame/NApmt1/ThirdFloor/UpL
			DownR
				goingto=/turf/BongWarpers/Ame/NApmt1/ThirdFloor/UpR
			DownM
				goingto=/turf/BongWarpers/Ame/NApmt1/ThirdFloor/UpM
	NApmt2
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		Entrance
			L
				goingto=/turf/BongWarpers/Ame/NApmt2/Inside/ExitL
			R
				goingto=/turf/BongWarpers/Ame/NApmt2/Inside/ExitR
		Inside
			ExitL
				goingto=/turf/BongWarpers/Ame/NApmt2/Entrance/L
			ExitR
				goingto=/turf/BongWarpers/Ame/NApmt2/Entrance/R
		SecondFloor
			UpL
				goingto=/turf/BongWarpers/Ame/NApmt2/SecondFloor/DownL
			UpM
				goingto=/turf/BongWarpers/Ame/NApmt2/SecondFloor/DownM
			UpR
				goingto=/turf/BongWarpers/Ame/NApmt2/SecondFloor/DownR
			DownL
				goingto=/turf/BongWarpers/Ame/NApmt2/SecondFloor/UpL
			DownM
				goingto=/turf/BongWarpers/Ame/NApmt2/SecondFloor/UpM
			DownR
				goingto=/turf/BongWarpers/Ame/NApmt2/SecondFloor/UpR
		ThirdFloor
			UpL
				goingto=/turf/BongWarpers/Ame/NApmt2/ThirdFloor/DownL
			UpR
				goingto=/turf/BongWarpers/Ame/NApmt2/ThirdFloor/DownR
			UpM
				goingto=/turf/BongWarpers/Ame/NApmt2/ThirdFloor/DownM
			DownL
				goingto=/turf/BongWarpers/Ame/NApmt2/ThirdFloor/UpL
			DownR
				goingto=/turf/BongWarpers/Ame/NApmt2/ThirdFloor/UpR
			DownM
				goingto=/turf/BongWarpers/Ame/NApmt2/ThirdFloor/UpM
	NApmt3
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		Entrance
			L
				goingto=/turf/BongWarpers/Ame/NApmt3/Inside/ExitL
			R
				goingto=/turf/BongWarpers/Ame/NApmt3/Inside/ExitR
		Inside
			ExitL
				goingto=/turf/BongWarpers/Ame/NApmt3/Entrance/L
			ExitR
				goingto=/turf/BongWarpers/Ame/NApmt3/Entrance/R
		SecondFloor
			UpL
				goingto=/turf/BongWarpers/Ame/NApmt3/SecondFloor/DownL
			UpM
				goingto=/turf/BongWarpers/Ame/NApmt3/SecondFloor/DownM
			UpR
				goingto=/turf/BongWarpers/Ame/NApmt3/SecondFloor/DownR
			DownL
				goingto=/turf/BongWarpers/Ame/NApmt3/SecondFloor/UpL
			DownM
				goingto=/turf/BongWarpers/Ame/NApmt3/SecondFloor/UpM
			DownR
				goingto=/turf/BongWarpers/Ame/NApmt3/SecondFloor/UpR
		ThirdFloor
			UpL
				goingto=/turf/BongWarpers/Ame/NApmt3/ThirdFloor/DownL
			UpR
				goingto=/turf/BongWarpers/Ame/NApmt3/ThirdFloor/DownR
			UpM
				goingto=/turf/BongWarpers/Ame/NApmt3/ThirdFloor/DownM
			DownL
				goingto=/turf/BongWarpers/Ame/NApmt3/ThirdFloor/UpL
			DownR
				goingto=/turf/BongWarpers/Ame/NApmt3/ThirdFloor/UpR
			DownM
				goingto=/turf/BongWarpers/Ame/NApmt3/ThirdFloor/UpM
	Sewers
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		UpL
			goingto=/turf/BongWarpers/Ame/Sewers/DownL
		UpM
			goingto=/turf/BongWarpers/Ame/Sewers/DownM
		UpR
			goingto=/turf/BongWarpers/Ame/Sewers/DownR
		DownL
			goingto=/turf/BongWarpers/Ame/Sewers/UpL
		DownM
			goingto=/turf/BongWarpers/Ame/Sewers/UpM
		DownR
			goingto=/turf/BongWarpers/Ame/Sewers/UpR
		MarketHidden
			goingto=/turf/BongWarpers/Ame/Sewers/MarketSewer
		MarketSewer
			goingto=/turf/BongWarpers/Ame/Sewers/MarketHidden

turf/BongWarpers/Mining
	Mines
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		AOut
			goingto=/turf/BongWarpers/Mining/Mines/AIn
		AIn
			goingto=/turf/BongWarpers/Mining/Mines/AOut
		BOut
			goingto=/turf/BongWarpers/Mining/Mines/BIn
		BIn
			goingto=/turf/BongWarpers/Mining/Mines/BOut
		COut
			goingto=/turf/BongWarpers/Mining/Mines/CIn
		CIn
			goingto=/turf/BongWarpers/Mining/Mines/COut
		DOut
			goingto=/turf/BongWarpers/Mining/Mines/DIn
		DIn
			goingto=/turf/BongWarpers/Mining/Mines/DOut
		EOut
			goingto=/turf/BongWarpers/Mining/Mines/EIn
		EIn
			goingto=/turf/BongWarpers/Mining/Mines/EOut
		FOut
			goingto=/turf/BongWarpers/Mining/Mines/FIn
		FIn
			goingto=/turf/BongWarpers/Mining/Mines/FOut

	LH1
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		L
			goingto=/turf/BongWarpers/Mining/LH1/ExitL
		R
			goingto=/turf/BongWarpers/Mining/LH1/ExitR
		ExitL
			goingto=/turf/BongWarpers/Mining/LH1/L
		ExitR
			goingto=/turf/BongWarpers/Mining/LH1/R
	LH2
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		L
			goingto=/turf/BongWarpers/Mining/LH2/ExitL
		R
			goingto=/turf/BongWarpers/Mining/LH2/ExitR
		ExitL
			goingto=/turf/BongWarpers/Mining/LH2/L
		ExitR
			goingto=/turf/BongWarpers/Mining/LH2/R
	LH3
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		L
			goingto=/turf/BongWarpers/Mining/LH3/ExitL
		R
			goingto=/turf/BongWarpers/Mining/LH3/ExitR
		ExitL
			goingto=/turf/BongWarpers/Mining/LH3/L
		ExitR
			goingto=/turf/BongWarpers/Mining/LH3/R
	LH4
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		L
			goingto=/turf/BongWarpers/Mining/LH4/ExitL
		R
			goingto=/turf/BongWarpers/Mining/LH4/ExitR
		ExitL
			goingto=/turf/BongWarpers/Mining/LH4/L
		ExitR
			goingto=/turf/BongWarpers/Mining/LH4/R
	LH5
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		L
			goingto=/turf/BongWarpers/Mining/LH5/ExitL
		R
			goingto=/turf/BongWarpers/Mining/LH5/ExitR
		ExitL
			goingto=/turf/BongWarpers/Mining/LH5/L
		ExitR
			goingto=/turf/BongWarpers/Mining/LH5/R

	Shop
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		L
			goingto=/turf/BongWarpers/Mining/Shop/ExitL
		R
			goingto=/turf/BongWarpers/Mining/Shop/ExitR
		ExitL
			goingto=/turf/BongWarpers/Mining/Shop/L
		ExitR
			goingto=/turf/BongWarpers/Mining/Shop/R
	Smallhouses
		SH1
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			L
				goingto=/turf/BongWarpers/Mining/Smallhouses/SH1/ExitL
			R
				goingto=/turf/BongWarpers/Mining/Smallhouses/SH1/ExitR
			ExitL
				goingto=/turf/BongWarpers/Mining/Smallhouses/SH1/L
			ExitR
				goingto=/turf/BongWarpers/Mining/Smallhouses/SH1/R
		SH2
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			L
				goingto=/turf/BongWarpers/Mining/Smallhouses/SH2/ExitL
			R
				goingto=/turf/BongWarpers/Mining/Smallhouses/SH2/ExitR
			ExitL
				goingto=/turf/BongWarpers/Mining/Smallhouses/SH2/L
			ExitR
				goingto=/turf/BongWarpers/Mining/Smallhouses/SH2/R
		SH3
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			L
				goingto=/turf/BongWarpers/Mining/Smallhouses/SH3/ExitL
			R
				goingto=/turf/BongWarpers/Mining/Smallhouses/SH3/ExitR
			ExitL
				goingto=/turf/BongWarpers/Mining/Smallhouses/SH3/L
			ExitR
				goingto=/turf/BongWarpers/Mining/Smallhouses/SH3/R
		SH4
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			L
				goingto=/turf/BongWarpers/Mining/Smallhouses/SH4/ExitL
			R
				goingto=/turf/BongWarpers/Mining/Smallhouses/SH4/ExitR
			ExitL
				goingto=/turf/BongWarpers/Mining/Smallhouses/SH4/L
			ExitR
				goingto=/turf/BongWarpers/Mining/Smallhouses/SH4/R
		SH5
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			L
				goingto=/turf/BongWarpers/Mining/Smallhouses/SH5/ExitL
			R
				goingto=/turf/BongWarpers/Mining/Smallhouses/SH5/ExitR
			ExitL
				goingto=/turf/BongWarpers/Mining/Smallhouses/SH5/L
			ExitR
				goingto=/turf/BongWarpers/Mining/Smallhouses/SH5/R
		SH6
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			L
				goingto=/turf/BongWarpers/Mining/Smallhouses/SH6/ExitL
			R
				goingto=/turf/BongWarpers/Mining/Smallhouses/SH6/ExitR
			ExitL
				goingto=/turf/BongWarpers/Mining/Smallhouses/SH6/L
			ExitR
				goingto=/turf/BongWarpers/Mining/Smallhouses/SH6/R
		SH7
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			L
				goingto=/turf/BongWarpers/Mining/Smallhouses/SH7/ExitL
			R
				goingto=/turf/BongWarpers/Mining/Smallhouses/SH7/ExitR
			ExitL
				goingto=/turf/BongWarpers/Mining/Smallhouses/SH7/L
			ExitR
				goingto=/turf/BongWarpers/Mining/Smallhouses/SH7/R

turf/BongWarpers/Desert
	Smallhouses
		SH1
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			L
				goingto=/turf/BongWarpers/Desert/Smallhouses/SH1/ExitL
			R
				goingto=/turf/BongWarpers/Desert/Smallhouses/SH1/ExitR
			ExitL
				goingto=/turf/BongWarpers/Desert/Smallhouses/SH1/L
			ExitR
				goingto=/turf/BongWarpers/Desert/Smallhouses/SH1/R
		SH2
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			L
				goingto=/turf/BongWarpers/Desert/Smallhouses/SH2/ExitL
			R
				goingto=/turf/BongWarpers/Desert/Smallhouses/SH2/ExitR
			ExitL
				goingto=/turf/BongWarpers/Desert/Smallhouses/SH2/L
			ExitR
				goingto=/turf/BongWarpers/Desert/Smallhouses/SH2/R
		SH3
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			L
				goingto=/turf/BongWarpers/Desert/Smallhouses/SH3/ExitL
			R
				goingto=/turf/BongWarpers/Desert/Smallhouses/SH3/ExitR
			ExitL
				goingto=/turf/BongWarpers/Desert/Smallhouses/SH3/L
			ExitR
				goingto=/turf/BongWarpers/Desert/Smallhouses/SH3/R
		SH4
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			L
				goingto=/turf/BongWarpers/Desert/Smallhouses/SH4/ExitL
			R
				goingto=/turf/BongWarpers/Desert/Smallhouses/SH4/ExitR
			ExitL
				goingto=/turf/BongWarpers/Desert/Smallhouses/SH4/L
			ExitR
				goingto=/turf/BongWarpers/Desert/Smallhouses/SH4/R
		SH5
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			L
				goingto=/turf/BongWarpers/Desert/Smallhouses/SH5/ExitL
			R
				goingto=/turf/BongWarpers/Desert/Smallhouses/SH5/ExitR
			ExitL
				goingto=/turf/BongWarpers/Desert/Smallhouses/SH5/L
			ExitR
				goingto=/turf/BongWarpers/Desert/Smallhouses/SH5/R

turf/BongWarpers/B4
	Smallhouses
		SH1
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			L
				goingto=/turf/BongWarpers/B4/Smallhouses/SH1/ExitL
			R
				goingto=/turf/BongWarpers/B4/Smallhouses/SH1/ExitR
			ExitL
				goingto=/turf/BongWarpers/B4/Smallhouses/SH1/L
			ExitR
				goingto=/turf/BongWarpers/B4/Smallhouses/SH1/R
		SH2
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			L
				goingto=/turf/BongWarpers/B4/Smallhouses/SH2/ExitL
			R
				goingto=/turf/BongWarpers/B4/Smallhouses/SH2/ExitR
			ExitL
				goingto=/turf/BongWarpers/B4/Smallhouses/SH2/L
			ExitR
				goingto=/turf/BongWarpers/B4/Smallhouses/SH2/R
		SH3
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			L
				goingto=/turf/BongWarpers/B4/Smallhouses/SH3/ExitL
			R
				goingto=/turf/BongWarpers/B4/Smallhouses/SH3/ExitR
			ExitL
				goingto=/turf/BongWarpers/B4/Smallhouses/SH3/L
			ExitR
				goingto=/turf/BongWarpers/B4/Smallhouses/SH3/R
		SH4
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return
				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))
				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			L
				goingto=/turf/BongWarpers/B4/Smallhouses/SH4/ExitL
			R
				goingto=/turf/BongWarpers/B4/Smallhouses/SH4/ExitR
			ExitL
				goingto=/turf/BongWarpers/B4/Smallhouses/SH4/L
			ExitR
				goingto=/turf/BongWarpers/B4/Smallhouses/SH4/R
	Cave
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		AOut
			goingto=/turf/BongWarpers/B4/Cave/AIn
		AIn
			goingto=/turf/BongWarpers/B4/Cave/AOut
		BOut
			goingto=/turf/BongWarpers/B4/Cave/BIn
		BIn
			goingto=/turf/BongWarpers/B4/Cave/BOut
		COut
			goingto=/turf/BongWarpers/B4/Cave/CIn
		CIn
			goingto=/turf/BongWarpers/B4/Cave/COut
		DOut
			goingto=/turf/BongWarpers/B4/Cave/DIn
		DIn
			goingto=/turf/BongWarpers/B4/Cave/DOut
		EOut
			goingto=/turf/BongWarpers/B4/Cave/EIn
		EIn
			goingto=/turf/BongWarpers/B4/Cave/EOut
		FOut
			goingto=/turf/BongWarpers/B4/Cave/FIn
		FIn
			goingto=/turf/BongWarpers/B4/Cave/FOut

turf/BongWarpers/B3
	Cave
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		AOut
			goingto=/turf/BongWarpers/B3/Cave/AIn
		AIn
			goingto=/turf/BongWarpers/B3/Cave/AOut
		BOut
			goingto=/turf/BongWarpers/B3/Cave/BIn
		BIn
			goingto=/turf/BongWarpers/B3/Cave/BOut
		COut
			goingto=/turf/BongWarpers/B3/Cave/CIn
		CIn
			goingto=/turf/BongWarpers/B3/Cave/COut
		DOut
			goingto=/turf/BongWarpers/B3/Cave/DIn
		DIn
			goingto=/turf/BongWarpers/B3/Cave/DOut
		EOut
			goingto=/turf/BongWarpers/B3/Cave/EIn
		EIn
			goingto=/turf/BongWarpers/B3/Cave/EOut
		FOut
			goingto=/turf/BongWarpers/B3/Cave/FIn
		FIn
			goingto=/turf/BongWarpers/B3/Cave/FOut