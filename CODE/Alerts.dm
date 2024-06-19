client/Topic(href, list/href_list)
	var/value = href_list["value"] // get the association of the element, "value"

	if(value in list("alltab", "ictab", "ooctab"))
		if(skin_tab["current"] != value)
			skin_tab["current"] = value
			var/text = skin_tab[skin_tab["current"]]
			src << output(list2params(list(text)), "mainscreen.tabs:replace")
			switch(value)
				if("alltab")
					winset(src, "chat.output", "left=outputall")
				if("ictab")
					winset(src, "chat.output", "left=outputic")
				if("ooctab")
					winset(src, "chat.output", "left=outputoocsay")
			return




	if(value in list("buttoncommand", "buttonsay", "buttonroleplay", "buttonwhisper"))
		if(skin_input["current"] != value)
			skin_input["current"] = value
			var/text = skin_input[skin_input["current"]]
			src << output(list2params(list(text)), "chat.input:replace")
			switch(value)
				if("buttoncommand")
					winset(src, "chat.inputbar", "command=''")
				if("buttonsay")
					winset(src, "chat.inputbar", "command='say'")
				if("buttonroleplay")
					winset(src, "chat.inputbar", "command='roleplay'")
				if("buttonwhisper")
					winset(src, "chat.inputbar", "command='whisper'")
			return

	switch(value)
		if("alertconfirm")
			mob.alert_close()
			return

		if("inputconfirm")
			mob.input_close()
			return

		//if("alertyes")
		//	mob.alert_answer = "yes"
		//	return

		//if("alertno")
		//	mob.alert_answer = "no"
		//	return

	mob.databook(href)

	.=..()

mob/var/tmp/LoginScreen=0
mob/verb/OutputColor()
	set hidden=1
	var/R
	var/G
	var/B
	R=text2num(winget(src,"ColorWindow.RedBar","Value"))*2.55
	G=text2num(winget(src,"ColorWindow.GreenBar","Value"))*2.55
	B=text2num(winget(src,"ColorWindow.BlueBar","Value"))*2.55
	winset(src,"ColorWindow.R","text=\"[round(R)]\"")
	winset(src,"ColorWindow.G","text=\"[round(G)]\"")
	winset(src,"ColorWindow.B","text=\"[round(B)]\"")
	spawn()
		var/icon/I = new('Misc Effects.dmi', "Black")
		I.Blend(rgb(R,G,B),ICON_ADD)
		var/iconfile = fcopy_rsc(I)
		winset(src, "ColorWindow.Picture", "image=\ref[iconfile]")
		del(I)
mob/verb/OutputColorRed(var/numb as text)
	set hidden=1
	numb=text2num(numb)/2.55
	winset(src,"ColorWindow.RedBar","Value=[numb]")
	var/R=text2num(winget(src,"ColorWindow.R","text"))
	var/G=text2num(winget(src,"ColorWindow.G","text"))
	var/B=text2num(winget(src,"ColorWindow.B","text"))
	winset(src,"ColorWindow.GreenBar","Value=[G/2.55]")
	winset(src,"ColorWindow.BlueBar","Value=[B/2.55]")
	spawn()
		var/icon/I = new('Misc Effects.dmi', "Black")
		I.Blend(rgb(R,G,B),ICON_ADD)
		var/iconfile = fcopy_rsc(I)
		winset(src, "ColorWindow.Picture", "image=\ref[iconfile]")
		del(I)
mob/verb/OutputColorGreen(var/numb as text)
	set hidden=1
	numb=text2num(numb)/2.55
	winset(src,"ColorWindow.GreenBar","Value=[numb]")
	var/R=text2num(winget(src,"ColorWindow.R","text"))
	var/G=text2num(winget(src,"ColorWindow.G","text"))
	var/B=text2num(winget(src,"ColorWindow.B","text"))
	winset(src,"ColorWindow.RedBar","Value=[R/2.55]")
	winset(src,"ColorWindow.BlueBar","Value=[B/2.55]")
	spawn()
		var/icon/I = new('Misc Effects.dmi', "Black")
		I.Blend(rgb(R,G,B),ICON_ADD)
		var/iconfile = fcopy_rsc(I)
		winset(src, "ColorWindow.Picture", "image=\ref[iconfile]")
		del(I)
mob/verb/OutputColorBlue(var/numb as text)
	set hidden=1
	numb=text2num(numb)/2.55
	winset(src,"ColorWindow.BlueBar","Value=[numb]")
	var/R=text2num(winget(src,"ColorWindow.R","text"))
	var/G=text2num(winget(src,"ColorWindow.G","text"))
	var/B=text2num(winget(src,"ColorWindow.B","text"))
	winset(src,"ColorWindow.RedBar","Value=[R/2.55]")
	winset(src,"ColorWindow.GreenBar","Value=[G/2.55]")
	spawn()
		var/icon/I = new('Misc Effects.dmi', "Black")
		I.Blend(rgb(R,G,B),ICON_ADD)
		var/iconfile = fcopy_rsc(I)
		winset(src, "ColorWindow.Picture", "image=\ref[iconfile]")
		del(I)
client/Command(T)
	..()
	if(!mob||!mob.prompt||!src) return
	if(findtextEx(T,".skalert",1,9))
		if(!mob.prompt) mob.prompt = new /Skalert
		var/POS = findtextEx(T," ")
		if(mob.prompt) mob.prompt.answer = text2num(copytext(T,POS++))
	if(findtextEx(T,".skinput",1,12)&&mob.prompt)
		if(!mob.prompt) mob.prompt = new /Skalert
		var/POS = findtextEx(T," ")
		if(mob.prompt) mob.prompt.answer = text2num(copytext(T,POS++))
	if(findtextEx(T,".skinputbar",1,12))
		if(!mob.prompt) mob.prompt = new /Skalert
		if(length(winget(src,"skinput22.skinputbar","text")) == 0) return
		if(mob.prompt&&!isnull(mob.prompt)&&src&&mob)
			mob.prompt.answer = winget(src,"skinput22.skinputbar","text")
		winset(src,"skinput22.skinputbar","text=\"\"")

		//.skinputbarbig 1
	if(findtextEx(T,".skinputbat",1,12))
		if(!mob.prompt) mob.prompt = new /Skalert
		if(length(winget(src,"skinputbig.skinputbar","text")) == 0) return
		if(mob.prompt&&!isnull(mob.prompt)&&src&&mob)
			mob.prompt.answer = winget(src,"skinputbig.skinputbar","text")
		winset(src,"skinputbig.skinputbar","text=\"\"")
	if(findtextEx(T,".colorinput",1,12))
		if(!mob.prompt) mob.prompt = new /Skalert
		var/R
		var/G
		var/B
		R=text2num(winget(usr,"ColorWindow.RedBar","Value"))*2.55
		G=text2num(winget(usr,"ColorWindow.GreenBar","Value"))*2.55
		B=text2num(winget(usr,"ColorWindow.BlueBar","Value"))*2.55
		if(mob.prompt) mob.prompt.answer = rgb(R,G,B)

	if(findtextEx(T,".colorinputwheel",1,12))
		var/i = input(mob,"Choose a color") as color
		if(!mob.prompt) mob.prompt = new /Skalert
		if(mob.prompt) mob.prompt.answer = i
Skalert
	var/answer
mob/var/tmp/Skalert/prompt
mob/proc/GET_ANSWERCOLOR()
	while(prompt&&src) sleep(10)
	if(src) prompt = new /Skalert
	while(!prompt.answer&&src) sleep(10)
	var/X = prompt.answer
	if(src) del(prompt)
	if(src) return X




mob/proc/GET_ANSWER()
	while(prompt&&src) sleep(10)
	prompt = new /Skalert
	while(!prompt.answer&&src) sleep(10)
	var/X
	if(!prompt) return 0
	if(prompt.answer) X=prompt.answer
	del(prompt)
	return X
mob/Del()
	if(prompt) del(prompt)
	..()
mob/proc/skalert(prompt,title,answers[3])
//	if(winget(src,"skalert","is-visible")=="true")
//		src<<output("Please close your other open windows before proceeding.","outputic.output")
//		return
	if(!client) return
	//if(src.prompt)
	//	src<<output("<font size = -3>Please close your other windows before using another.","outputic.output")
	//	src<<output("<font size = -3>Please close your other windows before using another.","outputall.output")
	//	return
	if(!answers) answers = new/list
	if(!answers.len)
		answers.len = 1
		answers[1] = "Ok"
	if(answers.len > 3) answers.len = 3
	if(answers.len == 1)
		for(var/X in 2 to 3)
			winset(src,"skalert[X]","is-visible=false")
		winset(src,"skalert1","is-visible=true")
		winset(src,"skalert1","text=\"[answers[1]]\"")
	if(answers.len == 3)
		for(var/X in 1 to 3)
			winset(src,"skalert[X]","is-visible=true")
			winset(src,"skalert[X]","text=\"[answers[X]]\"")
	if(answers.len == 2)
		for(var/X in 2 to 3)
			winset(src,"skalert[X]","is-visible=true")
			winset(src,"skalert[X]","text=\"[answers[X-1]]\"")
		winset(src,"skalert1","is-visible=false")
		answers = list(null,answers[1],answers[2])
	src << output(null,"skalert_out")
	src << output(prompt,"skalert_out")
	winset(src,"skalert","title=\"[title]\"")
	winset(src,"skalert","is-visible=true")
	if(src&&src.client)
		if(!answers.len) return
		var/ANSWER = answers[src.GET_ANSWER()]
		if(src&&src.client) winset(src,"skalert","is-visible=false")
		return ANSWER
mob/proc/skinput(prompt,title,answers[12])
//	if(winget(src,"skinput","is-visible")=="true")
//		src<<output("Please close your other open windows before proceeding.","outputic.output")
//		return
	if(!client) return
	//if(src.prompt)
	//	src<<output("<font size = -3>Please close your other windows before using another.","outputic.output")
	//	src<<output("<font size = -3>Please close your other windows before using another.","outputall.output")
	//	return
	if(!answers) answers = new/list
	if(!answers.len)
		answers.len = 1
		answers[1] = "Ok"
	if(answers.len > 12) answers.len = 12
	for(var/X in 1 to 12)
		winset(src,"skinput.skinput[X]","is-visible=false")
	for(var/X in 1 to answers.len)
		winset(src,"skinput.skinput[X]","is-visible=true")
		winset(src,"skinput.skinput[X]","text=\"[answers[X]]\"")
	src << output(null,"skinput_out")
	src << output(prompt,"skinput_out")
	winset(src,"skinput","title=\"[title]\"")
	winset(src,"skinput","is-visible=true")
	var/ANSWER = answers[src.GET_ANSWER()]
	winset(src,"skinput","is-visible=false")
	if(ANSWER) return ANSWER
mob/proc/skinput2(prompt,title,initial,Number)
	if(!client) return
	//if(src.prompt)
	//	src<<output("<font size = -3>Please close your other windows before using another.","outputic.output")
	//	src<<output("<font size = -3>Please close your other windows before using another.","outputall.output")
	//	return
	src << output(null,"skinput22.skinput2_out")
	src << output(prompt,"skinput22.skinput2_out")
	if(initial) winset(src,"skinput22.skinputbar","text=\"[initial]\"")
	winset(src,"skinput22","title=\"[title]\"")
	winset(src,"skinput22","is-visible=true")
	var/ANSWER=src.GET_ANSWER()
	winset(src,"skinput22","is-visible=false")
	if(Number&&ANSWER)return text2num(ANSWER)
	if(ANSWER) return ANSWER
mob/proc/skinputbig(prompt,title,initial,Number)
//	if(winget(src,"skinputbig","is-visible")=="true")
//		src<<output("Please close your other open windows before proceeding.","outputic.output")
//		return
	if(!client) return
	//if(src.prompt)
	//	src<<output("<font size = -3>Please close your other windows before using another.","outputic.output")
	//	src<<output("<font size = -3>Please close your other windows before using another.","outputall.output")
	//	return
	src << output(null,"skinputbig.skinput2_out")
	src << output(prompt,"skinputbig.skinput2_out")
	if(initial) winset(src,"skinputbig.skinputbar","text=\"[initial]\"")
	winset(src,"skinputbig","title=\"[title]\"")
	winset(src,"skinputbig","is-visible=true")
	var/ANSWER=src.GET_ANSWER()
	winset(src,"skinputbig","is-visible=false")
	if(Number&&ANSWER)return text2num(ANSWER)
	if(ANSWER) return ANSWER
mob/proc/ColorInput(prompt)
	if(!client) return
	var/i = input(src,"Choose your color") as color
	return i
	/*
	winset(src,"ColorWindow.RedBar","Value=0")
	winset(src,"ColorWindow.GreenBar","Value=0")
	winset(src,"ColorWindow.BlueBar","Value=0")
	src << output(null,"ColorWindow.Prompt")
	src << output(prompt,"ColorWindow.Prompt")
	winset(src,"ColorWindow","is-visible=true")
	winset(src,"ColorWindow.R","text=\"0\"")
	winset(src,"ColorWindow.G","text=\"0\"")
	winset(src,"ColorWindow.B","text=\"0\"")
	var/ANSWER=src.GET_ANSWERCOLOR()
	winset(src,"ColorWindow","is-visible=false")
	return ANSWER*/
mob/var/tmp/list/CurrentGrid=list()
obj/Copy
	icon='checkbox.dmi'
	icon_state="unchecked"
	var/row
	MouseEntered(object,location,control,params)
		if(usr.CurrentGrid.Find(src))
			src.icon_state="checked"
			if(!usr.CurrentGrid.Find(src)) return
			usr << output(src,"yutput.grid:1,[row]")
	MouseExited(location,control,params)
		if(usr.CurrentGrid.Find(src))
			src.icon_state="unchecked"
			if(!usr.CurrentGrid.Find(src)) return
			usr << output(src,"yutput.grid:1,[row]")
	Click()
		if(usr.CurrentGrid.Find(src))
			usr.copy = src
			usr << output(null,"yutput.grid:1,[row]")
mob
	proc/CustomInput(title,message,inputs[],paths)
		if(!client) return
		if(!inputs) inputs = new/list
		if(!inputs.len)
			inputs.len = 1
			inputs[1] = "Broken!"
		winset(src,"yutput.title","text = '[title]'")
		src << output(null,"yutput.message")
		src << output("[message]","yutput.message")
		winset(src,"yutput.grid","cells=0x0")
		var/Row=1
		src << output(null,"yutput.grid")
		src << output("","yutput.grid:1,1")
		for(var/X in inputs)
			Row++
			var/obj/Copy/I=new
			I.name=X
			I.row=Row
			src.CurrentGrid+=I
			src << output(null,"yutput.grid:1,[Row]")
			src << output(I,"yutput.grid:1,[Row]")
			continue
		winset(src,"yutput","is-visible=true")
		src.copy = "waiting"
		while(src.copy=="waiting")
			sleep(4)
		var/C = src.copy
		src.copy=null
		src.CurrentGrid=list()
		winset(src,"yutput","is-visible=false")
		return C
mob/var/copy