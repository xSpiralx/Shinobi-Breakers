//stuff stored in archive (pages) that can be quoted in any jutsu or combat link to bring up the relevant page

/obj/databook_page
	var/width = 500
	var/height = 500

/mob/Admin4/verb/Create_Databook_Page()
	set category = "Admin"

	var/obj/databook_page/p = new(archive)
	p.name = "untitled"

	src << "Page created."

/mob/var/tmp/editing_databook = 0

/mob/Admin4/verb/Edit_Databook()
	set category = "Admin"
	editing_databook = !editing_databook
	archive.save_archive()

/mob/proc/databook(page)

	for(var/obj/databook_page/p in archive)
		if("databook_[p.name]" == "[page]")
//			src << browse(p.desc, "window=[p.name];size=[width]x[height]")
//			databookrefresh()
			src << output(p.desc,"outputdatabook.browser")
			winset(src, "mainscreen.childtabpanes", "right=outputdatabook")

//<a href=?source

//mob/proc/databookrefresh()
//	src << output(null,"outputdatabook.display")

/mob/verb/OpenHandBook()
	set hidden = 1
//	databookrefresh()
	winset(src, "mainscreen.childtabpanes", "right=outputdatabook")
	src << output(default_handbook_html,"outputdatabook.browser")

//mob/verb/SearchDatabook()
//	set hidden = 1
//	databookrefresh()
//	var/entry = input("What do you want to look up?","Databook") as message
//	usr << output("<a href=?databook_[entry]>[entry]</a>","outputall.output")

/var/default_handbook_html= {"
<html>
<head>
<style>

a {
color:#E6C208;
}

a:link {
  text-decoration: none;
}

a:visited {
  text-decoration: none;
}

a:hover {
  text-decoration: none;
}

a:active {
  text-decoration: none;
}

* {
  box-sizing: border-box;
}

.Title{
  font-size:20px;
  color:#E6C208;
  font-weight:bold;
}

.column {
  float: left;
  width: 33.33%;
  padding: 5px;
}

.row::after {
  content: "";
  clear: both;
  display: table;
}

body {
   background-color: #0b0f12;
   font-family: Arial;
   color:white;
   font-size:12px;
}

</style>
</head>
<body>
<div class="Title">Handbook</div>
<hr></hr>
<font color=white>Welcome to Shinobi Breakers! This is the handbook, which will act as a resource for you throughout your time roleplaying here. It includes tons of information that'll be useful to you during your adventure.<br><br>
<div class="row">
  <div class="column">
    <center><img src="https://cdn.discordapp.com/attachments/1230912359116181636/1249937487300923442/Ninja_Academy.png?ex=66691e7f&is=6667ccff&hm=3884149520c49b14545c190c618cb63e8de0a18f163e5221ccffd3a426335709&" alt="Guides" style="width:95%"><center><br><a href=?databook_Guides>Guides</a>
  </div>
  <div class="column">
    <center><img src="https://media.discordapp.net/attachments/858097565010362418/962110185189548142/unknown.png" alt="World" style="width:95%"><center><br><a href=?databook_World>World</a>
  </div>
  <div class="column">
    <center><img src="https://media.discordapp.net/attachments/858097565010362418/962110148237729862/11zon_cropped_1.png" alt="Combat" style="width:95%"><center><br><a href=?databook_CombatGuide>Combat</a>
  </div>
</div>
<br><br>
<center>Please click <a href=?databook_roleplay>here</a> to learn about what kind of roleplay is expected here.
</body>
</html>
"}