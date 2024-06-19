/*STAGES
1)Click Kawa
2)Click Ground
3)Move To Ground
*/
obj
	Log
		var/Owner
		icon='Log.dmi'
		New()
			spawn(300)
				del(src)


turf/DblClick()
	var/area/A=src.loc.loc
	var/area/AA=usr.loc.loc
	if(istype(A,/area/Interior/NoShunshin)) return
	if(istype(AA,/area/Interior/NoShunshin)) return
	var/mob/ControlledMob=usr
	if(usr.MindTransfer)
		ControlledMob=usr.MindTransfer
	if(get_dist(src,ControlledMob)>20) return
	if(ControlledMob.Shunshin&&!ControlledMob.ShunshinDelay)
		var/iconstate=ControlledMob.icon_state
		ControlledMob.icon_state="Dodge"
		flick('smoke.dmi',ControlledMob)
		ControlledMob.icon_state=iconstate
		ControlledMob.Move(src)
		ControlledMob.ShunshinDelay=1
		spawn(40)
			ControlledMob.ShunshinDelay=0
		return

	// if(ControlledMob.RangeBox)
		//ControlledMob.CreateMarker(src)
		//return
	//jumpishere
	if(ControlledMob.Jump&&!ControlledMob.ShunshinDelay)
		if(!ControlledMob.move) return
		if(get_dist(src,ControlledMob)>8) return

		if(Enter(ControlledMob))
			ControlledMob.jump_animation(src)

		/*var/image/I=image('Undershadow.dmi')
		ControlledMob.dir=get_dir(ControlledMob,src)
		I.pixel_y=-16
		ControlledMob.underlays+=I
		var/changeX=src.x-ControlledMob.x
		var/changeY=src.y-ControlledMob.y
		var/mid=get_dist(src,ControlledMob)/2
		for(var/i=get_dist(src,ControlledMob),i>0,i--)
			if(i==mid) mid=-mid
			var/yGrowth=(i*1.5)*mid
			ControlledMob.pixel_y=((changeY*32)/i)+yGrowth
			ControlledMob.pixel_x=(changeX*32)/i
			sleep(1)
		ControlledMob.Move(src)
		ControlledMob.pixel_y=0
		ControlledMob.pixel_x=0
		ControlledMob.underlays-=I
		del(I)
		ControlledMob.ShunshinDelay=1
		spawn(400)
			if(ControlledMob) ControlledMob.ShunshinDelay=0*/
		return
	if(usr.Trait=="SUPER SAIYAN!")
		usr.MaxNinjutsu += (1 *0.001)
		flick('smoke.dmi',usr)
		usr.Move(src)
		usr<<output("<font size = -3>ZANZOKEN!","outputic.output")



mob/var
	tmp/Kawa=0
	tmp/KawaDelay=0
	kawarimiskill=1

obj/Ninjutsu/Kawarimi
	icon='Skillcard.dmi'
	icon_state="Kawarimi"
	skill=10
	Click()
		if(src in usr.contents)
			if(!usr.move|usr.KawaDelay)
				return
			if(!usr.Kawa)
				if(usr.Chakra>2)
					usr<<output("<font size = -3>You have created a log, it will be deleted in thirty seconds. Clicking this verb again while the log is active, will result in you teleporting to the said log.","outputic.output")

					usr<<output("<font size = -3>You have created a log, it will be deleted in thirty seconds. Clicking this verb again while the log is active, will result in you teleporting to the said log.","outputall.output")
					usr.Kawa=1
					src.Active=1
					usr.CreateLog()
			else
				usr.FakeZanzo()
				usr.Kawa=0
				src.Active=0
mob/proc/CreateLog()
	if(usr.Kawa&&!usr.KawaDelay)
		var/obj/Log/L=new()
		L.loc=usr.loc
		L.name="[usr.name] - Kawa"
		L.Owner=usr.key
		usr.Chakra-=1
mob/proc/FakeZanzo()
	for(var/obj/Log/L in world)
		if(L.Owner==usr.key&&L.z==usr.z)
			flick('smoke.dmi',L)
			usr.MaxNinjutsu += (1 *0.001)
			usr.Chakra-=1
			usr.kawarimiskill+=1
			flick('smoke.dmi',usr)
			var/obj/Log/M=new()
			M.loc=usr.loc
			usr.loc=L.loc
			usr.Move(src)
			usr.KawaDelay=1
			usr.Kawa=0
			spawn(200/usr.kawarimiskill)
				usr.KawaDelay=0
				del(L)
			usr.resetLuminosity()
