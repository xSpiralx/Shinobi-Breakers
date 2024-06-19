/obj/jutsu/proc/sense(mob/user)
	if(!user.Shingan)
		user<<"(You can see how much chakra a person has by the visibility of their chakra overlay)"
		user.sight |= SEE_MOBS
		user.see_invisible = 1
		user.Shingan = extra_type
		for(var/obj/chakraoverlay/O in world) O.layer = 90
		var/mob/controlMob = user
		if(controlMob.MindTransfer) controlMob=controlMob.MindTransfer
		display_desc(controlMob)
	else
		user.see_invisible = 0
		user.sight &= ~SEE_MOBS
		user.client.images=null
		user.Shingan=0

mob/var/Kagura=0

/obj/jutsu/proc/kagura(mob/user)
	if(!user.Kagura)
		user<<"(You can see how much chakra a person has by the visibility of their chakra overlay)"
		user.sight |= SEE_MOBS
		user.see_invisible = 1
		user.Kagura = extra_type
		for(var/obj/chakraoverlay/O in world) O.layer = 90
		var/mob/controlMob = user
		if(controlMob.MindTransfer) controlMob=controlMob.MindTransfer
		display_desc(controlMob)
	else
		user.see_invisible = 0
		user.sight &= ~SEE_MOBS
		user.client.images=null
		user.Kagura=0