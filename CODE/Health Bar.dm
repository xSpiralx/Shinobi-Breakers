mob
	var
		stamina_current = 5
	proc
		get_stamina()
			var/c = get_grade_stat( (src.stamina) + stamina_boost_pool())
			switch(c)
				if("E")
					return 20
				if("E+")
					return 24
				if("D-")
					return 29
				if("D")
					return 34
				if("D+")
					return 39
				if("C-")
					return 51
				if("C")
					return 63
				if("C+")
					return 75
				if("B-")
					return 93
				if("B")
					return 111
				if("B+")
					return 129
				if("A-")
					return 150
				if("A")
					return 171
				if("A+")
					return 192
				if("S-")
					return 210
				if("S")
					return 230
				if("S+")
					return 250
	verb
		restore_taistamina()
			set hidden = 1
			set category = "Combat"
			var/mob/controlMob = src
			if(controlMob.MindTransfer) controlMob=controlMob.MindTransfer
			var/d
			var/c = input(src,"What would you like to restore your stamina by?","Your current stamina: [(stamina_current / get_stamina() ) *100]%") in list("Cancel","E","E+","D-","D","D+","C-","C","C+","B-","B","B+","A-","A","A+","S-","S","Full")
			switch(c)
				if("Cancel")
					return
				if("E")
					d = 1
				if("E+")
					d = 2
				if("D-")
					d = 4
				if("D")
					d = 5
				if("D+")
					d = 9
				if("C-")
					d = 13
				if("C")
					d = 16
				if("C+")
					d = 25
				if("B-")
					d = 38
				if("B")
					d = 50
				if("B+")
					d = 65
				if("A-")
					d = 85
				if("A")
					d = 100
				if("A+")
					d = 130
				if("S-")
					d = 170
				if("S")
					d = 200
				if("Full")
					d = get_stamina()

			stamina_current += d
			if(stamina_current >= get_stamina())
				stamina_current = get_stamina()

			if(character_box)
				character_box.update_bars(src)
			for(var/mob/M in hearers(16,controlMob))
				if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) continue
				if(M.MindAfflicted)
					M.MindAfflicted << output("<i>[M.MindAfflicted.getStrangerName(src)] increases their stamina by [c].</i>", "outputall.output")
				else M << output("<i>[M.getStrangerName(src)] increases their stamina by [c].</i>", "outputall.output")

				M.ChatLog("<font color=red>*[src.name] ([src.strangerName]-[src.key]) increases their stamina by [c] - [stamina_current] / [get_stamina()].")

		deduct_taistamina()
			set hidden = 1
			set category = "Combat"
			var/mob/controlMob = src
			if(controlMob.MindTransfer) controlMob=controlMob.MindTransfer
			var/d
			var/c = input(src,"What would you like to deduct your stamina by?","Your current stamina: [(stamina_current / get_stamina() ) *100]%") in list("Cancel","E","E+","D-","D","D+","C-","C","C+","B-","B","B+","A-","A","A+","S-","S","Full")
			switch(c)
				if("Cancel")
					return
				if("E")
					d = 1
				if("E+")
					d = 2
				if("D-")
					d = 4
				if("D")
					d = 5
				if("D+")
					d = 9
				if("C-")
					d = 13
				if("C")
					d = 16
				if("C+")
					d = 25
				if("B-")
					d = 38
				if("B")
					d = 50
				if("B+")
					d = 65
				if("A-")
					d = 85
				if("A")
					d = 100
				if("A+")
					d = 130
				if("S-")
					d = 170
				if("S")
					d = 200
				if("Full")
					d = get_stamina()

			if(stamina_current - d < 0)
				alert("You are incapacitated by incoming damage, RP accordingly.")
				return

			var/critical = 0
			var/percentage = ((stamina_current-d) / get_stamina()) * 100
			if(percentage < 20)
				switch(input("Incoming damage will put you in critical condition! Are you sure you can't react!?") in list("No","Yes"))
					if("No")
						return
				critical = 1

			stamina_current -= d
			if(stamina_current <= 0)
				stamina_current = 0
			if(character_box)
				character_box.update_bars(src)
			for(var/mob/M in hearers(16,controlMob))
				if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) continue
				if(M.MindAfflicted)
					M.MindAfflicted << output("<i>[M.MindAfflicted.getStrangerName(src)] reduces their stmina by a cost of [c]. [critical ? "Current: [percentage]%" : ""]</i>", "outputall.output")
					//if(percentage<20) M.MindAfflicted << output("<i>[M.MindAfflicted.getStrangerName(src)] is at [percentage]% stamina.</i>", "outputall.output")
				else
					M << output("<i>[M.getStrangerName(src)] reduces their stamina by a cost of [c]. [critical ? "Current: [percentage]%" : ""]</i>", "outputall.output")
				//	if(percentage<20) M.MindAfflicted << output("<i>[M.MindAfflicted.getStrangerName(src)] is at [percentage]% stamina.</i>", "outputall.output")

				M.ChatLog("<font color=red>*[src.name] ([src.strangerName]-[src.key]) just reduced their stamina by a cost of [c] - [stamina_current] / [get_stamina()]")

