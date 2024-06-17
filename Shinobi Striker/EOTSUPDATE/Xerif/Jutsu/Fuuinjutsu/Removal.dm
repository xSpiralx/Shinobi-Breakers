/obj/SkillCard/Jutsu/Fuuinjutsu/Remove/Basic
	name = "Fuuinjutsu: Sakujo suru"
	icon = 'Fuuinjutsu.dmi'
	icon_state = "Remove Basic"
	chakra_required = 100
	grade = 2

/obj/SkillCard/Jutsu/Fuuinjutsu/Remove/Advanced
	name = "Fuuinjutsu: Kodo jokyo"
	icon = 'Fuuinjutsu.dmi'
	icon_state = "Remove Advanced"
	chakra_required = 200
	grade = 4

/obj/SkillCard/Jutsu/Fuuinjutsu/Remove/Complete
	name = "Fuuinjutsu: Kanzen jokyo"
	icon = 'Fuuinjutsu.dmi'
	icon_state = "Remove Complete"
	chakra_required = 400
	grade = 6

/obj/SkillCard/Jutsu/Fuuinjutsu/Remove
	var/chakra_required = 1
	var/grade = 1

	used(mob/M)

		if(M.Chakra < chakra_required)
			M << "You don't have enough chakra."
			return

		M.Chakra -= chakra_required

		var/turf/target = get_step(M.loc, M.dir)

		if(!target || !isturf(target)) return

		var/mob/mob = locate() in target
		if(!mob)
			mob = M

		for(var/obj/fuuinjutsu/tattoo_seal/seal in mob)
			if(seal.grade < grade)
				for(var/obj/O in seal)
					O.loc = mob.loc
				M << "You remove the seal on [mob]."
			else
				M << "This seal is too complicated."
			del(seal)

		for(var/obj/fuuinjutsu/surpression/seal in mob)
			if(seal.grade < grade)
				M << "You remove the seal on [mob]."
			else
				M << "This seal is too complicated."
			del(seal)

		M.Shout("[name]!")