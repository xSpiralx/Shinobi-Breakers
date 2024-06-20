mob/proc/MapZoom()
	var/obj/map_zoom/Z = new() ; Z.appearance_flags = PLANE_MASTER | PIXEL_SCALE
	client.screen += Z
	animate(Z, transform = matrix()*client.iconsize, time = 4)


obj/map_zoom
	appearance_flags = PLANE_MASTER || PIXEL_SCALE
	screen_loc = "1,1"
	plane = 0

client/var/iconsize = 1 //this var is what defines by how much we zoom in!

client/MouseWheel(src,delta_x,delta_y,location,control,params) //Control zooming with the mouse wheel!
	if(usr.client && control =="mappane.map")
		var/obj/map_zoom/z =  locate() in usr.client.screen
		if(z)
			if(delta_y>=1)
				if(iconsize>= 6) return
				iconsize += 0.1
				animate(z, transform = matrix()*iconsize, time = 2)
				return
			if(delta_y<=-1)
				iconsize -= 0.1
				if(iconsize<= 1)
					iconsize = 1
					animate(z, transform = matrix()*iconsize, time = 2)
					return

				animate(z, transform = matrix()*(iconsize), time = 2)
				return

