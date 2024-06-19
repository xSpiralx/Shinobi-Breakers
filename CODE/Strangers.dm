//character id = md5 of ckey, original name, masked and type
// md5ing the type prevents clones or other npcs overlapping

mob/var/list/strangerNames = list()
mob/var/strangerName = "Stranger"
mob/var/masked = 0
mob/var/oStrangerName

atom/Topic(href,href_list[])
	switch(href_list["action"])
		if("name")
			var/topicName = href_list["character"]
			if(!topicName) return
			var/mob/character = null
			for(var/mob/M)
				if((md5(M.ckey ? M.ckey : "NPC")+md5(M.Oname ? M.Oname : M.name)+md5(M.type)+md5(M.masked)) == topicName)
					character = M
			if(!character) return
			var/inputName = input(usr,"What would you identify them as?","Identify", usr.strangerNames[topicName] ? usr.strangerNames[topicName] : character.strangerName)
			if(!inputName) return
			usr.strangerNames[topicName] = inputName
			usr.set_contact(character)
	.=..()


mob/proc/listOfKnownStrangers()
	var/list/strangers = list()
	for(var/a in strangerNames)
		for(var/mob/M in world)
			var/knownKey = a
			var/theirKey = md5(M.ckey ? M.ckey : "NPC")+md5(M.Oname ? M.Oname : M.name)+md5(M.type)+md5(M.masked)
			if(knownKey == theirKey) strangers+=M
	return strangers

mob/proc/getStrangerName(mob/M)
	if(src == M) return src.name
	var/verificationKey = md5(M.ckey ? M.ckey : "NPC")+md5(M.Oname ? M.Oname : M.name)+md5(M.type)+md5(M.masked)
	if(strangerNames[verificationKey])
		return "<a href=?src=\ref[src];action=name;character=[verificationKey] style = \"text-decoration: none; color: [M.SayFont];\">[strangerNames[verificationKey]]</a>"
	else
		if(!M.masked) return "<a href=?src=\ref[src];action=name;character=[verificationKey] style = \"text-decoration: none; color: [M.SayFont];\">[M.strangerName]</a>"
		else return "<a href=?src=\ref[src];action=name;character=[verificationKey] style = \"text-decoration: none; color: [M.SayFont];\">[M.masked]</a>"

mob/proc/getStrangerNameNoHTML(mob/M)
	if(src == M) return src.name
	var/verificationKey = md5(M.ckey ? M.ckey : "NPC")+md5(M.Oname ? M.Oname : M.name)+md5(M.type)+md5(M.masked)

	if(strangerNames[verificationKey])
		return "[strangerNames[verificationKey]]"
	else
		if(!M.masked) return "[M.strangerName]"
		else return "[M.masked]"




//Contact system adding onto stranger system here.


//19/1/17 avainer
////  use md5 verification to allow names!
////
/*
Stranger names - > strangerNames[character_name] -> retrieve using getNameNoHtml as current stranger name
want to add in the new stranger name instead, and to update the variables
call set_contact(ref, oldName (if any))
*/ //usr.strangerNames[topicName] = inputName
////
mob/
	var/
		list/obj/contact/contacts = list()
		list/verifications = list()
	proc/set_contact(mob/M)


		var/verification = md5(M.ckey ? M.ckey : "NPC")+md5(M.Oname ? M.Oname : M.name)+md5(M.type)+md5(M.masked)
		if(!contacts[verification])
			//create new
			src.verifications += verification
			var/obj/contact/A = new()
			A.name = strangerNames[verification]
			A.icon = M.icon
			A.overlays=M.overlays
			A.profile = M.profile
			A.SayFont = M.SayFont
			A.Age = M.Age
			A.bloodtype = M.bloodtype
			A.Height = M.Height
			A.Weight = M.Weight
			A.OInjuries = usr.Injuries
			A.Injuries = M.Injuries
			A.overlays-='afk.dmi'
			A.overlays -= 'Bubble.dmi'
			A.overlays -= 'Bubble2.dmi'
			A.overlays -= 'Rocks.dmi'
			A.overlays -= 'Gate_2.dmi'
			A.overlays -= 'Gate_1.dmi'
			A.Verification = verification
			contacts[verification] = A
		else //update current, fully update too!!!. Maintain a reference for future needs oVo
			var/obj/contact/A = contacts[verification]
			A.name = strangerNames[verification]
			A.icon = M.icon
			A.overlays=M.overlays
			A.profile = M.profile
			A.SayFont = M.SayFont
			A.Age = M.Age
			A.bloodtype = M.bloodtype
			A.Height = M.Height
			A.Weight = M.Weight
			A.OInjuries = usr.Injuries
			A.Injuries = M.Injuries
			A.overlays-='afk.dmi'
			A.overlays -= 'Bubble.dmi'
			A.overlays -= 'Bubble2.dmi'
			A.overlays -= 'Rocks.dmi'
			A.overlays -= 'Gate_2.dmi'
			A.overlays -= 'Gate_1.dmi'
			A.Verification = verification



obj/contact
	var/relation="Neutral"
	var
		Verification
		profile
		SayFont
		Age
		bloodtype
		Height
		Weight
		OInjuries
		Injuries
	suffix="Neutral"

	Click()
		..()
		switch(input("What would you like to do?") in list("Delete","Set Relation","Cancel"))
			if("Delete")
				usr.verifications -= Verification
				usr.contacts.Remove(Verification)
				del(src)

			if("Set Relation")
				relation=input(usr,"Choose your relation",relation) as message
				suffix="[relation]"


mob/var/ContactsOn
obj/ContactsShow
	name="Contacts (Click)"
	Click()
		usr.ContactsOn=!usr.ContactsOn