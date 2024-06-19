mob
	var/Henge=0
	var/Oicon
	var/Oname
	var/Oprofile
	var/Oage
	var/faceicon
obj/Genjutsu/Henge
	skill=10
	icon='Skillcard.dmi'
	icon_state="Henge"
	proc/Drain()
		set background=1
		spawn()
			while(usr.Henge&&usr.Chakra>=5)
				usr.Chakra-=5
				sleep(100)
			flick('smoke.dmi',usr)
			usr.overlays = null
			for(var/obj/items/Clothing/C in usr.contents)
				if(C.worn)
					usr.overlays += C.icon


			usr.name = usr.Oname
			usr.generate_hover_name()
			usr.SayFont = usr.OSayFont
			usr.profile = usr.Oprofile
			usr.Henge = 0
			usr.icon = usr.Oicon
			src.Active=0
			if(usr.Hyuuga)
				usr.overlays += 'Hyuuga.dmi'
	Click()
		if(src in usr.contents)
			if(usr.Chakra<5)
				return
			if(!usr.move)
				return
			else
				if(!usr.Henge)
					var/list/V = new/list
					for(var/mob/A in viewers())
						V.Add(A)
					var/mob/M=input("Who would you like to transform into?") in V+"Cancel"
					if(M=="Cancel") return
					if(!M.client) return
					usr.MaxGenjutsu += (1 *0.001)
					viewers(16)<<output("<font size = -3><font color=[usr.SayFont]>[usr] yells<font color = white>: Henge no Jutsu!","outputic.output")
					usr.move = 0
					src.Active=1
					usr.name=M.name
					usr.Oprofile = usr.profile
					usr.profile = M.profile
					usr.SayFont = M.SayFont
					usr.generate_hover_name()
					//usr.faceicon = M.faceicon
					usr.Chakra-=5
					usr.Henge=1
					usr.move = 1
					usr.overlays = null
					usr.overlays = M.overlays
					if(M)
						usr.icon = M.icon
					flick('smoke.dmi',usr)
					spawn() Drain()
				else
					flick('smoke.dmi',usr)
					usr.overlays = null
					for(var/obj/items/Clothing/C in usr.contents)
						if(C.worn)
							usr.overlays += C.icon


					usr.name = usr.Oname
					usr.generate_hover_name()
					usr.SayFont = usr.OSayFont
					usr.profile = usr.Oprofile
				//	usr.faceicon = usr.Ofaceicon
					usr.Henge = 0
					usr.icon = usr.Oicon
					src.Active=0
					if(usr.Hyuuga)
						usr.overlays += 'Hyuuga.dmi'