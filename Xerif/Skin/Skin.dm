mob/verb/resized()
	set hidden = 1
	if(!client) return
	var/size = winget(src, "mappane", "size")
	if(!client) return
	var/width = text2num(copytext(size, 1, findtext(size, "x", 1, length(size) + 1)))
	var/height = text2num(copytext(size, findtext(size, "x", 1, length(size) + 1) + 1, length(size) + 1))
	client.view = "[round(width/32) + 1]x[round(height/32) + 1]"
	if(jutsu_box)
		jutsu_box.center(src)
	if(character_box)
		character_box.center(src)
	if(progress_box)
		progress_box.center(src)
	if(appearance_box)
		appearance_box.center(src)

mob/verb/closeProfile()
	set hidden=1
	src<<browse(null,"window=Profile.ProfileBrowse")
	winshow(src,"Profile",0)

mob/proc/get_client_height()
	var/size = client.view
	if(isnum(size))
		return size
	var/height = text2num(copytext(size, findtext(size, "x", 1, length(size) + 1) + 1, length(size) + 1))
	return height

mob/proc/get_client_width()
	var/size = client.view
	if(isnum(size))
		return size
	var/width = text2num(copytext(size, 1, findtext(size, "x", 1, length(size) + 1)))
	return width

mob/proc/load_resources()
	return
	for(var/msg in archive.button_icons)
		src << browse_rsc(archive.button_icons["[msg]"], "header_[archive.button_icons.Find(msg)].png")
		alert("header_[archive.button_icons.Find(msg)].png")
	/*src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103862633754538054/t16Wq33.png')
	src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103870364687282259/RvFWirq.png')
	src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103869893419466812/AX1y6fP.png')
	src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103863769685299220/dDPW7kj.png')
	src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103863286103015475/YOa0JM2.png')
	src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103870049049137252/8kdE5R5.png')
	src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103864342396547193/XxJeBgO.png')
	src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103863985834574004/oevFD3i.png')
	src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103870207589625906/symJgGW.png')
	src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1104817183223193750/buttoncommand1.png')
	src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1104819643367047218/buttoncommand2.png')
	src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103865111325720616/2IXKYxK.png')
	src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103866299186155530/7cDFkNt.png')
	src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103865713711661076/Ag5KRlk.png')
	src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103866524088938587/3VQF8ae.png')
	src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103866101730902117/kSE67VZ.png')
	src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103865908079898737/WOtHu88.png')
	src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103870903978299462/j8gjnWQ.png')
	src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103871098887614595/Z90kvrU.png')
	src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103871248850751498/lm7gV3W.png')
	src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103871392530833438/DCUPKXY.png')
	sleep()*/

mob/proc/skin_show_tabs()
	//src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103862633754538054/t16Wq33.png')
	//src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103870364687282259/RvFWirq.png')
	//src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103869893419466812/AX1y6fP.png')
	//src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103863769685299220/dDPW7kj.png')
	//src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103863286103015475/YOa0JM2.png')
	//src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103870049049137252/8kdE5R5.png')
	//src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103864342396547193/XxJeBgO.png')
	//src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103863985834574004/oevFD3i.png')
	//src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103870207589625906/symJgGW.png')
	src << output("[skin_tab["html"]][skin_tab["alltab"]]</body><html>", "chat.tabs")



mob/proc/skin_show_input()
	//src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1104817183223193750/buttoncommand1.png')
	//src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1104819643367047218/buttoncommand2.png')
	//src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103865111325720616/2IXKYxK.png')
	//src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103866299186155530/7cDFkNt.png')
	//src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103865713711661076/Ag5KRlk.png')
	//src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103866524088938587/3VQF8ae.png')
	//src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103866101730902117/kSE67VZ.png')
	//src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103865908079898737/WOtHu88.png')
	src << output("[skin_tab["html"]][skin_input["buttoncommand"]]</body><html>", "chat.input")

mob/proc/button_show_input()
	var/html = {"
	<html>
	<style>
	html, body, img { margin:0px; padding:0px; overflow:hidden; cursor:pointer; }
	</style>
	<body>
	"}

	//src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103870903978299462/j8gjnWQ.png')
	//src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103871098887614595/Z90kvrU.png')
	//src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103871248850751498/lm7gV3W.png')
	//src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103871392530833438/DCUPKXY.png')
	//src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103871595212185731/NzpBZSL.png')
	//src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103873364843581440/bigyes2.png')
	//src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103871997978615828/bigno1.png')
	//src << browse_rsc('https://media.discordapp.net/attachments/429419579203387402/1103872357476606012/bigno2.png')
	src << output("[html]<img style='position:absolute; left:0px; top:0px;' src='https://i.postimg.cc/MKMbr0cF/confirmbutton1.png' onmouseover=this.src='https://i.postimg.cc/MKMbr0cF/confirmbutton1.png' onmouseout=this.src='https://i.postimg.cc/MKMbr0cF/confirmbutton1.png' onclick=window.location='byond://?value=inputconfirm'></body><html>", "alert4.button")
	src << output("[html]<img style='position:absolute; left:0px; top:0px;' src='https://i.postimg.cc/MKMbr0cF/confirmbutton1.png' onmouseover=this.src='https://i.postimg.cc/MKMbr0cF/confirmbutton1.png' onmouseout=this.src='https://i.postimg.cc/MKMbr0cF/confirmbutton1.png' onclick=window.location='byond://?value=alertconfirm'></body><html>", "alert.button")
	src << output("[html]<img style='position:absolute; left:0px; top:0px;' src='https://i.postimg.cc/MKMbr0cF/confirmbutton1.png' onmouseover=this.src='https://i.postimg.cc/MKMbr0cF/confirmbutton1.png' onmouseout=this.src='https://i.postimg.cc/MKMbr0cF/confirmbutton1.png' onclick=window.location='byond://?value=alertconfirm'></body><html>", "alert_html.button")

	//src << output("[html]<img style='position:absolute; left:0px; top:0px;' src=https://media.discordapp.net/attachments/429419579203387402/1103871595212185731/NzpBZSL.png onmouseover=this.src='https://media.discordapp.net/attachments/429419579203387402/1103873364843581440/bigyes2.png' onmouseout=this.src='https://media.discordapp.net/attachments/429419579203387402/1103871595212185731/NzpBZSL.png' onclick=window.location='byond://?value=alertyes'></body><html>", "bigalert1.buttonyes")
	//src << output("[html]<img style='position:absolute; left:0px; top:0px;' src=https://media.discordapp.net/attachments/429419579203387402/1103871997978615828/bigno1.png onmouseover=this.src='https://media.discordapp.net/attachments/429419579203387402/1103872357476606012/bigno2.png' onmouseout=this.src='https://media.discordapp.net/attachments/429419579203387402/1103871997978615828/bigno1.png' onclick=window.location='byond://?value=alertno'></body><html>", "bigalert1.buttonno")





var/skin_tab = list(
"html" = {"
<html>
<style>
html, body, img { margin:0px; padding:0px; overflow:hidden; }
</style>
<script type="text/javascript">
function replace(v) {
  document.body.innerHTML = v; }
</script>
<body>
"},

"alltab" = {"
<img style='cursor:default; position:absolute; left:0px; top:0px;' src="https://i.postimg.cc/vB2tBT5Q/toptab1.png" alt="Test">
<img style='cursor:pointer; position:absolute; left:77px; top:1px;' src="https://media.discordapp.net/attachments/429419579203387402/1103863769685299220/dDPW7kj.png" onmouseover=this.src='https://media.discordapp.net/attachments/429419579203387402/1103863286103015475/YOa0JM2.png' onmouseout=this.src='https://media.discordapp.net/attachments/429419579203387402/1103863769685299220/dDPW7kj.png' onclick=window.location='byond://?value=ictab'>
<img style='cursor:pointer; position:absolute; left:152px; top:1px;' src=https://media.discordapp.net/attachments/429419579203387402/1103864342396547193/XxJeBgO.png onmouseover=this.src='https://media.discordapp.net/attachments/429419579203387402/1103863985834574004/oevFD3i.png' onmouseout=this.src='https://media.discordapp.net/attachments/429419579203387402/1103873566702837871/WkPEfNa.png' onclick=window.location='byond://?value=ooctab'>
"},

"ictab" = {"
<img style='cursor:default; position:absolute; left:0px; top:0px;' src=https://i.postimg.cc/gjYfTD86/buttonic1.png>
<img style='cursor:pointer; position:absolute; left:1px; top:1px;' src=https://i.postimg.cc/gjYfTD86/buttonic1.png onmouseover=this.src='https://i.postimg.cc/gjYfTD86/buttonic1.png' onmouseout=this.src='https://i.postimg.cc/gjYfTD86/buttonic1.png' onclick=window.location='byond://?value=alltab'>
<img style='cursor:pointer; position:absolute; left:152px; top:1px;' src=https://i.postimg.cc/gjYfTD86/buttonic1.png onmouseover=this.src='https://i.postimg.cc/gjYfTD86/buttonic1.png' onmouseout=this.src='https://i.postimg.cc/gjYfTD86/buttonic1.png' onclick=window.location='byond://?value=ooctab'>
"},

"ooctab" = {"
<img style='cursor:default; position:absolute; left:0px; top:0px;' src=https://i.postimg.cc/vB2tBT5Q/toptab1.png>
<img style='cursor:pointer; position:absolute; left:77px; top:1px;' src=https://cdn.discordapp.com/attachments/429419579203387402/1103859800514773062/dDPW7kj.png onmouseover=this.src='https://media.discordapp.net/attachments/429419579203387402/1103861966927310848/YOa0JM2.png' onmouseout=this.src='https://media.discordapp.net/attachments/429419579203387402/1103862142886744154/dDPW7kj.png' onclick=window.location='byond://?value=ictab'>
<img style='cursor:pointer; position:absolute; left:1px; top:1px;' src=https://media.discordapp.net/attachments/429419579203387402/1103861488973791274/t16Wq33.png onmouseover=this.src='https://media.discordapp.net/attachments/429419579203387402/1103861249932009502/RvFWirq.png' onmouseout=this.src='https://media.discordapp.net/attachments/429419579203387402/1103862302853320805/t16Wq33.png' onclick=window.location='byond://?value=alltab'>
"},

"current" = "alltab")




var/skin_input = list(
"html" = {"
<html>
<style>
html, body, img { margin:0px; padding:0px; overflow:hidden; }
</style>
<script type="text/javascript">
function replace(v) {
  document.body.innerHTML = v; }
</script>
<body>
"},

"buttoncommand" = {"
<img style='cursor:pointer; position:absolute; left:0px; top:0px;'
     src='https://i.postimg.cc/HW63zJQz/buttoncommand1-2.png'
     onmouseover=\"this.src='https://i.postimg.cc/HW63zJQz/buttoncommand1-2.png'\"
     onmouseout=\"this.src='https://i.postimg.cc/HW63zJQz/buttoncommand1-2.png'\"
     onclick=\"window.location='byond://?value=buttonsay'\">
"},

"buttonsay" = {"
<img style='cursor:pointer; position:absolute; left:0px; top:0px;' src=https://i.postimg.cc/fbVYQtY2/buttonsay1.png onmouseover=this.src='https://i.postimg.cc/fbVYQtY2/buttonsay1.png' onmouseout=this.src='https://i.postimg.cc/fbVYQtY2/buttonsay1.png' onclick=window.location='byond://?value=buttonroleplay'>
"},

"buttonroleplay" = {"
<img style='cursor:pointer; position:absolute; left:0px; top:0px;' src=https://media.discordapp.net/attachments/429419579203387402/1103865713711661076/Ag5KRlk.png onmouseover=this.src='https://media.discordapp.net/attachments/429419579203387402/1103866524088938587/3VQF8ae.png' onmouseout=this.src='https://media.discordapp.net/attachments/429419579203387402/1103865713711661076/Ag5KRlk.png' onclick=window.location='byond://?value=buttonwhisper'>
"},

"buttonwhisper" = {"
<img style='cursor:pointer; position:absolute; left:0px; top:0px;' src=https://media.discordapp.net/attachments/429419579203387402/1103866101730902117/kSE67VZ.png onmouseover=this.src='https://media.discordapp.net/attachments/429419579203387402/1103865908079898737/WOtHu88.png' onmouseout=this.src='https://media.discordapp.net/attachments/429419579203387402/1103866101730902117/kSE67VZ.png' onclick=window.location='byond://?value=buttoncommand'>
"},

"current" = "buttoncommand")