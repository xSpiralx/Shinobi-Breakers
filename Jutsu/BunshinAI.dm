mob/Bump(mob/A)
	..()
	if(istype(A,/mob)) if(istype(src,/mob/KageBunshin)|istype(src,/mob/TsuchiBunshin)|istype(src,/mob/OboroBunshin)|istype(src,/mob/GravityBunshin)|istype(src,/mob/RaitonBunshin)|istype(src,/mob/KatonBunshin)|istype(src,/mob/MizuBunshin))
		if(!client&&!A.displaykey==src.displaykey) spawn BunshinAttack()
		if(A.Health<=0&&!client)
			move=0
			sleep(50)
			for(var/mob/B in oviewers(1)) if(B==A)
				spawn A.Ko()
			if(!KO) move=1
mob/proc
	BunshinAttack()
		var/random
		for(var/mob/M in get_step(src,dir))
			if(!src.KO&&!M.KO&&M.attackable&&!src.attacking&&src.Stamina >= (src.MaxStamina/50))

				var/damage = rand((src.Strength-M.Defence)-src.Taijutsu,(src.Strength-M.Defence)+src.Taijutsu)
				if(damage<0)
					damage=0
				if(damage*1.5>=M.MaxHealth)
					damage=(usr.Strength/M.Defence+M.Taijutsu)/1.5
				if(damage*1.5>=500)
					damage=(usr.Strength/M.Defence+M.Taijutsu)*rand(1.5,2.5)
				src.attacking=1
				if((src.Agility*rand(1,2)) >= M.Agility)
					random = rand(1,10)
					if(random<=9)
						if((src.Strength*rand(1,2)) >= M.Defence)
							random = rand(1,10)
							if(random<=9)
								flick("Attack",src)
								// M.Health -= damage

							else

								flick("Attack",src)
								// M.Health -= ((damage/M.Defence)/1.5)

					else
						random = rand(1,10)
						if(random<=8)
							if((src.Strength*rand(1,2)) >= M.Defence)
								random = rand(1,10)
								if(random<=9)
									flick("Attack",src)
									// M.Health -= damage

								else

									flick("Attack",src)
									// M.Health -= ((damage/M.Defence)/1.5)
						else
							//viewers()<<output("[M] manages to dodge [src]!"
							flick("Dodge",M)
							flick("Attack",src)
				else
					//viewers()<<output("[M] manages to dodge [src]!"
					flick("Dodge",M)
					flick(src,"Attack")
				M.Ko()
				src.experiance+=0.01
				src.Stamina -= (src.MaxStamina/50)
				if(src.Stamina <0)
					src.Stamina = 0
				sleep(20)
				src.attacking=0
				src.move=1
				spawn(30)
					BunshinAttack()