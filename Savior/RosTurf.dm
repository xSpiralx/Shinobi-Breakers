


area
	mouse_opacity=0
	Caves
	rain
	Interior
		layer = 1
		luminosity=1
		NoShunshin
			luminosity=1
		New()
			..()
			layer = 99
	AlwaysLit
	TutIsland
/*	Exterior
		layer				= EFFECTS_LAYER
		appearance_flags	= NO_CLIENT_COLOR
		New()
			..()
			switch(Climate)
				if("Temperate")
					for(var/turf/t in contents)
						temperate_turfs += t
				if("Arid")
					for(var/turf/t in contents)
						arid_turfs += t
				if("Amegakure")
					for(var/turf/t in contents)
						Amegakure_turfs += t
				if("Frozen")
					for(var/turf/t in contents)
						frozen_turfs += t
			del src
		var/Climate="Temperate"
		SunaDesert
			Climate="Arid"
		KiriOutside
			Climate="Amegakure"
		SnowOutside
			Climate="Frozen"*/






	Exterior
		//var/Climate="Konohagakure"
		layer				= 999
		plane = 99
		Konoha
			Climate="Konohagakure"
		Ame
			Climate="Amegakure"





