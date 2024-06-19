obj/event/Boulder
	icon = 'Boulder.dmi'
	layer = 5
obj/event/Fissure
	layer = 3
	icon = 'blueendrift32x32.dmi'
/mob/proc/earthquake(var/magnitude = 16, var/duration = 5, var/delay = world.tick_lag)
	if(!client) return
	spawn()
		while(--duration)
			if(client)
				if(client.pixel_y == magnitude)
					client.pixel_y = magnitude * -1
				else
					client.pixel_y = magnitude
			sleep(delay)
		if(client)
			client.pixel_x = 0
			client.pixel_y = 0

/proc/boulder(var/turf/T, var/travel = 7, var/fall = 15, var/fall_crater = "Yes")
	var/obj/event/Boulder/rock = new(T)
	rock.pixel_y = 32 * travel
	animate(rock,pixel_y=0,time = fall, easing = BOUNCE_EASING)
	rock.density=1
	spawn(5)
		for(var/mob/M in range(16,rock))
			M.earthquake(16,5)
		if(fall_crater == "Yes")
			var/obj/event/crater = new(T)
			crater.name = "Crater"
			crater.icon = 'Crater.dmi'
			crater.layer = 2
			crater.pixel_y=-32
			crater.pixel_x=-36
	spawn(11)
		for(var/mob/M in range(16,rock))
			M.earthquake(16,15)
	spawn(12)
		for(var/mob/M in range(16,rock))
			M.earthquake(16,15)

/proc/meteor_shower(var/z,var/length = 60 * 10)//length is in seconds
	var/list/turfs = list()
	for(var/turf/T in block(locate(1,1,z),locate(300,300,z)))
		turfs+=T
	while(length > 0)
		var/turf/T = pick(turfs)
		boulder(T,7,15,"Yes")
		length -= 10
		sleep(100)
		continue
mob/Admin3
	verb
		Earthquake(magnitude as num, dur as num)
			set category = "Admin"
			for(var/mob/m)
				if(m.z == z)
					m.earthquake(magnitude, dur)
			//world << output("The ground rumbles!", "outputall.output")
		Boulder(T as turf)
			var/length = input("How far will the boulder fall?","Travel Distance",7) as num
			var/fall = 15 //input("How long will it fall for?","Fall Time",15) as num
			var/fall_crater = alert("Is there a crater?","Alert","Yes","No")
			boulder(T,length,fall,fall_crater)
		Fissure(T as turf)
			var/size = input("Size of the hole? 32, 64, 128") as num
			var/obj/event/Fissure/hole = new(T)
			switch(size)
				if(33 to 64) hole.icon = 'blueendrift64x64.dmi'
				if(65 to 129) hole.icon = 'blueendrift128x128.dmi'
		Meteor_Shower()
			var/length = input("How long will the meteor shower last? (In seconds)","Length",600) as num
			src<<"Starting meteor shower."
			meteor_shower(z,length)