mob/var/tmp/
	grabbee //who you are grabbing.
	grabber //who is grabbing you

	grabberSTR //the strength of the person grabbing you.


mob/verb
	Grab()
		set category="Combat"
		for(var/mob/M in range(1))
			if(usr.grabbee==M.name && M.grabber==usr.name)
				usr << output("You release them.","outputic.output")
				usr << output("You release them.","outputall.output")
				M.grabber=null
				usr.grabbee=null
				usr.attacking=0
				//M.pixel_y=0
				//M.pixel_x=0
				return
		for(var/mob/M in get_step(src,dir))
			//if(M.client)
			if(istype(M,/mob/NPC/)) return
			if(istype(M,/package_recipient)) return
			if(!grabbee && !attacking && !grabber)
				usr << output("You grab [usr.getStrangerName(M)].","outputic.output")
				usr.grabbee=M.name
				M.grabber=usr.name
				M.grabberSTR=usr.Strength
				usr.attacking=1
				if(M.resting)
					M.resting=0
					M.icon_state=""
					M.move=1
					M.meditate=0
					M.allowmed=0
					spawn(100) M.allowmed=1
				usr.grab()

/*	Release()
		set category="Combat"
		for(var/mob/M in oviewers(1))
			if(usr.grabbee==M.name && M.grabber==usr.name)
				usr << output("You release [usr.grabbee].","outputic.output")
				M.grabber=null
				usr.grabbee=null
				usr.attacking=0*/

mob/proc/grab()
	if(grabbee)
		if(!grabber)
			var/foundgrabbee=0
			for(var/mob/M in world)
				if(M.name==grabbee && M.grabber==usr.name)
					foundgrabbee=1
					M.density = 0
					M.teleporting = 1
					M.Move(usr.loc)
					if(M.chakraOverlay) M.chakraOverlay.loc = M.loc
					if(M.Fishing)
						M.Fishing=0
						M.move=1
						M<<output("You were forced to stop fishing!","outputic.output")
						M<<output("You were forced to stop fishing!","outputall.output")
						M.icon_state=""
					if(M.Mining)
						M.Mining=0
						M.move=1
						M<<output("You were forced to stop mining!","outputic.output")
						M<<output("You were forced to stop mining!","outputall.output")
						M.icon_state=""
					M.teleporting = 0
					M.density = 1
			if(!foundgrabbee)
				for(var/mob/M in world)
					if(M.name==grabbee | M.grabber==usr.name)
						for(var/mob/X in hearers())
							X << output("[X.getStrangerName(usr)] loses their grip.","outputic.output")
							X << output("[X.getStrangerName(usr)] loses their grip.","outputall.output")
						M.grabber=null
						usr.grabbee=null
						usr.attacking=0
						M.density = 1
		else
			for(var/mob/M in range(3))
				if(M.name==grabbee | M.grabber==usr.name)
					for(var/mob/X in viewers())
						X << output("[X.getStrangerName(usr)] is forced to release their grip!","outputic.output")
						X << output("[X.getStrangerName(usr)] is forced to release their grip!","outputall.output")
					M.grabber=null
					usr.grabbee=null
					usr.attacking=0
					M.pixel_y=0
					M.density = 1

mob/var/escaping=0 //belongs to the Escape_Chance() proc
mob/proc/Escape_Chance()
	if(!usr.escaping)
		usr.escaping=1
		var/holdstr=((usr.Strength/usr.grabberSTR)*rand(1,125))
		//if equal str then about 25% chance to break free.

		//this block provides the small chance to boost escape chance.
		var/random=rand(1,10)
		if(random==5)
			holdstr*=rand(2,5)

		//this block decides if you have beaten the odds to escape.
		if(holdstr>100)
			usr.grabber=null
		sleep(15)
		usr.escaping=0

