var/UchihaRate=1
var/SenjuRate=1
var/KaguyaRate=1
var/YukiRate=1
var/HozukiRate=1
var/InuzukaRate=1
var/AburameRate=1
var/AkimichiRate=1
var/NaraRate=1
var/HyuugaRate=1
var/NonClanRate=1
mob/var/IndividualRate=1
proc/Save_Rates()
	var/savefile/F=new("archive_savefiles/PayRates")
	F["1"]<<UchihaRate
	F["2"]<<SenjuRate
	F["3"]<<KaguyaRate
	F["4"]<<YukiRate
	F["5"]<<HozukiRate
	F["6"]<<InuzukaRate
	F["7"]<<AburameRate
	F["8"]<<AkimichiRate
	F["9"]<<NaraRate
	F["10"]<<HyuugaRate
	F["11"]<<NonClanRate
proc/Load_Rates() if(fexists("archive_savefiles/PayRates"))
	world.log << "ARCHIVE: Loaded PayRates."
	var/savefile/F=new("archive_savefiles/PayRates")
	F["1"]>>UchihaRate
	F["2"]>>SenjuRate
	F["3"]>>KaguyaRate
	F["4"]>>YukiRate
	F["5"]>>HozukiRate
	F["6"]>>InuzukaRate
	F["7"]>>AburameRate
	F["8"]>>AkimichiRate
	F["9"]>>NaraRate
	F["10"]>>HyuugaRate
	F["11"]>>NonClanRate
mob/Admin3
	verb
		Adjust_Pay_Rate()
			set category = "Admin"
			switch(input("Who do you want to adjust?") in list ("Uchiha","Senju","Kaguya","Hozuki","Yuki","Inuzuka","Aburame","Akimichi","Nara","Hyuuga","Non-Clan","Cancel"))
				if("Uchiha")
					var/tmprate=input("What do you want to change the rate to? The current rate is [UchihaRate].") as num
					for(var/mob/M in world)
						if(M.Admin)
							M << "[usr.ckey] set the Uchiha modifier to [tmprate] from [UchihaRate]"
					UchihaRate = tmprate
				if("Senju")
					var/tmprate=input("What do you want to change the rate to? The current rate is [SenjuRate].") as num
					for(var/mob/M in world)
						if(M.Admin)
							M << "[usr.ckey] set the Senju modifier to [tmprate] from [SenjuRate]"
					SenjuRate = tmprate
				if("Kaguya")
					var/tmprate=input("What do you want to change the rate to? The current rate is [KaguyaRate].") as num
					for(var/mob/M in world)
						if(M.Admin)
							M << "[usr.ckey] set the Kaguya modifier to [tmprate] from [KaguyaRate]"
					KaguyaRate = tmprate
				if("Hozuki")
					var/tmprate=input("What do you want to change the rate to? The current rate is [HozukiRate].") as num
					for(var/mob/M in world)
						if(M.Admin)
							M << "[usr.ckey] set the Hozuki modifier to [tmprate] from [HozukiRate]"
					HozukiRate = tmprate
				if("Yuki")
					var/tmprate=input("What do you want to change the rate to? The current rate is [YukiRate].") as num
					for(var/mob/M in world)
						if(M.Admin)
							M << "[usr.ckey] set the Yuki modifier to [tmprate] from [YukiRate]"
					YukiRate = tmprate
				if("Inuzuka")
					var/tmprate=input("What do you want to change the rate to? The current rate is [InuzukaRate].") as num
					for(var/mob/M in world)
						if(M.Admin)
							M << "[usr.ckey] set the Inuzuka modifier to [tmprate] from [InuzukaRate]"
					InuzukaRate = tmprate
				if("Aburame")
					var/tmprate=input("What do you want to change the rate to? The current rate is [AburameRate].") as num
					for(var/mob/M in world)
						if(M.Admin)
							M << "[usr.ckey] set the Aburame modifier to [tmprate] from [AburameRate]"
					AburameRate = tmprate
				if("Akimichi")
					var/tmprate=input("What do you want to change the rate to? The current rate is [AkimichiRate].") as num
					for(var/mob/M in world)
						if(M.Admin)
							M << "[usr.ckey] set the Akimichi modifier to [tmprate] from [AburameRate]"
					AkimichiRate = tmprate
				if("Nara")
					var/tmprate=input("What do you want to change the rate to? The current rate is [NaraRate].") as num
					for(var/mob/M in world)
						if(M.Admin)
							M << "[usr.ckey] set the Nara modifier to [tmprate] from [NaraRate]"
					NaraRate = tmprate
				if("Hyuuga")
					var/tmprate=input("What do you want to change the rate to? The current rate is [HyuugaRate].") as num
					for(var/mob/M in world)
						if(M.Admin)
							M << "[usr.ckey] set the Hyuuga modifier to [tmprate] from [HyuugaRate]"
					HyuugaRate = tmprate
				if("Non-Clan")
					var/tmprate=input("What do you want to change the rate to? The current rate is [NonClanRate].") as num
					for(var/mob/M in world)
						if(M.Admin)
							M << "[usr.ckey] set the Non-Clan modifier to [tmprate] from [NonClanRate]"
					NonClanRate = tmprate
			Save_Rates()

mob/proc/Payment()
	return
	var/Paytimes=Month-LogMonth
	if(!Paytimes) return
	while(Paytimes>0)
		var/PaidRyo=0
		var/BaseRyo=rand(75,200)
		Paytimes--
		if(findtext(Clan,"Uchiha"))
			PaidRyo = BaseRyo*UchihaRate*IndividualRate
		if(findtext(Clan,"Senju"))
			PaidRyo = BaseRyo*SenjuRate*IndividualRate
		if(findtext(Clan,"Kaguya"))
			PaidRyo = BaseRyo*KaguyaRate*IndividualRate
		if(findtext(Clan,"Yuki"))
			PaidRyo = BaseRyo*YukiRate*IndividualRate
		if(findtext(Clan,"Hozuki"))
			PaidRyo = BaseRyo*HozukiRate*IndividualRate
		if(findtext(Clan,"Inuzuka"))
			PaidRyo = BaseRyo*InuzukaRate*IndividualRate
		if(findtext(Clan,"Aburame"))
			PaidRyo = BaseRyo*AburameRate*IndividualRate
		if(findtext(Clan,"Akimichi"))
			PaidRyo = BaseRyo*AkimichiRate*IndividualRate
		if(findtext(Clan,"Nara"))
			PaidRyo = BaseRyo*NaraRate*IndividualRate
		if(findtext(Clan,"Hyuuga"))
			PaidRyo = BaseRyo*HyuugaRate*IndividualRate
		if(findtext(Clan,"Non"))
			PaidRyo = BaseRyo*NonClanRate*IndividualRate
		if(!PaidRyo)
			PaidRyo = BaseRyo*NonClanRate*IndividualRate
		src<<"Your check has been sent to you with a sum of $[PaidRyo] Ryo!"
		var/hasryo=0
		for(var/obj/items/Ryo/R in contents)
			hasryo=R
		if(hasryo)
			hasryo:amount+=PaidRyo
			hasryo:Update()
		else
			var/obj/items/Ryo/R=new(src)
			R.amount=PaidRyo
			R.Update()
	LogMonth=Month
mob/var/LogMonth=6

proc/YearCheck(var/msg=1)
	if(Day>=31)
		Day=1
		Month+=1
	/*for(var/mob/M in world)
		if(!M.client) continue

		var/Paytimes=Month-M.LogMonth
		if(!Paytimes) return
		while(Paytimes>0)
			var/PaidRyo=0
			var/BaseRyo=rand(75,200)
			Paytimes--
			if(findtext(M.Clan,"Uchiha"))
				PaidRyo = BaseRyo*UchihaRate*M.IndividualRate
			if(findtext(M.Clan,"Senju"))
				PaidRyo = BaseRyo*SenjuRate*M.IndividualRate
			if(findtext(M.Clan,"Kaguya"))
				PaidRyo = BaseRyo*KaguyaRate*M.IndividualRate
			if(findtext(M.Clan,"Yuki"))
				PaidRyo = BaseRyo*YukiRate*M.IndividualRate
			if(findtext(M.Clan,"Hozuki"))
				PaidRyo = BaseRyo*HozukiRate*M.IndividualRate
			if(findtext(M.Clan,"Inuzuka"))
				PaidRyo = BaseRyo*InuzukaRate*M.IndividualRate
			if(findtext(M.Clan,"Aburame"))
				PaidRyo = BaseRyo*AburameRate*M.IndividualRate
			if(findtext(M.Clan,"Akimichi"))
				PaidRyo = BaseRyo*AkimichiRate*M.IndividualRate
			if(findtext(M.Clan,"Nara"))
				PaidRyo = BaseRyo*NaraRate*M.IndividualRate
			if(findtext(M.Clan,"Hyuuga"))
				PaidRyo = BaseRyo*HyuugaRate*M.IndividualRate
			if(findtext(M.Clan,"Non"))
				PaidRyo = BaseRyo*NonClanRate*M.IndividualRate
			if(!PaidRyo) continue
			M<<"Your check has been sent to you with a sum of $[PaidRyo] Ryo!"
			var/hasryo=0
			for(var/obj/items/Ryo/R in M.contents)
				hasryo=R
			if(hasryo)
				hasryo:amount+=PaidRyo
				hasryo:Update()
			else
				var/obj/items/Ryo/R=new(src)
				R.amount=PaidRyo
				R.Update()
		M.LogMonth=Month*/
	if(Month>12)
		Month=1
		Year+=1
		for(var/mob/P in world)
			if(P.client) P.Aging()
			P.LogMonth=Month
	if(msg) world<<"<font size=-1>Current date is the [Day][Days(Day)] of [Months(Month)] in the year [Year+100]"
//	global.OOC=!global.OOC
//	world<<"<font size=-1>The OOC channel has been [global.OOC ? "enabled" : "disabled"] during this day."
	SaveYear()
