/*

For some reason, everything in this game is stored in one list, being the 'archive_contents'
This is bad for numerous reasons, so for the 2022 rip's jutsu tree the following vars have been made to segment the archive:

var/list/world_jutsu
var/list/world_perks

*/

var/list/world_jutsu = new
var/list/world_perks = new

mob/Admin6/
	verb
		Extract_File()
			set category = "Admin6"
			var/obj/o = input("Choose a perk") in world_perks
			var/icon/I = new(o.icon)
			usr << ftp(I)

		Get_Path()
			set category = "Admin6"
			var/obj/o = input("Choose a perk") in world_perks
			usr << o.type



/atom/proc/get_flat_icon()
	var/icon/i = icon(icon)
	for(var/o in overlays)
		if(o:icon == 'Bubble.dmi') continue
		if(o:icon == 'Swim.dmi') continue
		if(o:icon == 'TalkOverlay.dmi') continue
		i.Blend(o:icon, ICON_OVERLAY)
	return i

mob/Admin6/verb/Get_Icon(atom/A as obj|mob|turf|area in world)
	set category = "Admin6"
	usr << ftp(A.get_flat_icon(), "[A.name].dmi")
