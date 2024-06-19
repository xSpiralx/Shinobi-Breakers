/obj/jutsu/proc/shunshin(mob/user)
	var/mob/controlMob = user
	if(controlMob.MindTransfer) controlMob=controlMob.MindTransfer
	if(!controlMob.Shunshin)
		user<<output("You have activated Shunshin no Jutsu, to use it double click on a flat piece of ground to replace your body with an object and move to that area.","outputic.output")
		user<<output("You have activated Shunshin no Jutsu, to use it double click on a flat piece of ground to replace your body with an object and move to that area.","outputall.output")
		controlMob.Shunshin=1
		display_desc(controlMob)
	else
		user<<output("You deactivate Shunshin no Jutsu, you can no longer use this Jutsu until you reactivate it.","outputic.output")
		user<<output("You deactivate Shunshin no Jutsu, you can no longer use this Jutsu until you reactivate it.","outputall.output")
		controlMob.Shunshin=0