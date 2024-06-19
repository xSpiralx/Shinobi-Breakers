mob/var/canhahelp = 1
mob/var/infpoints = 0
mob/var/jutsupoints = 0
mob/var/lifetime_infpoints = 0
mob/var/notable = 0
mob/var/title = "???"
mob/var/following = 0
mob/var/libCD = 0
mob/var/libtimer
mob/var/list/masteredjutsu = list()
mob/var/list/taughtjutsu = list()
var/loss = 55
var/noteworthy = 10000
var/combatrules = " "
obj/tjutsu
	var/many = 0
	var/jutsu_type

proc/SaveCRules()
	var/savefile/ref = new("combatrules.txt")
	ref["combatrules.txt"]<<combatrules
proc/LoadCRules()
	var/savefile/ref = new("combatrules.txt")
	ref["combatrules.txt"]>>combatrules

mob/proc/Check_Quote(string)
	var
		q1 = findtext(string,"\"")
		q2 =  (q1 != 0 ? findtext(string,"\"", q1+1) : 0 )
		last_q2= q2
	if(!q1) return string
	if(!q2) return string
	. = html_encode(copytext(string,1,q1))
	while(q1 && q2)
		. += "<font color = white>[html_encode(copytext(string,q1,q2+1))]</font>"
		last_q2 = q2
		q1 = findtext(string, "\"", q2+1)
		if(!q1) break
		q2 = findtext(string, "\"", q1+1)
		if(q2)
			. += html_encode(copytext(string,  last_q2+1, q1))
	. += html_encode(copytext(string, last_q2+1))


/*
mob/proc/Check_Bold(string)


	var
		q1 = findtext(string,"**")
		q2 =  (q1 != 0 ? findtext(string,"**", q1+1) : 0 )
		last_q2= q2

	if(!q1) return string
	if(!q2) return string
	. = html_encode(copytext(string,1,q1))

	while(q1 && q2)
		. += "<b>[html_encode(copytext(string,q1+2,q2))]</b>"

		last_q2 = q2
		q1 = findtext(string,"**",q2)
		if(!q1) break
		q2 = findtext(string,"**",q1+1)
		if(q2)
			. += html_encode(copytext(string,  last_q2+1, q1+2))
			//world << "[copytext(string,  last_q2+1, q1)]"

	//. += html_encode(copytext(string, last_q2+1))
*/

/*
	while(q1 && q2)
		. += "<b>[html_encode(copytext(string,q1,q2+1))]</b>"
		world << "step one [.]"

		last_q2 = q2
		q1 = findtext(string, "**", q2+1)
		if(!q1) break
		q2 = findtext(string, "**", q1+1)
		if(q2)
			. += html_encode(copytext(string,  last_q2+1, q1))
			world << "step two [.]"
	. += html_encode(copytext(string, last_q2+1))
	world << "step three [.]"*/


/*mob/verb/Notable_Persons()
	src<<browse(GenerateNotables(), "window=notable;size=500x350")*/

mob/verb/Follow()
	set category = "Combat"
	if(following == 1)
		following = 0
		walk(src, 0)
		usr << output("You stop following.", "outputall.output")
		return
	var/mob/target
	for(var/mob/A in get_step(src, src.dir))
		if(!A || !A.client) return
		target = A
		usr << output("You start following.", "outputall.output")
	walk_to(src, target, 1, 0)
	following = 1

	while(following)
		if(target.z != z)
			loc = locate(target.x,target.y,target.z)
		sleep(world.tick_lag)

/*mob/verb/Upgrade_Jutsu()
	set hidden = 1
	var/list/ref = list()
	for(var/obj/jutsu/X in src)
		if(X.jutsu_type <> "perk")
			ref += X
	var/obj/jutsu/choice = input("Which jutsu would you like to upgrade?") in ref
	if(choice in masteredjutsu)
		alert("You have already mastered this technique.")
		return
	var/choice2 = input("Are you sure you want to advance your mastery of [choice]? It will cost you [choice.mastery_cost] jutsu points.") in list("Yes", "No")
	switch(choice2)
		if("No") return
		if("Yes")
			if(jutsupoints >= choice.mastery_cost)
				jutsupoints -= choice.mastery_cost
				masteredjutsu +=choice
				alert("You have achieved a mastered skill level over [choice].")
			else
				alert("Not enough points.")
				return*/

mob/verb/Suicide()
	set hidden = 1
	var/choice = input("Are you sure you want to commit suicide?") in list ("Yes", "No")
	switch(choice)
		if("Yes")
			src.Death()
		if("No")
			return

/*mob/verb/Combat_Rules()
	usr<<browse(combatrules, "window=combatrule;size=500x350")*/

/*mob/verb/Auto_Injury()
	set category = "Combat"
	if(archive.injallow == 1)
		src<<"Injuries are currently disabled."
		return
	var/choice = input("Are you sure you want to inflict an injury on yourself?") in list("Yes", "No")
	switch(choice)
		if("No")
			return
		if("Yes")
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

			for(var/mob/X in view(15))
				X << "[src] gives themselves a [severity] injury."
			NewInjury+={"<u><b><font color = [sevcolor]>[severity]</font></b></u><br><br><b>Description:</b> [description] <br><br><b>Effect of Injury:</b> [Debuff]<br>"}
			Injury.icon='NoIcon.png'
			Injury.name = "[Limb] Injury"
			Injury.suffix = "Injury applied by [src] to [Limb]"
			Injury.desc = description
			src.contents += Injury
			numinjury += Injury
			if(!isinjured) isinjured = 1
			switch(severity)
				if("Light")
					var/ref = elapsedtime + 3
					RecoveryTime += ref
				if("Moderate")
					var/ref = elapsedtime + 8
					RecoveryTime += ref
				if("Severe")
					var/ref = elapsedtime + 14
					RecoveryTime += ref
				if("Permanent")
					var/ref = elapsedtime + 1000000000
					RecoveryTime += ref

var/failsafe = {"
<style>
html, body { margin:0px; padding:0px; }

#profile {
border: hidden;
background-color: transparent; }

body {
font-family:"Calibri";
font-size:13px;
color:white;
background-image:url('loginbackground.png');
background-attachment:fixed;
background-position:center;
}

h2{
font-family: "Palatino Linotype";
}
   .more {
      display: none;
      border-top: 1px solid #666;
      border-bottom: 1px solid #666; }
   a.showLink, a.hideLink {
      text-decoration: none;
      color: #36f;
      padding-left: 8px;
      background: transparent url(down.gif) no-repeat left; }
   a.hideLink {
      background: transparent url(up.gif) no-repeat left; }
   a.showLink:hover, a.hideLink:hover {
      border-bottom: 1px dotted #36f; }
</style>

<html>
<head>
<title>The World's Most Notable Figures</title>
</head>
<body>
"}
*/