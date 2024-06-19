/********************************************/
/******** Coded by LordMachiavelli 16 May 2012 ********/
/********************************************/

/archive/var/list/IPList = list()

/mob/proc/IPlog()
	if(client)
		if(archive.IPList.Find(key))
			var/list/L = archive.IPList[key]
			if(!L) return
			if(!L.Find(client.address))
				L += client.address
		else
			archive.IPList[key] = new/list()
			var/list/L = archive.IPList[key]
			if(L) L += client.address
	//	archive.save_archive()

/mob/Admin4/verb/Check_Keys(mob/M as mob in world)
	set category = "Admin"
	if(!M.key)
		usr << "Unfortunately, this mob doesn't have a key."
		return
	if(archive.IPList.Find(M.key))
		usr << "Keys under this user:"
		var/list/IP = archive.IPList[M.key]
		for(var/user in archive.IPList)
			if(archive.IPList.Find(user))
				var/list/UserIP = archive.IPList[user]
				for(var/ip in UserIP)

					if(IP.Find(ip))
						usr << "\t [user == M.key ? "-" : ""][user]"
						break
	else
		usr << "Apparently, no IP addresses are logged under this key."