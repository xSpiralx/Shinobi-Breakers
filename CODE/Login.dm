mob/var/Proffesion
client/Del()
	..()
	if(!src.mob||!src) return
	for(var/mob/M in world)
		if(M.Admin)
			M<< {"<font color=#F88017>[src] just logged <i>out</i>. [M.Admin>=4 ? "()" : ""]"}
client/New()//big mudkips
	..()
	if(!src.mob||!src) return
	winset(src,"Radio","is-visible=false")
	src<<FontstoInclude[1]
	for(var/mob/M in world)
		if(M.Admin)
			M<< {"<font color=#F88017>[src] just logged <i>in</i>. [M.Admin>=5 ? "()" : ""]"}
mob/var/tmp/autoafk=0
mob/var/tmp/afktime=0
mob/proc/AutoAFK()
	while(src)
		sleep(10)
		if(!client) continue
		if((client.inactivity/10)>=(60*20))
			if(afk||autoafk) continue
			if(invisibility) continue
			for(var/mob/M in hearers())
				M << "[M.getStrangerName(src)] has gone AFK." // tells the world that they arrived back from AFK.
			overlays += 'afk.dmi' // overlays the AFK image on player
			autoafk=1 // so it can effect it when they press AFK again
			afktime = world.timeofday
			ChatLog("<font size=-4><font color=white>*[src] has gone AUTOAFK*")
			if(Fishing)
				Fishing=0
				move=1
				src<<output("You were forced to stop fishing!","outputic.output")
				src<<output("You were forced to stop fishing!","outputall.output")
				icon_state=""
			if(Mining)
				Mining=0
				move=1
				src<<output("You were forced to stop mining!","outputic.output")
				src<<output("You were forced to stop mining!","outputall.output")
				icon_state=""
		else
			if(!autoafk) continue
			for(var/mob/M in hearers())
				M << "[M.getStrangerName(src)] is no longer AFK." // tells the world that they arrived back from AFK.
			afktime = 0
			overlays -= 'afk.dmi' // removes the AFK image.
			autoafk=0

mob/var/tmp/afk=0
mob/verb/AFK()
	if(RecentVerbCheck("AFK", 30,1)) return
	if(!afk&&!autoafk)
		for(var/mob/M in hearers())
			M << "[M.getStrangerName(src)] has gone AFK." // tells the world that they arrived back from AFK.
		afktime = world.timeofday
		overlays += 'afk.dmi' // overlays the AFK image on player
		afk=1 // so it can effect it when they press AFK again
		recentverbs["AFK"] = world.realtime
		if(Fishing)
			Fishing=0
			move=1
			src<<output("You were forced to stop fishing!","outputic.output")
			src<<output("You were forced to stop fishing!","outputall.output")
			icon_state=""
		if(Mining)
			Mining=0
			move=1
			src<<output("You were forced to stop mining!","outputic.output")
			src<<output("You were forced to stop mining!","outputall.output")
			icon_state=""
	else
		for(var/mob/M in hearers())
			M << "[M.getStrangerName(src)] is no longer AFK." // tells the world that they arrived back from AFK.
		overlays -= 'afk.dmi' // removes the AFK image.
		afktime = 0
		afk=0
var/list/Spam=list()
mob/proc/LoadSpam()
	if(src.key in Spam)
		return
	Spam+=src.key
	var/savefile/load=new("Spam")
	load["Spam"]>>Spam
obj/loginscreen/Background
	icon='background.dmi'
	layer = 3
obj/loginscreen/Saga
	//icon = 'saga.dmi'
	layer = 4
obj/loginscreen/Buttons
	icon = 'buttons.dmi'
	layer = 4
	New
		icon_state = "new"
	Load
		icon_state = "load"
mob/Login()
	//if(ckey. IP=[src].IP del)
	//if(ckey. IP=[src].IP del)
	LoginScreen=0

	for(var/obj/grid_object2/g in src)
		del(g)
	//src.Mute_Check()
	if(!(key in UnBanables))
		if(client)
			if(Bans)
				if(Bans.Find(client.address)||Bans.Find(key)||Bans.Find(client.computer_id))
					src<< "<font size=3><font color=red>You Have Been Banned."
					src<< "<font size=3><font color=red>(If you feel this was unjust please go to the forums and post under complaints)"
					del(src)
	grabber=""
	grabbee=null
	grabberSTR=""
	displaykey=src.key
	overlays -= 'Swim.dmi'
	overlays -= 'afk.dmi'
	icon_state=""
	loc=locate(80,250,27)

	resized()
	skin_show_tabs()
	skin_show_input()
	button_show_input()

	title_screen()
	IPlog()
	src.density=1
	//spawn()src.Mute_Check()
	//spawn()src.LoadSpam()
	AdminCheck()
	//AgeConstruct()
	//if(client)
	//	client.show_verb_panel=0
	pixel_y=0
	pixel_x=0
	spawn() src.Mute_Check()
	spawn()src.LoadSpam()
//	build_shadow()
	if(isinjured) RecoverInjury()
	if(libCD) Library_CD()
	//Gape_Tasks()
	//usr.Start()
	//usr.Load()
	..()

mob/Logout()
	//world <<  {"<font color=yellow>Server Information:<font color="#CCCCCC">[usr]([usr.displaykey]) has gone to sleep!"}
	del(chakraOverlay)
	if(character_box)
		//for(var/o in character_box.character_info.objects)
		//	del(o)
		del(character_box.character_info)
		//for(var/o in character_box.character_stats.objects)
		//	del(o)
		del(character_box.character_stats)
		//for(var/o in character_box.allocate_buttons.objects)
		//	del(o)
		del(character_box.allocate_buttons)
		//for(var/o in character_box.objects)
		//	del(o)
		del(character_box.num_buttons)

		del(character_box)
	if(progress_box)
		//for(var/o in progress_box.progress_boxes.objects)
		//	del(o)
		del(progress_box.progress_boxes)
		//for(var/o in progress_box.objects)
		//	del(o)
		del(progress_box)
	if(jutsu_box)
		//for(var/o in jutsu_box.perk_boxes.objects)
		//	del(o)
		del(jutsu_box.perk_boxes)
		//for(var/o in jutsu_box.jutsu_button_on.objects)
		//	del(o)
		del(jutsu_box.jutsu_button_on)
		//for(var/o in jutsu_box.jutsu_button_off.objects)
		//	del(o)
		del(jutsu_box.jutsu_button_off)
		//for(var/o in jutsu_box.perk_button_on.objects)
		//	del(o)
		del(jutsu_box.perk_button_on)
		//for(var/o in jutsu_box.perk_button_off.objects)
		//	del(o)
		del(jutsu_box.perk_button_off)
		//for(var/o in jutsu_box.objects)
		//	del(o)
		del(jutsu_box)
	if(appearance_box)
		//for(var/o in appearance_box.color_boxes.objects)
		//	del(o)
		del(appearance_box.color_boxes)
		//for(var/o in appearance_box.skin_color_box.objects)
		//	del(o)
		del(appearance_box.skin_color_box)
		//for(var/o in appearance_box.o\bjects)
		//	del(o)
		del(appearance_box)
	LogMonth=Month
	for(var/mob/M in bunshinList)
		del(M)
	if(insideTent)
		src.loc = insideTent
		insideTent = null
	if(miningRock) miningRock.beingMined=0
	if(miningGame)
		for(var/obj/Mining/Rock/R in range(7,miningGame))
			R.icon_state=num2text(rand(1,5))
		del(miningGame)
	overlays-='afk.dmi'
	overlays -= 'Bubble.dmi'
	overlays -= 'Bubble2.dmi'
	overlays -= 'Rocks.dmi'
	overlays -= 'Gate_2.dmi'
	overlays -= 'Gate_1.dmi'
	for(var/obj/CombatFlag/RP in world)
		if(RP.owner==src.ckey)
			del(RP)
	for(var/mob/M in world)
		if(src.grabbee==M.name && M.grabber==name)
			viewers(9) << "[src] is forced to release their hold!"
			grabbee= null
			M.grabber= null
			attacking=0
			M.pixel_y=0
			M.pixel_x=0
			M.density = 1
	if(light) del(light)
	for(var/mob/Clone/C in world)
		if(C.Owner == src.ckey && C.loc != null && C.permanent)
			for(var/mob/M in hearers(C,16))
				M << "[M.getStrangerName(C)] has gone AFK." // tells the world that they arrived back from AFK.
			C.afktime = world.timeofday
			C.overlays += 'afk.dmi' // overlays the AFK image on player
			C.afk=1 // so it can effect it when they press AFK again
	src.Clear_Markers()
	src.clear_position_markers()
	src.jutsurange = list()
	Save()
	for(var/mob/Clone/C in world)
		if(C.Owner == src.ckey && loc != null)
			if(!C.permanent) del(C)
	spawn(2)
		if(src) del(src)

	..()

mob/var/given_global_respec = FALSE
mob/proc/LoginUpdate()
	for(var/n in loginnotices)
		if(!notices.Find(n))
			var/notice = loginnotices[n]
			if(istext(notice))
				world << notice
			if(istype(notice,/LoginNotice))
				var/LoginNotice/LN = notice
				LN.act(src)
			notices[n] = notice
		else
			var/LoginNotice/LN = loginnotices[n]
			LN.act(src)
var/list/loginnotices = list()
mob/var/list/notices = list()
mob/var/OOCSayOn=1
LoginNotice
	proc
		act(mob/M)
	fixProgressCards
		act(mob/M)
			for(var/obj/progress_card/card  in M)

				card.check_progress(M)
	completeRespect
		act(mob/M)
			if(M.given_global_respec)
			else
				M.complete_respec()
				M.given_global_respec = TRUE
	freePP
		act(mob/M)
			return
			var/bonus = 20
			M.stat_points += bonus
			M.progress_points += bonus
			M.lifetime_progress_points += bonus
			M << output("You've been rewarded [bonus ? bonus : "fractional"] point(s) as part of your TS.", "outputall.output")

