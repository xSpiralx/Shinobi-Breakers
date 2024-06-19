/ban/var/key
/ban/var/ip
/ban/var/cid
/ban/var/reason
/ban/var/time

/var/list/ban/banlist = list()

/proc/get_minutes()
	return (world.realtime / 10) / 60

/proc/ban_expired(ban/BAN)
	if(BAN.time < get_minutes())
		return 1
	return 0

/proc/get_ban(key, ip = null, cid = null)
	for(var/ban/B in banlist)
		if(key && B.key == key)
			return B
		if(ip && B.ip == ip)
			return B
		if(cid && B.cid == cid)
			return B
	return 0

/proc/is_banned(key = null, ip = null, cid = null)
	for(var/ban/B in banlist)
		if(key && B.key == key)
			return 1
		if(ip && B.ip == ip)
			return 1
		if(cid && B.cid == cid)
			return 1
	return 0

/proc/add_ban(key, ip, cid, reason, time)
	if(!is_banned(key))
		var/ban/BAN = new
		BAN.key = key
		BAN.ip = ip
		BAN.cid = cid
		BAN.reason = reason
		BAN.time = get_minutes() + time

		banlist += BAN

		save_bans()

		for(var/mob/M)
			if(M.client)
				if(is_banned(M.client.key, M.client.address, M.client.computer_id))
					M << "<font color=red>You have been banned.</font>"
					M << "<font color=red>[reason]</font>"
					M << "<font color=red>Banned till [time2text(BAN.time*600)]. ([time] minutes).</font>"
					M.Save()
					del(M)

/proc/remove_ban(key)
	if(is_banned(key))
		for(var/ban/BAN in banlist)
			if(BAN.key == key)
				del(BAN)
				return 1
	return 0

/proc/save_bans()
	var/savefile/F = new("SSO/Banlist")
	F["Bans"] << banlist

/proc/load_bans()
	if(fexists("SSO/Banlist"))
		var/savefile/F = new("SSO/Banlist")
		F["Bans"] >> banlist

/mob/Admin1/verb/Sticky_Ban(mob/M as mob in world)
	set category = "Admin"
	return
	if(M.client)
		var/reason = input(usr, "Input a reason.", , "Breaking the rules.") as text
		var/time = input(usr, "Specify a ban time (in minutes).", , 1440) as num
		message_admins("BAN: [M.client.key] was banned for [reason] Till [time2text((get_minutes() + time)*600)] ([time] minutes).")
		add_ban(M.client.key, M.client.address, M.client.computer_id, reason, time)
	else
		usr << "This mob has no client."

/mob/Admin1/verb/Sticky_Ban_Remove(key as text)
	set category = "Admin"
	if(remove_ban(key))
		message_admins("BAN REMOVED: [key] by ([usr.key])")
		return
	usr << "Ban for [key] does not exist."

/mob/Admin1/verb/Sticky_Ban_Manual(key as text)
	set category = "Admin"
	return
	if(key)
		var/reason = input(usr, "Input a reason.", , "Breaking the rules.") as text
		var/time = input(usr, "Specify a ban time.", , 1440) as num
		message_admins("BAN: [key] was banned for [reason] Till [time2text((get_minutes() + time)*600)] ([time] minutes).")
		add_ban(key, , , reason, time)
	else
		usr << "No key specified."

/mob/Admin1/verb/Sticky_Ban_View()
	set category = "Admin"
	for(var/ban/BAN in banlist)
		src << "[BAN.key] | [BAN.ip ? BAN.ip : "No IP"] | [BAN.cid ? BAN.cid : "No CID"]"
		src << "[BAN.reason]"
		src << "Banned till [time2text(BAN.time*600)]."
		src << ""