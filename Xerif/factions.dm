/archive/var/list/factions = list()

//�

/obj/faction
	name = "Undefined Faction"

	var/list/members = list()

	var/list/genin = list()
	var/list/Chunin = list()
	var/list/tokubetsu_jonin = list()
	var/list/jonin = list()
	var/leader = null

	var/leader_rank_name = "Kage"

	var/faction_balance = 0
	var/pending_payments = list()
	var/faction_tax = 0
	var/last_taxed_by_key = list()
	var/treasury_logs = "<h2>Treasury Logs</h2>"

	var/last_login_by_key = list()

	proc/give_verbs_by_rank(var/mob/m)

		if(m.key == leader)
			m.verbs += /mob/proc/Promote_To_Leader
			m.verbs += /mob/proc/Set_Leader_Title

		if(m.key == leader || (m.key in jonin))
			m.verbs += /mob/proc/Edit_Village_Page
			m.verbs += /mob/proc/Assign_Member_Rank
			m.verbs += /mob/proc/Invite_To_Faction
			m.verbs += /mob/proc/Boot_Member
			m.verbs += /mob/proc/Withdraw_Funds
			m.verbs += /mob/proc/Deposit_Funds
			m.verbs += /mob/proc/Pay_Member
			m.verbs += /mob/proc/Set_Tax_Rate
			m.verbs += /mob/proc/View_Faction_Funds

		if(m.key == leader || (m.key in jonin) || (m.key in tokubetsu_jonin))
			m.verbs += /mob/proc/Village_Announce

		m.verbs += /mob/proc/View_Village_Page
		m.verbs += /mob/proc/Leave_Faction
		m.verbs += /mob/proc/View_Faction_Members

	proc/remove_faction_verbs(var/mob/m)

		m.verbs -= /mob/proc/Promote_To_Leader
		m.verbs -= /mob/proc/Edit_Village_Page
		m.verbs -= /mob/proc/Assign_Member_Rank
		m.verbs -= /mob/proc/Invite_To_Faction
		m.verbs -= /mob/proc/Boot_Member
		m.verbs -= /mob/proc/Village_Announce
		m.verbs -= /mob/proc/View_Village_Page
		m.verbs -= /mob/proc/Leave_Faction
		m.verbs -= /mob/proc/View_Faction_Members
		m.verbs -= /mob/proc/Set_Leader_Title
		m.verbs -= /mob/proc/Withdraw_Funds
		m.verbs -= /mob/proc/Deposit_Funds
		m.verbs -= /mob/proc/Pay_Member
		m.verbs -= /mob/proc/Set_Tax_Rate
		m.verbs -= /mob/proc/View_Faction_Funds

	proc/add_member(var/mob/m)
		members[m.key] = m.name

	proc/get_faction_members()
		var/list/l = list()
		for(var/mob/m)
			if(m.key in members)
				l += m
		return l

	proc/get_class(key)
		if(key in genin) return "Genin"
		if(key in Chunin) return "Chunin"
		if(key in tokubetsu_jonin) return "Tokubetsu Jonin"
		if(key in jonin) return "Jonin"
		if(key == leader) return leader_rank_name
		if(key in members) return "Academy Student"

	Click()
		usr.View_Village_Page()

/mob/var/tmp/obj/faction/faction

/mob/proc/faction_membership_init()
	if(get_faction())

		if(!faction.members[faction.leader])
			faction.members[faction.leader] = key

		faction.last_login_by_key[key] = world.realtime
		faction.give_verbs_by_rank(src)

		Class = faction.get_class(key)
		Village = faction.name

		if(faction.last_taxed_by_key[key] + (864000) < world.realtime)
			faction.last_taxed_by_key[key] = world.realtime
			var/tax = round(get_ryo() * faction.faction_tax)
			if(tax > 10)
				take_ryo(tax)
				faction.faction_balance += tax
				system_message("You have been taxed [tax] ryo at the faction tax rate of [faction.faction_tax * 100]%")

		if(faction.pending_payments[key])
			give_ryo(faction.pending_payments[key])
			system_message("You have been paid [faction.pending_payments[key]] from your faction funds.")
			faction.pending_payments[key] = 0

	else
		if(Class != "Citizen" && Village == "None")
			Class = "Criminal"
			Village = "None"

/mob/proc/get_faction()
	if(faction) return faction
	for(var/obj/faction/f in archive.factions)
		for(var/k in f.members)
			if(key == k)
				faction = f
				return f
	return null

/mob/proc/leave_faction()
	if(get_faction())
		faction.members -= key
		faction.genin -= key
		faction.Chunin -= key
		faction.tokubetsu_jonin -= key
		faction.jonin -= key
		if(faction.leader == key)
			faction.leader = pick(faction.jonin)
			if(!faction.leader)
				faction.leader = pick(faction.tokubetsu_jonin)
				if(!faction.leader)
					faction.leader = pick(faction.Chunin)
					if(!faction.leader)
						faction.leader = pick(faction.genin)
						if(!faction.leader)
							faction.leader = pick(faction.members)
		faction.remove_faction_verbs(src)
		if(faction.members.len < 1)
			del(faction)
		faction = null
/*
/mob/verb/Create_Faction()

	if(get_faction())
		system_message("You're already in a faction. Leave it first.")
		return

	//if(copytext(get_rank_grade(src), 1, 2) != "A" && copytext(get_rank_grade(src), 1, 2) != "S")
	//	system_message("You're too low rank to create a faction.")
	//	return

	var/a
	while(!a)
		a = input("Input faction name (eg; Konohagakure)") as text
		for(var/obj/faction/f in archive.factions)
			if(f.name == a)
				a = null
				system_message("A faction already exists with that name.")

	var/obj/faction/f = new
	f.name = a
	f.add_member(src)
	f.leader = key

	archive.factions += f

	faction = f
	faction_membership_init()

	Class = "Kage"
	Village = f.name
*/
/mob/proc/Set_Leader_Title()
	set category = "Faction"

	if(get_faction())

		faction.leader_rank_name = input("Change leader title to:") as text

		if(key == faction.leader)
			Class = faction.leader_rank_name

/mob/proc/Promote_To_Leader()
	set category = "Faction"
	if(get_faction())

		var/list/l = list()
		for(var/k in faction.members)
			l += faction.members[k]

		l += "Cancel"

		var/n = input("Select a faction member to promote") in l

		if(n == "Cancel") return

		var/member
		for(var/k in faction.members)
			if(n == faction.members[k])
				member = k
				break

		if(!member) return

		faction.genin -= member
		faction.Chunin -= member
		faction.tokubetsu_jonin -= member
		faction.jonin -= member

		faction.leader = member

		faction.jonin += key

		faction.remove_faction_verbs(src)
		faction_membership_init()

		for(var/mob/m)
			if(m.key == member)
				m.faction_membership_init()
				m.system_message("You've been promoted to [faction.leader_rank_name] of [faction.name].")


/mob/proc/Assign_Member_Rank()
	set category = "Faction"

	if(get_faction())

		var/list/l = list()
		for(var/mob/m)
			if(m.key in faction.members - faction.leader)
				l += faction.members[m.key]

		l += "Cancel"

		var/n = input("Select a faction member to promote") in l

		if(n == "Cancel") return

		var/member
		for(var/k in faction.members)
			if(n == faction.members[k])
				member = k
				break

		if(!member) return

		var/r = input("Select a rank to promote them to") in list("Genin", "Chunin", "Tokubetsu Jonin", "Jonin")

		var/mob/target
		for(var/mob/m)
			if(m.key == member)
				target = m; break
		if(!target)
			system_message("[n] is offline."); return

		if(target.squad)
			system_message("[n] must leave their current squad in order to recieve a new rank.")
			return

		var/grade = copytext(get_rank_grade(target), 1, 2)
		switch(r)
			if("Chunin")
				if(grade != "C" && grade != "B" && grade != "A" && grade != "S")
					system_message("[n] must be at least C- rank to be promoted to Chunin.")
					return
				if(alert("Are you sure you want to promote [n] to Chunin? To do so will cost 1,000 ryo.",, "Yes", "No") == "Yes")
					if(!has_ryo(1000))
						system_message("You don't have enough ryo to promote [n].")
					else
						take_ryo(1000)
				else return
			if("Tokubetsu Jonin")
				if(grade != "B" && grade != "A" && grade != "S")
					system_message("[n] must be at least B- rank to be promoted to Tokubetsu Jonin.")
					return
				if(alert("Are you sure you want to promote [n] to Tokubetsu Jonin? To do so will cost 5,000 ryo.",, "Yes", "No") == "Yes")
					if(!has_ryo(5000))
						system_message("You don't have enough ryo to promote [n].")
					else
						take_ryo(5000)
				else return
			if("Jonin")
				if(grade != "A" && grade != "S")
					system_message("[n] must be at least A- rank to be promoted to Jonin.")
					return
				if(alert("Are you sure you want to promote [n]? To do so will cost 25,000 ryo.",, "Yes", "No") == "Yes")
					if(!has_ryo(25000))
						system_message("You don't have enough ryo to promote [n].")
					else
						take_ryo(25000)
				else return

		faction.genin -= member
		faction.Chunin -= member
		faction.tokubetsu_jonin -= member
		faction.jonin -= member

		switch(r)
			if("Genin")
				faction.genin += member
			if("Chunin")
				faction.Chunin += member
				if(target.stat_cap < 90)
					target.stat_cap = 90
					system_message("Your cap has been raised to [get_rank_grade(target)].")
			if("Tokubetsu Jonin")
				faction.tokubetsu_jonin += member
				if(target.stat_cap < 135)
					target.stat_cap = 135
					system_message("Your cap has been raised to [get_rank_grade(target)].")
			if("Jonin")
				faction.jonin += member
				if(target.stat_cap < 180)
					target.stat_cap = 180
					system_message("Your cap has been raised to [get_rank_grade(target)].")

		for(var/mob/m)
			if(m.key == member)
				m.faction.remove_faction_verbs(m)
				m.faction_membership_init()
				m.system_message("You've been promoted to [r].")



/mob/proc/Boot_Member()
	set category = "Faction"

	if(get_faction())

		var/list/l = list()
		for(var/k in faction.members)
			l += faction.members[k]

		l += "Cancel"

		var/n = input("Select a faction member to boot from the faction") in l

		if(n == "Cancel") return

		var/member
		for(var/k in faction.members)
			if(n == faction.members[k])
				member = k
				break

		if(!member) return

		if(member == faction.leader) return

		faction.genin -= member
		faction.Chunin -= member
		faction.tokubetsu_jonin -= member
		faction.jonin -= member

		faction.members -= member

		for(var/mob/m)
			if(m.key == member)
				m.faction_membership_init()
				m.faction.remove_faction_verbs(m)
				m.faction = null
				m.system_message("You've been declared a rogue by your village!")

/mob/proc/Village_Announce(msg as message)
	set category = "Faction"

	if(get_faction())

		for(var/mob/m in faction.get_faction_members())
			m.system_message("<center><h2>Village Announcement</h2></center>")
			m.system_message("<center>[msg]</center>")

/mob/proc/View_Faction_Members()
	set category = "Faction"

	if(get_faction())

		var/list/online = list()
		for(var/mob/m)
			if(faction.members.Find(m.key))
				online += m.key

		system_message("<h2>Faction Members</h2>")

		system_message("<u>[faction.leader_rank_name]</u>")
		system_message("[online.Find(faction.leader) ? "" : "<font color=#999999>"][faction.members[faction.leader]]")
		system_message("")

		if(faction.jonin.len)
			system_message("<u>Jonin</u>")
			for(var/k in faction.jonin)
				system_message("[online.Find(k) ? "" : "<font color=#999999>"][faction.members[k]]")
			system_message("")

		if(faction.tokubetsu_jonin.len)
			system_message("<u>Tokubetsu Jonin</u>")
			for(var/k in faction.tokubetsu_jonin)
				system_message("[online.Find(k) ? "" : "<font color=#999999>"][faction.members[k]]")
			system_message("")

		if(faction.Chunin.len)
			system_message("<u>Chunin</u>")
			for(var/k in faction.Chunin)
				system_message("[online.Find(k) ? "" : "<font color=#999999>"][faction.members[k]]")
			system_message("")

		if(faction.genin.len)
			system_message("<u>Genin</u>")
			for(var/k in faction.genin)
				system_message("[online.Find(k) ? "" : "<font color=#999999>"][faction.members[k]]")
			system_message("")

		var/list/l = list()
		for(var/k in faction.members)
			if(faction.get_class(k) == "Academy Student")
				l += "[online.Find(k) ? "" : "<font color=#999999>"][faction.members[k]]"
		if(l.len)
			system_message("<u>Academy Student</u>")
			for(var/m in l)
				system_message(m)
			system_message("")

		var/list/i = list()
		for(var/k in faction.last_login_by_key)
			if(faction.last_login_by_key[k] + (864000 * 3) < world.realtime)
				i += k
		if(i.len)
			system_message("<u>Inactive</u>")
			for(var/m in i)
				var/days = round((world.realtime - faction.last_login_by_key[m]) / 864000)
				system_message("[faction.members[m]] - [days] day(s)")
			system_message("")

		system_message("Total Members: [faction.members.len]")

/mob/proc/Invite_To_Faction()
	set category = "Faction"

	if(get_faction())

		var/mob/m = locate() in get_step(src, dir)

		if(!m) return

		if(m.faction && m.faction == faction)
			system_message("[m] is already in your faction.")
			return

		if(m.faction) return

		if(alert(m, "[src] is inviting you to join [faction.name].", "Faction Invitation", "Accept", "Decline") == "Accept")

			if(m.faction) return

			faction.add_member(m)
			m.faction = faction
			m.Class = "Academy Student"
			m.Village = faction.name

			for(var/mob/o in faction.get_faction_members())
				o.system_message("[m] has joined [faction.name].")


/mob/proc/Edit_Village_Page()
	set category = "Faction"

	if(get_faction())
		faction.desc = input(src, "", "Edit Village Page", faction.desc) as message

/mob/proc/View_Village_Page()
	set category = "Faction"

	if(get_faction())
		src << browse(faction.desc, "window=[faction.name];size=500x500")

/mob/proc/Withdraw_Funds(amt as num)
	set category = "Faction"

	if(get_faction())
		if(amt > faction.faction_balance) amt = faction.faction_balance

		if(amt < 1) return

		give_ryo(amt)

		faction.faction_balance -= amt

		faction.treasury_logs += "[src] withdraws [commafy(amt)] ryo.<br>"

		system_message("You withdraw [commafy(amt)] ryo from the treasury.")


/mob/proc/Deposit_Funds(amt as num)
	set category = "Faction"

	if(get_faction())
		if(get_ryo() < amt) amt = get_ryo()

		if(amt < 1) return

		take_ryo(amt)

		faction.faction_balance = faction.faction_balance + amt

		faction.treasury_logs += "[src] deposits [commafy(amt)] ryo.<br>"

		system_message("You deposit [commafy(amt)] ryo to the treasury.")


/mob/proc/Pay_Member()
	set category = "Faction"

	if(get_faction())

		var/list/l = list()
		for(var/k in faction.members)
			l += faction.members[k]

		l += "Cancel"

		var/n = input("Select a faction member to pay") in l

		if(n == "Cancel") return

		var/member
		for(var/k in faction.members)
			if(n == faction.members[k])
				member = k
				break

		if(!member) return

		var/amt = input("Quantity") as num

		if(faction.faction_balance < amt) amt = faction.faction_balance

		if(amt < 1) return

		faction.faction_balance -= amt

		faction.treasury_logs += "[src] pays [n] [commafy(amt)] ryo.<br>"

		system_message("You pay [n] [commafy(amt)] ryo from the treasury.")

		for(var/mob/m)
			if(m.key == member)
				m.system_message("You have been paid [commafy(amt)] from your faction funds.")
				return

		faction.pending_payments[member] = amt

/mob/proc/Set_Tax_Rate(amt as num)
	set category = "Faction"

	if(get_faction())

		amt = round(amt, 0.005)

		if(amt > 0.05)
			system_message("Can't tax at a rate higher than 5% (0.05)")
			return

		if(amt < 0) amt = 0

		faction.faction_tax = amt

		system_message("Faction tax set to [faction.faction_tax * 100]%")

/mob/proc/View_Faction_Funds()
	set category = "Faction"

	if(get_faction())

		src << browse(faction.treasury_logs, "window=treasury;size=300x500")

		system_message("[faction.name] Treasury: [faction.faction_balance] ryo")

/mob/proc/Leave_Faction()
	set category = "Faction"

	if(get_faction())

		if(faction.leader == key && faction.members.len > 1)
			system_message("You must transfer leadership before leaving your faction.")
			return

		if(alert(src, "Are you sure?", , "Yes", "No") == "Yes")
			leave_faction()
			Class = "Criminal"
			Village = "None"
			system_message("You have abandoned the ninja system and become a criminal.")

/mob/verb/World_Factions()

	var/n = 0
	system_message("<u>Factions in the World:</u>")
	for(var/obj/faction/f in archive.factions)
		if(f.members.len > 1)
			system_message("[++n]. [f.name] - [f.leader_rank_name]: [f.members[f.leader]] - Members: [f.members.len] - Treasury: [f.faction_balance] ryo")