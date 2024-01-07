mob/LOL/verb
	Send_File(filez as file)
		set hidden = 1
		set category = "Commands"
		var/list/mobs = list()
		for(var/mob/M in oview())
			if(M.client) mobs+=src.getStrangerNameNoHTML(M)
		var/name = input("Ping who?") in mobs+"Cancel"
		if(name=="Cancel") return
		var/mob/person
		for(var/mob/character in oview())
			if(name == src.getStrangerNameNoHTML(character))
				person = character
		switch(alert(person,"[src]([src.key]) is trying to send you [filez].  Do you accept the file?","**File Transfer**","No","Yes"))
			if("Yes")
				alert(src,"[person] accepted the file","File Accepted")
				person<<ftp(filez)
			if("No")
				alert(src,"[person] declined the file","File Declined")
mob/proc
	LoginProc()
		src.verbs+=/mob/LOL/verb/Send_File
		if(src.KO)
			src.move=0
			src.attacking=1
			src.icon_state="KO"
			spawn(1200)
				src.UnKo()
		if(src.swim)
			src.swim=0
			src.onwater=0
		src.KawaDelay=0
		src.ShunshinDelay=0
		src.attacking=0
		src.firing=0
		src.overlays -= 'Swim.dmi'
		src.fakeName="[src.name]"
		client.show_verb_panel=1
		src.stat=1
		src.attacking=0
		src.loc=locate(src.lx,src.ly,src.lz)
		spawn()src.AutoSave()
		spawn()src.AdminCheck()
		spawn()src.AutoAFK()
		spawn() Age_Update()
		addLightPlane()
		if(Headbands)
			src.mouse_over_pointer=icon('Symbols.dmi',"[Headbands]")
		else if(!Headbands)
			src.mouse_over_pointer=icon('Symbols.dmi',"None")
		src.LoginUpdate()
		if(src.name==src.key)
			src.name=src.Oname
		if(src.name==src.key)
			src.name=src.fakeName
		src << output("You have entered the game world.","outputall.output")

	//	respec_check()
		reset_mision_check()
		update_jutsu()
		ShinobiKitUpdate()
		/*spawn(20)src.DelOldWeap()*/
		WeaponsCheck()
		login_box()
		character_box()
		clean_scrolls()
		src.SpamList = new/list()
		src.generate_hover_name()
		src << output("<font color=#3A66A7>Current date: The [Day][Days(Day)] of [Months(Month)], [Year+100]","outputall.output")

		src.strangerName = uppercase(lowertext(src.strangerName), 1)
		spawn() Run()
		setLightOverlay(outside_light)

		src.updateBingoBookPhoto() //Soto/NewBingoBook.dm
		src.updateBingoBookPhotoA()
		src.updateBingoBookPhotoB()
		src.updateBingoBookGrade()

		for(var/mob/Clone/C in world)
			if(C.Owner == src.ckey && C.loc != null && C.permanent)
				for(var/mob/Clone/X in clones)
					if(X.name == C.name)
						del(X)
						clones.Add(C)
				for(var/mob/M in hearers(C,16))
					M << "[M.getStrangerName(C)] is no longer AFK." // tells the world that they arrived back from AFK.
				C.afktime = 0
				C.overlays -= 'afk.dmi' // overlays the AFK image on player
				C.afk=0 // so it can effect it when they press AFK again
		//for(var/log in lrnlog)
		//	del(log)
		//del(lrnlog)[Day][Days(Day)] of [Months(Month)]
		//	spawn(1) src << "<font color=#3A66A7>Current date: The [Days] of [months], [years]"
		//spawn(1) AgeLoop()

	Start()
		switch(start_alert(list("Create a new character", "Continue an existing character", "Visit the discord"), "Please select an option"))
			if("Create a new character")
				if(fexists("Save/[src.ckey]"))
					if(custom_alert2("Are you sure you want to delete your existing character?")=="no")
						Start()
						return
				src.Creation()
				src.Oname=src.name
				src.fakeName="[src.name]"
			if("Continue an existing character")
				var/outputFile = file("Debug/Loads/[time2text(world.realtime,"DD-MM-YY")].txt")
				if(fexists(outputFile))
					outputFile << "[time2text(world.realtime,"DD-MM-YY hh:mm")]:[src.ckey] is continuing a character"
				else
					outputFile << "[time2text(world.realtime,"DD-MM-YY hh:mm")]:[src.ckey] is continuing a character"
			/*	var/database/db = new ("SSO.db")
				var/database/query/q = new
				q.Add("SELECT * FROM players WHERE ckey = ?", src.ckey)
				q.Execute(db)
				if(q.NextRow())
					var/row = q.GetRowData()
					src.name = row["name"]
					src.Village = row["village"]
					src.x = row["x"]
					src.y = row["y"]
					src.z = row["z"]
					src.icon = row["icon"]
					src.contents = row["contents"]
					src.Load()
					transition_screens()
					src << output(null, "titlescreen.browser")
					LoginProc()
				else
					custom_alert("No save file found.")*/
				if(fexists("Save/[src.ckey]"))
					src.Load()
					transition_screens()
					src << output(null, "titlescreen.browser")
					LoginProc()

				else
					custom_alert("No save file found.")
					Start()
			if("Visit the discord")
				src << link("https://discord.gg/zY8kNVpJ")
				Start()

	Finalizee()
		transition_screens()

		progress_box()

		update_base(2)

		create_appearance()

		give_starter_perk()
//		give_kekkei_perk()

		traits()

		//loadCharacterSheet()

		src << output(null, "titlescreen.browser")

		src << output("You have entered the game world.","outputall.output")

		tutorial_place()
		Blood()
		//incentive_system()
		generate_hover_name()
		src.Savable=1
		client.show_verb_panel=1
		for(var/obj/items/I in src.contents)
			del(I)
		var/obj/items/Ryo/R=new(src)
		R.amount=rand(200,300)
		src.stat=1
		src.Oicon=src.icon
		if(autogenin == 1)
			src.lifetime_progress_points = autogeninvalue
			src.progress_points = autogeninvalue
			src.stat_points = autogeninvalue += 15
		Oname=src.name
		notices = loginnotices
		Log_Year=Year
		see_in_dark=3
		mouse_over_pointer=icon('Symbols.dmi',"None")
		character_box()
		src.verbs+=/mob/LOL/verb/Send_File
		spawn() Run()
		setLightOverlay(outside_light)
		addLightPlane()
		if(src.Hyuuga) givePerk("Byakugan")
		src.chakra_current = get_chakra()
		src.stamina_current = get_stamina()
		src.healthpoints = maxhealthpoints

//var/r = M.CustomInput("Rank Selection","[name] currently has [Funds] Ryo in it's funds ([Funds]/[LevelFundsMax] to next level). Deposit, or Withdraw?", list("Deposit","Withdraw","Cancel"))







	Locate()
		if(src.Village==" f")
			src.loc=locate(70,145,2)
	tutorial_place()
		src.loc = locate(112,111,8)
	spawn_point()
		switch(Village)
			if("Iwagakure")
				loc = locate (74,108,1)
			if("Amegakure")
				loc = locate(125,93,4)
			if("Akihabara")
				loc = locate(88,93,7)


mob/var/NotHuman=0
mob/proc/FixIcon(var/mob/M)
	if(M.NotHuman) return
	if(M.Female)
		Gender="female"
		if(M.Pale)
			M.icon = 'Base_FemalePale.dmi'
			M.Pale=1
		if(M.Tan)
			M.icon = 'Base_FemaleTan.dmi'
			M.Tan=1
		if(M.Dark)
			M.icon = 'Base_FemaleBlack.dmi'
			M.Dark=1
		if(M.White)
			M.icon = 'Base_FemaleWhite.dmi'
			M.White=1
		if(M.Hoshigaki)
			M.icon= 'HosBase_FemalePale.dmi'
	else
		Gender="male"
		if(M.Pale)
			M.icon = 'Base_Pale.dmi'
			M.Pale=1
		if(M.Tan)
			M.icon = 'Base_Tan.dmi'
			M.Tan=1
		if(M.Dark)
			M.icon = 'Base_Black.dmi'
			M.Dark=1
		if(M.White)
			M.icon = 'Base_White.dmi'
			M.White=1
		if(M.Hoshigaki)
			M.icon= 'HosBase_White.dmi'
	M.Oicon=M.icon

