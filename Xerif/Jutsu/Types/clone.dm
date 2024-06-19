/obj/jutsu/proc/clone(mob/user)


	var/mob/Clone/C=new()
	C.Owner=user.ckey
	user.clones+=C
	C.name = uppercase(user.name, 1)
	C.icon=user.icon
	C.SayFont = user.SayFont
	C.Blood()
	C.ContainerName = "[user.name]'s body"
	C.generate_hover_name()
	C.bunshin = 1
	C.displaykey = user.key
	C.Class=user.Class
	C.attackable=1
	C.Savable=0
	C.Age = user.Age
	C.bloodtype = user.bloodtype
	C.Weight = user.Weight
	C.Height = user.Height
	C.strangerName = user.strangerName
	C.Injuries = user.Injuries
	C.Headbands = user.Headbands
	C.mouse_over_pointer = user.mouse_over_pointer
	C.overlays.Add(user.overlays)
	C.loc = user.loc
	flick('Smoke.dmi',C)
	var/mob/controlMob = user
	if(controlMob.MindTransfer) controlMob=controlMob.MindTransfer
	display_desc(controlMob)