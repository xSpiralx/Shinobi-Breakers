obj/jutsu
	var
		last_use
		perk_color
		perk_note
		bl=494
		bw=213

	proc/perk(mob/user)
		var/ultimate = 0
		if(world.realtime < last_use + 50) return
		if(copytext(desc,1,21)=="<font color=#FEF1B5>") ultimate=1

		last_use = world.realtime
		var/mob/controlMob = usr
		if(controlMob.MindTransfer) controlMob=controlMob.MindTransfer
		var Prompt = input("Do you want to publicly or privately flash?") in list ("View","Public","Private")

		if(Prompt == "View")
			//var/obj/jutsu/O = src
			//usr<<output(null,"Perk.Description")
			//usr<<output(null,"Perk.Name")
			//winset(usr,"Perk","is-visible=true")

			//var/icon/I = icon(O.icon,O.icon_state)
			//var/newPicture = fcopy_rsc(I)
			//winset(usr,"Perk.Picture","image=\ref[newPicture]")
			//winset(usr,"Perk.Name","text="[O.name]"")
			//winshow(usr,"Perk.Show",0)
			//usr<<output("[O.desc]<br>[O.perk_note]","Perk.Description")
			if(jutsu_type!="perk")
				bl=384
				bw=542
				usr<<browse(src.desc,"window=[src];size=[src.bl]x[src.bw]")
			else
				usr<<browse({"
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style>

a{
color:#DDBE0D;
}

body{
color:[src.perk_color];
background-color:#0b0f12;
font-family:calibri;
}
table, th, td {
  vertical-align: top;
  padding-left: 15px;
  font-size:13px;
}
.leftcolumn {
color:#DDBE0D;
}
</style>
</head>
<body>

<table style="width:100%">
  <tr>
    <td><div class=leftcolumn>Name</div></td>
    <td><b>[src.name]</b></td>
  </tr>
  <tr>
    <td><div class=leftcolumn>Desc</div></td>
    <td><font color=white>[src.desc]</font></td>
  </tr>
   <tr>
    <td><div class=leftcolumn>Note</div></td>
    <td><i>[src.perk_note]</i></td>
  </tr>
</table>
</body>
</html>

"},"window=[src];size=[src.bl]x[src.bw]")

		if(Prompt == "Public")
			for(var/mob/M in hearers(16,controlMob))
				if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) continue
				if(M.MindAfflicted)
					if(M.MindAfflicted.view_perk_desc)
						if(!ultimate)
							M.MindAfflicted << output("<font size=-2><font color=[controlMob.SayFont]>[M.MindAfflicted.getStrangerName(controlMob)] has activated a [jutsu_type != "perk" ? "technique" : "perk"]: <a href=?src=\ref[controlMob];action=Perk;perk=[md5(name)]>[name]</a>!</font>", "outputall.output")
							M.MindAfflicted << output("<font size=-2><font color=[controlMob.SayFont]>[M.MindAfflicted.getStrangerName(controlMob)] has activated a [jutsu_type != "perk" ? "technique" : "perk"]: <a href=?src=\ref[controlMob];action=Perk;perk=[md5(name)]>[name]</a>!</font>", "outputic.output")
						else
							M.MindAfflicted << output("<font size=3><i><b><font color=[controlMob.SayFont]>[M.MindAfflicted.getStrangerName(controlMob)] has activated an ultimate [jutsu_type != "perk" ? "technique" : "perk"]: <a href=?src=\ref[controlMob];action=Perk;perk=[md5(name)]>[name]</a>!</font></b></i>", "outputall.output")
							M.MindAfflicted << output("<font size=3><i><b><font color=[controlMob.SayFont]>[M.MindAfflicted.getStrangerName(controlMob)] has activated an ultimate [jutsu_type != "perk" ? "technique" : "perk"]: <a href=?src=\ref[controlMob];action=Perk;perk=[md5(name)]>[name]</a>!</font></b></i>", "outputic.output")
				else
					if(M.view_perk_desc)
						if(!ultimate)
							M << output("<font size=-2><font color=[controlMob.SayFont]>[M.getStrangerName(controlMob)] has activated a [jutsu_type != "perk" ? "technique" : "perk"]: <a href=?src=\ref[controlMob];action=Perk;perk=[md5(name)]>[name]</a>!</font>", "outputall.output")
							M << output("<font size=-2><font color=[controlMob.SayFont]>[M.getStrangerName(controlMob)] has activated a [jutsu_type != "perk" ? "technique" : "perk"]: <a href=?src=\ref[controlMob];action=Perk;perk=[md5(name)]>[name]</a>!</font>", "outputic.output")
						else
							M << output("<font size=2><i><b><font color=[controlMob.SayFont]>[M.getStrangerName(controlMob)] has activated an ultimate [jutsu_type != "perk" ? "technique" : "perk"]: <a href=?src=\ref[controlMob];action=Perk;perk=[md5(name)]>[name]</a>!</font></b></i>", "outputall.output")
							M << output("<font size=2><i><b><font color=[controlMob.SayFont]>[M.getStrangerName(controlMob)] has activated an ultimate [jutsu_type != "perk" ? "technique" : "perk"]: <a href=?src=\ref[controlMob];action=Perk;perk=[md5(name)]>[name]</a>!</font></b></i>", "outputic.output")

		if(Prompt == "Private")
			var/list/mobs = list()
			for(var/mob/M in oview(5))
				if(M.client) mobs+=user.getStrangerNameNoHTML(M)
			var/selected = input("Flash who?") in mobs+"Cancel"
			if(selected=="Cancel") return
			var/mob/M
			for(var/mob/character in hearers(16,controlMob))
				if(selected == user.getStrangerNameNoHTML(character))
					M = character
			if(!M.client) return
			if(M.MindAfflicted)
				if(M.MindAfflicted.view_perk_desc)
					if(!ultimate)
						M.MindAfflicted << output("<font size=-2><font color=[controlMob.SayFont]>[M.MindAfflicted.getStrangerName(controlMob)] has activated a [jutsu_type != "perk" ? "technique" : "perk"]: <a href=?src=\ref[controlMob];action=Perk;perk=[md5(name)]>[name]</a>!</font>", "outputall.output")
						M.MindAfflicted << output("<font size=-2><font color=[controlMob.SayFont]>[M.MindAfflicted.getStrangerName(controlMob)] has activated a [jutsu_type != "perk" ? "technique" : "perk"]: <a href=?src=\ref[controlMob];action=Perk;perk=[md5(name)]>[name]</a>!</font>", "outputic.output")
					else
						M.MindAfflicted << output("<font size=3><i><b><font color=[controlMob.SayFont]>[M.MindAfflicted.getStrangerName(controlMob)] has activated an ultimate [jutsu_type != "perk" ? "technique" : "perk"]: <a href=?src=\ref[controlMob];action=Perk;perk=[md5(name)]>[name]</a>!</font></b></i>", "outputall.output")
						M.MindAfflicted << output("<font size=3><i><b><font color=[controlMob.SayFont]>[M.MindAfflicted.getStrangerName(controlMob)] has activated an ultimate [jutsu_type != "perk" ? "technique" : "perk"]: <a href=?src=\ref[controlMob];action=Perk;perk=[md5(name)]>[name]</a>!</font></b></i>", "outputic.output")
			else
				if(M.view_perk_desc)
					if(!ultimate)
						M << output("<font size=-2><font color=[controlMob.SayFont]>[M.getStrangerName(controlMob)] has activated a [jutsu_type != "perk" ? "technique" : "perk"]: <a href=?src=\ref[controlMob];action=Perk;perk=[md5(name)]>[name]</a>!</font>", "outputall.output")
						M << output("<font size=-2><font color=[controlMob.SayFont]>[M.getStrangerName(controlMob)] has activated a [jutsu_type != "perk" ? "technique" : "perk"]: <a href=?src=\ref[controlMob];action=Perk;perk=[md5(name)]>[name]</a>!</font>", "outputic.output")
					else
						M << output("<font size=2><i><b><font color=[controlMob.SayFont]>[M.getStrangerName(controlMob)] has activated an ultimate [jutsu_type != "perk" ? "technique" : "perk"]: <a href=?src=\ref[controlMob];action=Perk;perk=[md5(name)]>[name]</a>!</font></b></i>", "outputall.output")
						M << output("<font size=2><i><b><font color=[controlMob.SayFont]>[M.getStrangerName(controlMob)] has activated an ultimate [jutsu_type != "perk" ? "technique" : "perk"]: <a href=?src=\ref[controlMob];action=Perk;perk=[md5(name)]>[name]</a>!</font></b></i>", "outputic.output")




	proc/perkView(mob/user)
		if(world.realtime < last_use + 50) return

		last_use = world.realtime
		var/mob/controlMob = usr
		if(controlMob.MindTransfer) controlMob=controlMob.MindTransfer
		var/Prompt = "View"

		if(Prompt == "View")
			//var/obj/jutsu/O = src
			//usr<<output(null,"Perk.Description")
			//usr<<output(null,"Perk.Name")
			//winset(usr,"Perk","is-visible=true")

			//var/icon/I = icon(O.icon,O.icon_state)
			//var/newPicture = fcopy_rsc(I)
			//winset(usr,"Perk.Picture","image=\ref[newPicture]")
			//winset(usr,"Perk.Name","text="[O.name]"")
			//winshow(usr,"Perk.Show",0)
			//usr<<output("[O.desc]<br>[O.perk_note]","Perk.Description")
			if(jutsu_type!="perk")
				bl=384
				bw=542
				usr<<browse(src.desc,"window=[src];size=[src.bl]x[src.bw]")
			else
				usr<<browse({"
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style>

a{
color:#DDBE0D;
}

body{
color:[src.perk_color];
background-color:#0b0f12;
font-family:calibri;
}
table, th, td {
  vertical-align: top;
  padding-left: 15px;
  font-size:13px;
}
.leftcolumn {
color:#DDBE0D;
}
</style>
</head>
<body>

<table style="width:100%">
  <tr>
    <td><div class=leftcolumn>Name</div></td>
    <td><b>[src.name]</b></td>
  </tr>
  <tr>
    <td><div class=leftcolumn>Desc</div></td>
    <td><font color=white>[src.desc]</font></td>
  </tr>
   <tr>
    <td><div class=leftcolumn>Note</div></td>
    <td><i>[src.perk_note]</i></td>
  </tr>
</table>
</body>
</html>

"},"window=[src];size=[src.bl]x[src.bw]")








/mob/var/view_perk_desc = 1





//SLOTH New Perk Desc




