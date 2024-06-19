#define TILE_WIDTH  32
#define TILE_HEIGHT 32
mob/var/tmp/LastLoc
mob/var/tmp/lastmove = 0
mob/var/ToggleRun=1
mob/Move(newloc,newdir) // Move proc
//	sleep(speeddelay)
	if(appearance_box)
		if(appearance_box.visible)
			appearance_box.appearance_display.dir = newdir
			return
	if(world.time < lastmove+speeddelay && !teleporting)
		return
	else
		lastmove = world.time
	if(resting && !teleporting) return
	if(Mining && !teleporting) return
	if(roped && !teleporting) return
	if(world.time < last_jump_animation + 11) return
	if(TextName)
		TextName.loc=null
		TextName.overlays=null
	if(afk)
		for(var/mob/M in hearers())
			M << "[M.getStrangerName(src)] is no longer AFK." // tells the world that they arrived back from AFK.
		overlays -= 'afk.dmi' // removes the AFK image.
		afk=0
	if(src.move) // If the move var is 1...
		if(grabbee!="")
			for(var/mob/Dead_Body/M in world)
				if(M.name==grabbee | M.grabber==name)
					if(M:Bloods>0&&M:Bloodied)
						M:Bloods--
						var/obj/Bloodtrail/O=new(src.loc)
						O.dir=usr.dir
						O.Owner=M
		/*if(prob(1)&&Henge)
			if(prob(1))
				flick('smoke.dmi',src)
				src.overlays = null
				for(var/obj/items/Clothing/C in src.contents)
					if(C.worn)
						src.overlays += C.icon
				//src.overlays+=src.underhair
				//src.overlays += src.overhair
				for(var/i in hair_stack)
					overlays += i
				src.name = src.Oname
				src.SayFont = src.OSayFont
				generate_hover_name()
				src.profile = src.Oprofile
				src.Henge = 0
				src.icon = src.Oicon
				for(var/obj/Genjutsu/Henge/H in src.contents)
					H.Active=0
				if(src.Hyuuga)
					src.overlays += 'Hyuuga.dmi'*/
		speeding +=2
		if(speeding<0)speeding=0
		if(speeding<=30)
			if(!Dead&&!resting&&!KO&&icon_state=="Run") icon_state=""
		if(speeding>= 31&&Health>=MaxHealth/3)
			if(!Dead&&!KO&&ToggleRun)
				icon_state="Run"

		..()

		if(grabbee)
			for(var/mob/M in world)
				if(M.name==grabbee && M.grabber==usr.name)
					grab()

		if(istype(src,/mob/Dead_Body/))
			src.icon_state = "KO"
		if(chakraOverlay) chakraOverlay.Move(loc)
		if(light) light.loc = src.loc
		if(loc) LastLoc=loc
		if(src.loc) if(istype(src.loc.loc,/area/Caves/))
			if(darkness) if(istype(darkness, /image)) darkness.alpha = 200
		else if(darkness) if(istype(darkness, /image)) if(darkness.alpha == 200) setLightOverlay(outside_light)
	else // If its not 1...
		return // Stop movement
mob/var/tmp/speeding=0
mob/var/tmp/speeddelay=3
mob/Del()
	if(chakraOverlay) del(chakraOverlay)
	..()
mob/proc
	Run()
		set background=1
		while(src)
			var/T=LastLoc
			sleep(rand(8,14))
			if(T==LastLoc&&icon_state=="Run")
				speeding=0
				icon_state = ""
			if(!src.Dead&&!KO&&ToggleRun)
				if(swim||oncliff)
					speeding=0
					icon_state = ""
				if(speeding<=0&&icon_state=="Run")
					speeding=0
					icon_state = ""
				if(src.speeding>=1&&src.speeding<=20)src.speeding-=3
				else
					if(src.speeding>=20&&src.speeding<=50)src.speeding-=5
					else
						if(src.speeding>=50&&src.speeding<=100)src.speeding-=6
						else
							if(src.speeding>=100)src.speeding-=7
				if(src.speeding<= 30)
					if(!src.swim)
						src.speeddelay=1.5
					else
						if(src.swim||oncliff)
							src.speeddelay=4
				else
					if(src.speeding>= 16&&src.Health>=src.MaxHealth/2)
						if(!src.swim)src.speeddelay=1//.5
						else
							if(src.swim)src.speeddelay=4


client
	North()
		if(mob.MindAfflicted) return
		if(mob.MindTransfer)
			if(mob.MindTransfer.grabber)
				mob.MindTransfer.Escape_Chance()
				return
			step(mob.MindTransfer,NORTH)
			return
		else
			if(mob.grabber)
				mob.Escape_Chance()
				return
			..()
	South()
		if(mob.MindAfflicted) return
		if(mob.MindTransfer)
			if(mob.MindTransfer.grabber)
				mob.MindTransfer.Escape_Chance()
				return
			step(mob.MindTransfer,SOUTH)
			return
		else
			if(mob.grabber)
				mob.Escape_Chance()
				return
			..()
	West()
		if(mob.MindAfflicted) return
		if(mob.MindTransfer)
			if(mob.MindTransfer.grabber)
				mob.MindTransfer.Escape_Chance()
				return
			step(mob.MindTransfer,WEST)
			return
		else
			if(mob.grabber)
				mob.Escape_Chance()
				return
			..()
	East()
		if(mob.MindAfflicted) return
		if(mob.MindTransfer)
			if(mob.MindTransfer.grabber)
				mob.MindTransfer.Escape_Chance()
				return
			step(mob.MindTransfer,EAST)
			return
		else
			if(mob.grabber)
				mob.Escape_Chance()
				return
			..()
	Southeast()
		if(mob.MindAfflicted) return
		if(mob.MindTransfer)
			if(mob.MindTransfer.grabber)
				mob.MindTransfer.Escape_Chance()
				return
			step(mob.MindTransfer,SOUTHEAST)
			return
		else
			if(mob.grabber)
				mob.Escape_Chance()
				return
			..()
	Southwest()
		if(mob.MindAfflicted) return
		if(mob.MindTransfer)
			if(mob.MindTransfer.grabber)
				mob.MindTransfer.Escape_Chance()
				return
			step(mob.MindTransfer,SOUTHWEST)
			return
		else
			if(mob.grabber)
				mob.Escape_Chance()
				return
			..()
	Northeast()
		if(mob.MindAfflicted) return
		if(mob.MindTransfer)
			if(mob.MindTransfer.grabber)
				mob.MindTransfer.Escape_Chance()
				return
			step(mob.MindTransfer,NORTHEAST)
			return
		else
			if(mob.grabber)
				mob.Escape_Chance()
				return
			..()
	Northwest()
		if(mob.MindAfflicted) return
		if(mob.MindTransfer)
			if(mob.MindTransfer.grabber)
				mob.MindTransfer.Escape_Chance()
				return
			step(mob.MindTransfer,NORTHWEST)
			return
		else
			if(mob.grabber)
				mob.Escape_Chance()
				return
			..()


/********************************************/
/******** Most of the things here are *******/
/******** simply things added in from *******/
/******** outside sources.     ~LordMachiavelli *******/
/********                             *******/
/******** Uses Forum_accounts key lib *******/
/******** Uses DD procs for utility   *******/
/******** Key lib modified somewhat   *******/
/********************************************/

datum
	proc
		key_up(k, client/c)
		key_down(k, client/c)
		key_repeat(k, client/c)

client

	proc
		key_up(k, client/c)

		key_down(k, client/c)
			__default_action(k)

		key_repeat(k, client/c)
			__default_action(k)

		__default_action(k)
			if(k == "north" || k == "w")
				if(keys["west"] || keys["a"])
					Northwest()
				else if(keys["east"] || keys["d"])
					Northeast()
				else
					North()

			else if(k == "south" || k == "s")
				if(keys["west"] || keys["a"])
					Southwest()
				else if(keys["east"] || keys["d"])
					Southeast()
				else
					South()

			else if(k == "west" || k == "a")
				if(keys["north"] || keys["w"])
					Northwest()
				else if(keys["south"] || keys["s"])
					Southwest()
				else
					West()

			else if(k == "east" || k == "d")
				if(keys["north"] || keys["w"])
					Northeast()
				else if(keys["south"] || keys["s"])
					Southeast()
				else
					East()

			else
				switch(k)
					if("southeast") Southeast()
					if("southwest") Southwest()
					if("northeast") Northeast()
					if("northwest") Northwest()

client
	var
		list/keys = list()

		input_lock = 0

	proc
		lock_input()
			input_lock = 1

		unlock_input()
			input_lock = 0

		clear_input(unlock_input = 1)
			if(unlock_input)
				unlock_input()

			for(var/k in keys)
				keys[k] = 0

	verb
		KeyDown(k as text)
			set hidden = 1
			set instant = 1

			if(input_lock) return

			keys[k] = 1

			key_down(k, src)

		KeyUp(k as text)
			set hidden = 1
			set instant = 1

			keys[k] = 0
			if(input_lock) return

			key_up(k, src)

		KeyRepeat(k as text)
			set hidden = 1
			set instant = 1

			if(input_lock) return

			keys[k] = 1

			key_repeat(k, src)

	New()

		..()

		set_macros()

	proc
		set_macros()
			var/macros = params2list(winget(src, null, "macro"))

			var/list/keys = list("ctrl", "west","east","north","south","northeast","northwest","southeast","southwest","w","a","s","d")

			for(var/m in macros)
				for(var/k in keys)
					winset(src, "[m][k]Up", "parent=[m];name=[k]+UP;command=KeyUp+\"[k]\"")
					winset(src, "[m][k]Repeat", "parent=[m];name=[k]+REP;command=KeyRepeat+\"[k]\"")
