/obj/SkillCard/Jutsu/Fuuinjutsu/Object_Sealing/Collapsible
	name = "Fuuinjutsu: Hokai"
	icon = 'Fuuinjutsu.dmi'
	icon_state = "Collapse"
	chakra_required = 500
	size_limit = 3
	item_limit = 1
	seal_grade = 3

/obj/SkillCard/Jutsu/Fuuinjutsu/Object_Sealing/Collapsible

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
			var/location = scroll.loc
			viewers(14, M) << "[M] begins to write a sealing formula upon the scroll."
			sleep(usage_delay)
			if(location != scroll.loc)
				return

		var/items
		for(items = 0, items < item_limit, items++)
			for(var/obj/items/Projectile/I in target)

				if(scroll.get_size() < I.get_real_size())
					M << "The scroll is too small to have [I] sealed into it."
				else if(I.get_real_size() <= size_limit)
					var/obj/items/Projectile/weapon = locate() in scroll
					if(weapon)
						if(weapon.type != I.type)
							M << "The scroll rejects [I]"
						else
							weapon.amount += I.amount
							del(I)
					else
						I.loc = scroll
				else
					M << "[I] is too big to be sealed into this scroll."

		if(scroll.contents.len)
			scroll.icon_state = "seal"
			scroll.usage_delay = usage_delay
			scroll.grade = seal_grade
			scroll.data = null

		M.Shout("[name]!")