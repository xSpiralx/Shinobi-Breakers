/*
verb/Equip
	set category = "Combat"
	for(var/obj/items/weapons in user.contents)
		if (m.client)
	*/

mob/var/equipping = null
obj/items/weapons
	var/max_dur = 200
	var/dur = 200
	var/str = 1
	var/max_str = 200
	var/equipped = 0




	DblClick()
		var/_confirm = input("What are you doing with [src]?") in list("Inspect","Use","Cancel")
		if(_confirm=="Use")
			for(var/mob/M in hearers(16, usr))
				M << output("<font size=-2><font color=white>[M.getStrangerName(usr)] has used their <a href=?databook_[databookname]>[name]</a></font>", "outputall.output")
			..()
			dur--
			if(dur<=0)
				for(var/mob/M in hearers(16, usr))
					M << output("<font size=-2><font color=white>[M.getStrangerName(usr)]'s <a href=?databook_[databookname]>[name]</a> shattered in their hands after its last use!</font>", "outputall.output")
				del(src)
		if(_confirm=="Inspect")
			..()
			switch(dur)
				if(0 to 75)
					for(var/mob/M in hearers(16, usr))
						M<< output("<font size =-2><font color=white>[M.getStrangerName(usr)]'s <a href=?databook_[databookname]>[name]</a> is in poor condition and will likely need to be refurbished.", "outputall.output")

				if(76 to 150)
					for(var/mob/M in hearers(16,usr))
						M<< output("<font size =-2><font color=white>[M.getStrangerName(usr)]'s <a href=?databook_[databookname]>[name]</a> has seen extensive usage but remains sharp!", "outputall.output")

				if(151 to 180)
					for(var/mob/M in hearers(16,usr))
						M<< output("<font size =-2><font color=white>[M.getStrangerName(usr)]'s <a href=?databook_[databookname]>[name]</a> is lightly used but considered new!", "outputall.output")

				if(181 to 200)
					for(var/mob/M in hearers(16,usr))
						M<< output("<font size =-2><font color=white>[M.getStrangerName(usr)]'s <a href=?databook_[databookname]>[name]</a> has a razor sharp edge and is practically new!", "outputall.output")
		if(_confirm=="Cancel")
			..()
			return

	Katana
		icon='katana(sleath.dmi'
		icon_state="Inv"
		var/Sheathe
		Description = "Damage scales with strength + 1 steps, capping at B. This reduces the user�s striking speed by one step. \[This requires 'Katana Prof.' to apply the Combat Prof. perk boosts.]"
		craftRank = "Trained Blacksmith"
		craftChance = 60
		craftCost = 3000

		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "Equipped"
		/*			M<< output("[M.getStrangerName(usr)] has taken their <a href=?databook_[databookname]>[name]</a> into their hands!", "outputall.output") */
					src.equipped = 1
					usr.equipping += src.name
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
		/*			M<< output("[M.getStrangerName(usr)] has removed their <a href=?databook_[databookname]>[name]</a> from their hands!", "outputall.output") */
					usr.Weapon=0
					src.equipped = 0
					usr.equipping-= src.name
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Agility = usr.MaxAgility

		verb/Sheathe()
			if(src in usr.contents)
				if(!worn) return
				if(Sheathe)
					usr.overlays+='katana(atk).dmi'
					Sheathe=0
					usr.Taijutsu *= 1.9
					usr.Agility *=1.6
				else
					usr.overlays-='katana(atk).dmi'
					Sheathe=1
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Agility = usr.MaxAgility
