obj/build/Housing/
	Furniture
		layer = 74
		Lanterns
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
				// With some fancy turning off and on animation...
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
				name = "Hanging Lamp"
				icon_state="lantern"
			Inside
				name = "Standup Lamp"
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
		Chair
			icon = 'insidehospital.dmi'
			icon_state = "c1"
		Television
			name = "Television"
			icon = 'insideapps.dmi'
			icon_state = "tv1"
			density = 1
			var/parents
			var/list/parts = list()
			TV3
				icon_state = "tv3"
				New()
					..()
					x++
			TV2
				icon_state="tv2"
				New()
					..()
					verbs -= typesof(/obj/build/Housing/Furniture/verb/)
					x+=2
			TV4
				icon_state="tv4"
				New()
					..()
					verbs -= typesof(/obj/build/Housing/Furniture/verb/)
					y++
			TV6
				icon_state="tv6"
				New()
					..()
					verbs -= typesof(/obj/build/Housing/Furniture/verb/)
					x++
					y++
			TV5
				icon_state="tv5"
				New()
					..()
					verbs -= typesof(/obj/build/Housing/Furniture/verb/)
					y++
					x+=2
			Place()
				..()
				var/obj/build/Housing/Furniture/Television/TV2/A = new(src.loc)
				var/obj/build/Housing/Furniture/Television/TV3/B = new(src.loc)
				var/obj/build/Housing/Furniture/Television/TV4/C = new(src.loc)
				var/obj/build/Housing/Furniture/Television/TV5/D = new(src.loc)
				var/obj/build/Housing/Furniture/Television/TV6/E = new(src.loc)
				A.parents = src
				B.parents = src
				C.parents = src
				D.parents = src
				E.parents = src
			Take()
				..()
				for(var/obj/build/Housing/Furniture/Television/i in world) if(i.parents == src) del(i)
		Couch
			layer = 5
			name = "Couch"
			icon = 'insideapps.dmi'
			icon_state = "couc1"
			var/orientation = ""
			var/parents
			var/list/parts = list()
			couch3
				icon_state = "couc3"
				New()
					..()
					verbs -= typesof(/obj/build/Housing/Furniture/verb/)
					x+=2
			couch2
				icon_state="couc2"
				New()
					..()
					verbs -= typesof(/obj/build/Housing/Furniture/verb/)
					y--
			couch4
				icon_state="couc4"
				New()
					..()
					verbs -= typesof(/obj/build/Housing/Furniture/verb/)
					y--
					x+=2
			couch6
				icon_state="couc6"
				New()
					..()
					verbs -= typesof(/obj/build/Housing/Furniture/verb/)
					y--
					x++
			couch5
				icon_state="couc5"
				New()
					..()
					verbs -= typesof(/obj/build/Housing/Furniture/verb/)
					x++


			scouch2
				layer = 3
				icon_state="scouc2"
				New()
					..()
					verbs -= typesof(/obj/build/Housing/Furniture/verb/)
					y++
			scouch2a
				layer = 3
				icon_state="scouc2a"
				New()
					..()
					verbs -= typesof(/obj/build/Housing/Furniture/verb/)
					y++
			Place()
				..()
				if(orientation == "")
					var/obj/build/Housing/Furniture/Couch/couch2/A = new(src.loc)
					var/obj/build/Housing/Furniture/Couch/couch3/B = new(src.loc)
					var/obj/build/Housing/Furniture/Couch/couch4/C = new(src.loc)
					var/obj/build/Housing/Furniture/Couch/couch5/D = new(src.loc)
					var/obj/build/Housing/Furniture/Couch/couch6/E = new(src.loc)
					A.parents = src
					B.parents = src
					C.parents = src
					D.parents = src
					E.parents = src
				else if(orientation == "s")
					var/obj/build/Housing/Furniture/Couch/scouch2/A = new(src.loc)
					A.parents = src
					layer = 3
				else if(orientation == "sa")
					var/obj/build/Housing/Furniture/Couch/scouch2a/A = new(src.loc)
					layer = 3
					A.parents = src
			Take()
				..()
				for(var/obj/build/Housing/Furniture/Couch/i in world) if(i.parents == src) del(i)
			verb/Rotate()
				set src in usr.contents
				if(orientation == "")
					orientation = "s"
					icon_state = "scouc1"
					return
				if(orientation == "s")
					orientation = "sa"
					icon_state = "scouc1a"
					return
				if(orientation == "sa")
					orientation = ""
					icon_state = "couc1"
		Phone
			icon = 'insideapps.dmi'
			icon_state = "phone"
		verb/Place()
			set src in usr.contents
			for(var/mob/M in hearers(13))
				M << output("<font size = -3><font color = white><font color=[usr.SayFont]>[M.getStrangerName(usr)] puts down a [src].<font color = white>","outputic.output")
				M << output("<font size = -3><font color = white><font color=[usr.SayFont]>[M.getStrangerName(usr)] puts down a [src].<font color = white>","outputall.output")
			src.density = 0
			src.Move(usr.loc)
			step(src,usr.dir)
			src.density = initial(density)
		verb/Take()
			set src in oview(1)
			for(var/mob/M in hearers(13))
				M << output("<font size = -3><font color = white><font color=[usr.SayFont]>[M.getStrangerName(usr)] picks up a [src].<font color = white>","outputic.output")
				M << output("<font size = -3><font color = white><font color=[usr.SayFont]>[M.getStrangerName(usr)] picks up a [src].<font color = white>","outputall.output")
			src.Move(usr)


