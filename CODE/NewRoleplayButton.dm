


mob/var/list/rpFlags = list()
mob/var/list/past_emotes = list()

obj/RPing
	icon='Bubble.dmi'
	layer=9999999999999



obj/RPFlag
	icon='flag.dmi'
	var/owner="Nobody"
	var/owner2
	var/Description="No description written."
	var/interactable = 0
	var/adminHiddenInfo
	Click()

		usr.custom_alert_html("<center><u>[name]</u><br><br>[Description][interactable=="Yes" ? "<br><br>If you are roleplaying towards this flag, alert the admins by clicking <a href=?src=\ref[src];action=rpflagalert>here</a>." : ""][usr.Admin&&adminHiddenInfo ? "<br><br>Hidden Admin Info: [adminHiddenInfo]" : ""]")
obj/CombatFlag
	icon='combatflag.dmi'
	var/owner="Nobody"
	var/owner2
	var/Description="No description written."
	Click()
		usr.custom_alert_html("<center><u>Combat Scenario</u><br><br>[Description]")
mob/verb
	Initiate_Combat()
		set hidden = 1
		set category="Combat"
		for(var/obj/CombatFlag/RP in world)
			if(RP.owner==src.ckey)
				src<<output("<font size = -3>Your other combat flag has been deleted.","outputic.output")
				src<<output("<font size = -3>Your other combat flag has been deleted.","outputall.output")
				del(RP)
				return
		var/obj/CombatFlag/R=new(src.loc)
		R.owner2=src.name
		R.owner=src.ckey
		var/maxStack=input("Enter the maximum number of actions allowed in one roleplay.","Stacking Rules",3,1)
		var/concise=alert("Freeform roleplay, or short concise roleplay length limit?","Length Limit","Freeform","Concise")
		var/ruling=input("When faced with a problem, this situation's rulings are done based on?","Rulings") in list ("Dice","Debate","Admin")
		var/powerPlay=input("A character's power is based off of what combination of elements?","Powerplay") in list ("Perks","Rank","Rank+Perks")
		var/fightScenario=input("Decided realism level for this fight is? (Hardcore being no-bullshit, extremely lethal level)","Realism") in list ("For-fun","Realistic","Hardcore")
		var/killing=alert("Is murder/killing allowed in this fight?","Death","Yes","No")
		var/misc=input("Any other details you wish to include?") as message
		R.Description={"
There is a combat instance taking place here. This situation's rules include:<br><br>
Maximum number of actions allowed in one roleplay: [maxStack]<br>
Roleplaying length limit: [concise]<br>
Rulings based on: [ruling]<br>
Power influenced by: [powerPlay]<br>
Realism level: [fightScenario]<br>
Killing/Murder: [killing]<br>
[misc ? "Other information [misc]" : ""]
"}
	Roleplay_Flag()
		var/mob/ControlledMob=src
		if(MindTransfer)
			ControlledMob=MindTransfer
		if(alert(src,"Create or delete?","Create or Delete","Create","Delete")=="Create")
			var/i
			for(var/obj/o in src.rpFlags) i++
			if(i>=5)
				src<<"You have five roleplay flags created. Consider deleting one before creating anymore."
				return
			var/obj/RPFlag/R=new(ControlledMob.loc)
			R.Description=input("Write a description for this flag.") as message
			R.interactable = input("Is this flag interactable?") in list ("Yes","No")
			R.adminHiddenInfo = input("Is there any hidden information that should be restricted to admins only?") as message
			R.name = input("Give this flag a name.") as text
			if(length(R.name)>30) R.name = "Roleplay Flag"
			if(!R.name) R.name = "Roleplay Flag"
			global.rpFlags+=R
			src.rpFlags+=R
		else
			var/obj/O = input("Choose a flag to delete") in src.rpFlags
			if(O) del(O)
	CancelRoleplay()
		set hidden = 1
		var/mob/ControlledMob=src
		if(MindTransfer)
			ControlledMob=MindTransfer
		winset(src,"skinputbig","is-visible=false")
		winset(src,"skinputbig.skinputbar","text=\"\"")
		ControlledMob.overlays -= 'Bubble.dmi'
		src.overlays-='Bubble.dmi'
	Roleplay()
		set hidden = 1
		var/mob/ControlledMob=src
		if(MindAfflicted)
			src<<output("<font size = -3>You can't seem to control your own body!","outputic.output")
			src<<output("<font size = -3>You can't seem to control your own body!","outputall.output")
			return
		if(MindTransfer)
			ControlledMob=MindTransfer
		ControlledMob.overlays += 'Bubble.dmi'
		//skinputbig(prompt,title,initial,Number)
		//var/msg = skinputbig("Type your message!","Type nothing to cancel.")// as null|message
	//	if(msg=="1")
	//		msg=winget(src,"skinputbig.skinputbar","text")
	//		winset(src,"skinputbig.skinputbar","text=\"\"")
	//	if(isnum(msg)&&msg==1)
	//		msg=winget(src,"skinputbig.skinputbar","text")
		//	winset(src,"skinputbig.skinputbar","text=\"\"")
		var/msg=input(usr,"Type your message.","Message") as message
		if(!msg)
//			winset(src,"skinputbig","is-visible=false")
			ControlledMob.overlays -= 'Bubble.dmi'
			return
	//	if(RecentVerbCheck("Roleplay", 1,1))
	//		ControlledMob.overlays -= 'Bubble.dmi'
	//		return

	//	recentverbs["Roleplay"]=world.realtime
		if(msg)
			if(length(msg) > (5))
				progress_activity = 4
				for(var/mob/M in hearers(20, src))
					if(M.progress_target && M.progress_target.learning_from == ckey)
						M.teacher_activity = 24
					else if(progress_target && M.progress_target)
						if(progress_target.name == M.progress_target.name)
							M.teacher_activity = 24
			ControlledMob.overlays+='TalkOverlay.dmi'
			spawn(15) ControlledMob.overlays-='TalkOverlay.dmi'
			if(!findtext(msg,"//",1,3))
				msg = markdown_format_text(msg)

				for(var/mob/M in hearers(20,ControlledMob))
					if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) continue
					if(M.MindAfflicted)
						M.MindAfflicted << output("<font size=-3><font color = white><font color=[ControlledMob.SayFont]>[M.MindAfflicted.getStrangerName(ControlledMob)] [msg]<font color = white>","outputic.output")
						M.MindAfflicted << output("<font size=-3><font color = white><font color=[ControlledMob.SayFont]>[M.MindAfflicted.getStrangerName(ControlledMob)] [msg]<font color = white>","outputall.output")
						M.MindAfflicted.ChatLog("<font size=-3><font color = white><font color=[ControlledMob.SayFont]>[ControlledMob.name] ([ControlledMob.strangerName]-[ControlledMob.key]) [msg]</font></font></font>")
						M.MindAfflicted.SelfLog("<font size=-3><font color = white><font color=[ControlledMob.SayFont]>[M.MindAfflicted.getStrangerName(ControlledMob)] [msg]</font></font></font>")
					else
						M << output("<font size=-3><font color = white><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] [msg]<font color = white>","outputic.output")
						M << output("<font size=-3><font color = white><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] [msg]<font color = white>","outputall.output")
						M.ChatLog("<font size=-3><font color = white><font color=[ControlledMob.SayFont]>[ControlledMob.name] ([ControlledMob.strangerName]-[ControlledMob.key]) [msg]</font></font></font>")
						M.SelfLog("<font size=-3><font color = white><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] [msg]</font></font></font>")
				for(var/obj/Technology/Camera/C in view(13,ControlledMob)) C.appendToLog("<font size=-3><font color = white><font color=[ControlledMob.SayFont]>[ControlledMob.strangerName] ([ControlledMob.strangerName]) [msg]<font color = white>")
				ControlledMob.overlays -= 'Bubble.dmi'
				for(var/mob/M in world)
					if(M.Admin >= 4)
						M << output("<a href=?src=\ref[M];action=Options;mob=[ControlledMob.ckey]>Options</a>-<font color = white>(*<font color=[ControlledMob.SayFont]>([ControlledMob.strangerName]) [ControlledMob] [markdown_format_text(html_encode(msg))]<font color = white>*)","rpspy.output")

			else
				msg=copytext(msg,4,0)
				msg = markdown_format_text(msg)

				for(var/mob/M in hearers(20,ControlledMob))
					if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) continue
					if(M.MindAfflicted)
						M.MindAfflicted << output("<font size=-3><font color = white><font color=[ControlledMob.SayFont]>[msg]<br>([M.MindAfflicted.getStrangerName(ControlledMob)])<font color = white>","outputic.output")
						M.MindAfflicted << output("<font size=-3><font size=-3><font color = white><font color=[ControlledMob.SayFont]>[msg]<br>([M.MindAfflicted.getStrangerName(ControlledMob)])<font color = white>","outputall.output")
						M.MindAfflicted.ChatLog("<font size=-3><font color = white><font color=[ControlledMob.SayFont]>[ControlledMob.name] ([ControlledMob.strangerName]-[ControlledMob.key]) [msg]</font></font></font>")
						M.MindAfflicted.SelfLog("<font size=-3><font color = white><font color=[ControlledMob.SayFont]>[msg]<br>([M.MindAfflicted.getStrangerName(ControlledMob)])</font></font></font>")
					else
						M << output("<font size=-3><font color = white><font color=[ControlledMob.SayFont]>[msg]<br>([M.getStrangerName(ControlledMob)])<font color = white>","outputic.output")
						M << output("<font size=-3><font color = white><font color=[ControlledMob.SayFont]>[msg]<br>([M.getStrangerName(ControlledMob)])<font color = white>","outputall.output")
						M.ChatLog("<font size=-3><font color = white><font color=[ControlledMob.SayFont]>[ControlledMob.name] ([ControlledMob.strangerName]-[ControlledMob.key]) [msg]</font></font></font>")
						M.SelfLog("<font size=-3><font color = white><font color=[ControlledMob.SayFont]>[msg]<br>([M.getStrangerName(ControlledMob)])</font></font></font>")
				for(var/obj/Technology/Camera/C in view(13,ControlledMob)) C.appendToLog("<font size=-3><font color = white><font color=[ControlledMob.SayFont]>[ControlledMob.strangerName] [msg]<font color = white>")
				ControlledMob.overlays -= 'Bubble.dmi'
				for(var/mob/M in world)
					if(M.Admin >= 4)
						M << output("<a href=?src=\ref[M];action=Options;mob=[ControlledMob.ckey]>Options</a>-<font color = white>(*<font color=[ControlledMob.SayFont]>[markdown_format_text(html_encode(msg))]<br>([ControlledMob.name]-[ControlledMob.strangerName])<font color = white>*)","rpspy.output")
				for(var/mob/M in hearers(20, src))
					if(M.progress_target && M.progress_target.learning_from == ckey)
						M.teacher_activity = 24
					else if(progress_target && M.progress_target)
						if(progress_target.name == M.progress_target.name)
							M.teacher_activity = 24


			/*(TEST FOR REMOVAL OF SPAMING RPS, if someone wants to spam rps alone somewhere IDC) for(var/emote in past_emotes)
				var/match = compare_strings(msg,emote)
				if(match > 20)
					progress_activity = 0

			past_emotes |= msg

			if(past_emotes.len > 4)
				past_emotes -= past_emotes[1]*/



/*/proc/compare_strings(stringA,stringB)
	var/correct = 0
	for(var/i in 1 to length(stringA))
		var/charA = copytext(stringA, i, i+1)
		var/charB = copytext(stringB, i, i+1)

		if(charA == charB)
			correct++

	return ((correct / length(stringA)) * 100)*/





//mob/verb
//	Remove()
//		set name = "Fix RP Bubble"
//		src.overlays -= /obj/RPing
//		src.overlays -= /obj/RPing
//Ths should do...s


//REMAEMABABRAR to add the new RP BUBBLE


/*mob/verb
	Change_Face_Icon(F as file)
		set hidden=1
		switch(alert(usr,"[usr].  Do you want this face icon?","Face Icon","Yes","No"))
			if("Yes")
				usr.faceicon = F
				usr.Ofaceicon = F
			if("No")
				alert(usr,"You have not changed your face icon!")*/