/*turf
	KaguyaWarp
		Caves
			layer=999
			density=0
			var/goingto
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return


				M.teleporting = 1
				M.density = 0
				M.Move(locate(goingto))


			Exited()
				usr.layer=initial(usr.layer)


		KaguyaBase
			OutsideCaveL
				var/goingto = turf/KaguyaWarp/Caves/KaguyaBase/InsideCaveU
			InsideCaveU
				var/goingto = turf/KaguyaWarp/Caves/KaguyaBase/OutsideCaveL
				*/

turf/KaguyaCaveOL
  Entered(atom/movable/A)
    if(ismob(A)) // check if the enterer is a mob
      var/mob/M = A // type cast
      if(M.client) // check if the enterer has a client controlling it (ie. a player)
        M.loc = locate(1,58,25)
    return ..()
turf/KaguyaCaveOR
	Entered(atom/movable/A)
		if(ismob(A)) // check if the enterer is a mob
			var/mob/M = A // type cast
			if(M.client) // check if the enterer has a client controlling it (ie. a player)
				M.loc = locate(1,57,25)
		return ..()
