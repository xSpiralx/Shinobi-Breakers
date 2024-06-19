/*
Death:
	Taken to Afterlife.
	Random Chance to be brought back to the hospital?
	Summoning: Impure World Resurrection

	289,11,20
*/

mob/var/deathReward = 0
mob/Shinigami
	icon = 'Shiki.dmi'
	Click()
		if(usr.Dead)
			if(alert(usr,"Rebirth? ([loss]% Overflow point loss)","Rebirth","Yes","No")=="Yes")
				var/mob/newMob = new
				newMob.deathReward(usr.progress_points_total*archive.DRrate,usr)
mob/proc
	deathReward(num,mob/M)
		src.deathReward = (M.progress_points_total*archive.DRrate)
		src.prompt = null
		src.copy = null
		src.loc=locate(37,239,28)
		M.client.mob = src
		//M.client = src.client
		src.client.eye = src
		src.client.perspective = EYE_PERSPECTIVE
		src.client.show_verb_panel = 0
		src.Village=null
		if(fexists("Save/[src.ckey]")) fdel("Save/[src.ckey]")
		src.Creation()
		src.Oname=src.name
		src.fakeName="[src.name]"
	Death(var/mob/M)
		if(Dead) return

		var/mob/Dead_Body/A = new/mob/Dead_Body
		if(M)
			spawn()
				A:Killer="[M.name]"
				A:description=input(M,"Please enter the body's description","Body") as message
			spawn()
				var/d=input(M,"Was this a bloody death?","Body") in list("Yes","No")
				switch(d)
					if("Yes")
						A:Bloodied=1
						var/obj/Bloodtrail/B = new(A.loc)
						B.icon ='Icons/Base/Blood.dmi'
						if(prob(50)) B.overlays +='Icons/Base/Blood2.dmi'
						if(prob(80)) B.overlays +='Icons/Base/Blood3.dmi'
		A.loc=src.loc
		A.Health=0
		A.MaxHealth=0
		A.Savable=0
		A.displaykey = src.key
		A.name="[src.name]'s Body"
		A.icon=src.icon
		A.Verification = md5(src.ckey ? src.ckey : "NPC")+md5(src.Oname ? src.Oname : src.name)+md5(src.type)+md5(src.masked)
		for(var/i in overlays)
			A.overlays += i:icon
		A.icon_state="KO"
		A.attackable=0
		if(istype(src,/mob/Clone/))
			if(src:bunshin) del(src)
			for(var/obj/items/D in src:Contents)
				if(istype(D,/obj/items/Clothing/BYONDHat)) continue
				A.Contents += D
				A.Capacity += D.Weight
				D.loc = A

		for(var/obj/items/D in contents)
			if(istype(D,/obj/items/Clothing/BYONDHat)) continue
			A.Contents += D
			A.Capacity += D.Weight
			D.loc = A
		if(!src.client) del(src)
		src.loc = locate(142,153,25)
		src.Dead=1
		src.client.eye = A
		src.client.perspective = EYE_PERSPECTIVE
		var/image/I = new('Shiki.dmi',A.loc)
		var/image/ghost = new(src.icon,A.loc)
		ghost.overlays = src.overlays
		ghost.alpha = 0
		ghost.layer = 90000
		src.client.images += ghost
		src.client.images += I
		I.pixel_y = 128
		I.pixel_x = 10
		I.alpha = 0
		animate(ghost, alpha = 255, time = 20)
		animate(I, pixel_y = 64, alpha = 100, time = 20)
		sleep(20)
		src.deathReward = 0
		src << output("<font size = -3>You have died. Your soul winds through the nether, unraveled by time. It is now that you must choose.","outputic.output")
		src << output("<font size = -3>You have died. Your soul winds through the nether, unraveled by time. It is now that you must choose.","outputall.output")
		src << output("<font size = -3>Rebirth or last here for eternity. The Death God decides your fate.","outputall.output")
		animate(ghost, alpha = 0, time = 20)
		animate(I, pixel_y = 128, alpha = 0, time = 20)
		sleep(20)
		src.client.images = null
		src.client.eye = src
		src.client.perspective = EYE_PERSPECTIVE
		src.pixel_y = 128
		src.alpha = 0
		for(var/obj/overlay in src.overlays)
			overlay.alpha = 0
		animate(src, pixel_y = 0, alpha = 100, time = 20)
		sleep(20)
		src.alpha = 100
		for(var/obj/overlay in src.overlays)
			overlay.alpha = 100

		for(var/obj/BingoBookEntry/x in archive)
			if(src.name == x.name)
				x.killed=1
				archive.save_archive()

/*dsfdfdfdfdfdfdfasdfsadfdsf
Punch
Ressucitate?
Kill
*/
mob/var
	attacking=0
	KO=0
mob/verb
	Toggle_Run()
		set category = "Combat"
		ToggleRun=!ToggleRun
		src<<output("<font size = -3>You are [ ToggleRun ? "able to sprint." : "no longer sprinting."]","outputic.output")
		src<<output("<font size = -3>You are [ ToggleRun ? "able to sprint." : "no longer sprinting."]","outputall.output")
mob/verb
	Kill()
		set hidden=1
		set category = "Combat"
		var/Count = 30
		if(src.z == 15)
			while(Count)
				src << "<font size=30>Faggot</font>"
				Count--
			return
		for(var/mob/M in get_step(src,dir))
			if(!usr.KO&&usr.move&&M.KO&&M.attackable&&!usr.attacking)
				for(var/mob/L in viewers(20))
					L<<output("<font size = -3><font color=red><i>[L.getStrangerName(M)] was just killed by [L.getStrangerName(usr)]!","outputic.output")
					L<<output("<font size = -3><font color=red><i>[L.getStrangerName(M)] was just killed by [L.getStrangerName(usr)]!","outputall.output")
					L.ChatLog("<font color=red>*[usr.name] ([usr.strangerName]-[usr.key]) just <i>KILLED</i> [M] ([M.strangerName]-[M.key])")
				M.Death(src)

				for(var/mob/A in world)
					if(A.Admin)
						A << "[usr.name] ([usr.key]) just killed [M] ([M.key])"

/*mob/verb
	Attack()
		set category = "Combat"
		var/random
		for(var/mob/M in get_step(usr,usr.dir))
			if(!usr.KO&&usr.move&&M.KO&&M.attackable&&!usr.attacking)
				switch(alert(usr,"Do you want to kill this person!?","Kill","Yes","No"))
					if("Yes")
						for(var/mob/L in viewers(20))
							L<<output("<font size = -3><font color=red><i>[M] was just killed by [usr]!","outputic.output")
							L<<output("<font size = -3><font color=red><i>[M] was just killed by [usr]!","outputall.output")
							L.ChatLog("<font color=red>*[usr.name]([usr.key]) just <i>KILLED</i> [M]([M.key])")
						for(var/obj/Technology/Camera/C in view(20)) C.appendToLog("<font color=red><i>[M] was just killed by [usr]!")
						M.Death(src)
					if("No") return
			if(istype(M,/mob/Bunshin))
				src<<output("<font size = -3>The clone fades through your fist.","outputic.output")
				src<<output("<font size = -3>The clone fades through your fist.","outputall.output")
				return



			if(usr.Weapon)
				var/obj/items/Weapon/Kunai/K = locate() in src
				if(K && K.worn)
					if(prob(90))
						M.roped = 0
						M.icon_state = ""
						M.move = 1
						M.KO=0
						M.overlays -= 'Icons/Rope2.dmi'
				if(!usr.resting&&!usr.KO&&usr.move&&!M.KO&&M.attackable&&!usr.attacking&&usr.Stamina >= 1.2)
					var/damage = rand(usr.Strength/M.Defence+usr.Taijutsu/M.Taijutsu/1.5,usr.Strength/M.Defence+usr.Taijutsu/M.Taijutsu)/2.5
					if(damage<0)
						damage=0
					if(damage*1.5>=M.MaxHealth)
						damage=(usr.Strength/M.Defence+M.Taijutsu)/1.5
					if(damage*1.5>=1000)
						damage=(usr.Strength/M.Defence+M.Taijutsu)*rand(3.5,5.5)
					if(src.client==null)
						return
					if(src.Health==null)
						return
					if(src.Defence==null)
						return
					if(usr.client==null)
						return
					if(usr.Health==null)
						return
					if(usr.Defence==null)
						return



					usr.attacking=1
					if((usr.Agility+usr.Offence*rand(1,1.5)) >= M.Agility+M.Defence)
						random = rand(1,10)
						if(random<=9)
							if((usr.Strength*rand(1,2)) >= M.Defence)
								random = rand(1,10)
								if(random<=9)
									flick("Weapon",usr)
									// M.Health -= damage
									usr.overlays -= 'Chidori.dmi'
									usr.overlays -= 'Dark-Chidori.dmi'
									usr.drain=0
									usr.overlays -= 'Rasengan.dmi'
									if(usr.Weapon&&usr.Samehada)
										flick("Weapon",usr)
										// M.Health -= damage
										M.Chakra -= damage*2
										usr.overlays -= 'Chidori.dmi'
										usr.overlays -= 'Dark-Chidori.dmi'
										usr.drain=0
										usr.overlays -= 'Rasengan.dmi'
									/*if(Atton)
										sleep(15/usr.Agility)
										viewers() << "[usr] manages to cut [M]!"
										flick("Weapon",usr)
										// M.Health -= damage
										usr.attacking=0
										usr.overlays -= 'Chidori.dmi' usr.overlays -= 'Dark-Chidori.dmi'
										usr.drain=0
										usr.overlays -= 'Rasengan.dmi'*/


								else
									flick("Weapon",usr)
									// M.Health -= ((damage/M.Defence)/1.5)
									usr.overlays -= 'Chidori.dmi'
									usr.overlays -= 'Dark-Chidori.dmi'
									usr.drain=0
									usr.overlays -= 'Rasengan.dmi'
									if(usr.Weapon&&usr.Samehada)
										flick("Weapon",usr)
										// M.Health -= ((damage/M.Defence)/1.5)
										M.Chakra -= damage*1.5
										usr.overlays -= 'Chidori.dmi'
										usr.overlays -= 'Dark-Chidori.dmi'
										usr.drain=0
										usr.overlays -= 'Rasengan.dmi'
									/*if(Atton)
										sleep(15/usr.Agility)
										viewers() << "[M] manages to block [usr]!"
										flick("Weapon",usr)
										// M.Health -= ((damage/M.Defence)/1.5)
										usr.attacking=0
										usr.overlays -= 'Chidori.dmi' usr.overlays -= 'Dark-Chidori.dmi'
										usr.drain=0
										usr.overlays -= 'Rasengan.dmi'*/

						else
							random = rand(1,10)
							if(random<=8)
								if((usr.Strength*rand(1,2)) >= M.Defence)
									random = rand(1,10)
									if(random<=9)
										flick("Weapon",usr)
										// M.Health -= damage
										usr.overlays -= 'Chidori.dmi'
										usr.overlays -= 'Dark-Chidori.dmi'
										usr.drain=0
										usr.overlays -= 'Rasengan.dmi'
										if(usr.Weapon&&usr.Samehada)
											flick("Weapon",usr)
											// M.Health -= damage
											M.Chakra -= damage*2
											usr.overlays -= 'Chidori.dmi'
											usr.overlays -= 'Dark-Chidori.dmi'
											usr.drain=0
											usr.overlays -= 'Rasengan.dmi'
										/*if(Atton)
											sleep(15/usr.Agility)
											viewers() << "[M] manages to cut [usr]!"
											flick("Weapon",usr)
											// M.Health -= damage
											usr.attacking=0
											usr.overlays -= 'Chidori.dmi' usr.overlays -= 'Dark-Chidori.dmi'
											usr.drain=0
											usr.overlays -= 'Rasengan.dmi'*/


									else
										flick("Attack",usr)
										// M.Health -= ((damage/M.Defence)/1.5)
										usr.overlays -= 'Chidori.dmi'
										usr.overlays -= 'Dark-Chidori.dmi'
										usr.drain=0
										usr.overlays -= 'Rasengan.dmi'
										if(usr.Weapon&&usr.Samehada)
											flick("Weapon",usr)
											// M.Health -= ((damage/M.Defence)/1.5)
											M.Chakra -= damage*1.5
											usr.overlays -= 'Chidori.dmi'
											usr.overlays -= 'Dark-Chidori.dmi'
											usr.drain=0
											usr.overlays -= 'Rasengan.dmi'
										/*if(Atton)
											sleep(15/usr.Agility)
											viewers() << "[M] manages to block [usr]!"
											flick("Attack",usr)
											// M.Health -= ((damage/M.Defence)/1.5)
											usr.attacking=0
											usr.overlays -= 'Chidori.dmi' usr.overlays -= 'Dark-Chidori.dmi'
											usr.drain=0
											usr.overlays -= 'Rasengan.dmi'*/


							else
								flick("Dodge",M)
								flick("Weapon",usr)
								usr.overlays -= 'Chidori.dmi'
								usr.overlays -= 'Dark-Chidori.dmi'
								usr.drain=0
								usr.overlays -= 'Rasengan.dmi'
								/*if(Atton)
									sleep(15/usr.Agility)
									flick("Weapon",usr)
									flick("Dodge",M)
									usr.attacking=0
									usr.overlays -= 'Chidori.dmi' usr.overlays -= 'Dark-Chidori.dmi'
									usr.drain=0
									usr.overlays -= 'Rasengan.dmi'*/


					else
						flick("Dodge",M)
						flick(usr,"Weapon")
						usr.overlays -= 'Chidori.dmi'
						usr.overlays -= 'Dark-Chidori.dmi'
						usr.drain=0
						usr.overlays -= 'Rasengan.dmi'
						/*if(Atton)
							sleep(15/usr.Agility)
							viewers() << "[M] manages to dodge [usr]!"
							flick(usr,"Weapon")
							flick("Dodge",M)

							usr.attacking=0
							usr.overlays -= 'Chidori.dmi' usr.overlays -= 'Dark-Chidori.dmi'
							usr.drain=0
							usr.overlays -= 'Rasengan.dmi'*/

					usr.Stamina -= 1.2
					if(usr.Stamina <0)
						usr.Stamina = 0
					if(usr.Agility<=100)
						sleep(rand(5,8))
						usr.attacking=0
					if(usr.Agility>=100)
						sleep(rand(2,3))
						usr.attacking=0
					if(M) M.Ko(usr)
					usr.Spar_Gain(M)
					/*usr.RAttack()
					if(M.client)
						M.RAttack()*/

				else
					return

			else

				if(!usr.resting&&!usr.KO&&usr.move&&!M.KO&&M.attackable&&!usr.attacking&&usr.Stamina >= 1.2)

					var/damage = rand(usr.Strength/M.Defence+usr.Taijutsu/M.Taijutsu/1.5,usr.Strength/M.Defence+usr.Taijutsu/M.Taijutsu)/2.5
					if(damage<=0)
						damage=0
					if(damage*1.5>=M.MaxHealth)
						damage=(usr.Strength/M.Defence+M.Taijutsu)/1.6
					if(damage*1.5>=1000)
						damage=(usr.Strength/M.Defence+M.Taijutsu)*rand(2.5,4.15)

					usr.attacking=1
					if((usr.Agility+usr.Offence*rand(1,1.5)) >= M.Agility+M.Defence)
						random = rand(1,10)
						if(random<=9)
							if((usr.Strength*rand(1,2)) >= M.Defence)
								random = rand(1,10)
								if(random<=9)
									flick("Attack",usr)
									// M.Health -= damage
									usr.Taijutsu = usr.MaxTaijutsu
									usr.Strength = usr.MaxStrength
									usr.overlays -= 'Chidori.dmi'
									usr.overlays -= 'Dark-Chidori.dmi'
									usr.drain=0
									usr.overlays -= 'Rasengan.dmi'
								//	if(prob(35))
								//		usr.Exp += rand(0.18,0.37)
								//	else
								//		if(random10==3)
								//			usr.Exp += rand(0.3,0.38)

									if(usr.Juuken)
										flick("Attack",usr)
										// M.Health -= damage
										usr.Taijutsu = usr.MaxTaijutsu
										usr.Strength = usr.MaxStrength
										usr.overlays -= 'Chidori.dmi'
										usr.overlays -= 'Dark-Chidori.dmi'
										M.Chakra -= damage*2
										usr.drain=0
										usr.overlays -= 'Rasengan.dmi'
									//	if(prob(35))
									//		usr.Exp += rand(0.18,0.37)
									//	else
									//		if(random70==3)
									//			usr.Exp += rand(0.3,0.38)

									if(usr.Rasengan)
										flick("Attack",usr)
										// M.Health -= damage
										usr.Taijutsu = usr.MaxTaijutsu
										usr.Strength = usr.MaxStrength
										usr.overlays -= 'Chidori.dmi'
										usr.overlays -= 'Dark-Chidori.dmi'
										step(M,usr.dir)
										step(M,usr.dir)
										step(M,usr.dir)
										step(M,usr.dir)
										usr.Rasengan=0
										usr.drain=0
										usr.overlays -= 'Rasengan.dmi'
									//	if(prob(35))
									//	else
									//		if(random70==3)
									//			usr.Exp += rand(0.3,0.38)

									/*if(Atton)
										sleep(15/usr.Agility)
										viewers() << "[usr] manages to hit [M]!"
										flick("Attack",usr)
										// M.Health -= damage
										usr.Taijutsu = usr.MaxTaijutsu
										usr.overlays -= 'Chidori.dmi' usr.overlays -= 'Dark-Chidori.dmi'
										usr.drain=0
										usr.overlays -= 'Rasengan.dmi'

										usr.attacking=0
										var/random11=rand(1,20)
										if(prob(35))
											usr.Exp += rand(0.18,0.37)
										else
											if(random11==3)
												usr.Exp += rand(0.3,0.38)*/


								else
									flick("Attack",usr)
									// M.Health -= ((damage/M.Defence)/1.5)
									usr.Taijutsu = usr.MaxTaijutsu
									usr.Strength = usr.MaxStrength
									usr.overlays -= 'Chidori.dmi'
									usr.overlays -= 'Dark-Chidori.dmi'
									usr.drain=0
									usr.overlays -= 'Rasengan.dmi'
								//	if(prob(35))
							//			usr.Exp += rand(0.15,0.29)
								//	else
								////		if(random20==3)
								//			usr.Exp += rand(0.25,0.29)
									if(usr.Juuken)
										flick("Attack",usr)
										// M.Health -= ((damage/M.Defence)/1.5)
										M.Chakra -= damage*1.5
										usr.Taijutsu = usr.MaxTaijutsu
										usr.Strength = usr.MaxStrength
										usr.overlays -= 'Chidori.dmi'
										usr.overlays -= 'Dark-Chidori.dmi'
										usr.drain=0
										usr.overlays -= 'Rasengan.dmi'
									//	if(prob(35))
									//		usr.Exp += rand(0.15,0.29)
									//	else
									//		if(random80==3)
									//			usr.Exp += rand(0.25,0.29)

									if(usr.Rasengan)
										flick("Attack",usr)
										// M.Health -= damage
										usr.Taijutsu = usr.MaxTaijutsu
										usr.Strength = usr.MaxStrength
										usr.overlays -= 'Chidori.dmi'
										usr.overlays -= 'Dark-Chidori.dmi'
										step(M,usr.dir)
										step(M,usr.dir)
										usr.Rasengan=0
										usr.drain=0
										usr.overlays -= 'Rasengan.dmi'
									//	if(prob(35))
									//		usr.Exp += rand(0.18,0.37)
									//	else
									///		if(random70==3)
									//			usr.Exp += rand(0.3,0.38)
									/*if(Atton)
										sleep(15/usr.Agility)
										viewers() << "[M] manages to block [usr]!"
										flick("Attack",usr)
										// M.Health -= ((damage/M.Defence)/1.5)
										usr.Taijutsu = usr.MaxTaijutsu
										usr.overlays -= 'Chidori.dmi' usr.overlays -= 'Dark-Chidori.dmi'
										usr.drain=0
										usr.overlays -= 'Rasengan.dmi'

										usr.attacking=0
										var/random21=rand(1,30)
										if(prob(35))
											usr.Exp += rand(0.15,0.29)
										else
											if(random21==3)
												usr.Exp += rand(0.25,0.29)*/



						else
							random = rand(1,10)
							if(random<=8)
								if((usr.Strength*rand(1,2)) >= M.Defence)
									random = rand(1,10)
									if(random<=9)
										flick("Attack",usr)
										// M.Health -= damage
										usr.Taijutsu = usr.MaxTaijutsu
										usr.Strength = usr.MaxStrength
										usr.overlays -= 'Chidori.dmi'
										usr.overlays -= 'Dark-Chidori.dmi'
										usr.drain=0
										usr.overlays -= 'Rasengan.dmi'
									//	if(prob(35))
									//		usr.Exp += rand(0.18,0.37)
									//	else
									//		if(random30==3)
									//			usr.Exp += rand(0.3,0.38)
										if(usr.Juuken)
											flick("Attack",usr)
											// M.Health -= damage
											M.Chakra -= damage*2
											usr.Taijutsu = usr.MaxTaijutsu
											usr.Strength = usr.MaxStrength
											usr.overlays -= 'Chidori.dmi'
											usr.overlays -= 'Dark-Chidori.dmi'
											usr.drain=0
											usr.overlays -= 'Rasengan.dmi'
										//	if(prob(35))
										//		usr.Exp += rand(0.18,0.37)
										//	else
										//		if(random90==3)
										//			usr.Exp += rand(0.3,0.38)
										if(usr.Rasengan)
											flick("Attack",usr)
											// M.Health -= damage
											usr.Taijutsu = usr.MaxTaijutsu
											usr.Strength = usr.MaxStrength
											usr.overlays -= 'Chidori.dmi'
											usr.overlays -= 'Dark-Chidori.dmi'
											step(M,usr.dir)
											step(M,usr.dir)
											step(M,usr.dir)
											step(M,usr.dir)
											usr.Rasengan=0
											usr.drain=0
											usr.overlays -= 'Rasengan.dmi'
										//	if(prob(35))
										//		usr.Exp += rand(0.18,0.37)
										//	else
										//		if(random70==3)
										//			usr.Exp += rand(0.3,0.38)
										/*if(Atton)
											sleep(15/usr.Agility)
											viewers() << "[usr] manages to hit [M]!"
											flick("Attack",usr)
											// M.Health -= damage
											usr.Taijutsu = usr.MaxTaijutsu
											usr.overlays -= 'Chidori.dmi' usr.overlays -= 'Dark-Chidori.dmi'
											usr.drain=0
											usr.overlays -= 'Rasengan.dmi'

											usr.attacking=0
											var/random31=rand(1,20)
											if(prob(35))
												usr.Exp += rand(0.18,0.37)
											else
												if(random31==3)
													usr.Exp += rand(0.3,0.38)*/


									else
										flick("Attack",usr)
										// M.Health -= ((damage/M.Defence)/1.5)
										usr.Taijutsu = usr.MaxTaijutsu
										usr.Strength = usr.MaxStrength
										usr.overlays -= 'Chidori.dmi'
										usr.overlays -= 'Dark-Chidori.dmi'
										usr.drain=0
										usr.overlays -= 'Rasengan.dmi'
									//	if(prob(35))
									//		usr.Exp += rand(0.15,0.22)
									//	else
									//		if(random40==10)
									//			usr.Exp += rand(0.2,0.27)
										if(usr.Juuken)
											flick("Attack",usr)
											// M.Health -= ((damage/M.Defence)/1.5)
											M.Chakra -= damage*1.5
											usr.Taijutsu = usr.MaxTaijutsu
											usr.Strength = usr.MaxStrength
											usr.overlays -= 'Chidori.dmi'
											usr.overlays -= 'Dark-Chidori.dmi'
											usr.drain=0
											usr.overlays -= 'Rasengan.dmi'
									//		if(prob(35))
										//		usr.Exp += rand(0.15,0.22)
										//	else
										//		if(random100==10)
										//			usr.Exp += rand(0.2,0.27)
										if(usr.Rasengan)
											flick("Attack",usr)
											// M.Health -= damage
											usr.Taijutsu = usr.MaxTaijutsu
											usr.Strength = usr.MaxStrength
											usr.overlays -= 'Chidori.dmi'
											usr.overlays -= 'Dark-Chidori.dmi'
											step(M,usr.dir)
											step(M,usr.dir)
											usr.Rasengan=0
											usr.drain=0
											usr.overlays -= 'Rasengan.dmi'
									//		if(prob(35))
										//		usr.Exp += rand(0.18,0.37)
										//	else
									//			if(random70==3)
									//				usr.Exp += rand(0.3,0.38)
										/*if(Atton)
											sleep(15/usr.Agility)
											viewers() << "[M] manages to block [usr]!"
											flick("Attack",usr)
											// M.Health -= ((damage/M.Defence)/1.5)
											usr.Taijutsu = usr.MaxTaijutsu
											usr.overlays -= 'Chidori.dmi' usr.overlays -= 'Dark-Chidori.dmi'
											usr.drain=0
											usr.overlays -= 'Rasengan.dmi'

											usr.attacking=0
											var/random41=rand(1,40)
											if(prob(35))
												usr.Exp += rand(0.15,0.22)
											else
												if(random41==10)
													usr.Exp += rand(0.2,0.27)*/
							else

								flick("Dodge",M)
								flick("Attack",usr)
								usr.Taijutsu = usr.MaxTaijutsu
								usr.Strength = usr.MaxStrength
								usr.overlays -= 'Chidori.dmi'
								usr.overlays -= 'Dark-Chidori.dmi'
								usr.overlays -= 'Rasengan.dmi'
								usr.drain=0
								usr.Rasengan=0
								usr.Chidori=0
							//	if(prob(35))
							//		usr.Exp += rand(0.15,0.22)
							//	else
							//		if(random50==10)
							//			usr.Exp += rand(0.2,0.27)

								/*if(Atton)
									sleep(15/usr.Agility)
									flick("Dodge",M)
									viewers() << "[M] manages to dodge [usr]!"
									flick("Attack",usr)
									usr.Taijutsu = usr.MaxTaijutsu
									usr.overlays -= 'Chidori.dmi' usr.overlays -= 'Dark-Chidori.dmi'
									usr.overlays -= 'Rasengan.dmi'
									usr.drain=0
									usr.Chidori=0
									usr.Rasengan=0
									usr.attacking=0
									var/random51=rand(1,40)
									if(prob(35))
										usr.Exp += rand(0.15,0.22)
									else
										if(random51==10)
											usr.Exp += rand(0.2,0.27)*/


					else
						flick("Dodge",M)
						flick(usr,"Attack")
						usr.Taijutsu = usr.MaxTaijutsu
						usr.Strength = usr.MaxStrength
						usr.overlays -= 'Chidori.dmi'
						usr.overlays -= 'Dark-Chidori.dmi'
						usr.overlays -= 'Rasengan.dmi'
						usr.drain=0
						usr.Chidori=0
						usr.Rasengan=0
					//	if(prob(35))
					//		usr.Exp += rand(0.15,0.22)
					//	else
					//		if(random60==10)
					//			usr.Exp += rand(0.2,0.27)

						random = rand(1,20)
						if(random<=9)
							flick("Attack",usr)
							// M.Health -= ((damage/M.Defence)/2.5)
							usr.Taijutsu = usr.MaxTaijutsu
							usr.Strength = usr.MaxStrength
							usr.overlays -= 'Chidori.dmi'
							usr.overlays -= 'Dark-Chidori.dmi'
							usr.drain=0
							usr.overlays -= 'Rasengan.dmi'
					//		if(prob(35))
						//		usr.Exp += rand(0.15,0.22)
						//	else
						//		if(random40==10)
						//			usr.Exp += rand(0.2,0.27)
							if(usr.Juuken)
								flick("Attack",usr)
								// M.Health -= ((damage/M.Defence)/2.5)
								M.Chakra -= damage*1.5
								usr.Taijutsu = usr.MaxTaijutsu
								usr.Strength = usr.MaxStrength
								usr.overlays -= 'Chidori.dmi'
								usr.overlays -= 'Dark-Chidori.dmi'
								usr.drain=0
								usr.overlays -= 'Rasengan.dmi'
						//		if(prob(35))
							//		usr.Exp += rand(0.15,0.22)
						//		else
							//		if(random100==10)
						//				usr.Exp += rand(0.2,0.27)
							if(usr.Rasengan)
								flick("Attack",usr)
								// M.Health -= damage
								usr.Taijutsu = usr.MaxTaijutsu
								usr.Strength = usr.MaxStrength
								usr.overlays -= 'Chidori.dmi'
								usr.overlays -= 'Dark-Chidori.dmi'
								step(M,usr.dir)
								step(M,usr.dir)
								usr.Rasengan=0
								usr.drain=0
								usr.overlays -= 'Rasengan.dmi'
							//	if(prob(35))
							//		usr.Exp += rand(0.18,0.37)
							//	else
							//		if(random70==3)
							//			usr.Exp += rand(0.3,0.38)

						/*if(Atton)
							sleep(15/usr.Agility)
							flick("Dodge",M)
							viewers() << "[M] manages to dodge [usr]!"
							flick(usr,"Attack")
							usr.Taijutsu = usr.MaxTaijutsu
							usr.overlays -= 'Chidori.dmi' usr.overlays -= 'Dark-Chidori.dmi'
							usr.overlays -= 'Rasengan.dmi'
							usr.drain=0
							usr.Rasengan=0
							usr.Chidori=0
							usr.attacking=0
							var/random61=rand(1,40)
							if(prob(35))
								usr.Exp += rand(0.15,0.22)
							else
								if(random61==10)
									usr.Exp += rand(0.2,0.27)*/
					usr.Stamina -= 1.2
					if(usr.Stamina <0)
						usr.Stamina = 0
					if(usr.Agility<=100)
						sleep(rand(5,8))
						usr.attacking=0
					if(usr.Agility>=100)
						sleep(rand(4,5))
						usr.attacking=0
					if(M) M.Ko(usr)
					usr.Spar_Gain()
					/*usr.RAttack()
					if(M.client)
						M.RAttack()*/
				else
					return
			break*/




mob/proc
	Ko(var/LOL)

		if(src.Health <= 0&&src.client&&!src.KO&&!Dead)
			src.KO=1
			winset(src,"default.BreathLabel","is-visible=false")
			winset(src,"default.BreathBar","is-visible=false")
			var/random1=rand(1,10)
			if(random1==4)
				src.Health=rand(10,30)
			//	src.Exp+=rand(0.50,0.80)
				spawn(rand(100,500)) src.UnKo()
				return
			spawn(rand(1000,1900))
				src.UnKo()
				return
			if(src.Health <=0)
				src.Health = 1
			src.move=0
			src.icon_state = "KO"
			for(var/mob/L in viewers(15))
				if(LOL)
					L<<output("<font size = -3><font color=silver><b>[src] has been knocked-out by [LOL]","outputic.output")
					L<<output("<font size = -3><font color=silver><b>[src] has been knocked-out by [LOL]","outputall.output")
					L.ChatLog("<font color=red>*[src.name]([src.key]) just <i><font color=white>KNOCKED OUT<font color=red></i> by [LOL]([LOL:key])")
				else
					L<<output("<font size = -3><font color=silver><b>[src] has been knocked out.","outputic.output")
					L<<output("<font size = -3><font color=silver><b>[src] has been knocked out.","outputall.output")
					L.ChatLog("<font color=red>*[src.name]([src.key]) has been knocked out.")
			for(var/obj/Technology/Camera/C in viewers(20))
				if(LOL) C.appendToLog("<font color=silver><b>[src] has been knocked-out by [LOL]")
				else C.appendToLog("<font color=silver><b>[src] has been knocked-out.")

		if(istype(src,/mob/KageBunshin)||istype(src,/mob/OboroBunshin)||istype(src,/mob/Bunshin))
	//		New()
			flick('Icons/Bunshin.dmi',src)
			del(src)
		if(istype(src,/mob/Dog))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)","outputic.output")
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)","outputall.output")
				src.overlays = null
				flick('Icons/Bunshin.dmi',src)
				sleep(2)
				if(usr) usr.attacking=0
				del(src)

		if(istype(src,/mob/Puppet))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)","outputic.output")
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)","outputall.output")
				src.overlays = null
				flick('Icons/Bunshin.dmi',src)
				sleep(2)
				if(usr) usr.attacking=0
				del(src)

		if(istype(src,/mob/Bugs))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)","outputic.output")
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)","outputall.output")
				src.overlays = null
				flick('Icons/Bunshin.dmi',src)
				sleep(2)
				if(usr) usr.attacking=0
				del(src)

		if(istype(src,/mob/Wolf))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)","outputic.output")
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)","outputall.output")
				src.overlays = null
				flick('Icons/Bunshin.dmi',src)
				sleep(2)
				if(usr) usr.attacking=0
				del(src)

		if(istype(src,/mob/Snake))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)","outputic.output")
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)","outputall.output")
				src.overlays = null
				flick('Icons/Bunshin.dmi',src)
				sleep(2)
				if(usr) usr.attacking=0
				del(src)

		if(istype(src,/mob/Med_Snake))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)","outputic.output")
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)","outputall.output")
				src.overlays = null
				flick('Icons/Bunshin.dmi',src)
				sleep(2)
				if(usr) usr.attacking=0
				del(src)

		if(istype(src,/mob/Med_Slug))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)","outputic.output")
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)","outputall.output")
				src.overlays = null
				flick('Icons/Bunshin.dmi',src)
				sleep(2)
				if(usr) usr.attacking=0
				del(src)

		if(istype(src,/mob/Slug))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)","outputic.output")
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)","outputall.output")
				src.overlays = null
				flick('Icons/Bunshin.dmi',src)
				sleep(2)
				if(usr) usr.attacking=0
				del(src)

		if(istype(src,/mob/Med_Toad))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)","outputic.output")
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)","outputall.output")
				src.overlays = null
				flick('Icons/Bunshin.dmi',src)
				sleep(2)
				if(usr) usr.attacking=0
				del(src)

		if(istype(src,/mob/King_Enma))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)","outputic.output")
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)","outputall.output")
				src.overlays = null
				flick('Icons/Bunshin.dmi',src)
				sleep(2)
				if(usr) usr.attacking=0
				del(src)

		if(istype(src,/mob/Summoning/Big_Frog))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)","outputic.output")
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)","outputall.output")
				src.overlays = null
				flick('Icons/Bunshin.dmi',src)
				sleep(2)
				if(usr) usr.attacking=0
				del(src)

		if(istype(src,/mob/Big_Snake/Big_Snake))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)","outputic.output")
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)","outputall.output")
				src.overlays = null
				flick('Icons/Bunshin.dmi',src)
				sleep(2)
				if(usr) usr.attacking=0
				del(src)

		if(istype(src,/mob/Bijuu/Shukaku))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)","outputic.output")
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)","outputall.output")
				src.overlays = null
				flick('Icons/Bunshin.dmi',src)
				sleep(2)
				if(usr) usr.attacking=0
				del(src)

		/*if(istype(src,/mob/Daisan_no_Me))
			if(src.Health <=0)
				src.Health = 0
				src.overlays = null
				flick('Bunshin.dmi',src)
				sleep(2)
				usr.attacking=0
				del(src)*/


		if(istype(src,/mob/Cat))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)","outputic.output")
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)","outputall.output")
				src.overlays = null
				flick('Icons/Bunshin.dmi',src)
				sleep(2)
				if(usr) usr.attacking=0
				del(src)
		if(istype(src,/mob/summon))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>The summoning fades into the air<font color = white>*)","outputic.output")
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)","outputall.output")
				src.overlays = null
				flick('Icons/Bunshin.dmi',src)
				sleep(2)
				if(usr) usr.attacking=0
				del(src)
		if(istype(src,/mob/Toad))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)","outputic.output")
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)","outputall.output")
				src.overlays = null
				flick('Icons/Bunshin.dmi',src)
				sleep(2)
				if(usr) usr.attacking=0
				del(src)

		if(istype(src,/mob/TsuchiBunshin))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] becomes disfigured as they melt into the ground<font color = white>*)","outputic.output")
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] becomes disfigured as they melt into the ground<font color = white>*)","outputall.output")
				src.overlays = null
				flick('Mud.dmi',src)
				sleep(2)
				if(usr) usr.attacking=0
				del(src)
		if(istype(src,/mob/MizuBunshin))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] becomes disfigured as they melt into the ground<font color = white>*)","outputic.output")
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] becomes disfigured as they melt into the ground<font color = white>*)","outputall.output")
				src.overlays = null
				flick('Water.dmi',src)
				sleep(2)
				if(usr) usr.attacking=0
				del(src)
		if(istype(src,/mob/KatonBunshin))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] bursts into flames<font color = white>*)","outputic.output")
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] bursts into flames<font color = white>*)","outputall.output")
				src.overlays = null
				flick('Fire.dmi',src)
				sleep(2)
				if(usr) usr.attacking=0
				del(src)
		if(istype(src,/mob/RaitonBunshin))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] explodes into a number of electrical sparks<font color = white>*)","outputic.output")
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] explodes into a number of electrical sparks<font color = white>*)","outputall.output")
				src.overlays = null
				flick(src,'Spark.dmi')
				sleep(2)
				if(usr) usr.attacking=0
				del(src)

		if(istype(src,/mob/Bunshin))
			viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)","outputic.output")
			viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)","outputall.output")
			src.overlays = null
			flick('Bunshin.dmi',src)
			sleep(2)
			if(usr) usr.attacking=0
			del(src)

		if(istype(src,/mob/Rinnegan_Body))
			viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)","outputic.output")
			viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)","outputall.output")
			src.overlays = null
			flick('Bunshin.dmi',src)
			del(src)
			sleep(2)
			if(usr) usr.attacking=0
			src.client.perspective=EYE_PERSPECTIVE
			src.client.eye=src
			src.controlled=null
			src<<output("<font size = -3>You are no longer controlling a Body.","outputic.output")


		if(istype(src,/mob/Log/Log))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>The [src] breaks<font color = white>*)","outputic.output")
				viewers(src) << output("<font size = -3><font color = white>(*<font color=[src.SayFont]>The [src] breaks<font color = white>*)","outputall.output")
				src.overlays = null
				flick(src,'Broke.dmi')
				sleep(2)
				if(usr) usr.attacking=0
				del(src)

	UnKo()
		if(usr.roped) return
		if(src.KO)
			src.move=1
			src.attacking=0
			viewers(src,6) << output("<font size = -3><font color=silver><b>[src] regains consciousness","outputic.output")
			viewers(src,6) << output("<font size = -3><font color=silver><b>[src] regains consciousness","outputall.output")
			sleep(2)
			src.attacking=0
			src.KO=0
			src.icon_state = ""

