turf/newturf
	Buildings
		Base
			icon='NEWNEWBUILDING.dmi'

		BrownRoof
			icon='brownroofs.dmi'

		BlueRoof
			icon='blueroofs.dmi'

		GreenRoof
			icon='greenroofs.dmi'

		RedRoof
			icon='redroofs.dmi'

		Misc
			icon='newbuildings.dmi'

		KonoWalls
			icon='konoWalls.dmi'

		KiriWalls
			icon='kiriWalls.dmi'

		Windows
			icon='NewWindows.dmi'

		BuildingMisc
			icon='BuildingMisc.dmi'

		GroundMisc
			icon='exteriormisc.dmi'


	CityTurfs
		Sidewalk
			icon='sidewalk.dmi'
		Cliff
			icon='newturf.dmi'
		Fence
			icon='Fence.dmi'

	Tools
		Buildingshadows
			icon='building shadows.dmi'
			layer=999
		BuildingshadowsLARGE
			icon='building shadowsl.dmi'
obj/NewBuildings
	DoorA
		icon='door1.dmi'
		icon_state="close"
		density=1
		var/Opacity=0
		var/password=null
		var/Locked=0
		New()
			..()
			if(Opacity)
				opacity=1
		Click()
			if(get_dist(src,usr)>1) return
			if(usr.RecentVerbCheck("Knock", 100,1)) return
			usr.recentverbs["Knock"]=world.realtime
			var/GoesHome=0
			var/turf/T=src.loc
			if(!T) return
			if(istype(T,/turf/WARPERHOMES/)) GoesHome=T
			if(istype(T,/turf/WARPEREXTRA/)) GoesHome=T
			if(istype(T,/turf/WARPERSUNA/)) GoesHome=T
			if(istype(T,/turf/WARPERHOMESKIRI/)) GoesHome=T
			if(istype(T,/turf/WARPERCOUNTRY/)) GoesHome=T
			if(GoesHome)
				for(var/mob/M in range(14))
					M<<output("[usr] knocks on the door.","ICout")
				for(var/mob/M in range(14,GoesHome:goingto))
					M<<output("[usr] knocks on the door.","ICout")
			else
				for(var/mob/M in range(14))
					M<<output("[usr] knocks on the door.","ICout")
		proc/Open()
			layer=11
			flick("opening",src)
			icon_state="open"
			if(Opacity) opacity=0
			density=0
			spawn(30)
				flick("closing",src)
				icon_state="close"
				density=1
				layer=25
				if(Opacity) opacity=1
	DoorRa
		icon='door2.dmi'
		icon_state="close"
		density=1
		var/Opacity=0
		var/password=null
		var/Locked=0
		New()
			..()
			if(Opacity)
				opacity=1
		Click()
			if(get_dist(src,usr)>1) return
			if(usr.RecentVerbCheck("Knock", 100,1)) return
			usr.recentverbs["Knock"]=world.realtime
			var/GoesHome=0
			var/turf/T=src.loc
			if(!T) return
			if(istype(T,/turf/WARPERHOMES/)) GoesHome=T
			if(istype(T,/turf/WARPEREXTRA/)) GoesHome=T
			if(istype(T,/turf/WARPERSUNA/)) GoesHome=T
			if(istype(T,/turf/WARPERHOMESKIRI/)) GoesHome=T
			if(istype(T,/turf/WARPERCOUNTRY/)) GoesHome=T
			if(GoesHome)
				for(var/mob/M in range(14))
					M<<output("[usr] knocks on the door.","ICout")
				for(var/mob/M in range(14,GoesHome:goingto))
					M<<output("[usr] knocks on the door.","ICout")
			else
				for(var/mob/M in range(14))
					M<<output("[usr] knocks on the door.","ICout")
		proc/Open()
			layer=11
			flick("opening",src)
			icon_state="open"
			if(Opacity) opacity=0
			density=0
			spawn(30)
				flick("closing",src)
				icon_state="close"
				density=1
				layer=25
				if(Opacity) opacity=1
	DoorLa
		icon='door2.dmi'
		icon_state="close1"
		density=1
		var/Opacity=0
		var/password=null
		var/Locked=0
		New()
			..()
			if(Opacity)
				opacity=1
		Click()
			if(get_dist(src,usr)>1) return
			if(usr.RecentVerbCheck("Knock", 100,1)) return
			usr.recentverbs["Knock"]=world.realtime
			var/GoesHome=0
			var/turf/T=src.loc
			if(!T) return
			if(istype(T,/turf/WARPERHOMES/)) GoesHome=T
			if(istype(T,/turf/WARPEREXTRA/)) GoesHome=T
			if(istype(T,/turf/WARPERSUNA/)) GoesHome=T
			if(istype(T,/turf/WARPERHOMESKIRI/)) GoesHome=T
			if(istype(T,/turf/WARPERCOUNTRY/)) GoesHome=T
			if(GoesHome)
				for(var/mob/M in range(14))
					M<<output("[usr] knocks on the door.","ICout")
				for(var/mob/M in range(14,GoesHome:goingto))
					M<<output("[usr] knocks on the door.","ICout")
			else
				for(var/mob/M in range(14))
					M<<output("[usr] knocks on the door.","ICout")
		proc/Open()
			layer=11
			flick("opening1",src)
			icon_state="open1"
			if(Opacity) opacity=0
			density=0
			spawn(30)
				layer=25
				flick("closing1",src)
				icon_state="close1"
				density=1
				layer=25
				if(Opacity) opacity=1