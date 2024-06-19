mob/var/tmp
	list/recentverbs = list()
mob/proc/RecentVerbCheck(var/verbs, var/timer, var/spam = 0)
	if(src.Admin) return 0
	if(recentverbs["[verbs]"])
		if(world.realtime-recentverbs["[verbs]"] < timer)
			if(spam) src << output("<font size = -3>You must wait before using this.","outputic.output")
			if(spam) src << output("<font size = -3>You must wait before using this.","outputall.output")
			return 1
	return 0

mob
	var
		RegenHealth = 1.2
		RegenChakra = 8
		regen=1
		tmp/move=1
		strpcnt
		agipcnt
		defpcnt
		offpcnt

		conpcnt
		respcnt

		taipcnt
		ninpcnt
		genpcnt

		ptotal
		etotal
		jtotal
		tmp/overlayed
mob/var/tmp/DeathWarnings=0
mob
	proc
		/*updateHealth()
			var/percent=round(src.Health/src.MaxHealth*100,10)
			if(percent>100) percent=100
			if(percent<0) percent=0
			for(var/obj/hudMeters/o in src.client.screen)
				o.icon_state=num2text(percent)
			spawn(10)
				src.updateHealth()
		updateChakra()
			var/percent=round(src.Chakra/src.MaxChakra*100,10)
			if(percent>100) percent=100
			if(percent<0) percent=0
			for(var/obj/hudMeters2/o in src.client.screen)
				o.icon_state=num2text(percent)
			spawn(10)
				src.updateChakra()*/



		RPCheck()
	//		set background=1
	//		while(src)
	//			sleep(rand(8,17))
	//			if(!client) continue
	//			var/text=winget(src,"default.saybar","text")
	//			if(text&&text!=""&&!overlayed)
	//				overlays+='Bubble2.dmi'
	//				overlayed=1
	//			else
	//				overlays-='Bubble2.dmi'
	//				overlayed=0

		Regenerate()
			set background = 1
			while(src)
				sleep(rand(30,50))
				if(!name) del(src)
				see_in_dark=3
				if(usr.Byakugan) see_in_dark=6
				if(usr.Sharingan) see_in_dark=4
				if(usr.Ghost) see_in_dark=99
				Greatest_Stat()
				if(!src.KO)
					if(src.Health<src.MaxHealth)
						src.Health+=src.RegenHealth
						if(src.Health>src.MaxHealth)
							src.Health=src.MaxHealth
					if(src.Chakra<src.MaxChakra)
						src.Chakra+=src.RegenChakra
						if(src.Chakra>src.MaxChakra)
							src.Chakra=src.MaxChakra
				if(Fishing&&autoafk)
					Fishing=0
					move=1
					src<<output("<font size = -3>You were forced to stop fishing!","outputic.output")
					src<<output("<font size = -3>You were forced to stop fishing!","outputall.output")
					icon_state=""
				if(Mining&&autoafk)
					Mining=0
					move=1
					src<<output("<font size = -3>You were forced to stop mining!","outputic.output")
					src<<output("<font size = -3>You were forced to stop mining!","outputall.output")
					icon_state=""
				/*src.Learning()*/
				Caps()
				Ko()

		/*RAttack()
			src.regen=0
			spawn(70)
			src.regen=1*/

		Caps()// Acad - 100, Genin - 200, Chunin - 450, Jounin - 650, Anbu - null, Sannin - 800.

			if(src.MaxStamina > src.Cap * src.StaminaGain)
				src.MaxStamina = src.Cap * src.StaminaGain
			if(src.MaxStrength > src.Cap * src.StrengthGain)
				src.MaxStrength = src.Cap * src.StrengthGain
		//	if(src.Exp > src.Cap/5)
		//		src.Exp = src.Cap/5
			///	if(src.Exp >= 500)
			//		src.Exp = src.Exp/3
			if(src.MaxAgility > src.Cap * src.AgilityGain)
				src.MaxAgility = src.Cap * src.AgilityGain
			if(src.MaxDefence > src.Cap * src.DefenceGain)
				src.MaxDefence = src.Cap * src.DefenceGain
			if(src.MaxOffence > src.Cap * src.OffenceGain)
				src.MaxOffence = src.Cap * src.OffenceGain
			if(src.MaxControl > src.Cap * src.ControlGain)
				src.MaxControl = src.Cap * src.ControlGain
			if(src.MaxResistance > src.Cap * src.ResistanceGain)
				src.MaxResistance = src.Cap * src.ResistanceGain
			if(src.MaxChakra > src.Cap * src.ChakraGain)
				src.MaxChakra = src.Cap * src.ChakraGain
			if(src.MaxNinjutsu > src.Cap * src.NinjutsuGain)
				src.MaxNinjutsu = src.Cap * src.NinjutsuGain
			if(src.MaxGenjutsu > src.Cap * src.GenjutsuGain)
				src.MaxGenjutsu = src.Cap * src.GenjutsuGain
			if(src.MaxTaijutsu > src.Cap * src.TaijutsuGain)
				src.MaxTaijutsu = src.Cap * src.TaijutsuGain
			if(src.MaxOffence > src.Cap * src.OffenceGain)
				src.MaxOffence = src.Cap * src.OffenceGain


		Greatest_Stat()
			//Energy
		//	src.etotal=(src.MaxControl+src.MaxResistance)
			src.conpcnt=(src.MaxControl/10)
			src.respcnt=(src.MaxResistance/10)

			//Physical
			//src.ptotal=(src.MaxStrength+src.MaxAgility+src.MaxDefence+src.MaxOffence)
			src.strpcnt=(src.MaxStrength/10)
			src.agipcnt=(src.MaxAgility/10)
			src.defpcnt=(src.MaxDefence/10)
			src.offpcnt=(src.MaxOffence/10)

			//Jutsu
			//src.jtotal=(src.MaxTaijutsu+src.MaxNinjutsu+src.MaxGenjutsu)
			src.taipcnt=(src.MaxTaijutsu/10)
			src.ninpcnt=(src.MaxNinjutsu/10)
			src.genpcnt=(src.MaxGenjutsu/10)




/*
		Learning()
			for(var/mob/M in oviewers(7))
				if(!M.teaching)
					continue
				if(M.teaching)
					if(M.PrimaryElement=="Fire"||M.SecondaryElement=="Fire"||M.TrietaryElement=="Fire")
						if(src.PrimaryElement=="Fire"||src.SecondaryElement=="Fire"||M.TrietaryElement=="Fire")
							if(src)
								for(var/obj/Ninjutsu/Dragonfire/A in M.contents)
									if(A.Active)
										if(locate(/obj/Ninjutsu/Dragonfire,src.contents))
											continue
										if(prob(20))
											src.contents += new/obj/Ninjutsu/Dragonfire
											viewers(16) << output("[M] has learned Katon: Ryuuka No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) Katon: Ryuuka.</i>"
								for(var/obj/custom_jutsu/A in M.contents)
									if(A.active&&A.element=="Fire")
										if(PrimaryElement=="Fire"||SecondaryElement=="Fire"||TrietaryElement=="Fire")
											if(locate(/obj/custom_jutsu,src.contents))
												continue
											if(prob(20))
												var/obj/custom_jutsu/O=copyatom(A)
												contents+=O
												viewers(16) << output("[M] has learned [A.yell_name] from [src].","outputic.output")
												for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.yell_name].</i>"
								for(var/obj/Ninjutsu/Dai_Endan/A in M.contents)
									if(A.Active)
										if(locate(/obj/Ninjutsu/Dai_Endan,src.contents))
											continue
										if(prob(20))
											src.contents += new/obj/Ninjutsu/Dai_Endan
											viewers(16) << output("[M] has learned Katon: Dai Endan No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) Katon: Dai Endan.</i>"
								for(var/obj/Ninjutsu/Endan/A in M.contents)
									if(A.Active)
										if(locate(/obj/Ninjutsu/Endan,src.contents))
											continue
										if(prob(20))
											src.contents += new/obj/Ninjutsu/Endan
											viewers(16) << output("[M] has learned Katon: Endan No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.name].</i>"
								for(var/obj/Ninjutsu/Goukakyuu/A in M.contents)
									if(A.Active)
										if(locate(/obj/Ninjutsu/Goukakyuu,src.contents))
											continue
										if(prob(20))
											src.contents += new/obj/Ninjutsu/Goukakyuu
											viewers(16) << output("[M] has learned Katon: Goukakyuu No Jutsu from [src].","outputic.output")

											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.name].</i>"


								for(var/obj/Ninjutsu/Housenka/B in M.contents)
									if(B.Active)
										if(locate(/obj/Ninjutsu/Housenka,src.contents))
											continue
										if(prob(30))
											src.contents += new/obj/Ninjutsu/Housenka
											viewers(16) << output("[M] has learned Katon: Housenka No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [B.name].</i>"

								for(var/obj/Ninjutsu/Hibashiri/C in M.contents)
									if(C.Active)
										if(locate(/obj/Ninjutsu/Hibashiri,src.contents))
											continue
										if(prob(30))
											src.contents += new/obj/Ninjutsu/Hibashiri
											viewers(16) << output("[M] has learned Katon: Hibashiri No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"

								for(var/obj/Ninjutsu/KatonBunshin/C in M.contents)
									if(C.Active)
										if(locate(/obj/Ninjutsu/KatonBunshin,src.contents))
											continue
										if(prob(30))
											src.contents += new/obj/Ninjutsu/KatonBunshin
											viewers(16) << output("[M] has learned Katon Bunshin No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"

							if(src)
								for(var/obj/Ninjutsu/Dragonfire/A in M.contents)
									if(A.Active)
										if(locate(/obj/Ninjutsu/Dragonfire,src.contents))
											continue
										if(prob(40))
											src.contents += new/obj/Ninjutsu/Dragonfire
											viewers(16) << output("[M] has learned Katon: Ryuuka No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.name].</i>"

								for(var/obj/Ninjutsu/Dai_Endan/A in M.contents)
									if(A.Active)
										if(locate(/obj/Ninjutsu/Dai_Endan,src.contents))
											continue
										if(prob(40))
											src.contents += new/obj/Ninjutsu/Dai_Endan
											viewers(16) << output("[M] has learned Katon: Dai Endan No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.name].</i>"

								for(var/obj/Ninjutsu/Endan/A in M.contents)
									if(A.Active)
										if(locate(/obj/Ninjutsu/Endan,src.contents))
											continue
										if(prob(50))
											src.contents += new/obj/Ninjutsu/Endan
											viewers(16) << output("[M] has learned Katon: Endan No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.name].</i>"

								for(var/obj/Ninjutsu/Goukakyuu/A in M.contents)
									if(A.Active)
										if(locate(/obj/Ninjutsu/Goukakyuu,src.contents))
											continue
										if(prob(40))
											src.contents += new/obj/Ninjutsu/Goukakyuu
											viewers(16) << output("[M] has learned Katon: Goukakyuu No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.name].</i>"



								for(var/obj/Ninjutsu/Housenka/B in M.contents)
									if(B.Active)
										if(locate(/obj/Ninjutsu/Housenka,src.contents))
											continue
										if(prob(50))
											src.contents += new/obj/Ninjutsu/Housenka
											viewers(16) << output("[M] has learned Katon: Housenka No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [B.name].</i>"

								for(var/obj/Ninjutsu/Hibashiri/C in M.contents)
									if(C.Active)
										if(locate(/obj/Ninjutsu/Hibashiri,src.contents))
											continue
										if(prob(40))
											src.contents += new/obj/Ninjutsu/Hibashiri
											viewers(16) << output("[M] has learned Katon: Hibashiri No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"

								for(var/obj/Ninjutsu/KatonBunshin/C in M.contents)
									if(C.Active)
										if(locate(/obj/Ninjutsu/KatonBunshin,src.contents))
											continue
										if(prob(50))
											src.contents += new/obj/Ninjutsu/KatonBunshin
											viewers(16) << output("[M] has learned Katon Bunshin No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"

							if(src)
								for(var/obj/Ninjutsu/Dragonfire/A in M.contents)
									if(A.Active)
										if(locate(/obj/Ninjutsu/Dragonfire,src.contents))
											continue
										if(prob(60))
											src.contents += new/obj/Ninjutsu/Dragonfire
											viewers(16) << output("[M] has learned Katon: Ryuuka No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.name].</i>"

								for(var/obj/Ninjutsu/Dai_Endan/A in M.contents)
									if(A.Active)
										if(locate(/obj/Ninjutsu/Dai_Endan,src.contents))
											continue
										if(prob(70))
											src.contents += new/obj/Ninjutsu/Dai_Endan
											viewers(16) << output("[M] has learned Katon: Dai Endan No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.name].</i>"

								for(var/obj/Ninjutsu/Endan/A in M.contents)
									if(A.Active)
										if(locate(/obj/Ninjutsu/Endan,src.contents))
											continue
										if(prob(60))
											src.contents += new/obj/Ninjutsu/Endan
											viewers(16) << output("[M] has learned Katon: Endan No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.name].</i>"

								for(var/obj/Ninjutsu/Goukakyuu/A in M.contents)
									if(A.Active)
										if(locate(/obj/Ninjutsu/Goukakyuu,src.contents))
											continue
										if(prob(70))
											src.contents += new/obj/Ninjutsu/Goukakyuu
											viewers(16) << output("[M] has learned Katon: Goukakyuu No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.name].</i>"



								for(var/obj/Ninjutsu/Housenka/B in M.contents)
									if(B.Active)
										if(locate(/obj/Ninjutsu/Housenka,src.contents))
											continue
										if(prob(70))
											src.contents += new/obj/Ninjutsu/Housenka
											viewers(16) << output("[M] has learned Katon: Housenka No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [B.name].</i>"

								for(var/obj/Ninjutsu/Hibashiri/C in M.contents)
									if(C.Active)
										if(locate(/obj/Ninjutsu/Hibashiri,src.contents))
											continue
										if(prob(50))
											src.contents += new/obj/Ninjutsu/Hibashiri
											viewers(16) << output("[M] has learned Katon: Hibashiri No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"

								for(var/obj/Ninjutsu/KatonBunshin/C in M.contents)
									if(C.Active)
										if(locate(/obj/Ninjutsu/KatonBunshin,src.contents))
											continue
										if(prob(70))
											src.contents += new/obj/Ninjutsu/KatonBunshin
											viewers(16) << output("[M] has learned Katon Bunshin No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"








					if(M.PrimaryElement=="Water"||M.SecondaryElement=="Water"||M.TrietaryElement=="Water")
						if(src.PrimaryElement=="Water"||src.SecondaryElement=="Water"||M.TrietaryElement=="Water")

							if(src)
								for(var/obj/custom_jutsu/A in M.contents)
									if(A.active&&A.element=="Water")
										if(PrimaryElement=="Water"||SecondaryElement=="Water"||TrietaryElement=="Water")
											if(locate(/obj/custom_jutsu,src.contents))
												continue
											if(prob(20))
												var/obj/custom_jutsu/O=copyatom(A)
												contents+=O
												viewers(16) << output("[M] has learned [A.yell_name] from [src].","outputic.output")
												for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.yell_name].</i>"
								for(var/obj/Ninjutsu/Suirou/A in M.contents)
									if(A.Active)
										if(locate(/obj/Ninjutsu/Suirou,src.contents))
											continue
										if(prob(20))
											src.contents += new/obj/Ninjutsu/Suirou
											viewers(16) << output("[M] has learned Suirou No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.name].</i>"

								for(var/obj/Ninjutsu/Suiryuudan/B in M.contents)
									if(B.Active)
										if(locate(/obj/Ninjutsu/Suiryuudan,src.contents))
											continue
										if(prob(30))
											src.contents += new/obj/Ninjutsu/Suiryuudan
											viewers(16) << output("[M] has learned Suiryuudan No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [B.name].</i>"

								for(var/obj/Ninjutsu/Daibakufu_no_Jutsu/B in M.contents)
									if(B.Active)
										if(locate(/obj/Ninjutsu/Daibakufu_no_Jutsu,src.contents))
											continue
										if(prob(30))
											src.contents += new/obj/Ninjutsu/Daibakufu_no_Jutsu
											viewers(16) << output("[M] has learned Daibakufu No Jutsu from [src].","outputic.output")

											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [B.name].</i>"

								for(var/obj/Ninjutsu/Baku_Suishouha/B in M.contents)
									if(B.Active)
										if(locate(/obj/Ninjutsu/Baku_Suishouha,src.contents))
											continue
										if(prob(20))
											src.contents += new/obj/Ninjutsu/Baku_Suishouha
											viewers(16) << output("[M] has learned Baku Suishouha No Jutsu from [src].","outputic.output")

											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [B.name].</i>"

								for(var/obj/Ninjutsu/Water_Propell_Jet/B in M.contents)
									if(B.Active)
										if(locate(/obj/Ninjutsu/Water_Propell_Jet,src.contents))
											continue
										if(prob(30))
											src.contents += new/obj/Ninjutsu/Water_Propell_Jet
											viewers(16) << output("[M] has learned Suiton: Propell Jet No Jutsu from [src].","outputic.output")

											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [B.name].</i>"


								for(var/obj/Ninjutsu/MizuBunshin/C in M.contents)
									if(C.Active)
										if(locate(/obj/Ninjutsu/MizuBunshin,src.contents))
											continue
										if(prob(30))
											src.contents += new/obj/Ninjutsu/MizuBunshin
											viewers(16) << output("[M] has learned Mizu Bunshin No Jutsu from [src].","outputic.output")

											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"

							if(src)
								for(var/obj/Ninjutsu/Suirou/A in M.contents)
									if(A.Active)
										if(locate(/obj/Ninjutsu/Suirou,src.contents))
											continue
										if(prob(40))
											src.contents += new/obj/Ninjutsu/Suirou
											viewers(16) << output("[M] has learned Suirou No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.name].</i>"

								for(var/obj/Ninjutsu/Suiryuudan/B in M.contents)
									if(B.Active)
										if(locate(/obj/Ninjutsu/Suiryuudan,src.contents))
											continue
										if(prob(50))
											src.contents += new/obj/Ninjutsu/Suiryuudan
											viewers(16) << output("[M] has learned Suiryuudan No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [B.name].</i>"

								for(var/obj/Ninjutsu/Baku_Suishouha/B in M.contents)
									if(B.Active)
										if(locate(/obj/Ninjutsu/Baku_Suishouha,src.contents))
											continue
										if(prob(30))
											src.contents += new/obj/Ninjutsu/Baku_Suishouha
											viewers(16) << output("[M] has learned Baku Suishouha No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [B.name].</i>"

								for(var/obj/Ninjutsu/Daibakufu_no_Jutsu/B in M.contents)
									if(B.Active)
										if(locate(/obj/Ninjutsu/Daibakufu_no_Jutsu,src.contents))
											continue
										if(prob(40))
											src.contents += new/obj/Ninjutsu/Daibakufu_no_Jutsu
											viewers(16) << output("[M] has learned Daibakufu No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [B.name].</i>"

								for(var/obj/Ninjutsu/Water_Propell_Jet/B in M.contents)
									if(B.Active)
										if(locate(/obj/Ninjutsu/Water_Propell_Jet,src.contents))
											continue
										if(prob(50))
											src.contents += new/obj/Ninjutsu/Water_Propell_Jet
											viewers(16) << output("[M] has learned Suiton: Propell Jet No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [B.name].</i>"



								for(var/obj/Ninjutsu/MizuBunshin/C in M.contents)
									if(C.Active)
										if(locate(/obj/Ninjutsu/MizuBunshin,src.contents))
											continue
										if(prob(70))
											src.contents += new/obj/Ninjutsu/MizuBunshin
											viewers(16) << output("[M] has learned Mizu Bunshin No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
							if(src)
								for(var/obj/Ninjutsu/Suirou/A in M.contents)
									if(A.Active)
										if(locate(/obj/Ninjutsu/Suirou,src.contents))
											continue
										if(prob(60))
											src.contents += new/obj/Ninjutsu/Suirou
											viewers(16) << output("[M] has learned Suirou No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.name].</i>"

								for(var/obj/Ninjutsu/Suiryuudan/B in M.contents)
									if(B.Active)
										if(locate(/obj/Ninjutsu/Suiryuudan,src.contents))
											continue
										if(prob(70))
											src.contents += new/obj/Ninjutsu/Suiryuudan
											viewers(16) << output("[M] has learned Suiryuudan No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [B.name].</i>"

								for(var/obj/Ninjutsu/MizuBunshin/C in M.contents)
									if(C.Active)
										if(locate(/obj/Ninjutsu/MizuBunshin,src.contents))
											continue
										if(prob(80))
											src.contents += new/obj/Ninjutsu/MizuBunshin
											viewers(16) << output("[M] has learned Mizu Bunshin No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"

								for(var/obj/Ninjutsu/Baku_Suishouha/B in M.contents)
									if(B.Active)
										if(locate(/obj/Ninjutsu/Baku_Suishouha,src.contents))
											continue
										if(prob(50))
											src.contents += new/obj/Ninjutsu/Baku_Suishouha
											viewers(16) << output("[M] has learned Baku Suishouha No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [B.name].</i>"

								for(var/obj/Ninjutsu/Daibakufu_no_Jutsu/B in M.contents)
									if(B.Active)
										if(locate(/obj/Ninjutsu/Daibakufu_no_Jutsu,src.contents))
											continue
										if(prob(60))
											src.contents += new/obj/Ninjutsu/Daibakufu_no_Jutsu
											viewers(16) << output("[M] has learned Daibakufu No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [B.name].</i>"

								for(var/obj/Ninjutsu/Water_Propell_Jet/B in M.contents)
									if(B.Active)
										if(locate(/obj/Ninjutsu/Water_Propell_Jet,src.contents))
											continue
										if(prob(70))
											src.contents += new/obj/Ninjutsu/Water_Propell_Jet
											viewers(16) << output("[M] has learned Suiton: Propell Jet No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [B.name].</i>"




					if(M.PrimaryElement=="Wind"||M.SecondaryElement=="Wind"||M.TrietaryElement=="Wind")
						if(src.PrimaryElement=="Wind"||src.SecondaryElement=="Wind"||M.TrietaryElement=="Wind")
							if(src)
								for(var/obj/custom_jutsu/A in M.contents)
									if(A.active&&A.element=="Wind")
										if(PrimaryElement=="Wind"||SecondaryElement=="Wind"||TrietaryElement=="Wind")
											if(locate(/obj/custom_jutsu,src.contents))
												continue
											if(prob(20))
												var/obj/custom_jutsu/O=copyatom(A)
												contents+=O
												viewers(16) << output("[M] has learned [A.yell_name] from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.yell_name].</i>"
								for(var/obj/Ninjutsu/Kaze/A in M.contents)
									if(A.Active)
										if(locate(/obj/Ninjutsu/Kaze,src.contents))
											continue
										if(prob(20))
											src.contents += new/obj/Ninjutsu/Kaze
											viewers(16) << output("[M] has learned Kaze No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.name].</i>"

								for(var/obj/Ninjutsu/Kaze_no_Yaiba/A in M.contents)
									if(A.Active)
										if(locate(/obj/Ninjutsu/Kaze_no_Yaiba,src.contents))
											continue
										if(prob(10))
											src.contents += new/obj/Ninjutsu/Kaze_no_Yaiba
											viewers(16) << output("[M] has learned Kaze no Yaiba No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.name].</i>"

								for(var/obj/Ninjutsu/Kazekiri/A in M.contents)
									if(A.Active)
										if(locate(/obj/Ninjutsu/Kazekiri,src.contents))
											continue
										if(prob(10))
											src.contents += new/obj/Ninjutsu/Kazekiri
											viewers(16) << output("[M] has learned Kazekiri No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.name].</i>"


								for(var/obj/Ninjutsu/Renkuudan/B in M.contents)
									if(B.Active)
										if(locate(/obj/Ninjutsu/Renkuudan,src.contents))
											continue
										if(prob(30))
											src.contents += new/obj/Ninjutsu/Renkuudan
											viewers(16) << output("[M] has learned Renkuudan No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [B.name].</i>"

								for(var/obj/Ninjutsu/OboroBunshin/C in M.contents)
									if(C.Active)
										if(locate(/obj/Ninjutsu/OboroBunshin,src.contents))
											continue
										if(prob(30))
											src.contents += new/obj/Ninjutsu/OboroBunshin
											viewers(16) << output("[M] has learned Oboro Bunshin No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"

							if(src)
								for(var/obj/Ninjutsu/Kaze/A in M.contents)
									if(A.Active)
										if(locate(/obj/Ninjutsu/Kaze,src.contents))
											continue
										if(prob(30))
											src.contents += new/obj/Ninjutsu/Kaze
											viewers(16) << output("[M] has learned Kaze No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.name].</i>"

								for(var/obj/Ninjutsu/Renkuudan/B in M.contents)
									if(B.Active)
										if(locate(/obj/Ninjutsu/Renkuudan,src.contents))
											continue
										if(prob(50))
											src.contents += new/obj/Ninjutsu/Renkuudan
											viewers(16) << output("[M] has learned Renkuudan No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [B.name].</i>"

								for(var/obj/Ninjutsu/OboroBunshin/C in M.contents)
									if(C.Active)
										if(locate(/obj/Ninjutsu/OboroBunshin,src.contents))
											continue
										if(prob(60))
											src.contents += new/obj/Ninjutsu/OboroBunshin
											viewers(16) << output("[M] has learned Oboro Bunshin No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"

								for(var/obj/Ninjutsu/Reppushou/B in M.contents)
									if(B.Active)
										if(locate(/obj/Ninjutsu/Reppushou,src.contents))
											continue
										if(prob(30))
											src.contents += new/obj/Ninjutsu/Reppushou
											viewers(16) << output("[M] has learned Reppushou No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [B.name].</i>"

								for(var/obj/Ninjutsu/Kaze_no_Yaiba/A in M.contents)
									if(A.Active)
										if(locate(/obj/Ninjutsu/Kaze_no_Yaiba,src.contents))
											continue
										if(prob(30))
											src.contents += new/obj/Ninjutsu/Kaze_no_Yaiba
											viewers(16) << output("[M] has learned Kaze no Yaiba No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.name].</i>"

								for(var/obj/Ninjutsu/Kazekiri/A in M.contents)
									if(A.Active)
										if(locate(/obj/Ninjutsu/Kazekiri,src.contents))
											continue
										if(prob(30))
											src.contents += new/obj/Ninjutsu/Kazekiri
											viewers(16) << output("[M] has learned Kazekiri No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.name].</i>"



							if(src)
								for(var/obj/Ninjutsu/Kaze/A in M.contents)
									if(A.Active)
										if(locate(/obj/Ninjutsu/Kaze,src.contents))
											continue
										if(prob(50))
											src.contents += new/obj/Ninjutsu/Kaze
											viewers(16) << output("[M] has learned Kaze No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.name].</i>"

								for(var/obj/Ninjutsu/Renkuudan/B in M.contents)
									if(B.Active)
										if(locate(/obj/Ninjutsu/Renkuudan,src.contents))
											continue
										if(prob(60))
											src.contents += new/obj/Ninjutsu/Renkuudan
											viewers(16) << output("[M] has learned Renkuudan No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [B.name].</i>"

								for(var/obj/Ninjutsu/OboroBunshin/C in M.contents)
									if(C.Active)
										if(locate(/obj/Ninjutsu/OboroBunshin,src.contents))
											continue
										if(prob(70))
											src.contents += new/obj/Ninjutsu/OboroBunshin
											viewers(16) << output("[M] has learned Oboro Bunshin No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"

								for(var/obj/Ninjutsu/Kaze_no_Yaiba/A in M.contents)
									if(A.Active)
										if(locate(/obj/Ninjutsu/Kaze_no_Yaiba,src.contents))
											continue
										if(prob(40))
											src.contents += new/obj/Ninjutsu/Kaze_no_Yaiba
											viewers(16) << output("[M] has learned Kaze no Yaiba No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.name].</i>"

								for(var/obj/Ninjutsu/Reppushou/B in M.contents)
									if(B.Active)
										if(locate(/obj/Ninjutsu/Reppushou,src.contents))
											continue
										if(prob(50))
											src.contents += new/obj/Ninjutsu/Reppushou
											viewers(16) << output("[M] has learned Reppushou No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [B.name].</i>"


								for(var/obj/Ninjutsu/Kazekiri/A in M.contents)
									if(A.Active)
										if(locate(/obj/Ninjutsu/Kazekiri,src.contents))
											continue
										if(prob(40))
											src.contents += new/obj/Ninjutsu/Kazekiri
											viewers(16) << output("[M] has learned Kazekiri No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.name].</i>"




					if(M.PrimaryElement=="Earth"||M.SecondaryElement=="Earth"||M.TrietaryElement=="Earth")
						if(src.PrimaryElement=="Earth"||src.SecondaryElement=="Earth"||M.TrietaryElement=="Earth")
							if(src)
								for(var/obj/custom_jutsu/A in M.contents)
									if(A.active&&A.element=="Earth")
										if(PrimaryElement=="Earth"||SecondaryElement=="Earth"||TrietaryElement=="Earth")
											if(locate(/obj/custom_jutsu,src.contents))
												continue
											if(prob(20))
												var/obj/custom_jutsu/O=copyatom(A)
												contents+=O
												viewers(16) << output("[M] has learned [A.yell_name] from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.yell_name].</i>"
								for(var/obj/Ninjutsu/Doryudan/A in M.contents)
									if(A.Active)
										if(locate(/obj/Ninjutsu/Doryudan,src.contents))
											continue
										if(prob(20))
											src.contents += new/obj/Ninjutsu/Doryudan
											viewers(16) << output("[M] has learned Doryudan No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.name].</i>"

								for(var/obj/Ninjutsu/Doryuheki/B in M.contents)
									if(B.Active)
										if(locate(/obj/Ninjutsu/Doryuheki,src.contents))
											continue
										if(prob(30))
											src.contents += new/obj/Ninjutsu/Doryuheki
											viewers(16) << output("[M] has learned Doryuheki No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [B.name].</i>"

								for(var/obj/Ninjutsu/Domu/B in M.contents)
									if(B.Active)
										if(locate(/obj/Ninjutsu/Domu,src.contents))
											continue
										if(prob(30))
											src.contents += new/obj/Ninjutsu/Domu
											viewers(16) << output("[M] has learned Domu No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [B.name].</i>"

								for(var/obj/Ninjutsu/TsuchiBunshin/C in M.contents)
									if(C.Active)
										if(locate(/obj/Ninjutsu/TsuchiBunshin,src.contents))
											continue
										if(prob(30))
											src.contents += new/obj/Ninjutsu/TsuchiBunshin
											viewers(16) << output("[M] has learned Tsuchi Bunshin No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"

							if(src)
								for(var/obj/Ninjutsu/Doryudan/A in M.contents)
									if(A.Active)
										if(locate(/obj/Ninjutsu/Doryudan,src.contents))
											continue
										if(prob(40))
											src.contents += new/obj/Ninjutsu/Doryudan
											viewers(16) << output("[M] has learned Doryudan No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.name].</i>"

								for(var/obj/Ninjutsu/Doryuheki/B in M.contents)
									if(B.Active)
										if(locate(/obj/Ninjutsu/Doryuheki,src.contents))
											continue
										if(prob(60))
											src.contents += new/obj/Ninjutsu/Doryuheki
											viewers(16) << output("[M] has learned Doryuheki No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [B.name].</i>"

								for(var/obj/Ninjutsu/Domu/B in M.contents)
									if(B.Active)
										if(locate(/obj/Ninjutsu/Domu,src.contents))
											continue
										if(prob(50))
											src.contents += new/obj/Ninjutsu/Domu
											viewers(16) << output("[M] has learned Domu No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [B.name].</i>"


								for(var/obj/Ninjutsu/TsuchiBunshin/C in M.contents)
									if(C.Active)
										if(locate(/obj/Ninjutsu/TsuchiBunshin,src.contents))
											continue
										if(prob(50))
											src.contents += new/obj/Ninjutsu/TsuchiBunshin
											viewers(16) << output("[M] has learned Tsuchi Bunshin No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"

							if(src)
								for(var/obj/Ninjutsu/Doryudan/A in M.contents)
									if(A.Active)
										if(locate(/obj/Ninjutsu/Doryudan,src.contents))
											continue
										if(prob(60))
											src.contents += new/obj/Ninjutsu/Doryudan
											viewers(16) << output("[M] has learned Doryudan No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.name].</i>"

								for(var/obj/Ninjutsu/Doryuheki/B in M.contents)
									if(B.Active)
										if(locate(/obj/Ninjutsu/Doryuheki,src.contents))
											continue
										if(prob(80))
											src.contents += new/obj/Ninjutsu/Doryuheki
											viewers(16) << output("[M] has learned Doryuheki No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [B.name].</i>"

								for(var/obj/Ninjutsu/Domu/B in M.contents)
									if(B.Active)
										if(locate(/obj/Ninjutsu/Domu,src.contents))
											continue
										if(prob(60))
											src.contents += new/obj/Ninjutsu/Domu
											viewers(16) << output("[M] has learned Domu No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [B.name].</i>"

								for(var/obj/Ninjutsu/TsuchiBunshin/C in M.contents)
									if(C.Active)
										if(locate(/obj/Ninjutsu/TsuchiBunshin,src.contents))
											continue
										if(prob(70))
											src.contents += new/obj/Ninjutsu/TsuchiBunshin
											viewers(16) << output("[M] has learned Tsuchi Bunshin No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"

					if(M.PrimaryElement=="Lightning"||M.SecondaryElement=="Lightning"||M.TrietaryElement=="Lightning")
						if(src.PrimaryElement=="Lightning"||src.SecondaryElement=="Lightning"||M.TrietaryElement=="Lightning")
							if(src)
								for(var/obj/custom_jutsu/A in M.contents)
									if(A.active&&A.element=="Lightning")
										if(PrimaryElement=="Lightning"||SecondaryElement=="Lightning"||TrietaryElement=="Lightning")
											if(locate(/obj/custom_jutsu,src.contents))
												continue
											if(prob(20))
												var/obj/custom_jutsu/O=copyatom(A)
												contents+=O
												viewers(16) << output("[M] has learned [A.yell_name] from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.name].</i>"
								for(var/obj/Ninjutsu/Ikazuchi/A in M.contents)
									if(A.Active)
										if(locate(/obj/Ninjutsu/Ikazuchi,src.contents))
											continue
										if(prob(20))
											src.contents += new/obj/Ninjutsu/Ikazuchi
											viewers(16) << output("[M] has learned Ikazuchi No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.name].</i>"

								for(var/obj/Taijutsu/Jibashi/B in M.contents)
									if(B.Active)
										if(locate(/obj/Taijutsu/Jibashi,src.contents))
											continue
										if(prob(30))
											src.contents += new/obj/Taijutsu/Jibashi
											viewers(16) << output("[M] has learned Jibashi No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [B.name].</i>"

								for(var/obj/Ninjutsu/RaitonBunshin/C in M.contents)
									if(C.Active)
										if(locate(/obj/Ninjutsu/RaitonBunshin,src.contents))
											continue
										if(prob(30))
											src.contents += new/obj/Ninjutsu/RaitonBunshin
											viewers(16) << output("[M] has learned Ration Bunshin No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"

							if(src)
								for(var/obj/Ninjutsu/Ikazuchi/A in M.contents)
									if(A.Active)
										if(locate(/obj/Ninjutsu/Ikazuchi,src.contents))
											continue
										if(prob(40))
											src.contents += new/obj/Ninjutsu/Ikazuchi
											viewers(16) << output("[M] has learned Ikazuchi No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.name].</i>"

								for(var/obj/Ninjutsu/Ikadzuchi_no_Kiba/A in M.contents)
									if(A.Active)
										if(locate(/obj/Ninjutsu/Ikadzuchi_no_Kiba,src.contents))
											continue
										if(prob(40))
											src.contents += new/obj/Ninjutsu/Ikadzuchi_no_Kiba
											viewers(16) << output("[M] has learned Ikadzuchi_no_Kiba from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.name].</i>"

								for(var/obj/Ninjutsu/Raikyuu/A in M.contents)
									if(A.Active)
										if(locate(/obj/Ninjutsu/Raikyuu,src.contents))
											continue
										if(prob(40))
											src.contents += new/obj/Ninjutsu/Raikyuu
											viewers(16) << output("[M] has learned Raikyuu no Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.name].</i>"

								for(var/obj/Ninjutsu/Raiton_no_Yoroi/A in M.contents)
									if(A.Active)
										if(locate(/obj/Ninjutsu/Raiton_no_Yoroi,src.contents))
											continue
										if(prob(40))
											src.contents += new/obj/Ninjutsu/Raiton_no_Yoroi
											viewers(16) << output("[M] has learned Raiton no Yoroi from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.name].</i>"


								for(var/obj/Taijutsu/Jibashi/B in M.contents)
									if(B.Active)
										if(locate(/obj/Taijutsu/Jibashi,src.contents))
											continue
										if(prob(60))
											src.contents += new/obj/Taijutsu/Jibashi
											viewers(16) << output("[M] has learned Jibashi No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [B.name].</i>"

								for(var/obj/Ninjutsu/RaitonBunshin/C in M.contents)
									if(C.Active)
										if(locate(/obj/Ninjutsu/RaitonBunshin,src.contents))
											continue
										if(prob(60))
											src.contents += new/obj/Ninjutsu/RaitonBunshin
											viewers(16) << output("[M] has learned Ration Bunshin No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"

							if(src)
								for(var/obj/Ninjutsu/Ikazuchi/A in M.contents)
									if(A.Active)
										if(locate(/obj/Ninjutsu/Ikazuchi,src.contents))
											continue
										if(prob(60))
											src.contents += new/obj/Ninjutsu/Ikazuchi
											viewers(16) << output("[M] has learned Ikazuchi No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.name].</i>"


								for(var/obj/Taijutsu/Jibashi/B in M.contents)
									if(B.Active)
										if(locate(/obj/Taijutsu/Jibashi,src.contents))
											continue
										if(prob(80))
											src.contents += new/obj/Taijutsu/Jibashi
											viewers(16) << output("[M] has learned Jibashi No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [B.name].</i>"

								for(var/obj/Ninjutsu/RaitonBunshin/C in M.contents)
									if(C.Active)
										if(locate(/obj/Ninjutsu/RaitonBunshin,src.contents))
											continue
										if(prob(70))
											src.contents += new/obj/Ninjutsu/RaitonBunshin
											viewers(16) << output("[M] has learned Ration Bunshin No Jutsu from [src].","outputic.output")
											for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"

					if(src)
						for(var/obj/custom_jutsu/A in M.contents)
							if(A.active&&!A.element)
								if(locate(/obj/custom_jutsu,src.contents))
									continue
								if(prob(20))
									var/obj/custom_jutsu/O=copyatom(A)
									contents+=O
									viewers(16) << output("[M] has learned [A.yell_name] from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.name].</i>"





						for(var/obj/Ninjutsu/Mushi_Yose_no_Jutsu/C in M.contents)
							if(C.Active&&src.Aburame)
								if(locate(/obj/Ninjutsu/Mushi_Yose_no_Jutsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Mushi_Yose_no_Jutsu
									viewers(16) << output("[M] has learned Mushi Yose no Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Kikaichuu_no_Jutsu/C in M.contents)
							if(C.Active&&src.Aburame)
								if(locate(/obj/Ninjutsu/Kikaichuu_no_Jutsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Kikaichuu_no_Jutsu
									viewers(16) << output("[M] has learned Kikaichuu no Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Mushi_Dama/C in M.contents)
							if(C.Active&&src.Aburame)
								if(locate(/obj/Ninjutsu/Mushi_Dama,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Mushi_Dama
									viewers(16) << output("[M] has learned Mushi Dama from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Nikudan_Sensha/C in M.contents)
							if(C.Active&&src.Akimichi)
								if(locate(/obj/Taijutsu/Nikudan_Sensha,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Nikudan_Sensha
									viewers(16) << output("[M] has learned Nikudan Sensha from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Choudan_Bakugeki/C in M.contents)
							if(C.Active&&src.Akimichi)
								if(locate(/obj/Taijutsu/Choudan_Bakugeki,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Choudan_Bakugeki
									viewers(16) << output("[M] has learned Choudan Bakugeki from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Bubun_Baika_no_Jutsu/C in M.contents)
							if(C.Active&&src.Akimichi)
								if(locate(/obj/Ninjutsu/Bubun_Baika_no_Jutsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Bubun_Baika_no_Jutsu
									viewers(16) << output("[M] has learned Bubun Baika no Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Doujutsu/Byakugan/C in M.contents)
							if(C.Active&&src.Hyuuga)
								if(locate(/obj/Doujutsu/Byakugan,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Doujutsu/Byakugan
									viewers(16) << output("[M] has learned how to unlock their Byakugan from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Hachimon_Kaimon/C in M.contents)
							if(C.Active)
								if(locate(/obj/Taijutsu/Hachimon_Kaimon,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Hachimon_Kaimon
									viewers(16) << output("[M] has learned Hachimon Kaimon from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Hachimon_Kyuumon/C in M.contents)
							if(C.Active)
								if(locate(/obj/Taijutsu/Hachimon_Kyuumon,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Hachimon_Kyuumon
									viewers(16) << output("[M] has learned Hachimon Kyuumon from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Hachimon_Seimon/C in M.contents)
							if(C.Active)
								if(locate(/obj/Taijutsu/Hachimon_Seimon,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Hachimon_Seimon
									viewers(16) << output("[M] has learned Hachimon Seimon from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Hachimon_Shoumon/C in M.contents)
							if(C.Active)
								if(locate(/obj/Taijutsu/Hachimon_Shoumon,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Hachimon_Shoumon
									viewers(16) << output("[M] has learned Hachimon Shoumon from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Hachimon_Tomon/C in M.contents)
							if(C.Active)
								if(locate(/obj/Taijutsu/Hachimon_Tomon,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Hachimon_Tomon
									viewers(16) << output("[M] has learned Hachimon Tomon from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Hachimon_Keimon/C in M.contents)
							if(C.Active)
								if(locate(/obj/Taijutsu/Hachimon_Keimon,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Hachimon_Keimon
									viewers(16) << output("[M] has learned Hachimon Keimon from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Hachimon_Kyomon/C in M.contents)
							if(C.Active)
								if(locate(/obj/Taijutsu/Hachimon_Kyomon,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Hachimon_Kyomon
									viewers(16) << output("[M] has learned Hachimon Kyomon from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Hachimon_Shimon/C in M.contents)
							if(C.Active)
								if(locate(/obj/Taijutsu/Hachimon_Shimon,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Hachimon_Shimon
									viewers(16) << output("[M] has learned Hachimon Shimon from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Suika_no_Jutsu/C in M.contents)
							if(C.Active&&Hozuki)
								if(locate(/obj/Ninjutsu/Suika_no_Jutsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Suika_no_Jutsu
									viewers(16) << output("[M] has learned Suika no Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Gousuiwan_no_Jutsu/C in M.contents)
							if(C.Active&&Hozuki)
								if(locate(/obj/Ninjutsu/Gousuiwan_no_Jutsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Gousuiwan_no_Jutsu
									viewers(16) << output("[M] has learned Gousuiwan no Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Water_Propell_Jet/C in M.contents)
							if(C.Active&&Hozuki)
								if(locate(/obj/Ninjutsu/Water_Propell_Jet,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Water_Propell_Jet
									viewers(16) << output("[M] has learned Water Propell Jet from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Suigadan/C in M.contents)
							if(C.Active)
								if(locate(/obj/Ninjutsu/Suigadan,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Suigadan
									viewers(16) << output("[M] has learned Suigadan from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Reito/C in M.contents)
							if(C.Active)
								if(locate(/obj/Ninjutsu/Reito,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Reito
									viewers(16) << output("[M] has learned Reito from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Gatsuga/C in M.contents)
							if(C.Active&&Inuzuka)
								if(locate(/obj/Ninjutsu/Gatsuga,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Gatsuga
									viewers(16) << output("[M] has learned Gatsuga from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Tessenka_no_Mai/C in M.contents)
							if(C.Active&&Kaguya)
								if(locate(/obj/Taijutsu/Tessenka_no_Mai,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Tessenka_no_Mai
									viewers(16) << output("[M] has learned Tessenka no Mai from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Yanagi_no_Mai/C in M.contents)
							if(C.Active&&Kaguya)
								if(locate(/obj/Taijutsu/Yanagi_no_Mai,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Yanagi_no_Mai
									viewers(16) << output("[M] has learned Yanagi no Mai from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Tsubaki_no_Mai/C in M.contents)
							if(C.Active&&Kaguya)
								if(locate(/obj/Taijutsu/Tsubaki_no_Mai,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Tsubaki_no_Mai
									viewers(16) << output("[M] has learned Tsubaki no Mai from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Tessenka_no_Mai_Hana/C in M.contents)
							if(C.Active&&Kaguya)
								if(locate(/obj/Taijutsu/Tessenka_no_Mai_Hana,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Tessenka_no_Mai_Hana
									viewers(16) << output("[M] has learned Tessenka no Mai Hana from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Karamatsu_no_Mai/C in M.contents)
							if(C.Active&&Kaguya)
								if(locate(/obj/Taijutsu/Karamatsu_no_Mai,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Karamatsu_no_Mai
									viewers(16) << output("[M] has learned Karamatsu no Mai from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Sawarabi_no_Mai/C in M.contents)
							if(C.Active&&Kaguya)
								if(locate(/obj/Taijutsu/Sawarabi_no_Mai,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Sawarabi_no_Mai
									viewers(16) << output("[M] has learned Sawarabi no Mai from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Shosen/C in M.contents)
							if(C.Active)
								if(locate(/obj/Ninjutsu/Shosen,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Shosen
									viewers(16) << output("[M] has learned Shosen from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Saikan_Chuushutsu_no_Jutsu/C in M.contents)
							if(C.Active)
								if(locate(/obj/Ninjutsu/Saikan_Chuushutsu_no_Jutsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Saikan_Chuushutsu_no_Jutsu
									viewers(16) << output("[M] has learned Saikan Chuushutsu no Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Kishou_Tensi_no_Jutsu/C in M.contents)
							if(C.Active)
								if(locate(/obj/Ninjutsu/Kishou_Tensi_no_Jutsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Kishou_Tensi_no_Jutsu
									viewers(16) << output("[M] has learned Kishou Tensi no Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Shometsu/C in M.contents)
							if(C.Active)
								if(locate(/obj/Ninjutsu/Shometsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Shometsu
									viewers(16) << output("[M] has learned Shometsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Chakra_Kyuuin_Jutsu/C in M.contents)
							if(C.Active)
								if(locate(/obj/Ninjutsu/Chakra_Kyuuin_Jutsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Chakra_Kyuuin_Jutsu
									viewers(16) << output("[M] has learned Chakra Kyuuin from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Chakra_no_Mesu/C in M.contents)
							if(C.Active)
								if(locate(/obj/Ninjutsu/Chakra_no_Mesu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Chakra_no_Mesu
									viewers(16) << output("[M] has learned Chakra no Mesu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Kagemane/C in M.contents)
							if(C.Active&&Nara)
								if(locate(/obj/Ninjutsu/Kagemane,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Kagemane
									viewers(16) << output("[M] has learned Kagemane from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Kage_Kubi_Shibari_no_Jutsu/C in M.contents)
							if(C.Active&&Nara)
								if(locate(/obj/Ninjutsu/Kage_Kubi_Shibari_no_Jutsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Kage_Kubi_Shibari_no_Jutsu
									viewers(16) << output("[M] has learned Kage Kubi Shibari from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Genjutsu/Jabaku_Satsu/C in M.contents)
							if(C.Active)
								if(locate(/obj/Genjutsu/Jabaku_Satsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Genjutsu/Jabaku_Satsu
									viewers(16) << output("[M] has learned Jabaku Satsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Genjutsu/Kokaungyo/C in M.contents)
							if(C.Active)
								if(locate(/obj/Genjutsu/Kokaungyo,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Genjutsu/Kokaungyo
									viewers(16) << output("[M] has learned Kokaungyo from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Genjutsu/Nehan_Shoja/C in M.contents)
							if(C.Active)
								if(locate(/obj/Genjutsu/Nehan_Shoja,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Genjutsu/Nehan_Shoja
									viewers(16) << output("[M] has learned Nehan Shoja from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Genjutsu/Toton/C in M.contents)
							if(C.Active)
								if(locate(/obj/Genjutsu/Toton,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Genjutsu/Toton
									viewers(16) << output("[M] has learned Toton from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Genjutsu/Shikumi_no_Jutsu/C in M.contents)
							if(C.Active)
								if(locate(/obj/Genjutsu/Shikumi_no_Jutsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Genjutsu/Shikumi_no_Jutsu
									viewers(16) << output("[M] has learned Shikumi from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Genjutsu/Kori_Shinchuu_no_Jutsu/C in M.contents)
							if(C.Active)
								if(locate(/obj/Genjutsu/Kori_Shinchuu_no_Jutsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Genjutsu/Kori_Shinchuu_no_Jutsu
									viewers(16) << output("[M] has learned Kori Shinchuu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"

						for(var/obj/Genjutsu/Bunshin/C in M.contents)
							if(C.Active)
								if(locate(/obj/Genjutsu/Bunshin,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Genjutsu/Bunshin
									viewers(16) << output("[M] has learned Bunshin No Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"


						for(var/obj/Genjutsu/Henge/C in M.contents)
							if(C.Active)
								if(locate(/obj/Genjutsu/Henge,src.contents))
									continue
								if(prob(40))
									src.contents += new/obj/Genjutsu/Henge
									viewers(16) << output("[M] has learned Henge No Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"

						for(var/obj/Genjutsu/Toton/C in M.contents)
							if(C.Active)
								if(locate(/obj/Genjutsu/Toton,src.contents))
									continue
								if(prob(10))
									src.contents += new/obj/Genjutsu/Toton
									viewers(16) << output("[M] has learned Toton No Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"

						for(var/obj/Genjutsu/Nehan_Shoja/C in M.contents)
							if(C.Active)
								if(locate(/obj/Genjutsu/Nehan_Shoja,src.contents))
									continue
								if(prob(10))
									src.contents += new/obj/Genjutsu/Nehan_Shoja
									viewers(16) << output("[M] has learned Nehan Shoja No Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"


						for(var/obj/Ninjutsu/Kawarimi/C in M.contents)
							if(C.Active)
								if(locate(/obj/Ninjutsu/Kawarimi,src.contents))
									continue
								if(prob(25))
									src.contents += new/obj/Ninjutsu/Kawarimi
									viewers(16) << output("[M] has learned Kawarimi No Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Suimen_Hokou_no_Waza/C in M.contents)
							if(C.Active)
								if(locate(/obj/Ninjutsu/Suimen_Hokou_no_Waza,src.contents))
									continue
								if(prob(10))
									src.contents += new/obj/Ninjutsu/Suimen_Hokou_no_Waza
									viewers(16) << output("[M] has learned Suimen Hokou no Waza from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"

						for(var/obj/Ninjutsu/KageBunshin/C in M.contents)
							if(C.Active)
								if(locate(/obj/Ninjutsu/KageBunshin,src.contents))
									continue
								if(prob(2))
									src.contents += new/obj/Ninjutsu/KageBunshin
									viewers(16) << output("[M] has learned Kage Bunshin no Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"

						for(var/obj/Ninjutsu/Shunshin/C in M.contents)
							if(C.Active)
								if(locate(/obj/Ninjutsu/Shunshin,src.contents))
									continue
								if(prob(15))
									src.contents += new/obj/Ninjutsu/Shunshin
									viewers(16) << output("[M] has learned Shunshin No Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
					if(src)
						for(var/obj/custom_jutsu/A in M.contents)
							if(A.active&&!A.element)
								if(locate(/obj/custom_jutsu,src.contents))
									continue
								if(prob(20))
									var/obj/custom_jutsu/O=copyatom(A)
									contents+=O
									viewers(16) << output("[M] has learned [A.yell_name] from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.name].</i>"









						for(var/obj/Ninjutsu/Mushi_Yose_no_Jutsu/C in M.contents)
							if(C.Active&&src.Aburame)
								if(locate(/obj/Ninjutsu/Mushi_Yose_no_Jutsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Mushi_Yose_no_Jutsu
									viewers(16) << output("[M] has learned Mushi Yose no Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Kikaichuu_no_Jutsu/C in M.contents)
							if(C.Active&&src.Aburame)
								if(locate(/obj/Ninjutsu/Kikaichuu_no_Jutsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Kikaichuu_no_Jutsu
									viewers(16) << output("[M] has learned Kikaichuu no Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Mushi_Dama/C in M.contents)
							if(C.Active&&src.Aburame)
								if(locate(/obj/Ninjutsu/Mushi_Dama,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Mushi_Dama
									viewers(16) << output("[M] has learned Mushi Dama from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Nikudan_Sensha/C in M.contents)
							if(C.Active&&src.Akimichi)
								if(locate(/obj/Taijutsu/Nikudan_Sensha,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Nikudan_Sensha
									viewers(16) << output("[M] has learned Nikudan Sensha from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Choudan_Bakugeki/C in M.contents)
							if(C.Active&&src.Akimichi)
								if(locate(/obj/Taijutsu/Choudan_Bakugeki,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Choudan_Bakugeki
									viewers(16) << output("[M] has learned Choudan Bakugeki from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Bubun_Baika_no_Jutsu/C in M.contents)
							if(C.Active&&src.Akimichi)
								if(locate(/obj/Ninjutsu/Bubun_Baika_no_Jutsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Bubun_Baika_no_Jutsu
									viewers(16) << output("[M] has learned Bubun Baika no Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Doujutsu/Byakugan/C in M.contents)
							if(C.Active&&src.Hyuuga)
								if(locate(/obj/Doujutsu/Byakugan,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Doujutsu/Byakugan
									viewers(16) << output("[M] has learned how to unlock their Byakugan from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Hachimon_Kaimon/C in M.contents)
							if(C.Active)
								if(locate(/obj/Taijutsu/Hachimon_Kaimon,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Hachimon_Kaimon
									viewers(16) << output("[M] has learned Hachimon Kaimon from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Hachimon_Kyuumon/C in M.contents)
							if(C.Active)
								if(locate(/obj/Taijutsu/Hachimon_Kyuumon,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Hachimon_Kyuumon
									viewers(16) << output("[M] has learned Hachimon Kyuumon from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Hachimon_Seimon/C in M.contents)
							if(C.Active)
								if(locate(/obj/Taijutsu/Hachimon_Seimon,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Hachimon_Seimon
									viewers(16) << output("[M] has learned Hachimon Seimon from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Hachimon_Shoumon/C in M.contents)
							if(C.Active)
								if(locate(/obj/Taijutsu/Hachimon_Shoumon,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Hachimon_Shoumon
									viewers(16) << output("[M] has learned Hachimon Shoumon from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Hachimon_Tomon/C in M.contents)
							if(C.Active)
								if(locate(/obj/Taijutsu/Hachimon_Tomon,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Hachimon_Tomon
									viewers(16) << output("[M] has learned Hachimon Tomon from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Hachimon_Keimon/C in M.contents)
							if(C.Active)
								if(locate(/obj/Taijutsu/Hachimon_Keimon,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Hachimon_Keimon
									viewers(16) << output("[M] has learned Hachimon Keimon from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Hachimon_Kyomon/C in M.contents)
							if(C.Active)
								if(locate(/obj/Taijutsu/Hachimon_Kyomon,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Hachimon_Kyomon
									viewers(16) << output("[M] has learned Hachimon Kyomon from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Hachimon_Shimon/C in M.contents)
							if(C.Active)
								if(locate(/obj/Taijutsu/Hachimon_Shimon,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Hachimon_Shimon
									viewers(16) << output("[M] has learned Hachimon Shimon from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Suika_no_Jutsu/C in M.contents)
							if(C.Active&&Hozuki)
								if(locate(/obj/Ninjutsu/Suika_no_Jutsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Suika_no_Jutsu
									viewers(16) << output("[M] has learned Suika no Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Gousuiwan_no_Jutsu/C in M.contents)
							if(C.Active&&Hozuki)
								if(locate(/obj/Ninjutsu/Gousuiwan_no_Jutsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Gousuiwan_no_Jutsu
									viewers(16) << output("[M] has learned Gousuiwan no Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Water_Propell_Jet/C in M.contents)
							if(C.Active&&Hozuki)
								if(locate(/obj/Ninjutsu/Water_Propell_Jet,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Water_Propell_Jet
									viewers(16) << output("[M] has learned Water Propell Jet from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Suigadan/C in M.contents)
							if(C.Active)
								if(locate(/obj/Ninjutsu/Suigadan,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Suigadan
									viewers(16) << output("[M] has learned Suigadan from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Reito/C in M.contents)
							if(C.Active)
								if(locate(/obj/Ninjutsu/Reito,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Reito
									viewers(16) << output("[M] has learned Reito from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Gatsuga/C in M.contents)
							if(C.Active&&Inuzuka)
								if(locate(/obj/Ninjutsu/Gatsuga,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Gatsuga
									viewers(16) << output("[M] has learned Gatsuga from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Tessenka_no_Mai/C in M.contents)
							if(C.Active&&Kaguya)
								if(locate(/obj/Taijutsu/Tessenka_no_Mai,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Tessenka_no_Mai
									viewers(16) << output("[M] has learned Tessenka no Mai from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Yanagi_no_Mai/C in M.contents)
							if(C.Active&&Kaguya)
								if(locate(/obj/Taijutsu/Yanagi_no_Mai,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Yanagi_no_Mai
									viewers(16) << output("[M] has learned Yanagi no Mai from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Tsubaki_no_Mai/C in M.contents)
							if(C.Active&&Kaguya)
								if(locate(/obj/Taijutsu/Tsubaki_no_Mai,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Tsubaki_no_Mai
									viewers(16) << output("[M] has learned Tsubaki no Mai from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Tessenka_no_Mai_Hana/C in M.contents)
							if(C.Active&&Kaguya)
								if(locate(/obj/Taijutsu/Tessenka_no_Mai_Hana,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Tessenka_no_Mai_Hana
									viewers(16) << output("[M] has learned Tessenka no Mai Hana from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Karamatsu_no_Mai/C in M.contents)
							if(C.Active&&Kaguya)
								if(locate(/obj/Taijutsu/Karamatsu_no_Mai,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Karamatsu_no_Mai
									viewers(16) << output("[M] has learned Karamatsu no Mai from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Sawarabi_no_Mai/C in M.contents)
							if(C.Active&&Kaguya)
								if(locate(/obj/Taijutsu/Sawarabi_no_Mai,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Sawarabi_no_Mai
									viewers(16) << output("[M] has learned Sawarabi no Mai from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Shosen/C in M.contents)
							if(C.Active)
								if(locate(/obj/Ninjutsu/Shosen,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Shosen
									viewers(16) << output("[M] has learned Shosen from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Saikan_Chuushutsu_no_Jutsu/C in M.contents)
							if(C.Active)
								if(locate(/obj/Ninjutsu/Saikan_Chuushutsu_no_Jutsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Saikan_Chuushutsu_no_Jutsu
									viewers(16) << output("[M] has learned Saikan Chuushutsu no Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Kishou_Tensi_no_Jutsu/C in M.contents)
							if(C.Active)
								if(locate(/obj/Ninjutsu/Kishou_Tensi_no_Jutsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Kishou_Tensi_no_Jutsu
									viewers(16) << output("[M] has learned Kishou Tensi no Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Shometsu/C in M.contents)
							if(C.Active)
								if(locate(/obj/Ninjutsu/Shometsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Shometsu
									viewers(16) << output("[M] has learned Shometsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Chakra_Kyuuin_Jutsu/C in M.contents)
							if(C.Active)
								if(locate(/obj/Ninjutsu/Chakra_Kyuuin_Jutsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Chakra_Kyuuin_Jutsu
									viewers(16) << output("[M] has learned Chakra Kyuuin from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Chakra_no_Mesu/C in M.contents)
							if(C.Active)
								if(locate(/obj/Ninjutsu/Chakra_no_Mesu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Chakra_no_Mesu
									viewers(16) << output("[M] has learned Chakra no Mesu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Kagemane/C in M.contents)
							if(C.Active&&Nara)
								if(locate(/obj/Ninjutsu/Kagemane,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Kagemane
									viewers(16) << output("[M] has learned Kagemane from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Kage_Kubi_Shibari_no_Jutsu/C in M.contents)
							if(C.Active&&Nara)
								if(locate(/obj/Ninjutsu/Kage_Kubi_Shibari_no_Jutsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Kage_Kubi_Shibari_no_Jutsu
									viewers(16) << output("[M] has learned Kage Kubi Shibari from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Genjutsu/Jabaku_Satsu/C in M.contents)
							if(C.Active)
								if(locate(/obj/Genjutsu/Jabaku_Satsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Genjutsu/Jabaku_Satsu
									viewers(16) << output("[M] has learned Jabaku Satsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Genjutsu/Kokaungyo/C in M.contents)
							if(C.Active)
								if(locate(/obj/Genjutsu/Kokaungyo,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Genjutsu/Kokaungyo
									viewers(16) << output("[M] has learned Kokaungyo from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Genjutsu/Nehan_Shoja/C in M.contents)
							if(C.Active)
								if(locate(/obj/Genjutsu/Nehan_Shoja,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Genjutsu/Nehan_Shoja
									viewers(16) << output("[M] has learned Nehan Shoja from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Genjutsu/Toton/C in M.contents)
							if(C.Active)
								if(locate(/obj/Genjutsu/Toton,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Genjutsu/Toton
									viewers(16) << output("[M] has learned Toton from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Genjutsu/Shikumi_no_Jutsu/C in M.contents)
							if(C.Active)
								if(locate(/obj/Genjutsu/Shikumi_no_Jutsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Genjutsu/Shikumi_no_Jutsu
									viewers(16) << output("[M] has learned Shikumi from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Genjutsu/Kori_Shinchuu_no_Jutsu/C in M.contents)
							if(C.Active)
								if(locate(/obj/Genjutsu/Kori_Shinchuu_no_Jutsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Genjutsu/Kori_Shinchuu_no_Jutsu
									viewers(16) << output("[M] has learned Kori Shinchuu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Genjutsu/Bunshin/C in M.contents)
							if(C.Active)
								if(locate(/obj/Genjutsu/Bunshin,src.contents))
									continue
								if(prob(50))
									src.contents += new/obj/Genjutsu/Bunshin
									viewers(16) << output("[M] has learned Bunshin No Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"

						for(var/obj/Genjutsu/Kai/C in M.contents)
							if(C.Active)
								if(locate(/obj/Genjutsu/Kai,src.contents))
									continue
								if(prob(20))
									src.contents += new/obj/Genjutsu/Kai
									viewers(16) << output("[M] has learned Kai No Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"

						for(var/obj/Genjutsu/Nehan_Shoja/C in M.contents)
							if(C.Active)
								if(locate(/obj/Genjutsu/Nehan_Shoja,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Genjutsu/Nehan_Shoja
									viewers(16) << output("[M] has learned Nehan Shoja No Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"

						for(var/obj/Genjutsu/Toton/C in M.contents)
							if(C.Active)
								if(locate(/obj/Genjutsu/Toton,src.contents))
									continue
								if(prob(10))
									src.contents += new/obj/Genjutsu/Toton
									viewers(16) << output("[M] has learned Toton No Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"

						for(var/obj/Genjutsu/Henge/C in M.contents)
							if(C.Active)
								if(locate(/obj/Genjutsu/Henge,src.contents))
									continue
								if(prob(60))
									src.contents += new/obj/Genjutsu/Henge
									viewers(16) << output("[M] has learned Henge No Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"

						for(var/obj/Ninjutsu/Kawarimi/C in M.contents)
							if(C.Active)
								if(locate(/obj/Ninjutsu/Kawarimi,src.contents))
									continue
								if(prob(45))
									src.contents += new/obj/Ninjutsu/Kawarimi
									viewers(16) << output("[M] has learned Kawarimi No Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"

						for(var/obj/Ninjutsu/Shunshin/C in M.contents)
							if(C.Active)
								if(locate(/obj/Ninjutsu/Shunshin,src.contents))
									continue
								if(prob(45))
									src.contents += new/obj/Ninjutsu/Shunshin
									viewers(16) << output("[M] has learned Shunshin No Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"

						for(var/obj/Ninjutsu/Suimen_Hokou_no_Waza/C in M.contents)
							if(C.Active)
								if(locate(/obj/Ninjutsu/Suimen_Hokou_no_Waza,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Suimen_Hokou_no_Waza
									viewers(16) << output("[M] has learned Suimen Hokou no Waza from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/KageBunshin/C in M.contents)
							if(C.Active)
								if(locate(/obj/Ninjutsu/KageBunshin,src.contents))
									continue
								if(prob(15))
									src.contents += new/obj/Ninjutsu/KageBunshin
									viewers(16) << output("[M] has learned Kage Bunshin no Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"

						for(var/obj/Taijutsu/Oukashou/C in M.contents)
							if(C.Active)
								if(locate(/obj/Taijutsu/Oukashou,src.contents))
									continue
								if(prob(55))
									src.contents += new/obj/Taijutsu/Oukashou
									viewers(16) << output("[M] has learned Oukashou from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"


					if(src)
						for(var/obj/custom_jutsu/A in M.contents)
							if(A.active&&!A.element)
								if(locate(/obj/custom_jutsu,src.contents))
									continue
								if(prob(20))
									var/obj/custom_jutsu/O=copyatom(A)
									contents+=O
									viewers(16) << output("[M] has learned [A.yell_name] from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [A.name].</i>"





						for(var/obj/Ninjutsu/Mushi_Yose_no_Jutsu/C in M.contents)
							if(C.Active&&src.Aburame)
								if(locate(/obj/Ninjutsu/Mushi_Yose_no_Jutsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Mushi_Yose_no_Jutsu
									viewers(16) << output("[M] has learned Mushi Yose no Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Kikaichuu_no_Jutsu/C in M.contents)
							if(C.Active&&src.Aburame)
								if(locate(/obj/Ninjutsu/Kikaichuu_no_Jutsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Kikaichuu_no_Jutsu
									viewers(16) << output("[M] has learned Kikaichuu no Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Mushi_Dama/C in M.contents)
							if(C.Active&&src.Aburame)
								if(locate(/obj/Ninjutsu/Mushi_Dama,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Mushi_Dama
									viewers(16) << output("[M] has learned Mushi Dama from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Nikudan_Sensha/C in M.contents)
							if(C.Active&&src.Akimichi)
								if(locate(/obj/Taijutsu/Nikudan_Sensha,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Nikudan_Sensha
									viewers(16) << output("[M] has learned Nikudan Sensha from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Choudan_Bakugeki/C in M.contents)
							if(C.Active&&src.Akimichi)
								if(locate(/obj/Taijutsu/Choudan_Bakugeki,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Choudan_Bakugeki
									viewers(16) << output("[M] has learned Choudan Bakugeki from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Bubun_Baika_no_Jutsu/C in M.contents)
							if(C.Active&&src.Akimichi)
								if(locate(/obj/Ninjutsu/Bubun_Baika_no_Jutsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Bubun_Baika_no_Jutsu
									viewers(16) << output("[M] has learned Bubun Baika no Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Doujutsu/Byakugan/C in M.contents)
							if(C.Active&&src.Hyuuga)
								if(locate(/obj/Doujutsu/Byakugan,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Doujutsu/Byakugan
									viewers(16) << output("[M] has learned how to unlock their Byakugan from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Hachimon_Kaimon/C in M.contents)
							if(C.Active)
								if(locate(/obj/Taijutsu/Hachimon_Kaimon,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Hachimon_Kaimon
									viewers(16) << output("[M] has learned Hachimon Kaimon from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Hachimon_Kyuumon/C in M.contents)
							if(C.Active)
								if(locate(/obj/Taijutsu/Hachimon_Kyuumon,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Hachimon_Kyuumon
									viewers(16) << output("[M] has learned Hachimon Kyuumon from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Hachimon_Seimon/C in M.contents)
							if(C.Active)
								if(locate(/obj/Taijutsu/Hachimon_Seimon,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Hachimon_Seimon
									viewers(16) << output("[M] has learned Hachimon Seimon from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Hachimon_Shoumon/C in M.contents)
							if(C.Active)
								if(locate(/obj/Taijutsu/Hachimon_Shoumon,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Hachimon_Shoumon
									viewers(16) << output("[M] has learned Hachimon Shoumon from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Hachimon_Tomon/C in M.contents)
							if(C.Active)
								if(locate(/obj/Taijutsu/Hachimon_Tomon,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Hachimon_Tomon
									viewers(16) << output("[M] has learned Hachimon Tomon from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Hachimon_Keimon/C in M.contents)
							if(C.Active)
								if(locate(/obj/Taijutsu/Hachimon_Keimon,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Hachimon_Keimon
									viewers(16) << output("[M] has learned Hachimon Keimon from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Hachimon_Kyomon/C in M.contents)
							if(C.Active)
								if(locate(/obj/Taijutsu/Hachimon_Kyomon,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Hachimon_Kyomon
									viewers(16) << output("[M] has learned Hachimon Kyomon from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Hachimon_Shimon/C in M.contents)
							if(C.Active)
								if(locate(/obj/Taijutsu/Hachimon_Shimon,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Hachimon_Shimon
									viewers(16) << output("[M] has learned Hachimon Shimon from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Suika_no_Jutsu/C in M.contents)
							if(C.Active&&Hozuki)
								if(locate(/obj/Ninjutsu/Suika_no_Jutsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Suika_no_Jutsu
									viewers(16) << output("[M] has learned Suika no Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Gousuiwan_no_Jutsu/C in M.contents)
							if(C.Active&&Hozuki)
								if(locate(/obj/Ninjutsu/Gousuiwan_no_Jutsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Gousuiwan_no_Jutsu
									viewers(16) << output("[M] has learned Gousuiwan no Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Water_Propell_Jet/C in M.contents)
							if(C.Active&&Hozuki)
								if(locate(/obj/Ninjutsu/Water_Propell_Jet,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Water_Propell_Jet
									viewers(16) << output("[M] has learned Water Propell Jet from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Suigadan/C in M.contents)
							if(C.Active)
								if(locate(/obj/Ninjutsu/Suigadan,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Suigadan
									viewers(16) << output("[M] has learned Suigadan from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Reito/C in M.contents)
							if(C.Active)
								if(locate(/obj/Ninjutsu/Reito,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Reito
									viewers(16) << output("[M] has learned Reito from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Gatsuga/C in M.contents)
							if(C.Active&&Inuzuka)
								if(locate(/obj/Ninjutsu/Gatsuga,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Gatsuga
									viewers(16) << output("[M] has learned Gatsuga from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Tessenka_no_Mai/C in M.contents)
							if(C.Active&&Kaguya)
								if(locate(/obj/Taijutsu/Tessenka_no_Mai,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Tessenka_no_Mai
									viewers(16) << output("[M] has learned Tessenka no Mai from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Yanagi_no_Mai/C in M.contents)
							if(C.Active&&Kaguya)
								if(locate(/obj/Taijutsu/Yanagi_no_Mai,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Yanagi_no_Mai
									viewers(16) << output("[M] has learned Yanagi no Mai from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Tsubaki_no_Mai/C in M.contents)
							if(C.Active&&Kaguya)
								if(locate(/obj/Taijutsu/Tsubaki_no_Mai,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Tsubaki_no_Mai
									viewers(16) << output("[M] has learned Tsubaki no Mai from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Tessenka_no_Mai_Hana/C in M.contents)
							if(C.Active&&Kaguya)
								if(locate(/obj/Taijutsu/Tessenka_no_Mai_Hana,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Tessenka_no_Mai_Hana
									viewers(16) << output("[M] has learned Tessenka no Mai Hana from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Karamatsu_no_Mai/C in M.contents)
							if(C.Active&&Kaguya)
								if(locate(/obj/Taijutsu/Karamatsu_no_Mai,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Karamatsu_no_Mai
									viewers(16) << output("[M] has learned Karamatsu no Mai from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Taijutsu/Sawarabi_no_Mai/C in M.contents)
							if(C.Active&&Kaguya)
								if(locate(/obj/Taijutsu/Sawarabi_no_Mai,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Taijutsu/Sawarabi_no_Mai
									viewers(16) << output("[M] has learned Sawarabi no Mai from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Shosen/C in M.contents)
							if(C.Active)
								if(locate(/obj/Ninjutsu/Shosen,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Shosen
									viewers(16) << output("[M] has learned Shosen from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Saikan_Chuushutsu_no_Jutsu/C in M.contents)
							if(C.Active)
								if(locate(/obj/Ninjutsu/Saikan_Chuushutsu_no_Jutsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Saikan_Chuushutsu_no_Jutsu
									viewers(16) << output("[M] has learned Saikan Chuushutsu no Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Kishou_Tensi_no_Jutsu/C in M.contents)
							if(C.Active)
								if(locate(/obj/Ninjutsu/Kishou_Tensi_no_Jutsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Kishou_Tensi_no_Jutsu
									viewers(16) << output("[M] has learned Kishou Tensi no Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Shometsu/C in M.contents)
							if(C.Active)
								if(locate(/obj/Ninjutsu/Shometsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Shometsu
									viewers(16) << output("[M] has learned Shometsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Chakra_Kyuuin_Jutsu/C in M.contents)
							if(C.Active)
								if(locate(/obj/Ninjutsu/Chakra_Kyuuin_Jutsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Chakra_Kyuuin_Jutsu
									viewers(16) << output("[M] has learned Chakra Kyuuin from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Chakra_no_Mesu/C in M.contents)
							if(C.Active)
								if(locate(/obj/Ninjutsu/Chakra_no_Mesu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Chakra_no_Mesu
									viewers(16) << output("[M] has learned Chakra no Mesu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Kagemane/C in M.contents)
							if(C.Active&&Nara)
								if(locate(/obj/Ninjutsu/Kagemane,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Kagemane
									viewers(16) << output("[M] has learned Kagemane from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/Kage_Kubi_Shibari_no_Jutsu/C in M.contents)
							if(C.Active&&Nara)
								if(locate(/obj/Ninjutsu/Kage_Kubi_Shibari_no_Jutsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Ninjutsu/Kage_Kubi_Shibari_no_Jutsu
									viewers(16) << output("[M] has learned Kage Kubi Shibari from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Genjutsu/Jabaku_Satsu/C in M.contents)
							if(C.Active)
								if(locate(/obj/Genjutsu/Jabaku_Satsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Genjutsu/Jabaku_Satsu
									viewers(16) << output("[M] has learned Jabaku Satsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Genjutsu/Kokaungyo/C in M.contents)
							if(C.Active)
								if(locate(/obj/Genjutsu/Kokaungyo,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Genjutsu/Kokaungyo
									viewers(16) << output("[M] has learned Kokaungyo from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Genjutsu/Nehan_Shoja/C in M.contents)
							if(C.Active)
								if(locate(/obj/Genjutsu/Nehan_Shoja,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Genjutsu/Nehan_Shoja
									viewers(16) << output("[M] has learned Nehan Shoja from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Genjutsu/Toton/C in M.contents)
							if(C.Active)
								if(locate(/obj/Genjutsu/Toton,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Genjutsu/Toton
									viewers(16) << output("[M] has learned Toton from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Genjutsu/Shikumi_no_Jutsu/C in M.contents)
							if(C.Active)
								if(locate(/obj/Genjutsu/Shikumi_no_Jutsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Genjutsu/Shikumi_no_Jutsu
									viewers(16) << output("[M] has learned Shikumi from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Genjutsu/Kori_Shinchuu_no_Jutsu/C in M.contents)
							if(C.Active)
								if(locate(/obj/Genjutsu/Kori_Shinchuu_no_Jutsu,src.contents))
									continue
								if(prob(30))
									src.contents += new/obj/Genjutsu/Kori_Shinchuu_no_Jutsu
									viewers(16) << output("[M] has learned Kori Shinchuu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Genjutsu/Bunshin/C in M.contents)
							if(C.Active)
								if(locate(/obj/Genjutsu/Bunshin,src.contents))
									continue
								if(prob(70))
									src.contents += new/obj/Genjutsu/Bunshin
									viewers(16) << output("[M] has learned Bunshin No Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"


						for(var/obj/Genjutsu/Henge/C in M.contents)
							if(C.Active)
								if(locate(/obj/Genjutsu/Henge,src.contents))
									continue
								if(prob(90))
									src.contents += new/obj/Genjutsu/Henge
									viewers(16) << output("[M] has learned Henge No Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"

						for(var/obj/Ninjutsu/Kawarimi/C in M.contents)
							if(C.Active)
								if(locate(/obj/Ninjutsu/Kawarimi,src.contents))
									continue
								if(prob(65))
									src.contents += new/obj/Ninjutsu/Kawarimi
									viewers(16) << output("[M] has learned Kawarimi No Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"

						for(var/obj/Ninjutsu/Suimen_Hokou_no_Waza/C in M.contents)
							if(C.Active)
								if(locate(/obj/Ninjutsu/Suimen_Hokou_no_Waza,src.contents))
									continue
								if(prob(90))
									src.contents += new/obj/Ninjutsu/Suimen_Hokou_no_Waza
									viewers(16) << output("[M] has learned Suimen Hokou no Waza from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"
						for(var/obj/Ninjutsu/KageBunshin/C in M.contents)
							if(C.Active)
								if(locate(/obj/Ninjutsu/KageBunshin,src.contents))
									continue
								if(prob(35))
									src.contents += new/obj/Ninjutsu/KageBunshin
									viewers(16) << output("[M] has learned Kage Bunshin no Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"

						for(var/obj/Ninjutsu/Kage_Shuriken/C in M.contents)
							if(C.Active)
								if(locate(/obj/Ninjutsu/Kage_Shuriken,src.contents))
									continue
								if(prob(65))
									src.contents += new/obj/Ninjutsu/Kage_Shuriken
									viewers(16) << output("[M] has learned Kage Shuriken no Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"

						for(var/obj/Taijutsu/Oukashou/C in M.contents)
							if(C.Active)
								if(locate(/obj/Taijutsu/Oukashou,src.contents))
									continue
								if(prob(85))
									src.contents += new/obj/Taijutsu/Oukashou
									viewers(16) << output("[M] has learned Oukashou from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"

						for(var/obj/Ninjutsu/Shunshin/C in M.contents)
							if(C.Active)
								if(locate(/obj/Ninjutsu/Shunshin,src.contents))
									continue
								if(prob(95))
									src.contents += new/obj/Ninjutsu/Shunshin
									viewers(16) << output("[M] has learned Shunshin No Jutsu from [src].","outputic.output")
									for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just taught [M.Oname]([M.key]) [C.name].</i>"





*/
