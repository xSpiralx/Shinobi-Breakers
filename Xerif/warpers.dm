turf
	Tanzaku
		Houses
			layer=999
			density=0
			var/goingto
			var/goingto_reception_id
			Entered(mob/M)
				if(!ismob(M)) return
				if(M.teleporting) return


				M.teleporting = 1
				M.density = 0
				var/turf/t
				for(var/turf/Tanzaku/Houses/w)
					if(w.goingto_reception_id == goingto)
						t = w
						break
				M.Move(t)

				M.teleporting = 0
				M.density = 1
			Exited()
				usr.layer=initial(usr.layer)

//archive/var/list/missions = list()