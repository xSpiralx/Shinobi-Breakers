turf
	Sabu
		Clanhouse
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Sabu/Clanhouse/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Sabu/Clanhouse/EntranceExit/ExitR

				ExitL
					goingto=/turf/Sabu/Clanhouse/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Sabu/Clanhouse/EntranceExit/EntranceR
		SunagakureH1
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Sabu/SunagakureH1/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Sabu/SunagakureH1/EntranceExit/ExitR

				ExitL
					goingto=/turf/Sabu/SunagakureH1/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Sabu/SunagakureH1/EntranceExit/EntranceR
			UpstairsDownstairs1
				EntranceL
					goingto=/turf/Sabu/SunagakureH1/UpstairsDownstairs1/ExitL
				EntranceR
					goingto=/turf/Sabu/SunagakureH1/UpstairsDownstairs1/ExitR

				ExitL
					goingto=/turf/Sabu/SunagakureH1/UpstairsDownstairs1/EntranceL
				ExitR
					goingto=/turf/Sabu/SunagakureH1/UpstairsDownstairs1/EntranceR
			UpstairsDownstairs2
				EntranceL
					goingto=/turf/Sabu/SunagakureH1/UpstairsDownstairs2/ExitL
				EntranceR
					goingto=/turf/Sabu/SunagakureH1/UpstairsDownstairs2/ExitR

				ExitL
					goingto=/turf/Sabu/SunagakureH1/UpstairsDownstairs2/EntranceL
				ExitR
					goingto=/turf/Sabu/SunagakureH1/UpstairsDownstairs2/EntranceR
		SunagakureH2
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Sabu/SunagakureH2/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Sabu/SunagakureH2/EntranceExit/ExitR

				ExitL
					goingto=/turf/Sabu/SunagakureH2/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Sabu/SunagakureH2/EntranceExit/EntranceR
			UpstairsDownstairs1
				EntranceL
					goingto=/turf/Sabu/SunagakureH2/UpstairsDownstairs1/ExitL
				EntranceR
					goingto=/turf/Sabu/SunagakureH2/UpstairsDownstairs1/ExitR

				ExitL
					goingto=/turf/Sabu/SunagakureH2/UpstairsDownstairs1/EntranceL
				ExitR
					goingto=/turf/Sabu/SunagakureH2/UpstairsDownstairs1/EntranceR
			UpstairsDownstairs2
				EntranceL
					goingto=/turf/Sabu/SunagakureH2/UpstairsDownstairs2/ExitL
				EntranceR
					goingto=/turf/Sabu/SunagakureH2/UpstairsDownstairs2/ExitR

				ExitL
					goingto=/turf/Sabu/SunagakureH2/UpstairsDownstairs2/EntranceL
				ExitR
					goingto=/turf/Sabu/SunagakureH2/UpstairsDownstairs2/EntranceR
		SunagakureH3
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Sabu/SunagakureH3/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Sabu/SunagakureH3/EntranceExit/ExitR

				ExitL
					goingto=/turf/Sabu/SunagakureH3/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Sabu/SunagakureH3/EntranceExit/EntranceR
			UpstairsDownstairs1
				EntranceL
					goingto=/turf/Sabu/SunagakureH3/UpstairsDownstairs1/ExitL
				EntranceR
					goingto=/turf/Sabu/SunagakureH3/UpstairsDownstairs1/ExitR

				ExitL
					goingto=/turf/Sabu/SunagakureH3/UpstairsDownstairs1/EntranceL
				ExitR
					goingto=/turf/Sabu/SunagakureH3/UpstairsDownstairs1/EntranceR
			UpstairsDownstairs2
				EntranceL
					goingto=/turf/Sabu/SunagakureH3/UpstairsDownstairs2/ExitL
				EntranceR
					goingto=/turf/Sabu/SunagakureH3/UpstairsDownstairs2/ExitR

				ExitL
					goingto=/turf/Sabu/SunagakureH3/UpstairsDownstairs2/EntranceL
				ExitR
					goingto=/turf/Sabu/SunagakureH3/UpstairsDownstairs2/EntranceR
		SunagakureH4
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Sabu/SunagakureH4/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Sabu/SunagakureH4/EntranceExit/ExitR

				ExitL
					goingto=/turf/Sabu/SunagakureH4/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Sabu/SunagakureH4/EntranceExit/EntranceR
			UpstairsDownstairs1
				EntranceL
					goingto=/turf/Sabu/SunagakureH4/UpstairsDownstairs1/ExitL
				EntranceR
					goingto=/turf/Sabu/SunagakureH4/UpstairsDownstairs1/ExitR

				ExitL
					goingto=/turf/Sabu/SunagakureH4/UpstairsDownstairs1/EntranceL
				ExitR
					goingto=/turf/Sabu/SunagakureH4/UpstairsDownstairs1/EntranceR
			UpstairsDownstairs2
				EntranceL
					goingto=/turf/Sabu/SunagakureH4/UpstairsDownstairs2/ExitL
				EntranceR
					goingto=/turf/Sabu/SunagakureH4/UpstairsDownstairs2/ExitR

				ExitL
					goingto=/turf/Sabu/SunagakureH4/UpstairsDownstairs2/EntranceL
				ExitR
					goingto=/turf/Sabu/SunagakureH4/UpstairsDownstairs2/EntranceR
		SunagakureH5
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Sabu/SunagakureH5/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Sabu/SunagakureH5/EntranceExit/ExitR

				ExitL
					goingto=/turf/Sabu/SunagakureH5/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Sabu/SunagakureH5/EntranceExit/EntranceR
			UpstairsDownstairs1
				EntranceL
					goingto=/turf/Sabu/SunagakureH5/UpstairsDownstairs1/ExitL
				EntranceR
					goingto=/turf/Sabu/SunagakureH5/UpstairsDownstairs1/ExitR

				ExitL
					goingto=/turf/Sabu/SunagakureH5/UpstairsDownstairs1/EntranceL
				ExitR
					goingto=/turf/Sabu/SunagakureH5/UpstairsDownstairs1/EntranceR
			UpstairsDownstairs2
				EntranceL
					goingto=/turf/Sabu/SunagakureH5/UpstairsDownstairs2/ExitL
				EntranceR
					goingto=/turf/Sabu/SunagakureH5/UpstairsDownstairs2/ExitR

				ExitL
					goingto=/turf/Sabu/SunagakureH5/UpstairsDownstairs2/EntranceL
				ExitR
					goingto=/turf/Sabu/SunagakureH5/UpstairsDownstairs2/EntranceR
		SunagakureH6
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Sabu/SunagakureH6/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Sabu/SunagakureH6/EntranceExit/ExitR

				ExitL
					goingto=/turf/Sabu/SunagakureH6/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Sabu/SunagakureH6/EntranceExit/EntranceR
			UpstairsDownstairs1
				EntranceL
					goingto=/turf/Sabu/SunagakureH6/UpstairsDownstairs1/ExitL
				EntranceR
					goingto=/turf/Sabu/SunagakureH6/UpstairsDownstairs1/ExitR

				ExitL
					goingto=/turf/Sabu/SunagakureH6/UpstairsDownstairs1/EntranceL
				ExitR
					goingto=/turf/Sabu/SunagakureH6/UpstairsDownstairs1/EntranceR
			UpstairsDownstairs2
				EntranceL
					goingto=/turf/Sabu/SunagakureH6/UpstairsDownstairs2/ExitL
				EntranceR
					goingto=/turf/Sabu/SunagakureH6/UpstairsDownstairs2/ExitR

				ExitL
					goingto=/turf/Sabu/SunagakureH6/UpstairsDownstairs2/EntranceL
				ExitR
					goingto=/turf/Sabu/SunagakureH6/UpstairsDownstairs2/EntranceR
		SunagakureH7
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Sabu/SunagakureH7/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Sabu/SunagakureH7/EntranceExit/ExitR

				ExitL
					goingto=/turf/Sabu/SunagakureH7/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Sabu/SunagakureH7/EntranceExit/EntranceR
			UpstairsDownstairs1
				EntranceL
					goingto=/turf/Sabu/SunagakureH7/UpstairsDownstairs1/ExitL
				EntranceR
					goingto=/turf/Sabu/SunagakureH7/UpstairsDownstairs1/ExitR

				ExitL
					goingto=/turf/Sabu/SunagakureH7/UpstairsDownstairs1/EntranceL
				ExitR
					goingto=/turf/Sabu/SunagakureH7/UpstairsDownstairs1/EntranceR
			UpstairsDownstairs2
				EntranceL
					goingto=/turf/Sabu/SunagakureH7/UpstairsDownstairs2/ExitL
				EntranceR
					goingto=/turf/Sabu/SunagakureH7/UpstairsDownstairs2/ExitR

				ExitL
					goingto=/turf/Sabu/SunagakureH7/UpstairsDownstairs2/EntranceL
				ExitR
					goingto=/turf/Sabu/SunagakureH7/UpstairsDownstairs2/EntranceR
		SunagakureH8
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Sabu/SunagakureH8/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Sabu/SunagakureH8/EntranceExit/ExitR

				ExitL
					goingto=/turf/Sabu/SunagakureH8/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Sabu/SunagakureH8/EntranceExit/EntranceR
			UpstairsDownstairs1
				EntranceL
					goingto=/turf/Sabu/SunagakureH8/UpstairsDownstairs1/ExitL
				EntranceR
					goingto=/turf/Sabu/SunagakureH8/UpstairsDownstairs1/ExitR

				ExitL
					goingto=/turf/Sabu/SunagakureH8/UpstairsDownstairs1/EntranceL
				ExitR
					goingto=/turf/Sabu/SunagakureH8/UpstairsDownstairs1/EntranceR
			UpstairsDownstairs2
				EntranceL
					goingto=/turf/Sabu/SunagakureH8/UpstairsDownstairs2/ExitL
				EntranceR
					goingto=/turf/Sabu/SunagakureH8/UpstairsDownstairs2/ExitR

				ExitL
					goingto=/turf/Sabu/SunagakureH8/UpstairsDownstairs2/EntranceL
				ExitR
					goingto=/turf/Sabu/SunagakureH8/UpstairsDownstairs2/EntranceR
		SunagakureH9
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Sabu/SunagakureH9/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Sabu/SunagakureH9/EntranceExit/ExitR

				ExitL
					goingto=/turf/Sabu/SunagakureH9/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Sabu/SunagakureH9/EntranceExit/EntranceR
			UpstairsDownstairs1
				EntranceL
					goingto=/turf/Sabu/SunagakureH9/UpstairsDownstairs1/ExitL
				EntranceR
					goingto=/turf/Sabu/SunagakureH9/UpstairsDownstairs1/ExitR

				ExitL
					goingto=/turf/Sabu/SunagakureH9/UpstairsDownstairs1/EntranceL
				ExitR
					goingto=/turf/Sabu/SunagakureH9/UpstairsDownstairs1/EntranceR
			UpstairsDownstairs2
				EntranceL
					goingto=/turf/Sabu/SunagakureH9/UpstairsDownstairs2/ExitL
				EntranceR
					goingto=/turf/Sabu/SunagakureH9/UpstairsDownstairs2/ExitR

				ExitL
					goingto=/turf/Sabu/SunagakureH9/UpstairsDownstairs2/EntranceL
				ExitR
					goingto=/turf/Sabu/SunagakureH9/UpstairsDownstairs2/EntranceR
		SunagakureH10
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Sabu/SunagakureH10/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Sabu/SunagakureH10/EntranceExit/ExitR

				ExitL
					goingto=/turf/Sabu/SunagakureH10/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Sabu/SunagakureH10/EntranceExit/EntranceR
			UpstairsDownstairs1
				EntranceL
					goingto=/turf/Sabu/SunagakureH10/UpstairsDownstairs1/ExitL
				EntranceR
					goingto=/turf/Sabu/SunagakureH10/UpstairsDownstairs1/ExitR

				ExitL
					goingto=/turf/Sabu/SunagakureH10/UpstairsDownstairs1/EntranceL
				ExitR
					goingto=/turf/Sabu/SunagakureH10/UpstairsDownstairs1/EntranceR
			UpstairsDownstairs2
				EntranceL
					goingto=/turf/Sabu/SunagakureH10/UpstairsDownstairs2/ExitL
				EntranceR
					goingto=/turf/Sabu/SunagakureH10/UpstairsDownstairs2/ExitR

				ExitL
					goingto=/turf/Sabu/SunagakureH10/UpstairsDownstairs2/EntranceL
				ExitR
					goingto=/turf/Sabu/SunagakureH10/UpstairsDownstairs2/EntranceR
		SunagakureH11
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Sabu/SunagakureH11/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Sabu/SunagakureH11/EntranceExit/ExitR

				ExitL
					goingto=/turf/Sabu/SunagakureH11/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Sabu/SunagakureH11/EntranceExit/EntranceR
			UpstairsDownstairs1
				EntranceL
					goingto=/turf/Sabu/SunagakureH11/UpstairsDownstairs1/ExitL
				EntranceR
					goingto=/turf/Sabu/SunagakureH11/UpstairsDownstairs1/ExitR

				ExitL
					goingto=/turf/Sabu/SunagakureH11/UpstairsDownstairs1/EntranceL
				ExitR
					goingto=/turf/Sabu/SunagakureH11/UpstairsDownstairs1/EntranceR
			UpstairsDownstairs2
				EntranceL
					goingto=/turf/Sabu/SunagakureH11/UpstairsDownstairs2/ExitL
				EntranceR
					goingto=/turf/Sabu/SunagakureH11/UpstairsDownstairs2/ExitR

				ExitL
					goingto=/turf/Sabu/SunagakureH11/UpstairsDownstairs2/EntranceL
				ExitR
					goingto=/turf/Sabu/SunagakureH11/UpstairsDownstairs2/EntranceR
		SunagakureClanHouse
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Sabu/SunagakureClanHouse/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Sabu/SunagakureClanHouse/EntranceExit/ExitR

				ExitL
					goingto=/turf/Sabu/SunagakureClanHouse/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Sabu/SunagakureClanHouse/EntranceExit/EntranceR
			UpstairsDownstairs1
				EntranceL
					goingto=/turf/Sabu/SunagakureClanHouse/UpstairsDownstairs1/ExitL
				EntranceR
					goingto=/turf/Sabu/SunagakureClanHouse/UpstairsDownstairs1/ExitR

				ExitL
					goingto=/turf/Sabu/SunagakureClanHouse/UpstairsDownstairs1/EntranceL
				ExitR
					goingto=/turf/Sabu/SunagakureClanHouse/UpstairsDownstairs1/EntranceR
			UpstairsDownstairs2
				EntranceL
					goingto=/turf/Sabu/SunagakureClanHouse/UpstairsDownstairs2/ExitL
				EntranceR
					goingto=/turf/Sabu/SunagakureClanHouse/UpstairsDownstairs2/ExitR

				ExitL
					goingto=/turf/Sabu/SunagakureClanHouse/UpstairsDownstairs2/EntranceL
				ExitR
					goingto=/turf/Sabu/SunagakureClanHouse/UpstairsDownstairs2/EntranceR
		KonohaH1
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Sabu/KonohaH1/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Sabu/KonohaH1/EntranceExit/ExitR

				ExitL
					goingto=/turf/Sabu/KonohaH1/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Sabu/KonohaH1/EntranceExit/EntranceR
			UpstairsDownstairs1
				EntranceL
					goingto=/turf/Sabu/KonohaH1/UpstairsDownstairs1/ExitL
				EntranceR
					goingto=/turf/Sabu/KonohaH1/UpstairsDownstairs1/ExitR

				ExitL
					goingto=/turf/Sabu/KonohaH1/UpstairsDownstairs1/EntranceL
				ExitR
					goingto=/turf/Sabu/KonohaH1/UpstairsDownstairs1/EntranceR
			UpstairsDownstairs2
				EntranceL
					goingto=/turf/Sabu/KonohaH1/UpstairsDownstairs2/ExitL
				EntranceR
					goingto=/turf/Sabu/KonohaH1/UpstairsDownstairs2/ExitR

				ExitL
					goingto=/turf/Sabu/KonohaH1/UpstairsDownstairs2/EntranceL
				ExitR
					goingto=/turf/Sabu/KonohaH1/UpstairsDownstairs2/EntranceR
		KonohaH2
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Sabu/KonohaH2/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Sabu/KonohaH2/EntranceExit/ExitR

				ExitL
					goingto=/turf/Sabu/KonohaH2/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Sabu/KonohaH2/EntranceExit/EntranceR
			UpstairsDownstairs1
				EntranceL
					goingto=/turf/Sabu/KonohaH2/UpstairsDownstairs1/ExitL
				EntranceR
					goingto=/turf/Sabu/KonohaH2/UpstairsDownstairs1/ExitR

				ExitL
					goingto=/turf/Sabu/KonohaH2/UpstairsDownstairs1/EntranceL
				ExitR
					goingto=/turf/Sabu/KonohaH2/UpstairsDownstairs1/EntranceR
			UpstairsDownstairs2
				EntranceL
					goingto=/turf/Sabu/KonohaH2/UpstairsDownstairs2/ExitL
				EntranceR
					goingto=/turf/Sabu/KonohaH2/UpstairsDownstairs2/ExitR

				ExitL
					goingto=/turf/Sabu/KonohaH2/UpstairsDownstairs2/EntranceL
				ExitR
					goingto=/turf/Sabu/KonohaH2/UpstairsDownstairs2/EntranceR
		KonohaH3
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Sabu/KonohaH3/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Sabu/KonohaH3/EntranceExit/ExitR

				ExitL
					goingto=/turf/Sabu/KonohaH3/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Sabu/KonohaH3/EntranceExit/EntranceR
			UpstairsDownstairs1
				EntranceL
					goingto=/turf/Sabu/KonohaH3/UpstairsDownstairs1/ExitL
				EntranceR
					goingto=/turf/Sabu/KonohaH3/UpstairsDownstairs1/ExitR

				ExitL
					goingto=/turf/Sabu/KonohaH3/UpstairsDownstairs1/EntranceL
				ExitR
					goingto=/turf/Sabu/KonohaH3/UpstairsDownstairs1/EntranceR
			UpstairsDownstairs2
				EntranceL
					goingto=/turf/Sabu/KonohaH3/UpstairsDownstairs2/ExitL
				EntranceR
					goingto=/turf/Sabu/KonohaH3/UpstairsDownstairs2/ExitR

				ExitL
					goingto=/turf/Sabu/KonohaH3/UpstairsDownstairs2/EntranceL
				ExitR
					goingto=/turf/Sabu/KonohaH3/UpstairsDownstairs2/EntranceR
		KonohaH4
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Sabu/KonohaH4/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Sabu/KonohaH4/EntranceExit/ExitR

				ExitL
					goingto=/turf/Sabu/KonohaH4/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Sabu/KonohaH4/EntranceExit/EntranceR
			UpstairsDownstairs1
				EntranceL
					goingto=/turf/Sabu/KonohaH4/UpstairsDownstairs1/ExitL
				EntranceR
					goingto=/turf/Sabu/KonohaH4/UpstairsDownstairs1/ExitR

				ExitL
					goingto=/turf/Sabu/KonohaH4/UpstairsDownstairs1/EntranceL
				ExitR
					goingto=/turf/Sabu/KonohaH4/UpstairsDownstairs1/EntranceR
			UpstairsDownstairs2
				EntranceL
					goingto=/turf/Sabu/KonohaH4/UpstairsDownstairs2/ExitL
				EntranceR
					goingto=/turf/Sabu/KonohaH4/UpstairsDownstairs2/ExitR

				ExitL
					goingto=/turf/Sabu/KonohaH4/UpstairsDownstairs2/EntranceL
				ExitR
					goingto=/turf/Sabu/KonohaH4/UpstairsDownstairs2/EntranceR
		KonohaH5
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Sabu/KonohaH5/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Sabu/KonohaH5/EntranceExit/ExitR

				ExitL
					goingto=/turf/Sabu/KonohaH5/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Sabu/KonohaH5/EntranceExit/EntranceR
			UpstairsDownstairs1
				EntranceL
					goingto=/turf/Sabu/KonohaH5/UpstairsDownstairs1/ExitL
				EntranceR
					goingto=/turf/Sabu/KonohaH5/UpstairsDownstairs1/ExitR

				ExitL
					goingto=/turf/Sabu/KonohaH5/UpstairsDownstairs1/EntranceL
				ExitR
					goingto=/turf/Sabu/KonohaH5/UpstairsDownstairs1/EntranceR
			UpstairsDownstairs2
				EntranceL
					goingto=/turf/Sabu/KonohaH5/UpstairsDownstairs2/ExitL
				EntranceR
					goingto=/turf/Sabu/KonohaH5/UpstairsDownstairs2/ExitR

				ExitL
					goingto=/turf/Sabu/KonohaH5/UpstairsDownstairs2/EntranceL
				ExitR
					goingto=/turf/Sabu/KonohaH5/UpstairsDownstairs2/EntranceR
		KonohaH6
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Sabu/KonohaH6/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Sabu/KonohaH6/EntranceExit/ExitR

				ExitL
					goingto=/turf/Sabu/KonohaH6/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Sabu/KonohaH6/EntranceExit/EntranceR
			UpstairsDownstairs1
				EntranceL
					goingto=/turf/Sabu/KonohaH6/UpstairsDownstairs1/ExitL
				EntranceR
					goingto=/turf/Sabu/KonohaH6/UpstairsDownstairs1/ExitR

				ExitL
					goingto=/turf/Sabu/KonohaH6/UpstairsDownstairs1/EntranceL
				ExitR
					goingto=/turf/Sabu/KonohaH6/UpstairsDownstairs1/EntranceR
			UpstairsDownstairs2
				EntranceL
					goingto=/turf/Sabu/KonohaH6/UpstairsDownstairs2/ExitL
				EntranceR
					goingto=/turf/Sabu/KonohaH6/UpstairsDownstairs2/ExitR

				ExitL
					goingto=/turf/Sabu/KonohaH6/UpstairsDownstairs2/EntranceL
				ExitR
					goingto=/turf/Sabu/KonohaH6/UpstairsDownstairs2/EntranceR
		KonohaH7
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Sabu/KonohaH7/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Sabu/KonohaH7/EntranceExit/ExitR

				ExitL
					goingto=/turf/Sabu/KonohaH7/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Sabu/KonohaH7/EntranceExit/EntranceR
			UpstairsDownstairs1
				EntranceL
					goingto=/turf/Sabu/KonohaH7/UpstairsDownstairs1/ExitL
				EntranceR
					goingto=/turf/Sabu/KonohaH7/UpstairsDownstairs1/ExitR

				ExitL
					goingto=/turf/Sabu/KonohaH7/UpstairsDownstairs1/EntranceL
				ExitR
					goingto=/turf/Sabu/KonohaH7/UpstairsDownstairs1/EntranceR
			UpstairsDownstairs2
				EntranceL
					goingto=/turf/Sabu/KonohaH7/UpstairsDownstairs2/ExitL
				EntranceR
					goingto=/turf/Sabu/KonohaH7/UpstairsDownstairs2/ExitR

				ExitL
					goingto=/turf/Sabu/KonohaH7/UpstairsDownstairs2/EntranceL
				ExitR
					goingto=/turf/Sabu/KonohaH7/UpstairsDownstairs2/EntranceR
		KonohaH8
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Sabu/KonohaH8/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Sabu/KonohaH8/EntranceExit/ExitR

				ExitL
					goingto=/turf/Sabu/KonohaH8/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Sabu/KonohaH8/EntranceExit/EntranceR
			UpstairsDownstairs1
				EntranceL
					goingto=/turf/Sabu/KonohaH8/UpstairsDownstairs1/ExitL
				EntranceR
					goingto=/turf/Sabu/KonohaH8/UpstairsDownstairs1/ExitR

				ExitL
					goingto=/turf/Sabu/KonohaH8/UpstairsDownstairs1/EntranceL
				ExitR
					goingto=/turf/Sabu/KonohaH8/UpstairsDownstairs1/EntranceR
			UpstairsDownstairs2
				EntranceL
					goingto=/turf/Sabu/KonohaH8/UpstairsDownstairs2/ExitL
				EntranceR
					goingto=/turf/Sabu/KonohaH8/UpstairsDownstairs2/ExitR

				ExitL
					goingto=/turf/Sabu/KonohaH8/UpstairsDownstairs2/EntranceL
				ExitR
					goingto=/turf/Sabu/KonohaH8/UpstairsDownstairs2/EntranceR
		KonohaH9
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Sabu/KonohaH9/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Sabu/KonohaH9/EntranceExit/ExitR

				ExitL
					goingto=/turf/Sabu/KonohaH9/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Sabu/KonohaH9/EntranceExit/EntranceR
			UpstairsDownstairs1
				EntranceL
					goingto=/turf/Sabu/KonohaH9/UpstairsDownstairs1/ExitL
				EntranceR
					goingto=/turf/Sabu/KonohaH9/UpstairsDownstairs1/ExitR

				ExitL
					goingto=/turf/Sabu/KonohaH9/UpstairsDownstairs1/EntranceL
				ExitR
					goingto=/turf/Sabu/KonohaH9/UpstairsDownstairs1/EntranceR
			UpstairsDownstairs2
				EntranceL
					goingto=/turf/Sabu/KonohaH9/UpstairsDownstairs2/ExitL
				EntranceR
					goingto=/turf/Sabu/KonohaH9/UpstairsDownstairs2/ExitR

				ExitL
					goingto=/turf/Sabu/KonohaH9/UpstairsDownstairs2/EntranceL
				ExitR
					goingto=/turf/Sabu/KonohaH9/UpstairsDownstairs2/EntranceR
		KonohaH10
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Sabu/KonohaH10/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Sabu/KonohaH10/EntranceExit/ExitR

				ExitL
					goingto=/turf/Sabu/KonohaH10/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Sabu/KonohaH10/EntranceExit/EntranceR
			UpstairsDownstairs1
				EntranceL
					goingto=/turf/Sabu/KonohaH10/UpstairsDownstairs1/ExitL
				EntranceR
					goingto=/turf/Sabu/KonohaH10/UpstairsDownstairs1/ExitR

				ExitL
					goingto=/turf/Sabu/KonohaH10/UpstairsDownstairs1/EntranceL
				ExitR
					goingto=/turf/Sabu/KonohaH10/UpstairsDownstairs1/EntranceR
			UpstairsDownstairs2
				EntranceL
					goingto=/turf/Sabu/KonohaH10/UpstairsDownstairs2/ExitL
				EntranceR
					goingto=/turf/Sabu/KonohaH10/UpstairsDownstairs2/ExitR

				ExitL
					goingto=/turf/Sabu/KonohaH10/UpstairsDownstairs2/EntranceL
				ExitR
					goingto=/turf/Sabu/KonohaH10/UpstairsDownstairs2/EntranceR
		KonohaH11
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Sabu/KonohaH11/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Sabu/KonohaH11/EntranceExit/ExitR

				ExitL
					goingto=/turf/Sabu/KonohaH11/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Sabu/KonohaH11/EntranceExit/EntranceR
			UpstairsDownstairs1
				EntranceL
					goingto=/turf/Sabu/KonohaH11/UpstairsDownstairs1/ExitL
				EntranceR
					goingto=/turf/Sabu/KonohaH11/UpstairsDownstairs1/ExitR

				ExitL
					goingto=/turf/Sabu/KonohaH11/UpstairsDownstairs1/EntranceL
				ExitR
					goingto=/turf/Sabu/KonohaH11/UpstairsDownstairs1/EntranceR
			UpstairsDownstairs2
				EntranceL
					goingto=/turf/Sabu/KonohaH11/UpstairsDownstairs2/ExitL
				EntranceR
					goingto=/turf/Sabu/KonohaH11/UpstairsDownstairs2/ExitR

				ExitL
					goingto=/turf/Sabu/KonohaH11/UpstairsDownstairs2/EntranceL
				ExitR
					goingto=/turf/Sabu/KonohaH11/UpstairsDownstairs2/EntranceR
		KonohaClanHouse
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Sabu/KonohaClanHouse/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Sabu/KonohaClanHouse/EntranceExit/ExitR

				ExitL
					goingto=/turf/Sabu/KonohaClanHouse/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Sabu/KonohaClanHouse/EntranceExit/EntranceR
			UpstairsDownstairs1
				EntranceL
					goingto=/turf/Sabu/KonohaClanHouse/UpstairsDownstairs1/ExitL
				EntranceR
					goingto=/turf/Sabu/KonohaClanHouse/UpstairsDownstairs1/ExitR

				ExitL
					goingto=/turf/Sabu/KonohaClanHouse/UpstairsDownstairs1/EntranceL
				ExitR
					goingto=/turf/Sabu/KonohaClanHouse/UpstairsDownstairs1/EntranceR
			UpstairsDownstairs2
				EntranceL
					goingto=/turf/Sabu/KonohaClanHouse/UpstairsDownstairs2/ExitL
				EntranceR
					goingto=/turf/Sabu/KonohaClanHouse/UpstairsDownstairs2/ExitR

				ExitL
					goingto=/turf/Sabu/KonohaClanHouse/UpstairsDownstairs2/EntranceL
				ExitR
					goingto=/turf/Sabu/KonohaClanHouse/UpstairsDownstairs2/EntranceR
		KiriProjects
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Sabu/KiriProjects/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Sabu/KiriProjects/EntranceExit/ExitR

				ExitL
					goingto=/turf/Sabu/KiriProjects/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Sabu/KiriProjects/EntranceExit/EntranceR
			UpstairsDownstairs1
				EntranceL
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs1/ExitL
				EntranceR
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs1/ExitR

				ExitL
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs1/EntranceL
				ExitR
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs1/EntranceR
			UpstairsDownstairs2
				EntranceL
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs2/ExitL
				EntranceR
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs2/ExitR

				ExitL
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs2/EntranceL
				ExitR
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs2/EntranceR
			UpstairsDownstairs3
				EntranceL
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs3/ExitL
				EntranceR
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs3/ExitR

				ExitL
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs3/EntranceL
				ExitR
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs3/EntranceR
			UpstairsDownstairs4
				EntranceL
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs4/ExitL
				EntranceR
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs4/ExitR

				ExitL
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs4/EntranceL
				ExitR
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs4/EntranceR
			UpstairsDownstairs5
				EntranceL
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs5/ExitL
				EntranceR
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs5/ExitR

				ExitL
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs5/EntranceL
				ExitR
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs5/EntranceR
			UpstairsDownstairs6
				EntranceL
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs6/ExitL
				EntranceR
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs6/ExitR

				ExitL
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs6/EntranceL
				ExitR
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs6/EntranceR
			UpstairsDownstairs7
				EntranceL
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs7/ExitL
				EntranceR
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs7/ExitR

				ExitL
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs7/EntranceL
				ExitR
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs7/EntranceR
			UpstairsDownstairs8
				EntranceL
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs8/ExitL
				EntranceR
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs8/ExitR

				ExitL
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs8/EntranceL
				ExitR
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs8/EntranceR
			UpstairsDownstairs9
				EntranceL
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs9/ExitL
				EntranceR
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs9/ExitR

				ExitL
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs9/EntranceL
				ExitR
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs9/EntranceR
			UpstairsDownstairs10
				EntranceL
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs10/ExitL
				EntranceR
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs10/ExitR

				ExitL
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs10/EntranceL
				ExitR
					goingto=/turf/Sabu/KiriProjects/UpstairsDownstairs10/EntranceR

		CongShops
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return


				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))

				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			WeaponEntranceExit
				EntranceL
					goingto=/turf/Sabu/CongShops/WeaponEntranceExit/ExitL
				EntranceR
					goingto=/turf/Sabu/CongShops/WeaponEntranceExit/ExitR

				ExitL
					goingto=/turf/Sabu/CongShops/WeaponEntranceExit/EntranceL
				ExitR
					goingto=/turf/Sabu/CongShops/WeaponEntranceExit/EntranceR
			ClothesEntranceExit
				EntranceL
					goingto=/turf/Sabu/CongShops/ClothesEntranceExit/ExitL
				EntranceR
					goingto=/turf/Sabu/CongShops/ClothesEntranceExit/ExitR

				ExitL
					goingto=/turf/Sabu/CongShops/ClothesEntranceExit/EntranceL
				ExitR
					goingto=/turf/Sabu/CongShops/ClothesEntranceExit/EntranceR
		CongLibrary
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return


				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))

				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			LibraryEntranceExit
				EntranceL
					goingto=/turf/Sabu/CongLibrary/LibraryEntranceExit/ExitL
				EntranceR
					goingto=/turf/Sabu/CongLibrary/LibraryEntranceExit/ExitR

				ExitL
					goingto=/turf/Sabu/CongLibrary/LibraryEntranceExit/EntranceL
				ExitR
					goingto=/turf/Sabu/CongLibrary/LibraryEntranceExit/EntranceR
		KiriClanHouse
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Sabu/KiriClanHouse/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Sabu/KiriClanHouse/EntranceExit/ExitR

				ExitL
					goingto=/turf/Sabu/KiriClanHouse/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Sabu/KiriClanHouse/EntranceExit/EntranceR
			UpstairsDownstairs1
				EntranceL
					goingto=/turf/Sabu/KiriClanHouse/UpstairsDownstairs1/ExitL
				EntranceR
					goingto=/turf/Sabu/KiriClanHouse/UpstairsDownstairs1/ExitR

				ExitL
					goingto=/turf/Sabu/KiriClanHouse/UpstairsDownstairs1/EntranceL
				ExitR
					goingto=/turf/Sabu/KiriClanHouse/UpstairsDownstairs1/EntranceR
			UpstairsDownstairs2
				EntranceL
					goingto=/turf/Sabu/KiriClanHouse/UpstairsDownstairs2/ExitL
				EntranceR
					goingto=/turf/Sabu/KiriClanHouse/UpstairsDownstairs2/ExitR

				ExitL
					goingto=/turf/Sabu/KiriClanHouse/UpstairsDownstairs2/EntranceL
				ExitR
					goingto=/turf/Sabu/KiriClanHouse/UpstairsDownstairs2/EntranceR
		elitedistrict
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Sabu/elitedistrict/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Sabu/elitedistrict/EntranceExit/ExitR

				ExitL
					goingto=/turf/Sabu/elitedistrict/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Sabu/elitedistrict/EntranceExit/EntranceR
			UpstairsDownstairs1
				EntranceL
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs1/ExitL
				EntranceR
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs1/ExitR

				ExitL
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs1/EntranceL
				ExitR
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs1/EntranceR
			UpstairsDownstairs2
				EntranceL
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs2/ExitL
				EntranceR
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs2/ExitR

				ExitL
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs2/EntranceL
				ExitR
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs2/EntranceR
			UpstairsDownstairs3
				EntranceL
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs3/ExitL
				EntranceR
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs3/ExitR

				ExitL
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs3/EntranceL
				ExitR
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs3/EntranceR
			UpstairsDownstairs4
				EntranceL
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs4/ExitL
				EntranceR
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs4/ExitR

				ExitL
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs4/EntranceL
				ExitR
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs4/EntranceR
			UpstairsDownstairs5
				EntranceL
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs5/ExitL
				EntranceR
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs5/ExitR

				ExitL
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs5/EntranceL
				ExitR
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs5/EntranceR
			UpstairsDownstairs6
				EntranceL
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs6/ExitL
				EntranceR
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs6/ExitR

				ExitL
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs6/EntranceL
				ExitR
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs6/EntranceR
			UpstairsDownstairs7
				EntranceL
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs7/ExitL
				EntranceR
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs7/ExitR

				ExitL
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs7/EntranceL
				ExitR
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs7/EntranceR
			UpstairsDownstairs8
				EntranceL
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs8/ExitL
				EntranceR
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs8/ExitR

				ExitL
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs8/EntranceL
				ExitR
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs8/EntranceR
			UpstairsDownstairs9
				EntranceL
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs9/ExitL
				EntranceR
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs9/ExitR

				ExitL
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs9/EntranceL
				ExitR
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs9/EntranceR
			UpstairsDownstairs10
				EntranceL
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs10/ExitL
				EntranceR
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs10/ExitR

				ExitL
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs10/EntranceL
				ExitR
					goingto=/turf/Sabu/elitedistrict/UpstairsDownstairs10/EntranceR
		eliteClanHouse
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
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
					goingto=/turf/Sabu/eliteClanHouse/EntranceExit/ExitL
				EntranceR
					goingto=/turf/Sabu/eliteClanHouse/EntranceExit/ExitR

				ExitL
					goingto=/turf/Sabu/eliteClanHouse/EntranceExit/EntranceL
				ExitR
					goingto=/turf/Sabu/eliteClanHouse/EntranceExit/EntranceR
			UpstairsDownstairs1
				EntranceL
					goingto=/turf/Sabu/eliteClanHouse/UpstairsDownstairs1/ExitL
				EntranceR
					goingto=/turf/Sabu/eliteClanHouse/UpstairsDownstairs1/ExitR

				ExitL
					goingto=/turf/Sabu/eliteClanHouse/UpstairsDownstairs1/EntranceL
				ExitR
					goingto=/turf/Sabu/eliteClanHouse/UpstairsDownstairs1/EntranceR
			UpstairsDownstairs2
				EntranceL
					goingto=/turf/Sabu/eliteClanHouse/UpstairsDownstairs2/ExitL
				EntranceR
					goingto=/turf/Sabu/eliteClanHouse/UpstairsDownstairs2/ExitR

				ExitL
					goingto=/turf/Sabu/eliteClanHouse/UpstairsDownstairs2/EntranceL
				ExitR
					goingto=/turf/Sabu/eliteClanHouse/UpstairsDownstairs2/EntranceR
		CongAcademy
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return


				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))

				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)
			AcademyEntranceExit
				EntranceL
					goingto=/turf/Sabu/CongAcademy/AcademyEntranceExit/ExitL
				EntranceR
					goingto=/turf/Sabu/CongAcademy/AcademyEntranceExit/ExitR

				ExitL
					goingto=/turf/Sabu/CongAcademy/AcademyEntranceExit/EntranceL
				ExitR
					goingto=/turf/Sabu/CongAcademy/AcademyEntranceExit/EntranceR
			Upstairsdownstairs1
				EntranceL
					goingto=/turf/Sabu/CongAcademy/Upstairsdownstairs1/ExitL
				EntranceR
					goingto=/turf/Sabu/CongAcademy/Upstairsdownstairs1/ExitR

				ExitL
					goingto=/turf/Sabu/CongAcademy/Upstairsdownstairs1/EntranceL
				ExitR
					goingto=/turf/Sabu/CongAcademy/Upstairsdownstairs1/EntranceR