
mob/var/item/weapons/equipped_weapon

item/weapons/Katana
	var/equipped = FALSE

	Click()
		if(equipped)
			equipped = FALSE
			usr.equipped_weapon = null
		else
			equipped = TRUE
			usr.equipped_weapon = src

mob/verb/compare_weapons()
	var/choices[0], mob/selected
	for(var/mob/m in view(16,usr))
		if(m.client) choices.Add(m)

	selected = input("Who do you want to compare weapons with?") as null|anything in choices
	viewers(16) << "[weaponStatCheck(usr,selected)]"  // does the 16 mean anyone within 16 tiles??


proc/weaponStatCheck(mob/A,mob/B)
	var/item/weapons/a, item/weapons/b,
	(A.equipped_weapon(dur-=>B.equipped_weapon(str))
		if(A.dur-=B.str)// Def wrong but unsure how to call the clickers dur and the victims str stat on the weapon alone.
				del(src) // I know this will delete the weapon but which one
//comparison logic to decide the msg / effects

		return

