/obj/SkillCard/Jutsu/Fuuinjutsu/Surpression/Basic
	name = "Fuuinjutsu: Taiya"
	icon = 'Fuuinjutsu.dmi'
	icon_state = "Surpression Basic"
	chakra_required = 500
	seal_amount = 0.25
	grade = 2

/obj/SkillCard/Jutsu/Fuuinjutsu/Surpression/Advanced
	name = "Fuuinjutsu: Haiki"
	icon = 'Fuuinjutsu.dmi'
	icon_state = "Surpression Advanced"
	chakra_required = 1000
	seal_amount = 0.5
	grade = 4

/obj/SkillCard/Jutsu/Fuuinjutsu/Surpression/Complete
	name = "Fuuinjutsu: Kanzen fukuju"
	icon = 'Fuuinjutsu.dmi'
	icon_state = "Surpression Complete"
	chakra_required = 1500
	seal_amount = 1
	grade = 6

/obj/SkillCard/Jutsu/Fuuinjutsu/Surpression
	var/seal_amount = 0.1
	var/chakra_required = 1
	var/usage_delay = 100
	var/grade = 1

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
			if(locate(/obj/fuuinjutsu/surpression) in mob)
				M << "This persons chakra is already sealed."
				return
			else
				if(usage_delay)
					var/target_location = mob.loc
					var/current_location = M.loc
					viewers(14, M) << "[M] begins to write a sealing formula upon [mob]."
					sleep(usage_delay)
					if(target_location != mob.loc)
						return
					if(current_location != M.loc)
						return
		else return

		var/obj/fuuinjutsu/surpression/S = new(mob)
		S.seal_amount = seal_amount
		S.grade = grade

		M.Shout("[name]!")

/obj/fuuinjutsu/surpression
	var/seal_amount = 0.1
	var/grade = 1

	New()
		spawn(50)
			surpress()

	proc/surpress()
		if(ismob(loc))
			var/mob/M = loc
			var/maximum = 1 + (M.Chakra * (1 - seal_amount))
			if(M.Chakra > maximum)
				M.Chakra = maximum
		spawn(50) .()