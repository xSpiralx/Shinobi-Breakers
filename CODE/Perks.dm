mob/var/tmp/obj/jutsu/showPerk


/*mob/verb/showPerk()
	set hidden = 1
	if(!showPerk) return

	winset(usr,"PerkLog","is-visible=false")
	for(var/mob/M in range(15))
		M << output("<font size=-2><font color=[SayFont]>[src] has activated a [showPerk.isJutsu ? "technique" : "perk"]: <a href=?src=\ref[M];action=Perk;perk=[md5(showPerk.perkName)]>[showPerk.perkName]</a>!</font>","outputic.output")
		M << output("<font size=-2><font color=[SayFont]>[src] has activated a [showPerk.isJutsu ? "technique" : "perk"]: <a href=?src=\ref[M];action=Perk;perk=[md5(showPerk.perkName)]>[showPerk.perkName]</a>!</font>","outputall.output")
*/
proc/getDifficulty(var/num)
	if(num <= 140) return "Easy"
	if(num > 140 && num < 190) return "Moderate"
	if(num >= 190) return "Hard"


mob/proc/getActualPerk(var/path)
	for(var/obj/jutsu/P in contents)
		if(P.name == path) return P
	return 0
mob/proc/getPerk(var/path)
	for(var/obj/jutsu/P in contents)
		if(P.name == path) return 1
	return 0

mob/proc/givePerk(var/path)
	var/obj/jutsu/archived_perk
	for(var/obj/jutsu/j in archive.contents)
		if(j.name == path) archived_perk = j
	var/obj/jutsu/new_perk = new(src)
	for(var/variable in archived_perk.vars - "transform")
		if(issaved(archived_perk.vars[variable]))
			new_perk.vars[variable] = archived_perk.vars[variable]

/obj/Perk/perk/
	var/
		description
		note
		picture
		maxPoints = 120
		rankRequirement = 0
		prerequisite = null
		unique = 0
		perkName
		clan
		isJutsu=0
		uniqueID
		noDelete = 0
	Click()
		if(gridbased && !(src in usr.contents))
			usr.perkOpen = src
			usr<<output(null,"PerkLog.Description")
			usr<<output(null,"PerkLog.Title")
			winset(usr,"PerkLog","is-visible=true")
			winset(usr,"PerkLog.points","text=\"Difficulty to learn: [getDifficulty(maxPoints)] ([maxPoints])\"")

			var/icon/I = icon(icon,"")
			var/newPicture = fcopy_rsc(I)
			winset(usr,"PerkLog.Picture","image=\ref[newPicture]")
			usr<<output("<center><br>[src.perkName]","PerkLog.Title")

			usr<<output("[description]<br><br>[note ? "Note: [note]" : ""]","PerkLog.Description")
		else
			usr.showPerk = src
			usr<<output(null,"PerkInv.Description")
			usr<<output(null,"PerkInv.Title")
			winset(usr,"PerkInv","is-visible=true")


			/*
			var/icon/I = new('Misc Effects.dmi', "Black")
		I.Blend(rgb(R,G,B),ICON_ADD)
		var/iconfile = fcopy_rsc(I)
		winset(src, "ColorWindow.Picture", "image=\ref[iconfile]")
		*/
			var/icon/I = icon(icon,"")
			var/newPicture = fcopy_rsc(I)
			winset(usr,"PerkInv.Picture","image=\ref[newPicture]")
			winset(usr,"PerkInv.Title","text=\"[perkName]\"")
			usr<<output("[description]<br><br>[note ? "Note: [note]" : ""]","PerkInv.Description")
	New()
		perkName = name
		icon = picture
		..()
		name = perkName
		icon = picture
	Custom
		unique = 0
