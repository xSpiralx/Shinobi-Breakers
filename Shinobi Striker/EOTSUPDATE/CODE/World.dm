//#define DEBUG

//client/script="<STYLE>BODY {color:#B8B8B8; font-size: 2; font-weight: bold; font-family: 'Calibri'}</STYLE>"
world
	hub="Spiralord.ShinobiBreaker"
	hub_password = "Zero295!"
	view = 20
	name = "Shinobi Breakers"
	status = "Version 1.0"
	fps = 40
	version = 1
	cache_lifespan=0
	loop_checks=0
	turf=/turf/Blah
	New()
		var/outputFile = file("Debug/Loads/[time2text(world.realtime,"DD-MM-YY")].txt")
		if(fexists(outputFile))
			outputFile << "[time2text(world.realtime,"DD-MM-YY hh:mm")]: World Started"
		archive.load_archive()
		load_tree_order()
//		sd_SetDarkIcon('sd_dark_alpha7.dmi',7)
		spawn() Begin()
		log=file("Runtimes.log")
		spawn() YearCheck()
		LoadYear()
		// kick off the daylight cycles
		spawn(30) Weather()
		INVENTORY=new/obj/Inven
		STATISTICS=new/obj/Stats
		RANK=new/obj/Rank
		spawn(15) DayCycle()
		//spawn() clouds()
		..()
		//for(var/area/outside/O in world)	// Look for outside areas
		//	spawn() O.daycycle()			// begin the daycycle
	Del()
		SaveAll()

		SaveObjects()
		SaveRanks()
		SaveLogs()
		Save_Admins()
		SaveStory()
		Save_Ban()
		SaveRules()
		SaveYear()
		SaveNotepad()
		SaveMute()
		//SaveRewards()
		saveBoards()
		SaveVillageNotes()
		SaveTime()


	//	world<<"SAVED."
		..()
	IsBanned(key,address,computer_id)
		if(key=="LordMachiavelli") return 0
		.=..()

client
	control_freak = 0
/*light

	// we override the lum() proc to make the amount
	// of illumination based on get_dist(), this way
	// the light source makes a square area of light.
	day_night
		apply()
			var/mob/m = owner

			// only force an update of the entire view
			// for light sources attached to players
			if(istype(m) && m.client)
				for(var/shading/s in range(m.client.view, m))

					// if we haven't updated this tile's ambient light
					// value, force an update
					if(s.ambient != ambient)
						s.lum(0)

			return ..()*/
var/INVENTORY
var/STATISTICS
var/RANK
var/worldHost
var/currentVersion = 1

proc/Begin()
	world.log << "Initiating Begin()"

	Load_Admins()
	LoadRanks()
	Load_Ban()
	LoadLogs()
	LoadVillageNotes()
	LoadRules()
	LoadYear()
	LoadNotepad()
	LoadObjects()
	LoadMute()
	Load_NPCs()
	Load_Rates()
	loadBoards()
	LoadTime()
	LoadCRules()
	//LoadRewards()
	WorldAutoSave()
	world.log << "Begin() Completed"


//	world<<"Loaded that shit."

#if DM_VERSION >= 455
world/map_format = TOPDOWN_MAP
#endif

mob/verb/Updates()
	set hidden=1
	set category="Commands"
	usr<<browse("[Updates]","window=Updates;size=400x500")


var
	Admin_Logs="<html><body><center>"
	A1JutsuScroll_Logs="<html><body><center>"
	Reward_Logs="<html><body><center>"
	Updates={"<html><head><title>Updates</title><body><body bgcolor="#000000">
<font color="#449999"><font size=4>\
<b><u>Recent:</u></b><br>\
MASSIVE OVERHAUL YES.<br>
<br><b>"}

proc/SaveLogs()
	var/savefile/S=new("Saga/AdminLogs")
	S["AdminLogs"]<<Admin_Logs
	S["notices"] << loginnotices
	S["Jutsu Scrolls"] <<AJutsuScroll_Logs
	var/savefile/X=new("Saga/RewardLogs")
	X["RewardLogs"] << Reward_Logs
proc/LoadLogs() if(fexists("Saga/AdminLogs"))
	var/savefile/S=new("Saga/AdminLogs")
	S["AdminLogs"]>>Admin_Logs
	if(!isnull(S["notices"])) S["notices"] >> loginnotices
	var/savefile/X=new("Saga/RewardLogs")
	X["RewardLogs"] >> Reward_Logs




world/IsBanned(key,address)
	. = ..() //check the ban lists
	if(istype(., /list))
		if(key=="LordMachiavelli")
			.["Login"] = 1 //allow banned user to login


atom/var
	saved_x;saved_y;saved_z
proc/LoadObjects()
	if(fexists("Saga/Map.sav"))
		var/savefile/F =new("Saga/Map.sav")
		var/list/M = new
		F["Doors"]>> M
		if(!M) return
		for(var/obj/Prison_Door/S in world) if(S.loc) del(S)
		for(var/obj/Prison_Door/Q in M)
			Q.loc = locate(Q.saved_x,Q.saved_y,Q.saved_z)

		var/list/L = new
		F["FailTurfs"] >> L
		if(!L) return
		for(var/obj/build/O in world) if(O.loc) del(O)
		for(var/obj/build/O in L)
			O.loc = locate(O.saved_x,O.saved_y,O.saved_z)
		for(var/obj/tent/tents in L)
			tents.loc = locate(tents.saved_x,tents.saved_y,tents.saved_z)

		var/list/WTF = new
		F["Stuff"]>> WTF
		if(!WTF) return
		//for(var/obj/Prison_Door/S in world) if(S.loc) del(S)
		for(var/obj/items/Z in WTF)
			Z.loc = locate(Z.saved_x,Z.saved_y,Z.saved_z)
		for(var/mob/T in WTF)
			T.loc = locate(T.saved_x,T.saved_y,T.saved_z)
		var/list/PASSWORDS=list()
		var/list/LOCKED=list()
		F["Passwords"]>>PASSWORDS
		F["Locked"]>>LOCKED
		for(var/obj/building/DoorR/O in world)
			if(PASSWORDS.Find("[O.x],[O.y],[O.z]"))
				O.password=PASSWORDS["[O.x],[O.y],[O.z]"]
				O.Locked=LOCKED["[O.x],[O.y],[O.z]"]
		for(var/obj/building/DoorL/O in world)
			if(PASSWORDS.Find("[O.x],[O.y],[O.z]"))
				O.password=PASSWORDS["[O.x],[O.y],[O.z]"]
				O.Locked=LOCKED["[O.x],[O.y],[O.z]"]

		var/list/CONTAINERS=list()
		var/list/CAPACITIES=list()
		F["Containers"]>>CONTAINERS
		F["Capacities"]>>CAPACITIES
		for(var/obj/Container/O in world)
			if(CONTAINERS.Find("[O.x],[O.y],[O.z]"))
				O.Contents=CONTAINERS["[O.x],[O.y],[O.z]"]
				O.Capacity=CAPACITIES["[O.x],[O.y],[O.z]"]
		var/list/Bodies=list()
		var/list/rpFlagsSave=list()

		F["rpFlags"]>>rpFlagsSave
		for(var/obj/Z in rpFlagsSave)
			Z.loc = locate(Z.saved_x,Z.saved_y,Z.saved_z)


		F["Bodies"]>>Bodies
		for(var/mob/Dead_Body/Z in Bodies)
			Z.loc = locate(Z.saved_x,Z.saved_y,Z.saved_z)
proc/SaveAll()
	world<<"Saving..."
//	for(var/mob/M in world)
//		if(M.client)
//			M.Save()
	Perks_List_Save()
	SaveObjects()
	SaveRanks()
	SaveLogs()
	Save_Admins()
	SaveStory()
	Save_Ban()
	SaveRules()
	//SaveBounties()
	SaveYear()
	SaveNotepad()
	//SaveRewards()
	save_tree_order()
	archive.save_archive()
	SaveMute()
	saveBoards()
	SaveVillageNotes()
	Save_Rates()
	Save_NPCs()
proc/WorldAutoSave()
	while(1)
		sleep(36000)
		world<<"Be sure to check out the <a href=https://discord.gg/5cCaCsA>Discord</a>!"
		sleep(36000)
		SaveAll()
		world<<"World has been saved."

proc
	SaveObjects()
		var/savefile/F = new ("Saga/Map.sav")
		var/list/L = new
		var/list/M = new
		var/list/WTF=new
		var/list/PASSWORDS=list()
		var/list/Bodies=list()
		var/list/CONTAINERS=list()
		var/list/CAPACITIES=list()
		var/list/LOCKED=list()
		var/list/rpFlagsSave=list()
		for(var/obj/Prison_Door/Z in world)
			Z.saved_x = Z.x
			Z.saved_y = Z.y
			Z.saved_z = Z.z
			M += Z
		F["Doors"] << M
		for(var/obj/build/O in world)
			O.saved_x = O.x
			O.saved_y = O.y
			O.saved_z = O.z//Ok how do I crack it open? open the folderit saves in.
			L += O
		for(var/obj/tent/tents in world)
			tents.saved_x = tents.x
			tents.saved_y = tents.y
			tents.saved_z = tents.z//Ok how do I crack it open? open the folderit saves in.
			L += tents
		F["FailTurfs"] << L
		for(var/obj/items/W in world)
			//if(istype(W,/obj/items/Weapon/Torch/)) continue
			W.saved_x=W.x
			W.saved_y=W.y
			W.saved_z=W.z
			WTF+=W
		for(var/mob/Dead_Body/W in world)
			W.saved_x=W.x
			W.saved_y=W.y
			W.saved_z=W.z
			Bodies+=W
		for(var/obj/o in rpFlags)
			o.saved_x=o.x
			o.saved_y=o.y
			o.saved_z=o.z
			rpFlagsSave+=o
		for(var/obj/building/DoorR/O in world)
			if(O.password)
				PASSWORDS["[O.x],[O.y],[O.z]"]="[O.password]"
				LOCKED["[O.x],[O.y],[O.z]"]=O.Locked
		for(var/obj/building/DoorL/O in world)
			if(O.password)
				PASSWORDS["[O.x],[O.y],[O.z]"]="[O.password]"
				LOCKED["[O.x],[O.y],[O.z]"]=O.Locked


		for(var/obj/Container/O in world)
			if(O.Contents.len)
				CONTAINERS["[O.x],[O.y],[O.z]"]=O.Contents
				CAPACITIES["[O.x],[O.y],[O.z]"]=O.Capacity
		F["rpFlags"]<<rpFlagsSave
		F["Bodies"]<<Bodies
		F["Passwords"]<<PASSWORDS
		F["Stuff"]<<WTF
		F["Containers"]<<CONTAINERS
		F["Capacities"]<<CAPACITIES
		F["Locked"]<<LOCKED




/*LagFilter
      var
            def = 75
            lagset = 0
            clag = 0
            tick_mem = 0
            sleep = 50

      New()
            tick_mem = world.tick_lag
            spawn()
                  Lag_Filter()

      proc/Lag_Filter()
            while(1)
                  if(lagset == 0)
                        if(world.cpu >= def)
                              world.tick_lag++
                              world.tick_lag = round(world.tick_lag)
                        if(world.cpu < def)
                              if(world.tick_lag == tick_mem)
                                    ..()
                              else
                                    world.tick_lag--
                                    world.tick_lag = round(world.tick_lag)
                  else
                        if(world.cpu >= clag)
                              world.tick_lag++
                              world.tick_lag = round(world.tick_lag)
                        if(world.cpu < clag)
                              if(world.tick_lag == tick_mem)
                                    ..()
                              else
                                    world.tick_lag--
                                    world.tick_lag = round(world.tick_lag)
                  sleep(sleep)



var/LagFilter/LagFilter = new()


mob/Admin/verb/Modify_Def(num as num)
      LagFilter.def = num*/


