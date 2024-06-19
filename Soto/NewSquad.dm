
/archive/var/squads[] = list()

squad
	parent_type = /datum

	var
		name = ""
		class = ""
		leader = ""
		village = ""
		members[] = list()
		cards[] = list()
		mission/mission

		tmp
			online_members[] = list()


	proc/add_member(mob/member,squad_name)

		members[member.name] = member.key
		online_members += member

		if(members.len == 1)
			leader = member.name
			class = member.Class
			name = squad_name
			village = member.Village

		member.squad = name

		var/obj/o = new
		cards[member.name] = o
		cards[member.name].icon = member.get_flat_icon()
		cards[member.name].name = member.name


	proc/remove_member(member,kicked=0)
		if(leader == member)
			archive.squads -= name
			for(var/mob/m in online_members)
				if(members[member] == m.key)
					online_members -= m
					m << output("[name] has been disbanded!","outputall.output")
					m.squad = null

		else
			for(var/mob/m in online_members)
				if(members[member] == m.key)
					online_members -= m
					m.squad = null
					if(kicked)
						m << output("You have been kicked from [name]!","outputall.output")
					else
						m << output("You have abandoned [name]!","outputall.output")

				else if(members[m.name] == m.key)
					if(kicked)
						m << output("[member] has been kicked from [name]!","outputall.output")
					else
						m << output("[member] has abandoned [name]!","outputall.output")

			members -= member
			cards -= member


mob/var/squad


mob/verb/squad_create()

	if(squad)
		usr << output("You cannot make a new squad while in a squad.","outputall.output")
		return

	var/squad_name = input("What do you want to name your squad?","Squad","Team [rand(100)]") as null|text
	if(!squad_name)
		return

	if(archive.squads[squad_name])
		usr << output("A squad of that name already exists, try again.","outputall.output")
		return

	archive.squads[squad_name] = new/squad
	archive.squads[squad_name].add_member(src,squad_name)
	show_squad()


mob/verb/squad_recruit()
	if(archive.squads[squad].leader != name)
		usr << output("Only the squad leader can recruit members to the squad.","outputall.output")
		return
	if(archive.squads[squad].mission)
		usr << output("You cannot invite new members to your squad during an ongoing mission.","outputall.output")
		return

	if(archive.squads[squad].members.len > 2)
		if(Class != "Jonin")
			usr << output("You cannot add anymore members to your squad.","outputall.output")
			return

		if(archive.squads[squad].members.len > 3)
			usr << output("You cannot add anymore members to your squad.","outputall.output")
			return

	var/choices[] = list()
	for(var/mob/m in view(8))
		if(m.Village == Village && !m.squad && m != usr && rankToInt(m.Class) <= rankToInt(Class))
			choices += m

	var/mob/selected = input("Who do you want to join your squad?") in choices + "Cancel"
	if(selected == "Cancel") return

	var/response = input(selected,"Do you want to join [usr.squad]?") in list("No","Yes")
	if(response == "No") return

	archive.squads[squad].add_member(selected)
	show_squad()


mob/verb/squad_leave()
	if(archive.squads[squad].mission)
		var/answer = input("Are you sure you want to leave? Your squad will abandon its mission.") in list("No","Yes")
		if(answer=="No") return
		abandon_mission()

	archive.squads[squad].remove_member(name)
	show_squad()



mob/verb/squad_kick()
	if(archive.squads[squad].leader != name)
		usr << output("Only the squad leader can kick members of the squad.","outputall.output")
		return

	if(archive.squads[squad])
		var/selected = input("Which member do you want to kick from your squad?") in archive.squads[squad].members - name + "Cancel"

		if(selected != "Cancel")
			archive.squads[squad].remove_member(selected,1)
			show_squad()


mob/proc/squad_check()
	if(!squad)
		return

	if(!archive.squads[squad])
		squad = null
		usr << output("Your squad was disbanded while you were offline.","outputall.output")
		return

	if(archive.squads[squad].members[name] != key)
		squad = null
		usr << output("Your were removed from your squad while offline.","outputall.output")
		return

	archive.squads[squad].cards[name].icon = get_flat_icon()
	archive.squads[squad].online_members |= src



mob/verb/show_squad()
	set hidden = 1

	if(usr.squad)
		winset(usr,"squadoutput2","is-visible=true")
		winset(src,"mainscreen.childtabpanes", "right=squadoutput2")
		winset(usr,"squadoutput2.squadmembers","cells=0x0")
		winset(usr,"squadoutput2.squadinfo","cells=0x0")

		usr << output("<font color=#DDBE0D>Name", "squadoutput2.squadinfo:1,1")
		usr << output("<font color=#DDBE0D>Rank", "squadoutput2.squadinfo:1,2")
		usr << output("<font color=#DDBE0D>Leader", "squadoutput2.squadinfo:1,3")

		var/row

		usr << output("[archive.squads[squad].name]", "squadoutput2.squadinfo:2,1")
		usr << output("[archive.squads[squad].class]", "squadoutput2.squadinfo:2,2")
		usr << output("[archive.squads[squad].leader]", "squadoutput2.squadinfo:2,3")

		for(var/member in archive.squads[squad].members)
			row++
			usr << output(archive.squads[squad].cards[member],"squadoutput2.squadmembers:1,[row]")
			usr << output("Offline","squadoutput2.squadmembers:2,[row]")
			for(var/mob/m in archive.squads[squad].online_members)
				if(m.name == archive.squads[squad].cards[member].name)
					usr << output("Online","squadoutput2.squadmembers:2,[row]")
	else
		winset(usr,"squadoutput","is-visible=true")
		winset(src,"mainscreen.childtabpanes", "right=squadoutput")


//debug tools//
mob/Admin6/verb/clear_all_squads()
	set category = "Admin6"
	archive.squads = list()
//////////////