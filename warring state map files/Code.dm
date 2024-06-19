/turf/tree/Treedead3
	icon = 'treedead3.dmi'
	layer = 5


area
	Exterior
		FOD
			Climate="FOD"

turf/Gates
	layer = 50
	NewGate_OpenL
		icon = 'new123.dmi'
		icon_state = "LO"
	NewGate_OpenR
		icon = 'new123.dmi'
		icon_state = "RO"
	NewGate_CloseR
		icon = 'new123.dmi'
		icon_state = "LC"
	NewGate_CloseL
		icon = 'new123.dmi'
		icon_state = "RC"
	NorthNewGate_OpenL
		icon = 'new123.dmi'
		icon_state = "LO1"
	NorthNewGate_OpenR
		icon = 'new123.dmi'
		icon_state = "RO1"
	NorthNewGate_CloseR
		icon = 'new123.dmi'
		icon_state = "LC1"
	NorthNewGate_CloseL
		icon = 'new123.dmi'
		icon_state = "RC1"
	KonohaSymbol
		icon= 'KonohaSymbol.dmi'
		layer=MOB_LAYER+34
	KirigakureSymbol
		icon= 'KirigakureSymbol.dmi'
		layer=MOB_LAYER+34
	SunagakureSymbol
		icon= 'SunagakureSymbol.dmi'
		layer=MOB_LAYER+100

turf
	Konoha
		Savior
			saviorturf
				icon='newcliffa.dmi'
				layer=2
			saviorgrass
				icon='grassedge1.dmi'
			saviorgrassd
				icon='grassedged1.dmi'
			saviordirt
				icon='dirte.dmi'
			waterturf
				icon='newwater2.dmi'
				layer=2.1
				Entered(mob/M)
					if(ismob(M)&&M.Convert)
						M.onwater=1
					if(ismob(M)&&M.Convert==0)
						if(!M.overlays.Find('Swim1.dmi')) M.overlays += 'Swim1.dmi'
						M.swim=1
				Exited(mob/M)
					if(ismob(M)&&M.Convert)
						M.onwater=0
					if(ismob(M)&&M.Convert==0)
						M.overlays -= 'Swim1.dmi'
						M.swim=0
						M.onwater=0
			saviorbridge
				icon='bridge.dmi'
				layer=MOB_LAYER+34
			saviorfence1
				icon='fence1.dmi'
				layer=MOB_LAYER+39
			saviorfence3
				icon='fences.dmi'
				layer=MOB_LAYER+39
			saviorfence2
				icon='fence2.dmi'
				layer=MOB_LAYER+39
			saviorfence4
				icon='newfences.dmi'
				layer=15
			saviorwalls
				icon='urbanwalls.dmi'
				layer=4

			saviormisc
				icon='groundmisc.dmi'
				layer=4
			saviorground
				icon='cement.dmi'
turf
	Konoha
		newbuilding1
			icon='newbuildingsnew.dmi'
			layer=MOB_LAYER+30
		newwindows1
			icon='windows1.dmi'
			layer=95
		newbuildingmisc
			icon='bmisc1.dmi'
			layer=MOB_LAYER+80
		vendor
			icon='vendor.dmi'
			layer=MOB_LAYER+30
		streetpost
			icon='streetlights.dmi'
			layer=MOB_LAYER+85

		WOFM
			icon='wofm.dmi'
			layer=85

turf
	InuzukaDogs
		NorthSouthCage
			icon='prison.dmi'
			icon_state="close1"
			layer=MOB_LAYER+30
		LeftWall
			icon='InuzukaDogs.dmi'
			icon_state="wallL"
			layer=MOB_LAYER+30
		RightWall
			icon='InuzukaDogs.dmi'
			icon_state="wallR"
			layer=MOB_LAYER+30
turf
	Treestump
		icon='TreeStump.dmi'
		density=1
		layer=MOB_LAYER+30

turf
	Dog
		NorthSouthCage
			icon='Dog.dmi'
			icon_state="doggo"


turf
	tools
		suimentool
//			Entered(mob/M)
//				if(ismob(M)&&M.Convert)
//					if(src.icon_state=="cliff")
//						M.oncliff=1
//			Enter(mob/M)
//				if(ismob(M))
//					if(M.Convert)
//						return ..()
//					if(src.icon_state=="cliff")
//						M<<output("<font size = -3>You struggle to climb up the mountain without chakra padding!","outputic.output")
//						M<<output("<font size = -3>You struggle to climb up the mountain without chakra padding!","outputall.output")
//						return 0
//					else return ..()
//				..()
//
//			Exited(mob/M)
//				if(ismob(M)&&M.Convert)
//					M.oncliff=0
//			..()
turf/interiors
	Blacksmith
		Forge
			icon='Forge.dmi'
		Anvil
			icon='Anvil1.dmi'
		Bucket
			icon='Bucket1.dmi'
		Workbench
			icon='Workbench1.dmi'


turf/Tanzaku
	Sanddojo
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
		EntranceExit
			E1
				goingto=/turf/Tanzaku/Sanddojo/EntranceExit/E2
			E2
				goingto=/turf/Tanzaku/Sanddojo/EntranceExit/E1
turf
	Tanzaku
		Tanblacksmith
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
			EntranceExit
				EntranceL
					goingto=/turf/Tanzaku/Tanblacksmith/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Tanzaku/Tanblacksmith/EntranceExit/ExitR

				ExitL
					goingto=/turf/Tanzaku/Tanblacksmith/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Tanzaku/Tanblacksmith/EntranceExit/EntranceR

				F1
					goingto=/turf/Tanzaku/Tanblacksmith/EntranceExit/F2
				F2
					goingto=/turf/Tanzaku/Tanblacksmith/EntranceExit/F1

turf
	Tanzaku
		ruined
			icon = 'housescountryfull.dmi'


turf
	northmap

		hatakeprison
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
			EntranceExit
				EntranceL
					goingto=/turf/northmap/hatakeprison/EntranceExit/ExitL
				EntranceR
					goingto=/turf/northmap/hatakeprison/EntranceExit/ExitR

				ExitL
					goingto=/turf/northmap/hatakeprison/EntranceExit/EntranceL
				ExitR
					goingto=/turf/northmap/hatakeprison/EntranceExit/EntranceR

		hatakeclanhouse
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
			EntranceExit
				EntranceL
					goingto=/turf/northmap/hatakeclanhouse/EntranceExit/ExitL
				EntranceR
					goingto=/turf/northmap/hatakeclanhouse/EntranceExit/ExitR

				ExitL
					goingto=/turf/northmap/hatakeclanhouse/EntranceExit/EntranceL
				ExitR
					goingto=/turf/northmap/hatakeclanhouse/EntranceExit/EntranceR

		hatakeclanhos
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
			EntranceExit
				EntranceL
					goingto=/turf/northmap/hatakeclanhos/EntranceExit/ExitL
				EntranceR
					goingto=/turf/northmap/hatakeclanhos/EntranceExit/ExitR

				ExitL
					goingto=/turf/northmap/hatakeclanhos/EntranceExit/EntranceL
				ExitR
					goingto=/turf/northmap/hatakeclanhos/EntranceExit/EntranceR

		hatakeclanhouse2nd
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
			EntranceExit
				EntranceL
					goingto=/turf/northmap/hatakeclanhouse2nd/EntranceExit/ExitL
				EntranceR
					goingto=/turf/northmap/hatakeclanhouse2nd/EntranceExit/ExitR

				ExitL
					goingto=/turf/northmap/hatakeclanhouse2nd/EntranceExit/EntranceL
				ExitR
					goingto=/turf/northmap/hatakeclanhouse2nd/EntranceExit/EntranceR

		hataketeahouse
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
			EntranceExit
				EntranceL
					goingto=/turf/northmap/hataketeahouse/EntranceExit/ExitL
				EntranceR
					goingto=/turf/northmap/hataketeahouse/EntranceExit/ExitR

				ExitL
					goingto=/turf/northmap/hataketeahouse/EntranceExit/EntranceL
				ExitR
					goingto=/turf/northmap/hataketeahouse/EntranceExit/EntranceR

		hatakeblacksmith
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
			EntranceExit
				EntranceL
					goingto=/turf/northmap/hatakeblacksmith/EntranceExit/ExitL
				EntranceR
					goingto=/turf/northmap/hatakeblacksmith/EntranceExit/ExitR

				ExitL
					goingto=/turf/northmap/hatakeblacksmith/EntranceExit/EntranceL
				ExitR
					goingto=/turf/northmap/hatakeblacksmith/EntranceExit/EntranceR

		hatakeraitondojo
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
			EntranceExit
				EntranceL
					goingto=/turf/northmap/hatakeraitondojo/EntranceExit/ExitL
				EntranceR
					goingto=/turf/northmap/hatakeraitondojo/EntranceExit/ExitR

				ExitL
					goingto=/turf/northmap/hatakeraitondojo/EntranceExit/EntranceL
				ExitR
					goingto=/turf/northmap/hatakeraitondojo/EntranceExit/EntranceR

		hatakebarber
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
			EntranceExit
				EntranceL
					goingto=/turf/northmap/hatakebarber/EntranceExit/ExitL
				EntranceR
					goingto=/turf/northmap/hatakebarber/EntranceExit/ExitR

				ExitL
					goingto=/turf/northmap/hatakebarber/EntranceExit/EntranceL
				ExitR
					goingto=/turf/northmap/hatakebarber/EntranceExit/EntranceR

		hatakehome1
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
			EntranceExit
				EntranceL
					goingto=/turf/northmap/hatakehome1/EntranceExit/ExitL
				EntranceR
					goingto=/turf/northmap/hatakehome1/EntranceExit/ExitR

				ExitL
					goingto=/turf/northmap/hatakehome1/EntranceExit/EntranceL
				ExitR
					goingto=/turf/northmap/hatakehome1/EntranceExit/EntranceR

		hatakehome2
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
			EntranceExit
				EntranceL
					goingto=/turf/northmap/hatakehome2/EntranceExit/ExitL
				EntranceR
					goingto=/turf/northmap/hatakehome2/EntranceExit/ExitR

				ExitL
					goingto=/turf/northmap/hatakehome2/EntranceExit/EntranceL
				ExitR
					goingto=/turf/northmap/hatakehome2/EntranceExit/EntranceR

		aburameclanhouse
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
			EntranceExit
				EntranceL
					goingto=/turf/northmap/aburameclanhouse/EntranceExit/ExitL
				EntranceR
					goingto=/turf/northmap/aburameclanhouse/EntranceExit/ExitR

				ExitL
					goingto=/turf/northmap/aburameclanhouse/EntranceExit/EntranceL
				ExitR
					goingto=/turf/northmap/aburameclanhouse/EntranceExit/EntranceR

		inuzukaclanhouse
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
			EntranceExit
				EntranceL
					goingto=/turf/northmap/inuzukaclanhouse/EntranceExit/ExitL
				EntranceR
					goingto=/turf/northmap/inuzukaclanhouse/EntranceExit/ExitR

				ExitL
					goingto=/turf/northmap/inuzukaclanhouse/EntranceExit/EntranceL
				ExitR
					goingto=/turf/northmap/inuzukaclanhouse/EntranceExit/EntranceR

		hatakenaraclanhouse
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
			EntranceExit
				EntranceL
					goingto=/turf/northmap/hatakenaraclanhouse/EntranceExit/ExitL
				EntranceR
					goingto=/turf/northmap/hatakenaraclanhouse/EntranceExit/ExitR

				ExitL
					goingto=/turf/northmap/hatakenaraclanhouse/EntranceExit/EntranceL
				ExitR
					goingto=/turf/northmap/hatakenaraclanhouse/EntranceExit/EntranceR

		hatakehotel
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
			EntranceExit
				EntranceL
					goingto=/turf/northmap/hatakehotel/EntranceExit/ExitL
				EntranceR
					goingto=/turf/northmap/hatakehotel/EntranceExit/ExitR

				ExitL
					goingto=/turf/northmap/hatakehotel/EntranceExit/EntranceL
				ExitR
					goingto=/turf/northmap/hatakehotel/EntranceExit/EntranceR

		hatakehotel_1to2
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
			EntranceExit
				EntranceL
					goingto=/turf/northmap/hatakehotel_1to2/EntranceExit/ExitL
				EntranceR
					goingto=/turf/northmap/hatakehotel_1to2/EntranceExit/ExitR

				ExitL
					goingto=/turf/northmap/hatakehotel_1to2/EntranceExit/EntranceL
				ExitR
					goingto=/turf/northmap/hatakehotel_1to2/EntranceExit/EntranceR

		hatakehotel_2to3
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
			EntranceExit
				EntranceL
					goingto=/turf/northmap/hatakehotel_2to3/EntranceExit/ExitL
				EntranceR
					goingto=/turf/northmap/hatakehotel_2to3/EntranceExit/ExitR

				ExitL
					goingto=/turf/northmap/hatakehotel_2to3/EntranceExit/EntranceL
				ExitR
					goingto=/turf/northmap/hatakehotel_2to3/EntranceExit/EntranceR

		hatakespa_girl
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
			EntranceExit
				EntranceL
					goingto=/turf/northmap/hatakespa_girl/EntranceExit/ExitL
				EntranceR
					goingto=/turf/northmap/hatakespa_girl/EntranceExit/ExitR

				ExitL
					goingto=/turf/northmap/hatakespa_girl/EntranceExit/EntranceL
				ExitR
					goingto=/turf/northmap/hatakespa_girl/EntranceExit/EntranceR

		hatakespa_girl_back
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
			EntranceExit
				EntranceL
					goingto=/turf/northmap/hatakespa_girl_back/EntranceExit/ExitL
				EntranceR
					goingto=/turf/northmap/hatakespa_girl_back/EntranceExit/ExitR

				ExitL
					goingto=/turf/northmap/hatakespa_girl_back/EntranceExit/EntranceL
				ExitR
					goingto=/turf/northmap/hatakespa_girl_back/EntranceExit/EntranceR

		hatakespa_boy
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
			EntranceExit
				EntranceL
					goingto=/turf/northmap/hatakespa_boy/EntranceExit/ExitL
				EntranceR
					goingto=/turf/northmap/hatakespa_boy/EntranceExit/ExitR

				ExitL
					goingto=/turf/northmap/hatakespa_boy/EntranceExit/EntranceL
				ExitR
					goingto=/turf/northmap/hatakespa_boy/EntranceExit/EntranceR

		hatakespa_boy_back
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
			EntranceExit
				EntranceL
					goingto=/turf/northmap/hatakespa_boy_back/EntranceExit/ExitL
				EntranceR
					goingto=/turf/northmap/hatakespa_boy_back/EntranceExit/ExitR

				ExitL
					goingto=/turf/northmap/hatakespa_boy_back/EntranceExit/EntranceL
				ExitR
					goingto=/turf/northmap/hatakespa_boy_back/EntranceExit/EntranceR
		hatake_brothel
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
			EntranceExit
				EntranceL
					goingto=/turf/northmap/hatake_brothel/EntranceExit/ExitL
				EntranceR
					goingto=/turf/northmap/hatake_brothel/EntranceExit/ExitR

				ExitL
					goingto=/turf/northmap/hatake_brothel/EntranceExit/EntranceL
				ExitR
					goingto=/turf/northmap/hatake_brothel/EntranceExit/EntranceR
		hatake_casino
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
			EntranceExit
				EntranceL
					goingto=/turf/northmap/hatake_casino/EntranceExit/ExitL
				EntranceR
					goingto=/turf/northmap/hatake_casino/EntranceExit/ExitR

				ExitL
					goingto=/turf/northmap/hatake_casino/EntranceExit/EntranceL
				ExitR
					goingto=/turf/northmap/hatake_casino/EntranceExit/EntranceR

	IwagakureMap
		DotonDojo
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
			EntranceExit
				EntranceL
					goingto=/turf/IwagakureMap/DotonDojo/EntranceExit/ExitL
				EntranceR
					goingto=/turf/IwagakureMap/DotonDojo/EntranceExit/ExitR

				ExitL
					goingto=/turf/IwagakureMap/DotonDojo/EntranceExit/EntranceL
				ExitR
					goingto=/turf/IwagakureMap/DotonDojo/EntranceExit/EntranceR
		TakehayaDojo
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
			EntranceExit
				EntranceL
					goingto=/turf/IwagakureMap/TakehayaDojo/EntranceExit/ExitL
				EntranceR
					goingto=/turf/IwagakureMap/TakehayaDojo/EntranceExit/ExitR

				ExitL
					goingto=/turf/IwagakureMap/TakehayaDojo/EntranceExit/EntranceL
				ExitR
					goingto=/turf/IwagakureMap/TakehayaDojo/EntranceExit/EntranceR

		IwaHospital
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
			EntranceExit
				EntranceL
					goingto=/turf/IwagakureMap/IwaHospital/EntranceExit/ExitL
				EntranceR
					goingto=/turf/IwagakureMap/IwaHospital/EntranceExit/ExitR

				ExitL
					goingto=/turf/IwagakureMap/IwaHospital/EntranceExit/EntranceL
				ExitR
					goingto=/turf/IwagakureMap/IwaHospital/EntranceExit/EntranceR



turf
	etc
		logs
			icon='lumberstack.dmi'





turf
	customwarpers
		barberS
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
			EntranceExit
				EntranceL
					goingto=/turf/customwarpers/barberS/EntranceExit/ExitL
				EntranceR
					goingto=/turf/customwarpers/barberS/EntranceExit/ExitR

				ExitL
					goingto=/turf/customwarpers/barberS/EntranceExit/EntranceL
				ExitR
					goingto=/turf/customwarpers/barberS/EntranceExit/EntranceR

		jaktele
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
			EntranceExit
				EntranceL
					goingto=/turf/customwarpers/jaktele/EntranceExit/ExitL
				EntranceR
					goingto=/turf/customwarpers/jaktele/EntranceExit/ExitR

				ExitL
					goingto=/turf/customwarpers/jaktele/EntranceExit/EntranceL
				ExitR
					goingto=/turf/customwarpers/jaktele/EntranceExit/EntranceR


obj
    SOMELIGHT
        density=1
obj
    LargeCampfire
        icon='largecampfire.dmi'
        layer=500
        density=1
        mouse_opacity=2
        luminosity=6
        var
            obj/light/light
            matrix
                on_matrix = matrix()
                off_matrix = matrix()
        New()
            ..()
            light = new(src.loc)
            light.pixel_x = 42
            light.mouse_opacity = 0
            light.color=rgb(220,220,220)
            on_matrix.Scale(14)
            off_matrix.Scale(0)
            animate(light,transform=on_matrix,time=5)
            sleep(6)
            // And flickering...
            animate(light,color=rgb(220,220,220),time=4,loop=-1)


turf
	Konoha
		statues
			one
				icon='onetailstatue.dmi'
				layer=MOB_LAYER+30
			two
				icon='twotailstatue.dmi'
				layer=MOB_LAYER+30
			three
				icon='threetailstatue.dmi'
				layer=MOB_LAYER+30
			four
				icon='fourtailstatue.dmi'
				layer=MOB_LAYER+30
			five
				icon='fivetail.dmi'
				layer=MOB_LAYER+30
			six
				icon='sixtailstatue.dmi'
				layer=MOB_LAYER+30
			seven
				icon='seventailstatue.dmi'
				layer=MOB_LAYER+30
			eight
				icon='eighttailstatue.dmi'
				layer=MOB_LAYER+30
			nine
				icon='ninetailstatue.dmi'
				layer=MOB_LAYER+30






turf
	warps
		Amegakure
			AmeHOS
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Amegakure/AmeHOS/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Amegakure/AmeHOS/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Amegakure/AmeHOS/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Amegakure/AmeHOS/EntranceExit/EntranceR
				FloorA
					Floor1
						goingto=/turf/warps/Amegakure/AmeHOS/FloorA/Floor2

					Floor2
						goingto=/turf/warps/Amegakure/AmeHOS/FloorA/Floor1

			AmeHotel
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Amegakure/AmeHotel/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Amegakure/AmeHotel/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Amegakure/AmeHotel/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Amegakure/AmeHotel/EntranceExit/EntranceR
				FloorA
					Floor1
						goingto=/turf/warps/Amegakure/AmeHotel/FloorA/Floor2

					Floor2
						goingto=/turf/warps/Amegakure/AmeHotel/FloorA/Floor1
				FloorB
					Floor3
						goingto=/turf/warps/Amegakure/AmeHotel/FloorB/Floor4

					Floor4
						goingto=/turf/warps/Amegakure/AmeHotel/FloorB/Floor3

			AmeMansion
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Amegakure/AmeMansion/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Amegakure/AmeMansion/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Amegakure/AmeMansion/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Amegakure/AmeMansion/EntranceExit/EntranceR
			AmeMerch
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Amegakure/AmeMerch/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Amegakure/AmeMerch/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Amegakure/AmeMerch/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Amegakure/AmeMerch/EntranceExit/EntranceR
			AmeWeap
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Amegakure/AmeWeap/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Amegakure/AmeWeap/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Amegakure/AmeWeap/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Amegakure/AmeWeap/EntranceExit/EntranceR
				FloorA
					Floor1
						goingto=/turf/warps/Amegakure/AmeWeap/FloorA/Floor2

					Floor2
						goingto=/turf/warps/Amegakure/AmeWeap/FloorA/Floor1
			AmeTea
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Amegakure/AmeTea/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Amegakure/AmeTea/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Amegakure/AmeTea/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Amegakure/AmeTea/EntranceExit/EntranceR
			AmeHou1
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Amegakure/AmeHou1/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Amegakure/AmeHou1/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Amegakure/AmeHou1/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Amegakure/AmeHou1/EntranceExit/EntranceR
			AmeHou2
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Amegakure/AmeHou2/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Amegakure/AmeHou2/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Amegakure/AmeHou2/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Amegakure/AmeHou2/EntranceExit/EntranceR
			AmeHou3
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Amegakure/AmeHou3/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Amegakure/AmeHou3/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Amegakure/AmeHou3/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Amegakure/AmeHou3/EntranceExit/EntranceR

		NewKumo_Slayer
			houses
				house_1
				house_2
				house_3
				house_4
				house_5
				house_6
			hospital
			clothing_barber
			kenjutsu_dojo
			clan_1
			clan_2
			barracks
			prison
			kage_manor
			blacksmith
			academy
				academy_cave
				academy_building



		one
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
			EntranceExit
				One1
					goingto=/turf/warps/one/EntranceExit/One2
				One2
					goingto=/turf/warps/one/EntranceExit/One1

				Two1
					goingto=/turf/warps/one/EntranceExit/Two2
				Two2
					goingto=/turf/warps/one/EntranceExit/Two1

				Three1
					goingto=/turf/warps/one/EntranceExit/Three2
				Three2
					goingto=/turf/warps/one/EntranceExit/Three1

				Four1
					goingto=/turf/warps/one/EntranceExit/Four2
				Four2
					goingto=/turf/warps/one/EntranceExit/Four1

				Five1
					goingto=/turf/warps/one/EntranceExit/Five2
				Five2
					goingto=/turf/warps/one/EntranceExit/Five1

				Six1
					goingto=/turf/warps/one/EntranceExit/Six2
				Six2
					goingto=/turf/warps/one/EntranceExit/Six1

				Seven1
					goingto=/turf/warps/one/EntranceExit/Seven2
				Seven2
					goingto=/turf/warps/one/EntranceExit/Seven1

				Eight1
					goingto=/turf/warps/one/EntranceExit/Eight2
				Eight2
					goingto=/turf/warps/one/EntranceExit/Eight1

				Nine1
					goingto=/turf/warps/one/EntranceExit/Nine2
				Nine2
					goingto=/turf/warps/one/EntranceExit/Nine1



	warps
		Uchiha
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
			EntranceExit
				mark1
					goingto=/turf/warps/Uchiha/EntranceExit/mark2
				mark2
					goingto=/turf/warps/Uchiha/EntranceExit/mark1

				hos1
					goingto=/turf/warps/Uchiha/EntranceExit/hos2
				hos2
					goingto=/turf/warps/Uchiha/EntranceExit/hos1
turf
	KAGUYAHOMESCID
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
		EntranceExit
			EntranceL
				goingto=/turf/KAGUYAHOMESCID/EntranceExit/ExitL
			EntranceR
				goingto=/turf/KAGUYAHOMESCID/EntranceExit/ExitR

			ExitL
				goingto=/turf/KAGUYAHOMESCID/EntranceExit/EntranceL
			ExitR
				goingto=/turf/KAGUYAHOMESCID/EntranceExit/EntranceR
		PrisonEntranceExit
			PrisonEntranceL
				goingto=/turf/KAGUYAHOMESCID/PrisonEntranceExit/PrisonExitL
			PrisonEntranceR
				goingto=/turf/KAGUYAHOMESCID/PrisonEntranceExit/PrisonExitR

			PrisonExitL
				goingto=/turf/KAGUYAHOMESCID/PrisonEntranceExit/PrisonEntranceL
			PrisonExitR
				goingto=/turf/KAGUYAHOMESCID/PrisonEntranceExit/PrisonEntranceR
	HYUUGAHOMESCID
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
		EntranceExit
			EntranceL
				goingto=/turf/HYUUGAHOMESCID/EntranceExit/ExitL
			EntranceR
				goingto=/turf/HYUUGAHOMESCID/EntranceExit/ExitR

			ExitL
				goingto=/turf/HYUUGAHOMESCID/EntranceExit/EntranceL
			ExitR
				goingto=/turf/HYUUGAHOMESCID/EntranceExit/EntranceR
		DownstairsHomes1
			EntranceL
				goingto=/turf/HYUUGAHOMESCID/DownstairsHomes1/ExitL
			EntranceR
				goingto=/turf/HYUUGAHOMESCID/DownstairsHomes1/ExitR

			ExitL
				goingto=/turf/HYUUGAHOMESCID/DownstairsHomes1/EntranceL
			ExitR
				goingto=/turf/HYUUGAHOMESCID/DownstairsHomes1/EntranceR
		DownstairsHomes2
			EntranceL
				goingto=/turf/HYUUGAHOMESCID/DownstairsHomes2/ExitL
			EntranceR
				goingto=/turf/HYUUGAHOMESCID/DownstairsHomes2/ExitR

			ExitL
				goingto=/turf/HYUUGAHOMESCID/DownstairsHomes2/EntranceL
			ExitR
				goingto=/turf/HYUUGAHOMESCID/DownstairsHomes2/EntranceR
		PrisonEntranceExit
			PrisonEntranceL
				goingto=/turf/HYUUGAHOMESCID/PrisonEntranceExit/PrisonExitL
			PrisonEntranceR
				goingto=/turf/HYUUGAHOMESCID/PrisonEntranceExit/PrisonExitR

			PrisonExitL
				goingto=/turf/HYUUGAHOMESCID/PrisonEntranceExit/PrisonEntranceL
			PrisonExitR
				goingto=/turf/HYUUGAHOMESCID/PrisonEntranceExit/PrisonEntranceR
	LEFTHYUUGADOJOCID
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
		EntranceExit
			EntranceL
				goingto=/turf/LEFTHYUUGADOJOCID/EntranceExit/ExitL
			EntranceR
				goingto=/turf/LEFTHYUUGADOJOCID/EntranceExit/ExitR

			ExitL
				goingto=/turf/LEFTHYUUGADOJOCID/EntranceExit/EntranceL
			ExitR
				goingto=/turf/LEFTHYUUGADOJOCID/EntranceExit/EntranceR
		UpstairsHome
			EntranceL
				goingto=/turf/LEFTHYUUGADOJOCID/UpstairsHome/ExitL
			EntranceR
				goingto=/turf/LEFTHYUUGADOJOCID/UpstairsHome/ExitR

			ExitL
				goingto=/turf/LEFTHYUUGADOJOCID/UpstairsHome/EntranceL
			ExitR
				goingto=/turf/LEFTHYUUGADOJOCID/UpstairsHome/EntranceR
		DownstairsDojo
			EntranceL
				goingto=/turf/LEFTHYUUGADOJOCID/DownstairsDojo/ExitL
			EntranceR
				goingto=/turf/LEFTHYUUGADOJOCID/DownstairsDojo/ExitR

			ExitL
				goingto=/turf/LEFTHYUUGADOJOCID/DownstairsDojo/EntranceL
			ExitR
				goingto=/turf/LEFTHYUUGADOJOCID/DownstairsDojo/EntranceR
	NARAHOMESCID
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
		EntranceExit
			EntranceL
				goingto=/turf/NARAHOMESCID/EntranceExit/ExitL
			EntranceR
				goingto=/turf/NARAHOMESCID/EntranceExit/ExitR

			ExitL
				goingto=/turf/NARAHOMESCID/EntranceExit/EntranceL
			ExitR
				goingto=/turf/NARAHOMESCID/EntranceExit/EntranceR
	ABURAMEHOMESCID
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
		EntranceExit
			EntranceL
				goingto=/turf/ABURAMEHOMESCID/EntranceExit/ExitL
			EntranceR
				goingto=/turf/ABURAMEHOMESCID/EntranceExit/ExitR

			ExitL
				goingto=/turf/ABURAMEHOMESCID/EntranceExit/EntranceL
			ExitR
				goingto=/turf/ABURAMEHOMESCID/EntranceExit/EntranceR
	INUZUKAHOMESCID
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
		EntranceExit
			EntranceL
				goingto=/turf/INUZUKAHOMESCID/EntranceExit/ExitL
			EntranceR
				goingto=/turf/INUZUKAHOMESCID/EntranceExit/ExitR

			ExitL
				goingto=/turf/INUZUKAHOMESCID/EntranceExit/EntranceL
			ExitR
				goingto=/turf/INUZUKAHOMESCID/EntranceExit/EntranceR
	AKIMICHIHOMESCID
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
		EntranceExit
			EntranceL
				goingto=/turf/AKIMICHIHOMESCID/EntranceExit/ExitL
			EntranceR
				goingto=/turf/AKIMICHIHOMESCID/EntranceExit/ExitR

			ExitL
				goingto=/turf/AKIMICHIHOMESCID/EntranceExit/EntranceL
			ExitR
				goingto=/turf/AKIMICHIHOMESCID/EntranceExit/EntranceR




	HozukiYukiMines
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
		One
			EntranceL
				goingto=/turf/HozukiYukiMines/One/ExitL
			EntranceM
				goingto=/turf/HozukiYukiMines/One/ExitM
			EntranceR
				goingto=/turf/HozukiYukiMines/One/ExitR

			ExitL
				goingto=/turf/HozukiYukiMines/One/EntranceL
			ExitM
				goingto=/turf/HozukiYukiMines/One/EntranceM
			ExitR
				goingto=/turf/HozukiYukiMines/One/EntranceR
		Two
			EntranceL
				goingto=/turf/HozukiYukiMines/Two/ExitL
			EntranceLM
				goingto=/turf/HozukiYukiMines/Two/ExitLM
			EntranceR
				goingto=/turf/HozukiYukiMines/Two/ExitR
			EntranceRM
				goingto=/turf/HozukiYukiMines/Two/ExitRM

			ExitL
				goingto=/turf/HozukiYukiMines/Two/EntranceL
			ExitLM
				goingto=/turf/HozukiYukiMines/Two/EntranceLM
			ExitR
				goingto=/turf/HozukiYukiMines/Two/EntranceR
			ExitRM
				goingto=/turf/HozukiYukiMines/Two/EntranceRM
	HOZUKIHOMESCID
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
		EntranceExit
			EntranceL
				goingto=/turf/HOZUKIHOMESCID/EntranceExit/ExitL
			EntranceR
				goingto=/turf/HOZUKIHOMESCID/EntranceExit/ExitR

			ExitL
				goingto=/turf/HOZUKIHOMESCID/EntranceExit/EntranceL
			ExitR
				goingto=/turf/HOZUKIHOMESCID/EntranceExit/EntranceR
	YUKIHOMESCID
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
		EntranceExit
			EntranceL
				goingto=/turf/YUKIHOMESCID/EntranceExit/ExitL
			EntranceR
				goingto=/turf/YUKIHOMESCID/EntranceExit/ExitR

			ExitL
				goingto=/turf/YUKIHOMESCID/EntranceExit/EntranceL
			ExitR
				goingto=/turf/YUKIHOMESCID/EntranceExit/EntranceR

	YUKIHOMESCID1
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
		EntranceExit
			EntranceL
				goingto=/turf/YUKIHOMESCID1/EntranceExit/ExitL
			EntranceR
				goingto=/turf/YUKIHOMESCID1/EntranceExit/ExitR

			ExitL
				goingto=/turf/YUKIHOMESCID1/EntranceExit/EntranceL
			ExitR
				goingto=/turf/YUKIHOMESCID1/EntranceExit/EntranceR



	SENJUHOMESCID
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
		EntranceExit
			EntranceL
				goingto=/turf/SENJUHOMESCID/EntranceExit/ExitL
			EntranceR
				goingto=/turf/SENJUHOMESCID/EntranceExit/ExitR

			ExitL
				goingto=/turf/SENJUHOMESCID/EntranceExit/EntranceL
			ExitR
				goingto=/turf/SENJUHOMESCID/EntranceExit/EntranceR



	SmallCave
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
		EntranceExit
			EntranceL
				goingto=/turf/SmallCave/EntranceExit/ExitL
			EntranceLM
				goingto=/turf/SmallCave/EntranceExit/ExitLM
			EntranceR
				goingto=/turf/SmallCave/EntranceExit/ExitR
			EntranceRM
				goingto=/turf/SmallCave/EntranceExit/ExitRM

			ExitL
				goingto=/turf/SmallCave/EntranceExit/EntranceL
			ExitLM
				goingto=/turf/SmallCave/EntranceExit/EntranceLM
			ExitR
				goingto=/turf/SmallCave/EntranceExit/EntranceR
			ExitRM
				goingto=/turf/SmallCave/EntranceExit/EntranceRM
	SmallSnowCave
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
		EntranceExit
			EntranceL
				goingto=/turf/SmallSnowCave/EntranceExit/ExitL
			EntranceLM
				goingto=/turf/SmallSnowCave/EntranceExit/ExitLM
			EntranceR
				goingto=/turf/SmallSnowCave/EntranceExit/ExitR
			EntranceRM
				goingto=/turf/SmallSnowCave/EntranceExit/ExitRM

			ExitL
				goingto=/turf/SmallSnowCave/EntranceExit/EntranceL
			ExitLM
				goingto=/turf/SmallSnowCave/EntranceExit/EntranceLM
			ExitR
				goingto=/turf/SmallSnowCave/EntranceExit/EntranceR
			ExitRM
				goingto=/turf/SmallSnowCave/EntranceExit/EntranceRM
	LeftCenterMines
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
		Two
			EntranceL
				goingto=/turf/LeftCenterMines/Two/ExitL
			EntranceLM
				goingto=/turf/LeftCenterMines/Two/ExitLM
			EntranceR
				goingto=/turf/LeftCenterMines/Two/ExitR
			EntranceRM
				goingto=/turf/LeftCenterMines/Two/ExitRM

			ExitL
				goingto=/turf/LeftCenterMines/Two/EntranceL
			ExitLM
				goingto=/turf/LeftCenterMines/Two/EntranceLM
			ExitR
				goingto=/turf/LeftCenterMines/Two/EntranceR
			ExitRM
				goingto=/turf/LeftCenterMines/Two/EntranceRM
			ExitL
				goingto=/turf/LeftCenterMines/Two/EntranceL
			ExitR
				goingto=/turf/LeftCenterMines/Two/EntranceR
	Konoha4WaterFall
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
		EntranceExit
			EntranceL
				goingto=/turf/Konoha4WaterFall/EntranceExit/ExitL
			EntranceM
				goingto=/turf/Konoha4WaterFall/EntranceExit/ExitM
			EntranceR
				goingto=/turf/Konoha4WaterFall/EntranceExit/ExitR

			ExitL
				goingto=/turf/Konoha4WaterFall/EntranceExit/EntranceL
			ExitM
				goingto=/turf/Konoha4WaterFall/EntranceExit/EntranceM
			ExitR
				goingto=/turf/Konoha4WaterFall/EntranceExit/EntranceR
	HyuugaOutsideHome
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
		EntranceExit
			EntranceL
				goingto=/turf/HyuugaOutsideHome/EntranceExit/ExitL
			EntranceR
				goingto=/turf/HyuugaOutsideHome/EntranceExit/ExitR

			ExitL
				goingto=/turf/HyuugaOutsideHome/EntranceExit/EntranceL
			ExitR
				goingto=/turf/HyuugaOutsideHome/EntranceExit/EntranceR
		UpstairsDownstairs
			EntranceL
				goingto=/turf/HyuugaOutsideHome/UpstairsDownstairs/ExitL
			EntranceM
				goingto=/turf/HyuugaOutsideHome/UpstairsDownstairs/ExitM
			EntranceR
				goingto=/turf/HyuugaOutsideHome/UpstairsDownstairs/ExitR

			ExitL
				goingto=/turf/HyuugaOutsideHome/UpstairsDownstairs/EntranceL
			ExitM
				goingto=/turf/HyuugaOutsideHome/UpstairsDownstairs/EntranceM
			ExitR
				goingto=/turf/HyuugaOutsideHome/UpstairsDownstairs/EntranceR
	FillerHomes
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
		One
			EntranceExit
				EntranceL
					goingto=/turf/FillerHomes/One/EntranceExit/ExitL
				EntranceR
					goingto=/turf/FillerHomes/One/EntranceExit/ExitR

				ExitL
					goingto=/turf/FillerHomes/One/EntranceExit/EntranceL
				ExitR
					goingto=/turf/FillerHomes/One/EntranceExit/EntranceR
		Two
			EntranceExit
				EntranceL
					goingto=/turf/FillerHomes/Two/EntranceExit/ExitL
				EntranceR
					goingto=/turf/FillerHomes/Two/EntranceExit/ExitR

				ExitL
					goingto=/turf/FillerHomes/Two/EntranceExit/EntranceL
				ExitR
					goingto=/turf/FillerHomes/Two/EntranceExit/EntranceR
		Three
			EntranceExit
				EntranceL
					goingto=/turf/FillerHomes/Three/EntranceExit/ExitL
				EntranceR
					goingto=/turf/FillerHomes/Three/EntranceExit/ExitR

				ExitL
					goingto=/turf/FillerHomes/Three/EntranceExit/EntranceL
				ExitR
					goingto=/turf/FillerHomes/Three/EntranceExit/EntranceR
		Four
			EntranceExit
				EntranceL
					goingto=/turf/FillerHomes/Four/EntranceExit/ExitL
				EntranceR
					goingto=/turf/FillerHomes/Four/EntranceExit/ExitR

				ExitL
					goingto=/turf/FillerHomes/Four/EntranceExit/EntranceL
				ExitR
					goingto=/turf/FillerHomes/Four/EntranceExit/EntranceR
		Five
			EntranceExit
				EntranceL
					goingto=/turf/FillerHomes/Five/EntranceExit/ExitL
				EntranceR
					goingto=/turf/FillerHomes/Five/EntranceExit/ExitR

				ExitL
					goingto=/turf/FillerHomes/Five/EntranceExit/EntranceL
				ExitR
					goingto=/turf/FillerHomes/Five/EntranceExit/EntranceR
		Six
			EntranceExit
				EntranceL
					goingto=/turf/FillerHomes/Six/EntranceExit/ExitL
				EntranceR
					goingto=/turf/FillerHomes/Six/EntranceExit/ExitR

				ExitL
					goingto=/turf/FillerHomes/Six/EntranceExit/EntranceL
				ExitR
					goingto=/turf/FillerHomes/Six/EntranceExit/EntranceR
	TownHomes
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
		One
			EntranceExit
				EntranceL
					goingto=/turf/TownHomes/One/EntranceExit/ExitL
				EntranceR
					goingto=/turf/TownHomes/One/EntranceExit/ExitR

				ExitL
					goingto=/turf/TownHomes/One/EntranceExit/EntranceL
				ExitR
					goingto=/turf/TownHomes/One/EntranceExit/EntranceR
		Two
			EntranceExit
				EntranceL
					goingto=/turf/TownHomes/Two/EntranceExit/ExitL
				EntranceR
					goingto=/turf/TownHomes/Two/EntranceExit/ExitR

				ExitL
					goingto=/turf/TownHomes/Two/EntranceExit/EntranceL
				ExitR
					goingto=/turf/TownHomes/Two/EntranceExit/EntranceR
		Three
			EntranceExit
				EntranceL
					goingto=/turf/TownHomes/Three/EntranceExit/ExitL
				EntranceR
					goingto=/turf/TownHomes/Three/EntranceExit/ExitR

				ExitL
					goingto=/turf/TownHomes/Three/EntranceExit/EntranceL
				ExitR
					goingto=/turf/TownHomes/Three/EntranceExit/EntranceR
	BigTownHome
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
		EntranceExit
			EntranceL
				goingto=/turf/BigTownHome/EntranceExit/ExitL
			EntranceR
				goingto=/turf/BigTownHome/EntranceExit/ExitR

			ExitL
				goingto=/turf/BigTownHome/EntranceExit/EntranceL
			ExitR
				goingto=/turf/BigTownHome/EntranceExit/EntranceR
		UpstairsDownstairs
			EntranceL
				goingto=/turf/BigTownHome/UpstairsDownstairs/ExitL
			EntranceR
				goingto=/turf/BigTownHome/UpstairsDownstairs/ExitR

			ExitL
				goingto=/turf/BigTownHome/UpstairsDownstairs/EntranceL
			ExitR
				goingto=/turf/BigTownHome/UpstairsDownstairs/EntranceR
	EXTRADOJOCID
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
		EntranceExit
			EntranceL
				goingto=/turf/EXTRADOJOCID/EntranceExit/ExitL
			EntranceR
				goingto=/turf/EXTRADOJOCID/EntranceExit/ExitR

			ExitL
				goingto=/turf/EXTRADOJOCID/EntranceExit/EntranceL
			ExitR
				goingto=/turf/EXTRADOJOCID/EntranceExit/EntranceR
		DOWNSTAIRSHome
			EntranceL
				goingto=/turf/EXTRADOJOCID/DOWNSTAIRSHome/ExitL
			EntranceR
				goingto=/turf/EXTRADOJOCID/DOWNSTAIRSHome/ExitR

			ExitL
				goingto=/turf/EXTRADOJOCID/DOWNSTAIRSHome/EntranceL
			ExitR
				goingto=/turf/EXTRADOJOCID/DOWNSTAIRSHome/EntranceR
		DownstairsDojo
			EntranceL
				goingto=/turf/EXTRADOJOCID/DownstairsDojo/ExitL
			EntranceR
				goingto=/turf/EXTRADOJOCID/DownstairsDojo/ExitR

			ExitL
				goingto=/turf/EXTRADOJOCID/DownstairsDojo/EntranceL
			ExitR
				goingto=/turf/EXTRADOJOCID/DownstairsDojo/EntranceR
	UchihaHome
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
		EntranceExit
			EntranceL
				goingto=/turf/UchihaHome/EntranceExit/ExitL
			EntranceR
				goingto=/turf/UchihaHome/EntranceExit/ExitR

			ExitL
				goingto=/turf/UchihaHome/EntranceExit/EntranceL
			ExitR
				goingto=/turf/UchihaHome/EntranceExit/EntranceR
		DownstairsPrison
			EntranceL
				goingto=/turf/UchihaHome/DownstairsPrison/ExitL
			EntranceR
				goingto=/turf/UchihaHome/DownstairsPrison/ExitR

			ExitL
				goingto=/turf/UchihaHome/DownstairsPrison/EntranceL
			ExitR
				goingto=/turf/UchihaHome/DownstairsPrison/EntranceR
		UpstairsHome
			EntranceL
				goingto=/turf/UchihaHome/UpstairsHome/ExitL
			EntranceR
				goingto=/turf/UchihaHome/UpstairsHome/ExitR

			ExitL
				goingto=/turf/UchihaHome/UpstairsHome/EntranceL
			ExitR
				goingto=/turf/UchihaHome/UpstairsHome/EntranceR


turf
	warps
		EventMaps
			UchihaTemple
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/EventMaps/UchihaTemple/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/EventMaps/UchihaTemple/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/EventMaps/UchihaTemple/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/EventMaps/UchihaTemple/EntranceExit/EntranceR

			RuinedTemple
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/EventMaps/RuinedTemple/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/EventMaps/RuinedTemple/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/EventMaps/RuinedTemple/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/EventMaps/RuinedTemple/EntranceExit/EntranceR


		tanjail
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
			EntranceExit
				One1
					goingto=/turf/warps/tanjail/EntranceExit/One2
				One2
					goingto=/turf/warps/tanjail/EntranceExit/One1

		tandojo1
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
			EntranceExit
				One1
					goingto=/turf/warps/tandojo1/EntranceExit/One2
				One2
					goingto=/turf/warps/tandojo1/EntranceExit/One1

				One1a
					goingto=/turf/warps/tandojo1/EntranceExit/One2a
				One2a
					goingto=/turf/warps/tandojo1/EntranceExit/One1a

				One1b
					goingto=/turf/warps/tandojo1/EntranceExit/One2b
				One2b
					goingto=/turf/warps/tandojo1/EntranceExit/One1b

		Kusagakure
			IvanHouse
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Kusagakure/IvanHouse/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Kusagakure/IvanHouse/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Kusagakure/IvanHouse/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Kusagakure/IvanHouse/EntranceExit/EntranceR
			KusagakureClanHouse
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Kusagakure/KusagakureClanHouse/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Kusagakure/KusagakureClanHouse/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Kusagakure/KusagakureClanHouse/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Kusagakure/KusagakureClanHouse/EntranceExit/EntranceR
			KusagakureTeaHouse
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Kusagakure/KusagakureTeaHouse/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Kusagakure/KusagakureTeaHouse/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Kusagakure/KusagakureTeaHouse/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Kusagakure/KusagakureTeaHouse/EntranceExit/EntranceR
			KusagakureCasino
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Kusagakure/KusagakureCasino/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Kusagakure/KusagakureCasino/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Kusagakure/KusagakureCasino/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Kusagakure/KusagakureCasino/EntranceExit/EntranceR
			KusagakureDojo
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Kusagakure/KusagakureDojo/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Kusagakure/KusagakureDojo/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Kusagakure/KusagakureDojo/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Kusagakure/KusagakureDojo/EntranceExit/EntranceR
			KusagakureHospital
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Kusagakure/KusagakureHospital/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Kusagakure/KusagakureHospital/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Kusagakure/KusagakureHospital/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Kusagakure/KusagakureHospital/EntranceExit/EntranceR
			KusagakureBarber
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Kusagakure/KusagakureBarber/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Kusagakure/KusagakureBarber/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Kusagakure/KusagakureBarber/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Kusagakure/KusagakureBarber/EntranceExit/EntranceR



		IwagakureMap
			GrizzHouse
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/IwagakureMap/GrizzHouse/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/IwagakureMap/GrizzHouse/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/IwagakureMap/GrizzHouse/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/IwagakureMap/GrizzHouse/EntranceExit/EntranceR
			DotonDojo
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/IwagakureMap/DotonDojo/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/IwagakureMap/DotonDojo/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/IwagakureMap/DotonDojo/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/IwagakureMap/DotonDojo/EntranceExit/EntranceR
			TakehayaDojo
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/IwagakureMap/TakehayaDojo/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/IwagakureMap/TakehayaDojo/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/IwagakureMap/TakehayaDojo/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/IwagakureMap/TakehayaDojo/EntranceExit/EntranceR

			IwaHospital
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/IwagakureMap/IwaHospital/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/IwagakureMap/IwaHospital/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/IwagakureMap/IwaHospital/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/IwagakureMap/IwaHospital/EntranceExit/EntranceR
			IwaHouse1
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/IwagakureMap/IwaHouse1/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/IwagakureMap/IwaHouse1/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/IwagakureMap/IwaHouse1/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/IwagakureMap/IwaHouse1/EntranceExit/EntranceR
			IwaTakehayaCompound
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/IwagakureMap/IwaTakehayaCompound/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/IwagakureMap/IwaTakehayaCompound/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/IwagakureMap/IwaTakehayaCompound/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/IwagakureMap/IwaTakehayaCompound/EntranceExit/EntranceR
			IwaYomeiCompound
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/IwagakureMap/IwaYomeiCompound/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/IwagakureMap/IwaYomeiCompound/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/IwagakureMap/IwaYomeiCompound/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/IwagakureMap/IwaYomeiCompound/EntranceExit/EntranceR
			IwaTeaHouse
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/IwagakureMap/IwaTeaHouse/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/IwagakureMap/IwaTeaHouse/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/IwagakureMap/IwaTeaHouse/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/IwagakureMap/IwaTeaHouse/EntranceExit/EntranceR
			IwaBarber
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/IwagakureMap/IwaBarber/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/IwagakureMap/IwaBarber/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/IwagakureMap/IwaBarber/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/IwagakureMap/IwaBarber/EntranceExit/EntranceR
			IwaPrison
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/IwagakureMap/IwaPrison/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/IwagakureMap/IwaPrison/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/IwagakureMap/IwaPrison/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/IwagakureMap/IwaPrison/EntranceExit/EntranceR
			IwaForge
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/IwagakureMap/IwaForge/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/IwagakureMap/IwaForge/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/IwagakureMap/IwaForge/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/IwagakureMap/IwaForge/EntranceExit/EntranceR

		SunagakureMap
			SunaMain
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/SunagakureMap/SunaMain/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/SunagakureMap/SunaMain/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/SunagakureMap/SunaMain/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/SunagakureMap/SunaMain/EntranceExit/EntranceR
			SunaTaiDojo
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/SunagakureMap/SunaTaiDojo/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/SunagakureMap/SunaTaiDojo/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/SunagakureMap/SunaTaiDojo/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/SunagakureMap/SunaTaiDojo/EntranceExit/EntranceR
			SunaKenDojo
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/SunagakureMap/SunaKenDojo/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/SunagakureMap/SunaKenDojo/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/SunagakureMap/SunaKenDojo/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/SunagakureMap/SunaKenDojo/EntranceExit/EntranceR
			SunaTeaHouse
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/SunagakureMap/SunaTeaHouse/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/SunagakureMap/SunaTeaHouse/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/SunagakureMap/SunaTeaHouse/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/SunagakureMap/SunaTeaHouse/EntranceExit/EntranceR
			SunaBarber
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/SunagakureMap/SunaBarber/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/SunagakureMap/SunaBarber/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/SunagakureMap/SunaBarber/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/SunagakureMap/SunaBarber/EntranceExit/EntranceR
			SunaBrothel
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/SunagakureMap/SunaBrothel/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/SunagakureMap/SunaBrothel/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/SunagakureMap/SunaBrothel/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/SunagakureMap/SunaBrothel/EntranceExit/EntranceR
			SunaCasino
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/SunagakureMap/SunaCasino/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/SunagakureMap/SunaCasino/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/SunagakureMap/SunaCasino/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/SunagakureMap/SunaCasino/EntranceExit/EntranceR
			SunaCaveLL
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/SunagakureMap/SunaCaveLL/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/SunagakureMap/SunaCaveLL/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/SunagakureMap/SunaCaveLL/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/SunagakureMap/SunaCaveLL/EntranceExit/EntranceR
			SunaCaveLM
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/SunagakureMap/SunaCaveLM/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/SunagakureMap/SunaCaveLM/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/SunagakureMap/SunaCaveLM/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/SunagakureMap/SunaCaveLM/EntranceExit/EntranceR
			SunaCaveM
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/SunagakureMap/SunaCaveM/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/SunagakureMap/SunaCaveM/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/SunagakureMap/SunaCaveM/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/SunagakureMap/SunaCaveM/EntranceExit/EntranceR
			SunaCaveRM
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/SunagakureMap/SunaCaveRM/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/SunagakureMap/SunaCaveRM/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/SunagakureMap/SunaCaveRM/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/SunagakureMap/SunaCaveRM/EntranceExit/EntranceR
			SunaCaveRR
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/SunagakureMap/SunaCaveRR/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/SunagakureMap/SunaCaveRR/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/SunagakureMap/SunaCaveRR/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/SunagakureMap/SunaCaveRR/EntranceExit/EntranceR
			SunaYukiHouse
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/SunagakureMap/SunaYukiHouse/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/SunagakureMap/SunaYukiHouse/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/SunagakureMap/SunaYukiHouse/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/SunagakureMap/SunaYukiHouse/EntranceExit/EntranceR
			SunaHospital
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/SunagakureMap/SunaHospital/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/SunagakureMap/SunaHospital/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/SunagakureMap/SunaHospital/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/SunagakureMap/SunaHospital/EntranceExit/EntranceR
			SunaForge
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/SunagakureMap/SunaForge/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/SunagakureMap/SunaForge/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/SunagakureMap/SunaForge/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/SunagakureMap/SunaForge/EntranceExit/EntranceR

		Kirigakure
			KiriYukiHouse
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Kirigakure/KiriYukiHouse/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Kirigakure/KiriYukiHouse/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Kirigakure/KiriYukiHouse/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Kirigakure/KiriYukiHouse/EntranceExit/EntranceR
			KiriTeaHouse
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Kirigakure/KiriYukiHouse/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Kirigakure/KiriYukiHouse/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Kirigakure/KiriYukiHouse/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Kirigakure/KiriYukiHouse/EntranceExit/EntranceR
			KiriJail
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Kirigakure/KiriJail/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Kirigakure/KiriJail/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Kirigakure/KiriJail/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Kirigakure/KiriJail/EntranceExit/EntranceR
			KiriHospital
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Kirigakure/KiriHospital/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Kirigakure/KiriHospital/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Kirigakure/KiriHospital/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Kirigakure/KiriHospital/EntranceExit/EntranceR
			KiriHouse_1
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Kirigakure/KiriHouse_1/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Kirigakure/KiriHouse_1/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Kirigakure/KiriHouse_1/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Kirigakure/KiriHouse_1/EntranceExit/EntranceR
			KiriHouse_2
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Kirigakure/KiriHouse_2/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Kirigakure/KiriHouse_2/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Kirigakure/KiriHouse_2/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Kirigakure/KiriHouse_2/EntranceExit/EntranceR
			KiriGoroEntrance
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Kirigakure/KiriGoroEntrance/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Kirigakure/KiriGoroEntrance/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Kirigakure/KiriGoroEntrance/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Kirigakure/KiriGoroEntrance/EntranceExit/EntranceR
			KiriGoro2ndFloor
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Kirigakure/KiriGoro2ndFloor/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Kirigakure/KiriGoro2ndFloor/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Kirigakure/KiriGoro2ndFloor/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Kirigakure/KiriGoro2ndFloor/EntranceExit/EntranceR
			KiriGoroBasement
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Kirigakure/KiriGoroBasement/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Kirigakure/KiriGoroBasement/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Kirigakure/KiriGoroBasement/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Kirigakure/KiriGoroBasement/EntranceExit/EntranceR
			KiriForge
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Kirigakure/KiriForge/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Kirigakure/KiriForge/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Kirigakure/KiriForge/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Kirigakure/KiriForge/EntranceExit/EntranceR
			KiriForge2ndFloor
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Kirigakure/KiriForge2ndFloor/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Kirigakure/KiriForge2ndFloor/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Kirigakure/KiriForge2ndFloor/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Kirigakure/KiriForge2ndFloor/EntranceExit/EntranceR
			KiriInuzukaHouse
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Kirigakure/KiriInuzukaHouse/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Kirigakure/KiriInuzukaHouse/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Kirigakure/KiriInuzukaHouse/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Kirigakure/KiriInuzukaHouse/EntranceExit/EntranceR
			KiriShops
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Kirigakure/KiriShops/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Kirigakure/KiriShops/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Kirigakure/KiriShops/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Kirigakure/KiriShops/EntranceExit/EntranceR
			KiriDojo1
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Kirigakure/KiriDojo1/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Kirigakure/KiriDojo1/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Kirigakure/KiriDojo1/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Kirigakure/KiriDojo1/EntranceExit/EntranceR
			KiriSecretBase
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Kirigakure/KiriSecretBase/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Kirigakure/KiriSecretBase/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Kirigakure/KiriSecretBase/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Kirigakure/KiriSecretBase/EntranceExit/EntranceR
				SecretExit
					Entrance
						goingto=/turf/warps/Kirigakure/KiriSecretBase/SecretExit/Exit
					Exit
						goingto=/turf/warps/Kirigakure/KiriSecretBase/SecretExit/Entrance

		Tanzaku
			TanzakuJail
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Tanzaku/TanzakuJail/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Tanzaku/TanzakuJail/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Tanzaku/TanzakuJail/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Tanzaku/TanzakuJail/EntranceExit/EntranceR
			TanzakuHospital_Entrance
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Tanzaku/TanzakuHospital_Entrance/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Tanzaku/TanzakuHospital_Entrance/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Tanzaku/TanzakuHospital_Entrance/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Tanzaku/TanzakuHospital_Entrance/EntranceExit/EntranceR
			TanzakuHospital_2ndFloor
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Tanzaku/TanzakuHospital_2ndFloor/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Tanzaku/TanzakuHospital_2ndFloor/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Tanzaku/TanzakuHospital_2ndFloor/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Tanzaku/TanzakuHospital_2ndFloor/EntranceExit/EntranceR
			TanzakuHospital_3rdFloor
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Tanzaku/TanzakuHospital_3rdFloor/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Tanzaku/TanzakuHospital_3rdFloor/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Tanzaku/TanzakuHospital_3rdFloor/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Tanzaku/TanzakuHospital_3rdFloor/EntranceExit/EntranceR
			TanzakuBarber
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Tanzaku/TanzakuBarber/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Tanzaku/TanzakuBarber/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Tanzaku/TanzakuBarber/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Tanzaku/TanzakuBarber/EntranceExit/EntranceR
			TanzakuClothes
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Tanzaku/TanzakuClothes/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Tanzaku/TanzakuClothes/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Tanzaku/TanzakuClothes/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Tanzaku/TanzakuClothes/EntranceExit/EntranceR
			TanzakuHouse_1
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Tanzaku/TanzakuHouse_1/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Tanzaku/TanzakuHouse_1/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Tanzaku/TanzakuHouse_1/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Tanzaku/TanzakuHouse_1/EntranceExit/EntranceR
			TanzakuHouse_2
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Tanzaku/TanzakuHouse_2/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Tanzaku/TanzakuHouse_2/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Tanzaku/TanzakuHouse_2/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Tanzaku/TanzakuHouse_2/EntranceExit/EntranceR
			TanzakuHouse_3
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Tanzaku/TanzakuHouse_3/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Tanzaku/TanzakuHouse_3/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Tanzaku/TanzakuHouse_3/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Tanzaku/TanzakuHouse_3/EntranceExit/EntranceR
			TanzakuApartment
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Tanzaku/TanzakuApartment/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Tanzaku/TanzakuApartment/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Tanzaku/TanzakuApartment/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Tanzaku/TanzakuApartment/EntranceExit/EntranceR
			TanzakuSamuraiHouse
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Tanzaku/TanzakuSamuraiHouse/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Tanzaku/TanzakuSamuraiHouse/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Tanzaku/TanzakuSamuraiHouse/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Tanzaku/TanzakuSamuraiHouse/EntranceExit/EntranceR
			TanzakuForge
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Tanzaku/TanzakuForge/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Tanzaku/TanzakuForge/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Tanzaku/TanzakuForge/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Tanzaku/TanzakuForge/EntranceExit/EntranceR
			TanzakuForge_2
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Tanzaku/TanzakuForge_2/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Tanzaku/TanzakuForge_2/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Tanzaku/TanzakuForge_2/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Tanzaku/TanzakuForge_2/EntranceExit/EntranceR
			TanzakuDojo
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Tanzaku/TanzakuDojo/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Tanzaku/TanzakuDojo/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Tanzaku/TanzakuDojo/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Tanzaku/TanzakuDojo/EntranceExit/EntranceR


		Senju
			SenjuAcademy
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Senju/SenjuAcademy/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Senju/SenjuAcademy/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Senju/SenjuAcademy/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Senju/SenjuAcademy/EntranceExit/EntranceR
			SenjuOutpost_Kono4
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Senju/SenjuOutpost_Kono4/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Senju/SenjuOutpost_Kono4/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Senju/SenjuOutpost_Kono4/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Senju/SenjuOutpost_Kono4/EntranceExit/EntranceR
			SenjuHospital
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Senju/SenjuHospital/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Senju/SenjuHospital/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Senju/SenjuHospital/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Senju/SenjuHospital/EntranceExit/EntranceR
			SenjuHospital_Floor2
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Senju/SenjuHospital_Floor2/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Senju/SenjuHospital_Floor2/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Senju/SenjuHospital_Floor2/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Senju/SenjuHospital_Floor2/EntranceExit/EntranceR
			SenjuLibrary
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Senju/SenjuLibrary/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Senju/SenjuLibrary/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Senju/SenjuLibrary/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Senju/SenjuLibrary/EntranceExit/EntranceR
			SenjuAitoHome //Fuck you I'm leaving this here.
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Senju/SenjuAitoHome/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Senju/SenjuAitoHome/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Senju/SenjuAitoHome/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Senju/SenjuAitoHome/EntranceExit/EntranceR
			Senju_Uzumaki_Clanhouse
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Senju/Senju_Uzumaki_Clanhouse/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Senju/Senju_Uzumaki_Clanhouse/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Senju/Senju_Uzumaki_Clanhouse/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Senju/Senju_Uzumaki_Clanhouse/EntranceExit/EntranceR



		Kaguya_Map
			KaguyaDojo
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Kaguya_Map/KaguyaDojo/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Kaguya_Map/KaguyaDojo/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Kaguya_Map/KaguyaDojo/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Kaguya_Map/KaguyaDojo/EntranceExit/EntranceR
			KaguyaHouse1
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
				EntranceExit
					EntranceL
						goingto=/turf/warps/Kaguya_Map/KaguyaHouse1/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Kaguya_Map/KaguyaHouse1/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Kaguya_Map/KaguyaHouse1/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Kaguya_Map/KaguyaHouse1/EntranceExit/EntranceR


turf
	SSOInuzukaHomesCid
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
		MainEntranceExit
			EntranceL
				goingto=/turf/SSOInuzukaHomesCid/MainEntranceExit/ExitL
			EntranceR
				goingto=/turf/SSOInuzukaHomesCid/MainEntranceExit/ExitR

			ExitL
				goingto=/turf/SSOInuzukaHomesCid/MainEntranceExit/EntranceL
			ExitR
				goingto=/turf/SSOInuzukaHomesCid/MainEntranceExit/EntranceR
		MainUpstairsDownstairs
			UpL
				goingto=/turf/SSOInuzukaHomesCid/MainUpstairsDownstairs/DownL
			UpR
				goingto=/turf/SSOInuzukaHomesCid/MainUpstairsDownstairs/DownR

			DownL
				goingto=/turf/SSOInuzukaHomesCid/MainUpstairsDownstairs/UpL
			DownR
				goingto=/turf/SSOInuzukaHomesCid/MainUpstairsDownstairs/UpR
		ExtraHome1
			EntranceL
				goingto=/turf/SSOInuzukaHomesCid/ExtraHome1/ExitL
			EntranceR
				goingto=/turf/SSOInuzukaHomesCid/ExtraHome1/ExitR

			ExitL
				goingto=/turf/SSOInuzukaHomesCid/ExtraHome1/EntranceL
			ExitR
				goingto=/turf/SSOInuzukaHomesCid/ExtraHome1/EntranceR
		ExtraHome2
			EntranceL
				goingto=/turf/SSOInuzukaHomesCid/ExtraHome2/ExitL
			EntranceR
				goingto=/turf/SSOInuzukaHomesCid/ExtraHome2/ExitR

			ExitL
				goingto=/turf/SSOInuzukaHomesCid/ExtraHome2/EntranceL
			ExitR
				goingto=/turf/SSOInuzukaHomesCid/ExtraHome2/EntranceR
		ExtraHome3
			EntranceL
				goingto=/turf/SSOInuzukaHomesCid/ExtraHome3/ExitL
			EntranceR
				goingto=/turf/SSOInuzukaHomesCid/ExtraHome3/ExitR

			ExitL
				goingto=/turf/SSOInuzukaHomesCid/ExtraHome3/EntranceL
			ExitR
				goingto=/turf/SSOInuzukaHomesCid/ExtraHome3/EntranceR
		ExtraHome4
			EntranceL
				goingto=/turf/SSOInuzukaHomesCid/ExtraHome4/ExitL
			EntranceR
				goingto=/turf/SSOInuzukaHomesCid/ExtraHome4/ExitR

			ExitL
				goingto=/turf/SSOInuzukaHomesCid/ExtraHome4/EntranceL
			ExitR
				goingto=/turf/SSOInuzukaHomesCid/ExtraHome4/EntranceR
		ExtraHome5
			EntranceL
				goingto=/turf/SSOInuzukaHomesCid/ExtraHome5/ExitL
			EntranceR
				goingto=/turf/SSOInuzukaHomesCid/ExtraHome5/ExitR

			ExitL
				goingto=/turf/SSOInuzukaHomesCid/ExtraHome5/EntranceL
			ExitR
				goingto=/turf/SSOInuzukaHomesCid/ExtraHome5/EntranceR

turf
	OriginWarperNara
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
		House1
			Entrance
				goingto=/turf/OriginWarperNara/House1/Exit

			Exit
				goingto=/turf/OriginWarperNara/House1/Entrance
		House2
			Entrance
				goingto=/turf/OriginWarperNara/House2/Exit

			Exit
				goingto=/turf/OriginWarperNara/House2/Entrance

		House3
			Entrance
				goingto=/turf/OriginWarperNara/House3/Exit

			Exit
				goingto=/turf/OriginWarperNara/House3/Entrance
		House4
			Entrance
				goingto=/turf/OriginWarperNara/House4/Exit

			Exit
				goingto=/turf/OriginWarperNara/House4/Entrance
		House5
			Entrance
				goingto=/turf/OriginWarperNara/House5/Exit

			Exit
				goingto=/turf/OriginWarperNara/House5/Entrance
		ClanHouse
			Entrance
				goingto=/turf/OriginWarperNara/ClanHouse/Exit

			Exit
				goingto=/turf/OriginWarperNara/ClanHouse/Entrance
		Market
			Entrance
				goingto=/turf/OriginWarperNara/Market/Exit

			Exit
				goingto=/turf/OriginWarperNara/Market/Entrance
		Library
			Entrance
				goingto=/turf/OriginWarperNara/Library/Exit

			Exit
				goingto=/turf/OriginWarperNara/Library/Entrance

turf
	OriginWarperHoshigaki
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
		House1
			Entrance
				goingto=/turf/OriginWarperHoshigaki/House1/Exit

			Exit
				goingto=/turf/OriginWarperHoshigaki/House1/Entrance
		House2
			Entrance
				goingto=/turf/OriginWarperHoshigaki/House2/Exit

			Exit
				goingto=/turf/OriginWarperHoshigaki/House2/Entrance

		House3
			Entrance
				goingto=/turf/OriginWarperHoshigaki/House3/Exit

			Exit
				goingto=/turf/OriginWarperHoshigaki/House3/Entrance
		House4
			Entrance
				goingto=/turf/OriginWarperHoshigaki/House4/Exit

			Exit
				goingto=/turf/OriginWarperHoshigaki/House4/Entrance
		House5
			Entrance
				goingto=/turf/OriginWarperHoshigaki/House5/Exit

			Exit
				goingto=/turf/OriginWarperHoshigaki/House5/Entrance
		ClanHouse
			Entrance
				goingto=/turf/OriginWarperHoshigaki/ClanHouse/Exit

			Exit
				goingto=/turf/OriginWarperHoshigaki/ClanHouse/Entrance
		Market
			Entrance
				goingto=/turf/OriginWarperHoshigaki/Market/Exit

			Exit
				goingto=/turf/OriginWarperHoshigaki/Market/Entrance
		Library
			Entrance
				goingto=/turf/OriginWarperHoshigaki/Library/Exit

			Exit
				goingto=/turf/OriginWarperHoshigaki/Library/Entrance

turf
	OriginWarperMines2
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
		Cave1
			Entrance
				goingto=/turf/OriginWarperMines2/Cave1/Exit

			Exit
				goingto=/turf/OriginWarperMines2/Cave1/Entrance
		Cave2
			Entrance
				goingto=/turf/OriginWarperMines2/Cave2/Exit

			Exit
				goingto=/turf/OriginWarperMines2/Cave2/Entrance

		Cave3
			Entrance
				goingto=/turf/OriginWarperMines2/Cave3/Exit

			Exit
				goingto=/turf/OriginWarperMines2/Cave3/Entrance
		Cave4
			Entrance
				goingto=/turf/OriginWarperMines2/Cave4/Exit

			Exit
				goingto=/turf/OriginWarperMines2/Cave4/Entrance

turf
	OriginWarperMines1
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
		Cave1
			Entrance
				goingto=/turf/OriginWarperMines1/Cave1/Exit

			Exit
				goingto=/turf/OriginWarperMines1/Cave1/Entrance
		Cave2
			Entrance
				goingto=/turf/OriginWarperMines1/Cave2/Exit

			Exit
				goingto=/turf/OriginWarperMines1/Cave2/Entrance

		Cave3
			Entrance
				goingto=/turf/OriginWarperMines1/Cave3/Exit

			Exit
				goingto=/turf/OriginWarperMines1/Cave3/Entrance
		Cave4
			Entrance
				goingto=/turf/OriginWarperMines1/Cave4/Exit

			Exit
				goingto=/turf/OriginWarperMines1/Cave4/Entrance

turf
	OriginWarperSouthTemple
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
		House1
			Entrance
				goingto=/turf/OriginWarperSouthTemple/House1/Exit

			Exit
				goingto=/turf/OriginWarperSouthTemple/House1/Entrance
		House2
			Entrance
				goingto=/turf/OriginWarperSouthTemple/House2/Exit

			Exit
				goingto=/turf/OriginWarperSouthTemple/House2/Entrance

		House3
			Entrance
				goingto=/turf/OriginWarperSouthTemple/House3/Exit

			Exit
				goingto=/turf/OriginWarperSouthTemple/House3/Entrance
		House4
			Entrance
				goingto=/turf/OriginWarperSouthTemple/House4/Exit

			Exit
				goingto=/turf/OriginWarperSouthTemple/House4/Entrance
		House5
			Entrance
				goingto=/turf/OriginWarperSouthTemple/House5/Exit

			Exit
				goingto=/turf/OriginWarperSouthTemple/House5/Entrance
		Hotel
			EntranceL
				goingto=/turf/OriginWarperSouthTemple/Hotel/ExitL

			ExitL
				goingto=/turf/OriginWarperSouthTemple/Hotel/EntranceL

			EntranceR
				goingto=/turf/OriginWarperSouthTemple/Hotel/ExitR

			ExitR
				goingto=/turf/OriginWarperSouthTemple/Hotel/EntranceR

		Hotel2
			EntranceL
				goingto=/turf/OriginWarperSouthTemple/Hotel2/ExitL

			ExitL
				goingto=/turf/OriginWarperSouthTemple/Hotel2/EntranceL

			EntranceR
				goingto=/turf/OriginWarperSouthTemple/Hotel2/ExitR

			ExitR
				goingto=/turf/OriginWarperSouthTemple/Hotel2/EntranceR
		House7
			Entrance
				goingto=/turf/OriginWarperSouthTemple/House7/Exit

			Exit
				goingto=/turf/OriginWarperSouthTemple/House7/Entrance

		Temple
			EntranceR
				goingto=/turf/OriginWarperSouthTemple/Temple/ExitR

			ExitR
				goingto=/turf/OriginWarperSouthTemple/Temple/EntranceR

		Market
			Entrance
				goingto=/turf/OriginWarperSouthTemple/Market/Exit

			Exit
				goingto=/turf/OriginWarperSouthTemple/Market/Entrance
		Library
			Entrance
				goingto=/turf/OriginWarperSouthTemple/Library/Exit

			Exit
				goingto=/turf/OriginWarperSouthTemple/Library/Entrance

	OriginWarperHyuuga
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
		House1
			EntranceL
				goingto=/turf/OriginWarperHyuuga/House1/ExitL

			ExitL
				goingto=/turf/OriginWarperHyuuga/House1/EntranceL

			EntranceR
				goingto=/turf/OriginWarperHyuuga/House1/ExitR

			ExitR
				goingto=/turf/OriginWarperHyuuga/House1/EntranceR
		House2
			EntranceL
				goingto=/turf/OriginWarperHyuuga/House2/ExitL

			ExitL
				goingto=/turf/OriginWarperHyuuga/House2/EntranceL

			EntranceR
				goingto=/turf/OriginWarperHyuuga/House2/ExitR

			ExitR
				goingto=/turf/OriginWarperHyuuga/House2/EntranceR
		House3
			EntranceL
				goingto=/turf/OriginWarperHyuuga/House3/ExitL

			ExitL
				goingto=/turf/OriginWarperHyuuga/House3/EntranceL

			EntranceR
				goingto=/turf/OriginWarperHyuuga/House3/ExitR

			ExitR
				goingto=/turf/OriginWarperHyuuga/House3/EntranceR
		House4
			EntranceL
				goingto=/turf/OriginWarperHyuuga/House4/ExitL

			ExitL
				goingto=/turf/OriginWarperHyuuga/House4/EntranceL

			EntranceR
				goingto=/turf/OriginWarperHyuuga/House4/ExitR

			ExitR
				goingto=/turf/OriginWarperHyuuga/House4/EntranceR
		House5
			EntranceL
				goingto=/turf/OriginWarperHyuuga/House5/ExitL

			ExitL
				goingto=/turf/OriginWarperHyuuga/House5/EntranceL

			EntranceR
				goingto=/turf/OriginWarperHyuuga/House5/ExitR

			ExitR
				goingto=/turf/OriginWarperHyuuga/House5/EntranceR
		ClanHouse
			EntranceL
				goingto=/turf/OriginWarperHyuuga/ClanHouse/ExitL

			ExitL
				goingto=/turf/OriginWarperHyuuga/ClanHouse/EntranceL

			EntranceR
				goingto=/turf/OriginWarperHyuuga/ClanHouse/ExitR

			ExitR
				goingto=/turf/OriginWarperHyuuga/ClanHouse/EntranceR
		Market
			EntranceL
				goingto=/turf/OriginWarperHyuuga/Market/ExitL

			ExitL
				goingto=/turf/OriginWarperHyuuga/Market/EntranceL

			EntranceR
				goingto=/turf/OriginWarperHyuuga/Market/ExitR

			ExitR
				goingto=/turf/OriginWarperHyuuga/Market/EntranceR
		Library
			EntranceL
				goingto=/turf/OriginWarperHyuuga/Library/ExitL

			ExitL
				goingto=/turf/OriginWarperHyuuga/Library/EntranceL

			EntranceR
				goingto=/turf/OriginWarperHyuuga/Library/ExitR

			ExitR
				goingto=/turf/OriginWarperHyuuga/Library/EntranceR

	OriginWarperSenju
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
		House1
			EntranceL
				goingto=/turf/OriginWarperSenju/House1/ExitL

			ExitL
				goingto=/turf/OriginWarperSenju/House1/EntranceL

			EntranceR
				goingto=/turf/OriginWarperSenju/House1/ExitR

			ExitR
				goingto=/turf/OriginWarperSenju/House1/EntranceR
		House2
			EntranceL
				goingto=/turf/OriginWarperSenju/House2/ExitL

			ExitL
				goingto=/turf/OriginWarperSenju/House2/EntranceL

			EntranceR
				goingto=/turf/OriginWarperSenju/House2/ExitR

			ExitR
				goingto=/turf/OriginWarperSenju/House2/EntranceR
		House3
			EntranceL
				goingto=/turf/OriginWarperSenju/House3/ExitL

			ExitL
				goingto=/turf/OriginWarperSenju/House3/EntranceL

			EntranceR
				goingto=/turf/OriginWarperSenju/House3/ExitR

			ExitR
				goingto=/turf/OriginWarperSenju/House3/EntranceR
		House4
			EntranceL
				goingto=/turf/OriginWarperSenju/House4/ExitL

			ExitL
				goingto=/turf/OriginWarperSenju/House4/EntranceL

			EntranceR
				goingto=/turf/OriginWarperSenju/House4/ExitR

			ExitR
				goingto=/turf/OriginWarperSenju/House4/EntranceR
		House5
			EntranceL
				goingto=/turf/OriginWarperSenju/House5/ExitL

			ExitL
				goingto=/turf/OriginWarperSenju/House5/EntranceL

			EntranceR
				goingto=/turf/OriginWarperSenju/House5/ExitR

			ExitR
				goingto=/turf/OriginWarperSenju/House5/EntranceR
		ClanHouse
			EntranceL
				goingto=/turf/OriginWarperSenju/ClanHouse/ExitL

			ExitL
				goingto=/turf/OriginWarperSenju/ClanHouse/EntranceL

			EntranceR
				goingto=/turf/OriginWarperSenju/ClanHouse/ExitR

			ExitR
				goingto=/turf/OriginWarperSenju/ClanHouse/EntranceR
		Market
			EntranceL
				goingto=/turf/OriginWarperSenju/Market/ExitL

			ExitL
				goingto=/turf/OriginWarperSenju/Market/EntranceL

			EntranceR
				goingto=/turf/OriginWarperSenju/Market/ExitR

			ExitR
				goingto=/turf/OriginWarperSenju/Market/EntranceR
		Library
			EntranceL
				goingto=/turf/OriginWarperSenju/Library/ExitL

			ExitL
				goingto=/turf/OriginWarperSenju/Library/EntranceL

			EntranceR
				goingto=/turf/OriginWarperSenju/Library/ExitR

			ExitR
				goingto=/turf/OriginWarperSenju/Library/EntranceR

	OriginWarperUzumaki
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
		House1
			EntranceL
				goingto=/turf/OriginWarperUzumaki/House1/ExitL

			ExitL
				goingto=/turf/OriginWarperUzumaki/House1/EntranceL

			EntranceR
				goingto=/turf/OriginWarperUzumaki/House1/ExitR

			ExitR
				goingto=/turf/OriginWarperUzumaki/House1/EntranceR
		House2
			EntranceL
				goingto=/turf/OriginWarperUzumaki/House2/ExitL

			ExitL
				goingto=/turf/OriginWarperUzumaki/House2/EntranceL

			EntranceR
				goingto=/turf/OriginWarperUzumaki/House2/ExitR

			ExitR
				goingto=/turf/OriginWarperUzumaki/House2/EntranceR
		House3
			EntranceL
				goingto=/turf/OriginWarperUzumaki/House3/ExitL

			ExitL
				goingto=/turf/OriginWarperUzumaki/House3/EntranceL

			EntranceR
				goingto=/turf/OriginWarperUzumaki/House3/ExitR

			ExitR
				goingto=/turf/OriginWarperUzumaki/House3/EntranceR
		House4
			EntranceL
				goingto=/turf/OriginWarperUzumaki/House4/ExitL

			ExitL
				goingto=/turf/OriginWarperUzumaki/House4/EntranceL

			EntranceR
				goingto=/turf/OriginWarperUzumaki/House4/ExitR

			ExitR
				goingto=/turf/OriginWarperUzumaki/House4/EntranceR
		House5
			EntranceL
				goingto=/turf/OriginWarperUzumaki/House5/ExitL

			ExitL
				goingto=/turf/OriginWarperUzumaki/House5/EntranceL

			EntranceR
				goingto=/turf/OriginWarperUzumaki/House5/ExitR

			ExitR
				goingto=/turf/OriginWarperUzumaki/House5/EntranceR
		ClanHouse
			EntranceL
				goingto=/turf/OriginWarperUzumaki/ClanHouse/ExitL

			ExitL
				goingto=/turf/OriginWarperUzumaki/ClanHouse/EntranceL

			EntranceR
				goingto=/turf/OriginWarperUzumaki/ClanHouse/ExitR

			ExitR
				goingto=/turf/OriginWarperUzumaki/ClanHouse/EntranceR
		Market
			EntranceL
				goingto=/turf/OriginWarperUzumaki/Market/ExitL

			ExitL
				goingto=/turf/OriginWarperUzumaki/Market/EntranceL

			EntranceR
				goingto=/turf/OriginWarperUzumaki/Market/ExitR

			ExitR
				goingto=/turf/OriginWarperUzumaki/Market/EntranceR
		Library
			EntranceL
				goingto=/turf/OriginWarperUzumaki/Library/ExitL

			ExitL
				goingto=/turf/OriginWarperUzumaki/Library/EntranceL

			EntranceR
				goingto=/turf/OriginWarperUzumaki/Library/ExitR

			ExitR
				goingto=/turf/OriginWarperUzumaki/Library/EntranceR

	OriginWarperUchiha
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
		House1
			EntranceL
				goingto=/turf/OriginWarperUchiha/House1/ExitL

			ExitL
				goingto=/turf/OriginWarperUchiha/House1/EntranceL

			EntranceR
				goingto=/turf/OriginWarperUchiha/House1/ExitR

			ExitR
				goingto=/turf/OriginWarperUchiha/House1/EntranceR
		House2
			EntranceL
				goingto=/turf/OriginWarperUchiha/House2/ExitL

			ExitL
				goingto=/turf/OriginWarperUchiha/House2/EntranceL

			EntranceR
				goingto=/turf/OriginWarperUchiha/House2/ExitR

			ExitR
				goingto=/turf/OriginWarperUchiha/House2/EntranceR
		House3
			EntranceL
				goingto=/turf/OriginWarperUchiha/House3/ExitL

			ExitL
				goingto=/turf/OriginWarperUchiha/House3/EntranceL

			EntranceR
				goingto=/turf/OriginWarperUchiha/House3/ExitR

			ExitR
				goingto=/turf/OriginWarperUchiha/House3/EntranceR
		House4
			EntranceL
				goingto=/turf/OriginWarperUchiha/House4/ExitL

			ExitL
				goingto=/turf/OriginWarperUchiha/House4/EntranceL

			EntranceR
				goingto=/turf/OriginWarperUchiha/House4/ExitR

			ExitR
				goingto=/turf/OriginWarperUchiha/House4/EntranceR
		House5
			EntranceL
				goingto=/turf/OriginWarperUchiha/House5/ExitL

			ExitL
				goingto=/turf/OriginWarperUchiha/House5/EntranceL

			EntranceR
				goingto=/turf/OriginWarperUchiha/House5/ExitR

			ExitR
				goingto=/turf/OriginWarperUchiha/House5/EntranceR
		ClanHouse
			EntranceL
				goingto=/turf/OriginWarperUchiha/ClanHouse/ExitL

			ExitL
				goingto=/turf/OriginWarperUchiha/ClanHouse/EntranceL

			EntranceR
				goingto=/turf/OriginWarperUchiha/ClanHouse/ExitR

			ExitR
				goingto=/turf/OriginWarperUchiha/ClanHouse/EntranceR
		Market
			EntranceL
				goingto=/turf/OriginWarperUchiha/Market/ExitL

			ExitL
				goingto=/turf/OriginWarperUchiha/Market/EntranceL

			EntranceR
				goingto=/turf/OriginWarperUchiha/Market/ExitR

			ExitR
				goingto=/turf/OriginWarperUchiha/Market/EntranceR
		Library
			EntranceL
				goingto=/turf/OriginWarperUchiha/Library/ExitL

			ExitL
				goingto=/turf/OriginWarperUchiha/Library/EntranceL

			EntranceR
				goingto=/turf/OriginWarperUchiha/Library/ExitR

			ExitR
				goingto=/turf/OriginWarperUzumaki/Library/EntranceR

	OriginWarperHozuki
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
		House1
			Entrance
				goingto=/turf/OriginWarperHozuki/House1/Exit

			Exit
				goingto=/turf/OriginWarperHozuki/House1/Entrance
		House2
			Entrance
				goingto=/turf/OriginWarperHozuki/House2/Exit

			Exit
				goingto=/turf/OriginWarperHozuki/House2/Entrance

		House3
			Entrance
				goingto=/turf/OriginWarperHozuki/House3/Exit

			Exit
				goingto=/turf/OriginWarperHozuki/House3/Entrance
		House4
			Entrance
				goingto=/turf/OriginWarperHozuki/House4/Exit

			Exit
				goingto=/turf/OriginWarperHozuki/House4/Entrance
		House5
			Entrance
				goingto=/turf/OriginWarperHozuki/House5/Exit

			Exit
				goingto=/turf/OriginWarperHozuki/House5/Entrance
		ClanHouse
			Entrance
				goingto=/turf/OriginWarperHozuki/ClanHouse/Exit

			Exit
				goingto=/turf/OriginWarperHozuki/ClanHouse/Entrance
		Market
			Entrance
				goingto=/turf/OriginWarperHozuki/Market/Exit

			Exit
				goingto=/turf/OriginWarperHozuki/Market/Entrance
		Library
			Entrance
				goingto=/turf/OriginWarperHozuki/Library/Exit

			Exit
				goingto=/turf/OriginWarperHozuki/Library/Entrance
turf
	SSOYamanakaHomesCid
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
		MainEntranceExit
			EntranceL
				goingto=/turf/SSOYamanakaHomesCid/MainEntranceExit/ExitL
			EntranceR
				goingto=/turf/SSOYamanakaHomesCid/MainEntranceExit/ExitR

			ExitL
				goingto=/turf/SSOYamanakaHomesCid/MainEntranceExit/EntranceL
			ExitR
				goingto=/turf/SSOYamanakaHomesCid/MainEntranceExit/EntranceR
		MainUpstairsDownstairs
			UpL
				goingto=/turf/SSOYamanakaHomesCid/MainUpstairsDownstairs/DownL
			UpR
				goingto=/turf/SSOYamanakaHomesCid/MainUpstairsDownstairs/DownR

			DownL
				goingto=/turf/SSOYamanakaHomesCid/MainUpstairsDownstairs/UpL
			DownR
				goingto=/turf/SSOYamanakaHomesCid/MainUpstairsDownstairs/UpR

turf
	SSOAkimichiHomesCid
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
		MainEntranceExit
			EntranceL
				goingto=/turf/SSOAkimichiHomesCid/MainEntranceExit/ExitL
			EntranceR
				goingto=/turf/SSOAkimichiHomesCid/MainEntranceExit/ExitR

			ExitL
				goingto=/turf/SSOAkimichiHomesCid/MainEntranceExit/EntranceL
			ExitR
				goingto=/turf/SSOAkimichiHomesCid/MainEntranceExit/EntranceR
		MainUpstairsDownstairs
			UpL
				goingto=/turf/SSOAkimichiHomesCid/MainUpstairsDownstairs/DownL
			UpR
				goingto=/turf/SSOAkimichiHomesCid/MainUpstairsDownstairs/DownR

			DownL
				goingto=/turf/SSOAkimichiHomesCid/MainUpstairsDownstairs/UpL
			DownR
				goingto=/turf/SSOAkimichiHomesCid/MainUpstairsDownstairs/UpR

turf
	SSONaraHomesCid
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
		MainEntranceExit
			EntranceL
				goingto=/turf/SSONaraHomesCid/MainEntranceExit/ExitL
			EntranceR
				goingto=/turf/SSONaraHomesCid/MainEntranceExit/ExitR

			ExitL
				goingto=/turf/SSONaraHomesCid/MainEntranceExit/EntranceL
			ExitR
				goingto=/turf/SSONaraHomesCid/MainEntranceExit/EntranceR
		MainUpstairsDownstairs
			UpL
				goingto=/turf/SSONaraHomesCid/MainUpstairsDownstairs/DownL
			UpR
				goingto=/turf/SSONaraHomesCid/MainUpstairsDownstairs/DownR

			DownL
				goingto=/turf/SSONaraHomesCid/MainUpstairsDownstairs/UpL
			DownR
				goingto=/turf/SSONaraHomesCid/MainUpstairsDownstairs/UpR

turf
	SSOInoShikaChoHomesCid
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
		ExtraHome1
			EntranceL
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome1/ExitL
			EntranceR
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome1/ExitR

			ExitL
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome1/EntranceL
			ExitR
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome1/EntranceR
		ExtraHome2
			EntranceL
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome2/ExitL
			EntranceR
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome2/ExitR

			ExitL
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome2/EntranceL
			ExitR
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome2/EntranceR
		ExtraHome3
			EntranceL
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome3/ExitL
			EntranceR
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome3/ExitR

			ExitL
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome3/EntranceL
			ExitR
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome3/EntranceR
		ExtraHome4
			EntranceL
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome4/ExitL
			EntranceR
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome4/ExitR

			ExitL
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome4/EntranceL
			ExitR
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome4/EntranceR
		ExtraHome5
			EntranceL
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome5/ExitL
			EntranceR
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome5/ExitR

			ExitL
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome5/EntranceL
			ExitR
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome5/EntranceR
		ExtraHome6
			EntranceL
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome6/ExitL
			EntranceR
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome6/ExitR

			ExitL
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome6/EntranceL
			ExitR
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome6/EntranceR
		ExtraHome7
			EntranceL
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome7/ExitL
			EntranceR
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome7/ExitR

			ExitL
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome7/EntranceL
			ExitR
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome7/EntranceR
		ExtraHome8
			EntranceL
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome8/ExitL
			EntranceR
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome8/ExitR

			ExitL
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome8/EntranceL
			ExitR
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome8/EntranceR
		ExtraHome9
			EntranceL
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome9/ExitL
			EntranceR
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome9/ExitR

			ExitL
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome9/EntranceL
			ExitR
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome9/EntranceR
		ExtraHome10
			EntranceL
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome10/ExitL
			EntranceR
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome10/ExitR

			ExitL
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome10/EntranceL
			ExitR
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome10/EntranceR
		ExtraHome11
			EntranceL
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome11/ExitL
			EntranceR
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome11/ExitR

			ExitL
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome11/EntranceL
			ExitR
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome11/EntranceR
		ExtraHome12
			EntranceL
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome12/ExitL
			EntranceR
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome12/ExitR

			ExitL
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome12/EntranceL
			ExitR
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome12/EntranceR
		ExtraHome13
			EntranceL
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome13/ExitL
			EntranceR
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome13/ExitR

			ExitL
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome13/EntranceL
			ExitR
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome13/EntranceR
		ExtraHome14
			EntranceL
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome14/ExitL
			EntranceR
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome14/ExitR

			ExitL
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome14/EntranceL
			ExitR
				goingto=/turf/SSOInoShikaChoHomesCid/ExtraHome14/EntranceR

turf
	SSOHyuugaHomesCid
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
		MainEntranceExit
			EntranceL
				goingto=/turf/SSOHyuugaHomesCid/MainEntranceExit/ExitL
			EntranceR
				goingto=/turf/SSOHyuugaHomesCid/MainEntranceExit/ExitR

			ExitL
				goingto=/turf/SSOHyuugaHomesCid/MainEntranceExit/EntranceL
			ExitR
				goingto=/turf/SSOHyuugaHomesCid/MainEntranceExit/EntranceR
		MainUpstairsDownstairs
			UpL
				goingto=/turf/SSOHyuugaHomesCid/MainUpstairsDownstairs/DownL
			UpR
				goingto=/turf/SSOHyuugaHomesCid/MainUpstairsDownstairs/DownR

			DownL
				goingto=/turf/SSOHyuugaHomesCid/MainUpstairsDownstairs/UpL
			DownR
				goingto=/turf/SSOHyuugaHomesCid/MainUpstairsDownstairs/UpR

turf
	SSOUchihaHomesCid
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
		MainEntranceExit
			EntranceL
				goingto=/turf/SSOUchihaHomesCid/MainEntranceExit/ExitL
			EntranceR
				goingto=/turf/SSOUchihaHomesCid/MainEntranceExit/ExitR

			ExitL
				goingto=/turf/SSOUchihaHomesCid/MainEntranceExit/EntranceL
			ExitR
				goingto=/turf/SSOUchihaHomesCid/MainEntranceExit/EntranceR
		MainUpstairsDownstairs
			UpL
				goingto=/turf/SSOUchihaHomesCid/MainUpstairsDownstairs/DownL
			UpR
				goingto=/turf/SSOUchihaHomesCid/MainUpstairsDownstairs/DownR

			DownL
				goingto=/turf/SSOUchihaHomesCid/MainUpstairsDownstairs/UpL
			DownR
				goingto=/turf/SSOUchihaHomesCid/MainUpstairsDownstairs/UpR
		ExtraHome1
			EntranceL
				goingto=/turf/SSOUchihaHomesCid/ExtraHome1/ExitL
			EntranceR
				goingto=/turf/SSOUchihaHomesCid/ExtraHome1/ExitR

			ExitL
				goingto=/turf/SSOUchihaHomesCid/ExtraHome1/EntranceL
			ExitR
				goingto=/turf/SSOUchihaHomesCid/ExtraHome1/EntranceR
		ExtraHome2
			EntranceL
				goingto=/turf/SSOUchihaHomesCid/ExtraHome2/ExitL
			EntranceR
				goingto=/turf/SSOUchihaHomesCid/ExtraHome2/ExitR

			ExitL
				goingto=/turf/SSOUchihaHomesCid/ExtraHome2/EntranceL
			ExitR
				goingto=/turf/SSOUchihaHomesCid/ExtraHome2/EntranceR
		ExtraHome3
			EntranceL
				goingto=/turf/SSOUchihaHomesCid/ExtraHome3/ExitL
			EntranceR
				goingto=/turf/SSOUchihaHomesCid/ExtraHome3/ExitR

			ExitL
				goingto=/turf/SSOUchihaHomesCid/ExtraHome3/EntranceL
			ExitR
				goingto=/turf/SSOUchihaHomesCid/ExtraHome3/EntranceR
		ExtraHome4
			EntranceL
				goingto=/turf/SSOUchihaHomesCid/ExtraHome4/ExitL
			EntranceR
				goingto=/turf/SSOUchihaHomesCid/ExtraHome4/ExitR

			ExitL
				goingto=/turf/SSOUchihaHomesCid/ExtraHome4/EntranceL
			ExitR
				goingto=/turf/SSOUchihaHomesCid/ExtraHome4/EntranceR
		ExtraHome5
			EntranceL
				goingto=/turf/SSOUchihaHomesCid/ExtraHome5/ExitL
			EntranceR
				goingto=/turf/SSOUchihaHomesCid/ExtraHome5/ExitR

			ExitL
				goingto=/turf/SSOUchihaHomesCid/ExtraHome5/EntranceL
			ExitR
				goingto=/turf/SSOUchihaHomesCid/ExtraHome5/EntranceR
		ExtraHome6
			EntranceL
				goingto=/turf/SSOUchihaHomesCid/ExtraHome6/ExitL
			EntranceR
				goingto=/turf/SSOUchihaHomesCid/ExtraHome6/ExitR

			ExitL
				goingto=/turf/SSOUchihaHomesCid/ExtraHome6/EntranceL
			ExitR
				goingto=/turf/SSOUchihaHomesCid/ExtraHome6/EntranceR
turf
	SSOKaguyaHomesCid
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
		MainEntranceExit
			EntranceL
				goingto=/turf/SSOKaguyaHomesCid/MainEntranceExit/ExitL
			EntranceR
				goingto=/turf/SSOKaguyaHomesCid/MainEntranceExit/ExitR

			ExitL
				goingto=/turf/SSOKaguyaHomesCid/MainEntranceExit/EntranceL
			ExitR
				goingto=/turf/SSOKaguyaHomesCid/MainEntranceExit/EntranceR
		MainUpstairsDownstairs
			UpL
				goingto=/turf/SSOKaguyaHomesCid/MainUpstairsDownstairs/DownL
			UpR
				goingto=/turf/SSOKaguyaHomesCid/MainUpstairsDownstairs/DownR

			DownL
				goingto=/turf/SSOKaguyaHomesCid/MainUpstairsDownstairs/UpL
			DownR
				goingto=/turf/SSOKaguyaHomesCid/MainUpstairsDownstairs/UpR
		ExtraHome1
			EntranceL
				goingto=/turf/SSOKaguyaHomesCid/ExtraHome1/ExitL
			EntranceR
				goingto=/turf/SSOKaguyaHomesCid/ExtraHome1/ExitR

			ExitL
				goingto=/turf/SSOKaguyaHomesCid/ExtraHome1/EntranceL
			ExitR
				goingto=/turf/SSOKaguyaHomesCid/ExtraHome1/EntranceR
		ExtraHome2
			EntranceL
				goingto=/turf/SSOKaguyaHomesCid/ExtraHome2/ExitL
			EntranceR
				goingto=/turf/SSOKaguyaHomesCid/ExtraHome2/ExitR

			ExitL
				goingto=/turf/SSOKaguyaHomesCid/ExtraHome2/EntranceL
			ExitR
				goingto=/turf/SSOKaguyaHomesCid/ExtraHome2/EntranceR
		ExtraHome3
			EntranceL
				goingto=/turf/SSOKaguyaHomesCid/ExtraHome3/ExitL
			EntranceR
				goingto=/turf/SSOKaguyaHomesCid/ExtraHome3/ExitR

			ExitL
				goingto=/turf/SSOKaguyaHomesCid/ExtraHome3/EntranceL
			ExitR
				goingto=/turf/SSOKaguyaHomesCid/ExtraHome3/EntranceR
		ExtraHome4
			EntranceL
				goingto=/turf/SSOKaguyaHomesCid/ExtraHome4/ExitL
			EntranceR
				goingto=/turf/SSOKaguyaHomesCid/ExtraHome4/ExitR

			ExitL
				goingto=/turf/SSOKaguyaHomesCid/ExtraHome4/EntranceL
			ExitR
				goingto=/turf/SSOKaguyaHomesCid/ExtraHome4/EntranceR

turf
	SSOaburameHomesCid
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
		MainEntranceExit
			EntranceL
				goingto=/turf/SSOaburameHomesCid/MainEntranceExit/ExitL
			EntranceR
				goingto=/turf/SSOaburameHomesCid/MainEntranceExit/ExitR

			ExitL
				goingto=/turf/SSOaburameHomesCid/MainEntranceExit/EntranceL
			ExitR
				goingto=/turf/SSOaburameHomesCid/MainEntranceExit/EntranceR
		MainUpstairsDownstairs
			UpL
				goingto=/turf/SSOaburameHomesCid/MainUpstairsDownstairs/DownL
			UpR
				goingto=/turf/SSOaburameHomesCid/MainUpstairsDownstairs/DownR

			DownL
				goingto=/turf/SSOaburameHomesCid/MainUpstairsDownstairs/UpL
			DownR
				goingto=/turf/SSOaburameHomesCid/MainUpstairsDownstairs/UpR
		ExtraHome1
			EntranceL
				goingto=/turf/SSOaburameHomesCid/ExtraHome1/ExitL
			EntranceR
				goingto=/turf/SSOaburameHomesCid/ExtraHome1/ExitR

			ExitL
				goingto=/turf/SSOaburameHomesCid/ExtraHome1/EntranceL
			ExitR
				goingto=/turf/SSOaburameHomesCid/ExtraHome1/EntranceR
		ExtraHome2
			EntranceL
				goingto=/turf/SSOaburameHomesCid/ExtraHome2/ExitL
			EntranceR
				goingto=/turf/SSOaburameHomesCid/ExtraHome2/ExitR

			ExitL
				goingto=/turf/SSOaburameHomesCid/ExtraHome2/EntranceL
			ExitR
				goingto=/turf/SSOaburameHomesCid/ExtraHome2/EntranceR
		ExtraHome3
			EntranceL
				goingto=/turf/SSOaburameHomesCid/ExtraHome3/ExitL
			EntranceR
				goingto=/turf/SSOaburameHomesCid/ExtraHome3/ExitR

			ExitL
				goingto=/turf/SSOaburameHomesCid/ExtraHome3/EntranceL
			ExitR
				goingto=/turf/SSOaburameHomesCid/ExtraHome3/EntranceR
		ExtraHome4
			EntranceL
				goingto=/turf/SSOaburameHomesCid/ExtraHome4/ExitL
			EntranceR
				goingto=/turf/SSOaburameHomesCid/ExtraHome4/ExitR

			ExitL
				goingto=/turf/SSOaburameHomesCid/ExtraHome4/EntranceL
			ExitR
				goingto=/turf/SSOaburameHomesCid/ExtraHome4/EntranceR
		ExtraHome5
			EntranceL
				goingto=/turf/SSOaburameHomesCid/ExtraHome5/ExitL
			EntranceR
				goingto=/turf/SSOaburameHomesCid/ExtraHome5/ExitR

			ExitL
				goingto=/turf/SSOaburameHomesCid/ExtraHome5/EntranceL
			ExitR
				goingto=/turf/SSOaburameHomesCid/ExtraHome5/EntranceR

turf
	SSOHozukiHomesCid
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
		ExtraHome1
			EntranceL
				goingto=/turf/SSOHozukiHomesCid/ExtraHome1/ExitL
			EntranceR
				goingto=/turf/SSOHozukiHomesCid/ExtraHome1/ExitR

			ExitL
				goingto=/turf/SSOHozukiHomesCid/ExtraHome1/EntranceL
			ExitR
				goingto=/turf/SSOHozukiHomesCid/ExtraHome1/EntranceR
		ExtraHome2
			EntranceL
				goingto=/turf/SSOHozukiHomesCid/ExtraHome2/ExitL
			EntranceR
				goingto=/turf/SSOHozukiHomesCid/ExtraHome2/ExitR

			ExitL
				goingto=/turf/SSOHozukiHomesCid/ExtraHome2/EntranceL
			ExitR
				goingto=/turf/SSOHozukiHomesCid/ExtraHome2/EntranceR
		ExtraHome3
			EntranceL
				goingto=/turf/SSOHozukiHomesCid/ExtraHome3/ExitL
			EntranceR
				goingto=/turf/SSOHozukiHomesCid/ExtraHome3/ExitR

			ExitL
				goingto=/turf/SSOHozukiHomesCid/ExtraHome3/EntranceL
			ExitR
				goingto=/turf/SSOHozukiHomesCid/ExtraHome3/EntranceR
		ExtraHome4
			EntranceL
				goingto=/turf/SSOHozukiHomesCid/ExtraHome4/ExitL
			EntranceR
				goingto=/turf/SSOHozukiHomesCid/ExtraHome4/ExitR

			ExitL
				goingto=/turf/SSOHozukiHomesCid/ExtraHome4/EntranceL
			ExitR
				goingto=/turf/SSOHozukiHomesCid/ExtraHome4/EntranceR
		ExtraHome5
			EntranceL
				goingto=/turf/SSOHozukiHomesCid/ExtraHome5/ExitL
			EntranceR
				goingto=/turf/SSOHozukiHomesCid/ExtraHome5/ExitR

			ExitL
				goingto=/turf/SSOHozukiHomesCid/ExtraHome5/EntranceL
			ExitR
				goingto=/turf/SSOHozukiHomesCid/ExtraHome5/EntranceR
		ExtraHome6
			EntranceL
				goingto=/turf/SSOHozukiHomesCid/ExtraHome6/ExitL
			EntranceR
				goingto=/turf/SSOHozukiHomesCid/ExtraHome6/ExitR

			ExitL
				goingto=/turf/SSOHozukiHomesCid/ExtraHome6/EntranceL
			ExitR
				goingto=/turf/SSOHozukiHomesCid/ExtraHome6/EntranceR
		MainEntranceExit
			EntranceL
				goingto=/turf/SSOHozukiHomesCid/MainEntranceExit/ExitL
			EntranceR
				goingto=/turf/SSOHozukiHomesCid/MainEntranceExit/ExitR

			ExitL
				goingto=/turf/SSOHozukiHomesCid/MainEntranceExit/EntranceL
			ExitR
				goingto=/turf/SSOHozukiHomesCid/MainEntranceExit/EntranceR
		MainUpstairsDownstairs
			UpL
				goingto=/turf/SSOHozukiHomesCid/MainUpstairsDownstairs/DownL
			UpR
				goingto=/turf/SSOHozukiHomesCid/MainUpstairsDownstairs/DownR

			DownL
				goingto=/turf/SSOHozukiHomesCid/MainUpstairsDownstairs/UpL
			DownR
				goingto=/turf/SSOHozukiHomesCid/MainUpstairsDownstairs/UpR

	OriginWarperSamuraiTemple
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
		House1
			EntranceL
				goingto=/turf/OriginWarperSamuraiTemple/House1/ExitL

			ExitL
				goingto=/turf/OriginWarperSamuraiTemple/House1/EntranceL

			EntranceR
				goingto=/turf/OriginWarperSamuraiTemple/House1/ExitR

			ExitR
				goingto=/turf/OriginWarperSamuraiTemple/House1/EntranceR
		House2
			EntranceL
				goingto=/turf/OriginWarperSamuraiTemple/House2/ExitL

			ExitL
				goingto=/turf/OriginWarperSamuraiTemple/House2/EntranceL

			EntranceR
				goingto=/turf/OriginWarperSamuraiTemple/House2/ExitR

			ExitR
				goingto=/turf/OriginWarperSamuraiTemple/House2/EntranceR
		House3
			EntranceL
				goingto=/turf/OriginWarperSamuraiTemple/House3/ExitL

			ExitL
				goingto=/turf/OriginWarperSamuraiTemple/House3/EntranceL

			EntranceR
				goingto=/turf/OriginWarperSamuraiTemple/House3/ExitR

			ExitR
				goingto=/turf/OriginWarperSamuraiTemple/House3/EntranceR
		House4
			EntranceL
				goingto=/turf/OriginWarperSamuraiTemple/House4/ExitL

			ExitL
				goingto=/turf/OriginWarperSamuraiTemple/House4/EntranceL

			EntranceR
				goingto=/turf/OriginWarperSamuraiTemple/House4/ExitR

			ExitR
				goingto=/turf/OriginWarperSamuraiTemple/House4/EntranceR
		House5
			EntranceL
				goingto=/turf/OriginWarperSamuraiTemple/House5/ExitL

			ExitL
				goingto=/turf/OriginWarperSamuraiTemple/House5/EntranceL

			EntranceR
				goingto=/turf/OriginWarperSamuraiTemple/House5/ExitR

			ExitR
				goingto=/turf/OriginWarperSamuraiTemple/House5/EntranceR
		Temple
			EntranceL
				goingto=/turf/OriginWarperSamuraiTemple/Temple/ExitL

			ExitL
				goingto=/turf/OriginWarperSamuraiTemple/Temple/EntranceL

			EntranceR
				goingto=/turf/OriginWarperSamuraiTemple/Temple/ExitR

			ExitR
				goingto=/turf/OriginWarperSamuraiTemple/Temple/EntranceR
		Weapons
			EntranceL
				goingto=/turf/OriginWarperSamuraiTemple/Weapons/ExitL

			ExitL
				goingto=/turf/OriginWarperSamuraiTemple/Weapons/EntranceL

			EntranceR
				goingto=/turf/OriginWarperSamuraiTemple/Weapons/ExitR

			ExitR
				goingto=/turf/OriginWarperSamuraiTemple/Weapons/EntranceR
		Clothing
			EntranceL
				goingto=/turf/OriginWarperSamuraiTemple/Clothing/ExitL

			ExitL
				goingto=/turf/OriginWarperSamuraiTemple/Clothing/EntranceL

			EntranceR
				goingto=/turf/OriginWarperSamuraiTemple/Clothing/ExitR

			ExitR
				goingto=/turf/OriginWarperSamuraiTemple/Clothing/EntranceR
		TwoStory
			EntranceL
				goingto=/turf/OriginWarperSamuraiTemple/TwoStory/ExitL

			ExitL
				goingto=/turf/OriginWarperSamuraiTemple/TwoStory/EntranceL

			EntranceR
				goingto=/turf/OriginWarperSamuraiTemple/TwoStory/ExitR

			ExitR
				goingto=/turf/OriginWarperSamuraiTemple/TwoStory/EntranceR

		TwoStorySecondFloor
			EntranceL
				goingto=/turf/OriginWarperSamuraiTemple/TwoStorySecondFloor/ExitL

			ExitL
				goingto=/turf/OriginWarperSamuraiTemple/TwoStorySecondFloor/EntranceL

			EntranceR
				goingto=/turf/OriginWarperSamuraiTemple/TwoStorySecondFloor/ExitR

			ExitR
				goingto=/turf/OriginWarperSamuraiTemple/TwoStorySecondFloor/EntranceR

		Barber
			EntranceL
				goingto=/turf/OriginWarperSamuraiTemple/Barber/ExitL

			ExitL
				goingto=/turf/OriginWarperSamuraiTemple/Barber/EntranceL

			EntranceR
				goingto=/turf/OriginWarperSamuraiTemple/Barber/ExitR

			ExitR
				goingto=/turf/OriginWarperSamuraiTemple/Barber/EntranceR
		Library
			EntranceL
				goingto=/turf/OriginWarperSamuraiTemple/Library/ExitL

			ExitL
				goingto=/turf/OriginWarperSamuraiTemple/Library/EntranceL

			EntranceR
				goingto=/turf/OriginWarperSamuraiTemple/Library/ExitR

			ExitR
				goingto=/turf/OriginWarperSamuraiTemple/Library/EntranceR
		Hospital

			EntranceL
				goingto=/turf/OriginWarperSamuraiTemple/Hospital/ExitL

			ExitL
				goingto=/turf/OriginWarperSamuraiTemple/Hospital/EntranceL

			EntranceR
				goingto=/turf/OriginWarperSamuraiTemple/Hospital/ExitR

			ExitR
				goingto=/turf/OriginWarperSamuraiTemple/Hospital/EntranceR

		ScrollLibrary
			EntranceL
				goingto=/turf/OriginWarperSamuraiTemple/ScrollLibrary/ExitL

			ExitL
				goingto=/turf/OriginWarperSamuraiTemple/ScrollLibrary/EntranceL

			EntranceR
				goingto=/turf/OriginWarperSamuraiTemple/ScrollLibrary/ExitR

			ExitR
				goingto=/turf/OriginWarperSamuraiTemple/ScrollLibrary/EntranceR
turf
	SSOYotsukiHomesCid
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
		MainUpstairsDownstairs
			UpL
				goingto=/turf/SSOYotsukiHomesCid/MainUpstairsDownstairs/DownL
			UpR
				goingto=/turf/SSOYotsukiHomesCid/MainUpstairsDownstairs/DownR

			DownL
				goingto=/turf/SSOYotsukiHomesCid/MainUpstairsDownstairs/UpL
			DownR
				goingto=/turf/SSOYotsukiHomesCid/MainUpstairsDownstairs/UpR

turf
	OriginWarperKaguya
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
		MainCave
			Entrance1
				goingto=/turf/OriginWarperKaguya/MainCave/Exit1

			Exit1
				goingto=/turf/OriginWarperKaguya/MainCave/Entrance1
			Entrance2
				goingto=/turf/OriginWarperKaguya/MainCave/Exit2

			Exit2
				goingto=/turf/OriginWarperKaguya/MainCave/Entrance2
			Entrance3
				goingto=/turf/OriginWarperKaguya/MainCave/Exit3

			Exit3
				goingto=/turf/OriginWarperKaguya/MainCave/Entrance3

			Entrance4
				goingto=/turf/OriginWarperKaguya/MainCave/Exit4

			Exit4
				goingto=/turf/OriginWarperKaguya/MainCave/Entrance4
			Entrance5
				goingto=/turf/OriginWarperKaguya/MainCave/Exit5

			Exit5
				goingto=/turf/OriginWarperKaguya/MainCave/Entrance5
			Entrance6
				goingto=/turf/OriginWarperKaguya/MainCave/Exit6

			Exit6
				goingto=/turf/OriginWarperKaguya/MainCave/Entrance6
			Entrance7
				goingto=/turf/OriginWarperKaguya/MainCave/Exit7
			Exit7
				goingto=/turf/OriginWarperKaguya/MainCave/Entrance7
		Cave2
			Entrance
				goingto=/turf/OriginWarperKaguya/Cave2/Exit

			Exit
				goingto=/turf/OriginWarperKaguya/Cave2/Entrance

		Cave3
			Entrance
				goingto=/turf/OriginWarperKaguya/Cave3/Exit

			Exit
				goingto=/turf/OriginWarperKaguya/Cave3/Entrance
		Cave4
			Entrance
				goingto=/turf/OriginWarperKaguya/Cave4/Exit

			Exit
				goingto=/turf/OriginWarperKaguya/Cave4/Entrance
		Cave5
			Entrance
				goingto=/turf/OriginWarperKaguya/Cave5/Exit

			Exit
				goingto=/turf/OriginWarperKaguya/Cave5/Entrance
		Cave6
			Entrance
				goingto=/turf/OriginWarperKaguya/Cave6/Exit

			Exit
				goingto=/turf/OriginWarperKaguya/Cave6/Entrance
turf
	OriginWarperInuzuka
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
		MainCave
			Entrance1
				goingto=/turf/OriginWarperInuzuka/MainCave/Exit1

			Exit1
				goingto=/turf/OriginWarperInuzuka/MainCave/Entrance1
			Entrance2
				goingto=/turf/OriginWarperInuzuka/MainCave/Exit2

			Exit2
				goingto=/turf/OriginWarperInuzuka/MainCave/Entrance2
			Entrance3
				goingto=/turf/OriginWarperInuzuka/MainCave/Exit3

			Exit3
				goingto=/turf/OriginWarperInuzuka/MainCave/Entrance3

			Entrance4
				goingto=/turf/OriginWarperInuzuka/MainCave/Exit4

			Exit4
				goingto=/turf/OriginWarperInuzuka/MainCave/Entrance4
			Entrance5
				goingto=/turf/OriginWarperInuzuka/MainCave/Exit5

			Exit5
				goingto=/turf/OriginWarperInuzuka/MainCave/Entrance5
			Entrance6
				goingto=/turf/OriginWarperInuzuka/MainCave/Exit6

			Exit6
				goingto=/turf/OriginWarperInuzuka/MainCave/Entrance6
			Entrance7
				goingto=/turf/OriginWarperInuzuka/MainCave/Exit7
			Exit7
				goingto=/turf/OriginWarperInuzuka/MainCave/Entrance7
		Lounging
			Entrance
				goingto=/turf/OriginWarperInuzuka/Lounging/Exit

			Exit
				goingto=/turf/OriginWarperInuzuka/Lounging/Entrance

		JutsuLibrary
			Entrance
				goingto=/turf/OriginWarperInuzuka/JutsuLibrary/Exit

			Exit
				goingto=/turf/OriginWarperInuzuka/JutsuLibrary/Entrance
		Cave4
			Entrance
				goingto=/turf/OriginWarperInuzuka/Cave4/Exit

			Exit
				goingto=/turf/OriginWarperInuzuka/Cave4/Entrance
		Cave5
			Entrance
				goingto=/turf/OriginWarperInuzuka/Cave5/Exit

			Exit
				goingto=/turf/OriginWarperInuzuka/Cave5/Entrance
		Cave6
			Entrance
				goingto=/turf/OriginWarperInuzuka/Cave6/Exit

			Exit
				goingto=/turf/OriginWarperInuzuka/Cave6/Entrance

turf
	OriginWarperNimbus
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

		House
			LeftEntrance
				goingto=/turf/OriginWarperNimbus/House/LeftExit
			LeftExit
				goingto=/turf/OriginWarperNimbus/House/LeftEntrance

			RightExit
				goingto=/turf/OriginWarperNimbus/House/RightEntrance
			RightEntrance
				goingto/turf/OriginWarperNimbus/House/RightExit
		House2
			LeftEntrance
				goingto=/turf/OriginWarperNimbus/House2/LeftExit
			LeftExit
				goingto=/turf/OriginWarperNimbus/House2/LeftEntrance

			RightExit
				goingto=/turf/OriginWarperNimbus/House2/RightEntrance
			RightEntrance
				goingto/turf/OriginWarperNimbus/House2/RightExit

		House3
			LeftEntrance
				goingto=/turf/OriginWarperNimbus/House3/LeftExit
			LeftExit
				goingto=/turf/OriginWarperNimbus/House3/LeftEntrance

			RightExit
				goingto=/turf/OriginWarperNimbus/House3/RightEntrance
			RightEntrance
				goingto/turf/OriginWarperNimbus/House3/RightExit

		House4
			LeftEntrance
				goingto=/turf/OriginWarperNimbus/House4/LeftExit
			LeftExit
				goingto=/turf/OriginWarperNimbus/House4/LeftEntrance

			RightExit
				goingto=/turf/OriginWarperNimbus/House4/RightEntrance
			RightEntrance
				goingto/turf/OriginWarperNimbus/House4/RightExit


		JutsuLibrary
			LeftEntrance
				goingto=/turf/OriginWarperNimbus/JutsuLibrary/LeftExit
			LeftExit
				goingto=/turf/OriginWarperNimbus/JutsuLibrary/LeftEntrance

			RightEntrance
				goingto=/turf/OriginWarperNimbus/JutsuLibrary/RightExit
			RightExit
				goingto=/turf/OriginWarperNimbus/JutsuLibrary/RightEntrance


		ClothesNBarber
			LeftEntrance
				goingto=/turf/OriginWarperNimbus/ClothesNBarber/LeftExit
			LeftExit
				goingto=/turf/OriginWarperNimbus/ClothesNBarber/LeftEntrance

			RightEntrance
				goingto=/turf/OriginWarperNimbus/ClothesNBarber/RightExit
			RightExit
				goingto=/turf/OriginWarperNimbus/ClothesNBarber/RightEntrance

		Cave5
			Entrance
				goingto=/turf/OriginWarperNimbus/Cave5/Exit

			Exit
				goingto=/turf/OriginWarperNimbus/Cave5/Entrance
		Cave6
			Entrance
				goingto=/turf/OriginWarperNimbus/Cave6/Exit

			Exit
				goingto=/turf/OriginWarperNimbus/Cave6/Entrance

	OriginWarperYuki
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
		House1
			EntranceL
				goingto=/turf/OriginWarperYuki/House1/ExitL

			ExitL
				goingto=/turf/OriginWarperYuki/House1/EntranceL


		House2
			EntranceL
				goingto=/turf/OriginWarperYuki/House2/ExitL

			ExitL
				goingto=/turf/OriginWarperYuki/House2/EntranceL


		House3
			EntranceL
				goingto=/turf/OriginWarperYuki/House3/ExitL

			ExitL
				goingto=/turf/OriginWarperYuki/House3/EntranceL

		Weapons
			EntranceL
				goingto=/turf/OriginWarperYuki/Weapons/ExitL

			ExitL
				goingto=/turf/OriginWarperYuki/Weapons/EntranceL


		House4
			EntranceL
				goingto=/turf/OriginWarperYuki/House4/ExitL

			ExitL
				goingto=/turf/OriginWarperYuki/House4/EntranceL

			EntranceR
				goingto=/turf/OriginWarperYuki/House4/ExitR

			ExitR
				goingto=/turf/OriginWarperYuki/House4/EntranceR

turf
	OriginWarperNorthTemple
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
		House1
			Entrance
				goingto=/turf/OriginWarperNorthTemple/House1/Exit

			Exit
				goingto=/turf/OriginWarperNorthTemple/House1/Entrance
		House2
			Entrance
				goingto=/turf/OriginWarperNorthTemple/House2/Exit

			Exit
				goingto=/turf/OriginWarperNorthTemple/House2/Entrance

		House3
			Entrance
				goingto=/turf/OriginWarperNorthTemple/House3/Exit

			Exit
				goingto=/turf/OriginWarperNorthTemple/House3/Entrance
		House4
			Entrance
				goingto=/turf/OriginWarperNorthTemple/House4/Exit

			Exit
				goingto=/turf/OriginWarperNorthTemple/House4/Entrance
		House5
			Entrance
				goingto=/turf/OriginWarperNorthTemple/House5/Exit

			Exit
				goingto=/turf/OriginWarperNorthTemple/House5/Entrance
		House6
			Entrance
				goingto=/turf/OriginWarperNorthTemple/House6/Exit

			Exit
				goingto=/turf/OriginWarperNorthTemple/House6/Entrance

		House7
			Entrance
				goingto=/turf/OriginWarperNorthTemple/House7/Exit

			Exit
				goingto=/turf/OriginWarperNorthTemple/House7/Entrance
		Hotel
			EntranceL
				goingto=/turf/OriginWarperNorthTemple/Hotel/ExitL

			ExitL
				goingto=/turf/OriginWarperNorthTemple/Hotel/EntranceL

			EntranceR
				goingto=/turf/OriginWarperNorthTemple/Hotel/ExitR

			ExitR
				goingto=/turf/OriginWarperNorthTemple/Hotel/EntranceR

		Hotel2
			EntranceL
				goingto=/turf/OriginWarperNorthTemple/Hotel2/ExitL

			ExitL
				goingto=/turf/OriginWarperNorthTemple/Hotel2/EntranceL

			EntranceR
				goingto=/turf/OriginWarperNorthTemple/Hotel2/ExitR

			ExitR
				goingto=/turf/OriginWarperNorthTemple/Hotel2/EntranceR
		House7
			Entrance
				goingto=/turf/OriginWarperNorthTemple/House7/Exit

			Exit
				goingto=/turf/OriginWarperNorthTemple/House7/Entrance

		Temple
			EntranceR
				goingto=/turf/OriginWarperNorthTemple/Temple/ExitR

			ExitR
				goingto=/turf/OriginWarperNorthTemple/Temple/EntranceR

			EntranceL
				goingto=/turf/OriginWarperNorthTemple/Temple/ExitL

			ExitL
				goingto=/turf/OriginWarperNorthTemple/Temple/EntranceL

		Market
			EntranceL
				goingto=/turf/OriginWarperNorthTemple/Market/ExitL

			ExitL
				goingto=/turf/OriginWarperNorthTemple/Market/EntranceL

			EntranceR
				goingto=/turf/OriginWarperNorthTemple/Market/ExitR

			ExitR
				goingto=/turf/OriginWarperNorthTemple/Market/EntranceR
		Library
			Entrance
				goingto=/turf/OriginWarperNorthTemple/Library/Exit

			Exit
				goingto=/turf/OriginWarperNorthTemple/Library/Entrance
