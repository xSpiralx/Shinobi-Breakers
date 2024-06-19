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

turf
	Konoha
		Savior
			saviorturf
				icon='newcliffa.dmi'
			saviorgrass
				icon='grassedge1.dmi'
			saviorgrassd
				icon='grassedged1.dmi'
			saviordirt
				icon='dirte.dmi'
			waterturf
				icon='newwater.dmi'
				layer=2
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

		Ivan
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
						goingto=/turf/warps/Ivan/IvanHouse/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Ivan/IvanHouse/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Ivan/IvanHouse/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Ivan/IvanHouse/EntranceExit/EntranceR
			IvanClanHouse
				layer=999
				density=0
				var/goingto
				Entered(mob/M)
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
						goingto=/turf/warps/Ivan/IvanClanHouse/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Ivan/IvanClanHouse/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Ivan/IvanClanHouse/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Ivan/IvanClanHouse/EntranceExit/EntranceR
			IvanTeaHouse
				layer=999
				density=0
				var/goingto
				Entered(mob/M)
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
						goingto=/turf/warps/Ivan/IvanTeaHouse/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Ivan/IvanTeaHouse/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Ivan/IvanTeaHouse/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Ivan/IvanTeaHouse/EntranceExit/EntranceR
			IvanCasino
				layer=999
				density=0
				var/goingto
				Entered(mob/M)
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
						goingto=/turf/warps/Ivan/IvanCasino/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Ivan/IvanCasino/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Ivan/IvanCasino/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Ivan/IvanCasino/EntranceExit/EntranceR
			IvanDojo
				layer=999
				density=0
				var/goingto
				Entered(mob/M)
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
						goingto=/turf/warps/Ivan/IvanDojo/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Ivan/IvanDojo/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Ivan/IvanDojo/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Ivan/IvanDojo/EntranceExit/EntranceR



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

		EduYukiPlace
			EduYukiHouse
				layer=999
				density=0
				var/goingto
				Entered(mob/M)
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
						goingto=/turf/warps/EduYukiPlace/EduYukiHouse/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/EduYukiPlace/EduYukiHouse/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/EduYukiPlace/EduYukiHouse/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/EduYukiPlace/EduYukiHouse/EntranceExit/EntranceR
			EduTeaHouse
				layer=999
				density=0
				var/goingto
				Entered(mob/M)
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
						goingto=/turf/warps/EduYukiPlace/EduTeaHouse/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/EduYukiPlace/EduTeaHouse/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/EduYukiPlace/EduTeaHouse/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/EduYukiPlace/EduTeaHouse/EntranceExit/EntranceR


		Senju
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
			SenjuForge
				layer=999
				density=0
				var/goingto
				Entered(mob/M)
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
						goingto=/turf/warps/Senju/SenjuForge/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Senju/SenjuForge/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Senju/SenjuForge/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Senju/SenjuForge/EntranceExit/EntranceR
			SenjuTeaHouse
				layer=999
				density=0
				var/goingto
				Entered(mob/M)
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
						goingto=/turf/warps/Senju/SenjuTeaHouse/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Senju/SenjuTeaHouse/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Senju/SenjuTeaHouse/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Senju/SenjuTeaHouse/EntranceExit/EntranceR
			SenjuHome1
				layer=999
				density=0
				var/goingto
				Entered(mob/M)
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
						goingto=/turf/warps/Senju/SenjuHome1/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Senju/SenjuHome1/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Senju/SenjuHome1/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Senju/SenjuHome1/EntranceExit/EntranceR
			SenjuHome2
				layer=999
				density=0
				var/goingto
				Entered(mob/M)
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
						goingto=/turf/warps/Senju/SenjuHome2/EntranceExit/ExitL
					EntranceR
						goingto=/turf/warps/Senju/SenjuHome2/EntranceExit/ExitR

					ExitL
						goingto=/turf/warps/Senju/SenjuHome2/EntranceExit/EntranceL
					ExitR
						goingto=/turf/warps/Senju/SenjuHome2/EntranceExit/EntranceR
			SenjuAitoHome
				layer=999
				density=0
				var/goingto
				Entered(mob/M)
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


