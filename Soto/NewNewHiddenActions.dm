obj/HiddenAction
	var
		action
		owner
		ID

mob
	verb
		hidden_action()
			set hidden = 1

			var/obj/HiddenAction/O = new

			O.action = input("What is your hidden action?","Hidden Action") as message
			if(O.action == "")
				usr << output("You must write something if you want to make a hidden action.","outputall.output")
				return

			O.owner = usr



			O.ID = num2text(rand(0,100000))
			for(var/obj/HiddenAction/U in usr.contents)
				if(U.ID == O.ID)
					continue

			usr.contents += O

			for(var/mob/M in hearers(20,usr))
				M << output("<i><font size=-3><font color = white>[M.getStrangerName(usr)] has made a <a href=?src=\ref[src];action=Hidden;hidden=[md5(O.ID)]>hidden action</a>!</i>","outputall.output")

			usr << output("[O.action] <font color=[usr.SayFont]><br>([usr.name]).","outputall.output")


		ClearHiddenActions()
			set hidden = 1

			switch(input("Are you sure you wish to clear all hidden actions?") in list("No","Yes"))
				if("Yes")
					for(var/obj/HiddenAction/O in usr.contents)
						del(O)
				else
					return





