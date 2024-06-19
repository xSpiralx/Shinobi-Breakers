proc
	sd_OutsideLight(n as num)
		outside_light = n
		for(var/mob/M in world)
			if(M.darkness) if(M.darkness.alpha == 200) continue
			M.setLightOverlay(n)

mob
	var/
		obj/light/light
		image
			darkness/darkness
			master_plane/master_plane
var
	outside_light = 0

image
	master_plane
		plane = 0
		blend_mode = BLEND_MULTIPLY
		appearance_flags = PLANE_MASTER | NO_CLIENT_COLOR
		color = list(null,null,null,"#0000","#000f")
		mouse_opacity = 0

	darkness
		plane = -1
		blend_mode = BLEND_ADD
		mouse_opacity = 0
		icon = 'darkness.dmi'
		New()
			..()
			var/matrix/m = matrix()
			m.Scale(world.view*2.2)
			transform = m


obj/light
	plane = -1
	blend_mode = BLEND_ADD
	icon = 'light32.dmi'
	mouse_opacity = 0

obj
	Lantern
		luminosity=3
		icon='Lantern.dmi'
		var/off="lanternoff"
		var/level=1
		var
			obj/light/light
			matrix
				on_matrix = matrix()
				off_matrix = matrix()
		New()
			..()
			light = new(src.loc)
			on_matrix.Scale(8)
			off_matrix.Scale(0)
			light.transform = off_matrix
			Toggle()
		proc/Toggle()
			if(icon_state == initial(icon_state))
				usr<<output("You turn off the lantern.","outputic.output")
				usr<<output("You turn off the lantern.","outputall.output")
				icon_state = off
				animate(light,transform=off_matrix,time=5)
				light.color = null
			else
				usr<<output("You turn on the lantern.","outputic.output")
				usr<<output("You turn on the lantern.","outputall.output")
				icon_state = initial(icon_state)
				animate(light,transform=on_matrix,time=5)
				sleep(6)
				// And flickering...
				animate(light,color=rgb(220,220,220),time=4,loop=-1)
		Stand_Up
			icon_state="stand"
			off="standoff"
		Hung
			icon_state="lantern"
		Inside
			icon = 'indoorlamp.dmi'
			off = "off"
			icon_state = "on"
			density = 1
		Click()
			if(get_dist(src,usr)>2) return
			var/area/A = src.loc.loc
			if(!A) return
			if(!A.Powered)
				usr<<output("Nothing happens when you flick the lantern on.","outputic.output")
				usr<<output("Nothing happens when you flick the lantern on.","outputall.output")
				return
			Toggle()

mob/proc/addLightPlane()
	if(!master_plane) master_plane = new(loc=src)
	else master_plane.loc = src
	if(!darkness) darkness = new/image/darkness(loc=src)
	else darkness.loc = src
	darkness.alpha = 200
	src << master_plane
	src << darkness

mob/proc/removeLightPlane()
	client.screen -= master_plane
	client.screen -= darkness
	del(darkness)
	del(master_plane)

mob/proc/setLightOverlay(var/light)
	light = abs(light)
	switch(light)
		if(0) light = 100
		if(1) light = 200
		if(2) light = 255
		if(3) light = 255
		if(4) light = 255
		if(5) light = 255
		if(6) light = 225
		if(7) light = 255
	if(darkness) animate(darkness,alpha=light,time=15)

