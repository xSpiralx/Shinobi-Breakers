mob/var/Grade = "E"


var/RPing=0
var/OOC=1
var/Say=1
var/FontstoInclude=list('nrkis.ttf')
mob/var
	OOCFont = "#858755"
	SayFont = "#009966"
	OSayFont = "#009966"
	OOCon=1
	Atton=1
	height = 25
	width =25
	Jump=1
	canThink = FALSE

mob/proc/File_Size(file)
	var/size=length(file)
	if(!size||!isnum(size)) return
	var/ending="Byte"
	if(size>=1024)
		size/=1024
		ending="KB"
		if(size>=1024)
			size/=1024
			ending="MB"
			if(size>=1024)
				size/=1024
				ending="GB"
	var/end=round(size)
	return "[Commas(end)] [ending]\s"

proc/Commas(A)
	var/Number=num2text(round(A,1),20)
	for(var/i=length(Number)-2,i>1,i-=3) Number="[copytext(Number,1,i)],[copytext(Number,i)]"
	return Number




mob/proc/ChatLog(var/Info)
	set background=1

	if(length(Info)>=8000)
		Info="This entry was too long to be apended to the chat log."
	if(src.client)
		var/outputFile = file("SSO/ChatLogs/[src.ckey]/[time2text(world.realtime,"DD-MM-YY")].txt")
		if(fexists(outputFile))
			outputFile << "<br>[Info]"
		else
			outputFile << "<br>[Info]"



mob/proc/SelfNewLog(var/Info)
	return

mob/proc/SelfLog(var/Info)
	set background=1

	if(length(Info)>=8000)
		Info="This entry was too long to be apended to the chat log."


	if(src.client)
		var/outputFile = file("Saga/SelfLogs/[src.ckey]/[time2text(world.realtime,"DD-MM-YY")].txt")
		if(fexists(outputFile))
			outputFile << "<br>[Info]"
		else
			outputFile << "<br>[Info]"







mob/var/tmp/Input="OOC"
mob/var/list/SpamList = new/list()
mob/var/SpamCount = 0
mob/verb
	Leave_Village()
		switch(input("Are you sure you want to leave your village?") in list ("Pussy Out","Yes"))
			if("Yes")
				src.Village="Rogue"
	View_Self_Logs()

		var/View={"{"<html>
<head><title></head></title><body>
<body bgcolor="#000000"><font size=8><font color="#0099FF"><font size=-1><b><i>
<font color="#00FFFF">Your logged activities<br>
</body><html>"}



		var/Choicee = input("View which one?") in flist("Saga/SelfLogs/[src.ckey]/")
		var/Choice = file("Saga/SelfLogs/[src.ckey]/[Choicee]")
		var/ISF=file2text(Choice)
		View+=ISF
		usr<<"[File_Size(Choice)] File [Choice]"
		usr<<browse(View,"window=Log;size=500x350")







	Remove_Overlays()
		overlays = null

	Input()
		set hidden=1
		var/list/Inputs=list("OOC","Say","Whisp")
		var/mob/ControlledMob=src
		if(MindTransfer)
			ControlledMob=MindTransfer
		for(var/obj/items/Clothing/Radio_Comm/X in ControlledMob)
			if(X)
				Inputs.Add("Radio")
				break
		Inputs.Add("CMD")
		for(var/i=1,i<=Inputs.len,i++)
			if(Inputs[i]==Input&&i==Inputs.len)
				Input=Inputs[1]
				break
			if(Inputs[i]==Input)
				Input=Inputs[++i]
				break
		winset(src,"default.Input","text=\"[src.Input]\"")
		if(src.Input=="Say"||src.Input=="Whisp"||src.Input=="Think"||src.Input=="Radio")
			winset(src,"default.InputBar","command=\"Say\"")
		if(src.Input=="OOC")
			winset(src,"default.InputBar","command=\"OOC\"")
		if(src.Input=="CMD")
			winset(src,"default.InputBar","command=\"\"")
	Countdown()//output("<font size = -3>Your score is [score].", "scorepane.output")
		if(RecentVerbCheck("Countdown", 350,1)) return
		recentverbs["Countdown"]=world.realtime
		for(var/mob/M in hearers())
			M << output("<font size = -3><font color=[usr.SayFont]>[M.getStrangerName(usr)] is counting down, 120 seconds will be given to react.","outputic.output")
			M << output("<font size = -3><font color=[usr.SayFont]>[M.getStrangerName(usr)] is counting down, 120 seconds will be given to react.","outputall.output")
			sleep(300)
			sleep(300)
			M << output("<font size = -3><font color=[usr.SayFont]>[M.getStrangerName(usr)] has waited 60 seconds, 60 more.","outputic.output")
			M << output("<font size = -3><font color=[usr.SayFont]>[M.getStrangerName(usr)] has waited 60 seconds, 60 more.","outputall.output")
			sleep(300)
			sleep(300)
			M << output("<font size = -3><font color=[usr.SayFont]>[M.getStrangerName(usr)] has waited 120 seconds, [M.getStrangerName(usr)] may commence their action.","outputic.output")
			M << output("<font size = -3><font color=[usr.SayFont]>[M.getStrangerName(usr)] has waited 120 seconds, [M.getStrangerName(usr)] may commence their action.","outputall.output")
	Options()

		set hidden=1
		//var/skin = src.CustomInput("Skin Selection","Please choose the skin color you would like",list("White","Tan","Dark","Pale"))
			//	switch(skin:name)
		var/list/choices = list("Change Short Description","IC Chat Color","Toggle Jump","Toggle OOC","Cancel")
		if(getPerk("Veteran Blacksmith") || getPerk("Trained Blacksmith") || getPerk("Lotus Sealing") || getPerk("Pharmacist") || getPerk("Tailor") || getPerk("Herbalist"))
			choices = list(/*"Subscribe",*/"Change Short Description","IC Chat Color","Profile","Toggle Jump","Craft","Toggle OOC","Toggle Feats","Toggle Contacts","Cancel")
		//strangerName = input("Input your name to strangers","Stranger Name",strangerName)
		var/option=custom_alert3(choices, "Please select an option")
		if(!option) return
		switch(option)
			if("Cancel") return
			if("Subscribe")
				login_box()
			if("Toggle Contacts")
				if(src.contactsOn == 0)
					src.contactsOn = 1
				else
					src.contactsOn = 0
			if("Toggle Bounty Tab")
				if(src.bountyOn == 0)
					src.bountyOn = 1
				else
					src.bountyOn = 0
			if("Toggle Feats")
				if(src.featsOn == 0)
					src.featsOn = 1
				else
					src.featsOn = 0
			if("Change Short Description")
				alert(src,"Short descriptions are how you are publically seen to others, before you introduce yourself. Please remember to keep in line with the rules when creating yours. We don't want to see over zealous names, or over the top descriptions. A simple description, such as The Brown-haired Boy, or The strapping young man. Anything that gives a short, concise description of your character.","Info")
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
						custom_alert("Their name may not consist entirely of capital letters.")
						src.strangerName = "Stranger"
						continue
					if(src.strangerName==""||findtext(src.strangerName,"\n"))
						custom_alert("Their name contains an invalid character.")
						src.strangerName="Stranger"
					if(findtext(src.strangerName,"The")==0)
						custom_alert("You must have 'The' at the start of your description.")
						src.strangerName="Stranger"
						continue
				if(!client) return
				src.strangerName = uppercase(lowertext(src.strangerName), 1)
				generate_hover_name()


			if("Craft")
				craft()
			if("IC Chat Color")
				var/list/colors=usr.ColorInput("Select a color to change your In Character chat to")
				SayFont=colors
				OSayFont=colors
			if("Toggle Jump")
				Jump=!Jump
				src<<output("<font size = -3>You are [Jump ? "now" : "no longer"] able to jump via double click.","outputic.output")
				src<<output("<font size = -3>You are [Jump ? "now" : "no longer"] able to jump via double click.","outputall.output")
			/*if("Profile")
				if(alert("Edit physical attributes, or profile?","Prompt","Physical Attributes","Profile")=="Physical Attributes")
					Weight=input("Input weight.","Weight",Weight)
					sleep(3)
					Height=input("Input height.","Height",Height)
					sleep(3)
					Injuries=input("Input a description for your side panel.","Injuries",Injuries) as message
					return
				else
					profile=input(usr,"Edit","Edit Profile",profile) as message*/
			if("Toggle OOC")
				if(OOCon)
					usr << "Your OOC has been disabled"
					OOCon=0
				else
					usr << "Your OOC has been enabled"
					OOCon=1
			/*if("Toggle Attack Text")
				if(Atton)
					usr << "Your Attack View has been disabled"
					Atton=0
				else
					usr << "Your Attack view has been enabled"
					Atton=1*/
					//var/Age=skinput2("Please enter your Age from 5-30.","Age",null,1)
			/*if("Screen size")
				var/width=skinput2("Enter the width of the screen, max is 50.","Screen Size",null,1)
				var/height=skinput2("Enter the height of the screen, max is 50.","Screen Size",null,1)
				if(width>50)
					usr.width=50
				if(width<1)
					usr.width=1
				if(height>50)
					usr.height=50
				if(height<1)
					usr.height=1
				usr.width = width
				usr.height = height
				client.view="[usr.width]x[usr.height]"*/
	OOC_Say()
		set hidden=1
		OOCSayOn=!OOCSayOn
		usr<<"You're now [OOCSayOn ? "listening" : "not listening"] to in-character OOCs."
	OOC(msg as text)
		usr.Mute_Check()
		if(!OOCon)
			src<<"Your OOC chat is off! You can toggle it on through the options menu."
			return
		if(length(msg)>400) return
		if(msg==""||!global.OOC)
			return
		if(usr.Muted)
			usr<<"You are muted."
			return
		if(findtext(msg,"byond://")) return
		var/thetext=copytext(msg,1,250)
	//	if(RecentVerbCheck("OOC", 3,1)&&!Admin) return
	//	recentverbs["OOC"] = world.realtime
		OOCFont = "#858755"
		if(client.IsByondMember())
			OOCFont = "#81BDD9"
		if(Admin)
			OOCFont="#3B56E1"
		if(Donator)
			OOCFont = "#B52735"
		if(src.key == "Savi0r")
			OOCFont = "#84FF9C"

		for(var/mob/M in world)
			if(M.OOCon&&!M.Admin)
				M << "[Donator ? "" : ""]<font color=[usr.OOCFont]></b>[Admin ? "\[A\] " : ""]OOC - [displaykey]</font><font color=white>: [html_encode(thetext)]"
		for(var/mob/M in world)
			if(M.OOCon&&M.Admin)
				M<<"[Donator ? "" : ""]<font color=[usr.OOCFont]></b>[Admin ? "\[A\] " : ""]OOC - [displaykey]</font><font color=white> ([usr.Oname]): [html_encode(thetext)]"
				//M << "<font color=[usr.OOCFont]>(<font color = white>OOC<font color=[usr.OOCFont]>)<font color=[usr.OOCFont]>(<font color = white>[displaykey]<font color=[usr.OOCFont]>)[usr.Oname]<font color=white>: [html_encode(thetext)]"



	Say(msg as text)
		var/CheckSpam=0
		var/mob/ControlledMob=src
		if(MindAfflicted)
			src<<output("You can't seem to control your own body!","outputic.output")
			src<<output("You can't seem to control your own body!","outputall.output")
			return
		if(MindTransfer)
			ControlledMob=MindTransfer
		if(msg==""||!global.Say)
			return
		if(src.SpamList.len > 5)
			SpamList = new/list()
		for(var/L in src.SpamList)
			if(L == msg)
				CheckSpam++
		if(CheckSpam)
			src.SpamCount++
		else
			src.SpamList.Add(msg)
		if(src.SpamCount >= 20 && src.CanProgress)
			src.CanProgress = 0
			for(var/mob/A in world)
				if(A.Admin) A << output("<font size=-4><font color=[ControlledMob.SayFont]>[ControlledMob.strangerName] ([ControlledMob]) just had their progression automatically shut off for spamming.","outputall.output")
		if(findtext(msg,"/s",1,3))
			if(findtext(msg,"(",4,5)||findtext(msg,"\[",4,5) || findtext(msg, ")",length(msg),0) || findtext(msg, "\]",length(msg),0))
				msg=copytext(msg,4,0)
				for(var/mob/M in hearers(15,ControlledMob))
					if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) continue
					if(M.OOCSayOn)
						if(M.MindAfflicted)
							M.MindAfflicted << output("<font size=-4><font color=[ControlledMob.SayFont]>[M.MindAfflicted.getStrangerName(ControlledMob)] OOCs<font color = white>: [html_encode(msg)]","outputall.output")
							M.MindAfflicted << output("<font size=-4><font color=[ControlledMob.SayFont]>[M.MindAfflicted.getStrangerName(ControlledMob)] OOCs<font color = white>: [html_encode(msg)]","outputoocsay.output")
							M.MindAfflicted.ChatLog("<font size=-4><font color=teal>*[ControlledMob.name] ([ControlledMob.strangerName]-[ControlledMob.key]) OOCs: [msg]")
							M.MindAfflicted.SelfLog("<font size=-4><font color=[ControlledMob.SayFont]>[M.MindAfflicted.getStrangerName(ControlledMob)] OOCs<font color = white>: [html_encode(msg)]</font></font></font>")
						else
							M << output("<font size=-4><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] OOCs<font color = white>: [html_encode(msg)]","outputall.output")
							M << output("<font size=-4><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] OOCs<font color = white>: [html_encode(msg)]","outputoocsay.output")
							M.ChatLog("<font size=-4><font color=teal>*[ControlledMob.name] ([ControlledMob.strangerName]-[ControlledMob.key]) OOCs: [msg]")
							M.SelfLog("<font size=-4><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] OOCs<font color = white>: [html_encode(msg)]</font></font></font>")

				for(var/mob/M in world)
					if(M.Admin >= 4) M << output("<font size=-4><font color=[ControlledMob.SayFont]>[ControlledMob.strangerName] ([ControlledMob]) OOCs<font color = white>: [html_encode(msg)]","rpspy.output")

				return

		if(findtext(msg,"/o",1,3))
			msg=copytext(msg,4,0)
			usr.Mute_Check()
			if(!OOCon)
				src<<"Your OOC chat is off! You can toggle it on through the options menu."
				return
			if(length(msg)>400) return
			if(msg==""||!global.OOC)
				return
			if(usr.Muted)
				usr<<"You are muted."
				return
			if(findtext(msg,"byond://")) return
			var/thetext=copytext(msg,1,250)
		//	if(RecentVerbCheck("OOC", 3,1)&&!Admin) return
		//	recentverbs["OOC"] = world.realtime
			for(var/mob/M in world)
				if(M.OOCon&&!M.Admin)
					M << "[Donator ? "" : ""]<font color=[usr.OOCFont]></b>[Admin ? "\[A\]" : ""]OOC - [displaykey]</font><font color=white>: [html_encode(thetext)]"
			for(var/mob/M in world)
				if(M.OOCon&&M.Admin)
					M<<"[Donator ? "" : ""]<font color=[usr.OOCFont]></b>[Admin ? "\[A\]" : ""]OOC - [displaykey]</font><font color=white> ([usr.Oname]): [html_encode(thetext)]"
					//M << "<font color=[usr.OOCFont]>(<font color = white>OOC<font color=[usr.OOCFont]>)<font color=[usr.OOCFont]>(<font color = white>[displaykey]<font color=[usr.OOCFont]>)[usr.Oname]<font color=white>: [html_encode(thetext)]"
			return
		if(findtext(msg,"/w",1,3))
	//	if(Input=="Whisp")
			ControlledMob.overlays+='TalkOverlay.dmi'
			spawn(15) ControlledMob.overlays-='TalkOverlay.dmi'
			msg=copytext(msg,4,0)
			if(is_ooc(msg)) progress_activity = max(progress_activity-1,0)
			else
				if(progress_activity < 4) progress_activity += 1

				for(var/mob/M in hearers(15, src))
					if(M.progress_target && M.progress_target.learning_from == ckey)
						if(M.teacher_activity < 24) M.teacher_activity += 2
					else if(progress_target && M.progress_target)
						if(progress_target.name == M.progress_target.name)
							if(M.teacher_activity < 24) M.teacher_activity += 2
			for(var/mob/M in hearers(15,ControlledMob))
				if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) continue
				if(get_dist(M,ControlledMob)>2)
					if(M.MindAfflicted)

						if(get_dist(M,ControlledMob)<=5 && M.getPerk("Lipreader"))
							M.MindAfflicted << output("<font size=-3><font color=[ControlledMob.SayFont]>[M.MindAfflicted.getStrangerName(ControlledMob)] whispers<font color = white>: [html_encode(msg)]","outputic.output")
							M.MindAfflicted << output("<font size=-3><font color=[ControlledMob.SayFont]>[M.MindAfflicted.getStrangerName(ControlledMob)] whispers<font color = white>: [html_encode(msg)]","outputall.output")
							M.MindAfflicted.ChatLog("<font color=teal>*[ControlledMob.name] ([ControlledMob.strangerName]-[ControlledMob.key]) whispers: [msg]")
							M.MindAfflicted.SelfLog("<font size=-3><font color=[ControlledMob.SayFont]>[M.MindAfflicted.getStrangerName(ControlledMob)] whispers<font color = white>: [html_encode(msg)]</font></font></font>")
						else
							M.MindAfflicted << output("<font size=-3><font color=[ControlledMob.SayFont]>[M.MindAfflicted.getStrangerName(ControlledMob)] whispers faintly.","outputic.output")
							M.MindAfflicted << output("<font size=-3><font color=[ControlledMob.SayFont]>[M.MindAfflicted.getStrangerName(ControlledMob)] whispers faintly.","outputall.output")
							M.MindAfflicted.ChatLog("<font color=teal>*[ControlledMob.name] ([ControlledMob.strangerName]-[ControlledMob.key]) whispers faintly.")
							M.MindAfflicted.SelfLog("<font size=-3><font color=[ControlledMob.SayFont]>[M.MindAfflicted.getStrangerName(ControlledMob)] whispers faintly.</font></font></font>")
					else
						if(get_dist(M,ControlledMob)<=5 && M.getPerk("Lipreader"))
							M << output("<font size=-3><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] whispers<font color = white>: [html_encode(msg)]","outputic.output")
							M << output("<font size=-3><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] whispers<font color = white>: [html_encode(msg)]","outputall.output")
							M.ChatLog("<font color=teal>*[ControlledMob.name] ([ControlledMob.strangerName]-[ControlledMob.key]) whispers: [msg]")
							M.SelfLog("<font size=-3><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] whispers<font color = white>: [html_encode(msg)]</font></font></font>")
						else
							M << output("<font size=-3><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] whispers faintly.","outputic.output")
							M << output("<font size=-3><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] whispers faintly.","outputall.output")
							M.ChatLog("<font color=teal>*[ControlledMob.name] ([ControlledMob.strangerName]-[ControlledMob.key]) whispers faintly.")
							M.SelfLog("<font size=-3><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] whispers faintly.</font></font></font>")
				else
					if(M.MindAfflicted)
						M.MindAfflicted << output("<font size=-3><font color=[ControlledMob.SayFont]>[M.MindAfflicted.getStrangerName(ControlledMob)] whispers<font color = white>: [html_encode(msg)]","outputic.output")
						M.MindAfflicted << output("<font size=-3><font color=[ControlledMob.SayFont]>[M.MindAfflicted.getStrangerName(ControlledMob)] whispers<font color = white>: [html_encode(msg)]","outputall.output")
						M.MindAfflicted.ChatLog("<font color=teal>*[ControlledMob.name] ([ControlledMob.strangerName]-[ControlledMob.key]) whispers: [msg]")
						M.MindAfflicted.SelfLog("<font size=-3><font color=[ControlledMob.SayFont]>[M.MindAfflicted.getStrangerName(ControlledMob)] whispers<font color = white>: [html_encode(msg)]</font></font></font>")
					else
						M << output("<font size=-3><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] whispers<font color = white>: [html_encode(msg)]","outputic.output")
						M << output("<font size=-3><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] whispers<font color = white>: [html_encode(msg)]","outputall.output")
						M.ChatLog("<font color=teal>*[ControlledMob.name] ([ControlledMob.strangerName]-[ControlledMob.key]) whispers: [msg]")
						M.SelfLog("<font size=-3><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] whispers<font color = white>: [html_encode(msg)]</font></font></font>")
			for(var/obj/Technology/Camera/C in view(20,ControlledMob)) C.appendToLog("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[ControlledMob.strangerName] whispers.</b></font></span>")
			for(var/mob/M in world)
				if(M.Admin >= 4) M << output("<a href=?src=\ref[M];action=Options;mob=[ControlledMob.ckey]>Options</a>-<font color=[ControlledMob.SayFont]>[ControlledMob] whispers<font color = white>: [html_encode(msg)]","rpspy.output")

			return

		if(findtext(msg,"/t",1,3))
	//	if(Input=="Think")
			ControlledMob.overlays+='TalkOverlay.dmi'
			spawn(15) ControlledMob.overlays-='TalkOverlay.dmi'
			msg=copytext(msg,4,0)
			if(is_ooc(msg)) progress_activity = max(progress_activity-1,0)
			else progress_activity=min(progress_activity+1,4)
			for(var/mob/M in hearers(15,ControlledMob))
				if(M != src) continue
				if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) continue
				if(M.MindAfflicted)
					M.MindAfflicted << output("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.MindAfflicted.getStrangerName(ControlledMob)] thinks:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white><i> [html_encode(msg)]</i>","outputic.output")
					M.MindAfflicted << output("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.MindAfflicted.getStrangerName(ControlledMob)] thinks:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white><i> [html_encode(msg)]</i>","outputall.output")
					M.MindAfflicted.ChatLog("<font color=teal>*[ControlledMob.name] ([ControlledMob.strangerName]-[ControlledMob.key]) thinks: [msg]")
					M.MindAfflicted.SelfLog("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.MindAfflicted.getStrangerName(ControlledMob)] thinks:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white><i> [html_encode(msg)]</i></font></font></font></span></span>")
				else
					M << output("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.getStrangerName(ControlledMob)] thinks:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white><i> [html_encode(msg)]</i>","outputic.output")
					M << output("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.getStrangerName(ControlledMob)] thinks:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white><i> [html_encode(msg)]</i>","outputall.output")
					M.ChatLog("<font color=teal>*[ControlledMob.name] ([ControlledMob.strangerName]-[ControlledMob.key]) thinks: [msg]")
					M.SelfLog("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.getStrangerName(ControlledMob)] thinks:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white><i> [html_encode(msg)]</i></font></font></font></span></span>")
			for(var/mob/M in world)
				if(M.Admin >= 4) M << output("<a href=?src=\ref[M];action=Options;mob=[ControlledMob.ckey]>Options</a>-<font color=[ControlledMob.SayFont]>[ControlledMob] ([ControlledMob.strangerName]) thinks<font color = white>: [html_encode(msg)]","rpspy.output")

			return

		if(findtext(msg,"/r",1,3))
	//	if(Input=="Radio")
			ControlledMob.overlays+='TalkOverlay.dmi'
			spawn(15) ControlledMob.overlays-='TalkOverlay.dmi'
			msg=copytext(msg,4,0)
			if(is_ooc(msg)) progress_activity = max(progress_activity-1,0)
			else
				if(progress_activity < 4) progress_activity += 1

				for(var/mob/M in hearers(15, src))
					if(M.progress_target && M.progress_target.learning_from == ckey)
						if(M.teacher_activity < 24) M.teacher_activity += 2
					else if(progress_target && M.progress_target)
						if(progress_target.name == M.progress_target.name)
							if(M.teacher_activity < 24) M.teacher_activity += 2
			for(var/obj/items/Clothing/Radio_Comm/X in ControlledMob)
				if(!X) return
				if(!X.Toggled) return
				if((ControlledMob.z==1||ControlledMob.z==29)&&!KonohaRadio)
					ControlledMob<<output("<font size=-3><font color=green>Your radio buzzes with feedback.","outputic.output")
					ControlledMob<<output("<font size=-3><font color=green>Your radio buzzes with feedback.","outputall.output")
					return

				if((ControlledMob.z==3||ControlledMob.z==8)&&!KiriRadio)
					ControlledMob<<output("<font size=-3><font color=green>Your radio buzzes with feedback.","outputic.output")
					ControlledMob<<output("<font size=-3><font color=green>Your radio buzzes with feedback.","outputall.output")
					return
				if(ControlledMob.z==1||ControlledMob.z==29)
					ControlledMob << output("<font size=-3><font color= green>{Radio-[X.Freq]}[ControlledMob.strangerName] says<font color = green>: [html_encode(msg)]","Radio.rp")
				var/list/L=list()
				for(var/mob/M in world)
					for(var/obj/items/Clothing/Radio_Comm/C in M)
						if(C.Freq==X.Freq&&C.Toggled)
							L+=M
					if(M.Admin) M << output("<a href=?src=\ref[M];action=Options;mob=[ControlledMob.ckey]>Options</a>-<b><span style=\"color:[ControlledMob.SayFont]\">[ControlledMob] ([ControlledMob.strangerName]) radios:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]","rpspy.output")
				if(L.len >= 6)
					ControlledMob<<output("<font size=-3><font color=green>Your radio buzzes with feedback. Your message failed.","outputic.output")
					ControlledMob<<output("<font size=-3><font color=green>Your radio buzzes with feedback. Your message failed.","outputall.output")
					return
				for(var/mob/M in L)
					if(M.z!=ControlledMob.z)
						M<<output("<font size=-3><font color=green>There is a static buzz humming in your radio.","outputic.output")
						M<<output("<font size=-3><font color=green>There is a static buzz humming in your radio.","outputall.output")
						continue
					M << output("<font size=-3><font color= green>{Radio-[X.Freq]}[M.getStrangerName(ControlledMob)] says<font color = green>: [html_encode(msg)]","outputic.output")
					M << output("<font size=-3><font color= green>{Radio-[X.Freq]}[M.getStrangerName(ControlledMob)] says<font color = green>: [html_encode(msg)]","outputall.output")
					M.ChatLog("<font color=blue>[ControlledMob.name] ([ControlledMob.strangerName]-[ControlledMob.key]): [msg]")
					M.SelfLog("<font size=-3><font color= green>{Radio-[X.Freq]}[M.getStrangerName(ControlledMob)] says<font color = green>: [html_encode(msg)]</font></font></font>")

			for(var/mob/M in hearers(15,ControlledMob))
				if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) continue
				if(get_dist(M,ControlledMob)>2)
					if(M.MindAfflicted)
						if(get_dist(M,ControlledMob)<=5 && M.getPerk("Lipreader"))
							M.MindAfflicted << output("<font size=-3><font color=[ControlledMob.SayFont]>[M.MindAfflicted.getStrangerName(ControlledMob)] whispers<font color = white>: [html_encode(msg)]","outputic.output")
							M.MindAfflicted << output("<font size=-3><font color=[ControlledMob.SayFont]>[M.MindAfflicted.getStrangerName(ControlledMob)] whispers<font color = white>: [html_encode(msg)]","outputall.output")
							M.MindAfflicted.ChatLog("<font color=teal>*[ControlledMob.name] ([ControlledMob.strangerName]-[ControlledMob.key]) whispers: [msg]")
							M.MindAfflicted.SelfLog("<font size=-3><font color=[ControlledMob.SayFont]>[M.MindAfflicted.getStrangerName(ControlledMob)] whispers<font color = white>: [html_encode(msg)]</font></font></font>")
						else
							M.MindAfflicted << output("<font size=-3><font color=[ControlledMob.SayFont]>[M.MindAfflicted.getStrangerName(ControlledMob)] whispers faintly.","outputic.output")
							M.MindAfflicted << output("<font size=-3><font color=[ControlledMob.SayFont]>[M.MindAfflicted.getStrangerName(ControlledMob)] whispers faintly.","outputall.output")
							M.MindAfflicted.ChatLog("<font color=teal>*[ControlledMob.name] ([ControlledMob.strangerName]-[ControlledMob.key]) whispers faintly.")
							M.MindAfflicted.SelfLog("<font size=-3><font color=[ControlledMob.SayFont]>[M.MindAfflicted.getStrangerName(ControlledMob)] whispers faintly.</font></font></font>")
					else
						if(get_dist(M,ControlledMob)<=5 && M.getPerk("Lipreader"))
							M << output("<font size=-3><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] whispers<font color = white>: [html_encode(msg)]","outputic.output")
							M << output("<font size=-3><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] whispers<font color = white>: [html_encode(msg)]","outputall.output")
							M.ChatLog("<font color=teal>*[ControlledMob.name] ([ControlledMob.strangerName]-[ControlledMob.key]) whispers: [msg]")
							M.SelfLog("<font size=-3><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] whispers<font color = white>: [html_encode(msg)]</font></font></font>")
						else
							M << output("<font size=-3><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] whispers faintly.","outputic.output")
							M << output("<font size=-3><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] whispers faintly.","outputall.output")
							M.ChatLog("<font color=teal>*[ControlledMob.name] ([ControlledMob.strangerName]-[ControlledMob.key]) whispers faintly.")
							M.ChatLog("<font size=-3><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] whispers faintly.")
				else
					if(M.MindAfflicted)
						M.MindAfflicted << output("<font size=-3><font color=[ControlledMob.SayFont]>[M.MindAfflicted.getStrangerName(ControlledMob)] whispers<font color = white>: [html_encode(msg)]","outputic.output")
						M.MindAfflicted << output("<font size=-3><font color=[ControlledMob.SayFont]>[M.MindAfflicted.getStrangerName(ControlledMob)] whispers<font color = white>: [html_encode(msg)]","outputall.output")
						M.MindAfflicted.ChatLog("<font color=teal>*[ControlledMob.name] ([ControlledMob.strangerName]-[ControlledMob.key]) whispers: [msg]")
						M.MindAfflicted.SelfLog("<font size=-3><font color=[ControlledMob.SayFont]>[M.MindAfflicted.getStrangerName(ControlledMob)] whispers<font color = white>: [html_encode(msg)]</font></font></font>")
					else
						M << output("<font size=-3><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] whispers<font color = white>: [html_encode(msg)]","outputic.output")
						M << output("<font size=-3><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] whispers<font color = white>: [html_encode(msg)]","outputall.output")
						M.ChatLog("<font color=teal>*[ControlledMob.name] ([ControlledMob.strangerName]-[ControlledMob.key]) whispers: [msg]")
						M.SelfLog("<font size=-3><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] whispers<font color = white>: [html_encode(msg)]</font></font></font>")
			for(var/obj/Technology/Camera/C in view(20,ControlledMob)) C.appendToLog("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[ControlledMob.strangerName] whispers.</b></font></span>")
			for(var/mob/M in world)
				if(M.Admin >= 4) M << output("<a href=?src=\ref[M];action=Options;mob=[ControlledMob.ckey]>Options</a>-<font color=[ControlledMob.SayFont]>[ControlledMob] ([ControlledMob.strangerName]) whispers<font color = white>: [html_encode(msg)]","rpspy.output")

			return


		if(findtext(msg,"/s",1,3))
			if(findtext(msg,"!",length(msg),0))
				msg=copytext(msg,4,0)
				if(is_ooc(msg)) progress_activity = max(progress_activity-1,0)
				else
					if(progress_activity < 4) progress_activity += 1

					for(var/mob/M in hearers(15, src))
						if(M.progress_target && M.progress_target.learning_from == ckey)
							if(M.teacher_activity < 24) M.teacher_activity += 2
						else if(progress_target && M.progress_target)
							if(progress_target.name == M.progress_target.name)
								if(M.teacher_activity < 24) M.teacher_activity += 2
				ControlledMob.overlays+='TalkOverlay.dmi'
				spawn(15) ControlledMob.overlays-='TalkOverlay.dmi'
				for(var/mob/M in world)
					if(M.Admin) M << output("<a href=?src=\ref[M];action=Options;mob=[ControlledMob.ckey]>Options</a>-<b><span style=\"color:[ControlledMob.SayFont]\">[ControlledMob] ([ControlledMob.strangerName]) yells:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]","rpspy.output")
				for(var/mob/M in hearers(17,ControlledMob))
					if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) continue
					if(M.MindAfflicted)
						M.MindAfflicted << output("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.MindAfflicted.getStrangerName(ControlledMob)] yells:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]","outputic.output")
						M.MindAfflicted << output("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.MindAfflicted.getStrangerName(ControlledMob)] yells:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]","outputall.output")
						M.MindAfflicted.ChatLog("<font color=green>*[ControlledMob.name] ([ControlledMob.strangerName]-[ControlledMob.key]) yells: [msg]")
						M.MindAfflicted.SelfLog("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.MindAfflicted.getStrangerName(ControlledMob)] yells:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]</font></font></font></span></span>")
					else
						M << output("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.getStrangerName(ControlledMob)] yells:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]","outputic.output")
						M << output("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.getStrangerName(ControlledMob)] yells:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]","outputall.output")
						M.ChatLog("<font color=green>*[ControlledMob.name] ([ControlledMob.strangerName]-[ControlledMob.key]) yells: [msg]")
						M.SelfLog("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.getStrangerName(ControlledMob)] yells:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]</font></font></font></span></span>")
				for(var/obj/Technology/Camera/C in view(20,ControlledMob)) C.appendToLog("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[ControlledMob.strangerName] yells.</b></font></span>")

				return

		if(findtext(msg,"/s",1,3))
			if(findtext(msg,"?",length(msg),0))
				msg=copytext(msg,4,0)
				if(is_ooc(msg)) progress_activity = max(progress_activity-1,0)
				else
					if(progress_activity < 4) progress_activity += 1

					for(var/mob/M in hearers(15, src))
						if(M.progress_target && M.progress_target.learning_from == ckey)
							if(M.teacher_activity < 24) M.teacher_activity += 2
						else if(progress_target && M.progress_target)
							if(progress_target.name == M.progress_target.name)
								if(M.teacher_activity < 24) M.teacher_activity += 2
				ControlledMob.overlays+='TalkOverlay.dmi'
				spawn(15) ControlledMob.overlays-='TalkOverlay.dmi'
				for(var/mob/M in world)
					if(M.Admin) M << output("<a href=?src=\ref[M];action=Options;mob=[ControlledMob.ckey]>Options</a>-<b><span style=\"color:[ControlledMob.SayFont]\">[ControlledMob] ([ControlledMob.strangerName]) asks:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]","rpspy.output")
				for(var/mob/M in hearers(17,ControlledMob))
					if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) continue
					if(M.MindAfflicted)
						M.MindAfflicted << output("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.MindAfflicted.getStrangerName(ControlledMob)] asks:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]","outputic.output")
						M.MindAfflicted << output("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.MindAfflicted.getStrangerName(ControlledMob)] asks:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]","outputall.output")
						M.MindAfflicted.ChatLog("<font color=green>*[ControlledMob.name]([ControlledMob.key]) asks: [msg]")
						M.MindAfflicted.SelfLog("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.MindAfflicted.getStrangerName(ControlledMob)] asks:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]</font></font></font></span></span>")
					else
						M << output("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.getStrangerName(ControlledMob)] asks:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]","outputic.output")
						M << output("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.getStrangerName(ControlledMob)] asks:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]","outputall.output")
						M.ChatLog("<font color=green>*[ControlledMob.name] ([ControlledMob.strangerName]-[ControlledMob.key]) asks: [msg]")
						M.SelfLog("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.getStrangerName(ControlledMob)] asks:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]</font></font></font></span></span>")
				for(var/obj/Technology/Camera/C in view(20,ControlledMob)) C.appendToLog("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[ControlledMob.strangerName] speaks.</b></font></span>")

				return
		if(findtext(msg,"/s",1,3))
			msg=copytext(msg,4,0)
			if(is_ooc(msg)) progress_activity = max(progress_activity-1,0)
			else
				if(progress_activity < 4) progress_activity += 1

				for(var/mob/M in hearers(15, src))
					if(M.progress_target && M.progress_target.learning_from == ckey)
						if(M.teacher_activity < 24) M.teacher_activity += 2
					else if(progress_target && M.progress_target)
						if(progress_target.name == M.progress_target.name)
							if(M.teacher_activity < 24) M.teacher_activity += 2
			ControlledMob.overlays+='TalkOverlay.dmi'
			spawn(15) ControlledMob.overlays-='TalkOverlay.dmi'
			for(var/mob/M in hearers(15,ControlledMob))
				if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) continue
				if(M.MindAfflicted)
					M.MindAfflicted << output("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.MindAfflicted.getStrangerName(ControlledMob)] says:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]","outputic.output")
					M.MindAfflicted << output("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.MindAfflicted.getStrangerName(ControlledMob)] says:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]","outputall.output")
					M.MindAfflicted.ChatLog("<font color=green>*[ControlledMob.name] ([ControlledMob.strangerName]-[ControlledMob.key]) says: [msg]")
					M.MindAfflicted.SelfLog("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.MindAfflicted.getStrangerName(ControlledMob)] says:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]</font></font></font></span></span>")
				else
					M << output("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.getStrangerName(ControlledMob)] says:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]","outputic.output")
					M << output("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.getStrangerName(ControlledMob)] says:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]","outputall.output")
					M.ChatLog("<font color=green>*[ControlledMob.name] ([ControlledMob.strangerName]-[ControlledMob.key]) says: [msg]")
					M.SelfLog("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.getStrangerName(ControlledMob)] says:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]</font></font></font></span></span>")
			for(var/obj/Technology/Camera/C in view(20,ControlledMob)) C.appendToLog("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[ControlledMob.strangerName] speaks.</b></font></span>")
			for(var/mob/M in world)
				if(M.Admin) M << output("<a href=?src=\ref[M];action=Options;mob=[ControlledMob.ckey]>Options</a>-<b><span style=\"color:[ControlledMob.SayFont]\">[ControlledMob] ([ControlledMob.strangerName]) says:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]","rpspy.output")

			return
		if(findtext(msg,"(",1,2)||findtext(msg,"\[",1,2) || findtext(msg, ")",length(msg),0) || findtext(msg, "\]",length(msg),0))
			if(is_ooc(msg)) progress_activity = max(progress_activity-1,0)
			else
				if(progress_activity < 4) progress_activity += 1

				for(var/mob/M in hearers(15, src))
					if(M.progress_target && M.progress_target.learning_from == ckey)
						if(M.teacher_activity < 24) M.teacher_activity += 2
					else if(progress_target && M.progress_target)
						if(progress_target.name == M.progress_target.name)
							if(M.teacher_activity < 24) M.teacher_activity += 2
			for(var/mob/M in hearers(15,ControlledMob))
				if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) continue
				if(M.OOCSayOn)
					if(M.MindAfflicted)
						M.MindAfflicted << output("<font size=-3><font size=-4><font color=[ControlledMob.SayFont]>[M.MindAfflicted.getStrangerName(ControlledMob)] OOCs<font color = white>: [html_encode(msg)]","outputall.output")
						M.MindAfflicted << output("<font size=-3><font size=-4><font color=[ControlledMob.SayFont]>[M.MindAfflicted.getStrangerName(ControlledMob)] OOCs<font color = white>: [html_encode(msg)]","outputoocsay.output")
						M.MindAfflicted.ChatLog("<font size=-4><font color=teal>*[ControlledMob.name]([ControlledMob.strangerName]-[ControlledMob.key]) OOCs: [msg]")
						M.MindAfflicted.SelfLog("<font size=-3><font size=-4><font color=[ControlledMob.SayFont]>[M.MindAfflicted.getStrangerName(ControlledMob)] OOCs<font color = white>: [html_encode(msg)]</font></font></font>")
					else
						M << output("<font size=-3><font size=-4><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] OOCs<font color = white>: [html_encode(msg)]","outputall.output")
						M << output("<font size=-3><font size=-4><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] OOCs<font color = white>: [html_encode(msg)]","outputoocsay.output")
						M.ChatLog("<font size=-4><font color=teal>*[ControlledMob.name]([ControlledMob.strangerName]-[ControlledMob.key]) OOCs: [msg]")
						M.SelfLog("<font size=-3><font size=-4><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] OOCs<font color = white>: [html_encode(msg)]</font></font></font>")
			for(var/mob/M in world)
				if(M.Admin >= 4) M << output("<font size=-4><font color=[ControlledMob.SayFont]>[ControlledMob] ([ControlledMob.strangerName]) OOCs<font color = white>: [html_encode(msg)]","rpspy.output")

			return
	//	if(findtext(msg,"#",1,2))
		if(Input=="Whisp")
			ControlledMob.overlays+='TalkOverlay.dmi'
			spawn(15) ControlledMob.overlays-='TalkOverlay.dmi'
			if(is_ooc(msg)) progress_activity = max(progress_activity-1,0)
			else
				if(progress_activity < 4) progress_activity += 1

				for(var/mob/M in hearers(15, src))
					if(M.progress_target && M.progress_target.learning_from == ckey)
						if(M.teacher_activity < 24) M.teacher_activity += 2
					else if(progress_target && M.progress_target)
						if(progress_target.name == M.progress_target.name)
							if(M.teacher_activity < 24) M.teacher_activity += 2
		//	msg=copytext(msg,2,0)
			for(var/mob/M in hearers(15,ControlledMob))
				if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) continue
				if(get_dist(M,ControlledMob)>2)
					if(M.MindAfflicted)

						if(get_dist(M,ControlledMob)<=5 && M.getPerk("Lipreader"))
							M.MindAfflicted << output("<font size=-3><font color=[ControlledMob.SayFont]>[M.MindAfflicted.getStrangerName(ControlledMob)] whispers<font color = white>: [html_encode(msg)]","outputic.output")
							M.MindAfflicted << output("<font size=-3><font color=[ControlledMob.SayFont]>[M.MindAfflicted.getStrangerName(ControlledMob)] whispers<font color = white>: [html_encode(msg)]","outputall.output")
							M.MindAfflicted.ChatLog("<font color=teal>*[ControlledMob.name] ([ControlledMob.strangerName]-[ControlledMob.key]) whispers: [msg]")
							M.MindAfflicted.SelfLog("<font size=-3><font color=[ControlledMob.SayFont]>[M.MindAfflicted.getStrangerName(ControlledMob)] whispers<font color = white>: [html_encode(msg)]</font></font></font>")
						else
							M.MindAfflicted << output("<font size=-3><font color=[ControlledMob.SayFont]>[M.MindAfflicted.getStrangerName(ControlledMob)] whispers faintly.","outputic.output")
							M.MindAfflicted << output("<font size=-3><font color=[ControlledMob.SayFont]>[M.MindAfflicted.getStrangerName(ControlledMob)] whispers faintly.","outputall.output")
							M.MindAfflicted.ChatLog("<font color=teal>*[ControlledMob.name] ([ControlledMob.strangerName]-[ControlledMob.key]) whispers faintly.")
							M.MindAfflicted.SelfLog("<font size=-3><font color=[ControlledMob.SayFont]>[M.MindAfflicted.getStrangerName(ControlledMob)] whispers faintly.</font></font></font>")
					else
						if(get_dist(M,ControlledMob)<=5 && M.getPerk("Lipreader"))
							M << output("<font size=-3><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] whispers<font color = white>: [html_encode(msg)]","outputic.output")
							M << output("<font size=-3><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] whispers<font color = white>: [html_encode(msg)]","outputall.output")
							M.ChatLog("<font color=teal>*[ControlledMob.name] ([ControlledMob.strangerName]-[ControlledMob.key]) whispers: [msg]")
							M.SelfLog("<font size=-3><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] whispers<font color = white>: [html_encode(msg)]</font></font></font>")
						else
							M << output("<font size=-3><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] whispers faintly.","outputic.output")
							M << output("<font size=-3><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] whispers faintly.","outputall.output")
							M.ChatLog("<font color=teal>*[ControlledMob.name] ([ControlledMob.strangerName]-[ControlledMob.key]) whispers faintly.")
							M.SelfLog("<font size=-3><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] whispers faintly.</font></font></font>")
				else
					if(M.MindAfflicted)
						M.MindAfflicted << output("<font size=-3><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] whispers<font color = white>: [html_encode(msg)]","outputic.output")
						M.MindAfflicted << output("<font size=-3><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] whispers<font color = white>: [html_encode(msg)]","outputall.output")
						M.MindAfflicted.ChatLog("<font color=teal>*[ControlledMob.name] ([ControlledMob.strangerName]-[ControlledMob.key]) whispers: [msg]")
						M.MindAfflicted.SelfLog("<font size=-3><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] whispers<font color = white>: [html_encode(msg)]</font></font></font>")
					else
						M << output("<font size=-3><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] whispers<font color = white>: [html_encode(msg)]","outputic.output")
						M << output("<font size=-3><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] whispers<font color = white>: [html_encode(msg)]","outputall.output")
						M.ChatLog("<font color=teal>*[ControlledMob.name] ([ControlledMob.strangerName]-[ControlledMob.key]) whispers: [msg]")
						M.SelfLog("<font size=-3><font color=[ControlledMob.SayFont]>[M.getStrangerName(ControlledMob)] whispers<font color = white>: [html_encode(msg)]</font></font></font>")
			for(var/obj/Technology/Camera/C in view(20,ControlledMob)) C.appendToLog("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[ControlledMob.strangerName] whispers.</b></font></span>")
			for(var/mob/M in world)
				if(M.Admin >= 4) M << output("<a href=?src=\ref[M];action=Options;mob=[ControlledMob.ckey]>Options</a>-<font color=[ControlledMob.SayFont]>[ControlledMob] ([ControlledMob.strangerName]) whispers<font color = white>: [html_encode(msg)]","rpspy.output")

			return
	//	if(findtext(msg,"@",1,2))




		if(findtext(msg,"!",length(msg),0))
			ControlledMob.overlays+='TalkOverlay.dmi'
			spawn(15) ControlledMob.overlays-='TalkOverlay.dmi'
			if(is_ooc(msg)) progress_activity = max(progress_activity-1,0)
			else
				if(progress_activity < 4) progress_activity += 1

				for(var/mob/M in hearers(15, src))
					if(M.progress_target && M.progress_target.learning_from == ckey)
						if(M.teacher_activity < 24) M.teacher_activity += 2
					else if(progress_target && M.progress_target)
						if(progress_target.name == M.progress_target.name)
							if(M.teacher_activity < 24) M.teacher_activity += 2
			for(var/mob/M in world)
				if(M.Admin >= 4) M << output("<a href=?src=\ref[M];action=Options;mob=[ControlledMob.ckey]>Options</a>-<b><span style=\"color:[ControlledMob.SayFont]\">[ControlledMob] ([ControlledMob.strangerName]) yells:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]","rpspy.output")
			for(var/mob/M in hearers(17,ControlledMob))
				if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) continue
				if(M.MindAfflicted)
					M.MindAfflicted << output("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.MindAfflicted.getStrangerName(ControlledMob)] yells:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]","outputic.output")
					M.MindAfflicted << output("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.MindAfflicted.getStrangerName(ControlledMob)] yells:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]","outputall.output")
					M.MindAfflicted.ChatLog("<font color=green>*[ControlledMob.name] ([ControlledMob.strangerName]-[ControlledMob.key]) yells: [msg]")
					M.MindAfflicted.SelfLog("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.MindAfflicted.getStrangerName(ControlledMob)] yells:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]</font></font></font></span></span>")
				else
					M << output("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.getStrangerName(ControlledMob)] yells:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]","outputic.output")
					M << output("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.getStrangerName(ControlledMob)] yells:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]","outputall.output")
					M.ChatLog("<font color=green>*[ControlledMob.name] ([ControlledMob.strangerName]-[ControlledMob.key]) yells: [msg]")
					M.SelfLog("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.getStrangerName(ControlledMob)] yells:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]</font></font></font></span></span>")
			for(var/obj/Technology/Camera/C in view(20,ControlledMob)) C.appendToLog("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[ControlledMob.strangerName] yells.</b></font></span>")

			return
		if(findtext(msg,"?",length(msg),0))
			ControlledMob.overlays+='TalkOverlay.dmi'
			spawn(15) ControlledMob.overlays-='TalkOverlay.dmi'
			if(is_ooc(msg)) progress_activity = max(progress_activity-1,0)
			else
				if(progress_activity < 4) progress_activity += 1

				for(var/mob/M in hearers(15, src))
					if(M.progress_target && M.progress_target.learning_from == ckey)
						if(M.teacher_activity < 24) M.teacher_activity += 2
					else if(progress_target && M.progress_target)
						if(progress_target.name == M.progress_target.name)
							if(M.teacher_activity < 24) M.teacher_activity += 2
			for(var/mob/M in world)
				if(M.Admin >= 4) M << output("<a href=?src=\ref[M];action=Options;mob=[ControlledMob.ckey]>Options</a>-<b><span style=\"color:[ControlledMob.SayFont]\">[ControlledMob] ([ControlledMob.strangerName]) asks:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]","rpspy.output")
			for(var/mob/M in hearers(17,ControlledMob))
				if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) continue
				if(M.MindAfflicted)
					M.MindAfflicted << output("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.MindAfflicted.getStrangerName(ControlledMob)] asks:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]","outputic.output")
					M.MindAfflicted << output("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.MindAfflicted.getStrangerName(ControlledMob)] asks:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]","outputall.output")
					M.MindAfflicted.ChatLog("<font color=green>*[ControlledMob.name] ([ControlledMob.strangerName]-[ControlledMob.key]) asks: [msg]")
					M.MindAfflicted.SelfLog("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.MindAfflicted.getStrangerName(ControlledMob)] asks:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]</font></font></font></span></span>")
				else
					M << output("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.getStrangerName(ControlledMob)] asks:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]","outputic.output")
					M << output("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.getStrangerName(ControlledMob)] asks:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]","outputall.output")
					M.ChatLog("<font color=green>*[ControlledMob.name] ([ControlledMob.strangerName]-[ControlledMob.key]) asks: [msg]")
					M.SelfLog("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.getStrangerName(ControlledMob)] asks:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]</font></font></font></span></span>")
			for(var/obj/Technology/Camera/C in view(20,ControlledMob)) C.appendToLog("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[ControlledMob.strangerName] speaks.</b></font></span>")

			return
		ControlledMob.overlays+='TalkOverlay.dmi'
		spawn(15) ControlledMob.overlays-='TalkOverlay.dmi'
		if(is_ooc(msg)) progress_activity = max(progress_activity-1,0)
		else
			if(progress_activity < 4) progress_activity += 1

			for(var/mob/M in hearers(15, src))
				if(M.progress_target && M.progress_target.learning_from == ckey)
					if(M.teacher_activity < 24) M.teacher_activity += 2
				else if(progress_target && M.progress_target)
					if(progress_target.name == M.progress_target.name)
						if(M.teacher_activity < 24) M.teacher_activity += 2
		for(var/mob/M in hearers(15,ControlledMob))
			if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) continue
			if(M.MindAfflicted)
				M.MindAfflicted << output("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.MindAfflicted.getStrangerName(ControlledMob)] says:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]","outputic.output")
				M.MindAfflicted << output("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.MindAfflicted.getStrangerName(ControlledMob)] says:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]","outputall.output")
				M.MindAfflicted.ChatLog("<font color=green>*[ControlledMob.name]([ControlledMob.key]) says: [msg]")
				M.MindAfflicted.SelfLog("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.MindAfflicted.getStrangerName(ControlledMob)] says:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]</font></font></font></span></span>")
			else
				M << output("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.getStrangerName(ControlledMob)] says:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]","outputic.output")
				M << output("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.getStrangerName(ControlledMob)] says:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]","outputall.output")
				M.ChatLog("<font color=green>*[ControlledMob.name] ([ControlledMob.strangerName]-[ControlledMob.key]) says: [msg]")
				M.SelfLog("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[M.getStrangerName(ControlledMob)] says:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]</font></font></font></span></span>")
		for(var/obj/Technology/Camera/C in view(20,ControlledMob)) C.appendToLog("<font size=-3><b><span style=\"color:[ControlledMob.SayFont]\">[ControlledMob.strangerName] speaks.</b></font></span>")
		for(var/mob/M in world)
			if(M.Admin >= 4) M << output("<a href=?src=\ref[M];action=Options;mob=[ControlledMob.ckey]>Options</a>-<b><span style=\"color:[ControlledMob.SayFont]\">[ControlledMob] ([ControlledMob.strangerName]) says:</b><span style=\"color:[ControlledMob.SayFont]\"><font color = white> [html_encode(msg)]","rpspy.output")

	Help()
		src<<output("Type the following before your messages to:","outputic.output")
		src<<output("/t - Think","outputic.output")
		src<<output("/w - Whisper","outputic.output")
		src<<output("/r - Radio","outputic.output")
		src<<output("/s - Say","outputic.output")
		src<<output("/o - OOC","outputic.output")
		src<<output("Typing // before a roleplay with set it in third person narrative.","outputic.output")

		src<<output("Type the following before your messages to:","outputall.output")
		src<<output("/t - Think","outputall.output")
		src<<output("/w - Whisper","outputall.output")
		src<<output("/r - Radio","outputall.output")
		src<<output("/s - Say","outputall.output")
		src<<output("/o - OOC","outputall.output")
		src<<output("Typing // before a roleplay with set it in third person narrative.","outputall.output")
	Roleplay2(msg as message)
		set hidden=1
	Roll()
		var/mob/ControlledMob=src
		if(MindTransfer) ControlledMob=MindTransfer
		if(RecentVerbCheck("Roll", 15,1)) return
		recentverbs["Roll"]=world.realtime
		var/sidedd=input(usr,"Input number of sides.","Die",1) as num
		var/dice=rand(1,sidedd)


		for(var/mob/M in hearers(16,ControlledMob))
			if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) continue
			if(M.MindAfflicted)
				M.MindAfflicted << output("<font color=[ControlledMob.SayFont]>*[M.MindAfflicted.getStrangerName(ControlledMob)] has rolled a [dice] on a D[sidedd]!*","outputall.output")
				M.MindAfflicted << output("<font color=[ControlledMob.SayFont]>*[M.MindAfflicted.getStrangerName(ControlledMob)] has rolled a [dice] on a D[sidedd]!*","outputic.output")
			else
				M << output("<font color=[ControlledMob.SayFont]>*[M.getStrangerName(ControlledMob)] has rolled a [dice] on a D[sidedd]!*","outputall.output")
				M << output("<font color=[ControlledMob.SayFont]>*[M.getStrangerName(ControlledMob)] has rolled a [dice] on a D[sidedd]!*","outputic.output")

mob/var/PerkSpam=1
mob/var/InvisibleWho=0
mob/verb/Who()
	var/amount=0
	for(var/mob/m in world)
		if(m.client) amount++
	winset(usr,"wholist","is-visible=true")
	winset(usr,"wholist.grid","cells=0x0")
	var/Row = 1
	//usr << output("[amount + archive.fake_keys.len] player(s) online", "wholist.grid:1,1")
	usr << output("[amount] player(s) online", "wholist.grid:1,1")
	for(var/mob/M)
		if(M.client&&M.Admin!=5&&!M.InvisibleWho)
			Row++
			if(!usr.Admin) usr << output("[M.displaykey]","wholist.grid:1,[Row]")
			else usr << output("[M.displaykey] ([M.Oname])","wholist.grid:1,[Row]")

	/*for(var/f in archive.fake_keys)
		Row++
		usr << output("[f]","wholist.grid:1,[Row]")*/

mob/verb/wholistclose()
	set hidden = 1
	winset(usr,"wholist","is-visible=false")


/*
	Who+={"<html>
	<head><title></head></title><body>
	<body bgcolor="black"><font family='Verdana'><font size=-3><font color=#C0C0C0><b>
	<br><br>[amount] player(s) online
	</body><html>"}
	for(var/mob/M)
		if(M.client&&M.Admin!=5)
			if(src.Admin)
				Who+={"<html>
<body bgcolor="black"><font family='Verdana'><font size=-3><font color="#0099FF"><b>
<br><font color=white>[M.name] ([M.displaykey])
</body><html>"}
			else
				Who+={"<html>
<body bgcolor="black"><font family='Verdana'><font size=-3><font color="#0099FF"><b>
<br><font color=white>[M.displaykey]
</body><html>"}
	winset(usr,"Who","is-visible=true")
	usr<<output("[Who]","Who.WhoOut")
	Who={"<html>
<body bgcolor="black"><font family='Verdana'><font size=-3><font color="#0099FF"><b>
</body><html>"}*/