obj
	invisible1
		icon = 'bro.dmi'
		icon_state = "Honkus"
		layer=9000
		New()
			..()
			invisibility = 101

	Street_Light1
		icon='Powerline.dmi'
	Street_Light
		icon='Powerline.dmi'
		layer=MOB_LAYER+70
		C
			icon_state="c"
		D
			icon_state="d"
	Lightpoint
		luminosity=4
		var
			obj/light/light
			matrix
				on_matrix = matrix()
				off_matrix = matrix()
		New()
			..()
			light = new(src.loc)
			light.color=rgb(220,220,220)
			light.alpha = 200
			on_matrix.Scale(14)
			off_matrix.Scale(0)
			light.transform = on_matrix
			sleep(5)
			animate(light,color=rgb(220,220,220),time=4,loop=-1)
turf/Event
	candlethings
		name="Lights"
		icon='FestiveLanterns.dmi'
		layer=MOB_LAYER+9999999
obj/Gravestone
	icon='gravestone.dmi'
	density=1
obj/Event
	Lightpoint
		luminosity=5
		var
			obj/light/light
			matrix
				on_matrix = matrix()
				off_matrix = matrix()
		New()
			..()
			light = new(src.loc)
			light.color=rgb(220,220,220)
			light.alpha = 200
			on_matrix.Scale(14)
			off_matrix.Scale(0)
			light.transform = on_matrix
			sleep(5)
			animate(light,color=rgb(220,220,220),time=4,loop=-1)

turf/interiors
	Click()
		if(get_dist(src,usr)>1) return
		if(icon_state=="4"&&icon=='insidebathroom.dmi')
			usr<<output("You open the bathroom stall.","outputic.output")
			usr<<output("You open the bathroom stall.","outputall.output")
			icon_state="4open"
			density=0
			return
		if(icon_state=="4open"&&icon=='insidebathroom.dmi')
			usr<<output("You close the bathroom stall.","outputic.output")
			usr<<output("You close the bathroom stall.","outputall.output")
			icon_state="4"
			density=1
			return
		//if(icon_state=="w4")
		//	usr<<output("You turn the tap on.","outputic.output")
		//	usr<<output("You turn the tap on.","outputall.output")
		//	icon_state="sinkon"
		//	return

		//if(icon_state=="w2")
		//	usr<<output("You turn the tap on.","outputic.output")
		//	usr<<output("You turn the tap on.","outputall.output")
		//	icon_state="sinkon"
		//	return
		if(icon_state=="sinkon")
			usr<<output("You turn the tap off.","outputic.output")
			usr<<output("You turn the tap off.","outputall.output")
			icon_state="w4"
			return
		if(icon_state=="toliet")
			usr<<output("You flush the toilet.","outputic.output")
			usr<<output("You flush the toilet.","outputall.output")
			var/icon/i = new('insidebathroom.dmi',"flush")
			overlays += i
			spawn(15) overlays-=i
			return
		if(icon_state=="showeroff")
			usr<<output("You turn the shower on.","outputic.output")
			usr<<output("You turn the shower on.","outputall.output")
			icon_state="showeron"
			src.overlays+=image('insidebathroom.dmi',"showeron1",pixel_y=-32)
			return
		if(icon_state=="showeron")
			usr<<output("You turn the shower off.","outputic.output")
			usr<<output("You turn the shower off.","outputall.output")
			icon_state="showeroff"
			src.overlays-=image('insidebathroom.dmi',"showeron1",pixel_y=-32)
			return

	mirror
		icon='Mirror.dmi'
		icon_state="r"
	inside
		icon = 'inside.dmi'
	weaponstuff
		icon = 'weaponstuff.dmi'

	inside1
		icon = 'inside1.dmi'

	insidekiri
		icon = 'insidekiri.dmi'
		layer=2

	Sunainside
		icon = 'SUNAinside.dmi'

	inside2
		icon = 'inside2.dmi'


	insidechuunin
		icon = 'inside chuunin.dmi'

	sewer
		icon = 'Sewerinside.dmi'

	tiled
		icon = 'tiledwall.dmi'

	insidefloor
		icon = 'insidefloor.dmi'
		icon_state = "floor3"

	caveinterior
		icon = 'caveinside.dmi'

	insideroof
		icon = 'insideroof.dmi'
		layer=9

	insidemisc
		layer=3
		icon = 'insidemisc.dmi'

	insideprison
		layer=3
		icon = 'prison.dmi'

	insidemisc1
		layer=3
		icon = 'insidemisc1.dmi'

	insideschool
		icon = 'insideschool.dmi'

	inside4
		icon = 'inside4.dmi'

	inside3
		icon = 'inside3.dmi'

	inside5
		icon = 'inside5.dmi'

	insidebathroom
		icon = 'insidebathroom.dmi'

	insidehospital
		icon = 'insidehospital.dmi'

	club
		icon = 'clublights.dmi'
		mouse_opacity=0
		layer=9
	insideapps
		icon = 'insideapps.dmi'
		mouse_opacity=0


	insidedoor
		icon = 'door.dmi'

	tools
		black
			icon = 'Blank.dmi'
			density = 1
			opacity = 1
			layer=9000
		bland
			icon = 'Blank.dmi'
			density = 1
			layer=500

		opacity
			density = 1
			opacity = 1
			layer=9000

		trueopacity
			opacity = 1
			layer=9000

		density
			density = 1
			layer=9000

		borders
			icon = 'borders.dmi'
		lul
			icon = 'lul.dmi'

obj/items/var/Weight=1
obj/items/MouseDrop(over_object,src_location,over_location, src_control,over_control,params)
	if(over_control=="Container.Grid"&&usr.ContainerCheck)
		if(!src in usr.contents) return
		if(istype(src,/obj/items/Clothing/BYONDHat)) return
		if(istype(src,/obj/items/Clothing/)) if(src:worn) return
		if(istype(src,/obj/items/Weapon/)) if(src:worn) return
		var/obj/Container/T=usr.ContainerCheck
		if(src in T.contents) return
		if(src in T.Contents) return
		if(T.MaxCapacity>=(T.Capacity+src.Weight))
			T.Capacity+=src.Weight
			T.Contents+=src
			src.loc=null
			if(findtext(T.ContainerName,"body"))
				if(istype(src,/obj/items/Clothing/) || istype(src,/obj/items/Weapon/)) T.overlays+=src.icon

				if(istype(src,/obj/items/Clothing/Headband) && istype(T,/mob/))
					var/mob/C = T
					C.Headbands=src:Vill
					C.mouse_over_pointer=image('Symbols.dmi',"[src:Vill]")


			for(var/mob/M in hearers(13,usr))
				M << output("<font color = white>[M.getStrangerName(usr)] places [src.name] in [findtext(T.ContainerName,"body") ? "[T.ContainerName]" : "the [lowertext(T.ContainerName)]"].<font color = white>","outputic.output")
				M << output("<font color = white>[M.getStrangerName(usr)] places [src.name] in [findtext(T.ContainerName,"body") ? "[T.ContainerName]" : "the [lowertext(T.ContainerName)]"].<font color = white>","outputall.output")
			winset(usr,"Container.ContainerName","text=\"[T.ContainerName]\"")
			winset(usr,"Container","is-visible=true")
			winset(usr,"Container.Grid","cells=0x0")
			var/Row = 1
			usr<<output("Capacity: [T.Capacity]/[T.MaxCapacity]","Container.Grid:1,1")
			for(var/obj/items/O in T.Contents)
				if(!usr.client) continue
				Row++
				usr << output(O,"Container.Grid:1,[Row]")
				spawn() while(winget(usr,"Container","is-visible")=="true") sleep(10)
				usr << output("Weight: [O.Weight]","Container.Grid:2,[Row]")
	if(over_control=="mappane.map"&&usr.ContainerCheck)
		var/mob/M = usr
		if(M.MindTransfer) M=M.MindTransfer
		var/obj/Container/T=usr.ContainerCheck
		if(!T.Contents.Find(src)) return
		T.Capacity-=src.Weight
		T.Contents-=src
		T.overlays -= src.icon
		if(istype(src,/obj/items/Clothing/Headband) && istype(T,/mob/))
			var/mob/C = T
			C.Headbands=null
			C.mouse_over_pointer=image('Symbols.dmi',"None")
		if(T.Capacity<0) T.Capacity=0
		src.Move(M.loc)
		step(src,M.dir)
		winset(usr,"Container.ContainerName","text=\"[T.ContainerName]\"")
		winset(usr,"Container","is-visible=true")
		winset(usr,"Container.Grid","cells=0x0")
		var/Row = 1
		usr<<output("Capacity: [T.Capacity]/[T.MaxCapacity]","Container.Grid:1,1")
		for(var/obj/items/O in T.Contents)
			Row++
			usr << output(O,"Container.Grid:1,[Row]")
			spawn() while(winget(usr,"Container","is-visible")=="true") sleep(10)
			usr << output("Weight: [O.Weight]","Container.Grid:2,[Row]")

	if(over_control=="tabpane.info1"&&usr.ContainerCheck)
		var/obj/Container/T=usr.ContainerCheck
		if(!T.Contents.Find(src)) return
		if(istype(src,/obj/items/Ryo))
			var/hasryo
			for(var/obj/items/Ryo/R in usr.contents)
				hasryo=R
			if(hasryo)
				hasryo:amount+=src:amount
				hasryo:Update()
				del(src)
		if(istype(src,/obj/items/Bars))
			var/hasmineral=0
			for(var/obj/items/Bars/R in usr.contents)
				hasmineral=R
			if(hasmineral)
				hasmineral:amount+=src:amount
				hasmineral:Update()
				del(src)
		if(istype(src,/obj/items/Roots))
			var/hasmineral=0
			for(var/obj/items/Roots/R in usr.contents)
				hasmineral=R
			if(hasmineral)
				hasmineral:amount+=src:amount
				hasmineral:Update()
				del(src)
		if(istype(src,/obj/items/Cotton))
			var/hasmineral=0
			for(var/obj/items/Cotton/R in usr.contents)
				hasmineral=R
			if(hasmineral)
				hasmineral:amount+=src:amount
				hasmineral:Update()
				del(src)
		if(istype(src,/obj/items/Weapon/Shuriken))
			var/hasshuri=0
			for(var/obj/items/Weapon/Shuriken/R in usr.contents)
				hasshuri=R
			if(hasshuri)
				hasshuri:shuriken+=src:shuriken
				hasshuri:suffix = "You current have [hasshuri:shuriken] in this stack"
				del(src)
		if(istype(src,/obj/items/Weapon/Senbon))
			var/hassenbon=0
			for(var/obj/items/Weapon/Senbon/R in usr.contents)
				hassenbon=R
			if(hassenbon)
				hassenbon:senbon+=src:senbon
				hassenbon:suffix = "You current have [hassenbon:senbon] in this stack"
				del(src)
		T.Capacity-=src.Weight
		T.Contents-=src
		T.overlays -= src.icon

		if(istype(src,/obj/items/Clothing/Headband) && istype(T,/mob/))
			var/mob/C = T
			C.Headbands=null
			C.mouse_over_pointer=image('Symbols.dmi',"None")

		if(T.Capacity<0) T.Capacity=0
		src.Move(usr)
		for(var/mob/M in hearers(13,usr))
			M << output("<font color = white>[M.getStrangerName(usr)] removes [src.name] from [findtext(T.ContainerName,"body") ? "[T.ContainerName]" : "the [lowertext(T.ContainerName)]"].<font color = white>","outputic.output")
			M << output("<font color = white>[M.getStrangerName(usr)] removes [src.name] from [findtext(T.ContainerName,"body") ? "[T.ContainerName]" : "the [lowertext(T.ContainerName)]"].<font color = white>","outputall.output")
		winset(usr,"Container.ContainerName","text=\"[T.ContainerName]\"")
		winset(usr,"Container","is-visible=true")
		winset(usr,"Container.Grid","cells=0x0")
		var/Row = 1
		usr<<output("Capacity: [T.Capacity]/[T.MaxCapacity]","Container.Grid:1,1")
		for(var/obj/items/O in T.Contents)
			Row++
			usr << output(O,"Container.Grid:1,[Row]")
			spawn() while(winget(usr,"Container","is-visible")=="true") sleep(10)
			usr << output("Weight: [O.Weight]","Container.Grid:2,[Row]")
	..()

obj/Container
	layer=9999
	mouse_opacity=2
	var/Capacity=0
	var/MaxCapacity=10
	var/list/Contents=list()
	var/ContainerName="Container"
	var/Locked = 0
	var/password
	Click()
		if(get_dist(src,usr)>1) return
		if(usr.ContainerCheck) return
		if(Locked)
			usr<<output("The [ContainerName] seems to be locked.","outputall.output")
			usr<<output("The [ContainerName] seems to be locked.","outputic.output")
			return
		usr.move=0
		usr.ContainerCheck=src
		winset(usr,"Container.ContainerName","text=\"[ContainerName]\"")
		winset(usr,"Container","is-visible=true")
		winset(usr,"Container.Grid","cells=0x0")
		var/Row = 1
		usr<<output("Capacity: [Capacity]/[MaxCapacity]","Container.Grid:1,1")
		for(var/obj/items/O in Contents)
			Row++
			usr << output(O,"Container.Grid:1,[Row]")
			spawn() while(winget(usr,"Container","is-visible")=="true") sleep(10)
			usr << output("Weight: [O.Weight]","Container.Grid:2,[Row]")

mob/var/tmp/ContainerCheck=0
mob/verb/CloseContainer()
	set hidden=1
	winset(usr,"Container","is-visible=false")
	usr.ContainerCheck=null
	usr.move=1

