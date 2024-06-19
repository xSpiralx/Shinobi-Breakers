

/mob/verb/Surrender()
	set category = "Combat"
	var/verify = input("Are you sure?") in list ("Yes","No")
	if(verify == "Yes")
		if(z == 15)
			for(var/mob/M in world)
				M << "[ckey] tried to kill themself for extra Ryo in the spawn!"
			return
		if(!KO)
			Health = -1
			Ko()
	else return

/mob/proc/show_message(msg, range = 16)
	for(var/mob/M in hearers(range, src))
		if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) continue
		if(M.MindAfflicted)
			M.MindAfflicted << output(msg, "outputall.output")
		else
			M << output(msg, "outputall.output")
			M.ChatLog(msg)

/mob/verb/Ping()
	var/list/mobs = list()
	for(var/mob/M in oview())
		if(M.client) mobs+=src.getStrangerNameNoHTML(M)
	var/name = input("Ping who?") in mobs+"Cancel"
	if(name=="Cancel") return
	var/mob/M
	for(var/mob/character in oview())
		if(name == src.getStrangerNameNoHTML(character))
			M = character
	if(!M.client) return

	if(istype(M,/mob/Clone/))
		var/mob/owner
		for(var/mob/X in world)
			if(X.ckey == M:Owner) owner=X
		winset(owner, "default", "flash=1")
		owner << output("[owner.getStrangerName(src)] has pinged [M].", "outputall.output")
	else
		winset(M, "default", "flash=1")
		M << output("[M.getStrangerName(src)] has pinged you.", "outputall.output")

/mob/verb/beep(msg as text)
	set hidden = 1
	src << 'menubeep.wav'

/mob/verb/Whisper(msg as text)
	set hidden = 1
	Say("/w [msg]")

/mob/verb/Shout(msg as text)
	set hidden = 1
	Say("[msg]!")

/mob/verb/Think(msg as text)
	set hidden = 1
	Say("/t [msg]")

/mob/verb/Relayer_Hair()
	for(var/i in hair_stack)
		overlays -= i
	for(var/i in hair_stack)
		overlays += i
	src << output("Hair relayered!", "outputall.output")

/mob/verb/Scene()
	set hidden=1
	var/choice=input("This verb allows you to allows you to set the window size for a more dynamic view of the game world. 32x32 is the default option.") in list("8x8","16x16","32x32","48x48","64x64","70x70","96x96","112x112","128x128","Stretch to fit")
	if(choice=="8x8")
		winset(src,"mappane.map", "icon-size=8")
	if(choice=="16x16")
		winset(src,"mappane.map", "icon-size=16")
	if(choice=="32x32")
		winset(src,"mappane.map", "icon-size=32")
	if(choice=="48x48")
		winset(src,"mappane.map", "icon-size=48")
	if(choice=="64x64")
		winset(src,"mappane.map", "icon-size=64")
	if(choice=="70x70")
		winset(src,"mappane.map", "icon-size=70")
	if(choice=="96x96")
		winset(src,"mappane.map", "icon-size=96")
	if(choice=="112x112")
		winset(src,"mappane.map", "icon-size=112")
	if(choice=="128x128")
		winset(src,"mappane.map", "icon-size=128")
	if(choice=="Stretch to fit")
		winset(src,"mappane.map", "icon-size=0")
/*
/mob/verb/Do()
	set hidden = 1
	var/mob/ControlledMob=src
	if(MindAfflicted)
		src<<output("You can't seem to control your own body!","outputall.output")
		return
	if(Yamanaka&&MindTransfer)
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
	var/msg=input("Type your message.","Message") as message
	if(!msg)
//			winset(src,"skinputbig","is-visible=false")
		ControlledMob.overlays -= 'Bubble.dmi'
		return
	if(msg)
		//usr.record_log(msg,usr)
		for(var/mob/M in hearers(13,ControlledMob))
			M << output("<font color = white><font color=[ControlledMob.SayFont]>[html_encode(msg)]\n([ControlledMob])<font color = white>","outputall.output")
			M << output("<font color = white><font color=[ControlledMob.SayFont]>[html_encode(msg)]\n([ControlledMob])<font color = white>","outputic.output")
			M.ChatLog("<font color=yellow>*[msg]<br>[ControlledMob.name]([ControlledMob.key])*")
		ControlledMob.overlays -= 'Bubble.dmi'
		for(var/mob/M in world)
			if(M.Admin)
				M << output("<a href=?ControlledMob=\ref[M];action=Reward;mob=[ControlledMob.ckey]>Reward</a>-<font color = white><font color=[ControlledMob.SayFont]>[html_encode(msg)]\n([ControlledMob])<font color = white>","rpspy.output")
	progress_activity = 4
	for(var/mob/M in hearers(15, src))
		if(M.progress_target && M.progress_target.learning_from == ckey)
			M.teacher_activity = 24
		else if(progress_target && M.progress_target)
			if(progress_target.name == M.progress_target.name)
				M.teacher_activity = 24
*/