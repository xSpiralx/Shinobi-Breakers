

/mob/Admin4/verb/Set_Automatic_Learn_Reqs()

	var/output = "<h3>Learn Requirements</h3>"

	for(var/obj/jutsu/j in archive)
		if(j.type <> "perk")
			set_jutsu_learn_req_by_rank(j)
			output += "[j.name] learn_req set to [j.learn_req]<br>"

	src << browse(output, "window=output;size=300x480")
/* NO LONGER NEEDED? -Big B
/mob/Admin1/verb/Admin_View_Contents(var/mob/m as mob in world)
	set category = "Admin"
	if(m == usr.Selected)
		usr.Selected=null
	else
		usr.Selected=m
		SAdmin_Logs+="<br>[usr]([usr.key]) looks in [m]. ([time2text(world.realtime)])"
		public_admin_log("<font color=#F88017>[usr] has looked into [m]'s contents list.") */

/proc/set_jutsu_learn_req_by_rank(var/obj/jutsu/j)
	if(findtextEx(j.desc, "E-Rank")) j.learn_req = (30 * 8)
	if(findtextEx(j.desc, "D-Rank")) j.learn_req = (120 * 8)
	if(findtextEx(j.desc, "C-Rank")) j.learn_req = (480 * 8)
	if(findtextEx(j.desc, "B-Rank")) j.learn_req = (960 * 8)
	if(findtextEx(j.desc, "A-Rank")) j.learn_req = (1920 * 8)
	if(findtextEx(j.desc, "S-Rank")) j.learn_req = (3840 * 8)

/* _Notes_
 * Time is 8 ticks per minute. 1 tick per 7.5 seconds.
 */

/mob/proc/get_ryo()
	for(var/obj/items/Ryo/R in src)
		return R.amount
	return 0

/mob/proc/has_ryo(n)
	for(var/obj/items/Ryo/R in src)
		if(R.amount >= n) return 1
	return 0

/mob/proc/give_ryo(n)
	var/obj/items/Ryo/R = locate() in src
	if(!R)
		R = new(src)
		R.amount = n
	else
		R.amount += n
	R.Update()

/mob/proc/take_ryo(n)
	var/obj/items/Ryo/R = locate() in src
	if(!R) return
	R.amount -= n
	if(R.amount <= 0)
		del(R)

/archive/var/list/jutsu_last_activity = list()

/mob/Admin1/verb/Jutsu_Last_Activity(var/obj/jutsu/j as obj in world)
	set category = "Admin"

	if(istype(j))
		if(!archive.jutsu_last_activity[j.name])
			system_message("This jutsu hasn't been seen in the wild.")
		else
			system_message("This jutsu was last seen in the wild on [time2text(archive.jutsu_last_activity[j.name], "DDD MMM DD hh:mm:ss YYYY")]")

	//864000

/mob/proc/get_controlled_mob()
	if(MindTransfer)
		return MindTransfer
	return src

/mob/proc/his()
	return Female ? "her" : "his"

/mob/proc/him()
	return Female ? "her" : "him"

/mob/proc/system_message(msg)
	src << output(msg, "outputall.output")
	src << output(msg, "outputic.output")
	//src << output(msg, "outputooc.output")

/mob/proc/display_local_message(msg)
	var/mob/controlMob = get_controlled_mob()
	for(var/mob/M in hearers(16, controlMob))
		if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) continue
		if(M.MindAfflicted)
			M.MindAfflicted << output("<font size=-2><font color=[controlMob.SayFont]>[M.MindAfflicted.getStrangerName(controlMob)] [msg]</font>", "outputall.output")
			M.MindAfflicted << output("<font size=-2><font color=[controlMob.SayFont]>[M.MindAfflicted.getStrangerName(controlMob)] [msg]</font>", "outputic.output")

/mob/verb/Icon_Size()
	Scene()
	return
	switch(input("Select Icon Size") in list("32x32", "64x64"))
		if("32x32")
			winset(src, "mappane.map","icon-size=32")
		if("64x64")
			winset(src, "mappane.map","icon-size=64")