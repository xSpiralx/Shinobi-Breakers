/obj/jutsu/proc/suimen(mob/user)

	var/mob/controlMob = user
	if(controlMob.MindTransfer) controlMob=controlMob.MindTransfer
	if(!controlMob.Convert)
		if(controlMob.resting)
			return
		display_desc(controlMob)
		src.active = 1
		user << output("You have activated Suimen Hokou no Waza, you have control and balanced chakra to your feet and can now walk on water, climb montains, and climb trees.", "outputall.output")
		controlMob.Convert = 1
		controlMob.overlays -= 'Swim.dmi'
		controlMob.swim = 0
	else
		user << output("You have deactivated Suimen Hokou no Waza.", "outputall.output")
		controlMob.Convert = 0
		src.active = 0