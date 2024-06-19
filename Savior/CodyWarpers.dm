turf/var
	minesOpen = 1

turf/RoSWarpers
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
			goingto=/turf/RoSWarpers/MinesOut/GoingOutA
		GoingInB
			goingto=/turf/RoSWarpers/MinesOut/GoingOutB
		GoingInC
			goingto=/turf/RoSWarpers/MinesOut/GoingOutC
		GoingInD
			goingto=/turf/RoSWarpers/MinesOut/GoingOutD
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
			goingto=/turf/RoSWarpers/MinesInside/GoingInA
		GoingOutB
			goingto=/turf/RoSWarpers/MinesInside/GoingInB
		GoingOutC
			goingto=/turf/RoSWarpers/MinesInside/GoingInC
		GoingOutD
			goingto=/turf/RoSWarpers/MinesInside/GoingInD
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
					goingto=/turf/RoSWarpers/TutIsland/Barber/Inside/ExitL
				R
					goingto=/turf/RoSWarpers/TutIsland/Barber/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/RoSWarpers/TutIsland/Barber/Entrance/L
				ExitR
					goingto=/turf/RoSWarpers/TutIsland/Barber/Entrance/R
		Clothing
			Entrance
				L
					goingto=/turf/RoSWarpers/TutIsland/Clothing/Inside/ExitL
				R
					goingto=/turf/RoSWarpers/TutIsland/Clothing/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/RoSWarpers/TutIsland/Clothing/Entrance/L
				ExitR
					goingto=/turf/RoSWarpers/TutIsland/Clothing/Entrance/R


turf/RoSWarpers/Kono
	KonoMans
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
				goingto=/turf/RoSWarpers/Kono/KonoMans/Inside/ExitL
			R
				goingto=/turf/RoSWarpers/Kono/KonoMans/Inside/ExitR
			Mid
				goingto=/turf/RoSWarpers/Kono/KonoMans/Inside/ExitMid
		Inside
			UpL
				goingto=/turf/RoSWarpers/Kono/KonoMans/Inside/SecondL
			UpMid
				goingto=/turf/RoSWarpers/Kono/KonoMans/Inside/SecondMid
			UpR
				goingto=/turf/RoSWarpers/Kono/KonoMans/Inside/SecondR
			SecondL
				goingto=/turf/RoSWarpers/Kono/KonoMans/Inside/UpL
			SecondMid
				goingto=/turf/RoSWarpers/Kono/KonoMans/Inside/UpMid
			SecondR
				goingto=/turf/RoSWarpers/Kono/KonoMans/Inside/UpR
			ExitL
				goingto=/turf/RoSWarpers/Kono/KonoMans/Entrance/L
			ExitR
				goingto=/turf/RoSWarpers/Kono/KonoMans/Entrance/R
			ExitMid
				goingto=/turf/RoSWarpers/Kono/KonoMans/Entrance/Mid
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
				goingto=/turf/RoSWarpers/Kono/Cafe/Inside/ExitL
			R
				goingto=/turf/RoSWarpers/Kono/Cafe/Inside/ExitR
		Inside
			ExitL
				goingto=/turf/RoSWarpers/Kono/Cafe/Entrance/L
			ExitR
				goingto=/turf/RoSWarpers/Kono/Cafe/Entrance/R
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
				goingto=/turf/RoSWarpers/Kono/Prison/Inside/ExitL
			R
				goingto=/turf/RoSWarpers/Kono/Prison/Inside/ExitR
		Inside
			ExitL
				goingto=/turf/RoSWarpers/Kono/Prison/Entrance/L
			ExitR
				goingto=/turf/RoSWarpers/Kono/Prison/Entrance/R
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
				goingto=/turf/RoSWarpers/Kono/Academy/Inside/ExitL
			R
				goingto=/turf/RoSWarpers/Kono/Academy/Inside/ExitR
		Inside
			ExitL
				goingto=/turf/RoSWarpers/Kono/Academy/Entrance/L
			ExitR
				goingto=/turf/RoSWarpers/Kono/Academy/Entrance/R
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
				goingto=/turf/RoSWarpers/Kono/Hospital/Inside/ExitL
			R
				goingto=/turf/RoSWarpers/Kono/Hospital/Inside/ExitR
		Inside
			ExitL
				goingto=/turf/RoSWarpers/Kono/Hospital/Entrance/L
			ExitR
				goingto=/turf/RoSWarpers/Kono/Hospital/Entrance/R
		FirstFloor
			BasementL
				goingto=/turf/RoSWarpers/Kono/Hospital/Basement/L
			BasementR
				goingto=/turf/RoSWarpers/Kono/Hospital/Basement/R
			SecondL
				goingto=/turf/RoSWarpers/Kono/Hospital/FirstFloor/UpstairsL
			SecondR
				goingto=/turf/RoSWarpers/Kono/Hospital/FirstFloor/UpstairsR
			UpstairsL
				goingto=/turf/RoSWarpers/Kono/Hospital/FirstFloor/SecondL
			UpstairsR
				goingto=/turf/RoSWarpers/Kono/Hospital/FirstFloor/SecondR
			RoofL
				goingto=/turf/RoSWarpers/Kono/Hospital/FirstFloor/RL
			RoofR
				goingto=/turf/RoSWarpers/Kono/Hospital/FirstFloor/RR
			RL
				goingto=/turf/RoSWarpers/Kono/Hospital/FirstFloor/RoofL
			RR
				goingto=/turf/RoSWarpers/Kono/Hospital/FirstFloor/RoofR
		Basement
			L
				goingto=/turf/RoSWarpers/Kono/Hospital/FirstFloor/BasementL
			R
				goingto=/turf/RoSWarpers/Kono/Hospital/FirstFloor/BasementR

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
				goingto=/turf/RoSWarpers/Kono/Weapon/Inside/ExitL
			R
				goingto=/turf/RoSWarpers/Kono/Weapon/Inside/ExitR
		Inside
			ExitL
				goingto=/turf/RoSWarpers/Kono/Weapon/Entrance/L
			ExitR
				goingto=/turf/RoSWarpers/Kono/Weapon/Entrance/R

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
				goingto=/turf/RoSWarpers/Kono/Barber/Inside/ExitL
			R
				goingto=/turf/RoSWarpers/Kono/Barber/Inside/ExitR
		Inside
			ExitL
				goingto=/turf/RoSWarpers/Kono/Barber/Entrance/L
			ExitR
				goingto=/turf/RoSWarpers/Kono/Barber/Entrance/R

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
				goingto=/turf/RoSWarpers/Kono/Tailor/Inside/ExitL
			R
				goingto=/turf/RoSWarpers/Kono/Tailor/Inside/ExitR
		Inside
			ExitL
				goingto=/turf/RoSWarpers/Kono/Tailor/Entrance/L
			ExitR
				goingto=/turf/RoSWarpers/Kono/Tailor/Entrance/R
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
					goingto=/turf/RoSWarpers/Kono/LargeHouse/LH1/Inside/ExitL
				R
					goingto=/turf/RoSWarpers/Kono/LargeHouse/LH1/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/RoSWarpers/Kono/LargeHouse/LH1/Entrance/L
				ExitR
					goingto=/turf/RoSWarpers/Kono/LargeHouse/LH1/Entrance/R
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
					goingto=/turf/RoSWarpers/Kono/LargeHouse/LH2/Inside/ExitL
				R
					goingto=/turf/RoSWarpers/Kono/LargeHouse/LH2/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/RoSWarpers/Kono/LargeHouse/LH2/Entrance/L
				ExitR
					goingto=/turf/RoSWarpers/Kono/LargeHouse/LH2/Entrance/R
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
					goingto=/turf/RoSWarpers/Kono/LargeHouse/LH3/Inside/ExitL
				R
					goingto=/turf/RoSWarpers/Kono/LargeHouse/LH3/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/RoSWarpers/Kono/LargeHouse/LH3/Entrance/L
				ExitR
					goingto=/turf/RoSWarpers/Kono/LargeHouse/LH3/Entrance/R
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
					goingto=/turf/RoSWarpers/Kono/LargeHouse/LH4/Inside/ExitL
				R
					goingto=/turf/RoSWarpers/Kono/LargeHouse/LH4/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/RoSWarpers/Kono/LargeHouse/LH4/Entrance/L
				ExitR
					goingto=/turf/RoSWarpers/Kono/LargeHouse/LH4/Entrance/R
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
					goingto=/turf/RoSWarpers/Kono/LargeHouse/LH5/Inside/ExitL
				R
					goingto=/turf/RoSWarpers/Kono/LargeHouse/LH5/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/RoSWarpers/Kono/LargeHouse/LH5/Entrance/L
				ExitR
					goingto=/turf/RoSWarpers/Kono/LargeHouse/LH5/Entrance/R
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
					goingto=/turf/RoSWarpers/Kono/SmallHouse/SH1/Inside/ExitL
				R
					goingto=/turf/RoSWarpers/Kono/SmallHouse/SH1/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/RoSWarpers/Kono/SmallHouse/SH1/Entrance/L
				ExitR
					goingto=/turf/RoSWarpers/Kono/SmallHouse/SH1/Entrance/R
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
					goingto=/turf/RoSWarpers/Kono/SmallHouse/SH2/Inside/ExitL
				R
					goingto=/turf/RoSWarpers/Kono/SmallHouse/SH2/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/RoSWarpers/Kono/SmallHouse/SH2/Entrance/L
				ExitR
					goingto=/turf/RoSWarpers/Kono/SmallHouse/SH2/Entrance/R
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
					goingto=/turf/RoSWarpers/Kono/SmallHouse/SH3/Inside/ExitL
				R
					goingto=/turf/RoSWarpers/Kono/SmallHouse/SH3/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/RoSWarpers/Kono/SmallHouse/SH3/Entrance/L
				ExitR
					goingto=/turf/RoSWarpers/Kono/SmallHouse/SH3/Entrance/R
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
					goingto=/turf/RoSWarpers/Kono/SmallHouse/SH4/Inside/ExitL
				R
					goingto=/turf/RoSWarpers/Kono/SmallHouse/SH4/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/RoSWarpers/Kono/SmallHouse/SH4/Entrance/L
				ExitR
					goingto=/turf/RoSWarpers/Kono/SmallHouse/SH4/Entrance/R
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
					goingto=/turf/RoSWarpers/Kono/SmallHouse/SH5/Inside/ExitL
				R
					goingto=/turf/RoSWarpers/Kono/SmallHouse/SH5/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/RoSWarpers/Kono/SmallHouse/SH5/Entrance/L
				ExitR
					goingto=/turf/RoSWarpers/Kono/SmallHouse/SH5/Entrance/R
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
					goingto=/turf/RoSWarpers/Kono/SmallHouse/SH6/Inside/ExitL
				R
					goingto=/turf/RoSWarpers/Kono/SmallHouse/SH6/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/RoSWarpers/Kono/SmallHouse/SH6/Entrance/L
				ExitR
					goingto=/turf/RoSWarpers/Kono/SmallHouse/SH6/Entrance/R
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
					goingto=/turf/RoSWarpers/Kono/SmallHouse/SH7/Inside/ExitL
				R
					goingto=/turf/RoSWarpers/Kono/SmallHouse/SH7/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/RoSWarpers/Kono/SmallHouse/SH7/Entrance/L
				ExitR
					goingto=/turf/RoSWarpers/Kono/SmallHouse/SH7/Entrance/R
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
					goingto=/turf/RoSWarpers/Kono/SmallHouse/SH8/Inside/ExitL
				R
					goingto=/turf/RoSWarpers/Kono/SmallHouse/SH8/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/RoSWarpers/Kono/SmallHouse/SH8/Entrance/L
				ExitR
					goingto=/turf/RoSWarpers/Kono/SmallHouse/SH8/Entrance/R
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
					goingto=/turf/RoSWarpers/Kono/SmallHouse/EH1/Inside/ExitL
				R
					goingto=/turf/RoSWarpers/Kono/SmallHouse/EH1/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/RoSWarpers/Kono/SmallHouse/EH1/Entrance/L
				ExitR
					goingto=/turf/RoSWarpers/Kono/SmallHouse/EH1/Entrance/R
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
					goingto=/turf/RoSWarpers/Kono/SmallHouse/EH2/Inside/ExitL
				R
					goingto=/turf/RoSWarpers/Kono/SmallHouse/EH2/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/RoSWarpers/Kono/SmallHouse/EH2/Entrance/L
				ExitR
					goingto=/turf/RoSWarpers/Kono/SmallHouse/EH2/Entrance/R
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
					goingto=/turf/RoSWarpers/Kono/SmallHouse/EH3/Inside/ExitL
				R
					goingto=/turf/RoSWarpers/Kono/SmallHouse/EH3/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/RoSWarpers/Kono/SmallHouse/EH3/Entrance/L
				ExitR
					goingto=/turf/RoSWarpers/Kono/SmallHouse/EH3/Entrance/R
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
					goingto=/turf/RoSWarpers/Kono/SmallHouse/EH4/Inside/ExitL
				R
					goingto=/turf/RoSWarpers/Kono/SmallHouse/EH4/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/RoSWarpers/Kono/SmallHouse/EH4/Entrance/L
				ExitR
					goingto=/turf/RoSWarpers/Kono/SmallHouse/EH4/Entrance/R
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
					goingto=/turf/RoSWarpers/Kono/SmallHouse/EH5/Inside/ExitL
				R
					goingto=/turf/RoSWarpers/Kono/SmallHouse/EH5/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/RoSWarpers/Kono/SmallHouse/EH5/Entrance/L
				ExitR
					goingto=/turf/RoSWarpers/Kono/SmallHouse/EH5/Entrance/R
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
					goingto=/turf/RoSWarpers/Kono/SmallHouse/EH6/Inside/ExitL
				R
					goingto=/turf/RoSWarpers/Kono/SmallHouse/EH6/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/RoSWarpers/Kono/SmallHouse/EH6/Entrance/L
				ExitR
					goingto=/turf/RoSWarpers/Kono/SmallHouse/EH6/Entrance/R
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
					goingto=/turf/RoSWarpers/Kono/SmallHouse/EH7/Inside/ExitL
				R
					goingto=/turf/RoSWarpers/Kono/SmallHouse/EH7/Inside/ExitR
			Inside
				ExitL
					goingto=/turf/RoSWarpers/Kono/SmallHouse/EH7/Entrance/L
				ExitR
					goingto=/turf/RoSWarpers/Kono/SmallHouse/EH7/Entrance/R

turf/RoSWarpers/Ame
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
				goingto=/turf/RoSWarpers/Ame/AmeMans/Inside/ExitL
			R
				goingto=/turf/RoSWarpers/Ame/AmeMans/Inside/ExitR
			Mid
				goingto=/turf/RoSWarpers/Ame/AmeMans/Inside/ExitMid
		Inside
			UpL
				goingto=/turf/RoSWarpers/Ame/AmeMans/Inside/SecondL
			UpMid
				goingto=/turf/RoSWarpers/Ame/AmeMans/Inside/SecondMid
			UpR
				goingto=/turf/RoSWarpers/Ame/AmeMans/Inside/SecondR
			SecondL
				goingto=/turf/RoSWarpers/Ame/AmeMans/Inside/UpL
			SecondMid
				goingto=/turf/RoSWarpers/Ame/AmeMans/Inside/UpMid
			SecondR
				goingto=/turf/RoSWarpers/Ame/AmeMans/Inside/UpR
			ExitL
				goingto=/turf/RoSWarpers/Ame/AmeMans/Entrance/L
			ExitR
				goingto=/turf/RoSWarpers/Ame/AmeMans/Entrance/R
			ExitMid
				goingto=/turf/RoSWarpers/Ame/AmeMans/Entrance/Mid
			SecondUpL
				goingto=/turf/RoSWarpers/Ame/AmeMans/Inside/ThirdDownL
			SecondUpR
				goingto=/turf/RoSWarpers/Ame/AmeMans/Inside/ThirdDownR
			ThirdDownL
				goingto=/turf/RoSWarpers/Ame/AmeMans/Inside/SecondUpL
			ThirdDownR
				goingto=/turf/RoSWarpers/Ame/AmeMans/Inside/SecondUpR
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
				goingto=/turf/RoSWarpers/Ame/Cafe/Inside/ExitL
			R
				goingto=/turf/RoSWarpers/Ame/Cafe/Inside/ExitR
		Inside
			ExitL
				goingto=/turf/RoSWarpers/Ame/Cafe/Entrance/L
			ExitR
				goingto=/turf/RoSWarpers/Ame/Cafe/Entrance/R
		SecondFloor
			UpL
				goingto=/turf/RoSWarpers/Ame/Cafe/SecondFloor/DownL
			UpR
				goingto=/turf/RoSWarpers/Ame/Cafe/SecondFloor/DownR
			DownL
				goingto=/turf/RoSWarpers/Ame/Cafe/SecondFloor/UpL
			DownR
				goingto=/turf/RoSWarpers/Ame/Cafe/SecondFloor/UpR
		ThirdFloor
			UpL
				goingto=/turf/RoSWarpers/Ame/Cafe/ThirdFloor/DownL
			UpR
				goingto=/turf/RoSWarpers/Ame/Cafe/ThirdFloor/DownR
			UpM
				goingto=/turf/RoSWarpers/Ame/Cafe/ThirdFloor/DownM
			DownL
				goingto=/turf/RoSWarpers/Ame/Cafe/ThirdFloor/UpL
			DownR
				goingto=/turf/RoSWarpers/Ame/Cafe/ThirdFloor/UpR
			DownM
				goingto=/turf/RoSWarpers/Ame/Cafe/ThirdFloor/UpM
		FourthFloor
			UpL
				goingto=/turf/RoSWarpers/Ame/Cafe/FourthFloor/DownL
			UpR
				goingto=/turf/RoSWarpers/Ame/Cafe/FourthFloor/DownR
			UpM
				goingto=/turf/RoSWarpers/Ame/Cafe/FourthFloor/DownM
			DownL
				goingto=/turf/RoSWarpers/Ame/Cafe/FourthFloor/UpL
			DownM
				goingto=/turf/RoSWarpers/Ame/Cafe/FourthFloor/UpM
			DownR
				goingto=/turf/RoSWarpers/Ame/Cafe/FourthFloor/UpR
		FifthFloor
			UpL
				goingto=/turf/RoSWarpers/Ame/Cafe/FifthFloor/DownL
			UpR
				goingto=/turf/RoSWarpers/Ame/Cafe/FifthFloor/DownR
			UpM
				goingto=/turf/RoSWarpers/Ame/Cafe/FifthFloor/DownM
			DownL
				goingto=/turf/RoSWarpers/Ame/Cafe/FifthFloor/UpL
			DownM
				goingto=/turf/RoSWarpers/Ame/Cafe/FifthFloor/UpM
			DownR
				goingto=/turf/RoSWarpers/Ame/Cafe/FifthFloor/UpR
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
				goingto=/turf/RoSWarpers/Ame/Prison/Inside/ExitL
			R
				goingto=/turf/RoSWarpers/Ame/Prison/Inside/ExitR
		Inside
			ExitL
				goingto=/turf/RoSWarpers/Ame/Prison/Entrance/L
			ExitR
				goingto=/turf/RoSWarpers/Ame/Prison/Entrance/R
		SecondFloor
			UpL
				goingto=/turf/RoSWarpers/Ame/Prison/SecondFloor/DownL
			UpR
				goingto=/turf/RoSWarpers/Ame/Prison/SecondFloor/DownR
			DownL
				goingto=/turf/RoSWarpers/Ame/Prison/SecondFloor/UpL
			DownR
				goingto=/turf/RoSWarpers/Ame/Prison/SecondFloor/UpR
		ThirdFloor
			UpL
				goingto=/turf/RoSWarpers/Ame/Prison/ThirdFloor/DownL
			UpR
				goingto=/turf/RoSWarpers/Ame/Prison/ThirdFloor/DownR
			DownL
				goingto=/turf/RoSWarpers/Ame/Prison/ThirdFloor/UpL
			DownR
				goingto=/turf/RoSWarpers/Ame/Prison/ThirdFloor/UpR
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
				goingto=/turf/RoSWarpers/Ame/Academy/Inside/ExitL
			R
				goingto=/turf/RoSWarpers/Ame/Academy/Inside/ExitR
		Inside
			ExitL
				goingto=/turf/RoSWarpers/Ame/Academy/Entrance/L
			ExitR
				goingto=/turf/RoSWarpers/Ame/Academy/Entrance/R
		Basement
			UpL
				goingto=/turf/RoSWarpers/Ame/Academy/Basement/DownL
			UpM
				goingto=/turf/RoSWarpers/Ame/Academy/Basement/DownM
			UpR
				goingto=/turf/RoSWarpers/Ame/Academy/Basement/DownR
			DownL
				goingto=/turf/RoSWarpers/Ame/Academy/Basement/UpL
			DownM
				goingto=/turf/RoSWarpers/Ame/Academy/Basement/UpM
			DownR
				goingto=/turf/RoSWarpers/Ame/Academy/Basement/UpR
		SecondFloor
			UpL
				goingto=/turf/RoSWarpers/Ame/Academy/SecondFloor/DownL
			UpM
				goingto=/turf/RoSWarpers/Ame/Academy/SecondFloor/DownM
			UpR
				goingto=/turf/RoSWarpers/Ame/Academy/SecondFloor/DownR
			DownL
				goingto=/turf/RoSWarpers/Ame/Academy/SecondFloor/UpL
			DownM
				goingto=/turf/RoSWarpers/Ame/Academy/SecondFloor/UpM
			DownR
				goingto=/turf/RoSWarpers/Ame/Academy/SecondFloor/UpR
		ThirdFloor
			UpL
				goingto=/turf/RoSWarpers/Ame/Academy/ThirdFloor/DownL
			UpM
				goingto=/turf/RoSWarpers/Ame/Academy/ThirdFloor/DownM
			UpR
				goingto=/turf/RoSWarpers/Ame/Academy/ThirdFloor/DownR
			DownL
				goingto=/turf/RoSWarpers/Ame/Academy/ThirdFloor/UpL
			DownM
				goingto=/turf/RoSWarpers/Ame/Academy/ThirdFloor/UpM
			DownR
				goingto=/turf/RoSWarpers/Ame/Academy/ThirdFloor/UpR
		FourthFloor
			UpL
				goingto=/turf/RoSWarpers/Ame/Academy/FourthFloor/DownL
			UpM
				goingto=/turf/RoSWarpers/Ame/Academy/FourthFloor/DownM
			UpR
				goingto=/turf/RoSWarpers/Ame/Academy/FourthFloor/DownR
			DownL
				goingto=/turf/RoSWarpers/Ame/Academy/FourthFloor/UpL
			DownM
				goingto=/turf/RoSWarpers/Ame/Academy/FourthFloor/UpM
			DownR
				goingto=/turf/RoSWarpers/Ame/Academy/FourthFloor/UpR
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
				goingto=/turf/RoSWarpers/Ame/Hospital/Inside/L
			R
				goingto=/turf/RoSWarpers/Ame/Hospital/Inside/R
		Inside
			L
				goingto=/turf/RoSWarpers/Ame/Hospital/Entrance/L
			R
				goingto=/turf/RoSWarpers/Ame/Hospital/Entrance/R
		Basement
			UpL
				goingto=/turf/RoSWarpers/Ame/Hospital/Basement/DownL
			UpM
				goingto=/turf/RoSWarpers/Ame/Hospital/Basement/DownM
			UpR
				goingto=/turf/RoSWarpers/Ame/Hospital/Basement/DownR
			DownL
				goingto=/turf/RoSWarpers/Ame/Hospital/Basement/UpL
			DownM
				goingto=/turf/RoSWarpers/Ame/Hospital/Basement/UpM
			DownR
				goingto=/turf/RoSWarpers/Ame/Hospital/Basement/UpR
		SecondFloor
			UpL
				goingto=/turf/RoSWarpers/Ame/Hospital/SecondFloor/DownL
			UpM
				goingto=/turf/RoSWarpers/Ame/Hospital/SecondFloor/DownM
			UpR
				goingto=/turf/RoSWarpers/Ame/Hospital/SecondFloor/DownR
			DownL
				goingto=/turf/RoSWarpers/Ame/Hospital/SecondFloor/UpL
			DownM
				goingto=/turf/RoSWarpers/Ame/Hospital/SecondFloor/UpM
			DownR
				goingto=/turf/RoSWarpers/Ame/Hospital/SecondFloor/UpR
		ThirdFloor
			UpL
				goingto=/turf/RoSWarpers/Ame/Hospital/ThirdFloor/DownL
			UpM
				goingto=/turf/RoSWarpers/Ame/Hospital/ThirdFloor/DownM
			UpR
				goingto=/turf/RoSWarpers/Ame/Hospital/ThirdFloor/DownR
			DownL
				goingto=/turf/RoSWarpers/Ame/Hospital/ThirdFloor/UpL
			DownM
				goingto=/turf/RoSWarpers/Ame/Hospital/ThirdFloor/UpM
			DownR
				goingto=/turf/RoSWarpers/Ame/Hospital/ThirdFloor/UpR
		FourthFloor
			UpL
				goingto=/turf/RoSWarpers/Ame/Hospital/FourthFloor/DownL
			UpM
				goingto=/turf/RoSWarpers/Ame/Hospital/FourthFloor/DownM
			UpR
				goingto=/turf/RoSWarpers/Ame/Hospital/FourthFloor/DownR
			DownL
				goingto=/turf/RoSWarpers/Ame/Hospital/FourthFloor/UpL
			DownM
				goingto=/turf/RoSWarpers/Ame/Hospital/FourthFloor/UpM
			DownR
				goingto=/turf/RoSWarpers/Ame/Hospital/FourthFloor/UpR

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
				goingto=/turf/RoSWarpers/Ame/Market/Inside/ExitL
			R
				goingto=/turf/RoSWarpers/Ame/Market/Inside/ExitR
		Inside
			ExitL
				goingto=/turf/RoSWarpers/Ame/Market/Entrance/L
			ExitR
				goingto=/turf/RoSWarpers/Ame/Market/Entrance/R
		SecondFloor
			UpL
				goingto=/turf/RoSWarpers/Ame/Market/SecondFloor/DownL
			UpM
				goingto=/turf/RoSWarpers/Ame/Market/SecondFloor/DownM
			UpR
				goingto=/turf/RoSWarpers/Ame/Market/SecondFloor/DownR
			DownL
				goingto=/turf/RoSWarpers/Ame/Market/SecondFloor/UpL
			DownM
				goingto=/turf/RoSWarpers/Ame/Market/SecondFloor/UpM
			DownR
				goingto=/turf/RoSWarpers/Ame/Market/SecondFloor/UpR
		ThirdFloor
			UpL
				goingto=/turf/RoSWarpers/Ame/Market/ThirdFloor/DownL
			UpR
				goingto=/turf/RoSWarpers/Ame/Market/ThirdFloor/DownR
			UpM
				goingto=/turf/RoSWarpers/Ame/Market/ThirdFloor/DownM
			DownL
				goingto=/turf/RoSWarpers/Ame/Market/ThirdFloor/UpL
			DownR
				goingto=/turf/RoSWarpers/Ame/Market/ThirdFloor/UpR
			DownM
				goingto=/turf/RoSWarpers/Ame/Market/ThirdFloor/UpM
		FourthFloor
			UpL
				goingto=/turf/RoSWarpers/Ame/Market/FourthFloor/DownL
			UpR
				goingto=/turf/RoSWarpers/Ame/Market/FourthFloor/DownR
			UpM
				goingto=/turf/RoSWarpers/Ame/Market/FourthFloor/DownM
			DownL
				goingto=/turf/RoSWarpers/Ame/Market/FourthFloor/UpL
			DownM
				goingto=/turf/RoSWarpers/Ame/Market/FourthFloor/UpM
			DownR
				goingto=/turf/RoSWarpers/Ame/Market/FourthFloor/UpR
		FifthFloor
			UpL
				goingto=/turf/RoSWarpers/Ame/Market/FifthFloor/DownL
			UpR
				goingto=/turf/RoSWarpers/Ame/Market/FifthFloor/DownR
			UpM
				goingto=/turf/RoSWarpers/Ame/Market/FifthFloor/DownM
			DownL
				goingto=/turf/RoSWarpers/Ame/Market/FifthFloor/UpL
			DownM
				goingto=/turf/RoSWarpers/Ame/Market/FifthFloor/UpM
			DownR
				goingto=/turf/RoSWarpers/Ame/Market/FifthFloor/UpR
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
				goingto=/turf/RoSWarpers/Ame/LApmt1/Inside/ExitL
			R
				goingto=/turf/RoSWarpers/Ame/LApmt1/Inside/ExitR
		Inside
			ExitL
				goingto=/turf/RoSWarpers/Ame/LApmt1/Entrance/L
			ExitR
				goingto=/turf/RoSWarpers/Ame/LApmt1/Entrance/R
		SecondFloor
			UpL
				goingto=/turf/RoSWarpers/Ame/LApmt1/SecondFloor/DownL
			UpM
				goingto=/turf/RoSWarpers/Ame/LApmt1/SecondFloor/DownM
			UpR
				goingto=/turf/RoSWarpers/Ame/LApmt1/SecondFloor/DownR
			DownL
				goingto=/turf/RoSWarpers/Ame/LApmt1/SecondFloor/UpL
			DownM
				goingto=/turf/RoSWarpers/Ame/LApmt1/SecondFloor/UpM
			DownR
				goingto=/turf/RoSWarpers/Ame/LApmt1/SecondFloor/UpR
		ThirdFloor
			UpL
				goingto=/turf/RoSWarpers/Ame/LApmt1/ThirdFloor/DownL
			UpR
				goingto=/turf/RoSWarpers/Ame/LApmt1/ThirdFloor/DownR
			UpM
				goingto=/turf/RoSWarpers/Ame/LApmt1/ThirdFloor/DownM
			DownL
				goingto=/turf/RoSWarpers/Ame/LApmt1/ThirdFloor/UpL
			DownR
				goingto=/turf/RoSWarpers/Ame/LApmt1/ThirdFloor/UpR
			DownM
				goingto=/turf/RoSWarpers/Ame/LApmt1/ThirdFloor/UpM
		FourthFloor
			UpL
				goingto=/turf/RoSWarpers/Ame/LApmt1/FourthFloor/DownL
			UpR
				goingto=/turf/RoSWarpers/Ame/LApmt1/FourthFloor/DownR
			UpM
				goingto=/turf/RoSWarpers/Ame/LApmt1/FourthFloor/DownM
			DownL
				goingto=/turf/RoSWarpers/Ame/LApmt1/FourthFloor/UpL
			DownM
				goingto=/turf/RoSWarpers/Ame/LApmt1/FourthFloor/UpM
			DownR
				goingto=/turf/RoSWarpers/Ame/LApmt1/FourthFloor/UpR

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
				goingto=/turf/RoSWarpers/Ame/LApmt2/Inside/ExitL
			R
				goingto=/turf/RoSWarpers/Ame/LApmt2/Inside/ExitR
		Inside
			ExitL
				goingto=/turf/RoSWarpers/Ame/LApmt2/Entrance/L
			ExitR
				goingto=/turf/RoSWarpers/Ame/LApmt2/Entrance/R
		SecondFloor
			UpL
				goingto=/turf/RoSWarpers/Ame/LApmt2/SecondFloor/DownL
			UpM
				goingto=/turf/RoSWarpers/Ame/LApmt2/SecondFloor/DownM
			UpR
				goingto=/turf/RoSWarpers/Ame/LApmt2/SecondFloor/DownR
			DownL
				goingto=/turf/RoSWarpers/Ame/LApmt2/SecondFloor/UpL
			DownM
				goingto=/turf/RoSWarpers/Ame/LApmt2/SecondFloor/UpM
			DownR
				goingto=/turf/RoSWarpers/Ame/LApmt2/SecondFloor/UpR
		ThirdFloor
			UpL
				goingto=/turf/RoSWarpers/Ame/LApmt2/ThirdFloor/DownL
			UpR
				goingto=/turf/RoSWarpers/Ame/LApmt2/ThirdFloor/DownR
			UpM
				goingto=/turf/RoSWarpers/Ame/LApmt2/ThirdFloor/DownM
			DownL
				goingto=/turf/RoSWarpers/Ame/LApmt2/ThirdFloor/UpL
			DownR
				goingto=/turf/RoSWarpers/Ame/LApmt2/ThirdFloor/UpR
			DownM
				goingto=/turf/RoSWarpers/Ame/LApmt2/ThirdFloor/UpM
		FourthFloor
			UpL
				goingto=/turf/RoSWarpers/Ame/LApmt1/FourthFloor/DownL
			UpR
				goingto=/turf/RoSWarpers/Ame/LApmt1/FourthFloor/DownR
			UpM
				goingto=/turf/RoSWarpers/Ame/LApmt1/FourthFloor/DownM
			DownL
				goingto=/turf/RoSWarpers/Ame/LApmt1/FourthFloor/UpL
			DownM
				goingto=/turf/RoSWarpers/Ame/LApmt1/FourthFloor/UpM
			DownR
				goingto=/turf/RoSWarpers/Ame/LApmt1/FourthFloor/UpR

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
				goingto=/turf/RoSWarpers/Ame/NApmt1/Inside/ExitL
			R
				goingto=/turf/RoSWarpers/Ame/NApmt1/Inside/ExitR
		Inside
			ExitL
				goingto=/turf/RoSWarpers/Ame/NApmt1/Entrance/L
			ExitR
				goingto=/turf/RoSWarpers/Ame/NApmt1/Entrance/R
		SecondFloor
			UpL
				goingto=/turf/RoSWarpers/Ame/NApmt1/SecondFloor/DownL
			UpM
				goingto=/turf/RoSWarpers/Ame/NApmt1/SecondFloor/DownM
			UpR
				goingto=/turf/RoSWarpers/Ame/NApmt1/SecondFloor/DownR
			DownL
				goingto=/turf/RoSWarpers/Ame/NApmt1/SecondFloor/UpL
			DownM
				goingto=/turf/RoSWarpers/Ame/NApmt1/SecondFloor/UpM
			DownR
				goingto=/turf/RoSWarpers/Ame/NApmt1/SecondFloor/UpR
		ThirdFloor
			UpL
				goingto=/turf/RoSWarpers/Ame/NApmt1/ThirdFloor/DownL
			UpR
				goingto=/turf/RoSWarpers/Ame/NApmt1/ThirdFloor/DownR
			UpM
				goingto=/turf/RoSWarpers/Ame/NApmt1/ThirdFloor/DownM
			DownL
				goingto=/turf/RoSWarpers/Ame/NApmt1/ThirdFloor/UpL
			DownR
				goingto=/turf/RoSWarpers/Ame/NApmt1/ThirdFloor/UpR
			DownM
				goingto=/turf/RoSWarpers/Ame/NApmt1/ThirdFloor/UpM
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
				goingto=/turf/RoSWarpers/Ame/NApmt2/Inside/ExitL
			R
				goingto=/turf/RoSWarpers/Ame/NApmt2/Inside/ExitR
		Inside
			ExitL
				goingto=/turf/RoSWarpers/Ame/NApmt2/Entrance/L
			ExitR
				goingto=/turf/RoSWarpers/Ame/NApmt2/Entrance/R
		SecondFloor
			UpL
				goingto=/turf/RoSWarpers/Ame/NApmt2/SecondFloor/DownL
			UpM
				goingto=/turf/RoSWarpers/Ame/NApmt2/SecondFloor/DownM
			UpR
				goingto=/turf/RoSWarpers/Ame/NApmt2/SecondFloor/DownR
			DownL
				goingto=/turf/RoSWarpers/Ame/NApmt2/SecondFloor/UpL
			DownM
				goingto=/turf/RoSWarpers/Ame/NApmt2/SecondFloor/UpM
			DownR
				goingto=/turf/RoSWarpers/Ame/NApmt2/SecondFloor/UpR
		ThirdFloor
			UpL
				goingto=/turf/RoSWarpers/Ame/NApmt2/ThirdFloor/DownL
			UpR
				goingto=/turf/RoSWarpers/Ame/NApmt2/ThirdFloor/DownR
			UpM
				goingto=/turf/RoSWarpers/Ame/NApmt2/ThirdFloor/DownM
			DownL
				goingto=/turf/RoSWarpers/Ame/NApmt2/ThirdFloor/UpL
			DownR
				goingto=/turf/RoSWarpers/Ame/NApmt2/ThirdFloor/UpR
			DownM
				goingto=/turf/RoSWarpers/Ame/NApmt2/ThirdFloor/UpM
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
				goingto=/turf/RoSWarpers/Ame/NApmt3/Inside/ExitL
			R
				goingto=/turf/RoSWarpers/Ame/NApmt3/Inside/ExitR
		Inside
			ExitL
				goingto=/turf/RoSWarpers/Ame/NApmt3/Entrance/L
			ExitR
				goingto=/turf/RoSWarpers/Ame/NApmt3/Entrance/R
		SecondFloor
			UpL
				goingto=/turf/RoSWarpers/Ame/NApmt3/SecondFloor/DownL
			UpM
				goingto=/turf/RoSWarpers/Ame/NApmt3/SecondFloor/DownM
			UpR
				goingto=/turf/RoSWarpers/Ame/NApmt3/SecondFloor/DownR
			DownL
				goingto=/turf/RoSWarpers/Ame/NApmt3/SecondFloor/UpL
			DownM
				goingto=/turf/RoSWarpers/Ame/NApmt3/SecondFloor/UpM
			DownR
				goingto=/turf/RoSWarpers/Ame/NApmt3/SecondFloor/UpR
		ThirdFloor
			UpL
				goingto=/turf/RoSWarpers/Ame/NApmt3/ThirdFloor/DownL
			UpR
				goingto=/turf/RoSWarpers/Ame/NApmt3/ThirdFloor/DownR
			UpM
				goingto=/turf/RoSWarpers/Ame/NApmt3/ThirdFloor/DownM
			DownL
				goingto=/turf/RoSWarpers/Ame/NApmt3/ThirdFloor/UpL
			DownR
				goingto=/turf/RoSWarpers/Ame/NApmt3/ThirdFloor/UpR
			DownM
				goingto=/turf/RoSWarpers/Ame/NApmt3/ThirdFloor/UpM
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
			goingto=/turf/RoSWarpers/Ame/Sewers/DownL
		UpM
			goingto=/turf/RoSWarpers/Ame/Sewers/DownM
		UpR
			goingto=/turf/RoSWarpers/Ame/Sewers/DownR
		DownL
			goingto=/turf/RoSWarpers/Ame/Sewers/UpL
		DownM
			goingto=/turf/RoSWarpers/Ame/Sewers/UpM
		DownR
			goingto=/turf/RoSWarpers/Ame/Sewers/UpR
		MarketHidden
			goingto=/turf/RoSWarpers/Ame/Sewers/MarketSewer
		MarketSewer
			goingto=/turf/RoSWarpers/Ame/Sewers/MarketHidden

turf/RoSWarpers/Mining
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
			goingto=/turf/RoSWarpers/Mining/Mines/AIn
		AIn
			goingto=/turf/RoSWarpers/Mining/Mines/AOut
		BOut
			goingto=/turf/RoSWarpers/Mining/Mines/BIn
		BIn
			goingto=/turf/RoSWarpers/Mining/Mines/BOut
		COut
			goingto=/turf/RoSWarpers/Mining/Mines/CIn
		CIn
			goingto=/turf/RoSWarpers/Mining/Mines/COut
		DOut
			goingto=/turf/RoSWarpers/Mining/Mines/DIn
		DIn
			goingto=/turf/RoSWarpers/Mining/Mines/DOut
		EOut
			goingto=/turf/RoSWarpers/Mining/Mines/EIn
		EIn
			goingto=/turf/RoSWarpers/Mining/Mines/EOut
		FOut
			goingto=/turf/RoSWarpers/Mining/Mines/FIn
		FIn
			goingto=/turf/RoSWarpers/Mining/Mines/FOut

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
			goingto=/turf/RoSWarpers/Mining/LH1/ExitL
		R
			goingto=/turf/RoSWarpers/Mining/LH1/ExitR
		ExitL
			goingto=/turf/RoSWarpers/Mining/LH1/L
		ExitR
			goingto=/turf/RoSWarpers/Mining/LH1/R
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
			goingto=/turf/RoSWarpers/Mining/LH2/ExitL
		R
			goingto=/turf/RoSWarpers/Mining/LH2/ExitR
		ExitL
			goingto=/turf/RoSWarpers/Mining/LH2/L
		ExitR
			goingto=/turf/RoSWarpers/Mining/LH2/R
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
			goingto=/turf/RoSWarpers/Mining/LH3/ExitL
		R
			goingto=/turf/RoSWarpers/Mining/LH3/ExitR
		ExitL
			goingto=/turf/RoSWarpers/Mining/LH3/L
		ExitR
			goingto=/turf/RoSWarpers/Mining/LH3/R
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
			goingto=/turf/RoSWarpers/Mining/LH4/ExitL
		R
			goingto=/turf/RoSWarpers/Mining/LH4/ExitR
		ExitL
			goingto=/turf/RoSWarpers/Mining/LH4/L
		ExitR
			goingto=/turf/RoSWarpers/Mining/LH4/R
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
			goingto=/turf/RoSWarpers/Mining/LH5/ExitL
		R
			goingto=/turf/RoSWarpers/Mining/LH5/ExitR
		ExitL
			goingto=/turf/RoSWarpers/Mining/LH5/L
		ExitR
			goingto=/turf/RoSWarpers/Mining/LH5/R

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
			goingto=/turf/RoSWarpers/Mining/Shop/ExitL
		R
			goingto=/turf/RoSWarpers/Mining/Shop/ExitR
		ExitL
			goingto=/turf/RoSWarpers/Mining/Shop/L
		ExitR
			goingto=/turf/RoSWarpers/Mining/Shop/R
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
				goingto=/turf/RoSWarpers/Mining/Smallhouses/SH1/ExitL
			R
				goingto=/turf/RoSWarpers/Mining/Smallhouses/SH1/ExitR
			ExitL
				goingto=/turf/RoSWarpers/Mining/Smallhouses/SH1/L
			ExitR
				goingto=/turf/RoSWarpers/Mining/Smallhouses/SH1/R
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
				goingto=/turf/RoSWarpers/Mining/Smallhouses/SH2/ExitL
			R
				goingto=/turf/RoSWarpers/Mining/Smallhouses/SH2/ExitR
			ExitL
				goingto=/turf/RoSWarpers/Mining/Smallhouses/SH2/L
			ExitR
				goingto=/turf/RoSWarpers/Mining/Smallhouses/SH2/R
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
				goingto=/turf/RoSWarpers/Mining/Smallhouses/SH3/ExitL
			R
				goingto=/turf/RoSWarpers/Mining/Smallhouses/SH3/ExitR
			ExitL
				goingto=/turf/RoSWarpers/Mining/Smallhouses/SH3/L
			ExitR
				goingto=/turf/RoSWarpers/Mining/Smallhouses/SH3/R
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
				goingto=/turf/RoSWarpers/Mining/Smallhouses/SH4/ExitL
			R
				goingto=/turf/RoSWarpers/Mining/Smallhouses/SH4/ExitR
			ExitL
				goingto=/turf/RoSWarpers/Mining/Smallhouses/SH4/L
			ExitR
				goingto=/turf/RoSWarpers/Mining/Smallhouses/SH4/R
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
				goingto=/turf/RoSWarpers/Mining/Smallhouses/SH5/ExitL
			R
				goingto=/turf/RoSWarpers/Mining/Smallhouses/SH5/ExitR
			ExitL
				goingto=/turf/RoSWarpers/Mining/Smallhouses/SH5/L
			ExitR
				goingto=/turf/RoSWarpers/Mining/Smallhouses/SH5/R
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
				goingto=/turf/RoSWarpers/Mining/Smallhouses/SH6/ExitL
			R
				goingto=/turf/RoSWarpers/Mining/Smallhouses/SH6/ExitR
			ExitL
				goingto=/turf/RoSWarpers/Mining/Smallhouses/SH6/L
			ExitR
				goingto=/turf/RoSWarpers/Mining/Smallhouses/SH6/R
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
				goingto=/turf/RoSWarpers/Mining/Smallhouses/SH7/ExitL
			R
				goingto=/turf/RoSWarpers/Mining/Smallhouses/SH7/ExitR
			ExitL
				goingto=/turf/RoSWarpers/Mining/Smallhouses/SH7/L
			ExitR
				goingto=/turf/RoSWarpers/Mining/Smallhouses/SH7/R

turf/RoSWarpers/Desert
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
				goingto=/turf/RoSWarpers/Desert/Smallhouses/SH1/ExitL
			R
				goingto=/turf/RoSWarpers/Desert/Smallhouses/SH1/ExitR
			ExitL
				goingto=/turf/RoSWarpers/Desert/Smallhouses/SH1/L
			ExitR
				goingto=/turf/RoSWarpers/Desert/Smallhouses/SH1/R
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
				goingto=/turf/RoSWarpers/Desert/Smallhouses/SH2/ExitL
			R
				goingto=/turf/RoSWarpers/Desert/Smallhouses/SH2/ExitR
			ExitL
				goingto=/turf/RoSWarpers/Desert/Smallhouses/SH2/L
			ExitR
				goingto=/turf/RoSWarpers/Desert/Smallhouses/SH2/R
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
				goingto=/turf/RoSWarpers/Desert/Smallhouses/SH3/ExitL
			R
				goingto=/turf/RoSWarpers/Desert/Smallhouses/SH3/ExitR
			ExitL
				goingto=/turf/RoSWarpers/Desert/Smallhouses/SH3/L
			ExitR
				goingto=/turf/RoSWarpers/Desert/Smallhouses/SH3/R
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
				goingto=/turf/RoSWarpers/Desert/Smallhouses/SH4/ExitL
			R
				goingto=/turf/RoSWarpers/Desert/Smallhouses/SH4/ExitR
			ExitL
				goingto=/turf/RoSWarpers/Desert/Smallhouses/SH4/L
			ExitR
				goingto=/turf/RoSWarpers/Desert/Smallhouses/SH4/R
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
				goingto=/turf/RoSWarpers/Desert/Smallhouses/SH5/ExitL
			R
				goingto=/turf/RoSWarpers/Desert/Smallhouses/SH5/ExitR
			ExitL
				goingto=/turf/RoSWarpers/Desert/Smallhouses/SH5/L
			ExitR
				goingto=/turf/RoSWarpers/Desert/Smallhouses/SH5/R

turf/RoSWarpers/B4
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
				goingto=/turf/RoSWarpers/B4/Smallhouses/SH1/ExitL
			R
				goingto=/turf/RoSWarpers/B4/Smallhouses/SH1/ExitR
			ExitL
				goingto=/turf/RoSWarpers/B4/Smallhouses/SH1/L
			ExitR
				goingto=/turf/RoSWarpers/B4/Smallhouses/SH1/R
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
				goingto=/turf/RoSWarpers/B4/Smallhouses/SH2/ExitL
			R
				goingto=/turf/RoSWarpers/B4/Smallhouses/SH2/ExitR
			ExitL
				goingto=/turf/RoSWarpers/B4/Smallhouses/SH2/L
			ExitR
				goingto=/turf/RoSWarpers/B4/Smallhouses/SH2/R
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
				goingto=/turf/RoSWarpers/B4/Smallhouses/SH3/ExitL
			R
				goingto=/turf/RoSWarpers/B4/Smallhouses/SH3/ExitR
			ExitL
				goingto=/turf/RoSWarpers/B4/Smallhouses/SH3/L
			ExitR
				goingto=/turf/RoSWarpers/B4/Smallhouses/SH3/R
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
				goingto=/turf/RoSWarpers/B4/Smallhouses/SH4/ExitL
			R
				goingto=/turf/RoSWarpers/B4/Smallhouses/SH4/ExitR
			ExitL
				goingto=/turf/RoSWarpers/B4/Smallhouses/SH4/L
			ExitR
				goingto=/turf/RoSWarpers/B4/Smallhouses/SH4/R
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
			goingto=/turf/RoSWarpers/B4/Cave/AIn
		AIn
			goingto=/turf/RoSWarpers/B4/Cave/AOut
		BOut
			goingto=/turf/RoSWarpers/B4/Cave/BIn
		BIn
			goingto=/turf/RoSWarpers/B4/Cave/BOut
		COut
			goingto=/turf/RoSWarpers/B4/Cave/CIn
		CIn
			goingto=/turf/RoSWarpers/B4/Cave/COut
		DOut
			goingto=/turf/RoSWarpers/B4/Cave/DIn
		DIn
			goingto=/turf/RoSWarpers/B4/Cave/DOut
		EOut
			goingto=/turf/RoSWarpers/B4/Cave/EIn
		EIn
			goingto=/turf/RoSWarpers/B4/Cave/EOut
		FOut
			goingto=/turf/RoSWarpers/B4/Cave/FIn
		FIn
			goingto=/turf/RoSWarpers/B4/Cave/FOut

turf/RoSWarpers/B3
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
			goingto=/turf/RoSWarpers/B3/Cave/AIn
		AIn
			goingto=/turf/RoSWarpers/B3/Cave/AOut
		BOut
			goingto=/turf/RoSWarpers/B3/Cave/BIn
		BIn
			goingto=/turf/RoSWarpers/B3/Cave/BOut
		COut
			goingto=/turf/RoSWarpers/B3/Cave/CIn
		CIn
			goingto=/turf/RoSWarpers/B3/Cave/COut
		DOut
			goingto=/turf/RoSWarpers/B3/Cave/DIn
		DIn
			goingto=/turf/RoSWarpers/B3/Cave/DOut
		EOut
			goingto=/turf/RoSWarpers/B3/Cave/EIn
		EIn
			goingto=/turf/RoSWarpers/B3/Cave/EOut
		FOut
			goingto=/turf/RoSWarpers/B3/Cave/FIn
		FIn
			goingto=/turf/RoSWarpers/B3/Cave/FOut