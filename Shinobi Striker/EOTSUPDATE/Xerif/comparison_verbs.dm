/mob/verb/Compare_Stat(mob/m as mob in view())
	set category = "Combat"
	set desc = "Allows you to compare a stat with an opponent if given permission."

	var/stat_to_be_compared = input(src, , "Select a stat") in list("Agility", "Speed", "Cancel")

	switch(stat_to_be_compared)
		if("Agility")
			if(alert(m, "[src] is requesting to compare Agility stat.", "Stat Comparison", "Allow", "Deny") == "Allow")
				if(agility + agility_boost() >= m.agility + m.agility_boost())
					compare_agility(m)
				else
					m.compare_agility(src)
		if("Speed")
			if(alert(m, "[src] is requesting to compare Speed stat.", "Stat Comparison", "Allow", "Deny") == "Allow")
				if(speed + speed_boost() >= m.speed + m.speed_boost())
					compare_speed(m)
				else
					m.compare_speed(src)

/mob/proc/compare_agility(mob/m)
	var/mob/controlMob = get_controlled_mob()

	if(agility + agility_boost() >= m.agility + m.agility_boost() + 30)
		view() << "<font color=[controlMob.SayFont]>[src]'s agility completely outmatches [m]'s!"
		view() << "<font color=[controlMob.SayFont]>https://youtu.be/B_BPtACDMvc?t=5m12s"

	else if(agility + agility_boost() >= m.agility + m.agility_boost() + 20)
		view() << "<font color=[controlMob.SayFont]>[src]'s agility is overwhelmingly superior to [m]'s!"
		view() << "<font color=[controlMob.SayFont]>https://youtu.be/zmOS9ufLv5E?t=28s"

	else if(agility + agility_boost() >= m.agility + m.agility_boost() + 10)
		view() << "<font color=[controlMob.SayFont]>[src]'s agility is advantageous to [m]'s!"
		view() << "<font color=[controlMob.SayFont]>https://youtu.be/ryHrlZbQoMw?t=6m45s"

	else
		view() << "<font color=[controlMob.SayFont]>[src]'s agility is approximately equal to [m]'s!"
		view() << "<font color=[controlMob.SayFont]>https://youtu.be/7I6QbXrL5TE?t=55s"

/mob/proc/compare_speed(mob/m)
	var/mob/controlMob = get_controlled_mob()

	if(speed + speed_boost() >= m.speed + m.speed_boost() + 30)
		view() << "<font color=[controlMob.SayFont]>[src]'s speed completely outmatches [m]'s!"
		view() << "<font color=[controlMob.SayFont]>https://youtu.be/cNTspQ5uUUU?t=4m52s"

	else if(speed + speed_boost() >= m.speed + m.speed_boost() + 20)
		view() << "<font color=[controlMob.SayFont]>[src]'s speed is overwhelmingly superior to [m]'s!"
		view() << "<font color=[controlMob.SayFont]>https://youtu.be/7Ipw3mtfILs?t=3m13s"

	else if(speed + speed_boost() >= m.speed + m.speed_boost() + 10)
		view() << "<font color=[controlMob.SayFont]>[src]'s speed is advantageous to [m]'s!"
		view() << "<font color=[controlMob.SayFont]>https://youtu.be/zmOS9ufLv5E?t=28s"

	else
		view() << "<font color=[controlMob.SayFont]>[src]'s speed is approximately equal to [m]'s!"
		view() << "<font color=[controlMob.SayFont]>https://youtu.be/IY7CJRe4R2k?t=1m28s"

//mob/verb/comparison_window(msg as text)
	//switch(msg)
		//if("equal_agi")
			//src << browse(, "window='Equal Agility';size=300x300)

//equal - advantage - overwhelming - outmatched
//   0          10          20           30
//   0 + 0       5 + 1      10 + 2       15 + 3

//speed
//1.
//2. https://youtu.be/zmOS9ufLv5E?t=28s
//3. https://youtu.be/7Ipw3mtfILs?t=3m13s
//4. https://youtu.be/cNTspQ5uUUU?t=32m26s

// speed gives 50% to agi for stam cost

//agi
//1.
//2. https://www.youtube.com/watch?v=7I6QbXrL5TE&t=1m20s / https://youtu.be/ryHrlZbQoMw?t=6m45s
//3. https://youtu.be/zmOS9ufLv5E?t=28s
//4. https://youtu.be/B_BPtACDMvc?t=5m12s