/*var/notablehtml = {"
<style>
html, body { margin:0px; padding:0px; }

#profile {
border: hidden;
background-color: transparent; }

body {
font-family:"Calibri";
font-size:13px;
color:white;
background-image:url('loginbackground.png');
background-attachment:fixed;
background-position:center;
}

h2{
font-family: "Palatino Linotype";
}
   .more {
      display: none;
      border-top: 1px solid #666;
      border-bottom: 1px solid #666; }
   a.showLink, a.hideLink {
      text-decoration: none;
      color: #36f;
      padding-left: 8px;
      background: transparent url(down.gif) no-repeat left; }
   a.hideLink {
      background: transparent url(up.gif) no-repeat left; }
   a.showLink:hover, a.hideLink:hover {
      border-bottom: 1px dotted #36f; }
</style>

<html>
<head>
<title>The World's Most Notable Figures</title>
</head>
<body>

"}
*/
obj/notable
	var
		title = "???"
		hold

proc/UpdateNotableList()
	for(var/mob/M in world)
		if(!M.client || M.notable) continue
		if(M.lifetime_infpoints >= noteworthy)
			var/obj/notable/o = new
			o.name = M.name
			o.title = M.title
			o.hold = M.ckey
			M.notable = 1
			archive.notablelist += o

/*proc/SaveNotables()
	var/savefile/ref = new("Notable.txt")
	ref["Notable.txt"]<<notablehtml

mob/Admin4/verb/ManualNotableReset()
	var/savefile/ref = new("Notable.txt")
	ref["Notable.txt"]>>notablehtml

proc/LoadNotables()
	var/savefile/ref = new("Notable.txt")
	ref["Notable.txt"]>>notablehtml
*/

/*proc/GenerateNotables()
	var/notablehtml = failsafe
	for(var/obj/notable/i in archive.notablelist)
		var/obj/notable/o= i
		var/add = {"
		<hr>
		<hr>
		<br>
		<br>
		<center><i>[o.name]</i>
		<br>
		<b><font size = 10>[o.title]</font></b></center>
		<br>
		<br>
		"}
		notablehtml += add
	//SaveNotables()
	return notablehtml*/

