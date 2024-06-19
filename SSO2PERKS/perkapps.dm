// Jutsu app built in game

// Includes: replying, approving, denying by admin
// 			 applying, replying, purchasing, canceling by players


/* Players fill in:
Jutsu Name:
Brief Desc:
Offense/Defense:
Speed:
Duration:
Drain:
Notes


*/

jutsuApp
	parent_type = /obj
	var
		submitter_name
		submitter_ckey
		notes
		offdef
		speed
		drain
		duration
		app_rank
		cost = 0
		locked = 0
		status = "pending" // "pending", "approved", "denied"

		appChat/list/chat_history = list()

appChat
	var
		sender = ""
		message = ""


proc
	ArchiveAppJutsu(obj/jutsu/J)
		if(istype(J, /perk_box))
			var/perk_box/perk_box = J
			J = perk_box:reference

		if(!J)

			return 0

		if(!istype(J) && J.jutsu_type <> "perk")

			return 0

		for(var/obj/jutsu/jutsu in archive.contents)
			if(jutsu.name == J.name)

				return 0

		archive.contents += J
		archive.save_archive()

		world.log << "[J.name] has been saved to the jutsu archives."
		message_admins("[J.name] has been purchased through jutsu applications.")
		return 1


proc/IsNum(string)
    if(istext(string))
        string = text2num(string)
    return isnum(string)
mob
	var/tmp/submittingapp = 0
	var/tmp/edittingapp = 0
	verb

		closeEditApp()
			set hidden = 1
			if(edittingapp)
				edittingapp = 0

			winset(src, "jutsuApp.nameJutsuApp", "text=\"\"")
			winset(src, "jutsuApp.descJutsuApp", "text=\"\"")
			winset(src, "jutsuApp.notesJutsuApp", "text=\"\"")
			winset(src, "jutsuApp.rankJutsuApp", "text=\"\"")
			winset(src, "jutsuApp.offJutsuApp", "text=\"\"")
			winset(src, "jutsuApp.speedJutsuApp", "text=\"\"")
			winset(src, "jutsuApp.drainJutsuApp", "text=\"\"")
			winset(src, "jutsuApp.durationJutsuApp", "text=\"\"")

		editJutsuApp()
			set hidden = 1
			if(!current_jutsuApp || current_jutsuApp.locked)
				return

			edittingapp = 1
			winshow(src, "jutsuApp", 1)
			winset(src, "jutsuApp.nameJutsuApp", "text=\"[current_jutsuApp.name]\"")
			winset(src, "jutsuApp.descJutsuApp", "text=\"[current_jutsuApp.desc]\"")
			winset(src, "jutsuApp.notesJutsuApp", "text=\"[current_jutsuApp.name]\"")
			winset(src, "jutsuApp.rankJutsuApp", "text=\"[current_jutsuApp.rank]\"")
			winset(src, "jutsuApp.offJutsuApp", "text=\"[current_jutsuApp.offdef]\"")
			winset(src, "jutsuApp.speedJutsuApp", "text=\"[current_jutsuApp.speed]\"")
			winset(src, "jutsuApp.drainJutsuApp", "text=\"[current_jutsuApp.drain]\"")
			winset(src, "jutsuApp.durationJutsuApp", "text=\"[current_jutsuApp.duration]\"")


		Jutsu_Application()
			winset(src, "jutsuApp.nameJutsuApp", "text=\"\"")
			winset(src, "jutsuApp.descJutsuApp", "text=\"\"")
			winset(src, "jutsuApp.notesJutsuApp", "text=\"\"")
			winset(src, "jutsuApp.rankJutsuApp", "text=\"\"")
			winset(src, "jutsuApp.offJutsuApp", "text=\"\"")
			winset(src, "jutsuApp.speedJutsuApp", "text=\"\"")
			winset(src, "jutsuApp.drainJutsuApp", "text=\"\"")
			winset(src, "jutsuApp.durationJutsuApp", "text=\"\"")
			winshow(src, "jutsuApp", 1)

		submitJutsuApp()
			set hidden = 1
			if(submittingapp) return
			submittingapp =1


			//This is a button to submit an app. It will check if the required fields are filled correctly and then submit it
			var name = winget(src, "jutsuApp.nameJutsuApp", "text")
			if( length(name) <= 2 && length(name) >= 30)
				alert("The length of the name can not be less than 3 characters and no more than 30.")
				submittingapp =0
				return

			var desc = winget(src, "jutsuApp.descJutsuApp", "text")
			if( length(desc) <= 10 && length(desc) >= 2000 )
				alert("The length of the desc can not be less than 11 characters and no more than 2000.")

				submittingapp =0
				return

			var notes = winget(src, "jutsuApp.notesJutsuApp", "text")
			if( length(notes) >= 1500 )
				alert("The length of the notes can not be more than 1500 characters.")
				submittingapp =0
				return

			var rank = winget(src, "jutsuApp.rankJutsuApp", "text")
			if( ! (rank in list("E", "D", "C", "B", "A", "S")) )
				alert("Rank has to be E, D, C, B, A or S")
				submittingapp =0
				return
			var offdef = winget(src, "jutsuApp.offJutsuApp", "text")
			if( !(offdef in list("E-", "E", "E+", "D-","D","D+","C-","C","C+","B-","B","B+","A-","A","A+","S", "N/A") ))
				submittingapp =0
				alert("The offense/defense must be within E- and A+, S or N/A")
				return

			var speed = winget(src, "jutsuApp.speedJutsuApp", "text")
			if( !(offdef in list("E-", "E", "E+", "D-","D","D+","C-","C","C+","B-","B","B+","A-","A","A+","S", "N/A")))
				submittingapp =0
				alert("The speed must be within E- and A+, S or N/A")
				return

			var drain = winget(src, "jutsuApp.drainJutsuApp", "text")
			if( !(drain in list("E", "D", "B", "C", "A", "S", "N/A")))
				submittingapp =0
				alert("The drain must be within E, D, C, B, A, S or N/A")
				return

			var duration = winget(src, "jutsuApp.durationJutsuApp", "text")
			if(duration != "N/A" && !IsNum(duration))
				submittingapp =0
				alert("The duration must be N/A or a number.")
				return

			winshow(src, "jutsuApp", 0)
			submittingapp = 0
			if(edittingapp)
				if(current_jutsuApp)
					current_jutsuApp.name = name
					current_jutsuApp.desc = desc
					current_jutsuApp.offdef = offdef
					current_jutsuApp.speed = speed
					current_jutsuApp.drain = drain
					current_jutsuApp.duration = duration
					current_jutsuApp.app_rank = rank

					current_jutsuApp.suffix = "Edited by [ckey]"
					alert("Edited application successfully")
					submittingapp =0


			else



				var/jutsuApp/app = new
				switch(input("would you like to submit an icon for this?") in list("Yes","No"))
					if("Yes")
						app.icon=input("What icon?") as file
						app.icon_state = input("Icon state?") as text
					if("No")
						app.icon='NoIcon.png'
				app.name = name
				app.desc = desc
				app.offdef = offdef
				app.speed = speed
				app.drain = drain
				app.duration = duration
				app.app_rank = rank

				app.suffix = "Pending Review"
				app.submitter_name = name
				app.submitter_ckey = ckey

				archive.contents += app

				for(var/mob/M in world)
					if(M.Admin)
						M << "[src] has completed a jutsu application. It is now pending review."

				alert("Submitted Application. Pending review. Please wait for this application to be processed before submitting a new one. You can view your jutsu applications by clicking View Applications in commands.")
				submittingapp =0


	var
		adminViewApps = 0
		playerViewApps = 0
		jutsuApp/current_jutsuApp = null
	verb

		Purchase_Application(jutsuApp/app in archive.contents)
			set category = null
			if(app.submitter_ckey != ckey)
				return

			if(app.status != "approved")
				alert("Not approved or has already been purchased.")
				return

			switch(input("Are you sure you wish to purchase [app.name] for [app.cost]?") in list("Yes", "No"))
				if("Yes")
					if(progress_points - app.cost < 0)
						alert("You don't have enough points to buy this.")
						return
					progress_points -= app.cost
					var/obj/NewJutsu = new/obj/jutsu
					NewJutsu:name=app.name
					NewJutsu:suffix=app.suffix

					NewJutsu.icon = app.icon
					var/JColor=""
					if(app.app_rank=="A")
						JColor="red"
					if(app.app_rank=="B")
						JColor="blue"
					if(app.app_rank=="C")
						JColor="green"
					if(app.app_rank=="D")
						JColor="grey"
					else
						JColor="white"
					NewJutsu:desc={"<font color=white><b><font face="Arial"><font size=1>[app.name]</b></font>
		<font color=[JColor]><i><font face="Arial"><font size=1>[app.app_rank]-Rank</i></font>
		<font color=white><font face="Arial"><font size=1><u><b>Jutsu Information<br></u></b></font>
		[app.desc]
		<center><font color=white><font face="Tahoma"><font size=1><b><Font color=#A81C1C>\[Offense/Defense: [app.offdef]] <font color=#50CDF3>\[Chakra/Stamina Cost: [app.drain]]
		<font color=#2EC13A>\[Speed: [app.speed]] <font color=#768177> \[Turn Duration: [app.duration]] </b></font><br>
		 [app.notes]</center>"}

					if(!ArchiveAppJutsu(NewJutsu))
						src << "An error has occured in purchasing this.  Contact an admin to rectify it. There might be a jutsu with the same name already."

					var/obj/jutsu/new_jutsu = new(src)
					for(var/variable in NewJutsu.vars - "transform")
						if(issaved(NewJutsu.vars[variable]))
							new_jutsu.vars[variable] = NewJutsu.vars[variable]
					app.status = "purchased"
					app.suffix = "Purchased by [ckey]/[name]"









		Review_Application(jutsuApp/app in archive.contents)
			set category = null
			if(src.Admin)
				src.viewjutsuapp(app)
				return
			else
				if(src.ckey == app.submitter_ckey)
					src.viewjutsuapp(app)

		closeApp()
			set hidden = 1
			current_jutsuApp = null

		jutsuappreply(info as text)
			set hidden = 1
			if(!current_jutsuApp)
				return

			if(current_jutsuApp.locked)
				alert("This has been locked and can not be responded to.")
				return

			var/appChat/reply = new
			reply.sender = ckey
			reply.message = info
			current_jutsuApp.chat_history+=reply

			for(var/mob/M in world)
				if(M.current_jutsuApp == current_jutsuApp)
					M.viewjutsuapp(current_jutsuApp)
			current_jutsuApp.suffix = "Reply from [ckey]"
		View_Applications()
			playerViewApps = !playerViewApps

	Admin3/verb
		viewJutsuApps()
			set category = "Admin"

			adminViewApps = !adminViewApps







		Approve_Application(jutsuApp/app in archive.contents)
			set category = "Admin"
			switch(input("Are you sure you wish to approve [app.name] for [app.submitter_ckey]/[app.submitter_name]?") in list("Yes", "No"))
				if("Yes")
					app.status = "approved"
					app.suffix = "Approved on [time2text(world.realtime, "DD/Month/YYYY")] by [ckey]"
					app.locked = 1
					app.cost = input("What cost are you giving this technique? It is [app.rank]") as num

		Deny_Application(jutsuApp/app in archive.contents)
			set category = "Admin"
			switch(input("Are you sure you wish to deny [app.name] for [app.submitter_ckey]/[app.submitter_name]?") in list("Yes", "No"))
				if("Yes")
					app.status = "denied"
					app.suffix = "Denied on [time2text(world.realtime, "DD/Month/YYYY")] by [ckey]"
					var/appChat/appchat = new
					appchat.sender = ckey
					var/mmmessage = input("What will you tell the applicant?") as message
					appchat.message = "Denied w/ note: [mmmessage]"
					app.chat_history += appchat
					app.locked = 1
	proc
		viewjutsuapp(jutsuApp/app)
			winshow(src,"jutsuAppDisplay",1)
			src << output(null, "techout")
			src << output(null, "jutsuappchat")
			current_jutsuApp = app
			var/JColor=""
			if(app.app_rank=="A")
				JColor="red"
			if(app.app_rank=="B")
				JColor="blue"
			if(app.app_rank=="C")
				JColor="green"
			if(app.app_rank=="D")
				JColor="grey"
			else
				JColor="white"

			var/appinfo = {"<font color=white><b><font face="Arial"><font size=1>[app.name]</b></font>
<font color=[JColor]><i><font face="Arial"><font size=1>[app.app_rank]-Rank</i></font>
<font color=white><font face="Arial"><font size=1><u><b>Jutsu Information<br></u></b></font>
[app.desc]
<center><font color=white><font face="Tahoma"><font size=1><b><Font color=#A81C1C>\[Offense/Defense: [app.offdef]] <font color=#50CDF3>\[Chakra/Stamina Cost: [app.drain]]
<font color=#2EC13A>\[Speed: [app.speed]] <font color=#768177> \[Turn Duration: [app.duration]] </b></font><br>
 [app.notes]</center>"}

			src << output(appinfo, "techout")

			src<< output("Submitted by: [app.submitter_name]/[app.submitter_ckey]", "jutsuappchat")

			for(var/appChat/mesg in app.chat_history)
				src<< output("[mesg.sender]: [mesg.message]", "jutsuappchat")

