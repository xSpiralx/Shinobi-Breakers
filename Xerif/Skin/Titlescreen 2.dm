/mob/proc/title_screen()
	winset(src, "default", "is-maximized=false")
	winset(src, "default", "size=640x480")
	winset(src,"default.child", "left='titlescreen'")
	src << output(title_screen_html, "titlescreen.browser")
	load_resources()

	spawn(1)
		//custom_bigalert1(nara_clan_info, "The Nara Clan is known for their intelligence, and special ninjutsu that entails the manipulation of shadows through the use of Yin Release.", 'clan_nara.png', "Would you like to be born as a member of the Nara clan?")
		Start()

/mob/proc/transition_screens()
	winset(src,"default", "can-resize=true")
	winset(src,"default", "is-maximized=true")
	winset(src,"default.child", "left='mainscreen'")
	//winset(src,"mappane.map", "focus=true")

/mob/proc/start_alert(var/list/grid_list, title = "Alert")

	if(!client) return
	var/pos = winget(src, "default.screenlabel", "size")
	if(!client) return
	var/xx = text2num(copytext(pos, 1, findtext(pos, "x", 1, length(pos) + 1)))
	var/yy = text2num(copytext(pos, findtext(pos, "x", 1, length(pos) + 1) + 1, length(pos) + 1))

	//construct_header(title)
	src << output("[skin_tab["html"]]<img src=[get_header(title)]></body><html>", "start_alert.header")

	winset(src, "start_alert", "pos=[(xx/2) - 115],[(yy/2) - 130]")

	winset(src, "start_alert", "size=227x[min((20 * grid_list.len) + 60, 350)]")
	winset(src, "start_alert.grid", "cells=1x[grid_list.len]")
	winset(src, "start_alert.grid", {"style="body {color:#FFFDCA;}""})
	winset(src, "titlescreen.child", "left='start_alert'")

	var/row = 1
	for(var/t in grid_list)
		var/obj/grid_object2/g = new(src)
		g.name = t
		g.real_name = t
		g.row = row
		src << output(g, "start_alert.grid:[row]")
		row++

	winshow(src, "start_alert", 1)
	alert_answer = null
	while(!alert_answer)
		sleep(1)
	for(var/obj/grid_object2/g in src)
		del(g)
	winset(src, "titlescreen.child", "left='greybox'")
	grid_objects = list()
	winshow(src, "start_alert", 0)
	return alert_answer

/obj/grid_object2
	mouse_over_pointer = MOUSE_HAND_POINTER
	var/real_name
	var/row

	MouseEntered()
		winset(usr, "start_alert.grid", {"style="body {color:#E9C80D;}""})
		usr << output(src, "start_alert.grid:1,[row]")

	MouseExited()
		winset(usr, "start_alert.grid", {"style="body {color:#FFFDCA;}""})
		usr << output(src, "start_alert.grid:1,[row]")

	Click()
		usr.beep()
		usr.alert_answer = real_name



/var/title_screen_html = {"
<html>

<head>

<style>
html { margin:0px; padding:0px; overflow:hidden; -ms-overflow-style:none; z-index:1 }
embed, object { position:absolute; left:0px; top:10%; z-index:1 }
.overlay { position:absolute; left:1px; top:1; height:100%; width:100%; z-index:3; background-color:white; opacity:0.01; }
.fadeoverlay { position:absolute; left:0px; top:0; height:100%; width:100%; z-index:4; background-color:black; opacity:1; }
</style>
</head>

<body onload="fadeOut(document.getElementById('fading'))">

<script type="text/javascript">

function fadeOut(el) {
    var i = 2;
    var timer = setInterval(function () {
        if (i <= 0.01){
            clearInterval(timer);
            el.style.opacity = 0.01;
            el.style.filter = 'alpha(opacity=' + 0.01 * 100 + ")";
        }
        if(i < 1) {
            el.style.opacity = i;
            el.style.filter = 'alpha(opacity=' + i * 100 + ")";
        }
        i -= 0.1;
    }, 100);
}

</script>

<div class="fadeoverlay" id="fading"> </div>

<div class="shuttertop"> </div>
<center>

<iframe width="100%" height="100%"
src="https://youtu.be/H2Pt7iNvVNc?autoplay=1">
</iframe>

</center>

<div class="shutterbottom"> </div>
</body>
</html>
"}

//<embed width="100%" height="100%" wmode="transparent" allowfullscreen="true" type="application/x-shockwave-flash" src="http://www.youtube.com/v/[archive.title_video]&autoplay=1&loop=1&playlist=[archive.title_video]"></embed>
