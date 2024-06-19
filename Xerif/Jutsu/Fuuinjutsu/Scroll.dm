/obj/items/Scrolls/Scroll
	name = "Scroll"
	desc = "A piece of paper, rolled up so as to provide writing, or sealing material."
	icon = 'Fuuinjutsu.dmi'
	icon_state = "scroll"
	weight = 0.1
	size = 8
	var/data = "An empty scroll."
	var/grade = 0
	var/usage_delay = 0

	Click()
		if(src in view(1))
			if(contents.len)
				break_seal(usr)
			else
				read(usr)

	verb/write()
		set src in usr

		set name = "Write"
		set desc = "Allows you to write something down upon the scroll."

		if(contents.len)
			usr << "You cannot write on a scroll which has something sealed in it."
			return

		data = input(usr, "Edit", "Edit Profile", data) as message

	verb/label()
		set src in usr

		set name = "Label"
		set desc = "Allows you to label the scroll, for reference."

		var/text_input = input() as text

		if(lentext(text_input) >= 50)
			usr << "This label is too long."
			return

		name = "Scroll[text_input ? " -'[text_input]'" : ""]"

	proc/read(mob/M)
		M << browse(data, "window=[src];size=500x350")
		icon_state = "read"
		sleep(50)
		icon_state = "scroll"

	proc/break_seal(mob/M)

		if(usage_delay)
			var/location = M.loc
			icon_state = "seal"

			viewers(16, M) << "[M] begins to trace over the fuuinjutsu written over the scroll."

			sleep(usage_delay)
			icon_state = "scroll"

			if(location != M.loc)
				return

		var/obj/items/Projectile/weapon = locate() in src
		if(weapon)
			var/obj/items/Projectile/stack = locate() in M
			if(stack)
				stack.amount++
			else
				new weapon.type(M)
			if(--weapon.amount < 1)
				del(weapon)
			else
				return

		icon_state = "scroll"

		for(var/obj/O in contents)
			O.loc = src.loc

		grade = 0
		usage_delay = 0

		M << "You break the seal. The stored objects appear above the storage kanji in a puff of smoke."