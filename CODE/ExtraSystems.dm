/////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////
///////////////////Fishing/Swimming//////////////////////
/////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////

turf/nature/FishDirt
	icon='Turf.dmi';icon_state="dirtz"

obj/nature/WaterOpac
	icon='Turf.dmi';icon_state="wateropac";layer=1000;screen_loc="SOUTHWEST TO NORTHEAST"

mob/var/dead=0

mob/var/roped=0
mob/var/Null=0

/////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////
////////////////////////Suggestions//////////////////////
/////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////
var/Suggestions="<body bgcolor=black>"
mob/verb/Post_Suggestion(msg as message)
	set hidden = 1
	if(length(msg)>5000)
		usr<<"Far too Long!"
		return
	if(length(msg)<5)
		usr<<"Far too Short!"
		return
	Suggestions+="<font color=[usr.OOCFont]>[usr]: <font color=white>[msg]<br>"


////////////////////////////////////////////////////
////////////////////////////////////////////////////
///////////////Popup Stats Crap/////////////////////
////////////////////////////////////////////////////
////////////////////////////////////////////////////
client/Command(T)
	..()
	if(findtextEx(T,".Up",1,9))
		winshow(usr,"Inv",1)
		winshow(usr,"default.InvUp",0)
		winshow(usr,"default.InvDown",1)
	if(findtextEx(T,".Down",1,9))
		winshow(usr,"Inv",0)
		winshow(usr,"default.InvUp",1)
		winshow(usr,"default.InvDown",0)