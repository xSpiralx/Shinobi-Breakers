
#define Hour(s) *36000
#define Minute(s) *600
#define Second(s) *10

mob/var/injuries[0]

proc/convert2hours(time)
	return round((time/36000),0.1)

injury
	parent_type = /datum
	var/name
	var/timeInflicted
	var/timeRecovered
	var/whoInflicted
	var/duration
	var/desc
	var/color

	proc/description()
		while(!desc)
			var/_desc = input("Please describe the injury you've inflicted.") as message
			desc = html_encode(_desc)

	proc/injure(var/mob/M)
		M.injuries.Add(src)

	petty
		name = "Petty Injury"
		color = COLOR_PETTY_INJURY
		duration = 30 Minute(s)

	light
		name = "Light Injury"
		color = COLOR_LIGHT_INJURY
		duration = 2 Hour(s)

	moderate
		name = "Moderate Injury"
		color = COLOR_MODERATE_INJURY
		duration = 4 Hour(s)

	heavy
		name = "Heavy Injury"
		color = COLOR_HEAVY_INJURY
		duration = 12 Hour(s)

	critical
		name = "Critical Injury"
		color = COLOR_CRITICAL_INJURY
		duration = 24 Hour(s)

	permanent
		name = "Permanent Injury"
		color = COLOR_CRITICAL_INJURY
		duration = 1#INF


mob/proc/check_injury_timers()
	for(var/injury/i in injuries)
		if(world.realtime >= i.timeRecovered)
			viewers(16,src) << output("<font color=white><font size = -3><font color=[SayFont]>[src]</font color> has healed from their <font color=[i.color]><u>[i.name]</font color>. [i.desc]","outputall.output")
			injuries -= i
		else
			var/_timeLeft = i.timeRecovered - world.realtime

			if(_timeLeft <= 12 Hour(s))
				i.name = "Heavy Injury"
				i.color = COLOR_HEAVY_INJURY

			if(_timeLeft <= 4 Hour(s))
				i.name = "Moderate Injury"
				i.color = COLOR_MODERATE_INJURY

			if(_timeLeft <= 2 Hour(s))
				i.name = "Light Injury"
				i.color = COLOR_LIGHT_INJURY

			if(_timeLeft <= 30 Minute(s))
				i.name = "Petty Injury"
				i.color = COLOR_PETTY_INJURY


mob/proc/check_injuries(mob/m)
	var/_html = "<title>Injuries</title><style>td,body {padding: 3px; font-size:13px;}</style><body bgcolor=black><table align=center border=1 bordercolor=#1b2229 style=border-collapse:collapse;font-family:calibri;><tr><td style=width:30%><font color=#e1c242>Injury</td><td style=width:45%><font color=#e1c242>Description</td><td style=25%><font color=#e1c242>Time Remaining</td></tr>"

	for(var/injury/i in m.injuries)
		if(i.name != "Permanent Injury")
			_html+="<tr><td><font color=white><font color=[i.color]>[i.name]</font color></td><td><font color=white>[i.desc]</td><td><font color=white>[convert2hours(i.timeRecovered - world.realtime)] Hour(s)</td></tr>"
		else
			_html+="<tr><td><font color=white><font color=[i.color]>[i.name]</font color></td><td><font color=white>[i.desc]</td><td><font color=white>[time2text(i.timeInflicted,"DD/MM/YYYY")]</td></tr>"

	return _html


mob/verb/injure()
	var/choices[0], mob/M
	for(var/mob/m in view())
		if(m.client)
			choices.Add(m)

	M = input("Who do you want to inflict an injury on?") as null|anything in choices

	var/_injuryTypes[] = list("Petty","Light","Moderate","Heavy","Critical","Permanent")
	var/_injurySeverity = input("What severity of injury do you want to inflict on [M]?") as null|anything in _injuryTypes
	var/injury/injury

	switch(_injurySeverity)
		if("Petty")
			injury = new/injury/petty
		if("Light")
			injury = new/injury/light
		if("Moderate")
			injury = new/injury/moderate
		if("Heavy")
			injury = new/injury/heavy
		if("Critical")
			injury = new/injury/critical
		if("Permanent")
			injury = new/injury/permanent

	injury.description()
	if(injury.desc)
		var/_agreement = input(M,"[usr] is attempting to give '[injury.desc]' as a [_injurySeverity] injury. Do you agree?") in list("No","Yes")
		if(_agreement == "Yes")
			injury.injure(M)
			injury.timeInflicted = world.realtime
			injury.timeRecovered = world.realtime + injury.duration
			injury.whoInflicted = usr
			viewers(16) << output("<font color=white><font size = -3><font color=[M.SayFont]>[M]</font color> recieves a <font color=[injury.color]><u>[injury.name]</u></font color>. [injury.desc]","outputall.output")