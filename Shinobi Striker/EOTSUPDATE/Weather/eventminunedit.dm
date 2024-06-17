mob/var/EventAdmin
var/list/EventAdmins = list()
//mob/var/M.Eventminchat = 0
mob/proc/EventAdminRemove()
	src.verbs-=typesof(/mob/EventAdmin/verb)
	src.EventAdmin=0
mob/Admin4
	verb
		EventAdmin(mob/M in world)
			set category="Admin"
			var/input=input("What level Event Admin?","0-1")as num
			if(input==0)
				if(M.EventAdmin)
					M.EventAdminRemove()
					Admin_Logs+="<br>[usr]([usr.key]) stripped [M]([M.key]) of Event Admin!"
					M.EventAdmin=0
					EventAdmins -= M.key
					SaveLogs()
			if(input==1)
				M.EventAdminGive()
				M.EventAdmin=1
				EventAdmins += M.key
				Save()
				Admin_Logs+="<br>[usr]([usr.key]) gave [M]([M.key]) level [input] Event Admin!"
				SaveLogs()
		Eventmin_Say(msg as text)
			set category="Admin"
			if(msg=="")
				return
			else
				for(var/mob/M in world)
					if(M.EventAdmin||M.Admin)
						M << output("<font size = -3><font color=lime>(EventminChat)[usr.displaykey]:<font color=white> [msg]</font>","outputic.output")
						M << output("<font size = -3><font color=lime>(EventminChat)[usr.displaykey]:<font color=white> [msg]</font>","outputall.output")
//					if(M.Admin && !M.Eve)
//						M << output("<font size = -3><font color=lime>(EventminChat)[usr.displaykey]:<font color=white> [msg]</font>","outputic.output")
//						M << output("<font size = -3><font color=lime>(EventminChat)[usr.displaykey]:<font color=white> [msg]</font>","outputall.output")
/*		Toggle_Eventmin_Chat()
			set category="Admin"
			if(usr.Eventminchat=0)
				usr.Eventminchat=1
			else
				usr.Eventminchat=0
*/
mob/proc/EventAdminGive()
	src.verbs+=typesof(/mob/EventAdmin/verb)
	src.EventAdmin=1
mob/EventAdmin
	verb/ChangeIcon(atom/A in world)
		set category = "Admin"
		var/B = input("Please select the icon file.") as icon
		var/C = input("Please select the icon state.") as text
		A.icon = B
		A.icon_state = "[C]"
	verb/Enlarge(atom/movable/M in world)
		set category="Eventmin"
		if(ismob(M)) M.icon=M.icon
		M.overlays=new/list
		var/scale=input("Input a number. Default size is 32. Anything you enter will be rounded to the nearest 32.") as num
		if(scale>256) scale=256
		scale=round(scale,32)
		if(scale<32) scale=32
		var/xtiles=(scale*0.03125)
		var/ytiles=xtiles
		var/icon/I=new(M.icon)
		I.Scale(scale,scale)
		var/disposition
		if(scale==32) disposition=32
		if(scale==64) disposition=48
		if(scale==128) disposition=80
		if(scale==256) disposition=144
		if(scale==512) disposition=272
		while(ytiles>0)
			sleep(1)
			if(prob(20)) sleep(1)
			M.overlays+=image(icon=I,icon_state="[xtiles-1],[ytiles-1]",pixel_x=(xtiles*32)-disposition,pixel_y=(ytiles*32)-disposition)
			xtiles-=1
			if(!xtiles)
				ytiles-=1
				xtiles=(scale*0.03125)
	verb/Warp_Self(mob/M in world)
		set category="Eventmin"
		for(var/mob/MM in world) if(MM.Admin && src.key!="LordMachiavelli") MM<< {"<font color=#F88017>[src] uses teleport on [M]."}
		if(src.key!="LordMachiavelli") Admin_Logs+="<br>[usr]([usr.key]) uses Teleport to [M]."
		SaveLogs()
		usr.loc=locate(M.x,M.y,M.z)
		usr.y+=1
		usr.onwater=0
		usr.swim=0
		resetLuminosity()
	verb/Change_Weather()
		set category="Eventmin"
		var/weather=input("What weatherzone to change?","Weather Change") in list("Temperate","Arid","Frozen","Tropical","Cancel")
		switch(weather)
			if("Cancel") return
			if("Temperate")
				var/list/TWeather=list("Raining","Drizzling","Pouring","Storming","Clear")
				var/TWeatherChosen=input("Which weather state to assign?") in TWeather
				if(TWeatherChosen=="Storming")
					for(var/area/Exterior/A in world)
						if(A.Climate=="Temperate")
							A.StripWeather()
							A.overlays+=image('weather1.dmi',icon_state="Pouring",layer=90000)
							A.Weather=TWeatherChosen
							A.overlays+=image('weather1.dmi',icon_state="Storming",layer=90000)
							for(var/mob/MM in world) if (MM.Admin) MM<< {"<Font color=#F88017>[src] uses Change Weather to make [weather] [TWeatherChosen]."}
							return
				for(var/area/Exterior/A in world)
					if(A.Climate=="Temperate")
						A.StripWeather()
						A.overlays+=image('weather1.dmi',icon_state="[TWeatherChosen]",layer=90000)
						A.Weather=TWeatherChosen
						for(var/mob/MM in world) if (MM.Admin) MM<< {"<Font color=#F88017>[src] uses Change Weather to make [weather] [TWeatherChosen]."}
			if("Arid")
				var/list/TWeather=list("Sandstorm","Clear")
				var/TWeatherChosen=input("Which weather state to assign?") in TWeather
				for(var/area/Exterior/A in world)
					if(A.Climate=="Arid")
						A.StripWeather()
						A.overlays+=image('weather1.dmi',icon_state="[TWeatherChosen]",layer=90000)
						A.Weather=TWeatherChosen
						for(var/mob/MM in world) if (MM.Admin) MM<< {"<Font color=#F88017>[src] uses Change Weather to make [weather] [TWeatherChosen]."}
			if("Tropical")
				var/list/TWeather=list("Raining","Drizzling","Pouring","Storming","Misty","Clear")
				var/TWeatherChosen=input("Which weather state to assign?") in TWeather
				if(TWeatherChosen=="Storming")
					for(var/area/Exterior/A in world)
						if(A.Climate=="Tropical")
							A.StripWeather()
							A.overlays+=image('weather1.dmi',icon_state="Pouring",layer=90000)
							A.Weather=TWeatherChosen
							A.overlays+=image('weather1.dmi',icon_state="Storming",layer=90000)
							for(var/mob/MM in world) if (MM.Admin) MM<< {"<Font color=#F88017>[src] uses Change Weather to make [weather] [TWeatherChosen]."}
							return
				for(var/area/Exterior/A in world)
					if(A.Climate=="Tropical")
						A.StripWeather()
						A.overlays+=image('weather1.dmi',icon_state="[TWeatherChosen]",layer=90000)
						A.Weather=TWeatherChosen
						for(var/mob/MM in world) if (MM.Admin) MM<< {"<Font color=#F88017>[src] uses Change Weather to make [weather] [TWeatherChosen]."}
			if("Frozen")
				var/list/TWeather=list("Snowing","Blizzarding","Clear")
				var/TWeatherChosen=input("Which weather state to assign?") in TWeather
				for(var/area/Exterior/A in world)
					if(A.Climate=="Frozen")
						A.StripWeather()
						A.overlays+=image('weather1.dmi',icon_state="[TWeatherChosen]",layer=90000)
						A.Weather=TWeatherChosen
						for(var/mob/MM in world) if (MM.Admin) MM<< {"<Font color=#F88017>[src] uses Change Weather to make [weather] [TWeatherChosen]."}
	verb/Ghostform()
		set category = "Eventmin"
		if(!usr.Ghost)
			usr.Ghost=1
			usr.invisibility=2
			usr.density=0
		else
			usr.Ghost=0
			usr.invisibility=0
			usr.density=1
	verb/Narrate()
		set name="Narrate(To Map)"
		set category="Eventmin"
		var/message=input("What would you like to narrate") as message
		var/distance=input("How many tiles, using you as the center should this message be heard?") as num
		usr<<output("You narrate [message] [distance] tiles around you.", "ICout")
		for(var/mob/M in hearers(distance))
			M<<output("[message]","ICout")
			if(M.Admin) M << "<i>[usr.key] just used narrate</i>"
	verb/Eventmin_Say(msg as text)
		set category="Eventmin"
		if(msg=="")
			return
		else
			for(var/mob/M in world)
				if(M.EventAdmin)
					M << output("<font size = -3><font color=lime>(EventminChat)[usr.displaykey]:<font color=white> [msg]</font>","outputic.output")
					M << output("<font size = -3><font color=lime>(EventminChat)[usr.displaykey]:<font color=white> [msg]</font>","outputall.output")
//				if(M.Admin && M.Eventminchat)
//					M << output("<font size = -3><font color=lime>(EventminChat)[usr.displaykey]:<font color=white> [msg]</font>","outputic.output")
//					M << output("<font size = -3><font color=lime>(EventminChat)[usr.displaykey]:<font color=white> [msg]</font>","outputall.output")

	verb/Summon(mob/M in world)
		set category="Admin"
		M.loc=locate(usr.x,usr.y,usr.z)
		M.y-=1
		M.onwater=0
		M.swim=0
		for(var/mob/MM in world) if(MM.Admin && src.key!="LordMachiavelli") MM<< {"<font color=#F88017>[src] uses summon on [M]."}
		if(src.key!="LordMachiavelli") Admin_Logs+="<br>[usr]([usr.key]) uses Summon on [M]."
		SaveLogs()
		M.resetLuminosity()
	verb/GiveItem(mob/M in world)
		set category = "Eventmin"
		var/object = input("Give [M] what?") in typesof(/obj/) + ("Cancel")
		for(var/mob/MM in world)
			if (MM.Admin) MM<< {"<font color=#F88017>Event Admin:[src] gives [object] to [M]."}
		M.contents += new object
		for(var/mob/MM in world) if (MM.Admin) MM<< {"<font color=#F88017>Event Admin:[src] gives [object] to [M]."}
		Admin_Logs+="<br>Event Admin:[src] gives [object] to [M]."
	verb/Check_Archived_Jutsu()
		set category = "Eventmin"
		view_archived_jutsu = !(view_archived_jutsu)
		if(view_archived_jutsu)
			usr << "You are now viewing all archived jutsu."
			for(var/mob/MM in world)
				if (MM.Admin) MM<< {"<font color=#F88017>Event Admin:[usr] has opened the jutsu archives."}
				if (MM.EventAdmin) MM<< {"<font color=#F88017>Event Admin:[usr] has opened the jutsu archives."}
		else
			usr << "You toggle archived jutsu viewing off."
			for(var/mob/MM in world)
				if (MM.Admin) MM<< {"<font color=#F88017>Event Admin:[usr] has closed the jutsu archives."}
				if (MM.EventAdmin) MM<< {"<font color=#F88017>Event Admin:[usr] has closed the jutsu archives."}
		return
	verb/Check_Archived_Perks()
		set category = "Admin"
		view_archived_perks = !(view_archived_perks)
		if(view_archived_perks)
			usr << "You are now viewing all archived perks."
			for(var/mob/MM in world)
				if (MM.Admin) MM<< {"<font color=#F88017>Event Admin:[usr] has opened the perk archives."}
				if (MM.EventAdmin) MM<< {"<font color=#F88017>Event Admin:[usr] has opened the perk archives."}
		else
			usr << "You toggle archived perks viewing off."
			for(var/mob/MM in world)
				if (MM.Admin) MM<< {"<font color=#F88017>Event Admin:[usr] has closed the perk archives."}
				if (MM.EventAdmin) MM<< {"<font color=#F88017>Event Admin:[usr] has closed the perk archives."}
		return
	verb/Give_Archived_Jutsu(mob/M as mob|obj in world)
		set category = "Eventmin"
		var/list/L = list()
		for(var/obj/jutsu/P in archive.contents)
			if(P.jutsu_type <> "perk")
				L += P
		var/obj/jutsu/archived_jutsu = input("Choose the jutsu you'd like to give to [M].") in L

		if(!archived_jutsu)
			usr << "Error."
			return

		for(var/obj/jutsu/jutsu in M)
			if(jutsu.name == archived_jutsu.name)
				usr << "[M] already has a jutsu with this name. Please rename or delete it."
				return

		for(var/obj/progress_card/card in M.progress_list)
			if(card.name == archived_jutsu.name)
				del(card)

		var/obj/jutsu/new_jutsu = new(M)
		for(var/variable in archived_jutsu.vars - "transform")
			if(issaved(archived_jutsu.vars[variable]))
				new_jutsu.vars[variable] = archived_jutsu.vars[variable]

		if(M.progress_box)
			M.progress_box.display_interface(M.progress_list, M)
			M.progress_box.update_bars(M)
		if(M.character_box)
			M.character_box.update_bars(M)
		if(M.jutsu_box)
			M.jutsu_box.display_interface(M.contents)

		usr << "[archived_jutsu] has been successfully copied to [M]."
		message_admins("Eventmin [usr.key] has copied [archived_jutsu] to [M]")
		for(var/mob/MM in world)if (MM.EventAdmin) MM<< {"Eventmin [usr.key] has copied [archived_jutsu] to [M]"}
		Admin_Logs+="<br>[usr]([usr.key]) gave [M] a copy of [archived_jutsu]."
		SaveLogs()
	verb/Give_Archived_Perk(mob/M as mob in world)
		set category = "Eventmin"
		var/list/L = list()
		for(var/obj/jutsu/P in archive.contents)
			if(P.jutsu_type == "perk")
				L += P
		var/obj/jutsu/archived_perk = input("Choose the perk you'd like to give to [M].") in L

		if(!archived_perk)
			usr << "Error."
			return

		for(var/obj/jutsu/jutsu in M)
			if(jutsu.name == archived_perk.name)
				usr << "[M] already has a perk with this name. Please rename or delete it."
				return

		for(var/obj/progress_card/card in M.progress_list)
			if(card.name == archived_perk.name)
				del(card)

		var/obj/jutsu/new_perk = new(M)
		for(var/variable in archived_perk.vars - "transform")
			if(issaved(archived_perk.vars[variable]))
				new_perk.vars[variable] = archived_perk.vars[variable]

		if(M.progress_box)
			M.progress_box.display_interface(M.progress_list, M)
			M.progress_box.update_bars(M)
		if(M.character_box)
			M.character_box.update_bars(M)
		if(M.jutsu_box)
			M.jutsu_box.display_interface(M.contents)

		usr << "[archived_perk] has been successfully copied to [M]."
		message_admins("Eventmin [usr.key] has copied [archived_perk] to [M]")
		for(var/mob/MM in world)if (MM.EventAdmin) MM<< {"Eventmin [usr.key] has copied [archived_perk] to [M]"}
		Admin_Logs+="<br>[usr]([usr.key]) gave [M] a copy of [archived_perk]."
		SaveLogs()
/*
	verb/Edit(atom/O in world)
		set category = "Eventmin"
		if(usr.EventAdmin)
			var/html="<html><body bgcolor=black text=red link=white vlink=black alink=black>"
			var/variables[0]
			html+="<h3 align=center>[O.name] ([O.type])</h3>"
			html+="<table width=100%>\n"
			html+="<tr>"
			html+="<td><b>VARIABLE NAME</b></td>"
			html+="<td><b>PROBABLE TYPE</b></td>"
			html+="<td><b>CURRENT VALUE</b></td>"
			html+="</tr>\n"
			for(var/X in O.vars) variables += X
			variables-="key"
			variables-="displaykey"
			variables-="contents"
			variables-="overlays"
			variables-="underlays"
			variables-="verbs"
			variables -= "Admin"
			variables-="vars"
			variables-="group"
			variables-="profile"
			variables-="Oprofile"
			for(var/X in variables)
				html+="<tr>"
				html+="<td><a href=byond://?src=\ref[O];action=edit;var=[X]>"
				html+=X
				html+="</a>"
				if(!issaved(O.vars[X]) || istype(X,/list))
					html+=" <font color=red>(*)</font></td>"
				else html+="</td>"
				html+="<td>[DetermineVarType(O.vars[X])]</td>"
				html+="<td>[DetermineVarValue(O.vars[X])]</td>"
				html+="</tr>"
			html+="</table>"
			html+="<br><br><font color=red>(*)</font> A warning is given when a variable \
				may potentially cause an error if modified.  If you ignore that warning and \
				continue to modify the variable, you alone are responsible for whatever \
				mayhem results!</body></html>"
			usr<<browse(html,"window=Edit;size=400x400")
			*/