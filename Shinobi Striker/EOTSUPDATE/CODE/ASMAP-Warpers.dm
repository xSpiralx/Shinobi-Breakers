obj
	proc
		Steppedon(mob/M)
		..()
		Steppedoff(mob/M)
		..()



atom/movable/var/tmp/teleporting = 0
obj/items/Key/MouseDrop(over_object,src_location,over_location, src_control,over_control,params)
	if(istype(over_object,/obj/Container))
		var/obj/Container/O=over_object
		if(!O.password) return
		if(get_dist(O,usr)>1) return
		if(src.Passcode==O.password)
			O.Locked=!O.Locked
			usr<<output("<font size = -3>You've [O.Locked ? "locked" : "unlocked"] the [O.ContainerName].","outputic.output")
			usr<<output("<font size = -3>You've [O.Locked ? "locked" : "unlocked"] the [O.ContainerName].","outputall.output")
		else
			usr<<output("<font size = -3>This key doesn't seem to fit the [O.ContainerName].","outputic.output")
			usr<<output("<font size = -3>This key doesn't seem to fit the [O.ContainerName].","outputall.output")
	if(istype(over_object,/obj/building/DoorR) || istype(over_object,/obj/building/DoorL))
		var/obj/building/DoorR/O=over_object
		if(get_dist(O,usr)>1) return
		if(src.Passcode==O.password)
			O.Locked=!O.Locked
			usr<<output("<font size = -3>You've [O.Locked ? "locked" : "unlocked"] the door.","outputic.output")
			usr<<output("<font size = -3>You've [O.Locked ? "locked" : "unlocked"] the door.","outputall.output")
		else
			usr<<output("<font size = -3>This key doesn't seem to fit the door.","outputic.output")
			usr<<output("<font size = -3>This key doesn't seem to fit the door.","outputall.output")
	..()

turf
	Exited(M)
		if(istype(M,/mob))
			for(var/obj/A in src)
				var/obj/O = A
				for(O in src) if(istype(O)) O.Steppedoff(M)
		return ..()
	Entered(M)
		if(istype(M,/mob))
			var/obj/O
			for(O in src) if(istype(O)) O.Steppedon(M)
		return ..()
mob/Bump(atom/O)
	if(istype(O,/obj/building/DoorR))
		var/list/HasKey=list()
		for(var/obj/items/Key/K in usr.contents)
			HasKey+=K
		for(var/obj/items/Key/K in HasKey)
			if(K.Passcode==O:password&&O:Locked)
				usr<<output("<font size = -3>You twist the key into the keyhole, and lock it behind you.","outputic.output")
				usr<<output("<font size = -3>You twist the key into the keyhole, and lock it behind you.","outputall.output")
				O:Open()
				return
		if(usr.getPerk("Lockpick"))
			usr<<output("<font size = -3>You skillfully pick the lock, and close the door behind you.","outputic.output")
			usr<<output("<font size = -3>You skillfully pick the lock, and close the door behind you.","outputall.output")
			O:Open()

			for(var/obj/Technology/Camera/C in view(20,usr)) C.appendToLog("<font size=-3><b><span style=\"color:[usr.SayFont]\">[usr] picks a nearby door.</b></font></span>")
			return
		if(O:Locked)
			usr<<output("<font size = -3>Locked.","outputic.output")
			usr<<output("<font size = -3>Locked.","outputall.output")
			return
		O:Open()
	if(istype(O,/obj/building/DoorL))
		var/list/HasKey=list()
		for(var/obj/items/Key/K in usr.contents)
			HasKey+=K
		for(var/obj/items/Key/K in HasKey)
			if(K.Passcode==O:password&&O:Locked)
				usr<<output("<font size = -3>You twist the key into the keyhole, and lock it behind you.","outputic.output")
				usr<<output("<font size = -3>You twist the key into the keyhole, and lock it behind you.","outputall.output")
				O:Open()
				return
		if(usr.getPerk("Lockpick"))
			usr<<output("<font size = -3>You skillfully pick the lock, and close the door behind you.","outputic.output")
			usr<<output("<font size = -3>You skillfully pick the lock, and close the door behind you.","outputall.output")
			O:Open()
			return
		if(O:Locked)
			usr<<output("<font size = -3>Locked.","outputic.output")
			usr<<output("<font size = -3>Locked.","outputall.output")
			return
	if(istype(O,/obj/Snow/door1))
		var/list/HasKey=list()
		for(var/obj/items/Key/K in usr.contents)
			HasKey+=K
		for(var/obj/items/Key/K in HasKey)
			if(K.Passcode==O:password&&O:Locked)
				usr<<output("<font size = -3>You twist the key into the keyhole, and lock it behind you.","outputic.output")
				usr<<output("<font size = -3>You twist the key into the keyhole, and lock it behind you.","outputall.output")
				O:Open()
				return
		if(usr.getPerk("Lockpick"))
			usr<<output("<font size = -3>You skillfully pick the lock, and close the door behind you.","outputic.output")
			usr<<output("<font size = -3>You skillfully pick the lock, and close the door behind you.","outputall.output")
			O:Open()

			for(var/obj/Technology/Camera/C in view(20,usr)) C.appendToLog("<font size=-3><b><span style=\"color:[usr.SayFont]\">[usr] picks a nearby door.</b></font></span>")
			return
		if(O:Locked)
			usr<<output("<font size = -3>Locked.","outputic.output")
			usr<<output("<font size = -3>Locked.","outputall.output")
			return
		O:Open()
	if(istype(O,/obj/building/CDoor))
		if(skinput2("This door requires a password.(Blank to close)","Password")==O:password)
			O:Open()
obj/items/Key
	icon='Key.dmi'
	var/Passcode=null
	verb/Rename_Key()
		name=input(usr,". Name","Edit Name",name) as text
		if(length(name)>20 || length(name)<3)
			usr.custom_alert("The name must be between 3 and 20 characters.")
			src.name = "Key"
			return
		if(uppertext(src.name) == src.name)
			usr.custom_alert("Your name may not consist entirely of capital letters.")
			src.name = "Key"
			return
		if(filter_characters(src.name)!=src.name)
			usr.custom_alert("\"[src.name]\" contains an invalid character.  Allowed characters are:\n[allowed_characters_name]")
			name = "Key"
			return
		if(name==""||findtext(name,"\n"))
			usr.custom_alert("You name contains an invalid character.")
			name="Key"
			return

var/list/OutsideZLevels = list(1,3,5,7,9,11,13,15,17,18,20,22,24)
obj/building
	DoorR
		icon='door.dmi'
		icon_state="close1"
		density=1
		var/Opacity=0
		var/password=null
		var/Locked=0
		New()
			..()
			layer = 40
			if(src.z in OutsideZLevels)
				opacity = 0
				Opacity = 0
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
			if(istype(T,/turf/WARPERCLANS/)) GoesHome=T
			if(GoesHome)
				for(var/mob/M in range(14))
					M<<output("<font size = -3>[M.getStrangerName(usr)] knocks on the door.","outputic.output")
					M<<output("<font size = -3>[M.getStrangerName(usr)] knocks on the door.","outputall.output")
				for(var/mob/M in range(14,locate(GoesHome:goingto)))
					M<<output("<font size = -3>[M.getStrangerName(usr)] knocks on the door.","outputic.output")
					M<<output("<font size = -3>[M.getStrangerName(usr)] knocks on the door.","outputall.output")
			else
				for(var/mob/M in range(14))
					M<<output("<font size = -3>[M.getStrangerName(usr)] knocks on the door.","outputic.output")
					M<<output("<font size = -3>[M.getStrangerName(usr)] knocks on the door.","outputall.output")
		proc/Open()
			layer=40
			flick("opening1",src)
			icon_state="open1"
			if(Opacity) opacity=0
			density=0
			spawn(30)
				for(var/mob/M in src.loc)
					if(M)
						while(M in src.loc) sleep(1)
				flick("closing1",src)
				icon_state="close1"
				density=1
				layer=40

				if(Opacity) opacity=1
	DoorL
		icon='door.dmi'
		icon_state="close2"
		density=1
		var/Opacity=0
		var/password=null
		var/Locked=0
		New()
			..()
			layer = 40
			if(src.z in OutsideZLevels)
				opacity = 0
				Opacity = 0
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
					M<<output("<font size = -3>[M.getStrangerName(usr)] knocks on the door.","outputic.output")
					M<<output("<font size = -3>[M.getStrangerName(usr)] knocks on the door.","outputall.output")
				for(var/mob/M in range(14,GoesHome:goingto))
					M<<output("<font size = -3>[M.getStrangerName(usr)] knocks on the door.","outputic.output")
					M<<output("<font size = -3>[M.getStrangerName(usr)] knocks on the door.","outputall.output")
			else
				for(var/mob/M in range(14))
					M<<output("<font size = -3>[M.getStrangerName(usr)] knocks on the door.","outputic.output")
					M<<output("<font size = -3>[M.getStrangerName(usr)] knocks on the door.","outputall.output")
		proc/Open()
			layer=40
			flick("opening2",src)
			icon_state="open2"
			if(Opacity) opacity=0
			density=0
			spawn(30)
				layer=40
				flick("closing2",src)
				icon_state="close2"
				density=1
				layer=40
				if(Opacity) opacity=1
	CDoor
		icon='prison.dmi'
		icon_state="doorc"
		var/password="Foop"
		density=1
		proc/Open()
			layer=9
			icon_state="dooropen"
			density=0
			spawn(30)
				layer=25
				icon_state="doorc"
				density=1
				layer=25
var/turn=0
mob/verb
	TurnN()
		set hidden=1
		var/mob/controlMob = src
		if(controlMob.MindTransfer) controlMob = controlMob.MindTransfer
		controlMob.speeding=0
		controlMob.icon_state = ""
		controlMob.dir=NORTH
	TurnS()
		set hidden=1
		var/mob/controlMob = src
		if(controlMob.MindTransfer) controlMob = controlMob.MindTransfer
		controlMob.speeding=0
		controlMob.icon_state = ""
		controlMob.dir=SOUTH
	TurnE()
		set hidden=1
		var/mob/controlMob = src
		if(controlMob.MindTransfer) controlMob = controlMob.MindTransfer
		controlMob.speeding=0
		controlMob.icon_state = ""
		controlMob.dir=EAST
	TurnW()
		set hidden=1
		var/mob/controlMob = src
		if(controlMob.MindTransfer) controlMob = controlMob.MindTransfer
		controlMob.speeding=0
		controlMob.icon_state = ""
		controlMob.dir=WEST
turf
	WARPER
		density=0
		var/
			xto=1
			yto=1
			zto=1

		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			if(M.RecentVerbCheck("Teleport", 0)) return
			M.recentverbs["Teleport"]=world.realtime
			M.teleporting = 1
			M.density = 0
			M.Move(locate(xto,yto,zto))
			if(M.chakraOverlay) M.chakraOverlay.loc = M.loc
			M.teleporting = 0
			M.density = 1
turf
	WARPERCLANS
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			if(M.RecentVerbCheck("Teleport", 0)) return
			M.recentverbs["Teleport"]=world.realtime
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			if(M.chakraOverlay) M.chakraOverlay.loc = M.loc
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		Sect1A
			A1
				goingto=/turf/WARPERCLANS/Sect1A/A2
			A2
				goingto=/turf/WARPERCLANS/Sect1A/A1
			A3
				goingto=/turf/WARPERCLANS/Sect1A/A4
			A4
				goingto=/turf/WARPERCLANS/Sect1A/A3
		Sect2A
			A1
				goingto=/turf/WARPERCLANS/Sect2A/A2
			A2
				goingto=/turf/WARPERCLANS/Sect2A/A1
			A3
				goingto=/turf/WARPERCLANS/Sect2A/A4
			A4
				goingto=/turf/WARPERCLANS/Sect2A/A3
		Sect3A
			A1
				goingto=/turf/WARPERCLANS/Sect3A/A2
			A2
				goingto=/turf/WARPERCLANS/Sect3A/A1
			A3
				goingto=/turf/WARPERCLANS/Sect3A/A4
			A4
				goingto=/turf/WARPERCLANS/Sect3A/A3
		Sect4A
			A1
				goingto=/turf/WARPERCLANS/Sect4A/A2
			A2
				goingto=/turf/WARPERCLANS/Sect4A/A1
			A3
				goingto=/turf/WARPERCLANS/Sect4A/A4
			A4
				goingto=/turf/WARPERCLANS/Sect4A/A3
		Sect5A
			A1
				goingto=/turf/WARPERCLANS/Sect5A/A2
			A2
				goingto=/turf/WARPERCLANS/Sect5A/A1
			A3
				goingto=/turf/WARPERCLANS/Sect5A/A4
			A4
				goingto=/turf/WARPERCLANS/Sect5A/A3
		Sect6A
			A1
				goingto=/turf/WARPERCLANS/Sect6A/A2
			A2
				goingto=/turf/WARPERCLANS/Sect6A/A1
			A3
				goingto=/turf/WARPERCLANS/Sect6A/A4
			A4
				goingto=/turf/WARPERCLANS/Sect6A/A3
		Sect7A
			A1
				goingto=/turf/WARPERCLANS/Sect7A/A2
			A2
				goingto=/turf/WARPERCLANS/Sect7A/A1
			A3
				goingto=/turf/WARPERCLANS/Sect7A/A4
			A4
				goingto=/turf/WARPERCLANS/Sect7A/A3
turf
	WARPERTEMPLE
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			if(M.RecentVerbCheck("Teleport", 0)) return
			M.recentverbs["Teleport"]=world.realtime
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			if(M.chakraOverlay) M.chakraOverlay.loc = M.loc
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		Sect1A
			A1
				goingto=/turf/WARPERTEMPLE/Sect1A/A2
			A2
				goingto=/turf/WARPERTEMPLE/Sect1A/A1

			B1
				goingto=/turf/WARPERTEMPLE/Sect1A/B2
			B2
				goingto=/turf/WARPERTEMPLE/Sect1A/B1


			C1
				goingto=/turf/WARPERTEMPLE/Sect1A/C2
			C2
				goingto=/turf/WARPERTEMPLE/Sect1A/C1

			D1
				goingto=/turf/WARPERTEMPLE/Sect1A/D2
			D2
				goingto=/turf/WARPERTEMPLE/Sect1A/D1

			E1
				goingto=/turf/WARPERTEMPLE/Sect1A/E2
			E2
				goingto=/turf/WARPERTEMPLE/Sect1A/E1

			F1
				goingto=/turf/WARPERTEMPLE/Sect1A/F2
			F2
				goingto=/turf/WARPERTEMPLE/Sect1A/F1
			G1
				goingto=/turf/WARPERTEMPLE/Sect1A/G2
			G2
				goingto=/turf/WARPERTEMPLE/Sect1A/G1
			H1
				goingto=/turf/WARPERTEMPLE/Sect1A/H2
			H2
				goingto=/turf/WARPERTEMPLE/Sect1A/H1
			I1
				goingto=/turf/WARPERTEMPLE/Sect1A/I2
			I2
				goingto=/turf/WARPERTEMPLE/Sect1A/I1
			J1
				goingto=/turf/WARPERTEMPLE/Sect1A/J2
			J2
				goingto=/turf/WARPERTEMPLE/Sect1A/J1
	WARPERChuninFOD
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			if(M.RecentVerbCheck("Teleport", 0)) return
			M.recentverbs["Teleport"]=world.realtime
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			if(M.chakraOverlay) M.chakraOverlay.loc = M.loc
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		SectOmega
			A1
				goingto=/turf/WARPERChuninFOD/SectOmega/A2
			A2
				goingto=/turf/WARPERChuninFOD/SectOmega/A1
			B1
				goingto=/turf/WARPERChuninFOD/SectOmega/B2
			B2
				goingto=/turf/WARPERChuninFOD/SectOmega/B1
			C1
				goingto=/turf/WARPERChuninFOD/SectOmega/C2
			C2
				goingto=/turf/WARPERChuninFOD/SectOmega/C1
		Sect1A
			A1
				goingto=/turf/WARPERChuninFOD/Sect1A/A2
			A2
				goingto=/turf/WARPERChuninFOD/Sect1A/A1

			B1
				goingto=/turf/WARPERChuninFOD/Sect1A/B2
			B2
				goingto=/turf/WARPERChuninFOD/Sect1A/B1


			C1
				goingto=/turf/WARPERChuninFOD/Sect1A/C2
			C2
				goingto=/turf/WARPERChuninFOD/Sect1A/C1

			D1
				goingto=/turf/WARPERChuninFOD/Sect1A/D2
			D2
				goingto=/turf/WARPERChuninFOD/Sect1A/D1

			E1
				goingto=/turf/WARPERChuninFOD/Sect1A/E2
			E2
				goingto=/turf/WARPERChuninFOD/Sect1A/E1

			F1
				goingto=/turf/WARPERChuninFOD/Sect1A/F2
			F2
				goingto=/turf/WARPERChuninFOD/Sect1A/F1
	WARPERHOMESKIRI
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			if(M.RecentVerbCheck("Teleport", 0)) return
			M.recentverbs["Teleport"]=world.realtime
			M.density = 0
			M.teleporting = 1
			M.Move(locate(goingto))
			if(M.chakraOverlay) M.chakraOverlay.loc = M.loc
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)

		tower
			in1
				goingto=/turf/WARPERHOMESKIRI/tower/out1
			out1
				goingto=/turf/WARPERHOMESKIRI/tower/in1

			in2
				goingto=/turf/WARPERHOMESKIRI/tower/out2
			out2
				goingto=/turf/WARPERHOMESKIRI/tower/in2

			in3
				goingto=/turf/WARPERHOMESKIRI/tower/out3
			out3
				goingto=/turf/WARPERHOMESKIRI/tower/in3






		Sect1A
			A1
				goingto=/turf/WARPERHOMESKIRI/Sect1A/B1
			A2
				goingto=/turf/WARPERHOMESKIRI/Sect1A/B2
			B1
				goingto=/turf/WARPERHOMESKIRI/Sect1A/A1
			B2
				goingto=/turf/WARPERHOMESKIRI/Sect1A/A2



			C1
				goingto=/turf/WARPERHOMESKIRI/Sect1A/D1
			C2
				goingto=/turf/WARPERHOMESKIRI/Sect1A/D2
			D1
				goingto=/turf/WARPERHOMESKIRI/Sect1A/C1
			D2
				goingto=/turf/WARPERHOMESKIRI/Sect1A/C2

			E1
				goingto=/turf/WARPERHOMESKIRI/Sect1A/F1
			E2
				goingto=/turf/WARPERHOMESKIRI/Sect1A/F2
			F1
				goingto=/turf/WARPERHOMESKIRI/Sect1A/E1
			F2
				goingto=/turf/WARPERHOMESKIRI/Sect1A/E2
		Spa
			e1
				goingto=/turf/WARPERHOMESKIRI/Spa/e2
			e2
				goingto=/turf/WARPERHOMESKIRI/Spa/e1
			ea1
				goingto=/turf/WARPERHOMESKIRI/Spa/ea2
			ea2
				goingto=/turf/WARPERHOMESKIRI/Spa/ea1
		Sect1
			A1
				goingto=/turf/WARPERHOMESKIRI/Sect1/B1
			A2
				goingto=/turf/WARPERHOMESKIRI/Sect1/B2
			B1
				goingto=/turf/WARPERHOMESKIRI/Sect1/A1
			B2
				goingto=/turf/WARPERHOMESKIRI/Sect1/A2



			C1
				goingto=/turf/WARPERHOMESKIRI/Sect1/D1
			C2
				goingto=/turf/WARPERHOMESKIRI/Sect1/D2
			D1
				goingto=/turf/WARPERHOMESKIRI/Sect1/C1
			D2
				goingto=/turf/WARPERHOMESKIRI/Sect1/C2

			E1
				goingto=/turf/WARPERHOMESKIRI/Sect1/F1
			E2
				goingto=/turf/WARPERHOMESKIRI/Sect1/F2
			F1
				goingto=/turf/WARPERHOMESKIRI/Sect1/E1
			F2
				goingto=/turf/WARPERHOMESKIRI/Sect1/E2
		Sect2
			A1
				goingto=/turf/WARPERHOMESKIRI/Sect2/B1
			A2
				goingto=/turf/WARPERHOMESKIRI/Sect2/B2
			B1
				goingto=/turf/WARPERHOMESKIRI/Sect2/A1
			B2
				goingto=/turf/WARPERHOMESKIRI/Sect2/A2



			C1
				goingto=/turf/WARPERHOMESKIRI/Sect2/D1
			C2
				goingto=/turf/WARPERHOMESKIRI/Sect2/D2
			D1
				goingto=/turf/WARPERHOMESKIRI/Sect2/C1
			D2
				goingto=/turf/WARPERHOMESKIRI/Sect2/C2

			E1
				goingto=/turf/WARPERHOMESKIRI/Sect2/F1
			E2
				goingto=/turf/WARPERHOMESKIRI/Sect2/F2
			F1
				goingto=/turf/WARPERHOMESKIRI/Sect2/E1
			F2
				goingto=/turf/WARPERHOMESKIRI/Sect2/E2
		Sect3
			A1
				goingto=/turf/WARPERHOMESKIRI/Sect3/B1
			A2
				goingto=/turf/WARPERHOMESKIRI/Sect3/B2
			B1
				goingto=/turf/WARPERHOMESKIRI/Sect3/A1
			B2
				goingto=/turf/WARPERHOMESKIRI/Sect3/A2



			C1
				goingto=/turf/WARPERHOMESKIRI/Sect3/D1
			C2
				goingto=/turf/WARPERHOMESKIRI/Sect3/D2
			D1
				goingto=/turf/WARPERHOMESKIRI/Sect3/C1
			D2
				goingto=/turf/WARPERHOMESKIRI/Sect3/C2

			E1
				goingto=/turf/WARPERHOMESKIRI/Sect3/F1
			E2
				goingto=/turf/WARPERHOMESKIRI/Sect3/F2
			F1
				goingto=/turf/WARPERHOMESKIRI/Sect3/E1
			F2
				goingto=/turf/WARPERHOMESKIRI/Sect3/E2
		Sect4
			A1
				goingto=/turf/WARPERHOMESKIRI/Sect4/B1
			A2
				goingto=/turf/WARPERHOMESKIRI/Sect4/B2
			B1
				goingto=/turf/WARPERHOMESKIRI/Sect4/A1
			B2
				goingto=/turf/WARPERHOMESKIRI/Sect4/A2



			C1
				goingto=/turf/WARPERHOMESKIRI/Sect4/D1
			C2
				goingto=/turf/WARPERHOMESKIRI/Sect4/D2
			D1
				goingto=/turf/WARPERHOMESKIRI/Sect4/C1
			D2
				goingto=/turf/WARPERHOMESKIRI/Sect4/C2

			E1
				goingto=/turf/WARPERHOMESKIRI/Sect4/F1
			E2
				goingto=/turf/WARPERHOMESKIRI/Sect4/F2
			F1
				goingto=/turf/WARPERHOMESKIRI/Sect4/E1
			F2
				goingto=/turf/WARPERHOMESKIRI/Sect4/E2
		Sect5
			A1
				goingto=/turf/WARPERHOMESKIRI/Sect5/B1
			A2
				goingto=/turf/WARPERHOMESKIRI/Sect5/B2
			B1
				goingto=/turf/WARPERHOMESKIRI/Sect5/A1
			B2
				goingto=/turf/WARPERHOMESKIRI/Sect5/A2



			C1
				goingto=/turf/WARPERHOMESKIRI/Sect5/D1
			C2
				goingto=/turf/WARPERHOMESKIRI/Sect5/D2
			D1
				goingto=/turf/WARPERHOMESKIRI/Sect5/C1
			D2
				goingto=/turf/WARPERHOMESKIRI/Sect5/C2

			E1
				goingto=/turf/WARPERHOMESKIRI/Sect5/F1
			E2
				goingto=/turf/WARPERHOMESKIRI/Sect5/F2
			F1
				goingto=/turf/WARPERHOMESKIRI/Sect5/E1
			F2
				goingto=/turf/WARPERHOMESKIRI/Sect5/E2
		Sect6
			A1
				goingto=/turf/WARPERHOMESKIRI/Sect6/B1
			A2
				goingto=/turf/WARPERHOMESKIRI/Sect6/B2
			B1
				goingto=/turf/WARPERHOMESKIRI/Sect6/A1
			B2
				goingto=/turf/WARPERHOMESKIRI/Sect6/A2



			C1
				goingto=/turf/WARPERHOMESKIRI/Sect6/D1
			C2
				goingto=/turf/WARPERHOMESKIRI/Sect6/D2
			D1
				goingto=/turf/WARPERHOMESKIRI/Sect6/C1
			D2
				goingto=/turf/WARPERHOMESKIRI/Sect6/C2

			E1
				goingto=/turf/WARPERHOMESKIRI/Sect6/F1
			E2
				goingto=/turf/WARPERHOMESKIRI/Sect6/F2
			F1
				goingto=/turf/WARPERHOMESKIRI/Sect6/E1
			F2
				goingto=/turf/WARPERHOMESKIRI/Sect6/E2
		Sect7
			A1
				goingto=/turf/WARPERHOMESKIRI/Sect7/B1
			A2
				goingto=/turf/WARPERHOMESKIRI/Sect7/B2
			B1
				goingto=/turf/WARPERHOMESKIRI/Sect7/A1
			B2
				goingto=/turf/WARPERHOMESKIRI/Sect7/A2



			C1
				goingto=/turf/WARPERHOMESKIRI/Sect7/D1
			C2
				goingto=/turf/WARPERHOMESKIRI/Sect7/D2
			D1
				goingto=/turf/WARPERHOMESKIRI/Sect7/C1
			D2
				goingto=/turf/WARPERHOMESKIRI/Sect7/C2

			E1
				goingto=/turf/WARPERHOMESKIRI/Sect7/F1
			E2
				goingto=/turf/WARPERHOMESKIRI/Sect7/F2
			F1
				goingto=/turf/WARPERHOMESKIRI/Sect7/E1
			F2
				goingto=/turf/WARPERHOMESKIRI/Sect7/E2
		Sect8
			A1
				goingto=/turf/WARPERHOMESKIRI/Sect8/B1
			A2
				goingto=/turf/WARPERHOMESKIRI/Sect8/B2
			B1
				goingto=/turf/WARPERHOMESKIRI/Sect8/A1
			B2
				goingto=/turf/WARPERHOMESKIRI/Sect8/A2



			C1
				goingto=/turf/WARPERHOMESKIRI/Sect8/D1
			C2
				goingto=/turf/WARPERHOMESKIRI/Sect8/D2
			D1
				goingto=/turf/WARPERHOMESKIRI/Sect8/C1
			D2
				goingto=/turf/WARPERHOMESKIRI/Sect8/C2

			E1
				goingto=/turf/WARPERHOMESKIRI/Sect8/F1
			E2
				goingto=/turf/WARPERHOMESKIRI/Sect8/F2
			F1
				goingto=/turf/WARPERHOMESKIRI/Sect8/E1
			F2
				goingto=/turf/WARPERHOMESKIRI/Sect8/E2
		Sect9
			A1
				goingto=/turf/WARPERHOMESKIRI/Sect9/B1
			A2
				goingto=/turf/WARPERHOMESKIRI/Sect9/B2
			B1
				goingto=/turf/WARPERHOMESKIRI/Sect9/A1
			B2
				goingto=/turf/WARPERHOMESKIRI/Sect9/A2



			C1
				goingto=/turf/WARPERHOMESKIRI/Sect9/D1
			C2
				goingto=/turf/WARPERHOMESKIRI/Sect9/D2
			D1
				goingto=/turf/WARPERHOMESKIRI/Sect9/C1
			D2
				goingto=/turf/WARPERHOMESKIRI/Sect9/C2

			E1
				goingto=/turf/WARPERHOMESKIRI/Sect9/F1
			E2
				goingto=/turf/WARPERHOMESKIRI/Sect9/F2
			F1
				goingto=/turf/WARPERHOMESKIRI/Sect9/E1
			F2
				goingto=/turf/WARPERHOMESKIRI/Sect9/E2
		Sect10
			A1
				goingto=/turf/WARPERHOMESKIRI/Sect10/B1
			A2
				goingto=/turf/WARPERHOMESKIRI/Sect10/B2
			B1
				goingto=/turf/WARPERHOMESKIRI/Sect10/A1
			B2
				goingto=/turf/WARPERHOMESKIRI/Sect10/A2



			C1
				goingto=/turf/WARPERHOMESKIRI/Sect10/D1
			C2
				goingto=/turf/WARPERHOMESKIRI/Sect10/D2
			D1
				goingto=/turf/WARPERHOMESKIRI/Sect10/C1
			D2
				goingto=/turf/WARPERHOMESKIRI/Sect10/C2

			E1
				goingto=/turf/WARPERHOMESKIRI/Sect10/F1
			E2
				goingto=/turf/WARPERHOMESKIRI/Sect10/F2
			F1
				goingto=/turf/WARPERHOMESKIRI/Sect10/E1
			F2
				goingto=/turf/WARPERHOMESKIRI/Sect10/E2
		Sect11
			A1
				goingto=/turf/WARPERHOMESKIRI/Sect11/B1
			A2
				goingto=/turf/WARPERHOMESKIRI/Sect11/B2
			B1
				goingto=/turf/WARPERHOMESKIRI/Sect11/A1
			B2
				goingto=/turf/WARPERHOMESKIRI/Sect11/A2



			C1
				goingto=/turf/WARPERHOMESKIRI/Sect11/D1
			C2
				goingto=/turf/WARPERHOMESKIRI/Sect11/D2
			D1
				goingto=/turf/WARPERHOMESKIRI/Sect11/C1
			D2
				goingto=/turf/WARPERHOMESKIRI/Sect11/C2

			E1
				goingto=/turf/WARPERHOMESKIRI/Sect11/F1
			E2
				goingto=/turf/WARPERHOMESKIRI/Sect11/F2
			F1
				goingto=/turf/WARPERHOMESKIRI/Sect11/E1
			F2
				goingto=/turf/WARPERHOMESKIRI/Sect11/E2
		Sect12
			A1
				goingto=/turf/WARPERHOMESKIRI/Sect12/B1
			A2
				goingto=/turf/WARPERHOMESKIRI/Sect12/B2
			B1
				goingto=/turf/WARPERHOMESKIRI/Sect12/A1
			B2
				goingto=/turf/WARPERHOMESKIRI/Sect12/A2



			C1
				goingto=/turf/WARPERHOMESKIRI/Sect12/D1
			C2
				goingto=/turf/WARPERHOMESKIRI/Sect12/D2
			D1
				goingto=/turf/WARPERHOMESKIRI/Sect12/C1
			D2
				goingto=/turf/WARPERHOMESKIRI/Sect12/C2

			E1
				goingto=/turf/WARPERHOMESKIRI/Sect12/F1
			E2
				goingto=/turf/WARPERHOMESKIRI/Sect12/F2
			F1
				goingto=/turf/WARPERHOMESKIRI/Sect12/E1
			F2
				goingto=/turf/WARPERHOMESKIRI/Sect12/E2
		Sect13
			A1
				goingto=/turf/WARPERHOMESKIRI/Sect13/B1
			A2
				goingto=/turf/WARPERHOMESKIRI/Sect13/B2
			B1
				goingto=/turf/WARPERHOMESKIRI/Sect13/A1
			B2
				goingto=/turf/WARPERHOMESKIRI/Sect13/A2



			C1
				goingto=/turf/WARPERHOMESKIRI/Sect13/D1
			C2
				goingto=/turf/WARPERHOMESKIRI/Sect13/D2
			D1
				goingto=/turf/WARPERHOMESKIRI/Sect13/C1
			D2
				goingto=/turf/WARPERHOMESKIRI/Sect13/C2

			E1
				goingto=/turf/WARPERHOMESKIRI/Sect13/F1
			E2
				goingto=/turf/WARPERHOMESKIRI/Sect13/F2
			F1
				goingto=/turf/WARPERHOMESKIRI/Sect13/E1
			F2
				goingto=/turf/WARPERHOMESKIRI/Sect13/E2
		Sect14
			A1
				goingto=/turf/WARPERHOMESKIRI/Sect14/B1
			A2
				goingto=/turf/WARPERHOMESKIRI/Sect14/B2
			B1
				goingto=/turf/WARPERHOMESKIRI/Sect14/A1
			B2
				goingto=/turf/WARPERHOMESKIRI/Sect14/A2



			C1
				goingto=/turf/WARPERHOMESKIRI/Sect14/D1
			C2
				goingto=/turf/WARPERHOMESKIRI/Sect14/D2
			D1
				goingto=/turf/WARPERHOMESKIRI/Sect14/C1
			D2
				goingto=/turf/WARPERHOMESKIRI/Sect14/C2

			E1
				goingto=/turf/WARPERHOMESKIRI/Sect14/F1
			E2
				goingto=/turf/WARPERHOMESKIRI/Sect14/F2
			F1
				goingto=/turf/WARPERHOMESKIRI/Sect14/E1
			F2
				goingto=/turf/WARPERHOMESKIRI/Sect14/E2
		Sect15
			A1
				goingto=/turf/WARPERHOMESKIRI/Sect15/B1
			A2
				goingto=/turf/WARPERHOMESKIRI/Sect15/B2
			B1
				goingto=/turf/WARPERHOMESKIRI/Sect15/A1
			B2
				goingto=/turf/WARPERHOMESKIRI/Sect15/A2



			C1
				goingto=/turf/WARPERHOMESKIRI/Sect15/D1
			C2
				goingto=/turf/WARPERHOMESKIRI/Sect15/D2
			D1
				goingto=/turf/WARPERHOMESKIRI/Sect15/C1
			D2
				goingto=/turf/WARPERHOMESKIRI/Sect15/C2

			E1
				goingto=/turf/WARPERHOMESKIRI/Sect15/F1
			E2
				goingto=/turf/WARPERHOMESKIRI/Sect15/F2
			F1
				goingto=/turf/WARPERHOMESKIRI/Sect15/E1
			F2
				goingto=/turf/WARPERHOMESKIRI/Sect15/E2
		Sect16
			A1
				goingto=/turf/WARPERHOMESKIRI/Sect16/B1
			A2
				goingto=/turf/WARPERHOMESKIRI/Sect16/B2
			B1
				goingto=/turf/WARPERHOMESKIRI/Sect16/A1
			B2
				goingto=/turf/WARPERHOMESKIRI/Sect16/A2



			C1
				goingto=/turf/WARPERHOMESKIRI/Sect16/D1
			C2
				goingto=/turf/WARPERHOMESKIRI/Sect16/D2
			D1
				goingto=/turf/WARPERHOMESKIRI/Sect16/C1
			D2
				goingto=/turf/WARPERHOMESKIRI/Sect16/C2

			E1
				goingto=/turf/WARPERHOMESKIRI/Sect16/F1
			E2
				goingto=/turf/WARPERHOMESKIRI/Sect16/F2
			F1
				goingto=/turf/WARPERHOMESKIRI/Sect16/E1
			F2
				goingto=/turf/WARPERHOMESKIRI/Sect16/E2
		Sect17
			A1
				goingto=/turf/WARPERHOMESKIRI/Sect17/B1
			A2
				goingto=/turf/WARPERHOMESKIRI/Sect17/B2
			B1
				goingto=/turf/WARPERHOMESKIRI/Sect17/A1
			B2
				goingto=/turf/WARPERHOMESKIRI/Sect17/A2



			C1
				goingto=/turf/WARPERHOMESKIRI/Sect17/D1
			C2
				goingto=/turf/WARPERHOMESKIRI/Sect17/D2
			D1
				goingto=/turf/WARPERHOMESKIRI/Sect17/C1
			D2
				goingto=/turf/WARPERHOMESKIRI/Sect17/C2

			E1
				goingto=/turf/WARPERHOMESKIRI/Sect17/F1
			E2
				goingto=/turf/WARPERHOMESKIRI/Sect17/F2
			F1
				goingto=/turf/WARPERHOMESKIRI/Sect17/E1
			F2
				goingto=/turf/WARPERHOMESKIRI/Sect17/E2
		Sect18
			A1
				goingto=/turf/WARPERHOMESKIRI/Sect18/B1
			A2
				goingto=/turf/WARPERHOMESKIRI/Sect18/B2
			B1
				goingto=/turf/WARPERHOMESKIRI/Sect18/A1
			B2
				goingto=/turf/WARPERHOMESKIRI/Sect18/A2



			C1
				goingto=/turf/WARPERHOMESKIRI/Sect18/D1
			C2
				goingto=/turf/WARPERHOMESKIRI/Sect18/D2
			D1
				goingto=/turf/WARPERHOMESKIRI/Sect18/C1
			D2
				goingto=/turf/WARPERHOMESKIRI/Sect18/C2

			E1
				goingto=/turf/WARPERHOMESKIRI/Sect18/F1
			E2
				goingto=/turf/WARPERHOMESKIRI/Sect18/F2
			F1
				goingto=/turf/WARPERHOMESKIRI/Sect18/E1
			F2
				goingto=/turf/WARPERHOMESKIRI/Sect18/E2




	WARPERCOUNTRY
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			if(M.RecentVerbCheck("Teleport", 0)) return
			M.recentverbs["Teleport"]=world.realtime
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			if(M.chakraOverlay) M.chakraOverlay.loc = M.loc
			M.teleporting = 0
			M.density = 1
		Acave
			in1
				goingto=/turf/WARPERCOUNTRY/Acave/out1
			out1
				goingto=/turf/WARPERCOUNTRY/Acave/in1

			in2
				goingto=/turf/WARPERCOUNTRY/Acave/out2
			out2
				goingto=/turf/WARPERCOUNTRY/Acave/in2

			in3
				goingto=/turf/WARPERCOUNTRY/Acave/out3
			out3
				goingto=/turf/WARPERCOUNTRY/Acave/in3

			in4
				goingto=/turf/WARPERCOUNTRY/Acave/out4
			out4
				goingto=/turf/WARPERCOUNTRY/Acave/in4

			in5
				goingto=/turf/WARPERCOUNTRY/Acave/out5
			out5
				goingto=/turf/WARPERCOUNTRY/Acave/in5

			in6
				goingto=/turf/WARPERCOUNTRY/Acave/out6
			out6
				goingto=/turf/WARPERCOUNTRY/Acave/in6



		A
			in1
				goingto=/turf/WARPERCOUNTRY/A/out1
			out1
				goingto=/turf/WARPERCOUNTRY/A/in1

			in2
				goingto=/turf/WARPERCOUNTRY/A/out2
			out2
				goingto=/turf/WARPERCOUNTRY/A/in2

			in3
				goingto=/turf/WARPERCOUNTRY/A/out3
			out3
				goingto=/turf/WARPERCOUNTRY/A/in3

			in4
				goingto=/turf/WARPERCOUNTRY/A/out4
			out4
				goingto=/turf/WARPERCOUNTRY/A/in4

			in5
				goingto=/turf/WARPERCOUNTRY/A/out5
			out5
				goingto=/turf/WARPERCOUNTRY/A/in5

			in6
				goingto=/turf/WARPERCOUNTRY/A/out6
			out6
				goingto=/turf/WARPERCOUNTRY/A/in6

			in7
				goingto=/turf/WARPERCOUNTRY/A/out7
			out7
				goingto=/turf/WARPERCOUNTRY/A/in7

			in8
				goingto=/turf/WARPERCOUNTRY/A/out8
			out8
				goingto=/turf/WARPERCOUNTRY/A/in8

			in9
				goingto=/turf/WARPERCOUNTRY/A/out9
			out9
				goingto=/turf/WARPERCOUNTRY/A/in9

			in10
				goingto=/turf/WARPERCOUNTRY/A/out10
			out10
				goingto=/turf/WARPERCOUNTRY/A/in10

			in11
				goingto=/turf/WARPERCOUNTRY/A/out11
			out11
				goingto=/turf/WARPERCOUNTRY/A/in11

			in12
				goingto=/turf/WARPERCOUNTRY/A/out12
			out12
				goingto=/turf/WARPERCOUNTRY/A/in12

			in13
				goingto=/turf/WARPERCOUNTRY/A/out13
			out13
				goingto=/turf/WARPERCOUNTRY/A/in13

			in14
				goingto=/turf/WARPERCOUNTRY/A/out14
			out14
				goingto=/turf/WARPERCOUNTRY/A/in14


		B
			in1
				goingto=/turf/WARPERCOUNTRY/B/out1
			out1
				goingto=/turf/WARPERCOUNTRY/B/in1

			in2
				goingto=/turf/WARPERCOUNTRY/B/out2
			out2
				goingto=/turf/WARPERCOUNTRY/B/in2

			in3
				goingto=/turf/WARPERCOUNTRY/B/out3
			out3
				goingto=/turf/WARPERCOUNTRY/B/in3

			in4
				goingto=/turf/WARPERCOUNTRY/B/out4
			out4
				goingto=/turf/WARPERCOUNTRY/B/in4

			in5
				goingto=/turf/WARPERCOUNTRY/B/out5
			out5
				goingto=/turf/WARPERCOUNTRY/B/in5

			in6
				goingto=/turf/WARPERCOUNTRY/B/out6
			out6
				goingto=/turf/WARPERCOUNTRY/B/in6

		C
			in1
				goingto=/turf/WARPERCOUNTRY/C/out1
			out1
				goingto=/turf/WARPERCOUNTRY/C/in1

			in2
				goingto=/turf/WARPERCOUNTRY/C/out2
			out2
				goingto=/turf/WARPERCOUNTRY/C/in2

			in3
				goingto=/turf/WARPERCOUNTRY/C/out3
			out3
				goingto=/turf/WARPERCOUNTRY/C/in3

			in4
				goingto=/turf/WARPERCOUNTRY/C/out4
			out4
				goingto=/turf/WARPERCOUNTRY/C/in4

			in5
				goingto=/turf/WARPERCOUNTRY/C/out5
			out5
				goingto=/turf/WARPERCOUNTRY/C/in5

			in6
				goingto=/turf/WARPERCOUNTRY/C/out6
			out6
				goingto=/turf/WARPERCOUNTRY/C/in6
		D
			in1
				goingto=/turf/WARPERCOUNTRY/D/out1
			out1
				goingto=/turf/WARPERCOUNTRY/D/in1

			in2
				goingto=/turf/WARPERCOUNTRY/D/out2
			out2
				goingto=/turf/WARPERCOUNTRY/D/in2

			in3
				goingto=/turf/WARPERCOUNTRY/D/out3
			out3
				goingto=/turf/WARPERCOUNTRY/D/in3

			in4
				goingto=/turf/WARPERCOUNTRY/D/out4
			out4
				goingto=/turf/WARPERCOUNTRY/D/in4

			in5
				goingto=/turf/WARPERCOUNTRY/D/out5
			out5
				goingto=/turf/WARPERCOUNTRY/D/in5

			in6
				goingto=/turf/WARPERCOUNTRY/D/out6
			out6
				goingto=/turf/WARPERCOUNTRY/D/in6






	WARPERHOMES
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			if(M.RecentVerbCheck("Teleport", 0)) return
			M.recentverbs["Teleport"]=world.realtime
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			if(M.chakraOverlay) M.chakraOverlay.loc = M.loc
			M.teleporting = 0
			M.density = 1
		Sect1A
			A1
				goingto=/turf/WARPERHOMES/Sect1A/B1
			A2
				goingto=/turf/WARPERHOMES/Sect1A/B2
			B1
				goingto=/turf/WARPERHOMES/Sect1A/A1
			B2
				goingto=/turf/WARPERHOMES/Sect1A/A2



			C1
				goingto=/turf/WARPERHOMES/Sect1A/D1
			C2
				goingto=/turf/WARPERHOMES/Sect1A/D2
			D1
				goingto=/turf/WARPERHOMES/Sect1A/C1
			D2
				goingto=/turf/WARPERHOMES/Sect1A/C2

			E1
				goingto=/turf/WARPERHOMES/Sect1A/F1
			E2
				goingto=/turf/WARPERHOMES/Sect1A/F2
			F1
				goingto=/turf/WARPERHOMES/Sect1A/E1
			F2
				goingto=/turf/WARPERHOMES/Sect1A/E2
		Sect1
			A1
				goingto=/turf/WARPERHOMES/Sect1/B1
			A2
				goingto=/turf/WARPERHOMES/Sect1/B2
			B1
				goingto=/turf/WARPERHOMES/Sect1/A1
			B2
				goingto=/turf/WARPERHOMES/Sect1/A2



			C1
				goingto=/turf/WARPERHOMES/Sect1/D1
			C2
				goingto=/turf/WARPERHOMES/Sect1/D2
			D1
				goingto=/turf/WARPERHOMES/Sect1/C1
			D2
				goingto=/turf/WARPERHOMES/Sect1/C2

			E1
				goingto=/turf/WARPERHOMES/Sect1/F1
			E2
				goingto=/turf/WARPERHOMES/Sect1/F2
			F1
				goingto=/turf/WARPERHOMES/Sect1/E1
			F2
				goingto=/turf/WARPERHOMES/Sect1/E2
		Sect2
			A1
				goingto=/turf/WARPERHOMES/Sect2/B1
			A2
				goingto=/turf/WARPERHOMES/Sect2/B2
			B1
				goingto=/turf/WARPERHOMES/Sect2/A1
			B2
				goingto=/turf/WARPERHOMES/Sect2/A2



			C1
				goingto=/turf/WARPERHOMES/Sect2/D1
			C2
				goingto=/turf/WARPERHOMES/Sect2/D2
			D1
				goingto=/turf/WARPERHOMES/Sect2/C1
			D2
				goingto=/turf/WARPERHOMES/Sect2/C2

			E1
				goingto=/turf/WARPERHOMES/Sect2/F1
			E2
				goingto=/turf/WARPERHOMES/Sect2/F2
			F1
				goingto=/turf/WARPERHOMES/Sect2/E1
			F2
				goingto=/turf/WARPERHOMES/Sect2/E2
		Sect3
			A1
				goingto=/turf/WARPERHOMES/Sect3/B1
			A2
				goingto=/turf/WARPERHOMES/Sect3/B2
			B1
				goingto=/turf/WARPERHOMES/Sect3/A1
			B2
				goingto=/turf/WARPERHOMES/Sect3/A2



			C1
				goingto=/turf/WARPERHOMES/Sect3/D1
			C2
				goingto=/turf/WARPERHOMES/Sect3/D2
			D1
				goingto=/turf/WARPERHOMES/Sect3/C1
			D2
				goingto=/turf/WARPERHOMES/Sect3/C2

			E1
				goingto=/turf/WARPERHOMES/Sect3/F1
			E2
				goingto=/turf/WARPERHOMES/Sect3/F2
			F1
				goingto=/turf/WARPERHOMES/Sect3/E1
			F2
				goingto=/turf/WARPERHOMES/Sect3/E2
		Sect4
			A1
				goingto=/turf/WARPERHOMES/Sect4/B1
			A2
				goingto=/turf/WARPERHOMES/Sect4/B2
			B1
				goingto=/turf/WARPERHOMES/Sect4/A1
			B2
				goingto=/turf/WARPERHOMES/Sect4/A2



			C1
				goingto=/turf/WARPERHOMES/Sect4/D1
			C2
				goingto=/turf/WARPERHOMES/Sect4/D2
			D1
				goingto=/turf/WARPERHOMES/Sect4/C1
			D2
				goingto=/turf/WARPERHOMES/Sect4/C2

			E1
				goingto=/turf/WARPERHOMES/Sect4/F1
			E2
				goingto=/turf/WARPERHOMES/Sect4/F2
			F1
				goingto=/turf/WARPERHOMES/Sect4/E1
			F2
				goingto=/turf/WARPERHOMES/Sect4/E2
		Sect5
			A1
				goingto=/turf/WARPERHOMES/Sect5/B1
			A2
				goingto=/turf/WARPERHOMES/Sect5/B2
			B1
				goingto=/turf/WARPERHOMES/Sect5/A1
			B2
				goingto=/turf/WARPERHOMES/Sect5/A2



			C1
				goingto=/turf/WARPERHOMES/Sect5/D1
			C2
				goingto=/turf/WARPERHOMES/Sect5/D2
			D1
				goingto=/turf/WARPERHOMES/Sect5/C1
			D2
				goingto=/turf/WARPERHOMES/Sect5/C2

			E1
				goingto=/turf/WARPERHOMES/Sect5/F1
			E2
				goingto=/turf/WARPERHOMES/Sect5/F2
			F1
				goingto=/turf/WARPERHOMES/Sect5/E1
			F2
				goingto=/turf/WARPERHOMES/Sect5/E2
		Sect6
			A1
				goingto=/turf/WARPERHOMES/Sect6/B1
			A2
				goingto=/turf/WARPERHOMES/Sect6/B2
			B1
				goingto=/turf/WARPERHOMES/Sect6/A1
			B2
				goingto=/turf/WARPERHOMES/Sect6/A2



			C1
				goingto=/turf/WARPERHOMES/Sect6/D1
			C2
				goingto=/turf/WARPERHOMES/Sect6/D2
			D1
				goingto=/turf/WARPERHOMES/Sect6/C1
			D2
				goingto=/turf/WARPERHOMES/Sect6/C2

			E1
				goingto=/turf/WARPERHOMES/Sect6/F1
			E2
				goingto=/turf/WARPERHOMES/Sect6/F2
			F1
				goingto=/turf/WARPERHOMES/Sect6/E1
			F2
				goingto=/turf/WARPERHOMES/Sect6/E2
		Sect7
			A1
				goingto=/turf/WARPERHOMES/Sect7/B1
			A2
				goingto=/turf/WARPERHOMES/Sect7/B2
			B1
				goingto=/turf/WARPERHOMES/Sect7/A1
			B2
				goingto=/turf/WARPERHOMES/Sect7/A2



			C1
				goingto=/turf/WARPERHOMES/Sect7/D1
			C2
				goingto=/turf/WARPERHOMES/Sect7/D2
			D1
				goingto=/turf/WARPERHOMES/Sect7/C1
			D2
				goingto=/turf/WARPERHOMES/Sect7/C2

			E1
				goingto=/turf/WARPERHOMES/Sect7/F1
			E2
				goingto=/turf/WARPERHOMES/Sect7/F2
			F1
				goingto=/turf/WARPERHOMES/Sect7/E1
			F2
				goingto=/turf/WARPERHOMES/Sect7/E2
		Sect8
			A1
				goingto=/turf/WARPERHOMES/Sect8/B1
			A2
				goingto=/turf/WARPERHOMES/Sect8/B2
			B1
				goingto=/turf/WARPERHOMES/Sect8/A1
			B2
				goingto=/turf/WARPERHOMES/Sect8/A2



			C1
				goingto=/turf/WARPERHOMES/Sect8/D1
			C2
				goingto=/turf/WARPERHOMES/Sect8/D2
			D1
				goingto=/turf/WARPERHOMES/Sect8/C1
			D2
				goingto=/turf/WARPERHOMES/Sect8/C2

			E1
				goingto=/turf/WARPERHOMES/Sect8/F1
			E2
				goingto=/turf/WARPERHOMES/Sect8/F2
			F1
				goingto=/turf/WARPERHOMES/Sect8/E1
			F2
				goingto=/turf/WARPERHOMES/Sect8/E2
		Sect9
			A1
				goingto=/turf/WARPERHOMES/Sect9/B1
			A2
				goingto=/turf/WARPERHOMES/Sect9/B2
			B1
				goingto=/turf/WARPERHOMES/Sect9/A1
			B2
				goingto=/turf/WARPERHOMES/Sect9/A2



			C1
				goingto=/turf/WARPERHOMES/Sect9/D1
			C2
				goingto=/turf/WARPERHOMES/Sect9/D2
			D1
				goingto=/turf/WARPERHOMES/Sect9/C1
			D2
				goingto=/turf/WARPERHOMES/Sect9/C2

			E1
				goingto=/turf/WARPERHOMES/Sect9/F1
			E2
				goingto=/turf/WARPERHOMES/Sect9/F2
			F1
				goingto=/turf/WARPERHOMES/Sect9/E1
			F2
				goingto=/turf/WARPERHOMES/Sect9/E2
		Sect10
			A1
				goingto=/turf/WARPERHOMES/Sect10/B1
			A2
				goingto=/turf/WARPERHOMES/Sect10/B2
			B1
				goingto=/turf/WARPERHOMES/Sect10/A1
			B2
				goingto=/turf/WARPERHOMES/Sect10/A2



			C1
				goingto=/turf/WARPERHOMES/Sect10/D1
			C2
				goingto=/turf/WARPERHOMES/Sect10/D2
			D1
				goingto=/turf/WARPERHOMES/Sect10/C1
			D2
				goingto=/turf/WARPERHOMES/Sect10/C2

			E1
				goingto=/turf/WARPERHOMES/Sect10/F1
			E2
				goingto=/turf/WARPERHOMES/Sect10/F2
			F1
				goingto=/turf/WARPERHOMES/Sect10/E1
			F2
				goingto=/turf/WARPERHOMES/Sect10/E2
		Sect11
			A1
				goingto=/turf/WARPERHOMES/Sect11/B1
			A2
				goingto=/turf/WARPERHOMES/Sect11/B2
			B1
				goingto=/turf/WARPERHOMES/Sect11/A1
			B2
				goingto=/turf/WARPERHOMES/Sect11/A2



			C1
				goingto=/turf/WARPERHOMES/Sect11/D1
			C2
				goingto=/turf/WARPERHOMES/Sect11/D2
			D1
				goingto=/turf/WARPERHOMES/Sect11/C1
			D2
				goingto=/turf/WARPERHOMES/Sect11/C2

			E1
				goingto=/turf/WARPERHOMES/Sect11/F1
			E2
				goingto=/turf/WARPERHOMES/Sect11/F2
			F1
				goingto=/turf/WARPERHOMES/Sect11/E1
			F2
				goingto=/turf/WARPERHOMES/Sect11/E2
		Sect12
			A1
				goingto=/turf/WARPERHOMES/Sect12/B1
			A2
				goingto=/turf/WARPERHOMES/Sect12/B2
			B1
				goingto=/turf/WARPERHOMES/Sect12/A1
			B2
				goingto=/turf/WARPERHOMES/Sect12/A2



			C1
				goingto=/turf/WARPERHOMES/Sect12/D1
			C2
				goingto=/turf/WARPERHOMES/Sect12/D2
			D1
				goingto=/turf/WARPERHOMES/Sect12/C1
			D2
				goingto=/turf/WARPERHOMES/Sect12/C2

			E1
				goingto=/turf/WARPERHOMES/Sect12/F1
			E2
				goingto=/turf/WARPERHOMES/Sect12/F2
			F1
				goingto=/turf/WARPERHOMES/Sect12/E1
			F2
				goingto=/turf/WARPERHOMES/Sect12/E2
		Sect13
			A1
				goingto=/turf/WARPERHOMES/Sect13/B1
			A2
				goingto=/turf/WARPERHOMES/Sect13/B2
			B1
				goingto=/turf/WARPERHOMES/Sect13/A1
			B2
				goingto=/turf/WARPERHOMES/Sect13/A2



			C1
				goingto=/turf/WARPERHOMES/Sect13/D1
			C2
				goingto=/turf/WARPERHOMES/Sect13/D2
			D1
				goingto=/turf/WARPERHOMES/Sect13/C1
			D2
				goingto=/turf/WARPERHOMES/Sect13/C2

			E1
				goingto=/turf/WARPERHOMES/Sect13/F1
			E2
				goingto=/turf/WARPERHOMES/Sect13/F2
			F1
				goingto=/turf/WARPERHOMES/Sect13/E1
			F2
				goingto=/turf/WARPERHOMES/Sect13/E2
		Sect14
			A1
				goingto=/turf/WARPERHOMES/Sect14/B1
			A2
				goingto=/turf/WARPERHOMES/Sect14/B2
			B1
				goingto=/turf/WARPERHOMES/Sect14/A1
			B2
				goingto=/turf/WARPERHOMES/Sect14/A2



			C1
				goingto=/turf/WARPERHOMES/Sect14/D1
			C2
				goingto=/turf/WARPERHOMES/Sect14/D2
			D1
				goingto=/turf/WARPERHOMES/Sect14/C1
			D2
				goingto=/turf/WARPERHOMES/Sect14/C2

			E1
				goingto=/turf/WARPERHOMES/Sect14/F1
			E2
				goingto=/turf/WARPERHOMES/Sect14/F2
			F1
				goingto=/turf/WARPERHOMES/Sect14/E1
			F2
				goingto=/turf/WARPERHOMES/Sect14/E2
		Sect15
			A1
				goingto=/turf/WARPERHOMES/Sect15/B1
			A2
				goingto=/turf/WARPERHOMES/Sect15/B2
			B1
				goingto=/turf/WARPERHOMES/Sect15/A1
			B2
				goingto=/turf/WARPERHOMES/Sect15/A2



			C1
				goingto=/turf/WARPERHOMES/Sect15/D1
			C2
				goingto=/turf/WARPERHOMES/Sect15/D2
			D1
				goingto=/turf/WARPERHOMES/Sect15/C1
			D2
				goingto=/turf/WARPERHOMES/Sect15/C2

			E1
				goingto=/turf/WARPERHOMES/Sect15/F1
			E2
				goingto=/turf/WARPERHOMES/Sect15/F2
			F1
				goingto=/turf/WARPERHOMES/Sect15/E1
			F2
				goingto=/turf/WARPERHOMES/Sect15/E2
		Sect16
			A1
				goingto=/turf/WARPERHOMES/Sect16/B1
			A2
				goingto=/turf/WARPERHOMES/Sect16/B2
			B1
				goingto=/turf/WARPERHOMES/Sect16/A1
			B2
				goingto=/turf/WARPERHOMES/Sect16/A2



			C1
				goingto=/turf/WARPERHOMES/Sect16/D1
			C2
				goingto=/turf/WARPERHOMES/Sect16/D2
			D1
				goingto=/turf/WARPERHOMES/Sect16/C1
			D2
				goingto=/turf/WARPERHOMES/Sect16/C2

			E1
				goingto=/turf/WARPERHOMES/Sect16/F1
			E2
				goingto=/turf/WARPERHOMES/Sect16/F2
			F1
				goingto=/turf/WARPERHOMES/Sect16/E1
			F2
				goingto=/turf/WARPERHOMES/Sect16/E2
		Sect17
			A1
				goingto=/turf/WARPERHOMES/Sect17/B1
			A2
				goingto=/turf/WARPERHOMES/Sect17/B2
			B1
				goingto=/turf/WARPERHOMES/Sect17/A1
			B2
				goingto=/turf/WARPERHOMES/Sect17/A2



			C1
				goingto=/turf/WARPERHOMES/Sect17/D1
			C2
				goingto=/turf/WARPERHOMES/Sect17/D2
			D1
				goingto=/turf/WARPERHOMES/Sect17/C1
			D2
				goingto=/turf/WARPERHOMES/Sect17/C2

			E1
				goingto=/turf/WARPERHOMES/Sect17/F1
			E2
				goingto=/turf/WARPERHOMES/Sect17/F2
			F1
				goingto=/turf/WARPERHOMES/Sect17/E1
			F2
				goingto=/turf/WARPERHOMES/Sect17/E2
		Sect18
			A1
				goingto=/turf/WARPERHOMES/Sect18/B1
			A2
				goingto=/turf/WARPERHOMES/Sect18/B2
			B1
				goingto=/turf/WARPERHOMES/Sect18/A1
			B2
				goingto=/turf/WARPERHOMES/Sect18/A2



			C1
				goingto=/turf/WARPERHOMES/Sect18/D1
			C2
				goingto=/turf/WARPERHOMES/Sect18/D2
			D1
				goingto=/turf/WARPERHOMES/Sect18/C1
			D2
				goingto=/turf/WARPERHOMES/Sect18/C2

			E1
				goingto=/turf/WARPERHOMES/Sect18/F1
			E2
				goingto=/turf/WARPERHOMES/Sect18/F2
			F1
				goingto=/turf/WARPERHOMES/Sect18/E1
			F2
				goingto=/turf/WARPERHOMES/Sect18/E2





		newwarps
			in1
				goingto=/turf/WARPERHOMES/newwarps/out1
			out1
				goingto=/turf/WARPERHOMES/newwarps/in1


			in2
				goingto=/turf/WARPERHOMES/newwarps/out2
			out2
				goingto=/turf/WARPERHOMES/newwarps/in2

			in3
				goingto=/turf/WARPERHOMES/newwarps/out3
			out3
				goingto=/turf/WARPERHOMES/newwarps/in3

			in4
				goingto=/turf/WARPERHOMES/newwarps/out4
			out4
				goingto=/turf/WARPERHOMES/newwarps/in4


			in5
				goingto=/turf/WARPERHOMES/newwarps/out5
			out5
				goingto=/turf/WARPERHOMES/newwarps/in5

			in6
				goingto=/turf/WARPERHOMES/newwarps/out6
			out6
				goingto=/turf/WARPERHOMES/newwarps/in6

			in7
				goingto=/turf/WARPERHOMES/newwarps/out7
			out7
				goingto=/turf/WARPERHOMES/newwarps/in7

			in8
				goingto=/turf/WARPERHOMES/newwarps/out8
			out8
				goingto=/turf/WARPERHOMES/newwarps/in8


			in9
				goingto=/turf/WARPERHOMES/newwarps/out9
			out9
				goingto=/turf/WARPERHOMES/newwarps/in9

			in10
				goingto=/turf/WARPERHOMES/newwarps/out10
			out10
				goingto=/turf/WARPERHOMES/newwarps/in10

			in11
				goingto=/turf/WARPERHOMES/newwarps/out11
			out11
				goingto=/turf/WARPERHOMES/newwarps/in11

			in12
				goingto=/turf/WARPERHOMES/newwarps/out12
			out12
				goingto=/turf/WARPERHOMES/newwarps/in12

			in13
				goingto=/turf/WARPERHOMES/newwarps/out13
			out13
				goingto=/turf/WARPERHOMES/newwarps/in13


		newwarp123
			ina
				goingto=/turf/WARPERHOMES/newwarp123/outa
			outa
				goingto=/turf/WARPERHOMES/newwarp123/ina
			inb
				goingto=/turf/WARPERHOMES/newwarp123/outb
			outb
				goingto=/turf/WARPERHOMES/newwarp123/inb
			inc
				goingto=/turf/WARPERHOMES/newwarp123/outc
			outc
				goingto=/turf/WARPERHOMES/newwarp123/inc
			ind
				goingto=/turf/WARPERHOMES/newwarp123/outd
			outd
				goingto=/turf/WARPERHOMES/newwarp123/ind




turf
	NoboruEnt
		density = 0
		Entered()
			usr.loc=locate(168,43,5)
			if(usr.chakraOverlay) usr.chakraOverlay.loc = usr.loc

	NoboruExt
		density = 0
		Entered()
			usr.loc=locate(255,145,2)
			if(usr.chakraOverlay) usr.chakraOverlay.loc = usr.loc

	AnbuEnt
		density = 0
		Entered()
			usr.loc=locate(65,2,11)
			if(usr.chakraOverlay) usr.chakraOverlay.loc = usr.loc

	AnbuExt
		density = 0
		Entered()
			usr.loc=locate(62,15,10)
			if(usr.chakraOverlay) usr.chakraOverlay.loc = usr.loc

	SnakeEnt
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/SnakeExt)
	SnakeExt
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/SnakeEnt)

turf/kiri
	layer = 1000
	h11
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/h12)
	h12
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/h11)
	h21
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/h22)
	h22
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/h21)
	h31
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/h32)
	h32
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/h31)
	h41
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/h42)
	h42
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/h41)
	h51
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/h52)
	h52
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/h51)
	h61
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/h62)
	h62
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/h61)
	h71
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/h72)
	h72
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/h71)
	h81
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/h82)
	h82
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/h81)
	h91
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/h92)
	h92
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/h91)
	hh101
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/hh102)
	hh102
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/hh101)
	hh111
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/hh112)
	hh112
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/hh111)
	hh121
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/hh122)
	hh122
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/hh121)
	hh131
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/hh132)
	hh132
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/hh131)
	hh141
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/hh142)
	hh142
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/hh141)
	hh151
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/hh152)
	hh152
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/hh151)
	hh161
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/hh162)
	hh162
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/hh161)



	aca1
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/aca2)
	aca2
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/aca1)


	police1
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/police2)
	police2
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/police1)

	police1e
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/police2e)
	police2e
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/police1e)

	cs1
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/cs2)
	cs2
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/cs1)

	w1
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/w2)
	w2
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/w1)

	th11
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/th21)
	th21
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/th11)

	th12
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/th22)
	th22
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/th12)

	th13
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/th23)
	th23
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/th13)


	mkage1
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/mkage2)
	mkage2
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/kiri/mkage1)


turf/suna
	layer = 1000
	h11
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/suna/h12)
	h12
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/suna/h11)
	h21
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/suna/h22)
	h22
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/suna/h21)
	h31
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/suna/h32)
	h32
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/suna/h31)
	h41
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/suna/h42)
	h42
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/suna/h41)
	h51
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/suna/h52)
	h52
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/suna/h51)
	h61
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/suna/h62)
	h62
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/suna/h61)
	h71
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/suna/h72)
	h72
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/suna/h71)
	h81
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/suna/h82)
	h82
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/suna/h81)
	h91
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/suna/h92)
	h92
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/suna/h91)


	aca1
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/suna/aca2)
	aca2
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/suna/aca1)


	police1
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/suna/police2)
	police2
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/suna/police1)

	police1e
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/suna/police2e)
	police2e
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/suna/police1e)

	cs1
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/suna/cs2)
	cs2
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/suna/cs1)

	w1
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/suna/w2)
	w2
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/suna/w1)



	kkage1
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/suna/kkage2)
	kkage2
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/suna/kkage1)














turf/newsuna
	layer = 1000
	gen1
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/newsuna/gen2)
	gen2
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/newsuna/gen1)

	gen1a
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/newsuna/gen2a)
	gen2a
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/newsuna/gen1a)


	gen1b
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/newsuna/gen2b)
	gen2b
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/newsuna/gen1b)

	gen1b
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/newsuna/gen2b)
	gen2b
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/newsuna/gen1b)


	gen1c
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/newsuna/gen2c)
	gen2c
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/newsuna/gen1c)


	gen1d
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/newsuna/gen2d)
	gen2d
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/newsuna/gen1d)




	gen1e
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/newsuna/gen2e)
	gen2e
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/newsuna/gen1e)


	gen1f
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/newsuna/gen2f)
	gen2f
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/newsuna/gen1f)


turf
	WARPEREXTRA
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			if(M.RecentVerbCheck("Teleport", 0)) return
			M.recentverbs["Teleport"]=world.realtime
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			if(M.chakraOverlay) M.chakraOverlay.loc = M.loc
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		Sect1A
			A1
				goingto=/turf/WARPEREXTRA/Sect1A/A2
			A2
				goingto=/turf/WARPEREXTRA/Sect1A/A1

			B1
				goingto=/turf/WARPEREXTRA/Sect1A/B2
			B2
				goingto=/turf/WARPEREXTRA/Sect1A/B1
			C1
				goingto=/turf/WARPEREXTRA/Sect1A/C2
			C2
				goingto=/turf/WARPEREXTRA/Sect1A/C1

			D1
				goingto=/turf/WARPEREXTRA/Sect1A/D2
			D2
				goingto=/turf/WARPEREXTRA/Sect1A/D1

			E1
				goingto=/turf/WARPEREXTRA/Sect1A/E2
			E2
				goingto=/turf/WARPEREXTRA/Sect1A/E1

			F1
				goingto=/turf/WARPEREXTRA/Sect1A/F2
			F2
				goingto=/turf/WARPEREXTRA/Sect1A/F1
			G1
				goingto=/turf/WARPEREXTRA/Sect1A/G2
			G2
				goingto=/turf/WARPEREXTRA/Sect1A/G1






			H1
				goingto=/turf/WARPEREXTRA/Sect1A/H2
			H2
				goingto=/turf/WARPEREXTRA/Sect1A/H1

			I1
				goingto=/turf/WARPEREXTRA/Sect1A/I2
			I2
				goingto=/turf/WARPEREXTRA/Sect1A/I1

			J1
				goingto=/turf/WARPEREXTRA/Sect1A/J2
			J2
				goingto=/turf/WARPEREXTRA/Sect1A/J1

			K1
				goingto=/turf/WARPEREXTRA/Sect1A/K2
			K2
				goingto=/turf/WARPEREXTRA/Sect1A/K1
			L1
				goingto=/turf/WARPEREXTRA/Sect1A/L2
			L2
				goingto=/turf/WARPEREXTRA/Sect1A/L1

		Sect2A
			A1
				goingto=/turf/WARPEREXTRA/Sect2A/A2
			A2
				goingto=/turf/WARPEREXTRA/Sect2A/A1

			B1
				goingto=/turf/WARPEREXTRA/Sect2A/B2
			B2
				goingto=/turf/WARPEREXTRA/Sect2A/B1
			C1
				goingto=/turf/WARPEREXTRA/Sect2A/C2
			C2
				goingto=/turf/WARPEREXTRA/Sect2A/C1

			D1
				goingto=/turf/WARPEREXTRA/Sect2A/D2
			D2
				goingto=/turf/WARPEREXTRA/Sect2A/D1

			E1
				goingto=/turf/WARPEREXTRA/Sect2A/E2
			E2
				goingto=/turf/WARPEREXTRA/Sect2A/E1

			F1
				goingto=/turf/WARPEREXTRA/Sect2A/F2
			F2
				goingto=/turf/WARPEREXTRA/Sect2A/F1
			G1
				goingto=/turf/WARPEREXTRA/Sect2A/G2
			G2
				goingto=/turf/WARPEREXTRA/Sect2A/G1






			H1
				goingto=/turf/WARPEREXTRA/Sect2A/H2
			H2
				goingto=/turf/WARPEREXTRA/Sect2A/H1

			I1
				goingto=/turf/WARPEREXTRA/Sect2A/I2
			I2
				goingto=/turf/WARPEREXTRA/Sect2A/I1

			J1
				goingto=/turf/WARPEREXTRA/Sect2A/J2
			J2
				goingto=/turf/WARPEREXTRA/Sect2A/J1

			K1
				goingto=/turf/WARPEREXTRA/Sect2A/K2
			K2
				goingto=/turf/WARPEREXTRA/Sect2A/K1
			L1
				goingto=/turf/WARPEREXTRA/Sect2A/L2
			L2
				goingto=/turf/WARPEREXTRA/Sect2A/L1










		Sect3A
			A1
				goingto=/turf/WARPEREXTRA/Sect3A/A2
			A2
				goingto=/turf/WARPEREXTRA/Sect3A/A1

			B1
				goingto=/turf/WARPEREXTRA/Sect3A/B2
			B2
				goingto=/turf/WARPEREXTRA/Sect3A/B1
			C1
				goingto=/turf/WARPEREXTRA/Sect3A/C2
			C2
				goingto=/turf/WARPEREXTRA/Sect3A/C1

			D1
				goingto=/turf/WARPEREXTRA/Sect3A/D2
			D2
				goingto=/turf/WARPEREXTRA/Sect3A/D1

			E1
				goingto=/turf/WARPEREXTRA/Sect3A/E2
			E2
				goingto=/turf/WARPEREXTRA/Sect3A/E1

			F1
				goingto=/turf/WARPEREXTRA/Sect3A/F2
			F2
				goingto=/turf/WARPEREXTRA/Sect3A/F1
			G1
				goingto=/turf/WARPEREXTRA/Sect3A/G2
			G2
				goingto=/turf/WARPEREXTRA/Sect3A/G1






			H1
				goingto=/turf/WARPEREXTRA/Sect3A/H2
			H2
				goingto=/turf/WARPEREXTRA/Sect3A/H1

			I1
				goingto=/turf/WARPEREXTRA/Sect3A/I2
			I2
				goingto=/turf/WARPEREXTRA/Sect3A/I1

			J1
				goingto=/turf/WARPEREXTRA/Sect3A/J2
			J2
				goingto=/turf/WARPEREXTRA/Sect3A/J1

			K1
				goingto=/turf/WARPEREXTRA/Sect3A/K2
			K2
				goingto=/turf/WARPEREXTRA/Sect3A/K1
			L1
				goingto=/turf/WARPEREXTRA/Sect3A/L2
			L2
				goingto=/turf/WARPEREXTRA/Sect3A/L1


turf
	WARPERSUNA
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			if(M.RecentVerbCheck("Teleport", 0)) return
			M.recentverbs["Teleport"]=world.realtime
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			if(M.chakraOverlay) M.chakraOverlay.loc = M.loc
			M.teleporting = 0
			M.density = 1
		Exited()
			usr.layer=initial(usr.layer)
		Sect1A
			A1
				goingto=/turf/WARPERSUNA/Sect1A/A2
			A2
				goingto=/turf/WARPERSUNA/Sect1A/A1

			B1
				goingto=/turf/WARPERSUNA/Sect1A/B2
			B2
				goingto=/turf/WARPERSUNA/Sect1A/B1

			C1
				goingto=/turf/WARPERSUNA/Sect1A/C2
			C2
				goingto=/turf/WARPERSUNA/Sect1A/C1

			D1
				goingto=/turf/WARPERSUNA/Sect1A/D2
			D2
				goingto=/turf/WARPERSUNA/Sect1A/D1

			E1
				goingto=/turf/WARPERSUNA/Sect1A/E2
			E2
				goingto=/turf/WARPERSUNA/Sect1A/E1

			F1
				goingto=/turf/WARPERSUNA/Sect1A/F2
			F2
				goingto=/turf/WARPERSUNA/Sect1A/F1

			G1
				goingto=/turf/WARPERSUNA/Sect1A/G2
			G2
				goingto=/turf/WARPERSUNA/Sect1A/G1

			H1
				goingto=/turf/WARPERSUNA/Sect1A/H2
			H2
				goingto=/turf/WARPERSUNA/Sect1A/H1

			I1
				goingto=/turf/WARPERSUNA/Sect1A/I2
			I2
				goingto=/turf/WARPERSUNA/Sect1A/I1

			J1
				goingto=/turf/WARPERSUNA/Sect1A/J2
			J2
				goingto=/turf/WARPERSUNA/Sect1A/J1

			K1
				goingto=/turf/WARPERSUNA/Sect1A/K2
			K2
				goingto=/turf/WARPERSUNA/Sect1A/K1

			L1
				goingto=/turf/WARPERSUNA/Sect1A/L2
			L2
				goingto=/turf/WARPERSUNA/Sect1A/L1

			M1
				goingto=/turf/WARPERSUNA/Sect1A/M2
			M2
				goingto=/turf/WARPERSUNA/Sect1A/M1

			N1
				goingto=/turf/WARPERSUNA/Sect1A/N2
			N2
				goingto=/turf/WARPERSUNA/Sect1A/N1

			O1
				goingto=/turf/WARPERSUNA/Sect1A/O2
			O2
				goingto=/turf/WARPERSUNA/Sect1A/O1

			P1
				goingto=/turf/WARPERSUNA/Sect1A/P2
			P2
				goingto=/turf/WARPERSUNA/Sect1A/P1

			Q1
				goingto=/turf/WARPERSUNA/Sect1A/Q2
			Q2
				goingto=/turf/WARPERSUNA/Sect1A/Q1

			R1
				goingto=/turf/WARPERSUNA/Sect1A/R2
			R2
				goingto=/turf/WARPERSUNA/Sect1A/R1

			S1
				goingto=/turf/WARPERSUNA/Sect1A/S2
			S2
				goingto=/turf/WARPERSUNA/Sect1A/S1

			T1
				goingto=/turf/WARPERSUNA/Sect1A/T2
			T2
				goingto=/turf/WARPERSUNA/Sect1A/T1

			U1
				goingto=/turf/WARPERSUNA/Sect1A/U2
			U2
				goingto=/turf/WARPERSUNA/Sect1A/U1

			V1
				goingto=/turf/WARPERSUNA/Sect1A/V2
			V2
				goingto=/turf/WARPERSUNA/Sect1A/V1

			W1
				goingto=/turf/WARPERSUNA/Sect1A/W2
			W2
				goingto=/turf/WARPERSUNA/Sect1A/W1

			X1
				goingto=/turf/WARPERSUNA/Sect1A/X2
			X2
				goingto=/turf/WARPERSUNA/Sect1A/X1

			Y1
				goingto=/turf/WARPERSUNA/Sect1A/Y2
			Y2
				goingto=/turf/WARPERSUNA/Sect1A/Y1

			Z1
				goingto=/turf/WARPERSUNA/Sect1A/Z2
			Z2
				goingto=/turf/WARPERSUNA/Sect1A/Z1

			Za1
				goingto=/turf/WARPERSUNA/Sect1A/Za2
			Za2
				goingto=/turf/WARPERSUNA/Sect1A/Za1


		Hospital
			A1
				goingto=/turf/WARPERSUNA/Hospital/A2
			A2
				goingto=/turf/WARPERSUNA/Hospital/A1

			B1
				goingto=/turf/WARPERSUNA/Hospital/B2
			B2
				goingto=/turf/WARPERSUNA/Hospital/B1


		Kage
			A1
				goingto=/turf/WARPERSUNA/Kage/A2
			A2
				goingto=/turf/WARPERSUNA/Kage/A1

			B1
				goingto=/turf/WARPERSUNA/Kage/B2
			B2
				goingto=/turf/WARPERSUNA/Kage/B1

			C1
				goingto=/turf/WARPERSUNA/Kage/C2
			C2
				goingto=/turf/WARPERSUNA/Kage/C1

			D1
				goingto=/turf/WARPERSUNA/Kage/D2
			D2
				goingto=/turf/WARPERSUNA/Kage/D1


		Building3
			A1
				goingto=/turf/WARPERSUNA/Building3/A2
			A2
				goingto=/turf/WARPERSUNA/Building3/A1

			B1
				goingto=/turf/WARPERSUNA/Building3/B2
			B2
				goingto=/turf/WARPERSUNA/Building3/B1

			C1
				goingto=/turf/WARPERSUNA/Building3/C2
			C2
				goingto=/turf/WARPERSUNA/Building3/C1

			D1
				goingto=/turf/WARPERSUNA/Building3/D2
			D2
				goingto=/turf/WARPERSUNA/Building3/D1

		Building1
			A1
				goingto=/turf/WARPERSUNA/Building1/A2
			A2
				goingto=/turf/WARPERSUNA/Building1/A1

			B1
				goingto=/turf/WARPERSUNA/Building1/B2
			B2
				goingto=/turf/WARPERSUNA/Building1/B1
		Building
			A1
				goingto=/turf/WARPERSUNA/Building/A2
			A2
				goingto=/turf/WARPERSUNA/Building/A1

			B1
				goingto=/turf/WARPERSUNA/Building/B2
			B2
				goingto=/turf/WARPERSUNA/Building/B1

			C1
				goingto=/turf/WARPERSUNA/Building/C2
			C2
				goingto=/turf/WARPERSUNA/Building/C1

			D1
				goingto=/turf/WARPERSUNA/Building/D2
			D2
				goingto=/turf/WARPERSUNA/Building/D1

			E1
				goingto=/turf/WARPERSUNA/Building/E2
			E2
				goingto=/turf/WARPERSUNA/Building/E1

			F1
				goingto=/turf/WARPERSUNA/Building/F2
			F2
				goingto=/turf/WARPERSUNA/Building/F1

			G1
				goingto=/turf/WARPERSUNA/Building/G2
			G2
				goingto=/turf/WARPERSUNA/Building/G1

			H1
				goingto=/turf/WARPERSUNA/Building/H2
			H2
				goingto=/turf/WARPERSUNA/Building/H1

			I1
				goingto=/turf/WARPERSUNA/Building/I2
			I2
				goingto=/turf/WARPERSUNA/Building/I1

			J1
				goingto=/turf/WARPERSUNA/Building/J2
			J2
				goingto=/turf/WARPERSUNA/Building/J1

			M1
				goingto=/turf/WARPERSUNA/Building/M2
			M2
				goingto=/turf/WARPERSUNA/Building/M1

			N1
				goingto=/turf/WARPERSUNA/Building/N2
			N2
				goingto=/turf/WARPERSUNA/Building/N1











	WARPERSNOW
		layer=999
		density=0
		var/goingto
		Entered(mob/M)
			if(!ismob(M)) return
			if(M.teleporting) return
			if(M.RecentVerbCheck("Teleport", 0)) return
			M.recentverbs["Teleport"]=world.realtime
			M.teleporting = 1
			M.density = 0
			M.Move(locate(goingto))
			if(M.chakraOverlay) M.chakraOverlay.loc = M.loc
			M.teleporting = 0
			M.density = 1
		Sect1A
			A1
				goingto=/turf/WARPERSNOW/Sect1A/B1
			A2
				goingto=/turf/WARPERSNOW/Sect1A/B2
			B1
				goingto=/turf/WARPERSNOW/Sect1A/A1
			B2
				goingto=/turf/WARPERSNOW/Sect1A/A2



			C1
				goingto=/turf/WARPERSNOW/Sect1A/D1
			C2
				goingto=/turf/WARPERSNOW/Sect1A/D2
			D1
				goingto=/turf/WARPERSNOW/Sect1A/C1
			D2
				goingto=/turf/WARPERSNOW/Sect1A/C2

			E1
				goingto=/turf/WARPERSNOW/Sect1A/F1
			E2
				goingto=/turf/WARPERSNOW/Sect1A/F2
			F1
				goingto=/turf/WARPERSNOW/Sect1A/E1
			F2
				goingto=/turf/WARPERSNOW/Sect1A/E2
		Sect1
			A1
				goingto=/turf/WARPERSNOW/Sect1/B1
			A2
				goingto=/turf/WARPERSNOW/Sect1/B2
			B1
				goingto=/turf/WARPERSNOW/Sect1/A1
			B2
				goingto=/turf/WARPERSNOW/Sect1/A2



			C1
				goingto=/turf/WARPERSNOW/Sect1/D1
			C2
				goingto=/turf/WARPERSNOW/Sect1/D2
			D1
				goingto=/turf/WARPERSNOW/Sect1/C1
			D2
				goingto=/turf/WARPERSNOW/Sect1/C2

			E1
				goingto=/turf/WARPERSNOW/Sect1/F1
			E2
				goingto=/turf/WARPERSNOW/Sect1/F2
			F1
				goingto=/turf/WARPERSNOW/Sect1/E1
			F2
				goingto=/turf/WARPERSNOW/Sect1/E2
		Sect2
			A1
				goingto=/turf/WARPERSNOW/Sect2/B1
			A2
				goingto=/turf/WARPERSNOW/Sect2/B2
			B1
				goingto=/turf/WARPERSNOW/Sect2/A1
			B2
				goingto=/turf/WARPERSNOW/Sect2/A2



			C1
				goingto=/turf/WARPERSNOW/Sect2/D1
			C2
				goingto=/turf/WARPERSNOW/Sect2/D2
			D1
				goingto=/turf/WARPERSNOW/Sect2/C1
			D2
				goingto=/turf/WARPERSNOW/Sect2/C2

			E1
				goingto=/turf/WARPERSNOW/Sect2/F1
			E2
				goingto=/turf/WARPERSNOW/Sect2/F2
			F1
				goingto=/turf/WARPERSNOW/Sect2/E1
			F2
				goingto=/turf/WARPERSNOW/Sect2/E2
		Sect3
			A1
				goingto=/turf/WARPERSNOW/Sect3/B1
			A2
				goingto=/turf/WARPERSNOW/Sect3/B2
			B1
				goingto=/turf/WARPERSNOW/Sect3/A1
			B2
				goingto=/turf/WARPERSNOW/Sect3/A2



			C1
				goingto=/turf/WARPERSNOW/Sect3/D1
			C2
				goingto=/turf/WARPERSNOW/Sect3/D2
			D1
				goingto=/turf/WARPERSNOW/Sect3/C1
			D2
				goingto=/turf/WARPERSNOW/Sect3/C2

			E1
				goingto=/turf/WARPERSNOW/Sect3/F1
			E2
				goingto=/turf/WARPERSNOW/Sect3/F2
			F1
				goingto=/turf/WARPERSNOW/Sect3/E1
			F2
				goingto=/turf/WARPERSNOW/Sect3/E2
		Sect4
			A1
				goingto=/turf/WARPERSNOW/Sect4/B1
			A2
				goingto=/turf/WARPERSNOW/Sect4/B2
			B1
				goingto=/turf/WARPERSNOW/Sect4/A1
			B2
				goingto=/turf/WARPERSNOW/Sect4/A2



			C1
				goingto=/turf/WARPERSNOW/Sect4/D1
			C2
				goingto=/turf/WARPERSNOW/Sect4/D2
			D1
				goingto=/turf/WARPERSNOW/Sect4/C1
			D2
				goingto=/turf/WARPERSNOW/Sect4/C2

			E1
				goingto=/turf/WARPERSNOW/Sect4/F1
			E2
				goingto=/turf/WARPERSNOW/Sect4/F2
			F1
				goingto=/turf/WARPERSNOW/Sect4/E1
			F2
				goingto=/turf/WARPERSNOW/Sect4/E2
		Sect5
			A1
				goingto=/turf/WARPERSNOW/Sect5/B1
			A2
				goingto=/turf/WARPERSNOW/Sect5/B2
			B1
				goingto=/turf/WARPERSNOW/Sect5/A1
			B2
				goingto=/turf/WARPERSNOW/Sect5/A2



			C1
				goingto=/turf/WARPERSNOW/Sect5/D1
			C2
				goingto=/turf/WARPERSNOW/Sect5/D2
			D1
				goingto=/turf/WARPERSNOW/Sect5/C1
			D2
				goingto=/turf/WARPERSNOW/Sect5/C2

			E1
				goingto=/turf/WARPERSNOW/Sect5/F1
			E2
				goingto=/turf/WARPERSNOW/Sect5/F2
			F1
				goingto=/turf/WARPERSNOW/Sect5/E1
			F2
				goingto=/turf/WARPERSNOW/Sect5/E2
		Sect6
			A1
				goingto=/turf/WARPERSNOW/Sect6/B1
			A2
				goingto=/turf/WARPERSNOW/Sect6/B2
			B1
				goingto=/turf/WARPERSNOW/Sect6/A1
			B2
				goingto=/turf/WARPERSNOW/Sect6/A2



			C1
				goingto=/turf/WARPERSNOW/Sect6/D1
			C2
				goingto=/turf/WARPERSNOW/Sect6/D2
			D1
				goingto=/turf/WARPERSNOW/Sect6/C1
			D2
				goingto=/turf/WARPERSNOW/Sect6/C2

			E1
				goingto=/turf/WARPERSNOW/Sect6/F1
			E2
				goingto=/turf/WARPERSNOW/Sect6/F2
			F1
				goingto=/turf/WARPERSNOW/Sect6/E1
			F2
				goingto=/turf/WARPERSNOW/Sect6/E2
		Sect7
			A1
				goingto=/turf/WARPERSNOW/Sect7/B1
			A2
				goingto=/turf/WARPERSNOW/Sect7/B2
			B1
				goingto=/turf/WARPERSNOW/Sect7/A1
			B2
				goingto=/turf/WARPERSNOW/Sect7/A2



			C1
				goingto=/turf/WARPERSNOW/Sect7/D1
			C2
				goingto=/turf/WARPERSNOW/Sect7/D2
			D1
				goingto=/turf/WARPERSNOW/Sect7/C1
			D2
				goingto=/turf/WARPERSNOW/Sect7/C2

			E1
				goingto=/turf/WARPERSNOW/Sect7/F1
			E2
				goingto=/turf/WARPERSNOW/Sect7/F2
			F1
				goingto=/turf/WARPERSNOW/Sect7/E1
			F2
				goingto=/turf/WARPERSNOW/Sect7/E2
		Sect8
			A1
				goingto=/turf/WARPERSNOW/Sect8/B1
			A2
				goingto=/turf/WARPERSNOW/Sect8/B2
			B1
				goingto=/turf/WARPERSNOW/Sect8/A1
			B2
				goingto=/turf/WARPERSNOW/Sect8/A2



			C1
				goingto=/turf/WARPERSNOW/Sect8/D1
			C2
				goingto=/turf/WARPERSNOW/Sect8/D2
			D1
				goingto=/turf/WARPERSNOW/Sect8/C1
			D2
				goingto=/turf/WARPERSNOW/Sect8/C2

			E1
				goingto=/turf/WARPERSNOW/Sect8/F1
			E2
				goingto=/turf/WARPERSNOW/Sect8/F2
			F1
				goingto=/turf/WARPERSNOW/Sect8/E1
			F2
				goingto=/turf/WARPERSNOW/Sect8/E2
		Sect9
			A1
				goingto=/turf/WARPERSNOW/Sect9/B1
			A2
				goingto=/turf/WARPERSNOW/Sect9/B2
			B1
				goingto=/turf/WARPERSNOW/Sect9/A1
			B2
				goingto=/turf/WARPERSNOW/Sect9/A2



			C1
				goingto=/turf/WARPERSNOW/Sect9/D1
			C2
				goingto=/turf/WARPERSNOW/Sect9/D2
			D1
				goingto=/turf/WARPERSNOW/Sect9/C1
			D2
				goingto=/turf/WARPERSNOW/Sect9/C2

			E1
				goingto=/turf/WARPERSNOW/Sect9/F1
			E2
				goingto=/turf/WARPERSNOW/Sect9/F2
			F1
				goingto=/turf/WARPERSNOW/Sect9/E1
			F2
				goingto=/turf/WARPERSNOW/Sect9/E2
		Sect10
			A1
				goingto=/turf/WARPERSNOW/Sect10/B1
			A2
				goingto=/turf/WARPERSNOW/Sect10/B2
			B1
				goingto=/turf/WARPERSNOW/Sect10/A1
			B2
				goingto=/turf/WARPERSNOW/Sect10/A2



			C1
				goingto=/turf/WARPERSNOW/Sect10/D1
			C2
				goingto=/turf/WARPERSNOW/Sect10/D2
			D1
				goingto=/turf/WARPERSNOW/Sect10/C1
			D2
				goingto=/turf/WARPERSNOW/Sect10/C2

			E1
				goingto=/turf/WARPERSNOW/Sect10/F1
			E2
				goingto=/turf/WARPERSNOW/Sect10/F2
			F1
				goingto=/turf/WARPERSNOW/Sect10/E1
			F2
				goingto=/turf/WARPERSNOW/Sect10/E2
		Sect11
			A1
				goingto=/turf/WARPERSNOW/Sect11/B1
			A2
				goingto=/turf/WARPERSNOW/Sect11/B2
			B1
				goingto=/turf/WARPERSNOW/Sect11/A1
			B2
				goingto=/turf/WARPERSNOW/Sect11/A2



			C1
				goingto=/turf/WARPERSNOW/Sect11/D1
			C2
				goingto=/turf/WARPERSNOW/Sect11/D2
			D1
				goingto=/turf/WARPERSNOW/Sect11/C1
			D2
				goingto=/turf/WARPERSNOW/Sect11/C2

			E1
				goingto=/turf/WARPERSNOW/Sect11/F1
			E2
				goingto=/turf/WARPERSNOW/Sect11/F2
			F1
				goingto=/turf/WARPERSNOW/Sect11/E1
			F2
				goingto=/turf/WARPERSNOW/Sect11/E2
		Sect12
			A1
				goingto=/turf/WARPERSNOW/Sect12/B1
			A2
				goingto=/turf/WARPERSNOW/Sect12/B2
			B1
				goingto=/turf/WARPERSNOW/Sect12/A1
			B2
				goingto=/turf/WARPERSNOW/Sect12/A2



			C1
				goingto=/turf/WARPERSNOW/Sect12/D1
			C2
				goingto=/turf/WARPERSNOW/Sect12/D2
			D1
				goingto=/turf/WARPERSNOW/Sect12/C1
			D2
				goingto=/turf/WARPERSNOW/Sect12/C2

			E1
				goingto=/turf/WARPERSNOW/Sect12/F1
			E2
				goingto=/turf/WARPERSNOW/Sect12/F2
			F1
				goingto=/turf/WARPERSNOW/Sect12/E1
			F2
				goingto=/turf/WARPERSNOW/Sect12/E2

		Sect13
			A1
				goingto=/turf/WARPERSNOW/Sect13/B1
			A2
				goingto=/turf/WARPERSNOW/Sect13/B2
			B1
				goingto=/turf/WARPERSNOW/Sect13/A1
			B2
				goingto=/turf/WARPERSNOW/Sect13/A2



			C1
				goingto=/turf/WARPERSNOW/Sect13/D1
			C2
				goingto=/turf/WARPERSNOW/Sect13/D2
			D1
				goingto=/turf/WARPERSNOW/Sect13/C1
			D2
				goingto=/turf/WARPERSNOW/Sect13/C2

			E1
				goingto=/turf/WARPERSNOW/Sect13/F1
			E2
				goingto=/turf/WARPERSNOW/Sect13/F2
			F1
				goingto=/turf/WARPERSNOW/Sect13/E1
			F2
				goingto=/turf/WARPERSNOW/Sect13/E2
		Sect14
			A1
				goingto=/turf/WARPERSNOW/Sect14/B1
			A2
				goingto=/turf/WARPERSNOW/Sect14/B2
			B1
				goingto=/turf/WARPERSNOW/Sect14/A1
			B2
				goingto=/turf/WARPERSNOW/Sect14/A2



			C1
				goingto=/turf/WARPERSNOW/Sect14/D1
			C2
				goingto=/turf/WARPERSNOW/Sect14/D2
			D1
				goingto=/turf/WARPERSNOW/Sect14/C1
			D2
				goingto=/turf/WARPERSNOW/Sect14/C2

			E1
				goingto=/turf/WARPERSNOW/Sect14/F1
			E2
				goingto=/turf/WARPERSNOW/Sect14/F2
			F1
				goingto=/turf/WARPERSNOW/Sect14/E1
			F2
				goingto=/turf/WARPERSNOW/Sect14/E2
		Sect15
			A1
				goingto=/turf/WARPERSNOW/Sect15/B1
			A2
				goingto=/turf/WARPERSNOW/Sect15/B2
			B1
				goingto=/turf/WARPERSNOW/Sect15/A1
			B2
				goingto=/turf/WARPERSNOW/Sect15/A2



			C1
				goingto=/turf/WARPERSNOW/Sect15/D1
			C2
				goingto=/turf/WARPERSNOW/Sect15/D2
			D1
				goingto=/turf/WARPERSNOW/Sect15/C1
			D2
				goingto=/turf/WARPERSNOW/Sect15/C2

			E1
				goingto=/turf/WARPERSNOW/Sect15/F1
			E2
				goingto=/turf/WARPERSNOW/Sect15/F2
			F1
				goingto=/turf/WARPERSNOW/Sect15/E1
			F2
				goingto=/turf/WARPERSNOW/Sect15/E2

