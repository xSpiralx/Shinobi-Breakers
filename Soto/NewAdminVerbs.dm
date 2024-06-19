mob/Admin6
	verb/Create_Perk()
		set category = "Skill Trees"

		var/obj/jutsu/k = new
		k.name = input("Write a name for this perk","Perk Name",k.name)
		if(k.name == "")
			usr << "You must give a this perk a name"
			return

		for(var/obj/jutsu/jutsu in archive.contents)
			if(jutsu.name == k.name)
				usr << "There is already a perk with this name archived."
				return

		k.desc = input("Write a description for this perk","Perk Description",k.desc)
		k.perk_note = input("Write a note for this perk","Perk Note",k.perk_note)

		var/list/colors=usr.ColorInput("Select a color for this perk")
		k.perk_color = colors

		k.icon='AllPerks.dmi'
		k.icon_state = input("What is the icon state of this perk?","Icon State",k.icon_state)

		k.jutsu_type = "perk"

		k.point_cost = input("What do you want this perk to cost?","Point Cost",k.point_cost)

		switch(input("Is this a core perk?") in list("Yes","No"))
			if("Yes")
				k.perk_type = "Core"
			else
				k.perk_type = null

		switch(input("Does this perk have a prerequisite?","Prerequisite") in list("Yes","No"))
			if("Yes")
				var/o = input("What is the prerequisite?")
				k.prerequisites += o
			else
				k.prerequisites = k.prerequisites

		usr.contents += k
		/*archive.save_archive()
		usr << "[k] has been added to the perk archive."
		world.log << "[k.name] has been saved to the perk archives."
		message_admins("[usr.key] has saved [k] to the perk archives.")
		Admin_Logs+="<br>[usr]([usr.key]) archived the [k.name] perk."
		SaveLogs()*/


	verb/Create_Jutsu()
		set category = "Skill Trees"
		var/top_desc
		var/bot_desc
		var/pwr
		var/spd
		var/drain
		var/cd
		var/hss
		var/ctrl

		var/obj/jutsu/k = new
		k.name = input("Write a name for this jutsu","Jutsu Name",k.name)
		if(k.name == "")
			usr << "You must give a this perk a name"
			return

		for(var/obj/jutsu/jutsu in archive.contents)
			if(jutsu.name == k.name)
				usr << "There is already a jutsu with this name archived."
				return

		k.english_name = input("Write the english name","English Name",k.english_name)

		top_desc = input("Write the top description for this jutsu","Long Description") as message
		bot_desc = input("Write the detailed description for this jutsu","Detailed Description","<p> &#8226; ...</p>") as message

		k.video = input("What is the video link?","Video",k.video)

		pwr = input("What is the power?") in list ("S+","S","S-","A+","A","A-","B+","B","B-","C+","C","C-","D+","D","D-","E+","E")
		spd = input("What is the speed?") in list ("S+","S","S-","A+","A","A-","B+","B","B-","C+","C","C-","D+","D","D-","E+","E")
		drain = input("What is the drain?") in list ("A","B","C","D","E")
		cd = input("How many turns is the cooldown?","Cooldown",3) as num
		hss = input("How many handsigns?","Handsigns") as num
		ctrl = input("What is the control requirement?") in list ("B+","B","B-","C+","C","C-","D+","D","D-","E+","E")
		if(ctrl == "B+")
			k.control_req = 51
		if(ctrl == "B")
			k.control_req = 46
		if(ctrl == "B-")
			k.control_req = 41
		if(ctrl == "C+")
			k.control_req = 36
		if(ctrl == "C")
			k.control_req = 31
		if(ctrl == "C-")
			k.control_req = 26
		if(ctrl == "D+")
			k.control_req = 21
		if(ctrl == "D")
			k.control_req = 16
		if(ctrl == "D-")
			k.control_req = 11
		if(ctrl == "E+")
			k.control_req = 6
		if(ctrl == "E")
			k.control_req = 1

		k.jutsu_rank = input("What is the jutsu rank?") in list("S-rank","A-rank","B-rank","C-rank","D-rank","E-rank")
		k.ryo_cost = input("What do you want this jutsu to cost?","Ryo Cost",k.ryo_cost) as num

		k.desc = {"


<html>
<title>Jutsu</title>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=10">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style>
table, th{
  border:1px solid black;
  text-align: left;
  margin: 1px;
}
table {
  width: 100%;
  border-style: solid;
  border-color: #2B3A47;
  text-align: left;
}

body {
   background-color: black;
   font-family: calibri;
   text-align: left;
}

p {
  margin:4px;
  font-size: 11px;
  text-align:left;
}

</style>
</head>

<body>

<table style="width:100%">
  <tr>
    <th><center><font color="#E6C208" size="2">[k.name]</font></center></th>
  </tr>
</table>

<center>

<video width="100%" height="100%" autoplay onclick="this.paused ? this.play() : this.pause();">
<source src="[k.video]" type="video/mp4">
Your browser does not support the video tag.
</video>

</center>

<table style="width:100%">
  <tr>
    <th><center><font color="#E6C208" size="2">[k.english_name]</center></th>
  </tr>
</table>

<table style="width:100%">

<tr>
    <td style="font-size:12px" bgcolor="#111111"><font color="#E6C208">Power</td>
<td style="font-size:12px;" ><font color="E7D99D">[pwr]</td>
 <tr>
    <td style="font-size:12px" bgcolor="#111111"><font color="#E6C208">Speed</td>
<td style="font-size:12px;" ><font color="#E7D99D">[spd]</td>
 <tr>
    <td style="font-size:12px" bgcolor="#111111"><font color="#E6C208">Drain</td>
<td style="font-size:12px;" ><font color="#E7D99D">[drain]</td>
 <tr>
    <td style="font-size:12px" bgcolor="#111111"><font color="#E6C208">Cooldown</td>
<td style="font-size:12px;" ><font color="#E7D99D">[cd] turns</td>
 <tr>
    <td style="font-size:12px" bgcolor="#111111"><font color="#E6C208">Handsigns</td>
<td style="font-size:12px;" ><font color="#E7D99D">[hss] signs</td>
 <tr>
</th>
  </tr>
</table>

<table style="width:100%">
  <tr>
    <th><center><font color="#E6C208" size="2">[k.jutsu_rank], requires [ctrl] Control</center></th>
  </tr>
</table>
<table style="width:100%">
  <tr>
    <th><font color="E7D99D" size="1px">

<p>[top_desc]</p>

</th>
  </tr>
</table>
<table style="width:100%">
  <tr>
    <th><center><font color="#E6C208" size="2">Further Details</center></th>
  </tr>
</table>

<table style="width:100%">
  <tr>
    <th><font color="E7D99D" size="1">
<i>
[bot_desc]
</i>
</th>
  </tr>
</table>

</body>
</html>

"}
		usr.contents += k
		/*archive.save_archive()
		usr << "[k] has been added to the perk archive."
		world.log << "[k.name] has been saved to the perk archives."
		message_admins("[usr.key] has saved [k] to the perk archives.")
		Admin_Logs+="<br>[usr]([usr.key]) archived the [k.name] perk."
		SaveLogs()*/


