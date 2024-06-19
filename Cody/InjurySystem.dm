mob/var/NewInjury
mob/Admin2/verb
	Give_Injury_Override(mob/M in world)
		var/sevcolor="white"
		var/severity = input("How severe is the injury?") in list ("Light","Moderate","Severe","Permanent","Cancel")
		if(severity=="Cancel")
			return
		switch(severity)
			if("Light")
				sevcolor="Yellow"
			if("Moderate")
				sevcolor="Orange"
			if("Severe")
				sevcolor="Red"
		var/description = input("Describe the injury") as message
		var/Debuff = input("What are the effects?") as message
		M.NewInjury+={"<u><b><font color = [sevcolor]>[severity]</font></b></u><br><br><b>Description:</b> [description] <br><br><b>Effect of Injury:</b> [Debuff]<br>"}
		Admin_Logs+="<br>[usr]([usr.key]) has forced a [severity] injury on [M]."

/*mob/verb
	Give_Injury()
		set category = "Combat"
		if(archive.injallow == 1)
			src<<"Injuries are currently disabled."
			return
		var/list/mobs = list()
		for(var/mob/M in oview(5))
			if(M.client) mobs+=src.getStrangerNameNoHTML(M)

		var/name = input("Injure who?") in mobs+"Cancel"
		if(name=="Cancel") return
		var/mob/M
		for(var/mob/character in oview(5))
			if(name == src.getStrangerNameNoHTML(character))
				M = character
		if(!M.client) return


		var/sevcolor="white"
		var/severity = input("How severe is the injury?") in list ("Light","Moderate","Severe","Permanent","Cancel")
		if(severity=="Cancel")
			return
		switch(severity)
			if("Light")
				sevcolor="Yellow"
			if("Moderate")
				sevcolor="Orange"
			if("Severe")
				sevcolor="Red"
		var/Limb = input("Where is the injury?") in list ("Head","Arm","Leg","Torso","Cancel")
		if(Limb=="Cancel") return
		var/obj/jutsu/Injury = new/obj/jutsu(archive)
		Injury.jutsu_type = "perk"
		switch(Limb)
			if("Head")
				Injury.boost_strength = -10
				Injury.boost_endurance = -10
				Injury.boost_agility = -10
				Injury.boost_speed = -10
				Injury.boost_stamina = -10
				Injury.boost_control = -10
				Injury.boost_vitality = -10
				Injury.boost_chakra_pool = -10
			if("Arm")
				Injury.boost_strength = -10
				Injury.boost_endurance = -10
				Injury.boost_agility = -10
				Injury.boost_speed = -10
				Injury.boost_stamina = -10
				Injury.boost_control = -10
				Injury.boost_vitality = -10
				Injury.boost_chakra_pool = -10
			if("Leg")
				Injury.boost_strength = -10
				Injury.boost_endurance = -10
				Injury.boost_agility = -10
				Injury.boost_speed = -10
				Injury.boost_stamina = -10
				Injury.boost_control = -10
				Injury.boost_vitality = -10
				Injury.boost_chakra_pool = -10
			if("Torso")
				Injury.boost_strength = -10
				Injury.boost_endurance = -10
				Injury.boost_agility = -10
				Injury.boost_speed = -10
				Injury.boost_stamina = -10
				Injury.boost_control = -10
				Injury.boost_vitality = -10
				Injury.boost_chakra_pool = -10

		var/description = input("Describe the injury") as message
		var/Debuff = input("What are the effects?") as message
		switch(alert(M,"[usr] is trying to give you an injury. The severity is [severity]. The description of the injury is [description] and the impact is [Debuff].  Do you accept the Injury?","Injury","Yes","No"))
			if("Yes")
				for(var/mob/X in view(15))
					X << "[X.getStrangerName(usr)] gives a [severity] injury to [M]"
				M.NewInjury+={"<u><b><font color = [sevcolor]>[severity]</font></b></u><br><br><b>Description:</b> [description] <br><br><b>Effect of Injury:</b> [Debuff]<br>"}
				Injury.icon='NoIcon.png'
				Injury.name = "[Limb] Injury"
				Injury.suffix = "Injury applied by [M.getStrangerNameNoHTML(src)] to [Limb]"
				Injury.desc = description
				M.contents += Injury
				M.numinjury += Injury
				if(!M.isinjured) M.isinjured = 1
				switch(severity)
					if("Light")
						var/ref = elapsedtime + 3
						M.RecoveryTime += ref
					if("Moderate")
						var/ref = elapsedtime + 8
						M.RecoveryTime += ref
					if("Severe")
						var/ref = elapsedtime + 14
						M.RecoveryTime += ref
					if("Permanent")
						var/ref = elapsedtime + 1000000000
						M.RecoveryTime += ref
			if("No")
				alert(src,"[M] declined the injury","Try again or GMHelp")
				del(Injury)
*/
