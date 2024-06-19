/*mob/proc
	Age()
		var/Age=skinput2("Please enter your Age from 5-30.","Age",null,1)
		if(!isnum(Age))
			usr.Age()
			return
		if(Age<=4)
			usr.Age()
			return

		if(Age>=31)
			usr.Age()
			return
		usr.Age=(Age)
		usr.Age_Death()*/

mob/proc
	Age_Death()
		if(usr.Dead)
			return

mob
	verb
		GM_Help()
			if(RecentVerbCheck("GM", 350,1)) return
			if(alert("This will send an alert to all GMs. If you use this verb without a valid reason, Shinobi Story Online's staff may punish you. Are you sure you want to alert the staff?","Alert","Yes","No")=="Yes")
				var/msg= input("Please voice your message","Alert") as text|null
				if(!msg) return
				if(length(msg)>500) return
				if(msg=="1") return
				if(isnum(msg)&&msg==1) return
				src<<output("<font size = -3>Your message has been broadcasted to the staff.","outputic.output")
				src<<output("<font size = -3>Your message has been broadcasted to the staff.","outputall.output")

				src << output("<font size = -3><b><font color = lime>ALERT: [usr] ([usr.key]): [html_encode(msg)] ","outputic.output")
				src << output("<font size = -3><b><font color = lime>ALERT: [usr] ([usr.key]): [html_encode(msg)] ","outputall.output")
				for(var/mob/M in world)
					if(M.Admin)
						M << output("<font size = -3><b><font color = lime>ALERT: <a href=?src=\ref[M];action=PM;player=[usr.ckey]>[usr] ([usr.key])</a>: [html_encode(msg)] ","outputic.output")
						M << output("<font size = -3><b><font color = lime>ALERT: <a href=?src=\ref[M];action=PM;player=[usr.ckey]>[usr] ([usr.key])</a>: [html_encode(msg)] ","outputall.output")
						recentverbs["GM"]=world.realtime

/*		Head_GM_Help()
			if(!canhahelp)
				src<<output("<font size = -3>You have been stripped of this verb.","outputic.output")
				return
			if(RecentVerbCheck("GM", 350,1)) return
			if(alert("This will send an alert to the Head Admins only. If you use this verb without a valid reason, Shinobi Story Online's staff may punish you and remove your priveleges to use this verb. Are you sure you want to alert the staff?","Alert","Yes","No")=="Yes")
				var/msg= input("Please voice your message","Alert") as text|null
				if(!msg) return
				if(length(msg)>500) return
				if(msg=="1") return
				if(isnum(msg)&&msg==1) return
				src<<output("<font size = -3>Your message has been broadcasted to the staff.","outputic.output")
				src<<output("<font size = -3>Your message has been broadcasted to the staff.","outputall.output")

				src << output("<font size = -3><b><font color = lime>ALERT: [usr] ([usr.key]): [html_encode(msg)] ","outputic.output")
				src << output("<font size = -3><b><font color = lime>ALERT: [usr] ([usr.key]): [html_encode(msg)] ","outputall.output")
				for(var/mob/M in world)
					if(M.Admin == 5 || M.Admin == 4)
						M << output("<font size = -3><b><font color = lime>ALERT: <a href=?src=\ref[M];action=PM;player=[usr.ckey]>[usr] ([usr.key])</a>: [html_encode(msg)] ","outputic.output")
						M << output("<font size = -3><b><font color = lime>ALERT: <a href=?src=\ref[M];action=PM;player=[usr.ckey]>[usr] ([usr.key])</a>: [html_encode(msg)] ","outputall.output")
						recentverbs["GM"]=world.realtime
*/








atom/Topic(href,href_list[])
	switch(href_list["action"])
	//	world<<"1.22312"
//	<a href=?src=\ref[M];action=Reward;mob=[src.key]>Reward</a>

		if("rpflagalert")
			if(usr.RecentVerbCheck("alertrp", 350,1)) return
			usr.recentverbs["alertrp"]=world.realtime
			for(var/mob/MM in world)
				if(MM.Admin)
					MM<< output("<font size = -3><font color=yellow>[usr] is requesting admin attention at their location. (RP Flag: [src.name]).","outputall.output")
					MM<< output("<font size = -3><font color=yellow>[usr] is requesting admin attention at their location. (RP Flag: [src.name]).","outputic.output")
		if("Options")
			if(!usr:Admin) return
			var/N = href_list["mob"]
			var/mob/M
			for(var/mob/X in world)
				if(X.ckey==N)
					M=X
			if(!M.client) return
			switch(input("What would you like to do with [M]?") in list("PM","Reward","Teleport","Summon","Cancel"))
				if("PM")
					var/message=input("Say what? (Blank to cancel)") as text
					if(!message) return
					for(var/mob/MM in world)
						if(MM.Admin) MM<<output("<b><font color=yellow>[usr] whispers to [M]:</b></font> [message]", "outputall.output")
					M<<output("<b><font color=yellow>Admin whispers you:</b></font> [message]","outputall.output")
				if("Teleport")
					usr:Teleport(M)
				if("Reward")
					usr:Reward(M)
				if("Summon")
					usr:Summon(M)
	.=..()

























