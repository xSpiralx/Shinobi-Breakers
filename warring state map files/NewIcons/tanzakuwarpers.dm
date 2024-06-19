turf
	Tanzaku
		TanHOS
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Tanzaku/TanHOS/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Tanzaku/TanHOS/EntranceExit/ExitR

				ExitL
					goingto=/turf/Tanzaku/TanHOS/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Tanzaku/TanHOS/EntranceExit/EntranceR
			FloorA
				Floor1
					goingto=/turf/Tanzaku/TanHOS/FloorA/Floor2

				Floor2
					goingto=/turf/Tanzaku/TanHOS/FloorA/Floor1
			FloorB
				Floor3
					goingto=/turf/Tanzaku/TanHOS/FloorB/Floor4

				Floor4
					goingto=/turf/Tanzaku/TanHOS/FloorB/Floor3

		TanDojo
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Tanzaku/TanDojo/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Tanzaku/TanDojo/EntranceExit/ExitR

				ExitL
					goingto=/turf/Tanzaku/TanDojo/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Tanzaku/TanDojo/EntranceExit/EntranceR

			EntranceExitA
				EntranceL
					goingto=/turf/Tanzaku/TanDojo/EntranceExitA/ExitL
				EntranceR
					goingto=/turf/Tanzaku/TanDojo/EntranceExitA/ExitR

				ExitL
					goingto=/turf/Tanzaku/TanDojo/EntranceExitA/EntranceL
				ExitR
					goingto=/turf/Tanzaku/TanDojo/EntranceExitA/EntranceR

		TanBrothel
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Tanzaku/TanBrothel/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Tanzaku/TanBrothel/EntranceExit/ExitR

				ExitL
					goingto=/turf/Tanzaku/TanBrothel/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Tanzaku/TanBrothel/EntranceExit/EntranceR
		TanCas
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Tanzaku/TanCas/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Tanzaku/TanCas/EntranceExit/ExitR

				ExitL
					goingto=/turf/Tanzaku/TanCas/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Tanzaku/TanCas/EntranceExit/EntranceR



		TanMansion
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Tanzaku/TanMansion/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Tanzaku/TanMansion/EntranceExit/ExitR

				ExitL
					goingto=/turf/Tanzaku/TanMansion/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Tanzaku/TanMansion/EntranceExit/EntranceR
			FloorA
				Floor1
					goingto=/turf/Tanzaku/TanMansion/FloorA/Floor2

				Floor2
					goingto=/turf/Tanzaku/TanMansion/FloorA/Floor1
			FloorB
				Floor3
					goingto=/turf/Tanzaku/TanMansion/FloorB/Floor4

				Floor4
					goingto=/turf/Tanzaku/TanMansion/FloorB/Floor3


		TanMansionA
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Tanzaku/TanMansionA/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Tanzaku/TanMansionA/EntranceExit/ExitR

				ExitL
					goingto=/turf/Tanzaku/TanMansionA/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Tanzaku/TanMansionA/EntranceExit/EntranceR
			FloorA
				Floor1
					goingto=/turf/Tanzaku/TanMansionA/FloorA/Floor2

				Floor2
					goingto=/turf/Tanzaku/TanMansionA/FloorA/Floor1
			FloorB
				Floor3
					goingto=/turf/Tanzaku/TanMansionA/FloorB/Floor4

				Floor4
					goingto=/turf/Tanzaku/TanMansionA/FloorB/Floor3

		TanMansionB
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Tanzaku/TanMansionB/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Tanzaku/TanMansionB/EntranceExit/ExitR

				ExitL
					goingto=/turf/Tanzaku/TanMansionB/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Tanzaku/TanMansionB/EntranceExit/EntranceR
			FloorA
				Floor1
					goingto=/turf/Tanzaku/TanMansionB/FloorA/Floor2

				Floor2
					goingto=/turf/Tanzaku/TanMansionB/FloorA/Floor1
			FloorB
				Floor3
					goingto=/turf/Tanzaku/TanMansionB/FloorB/Floor4

				Floor4
					goingto=/turf/Tanzaku/TanMansionB/FloorB/Floor3


		TanBarb
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Tanzaku/TanBarb/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Tanzaku/TanBarb/EntranceExit/ExitR

				ExitL
					goingto=/turf/Tanzaku/TanBarb/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Tanzaku/TanBarb/EntranceExit/EntranceR

		TanClo
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Tanzaku/TanClo/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Tanzaku/TanClo/EntranceExit/ExitR

				ExitL
					goingto=/turf/Tanzaku/TanClo/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Tanzaku/TanClo/EntranceExit/EntranceR


		TanSho
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Tanzaku/TanSho/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Tanzaku/TanSho/EntranceExit/ExitR

				ExitL
					goingto=/turf/Tanzaku/TanSho/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Tanzaku/TanSho/EntranceExit/EntranceR

		TanSew
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Tanzaku/TanSew/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Tanzaku/TanSew/EntranceExit/ExitR

				ExitL
					goingto=/turf/Tanzaku/TanSew/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Tanzaku/TanSew/EntranceExit/EntranceR

		TanWat
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Tanzaku/TanWat/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Tanzaku/TanWat/EntranceExit/ExitR

				ExitL
					goingto=/turf/Tanzaku/TanWat/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Tanzaku/TanWat/EntranceExit/EntranceR



turf/Tanzaku
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
			if(usr.darkness)
				if(usr.darkness.alpha == 200) usr.setLightOverlay(outside_light)
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		EntranceExit
			CaveOneIn
				goingto=/turf/Tanzaku/Cave/EntranceExit/CaveOneOut
			CaveOneOut
				goingto=/turf/Tanzaku/Cave/EntranceExit/CaveOneIn


			CaveTwoIn
				goingto=/turf/Tanzaku/Cave/EntranceExit/CaveTwoOut
			CaveTwoOut
				goingto=/turf/Tanzaku/Cave/EntranceExit/CaveTwoIn


			CaveThreeIn
				goingto=/turf/Tanzaku/Cave/EntranceExit/CaveThreeOut
			CaveThreeOut
				goingto=/turf/Tanzaku/Cave/EntranceExit/CaveThreeIn

			CaveFourIn
				goingto=/turf/Tanzaku/Cave/EntranceExit/CaveFourOut
			CaveFourOut
				goingto=/turf/Tanzaku/Cave/EntranceExit/CaveFourIn



			CaveFiveIn
				goingto=/turf/Tanzaku/Cave/EntranceExit/CaveFiveOut
			CaveFiveOut
				goingto=/turf/Tanzaku/Cave/EntranceExit/CaveFiveIn


			CaveSixIn
				goingto=/turf/Tanzaku/Cave/EntranceExit/CaveSixOut
			CaveSixOut
				goingto=/turf/Tanzaku/Cave/EntranceExit/CaveSixIn



turf/Tanzaku
	JakDojo
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
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
			ShopOneIn
				goingto=/turf/Tanzaku/JakDojo/EntranceExit/ShopOneOut
			ShopOneOut
				goingto=/turf/Tanzaku/JakDojo/EntranceExit/ShopOneIn

			ShopTwoIn
				goingto=/turf/Tanzaku/JakDojo/EntranceExit/ShopOneOut
			ShopTwoOut
				goingto=/turf/Tanzaku/JakDojo/EntranceExit/ShopTwoIn


