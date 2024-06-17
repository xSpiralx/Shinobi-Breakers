/obj/faction
	name = "Faction"
	var/tax = 0.2
	var/funds = 0

	proc/update_status()
		suffix = "<b>[name]</b><br>Faction funds: [funds]<br>Tax: [tax * 100]%"

/mob/var/pay_timer = 0

/mob/proc/check_faction_pay()
	if(world.realtime - pay_timer > 664000)
		var/obj/faction/faction = get_faction(Village)
		if(!faction) return
		pay_timer = world.realtime
		faction.funds += 2000 * faction.tax
		faction.update_status()
		give_ryo(2000 * (1 - faction.tax))
		src << output("Bank statement:", "outputall.output")
		src << output("________________", "outputall.output")
		src << output("Base pay: �2000", "outputall.output")
		src << output("Income tax: �[2000 * faction.tax]", "outputall.output")
		src << output("Net pay: �[2000 * (1 - faction.tax)]", "outputall.output")
		src << output("________________","outputall.output")
		src << output("Balance: �[get_ryo()]", "outputall.output")

/mob/proc/get_faction(faction_name)
	for(var/obj/faction/faction in archive)
		if(faction.name == faction_name)
			return faction
	return 0

/mob/proc/give_ryo(amount)
	var/obj/items/Ryo/R = locate() in src
	if(!R)
		R = new(src)
		R.amount = amount
	else R.amount += amount

/mob/proc/get_ryo()
	var/obj/items/Ryo/R = locate() in src
	if(!R) return 0
	return R.amount

/mob/Admin4/verb/Create_Faction(faction_name as text)
	set category = "Admin"
	if(get_faction(faction_name))
		src << output("A faction already exists with this name, delete it first", "outputall.output")
		return
	var/obj/faction/faction = new(archive)
	faction.name = faction_name
	faction.update_status()
	src << output("Successfully created faction: [faction_name]!<br>Starting funds [faction.funds], tax [faction.tax]", "outputall.output")
	archive.save_archive()
