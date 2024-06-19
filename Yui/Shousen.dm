/obj/jutsu/proc/shousen(mob/user)
	var/mob/M = user
	var/mob/target
	for(var/mob/T in get_step(M, M.dir))
		target = T
		if(!target)
			M<<"There is no one to heal infront of you."
		else if(target.isinjured)
			var/choice = input("Which injury would you like to heal?") in target.numinjury
			for(var/i = 0 , i >= target.numinjury.len, i++)
				if(target.numinjury[i] == choice)
					target.RecoveryTime[i] -= 6
					if(target.RecoveryTime[i] <= elapsedtime)
						target.RecoveryTime -= target.RecoveryTime[i]
						target.contents -= choice
						target.numinjury -= choice
						if(!target.numinjury.len)
							target.isinjured = 0
	display_desc(M)