/mob/Admin5/verb/ResetRyo()
	set category = "Admin"
	switch(alert(usr,"Are you sure you want to erase all ryo?",,"Yes","No"))
		if("Yes")
			for(var/mob/M)
				for(var/obj/items/Ryo/R in M)
					del(R)
			usr << "You have erased all ryo in existance."
		if("No")
			return


/mob/Admin5/verb/ViewGlobalRyo()
	set category = "Admin"

	var/KonoTotal = 0
	var/KumoTotal= 0
	var/SunaTotal = 0
	var/KiriTotal = 0
	var/RogueTotal = 0
	var/GlobalTotal = 0

	var/html = "<title>Global Economy</title><style>td,body {padding: 3px; font-size:13px;}</style><body bgcolor=black><table border=1 bordercolor=#1b2229 style=border-collapse:collapse;font-family:calibri;width:100%;><tr><td style=width:33%><font color=#e1c242>Name</td><td style=width:30%><font color=#e1c242>Ryo</td><td style=36%><font color=#e1c242>Village</td></tr>"
	for(var/mob/M)
		for(var/obj/items/Ryo/R in M)
			html+="<tr><td><font color=white>[M.name]</td><td><font color=white>[R.amount]</td><td><font color=white>[M.Village]</td></tr>"

			if(M.Village=="Konohagakure")
				KonoTotal+=R.amount
			if(M.Village=="Kumogakure")
				KumoTotal+=R.amount
			if(M.Village=="Sunagakure" || M.Village=="Iwagakure")
				SunaTotal+=R.amount
			if(M.Village=="Amegakure")
				KiriTotal+=R.amount
			if(M.Village=="None")
				RogueTotal+=R.amount

			GlobalTotal+=R.amount

	html += "</table><br><br><font color=#e1c242>Konohagakure: <font color=white>[KonoTotal]<br><font color=#e1c242>Sunagakure: <font color=white>[SunaTotal]<br><font color=#e1c242>Kirigakure: <font color=white>[KiriTotal]<br><font color=#e1c242>Kumogakure: <font color=white>[KumoTotal]<br><font color=#e1c242>Nukenin: <font color=white>[RogueTotal]<br><br><font color=#e1c242>Global: <font color=white>[GlobalTotal]<br></table>"

	usr << browse(html,"window='Econonmy';size=700x700")