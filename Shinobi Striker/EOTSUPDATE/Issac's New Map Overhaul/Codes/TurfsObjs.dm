turf
	Snow
		Warpers
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
				BarberEx
					goingto=/turf/Snow/Warpers/Barber/BarberEnt
				BarberEnt
					goingto=/turf/Snow/Warpers/Barber/BarberEx
			Clothes
				ClothesEx
					goingto=/turf/Snow/Warpers/Clothes/ClothesEnt
				ClothesEnt
					goingto=/turf/Snow/Warpers/Clothes/ClothesEx
			Cafe
				CafeEx
					goingto=/turf/Snow/Warpers/Cafe/CafeEnt
				CafeEnt
					goingto=/turf/Snow/Warpers/Cafe/CafeEx
			Hospital
				HospitalEx
					goingto=/turf/Snow/Warpers/Hospital/HospitalEnt
				HospitalEnt
					goingto=/turf/Snow/Warpers/Hospital/HospitalEx
				HospitalUpEx1
					goingto=/turf/Snow/Warpers/Hospital/HospitalUpEnt1
				HospitalUpEx2
					goingto=/turf/Snow/Warpers/Hospital/HospitalUpEnt2
				HospitalUpEnt1
					goingto=/turf/Snow/Warpers/Hospital/HospitalUpEx1
				HospitalUpEnt2
					goingto=/turf/Snow/Warpers/Hospital/HospitalUpEx2
			Academy
				AcademyEx
					goingto=/turf/Snow/Warpers/Academy/AcademyEnt
				AcademyEnt
					goingto=/turf/Snow/Warpers/Academy/AcademyEx
				AcademyUpEx1
					goingto=/turf/Snow/Warpers/Academy/AcademyUpEnt1
				AcademyUpEx2
					goingto=/turf/Snow/Warpers/Academy/AcademyUpEnt2
				AcademyUpEnt1
					goingto=/turf/Snow/Warpers/Academy/AcademyUpEx1
				AcademyUpEnt2
					goingto=/turf/Snow/Warpers/Academy/AcademyUpEx2
			HyuugaHouse
				HyuugaEntrance1
					goingto=/turf/Snow/Warpers/HyuugaHouse/HyuugaExit1
				HyuugaEntrance2
					goingto=/turf/Snow/Warpers/HyuugaHouse/HyuugaExit2
				HyuugaEntrance3
					goingto=/turf/Snow/Warpers/HyuugaHouse/HyuugaExit3
				HyuugaEntrance4
					goingto=/turf/Snow/Warpers/HyuugaHouse/HyuugaExit4
				HyuugaExit1
					goingto=/turf/Snow/Warpers/HyuugaHouse/HyuugaEntrance1
				HyuugaExit2
					goingto=/turf/Snow/Warpers/HyuugaHouse/HyuugaEntrance2
				HyuugaExit3
					goingto=/turf/Snow/Warpers/HyuugaHouse/HyuugaEntrance3
				HyuugaExit4
					goingto=/turf/Snow/Warpers/HyuugaHouse/HyuugaEntrance4
				HyuugaEntrance6
					goingto=/turf/Snow/Warpers/HyuugaHouse/HyuugaExit6
				HyuugaExit6
					goingto=/turf/Snow/Warpers/HyuugaHouse/HyuugaEntrance6
			SenjuHouse
				SenjuEntrance1
					goingto=/turf/Snow/Warpers/SenjuHouse/SenjuExit1
				SenjuEntrance2
					goingto=/turf/Snow/Warpers/SenjuHouse/SenjuExit2
				SenjuEntrance3
					goingto=/turf/Snow/Warpers/SenjuHouse/SenjuExit3
				SenjuEntrance4
					goingto=/turf/Snow/Warpers/SenjuHouse/SenjuExit4
				SenjuCaveEntrance
					goingto=/turf/Snow/Warpers/SenjuHouse/SenjuCaveExit
				SenjuExit1
					goingto=/turf/Snow/Warpers/SenjuHouse/SenjuEntrance1
				SenjuExit2
					goingto=/turf/Snow/Warpers/SenjuHouse/SenjuEntrance2
				SenjuExit3
					goingto=/turf/Snow/Warpers/SenjuHouse/SenjuEntrance3
				SenjuExit4
					goingto=/turf/Snow/Warpers/SenjuHouse/SenjuEntrance4
				SenjuCaveExit
					goingto=/turf/Snow/Warpers/SenjuHouse/SenjuCaveEntrance
			ONEStoryBuildings
				Entrance1
					goingto=/turf/Snow/Warpers/ONEStoryBuildings/Exit1
				Entrance2
					goingto=/turf/Snow/Warpers/ONEStoryBuildings/Exit2
				Entrance3
					goingto=/turf/Snow/Warpers/ONEStoryBuildings/Exit3
				Entrance4
					goingto=/turf/Snow/Warpers/ONEStoryBuildings/Exit4
				Entrance5
					goingto=/turf/Snow/Warpers/ONEStoryBuildings/Exit5
				Entrance6
					goingto=/turf/Snow/Warpers/ONEStoryBuildings/Exit6
				Entrance7
					goingto=/turf/Snow/Warpers/ONEStoryBuildings/Exit7
				Entrance8
					goingto=/turf/Snow/Warpers/ONEStoryBuildings/Exit8
				Entrance9
					goingto=/turf/Snow/Warpers/ONEStoryBuildings/Exit9
				Entrance10
					goingto=/turf/Snow/Warpers/ONEStoryBuildings/Exit10
				Entrance11
					goingto=/turf/Snow/Warpers/ONEStoryBuildings/Exit11
				Entrance12
					goingto=/turf/Snow/Warpers/ONEStoryBuildings/Exit12
				Entrance13
					goingto=/turf/Snow/Warpers/ONEStoryBuildings/Exit13
				Entrance14
					goingto=/turf/Snow/Warpers/ONEStoryBuildings/Exit14
				Entrance15
					goingto=/turf/Snow/Warpers/ONEStoryBuildings/Exit15
				Entrance16
					goingto=/turf/Snow/Warpers/ONEStoryBuildings/Exit16
				Entrance17
					goingto=/turf/Snow/Warpers/ONEStoryBuildings/Exit17

				Exit1
					goingto=/turf/Snow/Warpers/ONEStoryBuildings/Entrance1
				Exit2
					goingto=/turf/Snow/Warpers/ONEStoryBuildings/Entrance2
				Exit3
					goingto=/turf/Snow/Warpers/ONEStoryBuildings/Entrance3
				Exit4
					goingto=/turf/Snow/Warpers/ONEStoryBuildings/Entrance4
				Exit5
					goingto=/turf/Snow/Warpers/ONEStoryBuildings/Entrance5
				Exit6
					goingto=/turf/Snow/Warpers/ONEStoryBuildings/Entrance6
				Exit7
					goingto=/turf/Snow/Warpers/ONEStoryBuildings/Entrance7
				Exit8
					goingto=/turf/Snow/Warpers/ONEStoryBuildings/Entrance8
				Exit9
					goingto=/turf/Snow/Warpers/ONEStoryBuildings/Entrance9
				Exit10
					goingto=/turf/Snow/Warpers/ONEStoryBuildings/Entrance10
				Exit11
					goingto=/turf/Snow/Warpers/ONEStoryBuildings/Entrance11
				Exit12
					goingto=/turf/Snow/Warpers/ONEStoryBuildings/Entrance12
				Exit13
					goingto=/turf/Snow/Warpers/ONEStoryBuildings/Entrance13
				Exit14
					goingto=/turf/Snow/Warpers/ONEStoryBuildings/Entrance14
				Exit15
					goingto=/turf/Snow/Warpers/ONEStoryBuildings/Entrance15
				Exit16
					goingto=/turf/Snow/Warpers/ONEStoryBuildings/Entrance16
				Exit17
					goingto=/turf/Snow/Warpers/ONEStoryBuildings/Entrance17

			TWOStoryBuildings
				Entrance1
					goingto=/turf/Snow/Warpers/TWOStoryBuildings/Exit1
				Entrance2
					goingto=/turf/Snow/Warpers/TWOStoryBuildings/Exit2
				Entrance3
					goingto=/turf/Snow/Warpers/TWOStoryBuildings/Exit3
				Entrance4
					goingto=/turf/Snow/Warpers/TWOStoryBuildings/Exit4
				Entrance5
					goingto=/turf/Snow/Warpers/TWOStoryBuildings/Exit5
				Entrance6
					goingto=/turf/Snow/Warpers/TWOStoryBuildings/Exit6
				Entrance7
					goingto=/turf/Snow/Warpers/TWOStoryBuildings/Exit7
				Entrance8
					goingto=/turf/Snow/Warpers/TWOStoryBuildings/Exit8
				Entrance9
					goingto=/turf/Snow/Warpers/TWOStoryBuildings/Exit9


				Exit1
					goingto=/turf/Snow/Warpers/TWOStoryBuildings/Entrance1
				Exit2
					goingto=/turf/Snow/Warpers/TWOStoryBuildings/Entrance2
				Exit3
					goingto=/turf/Snow/Warpers/TWOStoryBuildings/Entrance3
				Exit4
					goingto=/turf/Snow/Warpers/TWOStoryBuildings/Entrance4
				Exit5
					goingto=/turf/Snow/Warpers/TWOStoryBuildings/Entrance5
				Exit6
					goingto=/turf/Snow/Warpers/TWOStoryBuildings/Entrance6
				Exit7
					goingto=/turf/Snow/Warpers/TWOStoryBuildings/Entrance7
				Exit8
					goingto=/turf/Snow/Warpers/TWOStoryBuildings/Entrance8
				Exit9
					goingto=/turf/Snow/Warpers/TWOStoryBuildings/Entrance9
obj
	Suna
		Cactus
			icon = 'Desert64x64.dmi'
			icon_state = "Cactus"
	Creation
		Clouds
			icon = 'cloud.dmi'
	Snow

		SnowTree1
			icon = 'SnowTree1.dmi'
			layer = 5
		SnowRock1
			icon= 'SnowRock1.dmi'
		SnowStump1
			icon= 'SnowStump1.dmi'
		SnowGrass1
			icon= 'SnowGrass1.dmi'
		SnowGrass1
			icon= 'SnowGrass1.dmi'
			icon_state="2"
		SnowBuilding1
			icon= 'roundbuilding.dmi'
		CultureBuildingBlue
			icon= 'culturebuildingblue.dmi'
		CultureBuildingBlack
			icon= 'culturebuildingblack.dmi'
		CultureBuildingRed
			icon= 'culturebuildingred.dmi'
		CultureBuildingGreen
			icon= 'culturebuildinggreen.dmi'
		CultureBuildingBrown
			icon= 'culturebuildingbrown.dmi'
		SnowCultureBuilding
			icon= 'Snowbuilding2.dmi'
		SnowCultureBuildingRed
			icon= 'Snowbuilding2red.dmi'
		SnowCultureBuildingGreen
			icon= 'Snowbuilding2green.dmi'
		MarketBuildings2
			icon= 'KonohaBUILDING.dmi'
		MarketBuildings
			icon= 'marketplace.dmi'
			layer=4.1
		GatesBijuu
			icon= 'GatesBijuu.dmi'
			layer=2
		MarketBuildingRoofsBlue
			icon= 'KonohagakureROOFblue.dmi'
			layer=4.12
		MarketBuildingRoofsBrown
			icon= 'KonohagakureROOFbrown.dmi'
			layer=4.12
		MarketBuildingRoofsRed
			icon= 'KonohagakureROOFred.dmi'
			layer=4.12
		MarketBuildingRoofsGray
			icon= 'KonohagakureROOFgray.dmi'
			layer=4.12
		MarketBuildingRoofsGreen
			icon= 'KonohagakureROOFgreen.dmi'
			layer=4.12
		MarketBuildingRoofsOrange
			icon= 'KonohagakureROOForange.dmi'
			layer=4.12
		Senjua
			icon= 'Signs.dmi'
			icon_state="Senjua"
			layer = 15
		Senjub
			icon= 'Signs.dmi'
			icon_state="Senjub"
			layer = 15
		Uchihaa
			icon= 'Signs.dmi'
			icon_state="uchihaa"
			layer = 15
		Uchihab
			icon= 'Signs.dmi'
			icon_state="uchihab"
			layer = 15
		Hyuugaa
			icon= 'Signs.dmi'
			icon_state="Hyuugaa"
			layer = 15
		Hyuugab
			icon= 'Signs.dmi'
			icon_state="Hyuugab"
			layer = 15
		door1
			icon='door1.dmi'
			icon_state="close"
			density=1
			layer=60
			var/Opacity=0
			var/password=null
			var/Locked=0
			proc/Open()
				layer=355
				flick("opening",src)
				icon_state="open"
				if(Opacity) opacity=0
				density=0
				spawn(30)
					for(var/mob/M in src.loc)
						if(M)
							while(M in src.loc) sleep(1)
					flick("closing",src)
					icon_state="close"
					density=1
					layer=355

					if(Opacity) opacity=1
turf
	IssacOverhaul
		CliffASand
			icon = 'CliffASand.dmi'
