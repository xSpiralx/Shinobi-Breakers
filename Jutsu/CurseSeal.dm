
mob/var
	Poison=0
	CurseSeal=0
	HasCurseSeal=0
	CurseSeal2=0
	HasCurseSeal2=0

	Earth_CurseSeal=0
	Earth_HasCurseSeal=0
	Earth_CurseSeal2=0
	Earth_HasCurseSeal2=0

	Heaven_CurseSeal=0
	Heaven_HasCurseSeal=0
	Heaven_CurseSeal2=0
	Heaven_HasCurseSeal2=0

	Stone_CurseSeal=0
	Stone_HasCurseSeal=0
	Stone_CurseSeal2=0
	Stone_HasCurseSeal2=0
obj/CurseSeal
	verb
		Unlock_Power()
			set category="Jutsus"
			if(!usr.CurseSeal&&usr.HasCurseSeal&&!usr.Houin)
				usr.overlays += 'CurseSealAura.dmi'
				usr.Chakra *=2.5
				usr.CurseSeal=1
				usr.Taijutsu *= 2.1
				usr.Strength *= 2.1
				usr.Poison=1
				sleep(10)
				usr.Poison2()
				return

			if(!usr.Earth_CurseSeal&&usr.Earth_HasCurseSeal&&!usr.Houin)
				usr.overlays += 'CurseSealAura.dmi'
				sleep(10)
				usr.overlays += 'Earth1.dmi'
				usr.overlays -= 'CurseSealAura.dmi'
				usr.Chakra *=2
				usr.Earth_CurseSeal=1
				usr.Taijutsu *= 2
				usr.Agility *= 1.4
				usr.Strength *= 1.8
				usr.Poison=1
				sleep(5)
				usr.Poison2()
				return

			if(!usr.Earth_CurseSeal2&&usr.Earth_HasCurseSeal2)
				usr.overlays += 'CurseSealAura.dmi'
				sleep(10)
				usr.overlays -= 'Earth1.dmi'
				usr.overlays -= 'CurseSealAura.dmi'
				usr.Chakra *=2.5
				usr.Earth_CurseSeal2=1
				usr.Taijutsu *= 2.4
				usr.Agility *= 2
				usr.Strength *= 2.2
				usr.Poison=1
				sleep(5)
				usr.icon = 'Earth2.dmi'
				usr.Poison2()
				return


			if(!usr.Stone_CurseSeal&&usr.Stone_HasCurseSeal&&!usr.Houin)
				usr.overlays += 'CurseSealAura.dmi'
				sleep(10)
				usr.overlays += 'Stone1.dmi'
				usr.overlays -= 'CurseSealAura.dmi'
				usr.Chakra *=2
				usr.Stone_CurseSeal=1
				usr.Taijutsu *= 1.4
				usr.Agility *= 0.6
				usr.Defence *= 1.8
				usr.Strength *= 1.6
				usr.Poison=1
				sleep(8)
				usr.Poison2()
				return

			if(!usr.Stone_CurseSeal2&&usr.Stone_HasCurseSeal2)
				usr.overlays += 'CurseSealAura.dmi'
				sleep(10)
				usr.overlays -= 'Stone1.dmi'
				usr.overlays -= 'CurseSealAura.dmi'
				usr.Chakra *=2
				usr.Stone_CurseSeal2=1
				usr.Taijutsu *= 1.7
				usr.Defence *= 3
				usr.Strength *= 3
				usr.Agility *= 0.8
				usr.Poison=1
				sleep(8)
				usr.icon = 'Stone2.dmi'
				usr.Poison2()
				return


			if(!usr.Heaven_CurseSeal&&usr.Heaven_HasCurseSeal&&!usr.Houin)
				usr.overlays += 'CurseSealAura.dmi'
				sleep(10)
				usr.overlays += 'Heaven1.dmi'
				usr.overlays -= 'CurseSealAura.dmi'
				usr.Chakra *=2.5
				usr.Heaven_CurseSeal=1
				usr.Taijutsu *= 1.5
				usr.Agility *= 1.6
				usr.Strength *= 1.3
				usr.Poison=1
				sleep(5)
				usr.Poison2()
				return
			if(!usr.Heaven_CurseSeal2&&usr.Heaven_HasCurseSeal2)
				usr.overlays += 'CurseSealAura.dmi'
				sleep(10)
				usr.overlays -= 'Heaven1.dmi'
				usr.overlays -= 'CurseSealAura.dmi'
				sleep(5)
				usr.Chakra *=4
				usr.Heaven_CurseSeal2=1
				usr.Taijutsu *= 1.8
				usr.Agility *= 2.3
				usr.Strength *= 1.7
				usr.icon = 'Heaven2.dmi'
				sleep(20)
				usr.overlays += new/obj/Curse_Seal/Wings
				usr.Poison=1
				sleep(5)
				usr.Poison2()
				return


		Control_Power()
			set category="Jutsus"
			if(usr.Earth_CurseSeal)
				usr.Earth_CurseSeal()
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Agility = usr.MaxAgility
				usr.Strength = usr.MaxStrength
				usr.Poison = 0
				return
			if(usr.Earth_CurseSeal2)
				usr.Earth_CurseSeal2()
				usr.overlays += 'Earth1.dmi'
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Agility = usr.MaxAgility
				usr.Strength = usr.MaxStrength
				usr.Earth_CurseSeal=1
				usr.Poison = 0
				return
			if(usr.Stone_CurseSeal)
				usr.Stone_CurseSeal()
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Agility = usr.MaxAgility
				usr.Defence = usr.MaxDefence
				usr.Strength = usr.MaxStrength
				usr.Poison = 0
				return
			if(usr.Stone_CurseSeal2)
				usr.Stone_CurseSeal2()
				usr.overlays += 'Stone1.dmi'
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Agility = usr.MaxAgility
				usr.Defence = usr.MaxDefence
				usr.Strength = usr.MaxStrength
				usr.Stone_CurseSeal=1
				usr.Poison = 0
				return
			if(usr.Heaven_CurseSeal)
				usr.Heaven_CurseSeal()
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Agility = usr.MaxAgility
				usr.Strength = usr.MaxStrength
				usr.Poison = 0
				return
			if(usr.Heaven_CurseSeal2)
				usr.Heaven_CurseSeal2()
				usr.overlays += 'Heaven1.dmi'
				usr.overlays -= /obj/Curse_Seal/Wings
				usr.Heaven_CurseSeal=1
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Agility = usr.MaxAgility
				usr.Strength = usr.MaxStrength
				usr.Poison = 0
				return
			if(usr.CurseSeal)
				usr.CurseSeal()
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Strength = usr.MaxStrength
				usr.Poison = 0
				return
mob/proc
	CurseSeal()
		if(usr.CurseSeal)
			src.overlays -= 'CurseSealAura.dmi'
			usr.Chakra = usr.MaxChakra
			src.CurseSeal=0
	Earth_CurseSeal()
		if(usr.Earth_CurseSeal)
			usr.overlays -= 'Earth1.dmi'
			usr.Chakra = usr.MaxChakra
			src.Earth_CurseSeal=0
	Stone_CurseSeal()
		if(usr.Stone_CurseSeal)
			usr.overlays -= 'Stone1.dmi'
			usr.Chakra = usr.MaxChakra
			src.Stone_CurseSeal=0
	Heaven_CurseSeal()
		if(usr.Heaven_CurseSeal)
			usr.overlays -= 'Heaven1.dmi'
			usr.Chakra = usr.MaxChakra
			src.Heaven_CurseSeal=0
	Heaven_CurseSeal2()
		if(usr.Heaven_CurseSeal2)
			if(usr.White)
				usr.overlays -= 'Heaven1.dmi'
				usr.icon = 'Base_White.dmi'
			if(usr.Pale)
				usr.overlays -= 'Heaven1.dmi'
				usr.icon = 'Base_Pale.dmi'
			if(usr.Tan)
				usr.overlays -= 'Heaven1.dmi'
				usr.icon = 'Base_Tan.dmi'
			if(usr.Dark)
				usr.overlays -= 'Heaven1.dmi'
				usr.icon = 'Base_Black.dmi'

			if(usr.Hoshigaki)
				usr.overlays -= 'Heaven1.dmi'
				usr.icon= 'HosBase_White.dmi'
			if(usr.Hoshigaki&&usr.Female)
				usr.overlays -= 'Heaven1.dmi'
				usr.icon= 'HosBase_FemalePale.dmi'
			if(usr.White&&usr.Female)
				usr.overlays -= 'Heaven1.dmi'
				usr.icon = 'Base_FemaleWhite.dmi'
			if(usr.Pale&&usr.Female)
				usr.overlays -= 'Heaven1.dmi'
				usr.icon = 'Base_FemalePale.dmi'
			if(usr.Tan&&usr.Female)
				usr.overlays -= 'Heaven1.dmi'
				usr.icon = 'Base_FemaleTan.dmi'
			if(usr.Dark&&usr.Female)
				usr.overlays -= 'Heaven1.dmi'
				usr.icon = 'Base_FemaleBlack.dmi'

			usr.overlays -= new/obj/Curse_Seal/Wings
			usr.Chakra = usr.MaxChakra
			src.Heaven_CurseSeal2=0
	Stone_CurseSeal2()
		if(usr.Stone_CurseSeal2)
			if(usr.White)
				usr.overlays -= 'Stone1.dmi'
				usr.icon = 'Base_White.dmi'
			if(usr.Pale)
				usr.overlays -= 'Stone1.dmi'
				usr.icon = 'Base_Pale.dmi'
			if(usr.Tan)
				usr.overlays -= 'Stone1.dmi'
				usr.icon = 'Base_Tan.dmi'
			if(usr.Dark)
				usr.overlays -= 'Stone1.dmi'
				usr.icon = 'Base_Black.dmi'
			if(usr.Hoshigaki)
				usr.overlays -= 'Stone1.dmi'
				usr.icon= 'HosBase_White.dmi'
			if(usr.Hoshigaki&&usr.Female)
				usr.overlays -= 'Stone1.dmi'
				usr.icon= 'HosBase_FemalePale.dmi'
			if(usr.White&&usr.Female)
				usr.overlays -= 'Stone1.dmi'
				usr.icon = 'Base_FemaleWhite.dmi'
			if(usr.Pale&&usr.Female)
				usr.overlays -= 'Stone1.dmi'
				usr.icon = 'Base_FemalePale.dmi'
			if(usr.Tan&&usr.Female)
				usr.overlays -= 'Stone1.dmi'
				usr.icon = 'Base_FemaleTan.dmi'
			if(usr.Dark&&usr.Female)
				usr.overlays -= 'Stone1.dmi'
				usr.icon = 'Base_FemaleBlack.dmi'
			usr.Chakra = usr.MaxChakra
			src.Stone_CurseSeal2=0
	Earth_CurseSeal2()
		if(usr.Earth_CurseSeal2)
			if(usr.White)
				usr.overlays -= 'Earth1.dmi'
				usr.icon = 'Base_White.dmi'
			if(usr.Pale)
				usr.overlays -= 'Earth1.dmi'
				usr.icon = 'Base_Pale.dmi'
			if(usr.Tan)
				usr.overlays -= 'Earth1.dmi'
				usr.icon = 'Base_Tan.dmi'
			if(usr.Dark)
				usr.overlays -= 'Earth1.dmi'
				usr.icon = 'Base_Black.dmi'
			if(usr.Hoshigaki)
				usr.overlays -= 'Earth1.dmi'
				usr.icon= 'HosBase_White.dmi'
			if(usr.Hoshigaki&&usr.Female)
				usr.overlays -= 'Earth1.dmi'
				usr.icon= 'HosBase_FemalePale.dmi'
			if(usr.White&&usr.Female)
				usr.overlays -= 'Earth1.dmi'
				usr.icon = 'Base_FemaleWhite.dmi'
			if(usr.Pale&&usr.Female)
				usr.overlays -= 'Earth1.dmi'
				usr.icon = 'Base_FemalePale.dmi'
			if(usr.Tan&&usr.Female)
				usr.overlays -= 'Earth1.dmi'
				usr.icon = 'Base_FemaleTan.dmi'
			if(usr.Dark&&usr.Female)
				usr.overlays -= 'Earth1.dmi'
				usr.icon = 'Base_FemaleBlack.dmi'
			usr.Chakra = usr.MaxChakra
			src.Earth_CurseSeal2=0


mob/proc
	Curse()
		if(src.HasCurseSeal==0)
			src.Kyuubi2_Revert()
			src.Kyuubi1_Revert()
			src.Poison=1
			spawn(30)
				src.Poison()
		var/random=rand(1,10)

		if(src.Uchiha)
			src.Heaven_HasCurseSeal=1
			sleep(200)
			src.contents += new/obj/CurseSeal
			src.Poison=0
			spawn(1200)
				src.UnKo()
				src.Poison=0
			return
		if(prob(30))
			src.HasCurseSeal=1
			sleep(200)
			src.Poison=0
			src.contents += new/obj/CurseSeal
			spawn(1200)
				src.UnKo()
			return
		if(random==8)
			src.Earth_HasCurseSeal=1
			sleep(200)
			src.contents += new/obj/CurseSeal
			src.Poison=0
			spawn(1200)
				src.UnKo()
				src.Poison=0
			return

		if(random==4)
			src.Stone_HasCurseSeal=1
			sleep(200)
			src.contents += new/obj/CurseSeal
			src.Poison=0
			spawn(1200)
				src.UnKo()
				src.Poison=0
			return

		if(random==2)
			src.Heaven_HasCurseSeal=1
			sleep(200)
			src.contents += new/obj/CurseSeal
			src.Poison=0
			spawn(1200)
				src.UnKo()
				src.Poison=0
			return
		else
			sleep(300)
			viewers(src)<<output("<font color=silver><b>[src]'s body Couldn't handle the Curse Seal","outputic.output")
			sleep(10)
			src.Death(src)
			src.Poison=0

mob/proc
	Poison()
		if(src.Poison)
			src.Health -= rand(1,3)
			src.Ko()
			spawn(rand(30,60))
				src.Poison()
	Poison2()
		if(src.Poison)
			src.Health -= rand(0.5,1.8)
			src.Ko()
			spawn(rand(50,100))
				src.Poison2()





obj/Heaven_Wings
	Part1
		icon_state="Right"
		layer=MOB_LAYER+1
		pixel_x = 32
	Part2
		icon_state="Left"
		layer=MOB_LAYER+1
		pixel_x = -32
	Part3
		icon_state="Right up"
		layer=MOB_LAYER+1
		pixel_x = 32
		pixel_y = 32
	Part4
		icon_state="Left up"
		layer=MOB_LAYER+1
		pixel_x = -32
		pixel_y = 32
	Part5
		icon_state="Right side"
		layer=MOB_LAYER+1
		pixel_y = 32
	Part6
		icon_state="Left side"
		layer=MOB_LAYER+1
		pixel_y = 32

obj/Curse_Seal
	Wings
		icon='Heaven Wings.dmi'
		icon_state=""
		New()
			src.overlays += /obj/Heaven_Wings/Part1
			src.overlays += /obj/Heaven_Wings/Part2
			src.overlays += /obj/Heaven_Wings/Part3
			src.overlays += /obj/Heaven_Wings/Part4
			src.overlays += /obj/Heaven_Wings/Part5
			src.overlays += /obj/Heaven_Wings/Part6
