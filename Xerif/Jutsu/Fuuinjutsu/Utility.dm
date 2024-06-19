/obj/SkillCard/Jutsu/Fuuinjutsu/Engraving/Basic
	name = "Fuuinjutsu: Yubi chokoku"
	icon = 'Fuuinjutsu.dmi'
	icon_state = "Finger Engraving Basic"
	chakra_required = 100
	size_limit = 100

/obj/SkillCard/Jutsu/Fuuinjutsu/Engraving
	var/size_limit = 100
	var/chakra_required = 1

	used(mob/M)

		if(M.Chakra < chakra_required)
			M << "You don't have enough chakra."
			return

		M.Chakra -= chakra_required

		if(Active)
			return
		else
			..()

		M.Shout("[name]!")

/obj/SkillCard/Jutsu/Fuuinjutsu/Seal_Sight/Basic
	name = "Fuuinjutsu: Jomae-me"
	icon = 'Fuuinjutsu.dmi'
	icon_state = "Seal Sight Basic"
	chakra_required = 50
	grade_limit = 2

/obj/SkillCard/Jutsu/Fuuinjutsu/Seal_Sight/Advanced
	name = "Fuuinjutsu: Yomae-me"
	icon = 'Fuuinjutsu.dmi'
	icon_state = "Seal Sight Advanced"
	chakra_required = 100
	grade_limit = 4

/obj/SkillCard/Jutsu/Fuuinjutsu/Seal_Sight
	var/grade_limit = 1
	var/chakra_required = 1

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
			if(S.contents.len)
				scroll = S
				break

		if(!scroll)
			return

		if(scroll.grade > grade_limit)
			M << "This seal is too complicated for you to read."
			return

		M << "It appears that this scroll has the following things stored within it:"

		for(var/obj/items/I in scroll)
			M << "[I]"

		M.Shout("[name]!")