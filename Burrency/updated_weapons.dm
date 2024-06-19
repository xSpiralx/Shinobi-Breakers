
mob/var/obj/items/weapons/equipped_weapon

obj/items/weapons
	var
		durability = 10
		durabilityRemaining = 10
		strength = 1
		canBladelock = FALSE
		canEquip = FALSE
		equipped = FALSE


	proc/inspect(mob/user)
		var/percentage, msg

		percentage = (durabilityRemaining/durability)*100
		switch(percentage)
			if(0 to 24)
				msg = "'s <a href=?databook_[databookname]>[name]</a> is in poor condition and will likely need to be refurbished!"
			if(25 to 49)
				msg = "'s <a href=?databook_[databookname]>[name]</a> has seen extensive usage but remains sharp!"
			if(50 to 74)
				msg = "'s <a href=?databook_[databookname]>[name]</a> is lightly used but considered new!"
			if(75 to 99)
				msg = "'s <a href=?databook_[databookname]>[name]</a> has a razor sharp edge and is practically new!"
			if(100)
				msg = "'s <a href=?databook_[databookname]>[name]</a> is likely freshly made, and has never seen use!"

		show_msg(user,msg)

	proc/showcase(mob/user)
		var/msg
		if(--durabilityRemaining > 0)
			msg = " has used their <a href=?databook_[databookname]>[name]</a>"
		else
			msg = "'s <a href=?databook_[databookname]>[name]</a> shattered in their hands after it was used!"

		show_msg(user,msg)
		if(durabilityRemaining <= 0)
			shatter()


	proc/bladelock(mob/user)
		var/choices[0], mob/selected, confirmation, msg
		for(var/mob/m in view(16,user))
			if(m.client) choices.Add(m)

		selected = input(user,"Who do you want to bladelock with?") as null|anything in choices
		if(selected.equipped_weapon)
			confirmation = input(selected,"[user] wants to bladelock your [selected.equipped_weapon] with their [user.equipped_weapon], do you accept?") in list("No","Yes")

		if(confirmation == "Yes")
			msg = "[clash(selected.equipped_weapon,selected)]"
			show_msg(user,msg)


	proc/clash(obj/items/weapons/other,mob/selected)
		var/msg
		if(durabilityRemaining - other.strength <= 0)
			msg = " 's <a href=?databook_[databookname]>[name]</a> breaks against [selected.name]'s <a href=?databook_[other.databookname]>[other.name]</a>."
			shatter()
		else
			msg = " 's <a href=?databook_[databookname]>[name]</a> clashed with [selected.name]'s <a href=?databook_[other.databookname]>[other.name]</a> without breaking."

		durabilityRemaining =- other.strength
		return msg


	proc/shatter()
		del(src)

	proc/equip(mob/user)
		var/obj/items/weapons/previousWeapon, msg

		previousWeapon = user.equipped_weapon
		if(previousWeapon)
			previousWeapon.unequip(user)
			user.equipped_weapon = src
			equipped = TRUE
			msg = " has unequipped their <a href=?databook_[previousWeapon.databookname]>[previousWeapon.name]</a> and equipped their <a href=?databook_[databookname]>[name]</a> instead."
		else
			user.equipped_weapon = src
			equipped = TRUE
			msg = " has equipped a <a href=?databook_[databookname]>[name]</a>."

		overlays += src
		show_msg(user,msg)


	proc/unequip(mob/user)
		user.equipped_weapon = null
		equipped = FALSE
		overlays -= src


	proc/show_msg(mob/user,msg)
		for(var/mob/m in hearers(16,user))
			m << output("<font size=-2><font color=white>[m.getStrangerName(user)][msg]</font>","outputall.output")


	DblClick()
		var/actions[0], actionSelected

		actions = list("Inspect","Show")
		if(canEquip)
			actions.Add("Equip","Unequip")
		if(canBladelock && equipped)
			actions.Add("Bladelock")

		actionSelected = input("What do you want to do with [src]?") as null|anything in actions
		switch(actionSelected)
			if("Inspect")
				inspect(usr)
			if("Show")
				showcase(usr)
			if("Bladelock")
				bladelock(usr)
