/obj/jutsu/proc/henge(mob/user)

	if(!user.move)
		return
	else
		if(!user.Henge)
			var/list/V = new/list
			for(var/mob/A in viewers())
				V.Add(A)
			var/mob/M=input("Who would you like to transform into?") in V
			if(!M.client) return
			src.active = 1

			user.name = M.name
			user.generate_hover_name()

			user.Oprofile = user.profile
			user.profile = M.profile
			user.SayFont = M.SayFont
			user.Oage = user.Age
			user.Age = M.Age
			user.bloodtype = M.bloodtype
			user.Height = M.Height
			user.Weight = M.Weight
			user.OInjuries = user.Injuries
			user.Injuries = M.Injuries
			user.oStrangerName = user.strangerName
			user.strangerName = M.strangerName
			user.Henge=1
			user.overlays = null
			user.overlays = M.overlays
			if(M)
				user.icon = M.icon
			flick('smoke.dmi', user)
			var/mob/controlMob = user
			if(controlMob.MindTransfer) controlMob=controlMob.MindTransfer
			display_desc(controlMob)
		else
			flick('smoke.dmi', user)
			user.overlays = null
			for(var/obj/items/Clothing/C in user.contents)
				if(C.worn)
					user.overlays += C.icon

			for(var/i in user.hair_stack)
				user.overlays += i
			user.strangerName=user.oStrangerName
			user.name = user.Oname
			user.generate_hover_name()
			user.Age = user.Oage
			user.bloodtype = user.Obloodtype
			user.Injuries = user.OInjuries
			user.SayFont = user.OSayFont
			user.profile = user.Oprofile
		//	user.faceicon = user.Ofaceicon
			user.Henge = 0
			user.icon = user.Oicon

			src.active = 0

			if(user.Hyuuga)
				user.overlays += 'Hyuuga.dmi'