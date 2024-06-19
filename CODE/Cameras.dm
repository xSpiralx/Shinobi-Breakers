obj/items/Tape
	icon = 'tape.dmi'
	var/logfile
	Click()
		if(src in usr.contents)
			usr<<browse(logfile,"window=[src];size=500x350")
obj/Technology
	Camera_Monitor
		var/Village="Konohagakure"
		var/Power=1
		density=1
		icon='Security Panel.dmi'
		Click()
			if(get_dist(src,usr)>1) return
			if(!Power)
				usr<<output("<font size = -3>The power is off to this building!","outputic.output")
				usr<<output("<font size = -3>The power is off to this building!","outputall.output")
				return
			var/list/applicableCameras=list()
			for(var/obj/Technology/Camera/C in world)
				if(C.Village==Village&&C.Power) applicableCameras["[C.name]"]=C
			var/Choice=usr.CustomInput("What would you like to do?","Please choose an option.",applicableCameras+"Cancel")
			if(Choice=="Cancel") return
			var/obj/Technology/Camera/O=applicableCameras["[Choice]"]
			if(!O) return
			usr.move=0
			usr.client.eye=O
			usr.client.perspective=EYE_PERSPECTIVE
			usr<<output("<font size = -3>(To escape from this view, click the camera).","outputic.output")
			usr<<output("<font size = -3>(To escape from this view, click the camera).","outputall.output")
			for(var/mob/M in hearers(14,usr))
				M<<output("<font size = -3><font color = white><font color=[usr.SayFont]>[usr] flicks the display to [O.name].<font color = white>","outputic.output")
				M<<output("<font size = -3><font color = white><font color=[usr.SayFont]>[usr] flicks the display to [O.name].<font color = white>","outputall.output")
	Camera
		var/Power=1
		var/Village="Konohagakure"
		var/logfile
		icon='Camera.dmi'
		icon_state="camera"
		proc/appendToLog(text)
			logfile+=(text+"<br>")
		proc/deleteLogfile()
			logfile = null
		Click()
			if(usr.client.eye==src)
				usr.move=1
				usr.client.eye=usr
				usr.client.perspective=EYE_PERSPECTIVE
				return
			if(logfile&&get_dist(src,usr)<=1)
				var/logfileCopy = logfile
				deleteLogfile()
				usr<<output("<font size = -3><font color = white><font color=[usr.SayFont]>[usr] pops the tape out of the camera.<font color = white>","outputic.output")
				usr<<output("<font size = -3><font color = white><font color=[usr.SayFont]>[usr] pops the tape out of the camera.<font color = white>","outputall.output")
				var/obj/items/Tape/T = new(usr)
				spawn(2)
					T.logfile = {"
<html>
<head>
<title>Tape</title>
</head>
<body>
<style>
body{
  background-color:black;
}
#tapedeck{
  border: 2px solid white;
}
</style>
<center><font color=grey>[name]</font></center>
<div id = \"tapedeck\">
<font color=grey>The recording starts here ([daytime] - [Day][Days(Day)] of [Months(Month)], [Year+100]).<br><br>"}
					T.logfile += logfileCopy

