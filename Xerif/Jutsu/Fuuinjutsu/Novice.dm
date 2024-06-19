/obj/SkillCard/Jutsu/Fuuinjutsu/Tattoo_Sealing/Basic
	name = "Fuuinjutsu: Chisana inku"
	icon = 'Fuuinjutsu.dmi'
	icon_state = "Tattoo Basic"
	chakra_required = 50
	size_limit = 1
	item_limit = 1

/obj/SkillCard/Jutsu/Fuuinjutsu/Tattoo_Sealing/Lesser
	name = "Fuuinjutsu: Bodishiru"
	icon = 'Fuuinjutsu.dmi'
	icon_state = "Tattoo Lesser"
	chakra_required = 150
	size_limit = 3
	item_limit = 1

/obj/SkillCard/Jutsu/Fuuinjutsu/Tattoo_Sealing/Greater
	name = "Fuuinjutsu: Gurand Obodishiru"
	icon = 'Fuuinjutsu.dmi'
	icon_state = "Tattoo Greater"
	chakra_required = 300
	size_limit = 8
	item_limit = 1

/obj/SkillCard/Jutsu/Fuuinjutsu/Tattoo_Sealing/Gigantic
	name = "Fuuinjutsu: Buki o aruku"
	icon = 'Fuuinjutsu.dmi'
	icon_state = "Tattoo Gigantic"
	chakra_required = 600
	size_limit = 16
	item_limit = 1

/obj/SkillCard/Jutsu/Fuuinjutsu/Tattoo_Sealing/Gigantic/Basic_Lock
	name = "Fuuinjutsu: Kihon rokku"
	icon = 'Fuuinjutsu.dmi'
	icon_state = "Tattoo Gigantic Basic Lock"
	chakra_required = 600
	size_limit = 16
	item_limit = 1
	grade = 2

/obj/SkillCard/Jutsu/Fuuinjutsu/Tattoo_Sealing/Gigantic/Advanced_Lock
	name = "Fuuinjutsu: Kodona rokku"
	icon = 'Fuuinjutsu.dmi'
	icon_state = "Tattoo Gigantic Advanced Lock"
	chakra_required = 1200
	size_limit = 16
	item_limit = 1
	grade = 4

/obj/SkillCard/Jutsu/Fuuinjutsu/Tattoo_Sealing/Gigantic/Complete_Lock
	name = "Fuuinjutsu: Rokku o kanryo"
	icon = 'Fuuinjutsu.dmi'
	icon_state = "Tattoo Gigantic Complete Lock"
	chakra_required = 2400
	size_limit = 16
	item_limit = 1
	grade = 6

/obj/SkillCard/Jutsu/Fuuinjutsu/Tattoo_Sealing
	var/size_limit = 1
	var/item_limit = 1
	var/chakra_required = 1
	var/grade = 0

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

		var/mob/mob = locate() in target
		if(mob)
			if(locate(/obj/fuuinjutsu/tattoo_seal) in mob)
				M << "You cannot seal more than one object into a person."
				return
		else mob = M

		var/items
		for(items = 0, items < item_limit, items++)
			for(var/obj/items/I in target)
				if(istype(I, /obj/items/Scrolls/Scroll))
					if(I.contents.len)
						continue

				if(I.get_size() <= size_limit)
					var/obj/fuuinjutsu/tattoo_seal/seal = new(mob)
					seal.grade = grade
					I.loc = seal
				else
					M << "[I] is too big to be sealed."

		M.Shout("[name]!")

/obj/fuuinjutsu/tattoo_seal
	var/grade = 0