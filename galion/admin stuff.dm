mob/Admin1
	verb
		Narrate()
			set category="Event"
			var/message=input("What would you like to narrate") as message
			var/distance=input("How many tiles, using you as the center should this message be heard?") as num
			if(message && distance)
				for(var/mob/m in range(distance, src))
					m << output("[message]", "outputic.output")
					m << output("[message]", "outputall.output")
				for(var/mob/m in world)
					if(m.Admin) m << "<i>[usr.key] just used narrate</i>"

		PrivateIcMessage(var/mob/M in world)
			set name = "Private IC Message"
			set category = "Event"
			var message = input("What would you like to send to [M]") as message
			if(message)
				M << output("[message]", "outputic.output")
				M << output("[message]", "outputall.output")
				usr << output("<b><i>You sent [M]</b></i>: [message]", "outputic.output")
				usr << output("<b><i>You sent [M]</b></i>: [message]", "outputall.output")
				for(var/mob/m in world)
					if(m.Admin) m << "<i>[usr.key] just sent [m] a private ic message: [html_decode(message)]</i>"





mob/Admin3
	verb
		TransferItem(var/obj/items/i in world)
			set name = "Transfer Item"
			set category = "Event"
			var list/mobs = list()
			for(var/mob/m in world) if(m.client) mobs += m
			mobs += "Cancel"
			var/mob/m = input("Who would you like to tranfer [i] to?") in mobs
			if(m)
				if(m == "Cancel") return
				i.loc = m
				Admin_Logs+="<br>[usr]([usr.key]) transfered [i] to [m]'s contents"