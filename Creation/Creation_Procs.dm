//Keep "System Level" Procs up here
proc/filter_characters(var/string, var/allowed = allowed_characters_name)
	set background = 1
	if(!string || !allowed) return 0
	var/stringlen = length(string)
	var/newstring = ""
	for(var/i = 1 to stringlen)
		var/char = copytext(string, i, i+1)
		if(findtext(allowed, char)) newstring += char
		sleep(-1)
	return newstring

proc/uppercase(var/string, var/pos=1)
	if(!string || !pos) return
	return uppertext(copytext(string, pos, pos+1))+copytext(string, pos+1)



//MOB Procs go under here. Try and keep them in order.
mob/proc
    //New character calls Creation(). Village then called all the other processes. Why? Having one proc nested that then calls 30 others? Dumb. Call each one as it's nmeeded.
	Creation()
		src.Village()
		//Clan() will roll into Clanwtf() for non-clan, see Creation_ClanProc.dm
		src.Clan()
		src.Name()
        //Element() was nested in Name, and called after Clans were selected. Pulled out and placed here.
		src.Element()
		src.Age()
		src.StrangerName()
		//src.creation_tasks()
		src.Finalizee()
    //Pick village from ActiveVillages
	Village()
		for(var/obj/grid_object/g in src)
			del(g)
		alert_answer = null
		var/village = usr.custom_alert3(ActiveVillages, "Which village do you belong to?")
		src.Village = village
		src.CVillage = village
    //Alow them to create a custom clan.
	Clan()
		if(custom_alert2("Would you like to create your own clan?", "Custom clan selection")=="yes")
			while(src.Clan=="None" && src.client)
				sleep(1)
				src.Clan = custom_alert4("What will your family name be?")
				if(!src.client) return
				var/leng = length(src.Clan)
				if((leng>20) || (leng<3))
					custom_alert("The name must be between 3 and 20 characters.")
					src.Clan = "None"
					continue
				if(uppertext(src.Clan) == src.Clan)
					custom_alert("Your name may not consist entirely of capital letters.")
					src.Clan = "None"
					continue
				if(filter_characters(Clan)!=src.Clan)
					custom_alert("\"[src.Clan]\" contains an invalid character.  Allowed characters are:\n[allowed_characters_name]")
					Clan = "None"
					continue
				if(Clan==""||findtext(Clan,"\n"))
					custom_alert("You name contains an invalid character.")
					Clan="None"
					continue
				if(Clan=="Uchiha"||Clan=="Senju"||Clan=="Yamanaka"||Clan=="Akimichi"||Clan=="Hozuki"||Clan=="Memori"||Clan=="Kaguya"||Clan=="Karasu"||Clan=="Aburame"||Clan=="Inuzuka"||Clan=="Nara"||Clan=="Nimbus"||Clan=="Uzumaki" || Clan=="Yotsuki" || Clan=="Yuki"|| Clan=="Hyuuga"|| Clan=="Hyuga" || Clan=="Hoshigaki")
					custom_alert("You clan cannot be a pre-existing clan.")
					Clan="None"
					continue
			if(!src.client) return
			src.Clan = uppercase(src.Clan, 1)
		else
			Clan="None"

	Name()
		src.name=null
	//	name=html_encode(copytext(tempname,1,20))
	//	var/spaces=findtext(name," "))
		while(!src.name && src.client)
			sleep(1)
			src.name = custom_alert4("What will your name be?")
			if(!src.client) return
			var/leng = length(src.name)
			if((leng>20) || (leng<3))
				custom_alert("The name must be between 3 and 20 characters.")
				src.name = null
				continue
			if(uppertext(src.name) == src.name)
				custom_alert("Your name may not consist entirely of capital letters.")
				src.name = null
				continue
			if(filter_characters(name)!=src.name)
				custom_alert("\"[src.name]\" contains an invalid character.  Allowed characters are:\n[allowed_characters_name]")
				name = null
				continue
			if(name==""||findtext(name,"\n"))
				custom_alert("You name contains an invalid character.")
				name=null
				continue
		if(!src.client) return
		src.name = uppercase(src.name, 1)
		//If they picked nonclan, allow them to roll a clan.
		if(src.Clan=="None")
			ClanWtf()

		else
			src.name="[Clan], [name]"
		if(src.Village in list("Kaguya","Nara","Aburame","Inuzuka","Hozuki","Akimichi","Hyuuga","Yuki"))
			src.name = "[src.Village], [name]"
	Element()
		var/random=rand(1,5)
		if(random==1)
			src.PrimaryElement="Fire"
		if(random==2)
			src.PrimaryElement="Wind"
		if(random==3)
			src.PrimaryElement="Lightning"
		if(random==4)
			src.PrimaryElement="Earth"
		if(random==5)
			src.PrimaryElement="Water"
		if(Hoshigaki||Hozuki)
			src.PrimaryElement="Water"
		if(prob(28))
			random=rand(1,5)
			if(random==1)
				src.SecondaryElement="Fire"
			if(random==2)
				src.SecondaryElement="Wind"
			if(random==3)
				src.SecondaryElement="Lightning"
			if(random==4)
				src.SecondaryElement="Earth"
			if(random==5)
				src.SecondaryElement="Water"
		if(src.PrimaryElement==src.SecondaryElement)
			src.SecondaryElement=""
		if(src.Uchiha)
			src.Clan="Uchiha"
			if(prob(90))
				src.PrimaryElement="Fire"
		if(src.Hyuuga)
			src.overlays += 'Hyuuga.dmi'
			src.Clan="Hyuuga"
		if(src.Kaguya)
			src.overlays += 'Kaguya.dmi'
			src.Clan="Kaguya"
		if(src.Inuzuka)
			src.Inuzuka=1//Add whatever you want for this clan to have or wutnot <- Thats there for a placement
			src.Clan="Inuzuka"
			new/obj/items/InuzukaEyeMarkings(src)
		if(src.Aburame)
			src.Aburame=1 //^^^ Same
			src.Clan="Aburame"
		if(src.Senju)
			src.Senju=1 //^^^ Same
			src.Clan="Senju"
			if(prob(30))
				src.PrimaryElement="Water"
			if(prob(20))
				src.PrimaryElement="Earth"
			if(prob(10))
				src.PrimaryElement="Water"
				src.SecondaryElement="Earth"
		if(src.Akimichi)
			src.Akimichi=1 //^^^^ Same as above
			src.Clan="Akimichi"
		if(src.Aburame)
			src.Aburame=1 //^^^ Same
			src.Clan="Aburame"
		if(src.Nara)
			Nara=1/////////^^Same
			src.Clan="Nara"
		if(src.Hozuki)
			Hozuki=1/////////////^^^^^^^^^^
			src.Clan="Hozuki"
			if(prob(95))
				src.PrimaryElement="Water"
		if(src.Memori)
			Memori=1/////////////^^^^^^^^^^
			src.Clan="Memori"
			src.PrimaryElement="Fire"
		if(src.Karasu)
			Karasu=1/////////////^^^^^^^^^^
			src.Clan="Karasu"
			if(prob(85))
				src.PrimaryElement="Wind"
		if(src.Yuki)
			Yuki=1/////////////^^^^^^^^^^
			src.Clan="Yuki"
			if(prob(70))
				src.PrimaryElement="Water"
			if(prob(35))
				src.PrimaryElement="Wind"
			if(prob(30))
				src.PrimaryElement="Water"
				src.SecondaryElement="Wind"
	Age()
		var/AgeToBe
		while(!AgeToBe)
			alert("Please enter your Age from 10-61")
			AgeToBe = text2num(custom_alert4("Please enter your Age from 10-61"))
			if(AgeToBe < 9 || AgeToBe > 61)
				AgeToBe = null
		Age=(AgeToBe)
		Oage = Age
		birth = list("day" = Day, "month" =  Month, "year" = ((Year+100)-src.Age))
		//spawn(1) AgeLoop()
		src << "<font color=#3CB371>You were born at: [birth["month"]]/[birth["day"]]/[birth["year"]]."
	StrangerName()
		alert(src,"Short descriptions are how you are publically seen to others, before you introduce yourself.","Info")
		src.strangerName = "Stranger"
		while(src.strangerName == "Stranger" && client)
			sleep(1)
			src.strangerName = usr.custom_alert4("Stranger description?")
			if(!client) return
			var/leng = length(src.strangerName)
			if((leng>30) || (leng<3))
				custom_alert("The name must be between 3 and 30 characters.")
				src.strangerName = "Stranger"
				continue
			if(uppertext(src.strangerName) == src.strangerName)
				custom_alert("The name may not consist entirely of capital letters.")
				src.strangerName = "Stranger"
				continue
			if(src.strangerName==""||findtext(src.strangerName,"\n"))
				custom_alert("The name contains an invalid character.")
				src.strangerName="Stranger"
				continue
			if(!findtext(src.strangerName,"The"))
				custom_alert("The must begin with 'The' eg; 'The Red-Haired Woman'")
				src.strangerName="Stranger"
				continue
		if(!client) return
		src.strangerName = uppercase(lowertext(src.strangerName), 1)

	Blood()
		var/random=rand(1,6)
		if(random==1)
			src.bloodtype="O-"
		if(random==2)
			src.bloodtype="O+"
		if(random==3)
			src.bloodtype="A+"
		if(random==4)
			src.bloodtype="B+"
		if(random==5)
			src.bloodtype="A-"
		if(random==6)
			src.bloodtype="B-"
	traits()
		src.Trait = "Unknown" //pick("Katon", "Suiton", "Raiton", "Doton", "Fuuton", "Medical", "Fuuinjutsu", "Hardworker","Genius","Genjutsu","Taijutsu")