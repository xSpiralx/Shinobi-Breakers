/* mob
	proc
		build_shadow()
			underlays = null
			if(src.shadow) src.underlays -= src.shadow
			if(src.shadow_size && !src.noshadow)
				var/image/s_image
				switch(src.shadow_size)
					if(32) s_image = image('Icons/32.dmi')
					if(64) s_image = image('Icons/64.dmi')
					if(96) s_image = image('icons/96.dmi')
				s_image.layer = src.layer - 1
				s_image.pixel_x = src.shadow_x
				s_image.pixel_y = src.shadow_y
				src.shadow = s_image
				src.underlays += src.shadow
			generate_mirror()
		generate_mirror()
			var/icon/I = new/icon(src.icon,src.icon_state)
			for(var/icon/h in hair_stack)
				I.Blend(h, ICON_OVERLAY)
			if(src.facialhair) I.Blend(icon(src.facialhair,src.icon_state),ICON_OVERLAY)
			for(var/obj/items/o in src)
				if(o.suffix=="Equipped")
					var/icon/I2 = icon(o.icon,src.icon_state)
					I.Blend(I2,ICON_OVERLAY)
			I.Flip(WEST)
			var/obj/MR = new ; MR.icon = I ; MR.layer = 1; MR.alpha=145
			MR.transform = turn(MR.transform, 180)
			MR.pixel_y -= I.Height()
			src.underlays += MR

	var/
		image/shadow
		shadow_size = 32
		noshadow = 0 // 1 means no shadow, but yes lockon
		shadow_x = 0
		shadow_y = -4
*/

proc/clouds()
	return
	spawn()
		var/Y = 0
		var/Z = 1
		while(world)
			while(!Y)
				for(var/mob/P in world) if(P.client)
					if(prob(100))
						if(P.z == 1 || P.z == 2 || P.z == 3 || P.z == 4 || P.z == 5 || P.z == 6 || P.z == 7 || P.z == 8 || P.z == 9 || P.z == 10 || P.z == 11 || P.z == 12 ) continue
						Y = max(1, rand(P.y +4,P.y - 4))
						Z = P.z
				if(!Y) Y = rand(1,world.maxy)
			var/obj/cloud/BF = new
			BF.loc = locate(world.maxx,Y,Z)
			Y = 0
			sleep(200)

/*
obj/cloud/proc/cloud_death()
	while(alive)
		spawn(30)
			if(src.x <= 5) del src
*/
obj/cloud
    dir = 8
    layer = EFFECTS_LAYER + 1
    density = 0
    icon = 'Icons/cloud shadows.dmi'
    var/alive = 1
    New()
        icon_state = pick("1","2","3")
        walk(src,8,3)
        spawn(200) del src
