/obj/SkillCard/Jutsu/Fuuinjutsu/Object_Sealing/Fake
	name = "Fuuinjutsu: Nisemono"
	icon = 'Fuuinjutsu.dmi'
	icon_state = "Fake"
	chakra_required = 5
	size_limit = 1
	item_limit = 1
	seal_grade = 1

/obj/SkillCard/Jutsu/Fuuinjutsu/Object_Sealing/Lesser
	name = "Fuuinjutsu: Chisana Buki"
	icon = 'Fuuinjutsu.dmi'
	icon_state = "Lesser"
	chakra_required = 50
	size_limit = 3
	item_limit = 1
	seal_grade = 2

/obj/SkillCard/Jutsu/Fuuinjutsu/Object_Sealing/Greater
	name = "Fuuinjutsu: Ogata Buki"
	icon = 'Fuuinjutsu.dmi'
	icon_state = "Greater"
	chakra_required = 200
	size_limit = 8
	item_limit = 1
	seal_grade = 3

/obj/SkillCard/Jutsu/Fuuinjutsu/Object_Sealing/Gigantic
	name = "Fuuinjutsu: Kyodaina Buki"
	icon = 'Fuuinjutsu.dmi'
	icon_state = "Gigantic"
	chakra_required = 400
	size_limit = 16
	item_limit = 1
	seal_grade = 4

/obj/SkillCard/Jutsu/Fuuinjutsu/Object_Sealing/Supply
	name = "Fuuinjutsu: Kyo-kyu"
	icon = 'Fuuinjutsu.dmi'
	icon_state = "Supply"
	chakra_required = 400
	size_limit = 100
	item_limit = 10
	seal_grade = 2
	usage_delay = 600

/obj/SkillCard/Jutsu/Fuuinjutsu/Object_Sealing
	var/size_limit = 1
	var/item_limit = 1
	var/seal_grade = 1
	var/chakra_required = 1
	var/usage_delay = 0

	used(mob/M)

		if(M.Chakra < chakra_required)
			M << "You don't have enough chakra."
			return

		M.Chakra -= chakra_required

		if(Active)
			return
		else
			..()

		var/turf/target = get_step(M.loc, M.dir)

		if(!target || !isturf(target)) return

		var/obj/items/Scrolls/Scroll/scroll = null

		for(var/obj/items/Scrolls/Scroll/S in target)
			if(!S.contents.len)
				scroll = S
				break

		if(!scroll)
			return

		if(usage_delay)
			var/target_location = scroll.loc
			var/current_location = M.loc
			viewers(14, M) << "[M] begins to write a sealing formula upon the scroll."
			sleep(usage_delay)
			if(target_location != scroll.loc)
				return
			if(current_location != M.loc)
				return

		var/items
		for(items = 0, items < item_limit, items++)
			for(var/obj/items/I in target)
				if(istype(I, /obj/items/Scrolls/Scroll))
					if(I.contents.len)
						continue

				if(scroll.get_size() < I.get_size())
					M << "The scroll is too small to have [I] sealed into it."
				else if(I.get_size() <= size_limit)
					I.loc = scroll
				else
					M << "[I] is too big to be sealed into this scroll."

		if(scroll.contents.len)
			scroll.icon_state = "seal"
			scroll.usage_delay = usage_delay
			scroll.grade = seal_grade
			scroll.data = null

		M.Shout("[name]!")