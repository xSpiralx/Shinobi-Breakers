mob/var/Hachimon=0




obj/jutsu/Hachimon_Kaimon
	icon='Skillcard.dmi'
	icon_state="Hachimon 1"
	Click()
		if(src in usr.contents)
			if(!usr.Hachimon)
				if(usr.Stamina<100)
					return
				usr.Hachimon=1
				usr.Stamina-=100
				usr.MaxChakra*=1.25
				usr.Taijutsu *= 1.25
				usr.Defence/=1.15
				usr.Offence *=1.7
				usr.Agility*=1.5
				src.Active=1
				usr.drain_1()
			else
				usr.Hachimon=0
				usr.MaxChakra/=1.15
				usr.MaxStamina/=1.15
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Offence = usr.MaxOffence
				usr.Agility = usr.MaxAgility
				src.Active=0

obj/Taijutsu/Hachimon_Kyuumon
	icon='Skillcard.dmi'
	icon_state="Hachimon 2"
	Click()
		if(src in usr.contents)
			if(!usr.Hachimon)
				if(usr.Stamina<150)
					return
				usr.Hachimon=1
				usr.Stamina-=150
				usr.Stamina+=300
				usr.Health+=10
				usr.MaxChakra*=1.25
				usr.Taijutsu *= 1.5
				usr.Defence/=1.5
				usr.Offence *=1.9
				usr.Agility*=1.9
				src.Active=1
				usr.drain_1()
			else
				usr.Hachimon=0
				usr.MaxChakra/=1.5
				usr.MaxStamina/=1.5
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Offence = usr.MaxOffence
				usr.Agility = usr.MaxAgility
				src.Active=0

obj/Taijutsu/Hachimon_Seimon
	icon='Skillcard.dmi'
	icon_state="Hachimon 3"
	Click()
		if(src in usr.contents)
			if(!usr.Hachimon)
				if(usr.Stamina<250)
					return
				usr.Hachimon=1
				usr.Stamina-=100
				usr.MaxChakra*=1.15
				usr.Taijutsu *= 2.25
				usr.Defence/=2.15
				usr.Offence *=2.7
				usr.Agility*=3.5
				src.Active=1
				usr.overlays += 'Rocks.dmi'
				usr.overlays += 'Gate_2.dmi'
				usr.icon = 'Hachimon.dmi'
				sleep(10)
				usr.drain_1()
			else
				usr.overlays -= 'Rocks.dmi'
				usr.overlays -= 'Gate_1.dmi'
				usr.overlays -= 'Gate_2.dmi'
				usr.Hachimon=0
				usr.MaxChakra/=1.15
				usr.MaxStamina/=1.15
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Offence = usr.MaxOffence
				usr.Agility = usr.MaxAgility
				src.Active=0
				if(usr.White)
					usr.icon = 'Base_White.dmi'
				if(usr.Pale)
					usr.icon = 'Base_Pale.dmi'
				if(usr.Tan)
					usr.icon = 'Base_Tan.dmi'
				if(usr.Dark)
					usr.icon = 'Base_Black.dmi'
				if(usr.Hoshigaki)
					usr.icon= 'HosBase_White.dmi'
				if(usr.Hoshigaki&&usr.Female)
					usr.icon= 'HosBase_FemalePale.dmi'
				if(usr.White&&usr.Female)
					usr.icon = 'Base_FemaleWhite.dmi'
				if(usr.Pale&&usr.Female)
					usr.icon = 'Base_FemalePale.dmi'
				if(usr.Tan&&usr.Female)
					usr.icon = 'Base_FemaleTan.dmi'
				if(usr.Dark&&usr.Female)
					usr.icon = 'Base_FemaleBlack.dmi'

obj/Taijutsu/Hachimon_Shoumon
	icon='Skillcard.dmi'
	icon_state="Hachimon"
	Click()
		if(src in usr.contents)
			if(!usr.Hachimon)
				if(usr.Stamina<500)
					return
				usr.Hachimon=1
				usr.Stamina-=500
				usr.MaxChakra*=1.5
				usr.Taijutsu *= 4.5
				usr.Defence*=0.5
				usr.Offence *=1.7
				usr.Agility*=2.5
				usr.drain_1=1
				src.Active=1
				usr.overlays += 'Rocks.dmi'
				usr.icon = 'Hachimon.dmi'
				sleep(10)
				usr.drain_1()
			else
				usr.overlays -= 'Rocks.dmi'
				usr.overlays -= 'Gate_1.dmi'
				usr.Hachimon=0
				usr.MaxChakra/=1.5
				usr.MaxStamina/=1.5
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Offence = usr.MaxOffence
				usr.Agility = usr.MaxAgility
				usr.drain_1=0
				src.Active=0
				if(usr.White)
					usr.icon = 'Base_White.dmi'
				if(usr.Pale)
					usr.icon = 'Base_Pale.dmi'
				if(usr.Tan)
					usr.icon = 'Base_Tan.dmi'
				if(usr.Dark)
					usr.icon = 'Base_Black.dmi'
				if(usr.Hoshigaki)
					usr.icon= 'HosBase_White.dmi'
				if(usr.Hoshigaki&&usr.Female)
					usr.icon= 'HosBase_FemalePale.dmi'
				if(usr.White&&usr.Female)
					usr.icon = 'Base_FemaleWhite.dmi'
				if(usr.Pale&&usr.Female)
					usr.icon = 'Base_FemalePale.dmi'
				if(usr.Tan&&usr.Female)
					usr.icon = 'Base_FemaleTan.dmi'
				if(usr.Dark&&usr.Female)
					usr.icon = 'Base_FemaleBlack.dmi'


obj/Taijutsu/Hachimon_Tomon
	icon='Skillcard.dmi'
	icon_state="Hachimon 5"
	Click()
		if(src in usr.contents)
			if(!usr.Hachimon)
				if(usr.Stamina<700)
					return
				usr.Hachimon=1
				usr.Stamina-=700
				usr.MaxChakra*=1.5
				usr.Taijutsu *= 5.25
				usr.Defence*=0.2
				usr.Offence *=2
				usr.Agility*=3
				usr.drain_1=1
				src.Active=1
				usr.overlays += 'Rocks.dmi'
				usr.overlays += 'Gate_1.dmi'
				usr.overlays += 'Gate_2.dmi'
				usr.icon = 'Hachimon.dmi'
				sleep(10)
				usr.drain_1()
			else
				usr.overlays -= 'Rocks.dmi'
				usr.overlays -= 'Gate_1.dmi'
				usr.Hachimon=0
				usr.MaxChakra/=1.5
				usr.MaxStamina/=1.5
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Offence = usr.MaxOffence
				usr.Agility = usr.MaxAgility
				usr.drain_1=0
				src.Active=0
				if(usr.White)
					usr.icon = 'Base_White.dmi'
				if(usr.Pale)
					usr.icon = 'Base_Pale.dmi'
				if(usr.Tan)
					usr.icon = 'Base_Tan.dmi'
				if(usr.Dark)
					usr.icon = 'Base_Black.dmi'
				if(usr.Hoshigaki)
					usr.icon= 'HosBase_White.dmi'
				if(usr.Hoshigaki&&usr.Female)
					usr.icon= 'HosBase_FemalePale.dmi'
				if(usr.White&&usr.Female)
					usr.icon = 'Base_FemaleWhite.dmi'
				if(usr.Pale&&usr.Female)
					usr.icon = 'Base_FemalePale.dmi'
				if(usr.Tan&&usr.Female)
					usr.icon = 'Base_FemaleTan.dmi'
				if(usr.Dark&&usr.Female)
					usr.icon = 'Base_FemaleBlack.dmi'
obj/Taijutsu/Hachimon_Keimon
	icon='Skillcard.dmi'
	icon_state="Hachimon 5"
	Click()
		if(src in usr.contents)
			if(!usr.Hachimon)
				if(usr.Stamina<800)
					return
				usr.Hachimon=1
				usr.Stamina-=800
				usr.MaxChakra*=2
				usr.Taijutsu *= 7
				usr.Defence*=0.15
				usr.Offence *=3
				usr.Agility*=4
				usr.drain_1=1
				src.Active=1
				usr.overlays += 'Rocks.dmi'
				usr.overlays += 'Gate_1.dmi'
				usr.overlays += 'Gate_2.dmi'
				usr.icon = 'Hachimon.dmi'
				usr.drain_1()
			else
				usr.overlays -= 'Rocks.dmi'
				usr.overlays -= 'Gate_1.dmi'
				usr.Hachimon=0
				usr.MaxChakra/=2
				usr.MaxStamina/=1.5
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Offence = usr.MaxOffence
				usr.Agility = usr.MaxAgility
				usr.drain_1=0
				src.Active=0
				if(usr.White)
					usr.icon = 'Base_White.dmi'
				if(usr.Pale)
					usr.icon = 'Base_Pale.dmi'
				if(usr.Tan)
					usr.icon = 'Base_Tan.dmi'
				if(usr.Dark)
					usr.icon = 'Base_Black.dmi'
				if(usr.Hoshigaki)
					usr.icon= 'HosBase_White.dmi'
				if(usr.Hoshigaki&&usr.Female)
					usr.icon= 'HosBase_FemalePale.dmi'
				if(usr.White&&usr.Female)
					usr.icon = 'Base_FemaleWhite.dmi'
				if(usr.Pale&&usr.Female)
					usr.icon = 'Base_FemalePale.dmi'
				if(usr.Tan&&usr.Female)
					usr.icon = 'Base_FemaleTan.dmi'
				if(usr.Dark&&usr.Female)
					usr.icon = 'Base_FemaleBlack.dmi'

obj/Taijutsu/Hachimon_Kyomon
	icon='Skillcard.dmi'
	icon_state="Hachimon 5"
	Click()
		if(src in usr.contents)
			if(!usr.Hachimon)
				if(usr.Stamina<900)
					return
				usr.Hachimon=1
				usr.Stamina-=900
				usr.MaxChakra*=3
				usr.Taijutsu *= 8
				usr.Defence*=0.12
				usr.Offence *=4
				usr.Agility*=5
				usr.drain_1=1
				src.Active=1
				usr.overlays += 'Rocks.dmi'
				usr.overlays += 'Gate_1.dmi'
				usr.overlays += 'Gate_2.dmi'
				usr.icon = 'Hachimon.dmi'
				usr.drain_1()
			else
				usr.overlays -= 'Rocks.dmi'
				usr.overlays -= 'Gate_1.dmi'
				usr.Hachimon=0
				usr.MaxChakra/=3
				usr.MaxStamina/=1.5
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Offence = usr.MaxOffence
				usr.Agility = usr.MaxAgility
				usr.drain_1=0
				src.Active=0
				if(usr.White)
					usr.icon = 'Base_White.dmi'
				if(usr.Pale)
					usr.icon = 'Base_Pale.dmi'
				if(usr.Tan)
					usr.icon = 'Base_Tan.dmi'
				if(usr.Dark)
					usr.icon = 'Base_Black.dmi'
				if(usr.Hoshigaki)
					usr.icon= 'HosBase_White.dmi'
				if(usr.Hoshigaki&&usr.Female)
					usr.icon= 'HosBase_FemalePale.dmi'
				if(usr.White&&usr.Female)
					usr.icon = 'Base_FemaleWhite.dmi'
				if(usr.Pale&&usr.Female)
					usr.icon = 'Base_FemalePale.dmi'
				if(usr.Tan&&usr.Female)
					usr.icon = 'Base_FemaleTan.dmi'
				if(usr.Dark&&usr.Female)
					usr.icon = 'Base_FemaleBlack.dmi'
obj/Taijutsu/Hachimon_Shimon
	icon='Skillcard.dmi'
	icon_state="Hachimon 5"
	Click()
		if(src in usr.contents)
			if(!usr.Hachimon)
				if(usr.Stamina<1000)
					return
				usr.Hachimon=1
				usr.Stamina-=1000
				usr.MaxChakra*=6
				usr.Taijutsu *= 10
				usr.Defence*=0.8
				usr.Offence *=8
				usr.Agility*=15
				usr.drain_1=1
				src.Active=1
				usr.overlays += 'Rocks.dmi'
				usr.overlays += 'Gate_1.dmi'
				usr.overlays += 'Gate_2.dmi'
				usr.icon = 'Hachimon.dmi'
				usr.drain_1()
			else
				usr.overlays -= 'Rocks.dmi'
				usr.overlays -= 'Gate_1.dmi'
				usr.Hachimon=0
				usr.MaxChakra/=6
				usr.MaxStamina/=3
				usr.Taijutsu -= usr.MaxTaijutsu
				usr.Offence -= usr.MaxOffence
				usr.Agility -= usr.MaxAgility
				usr.Stamina -= 5000000
				usr.Chakra -= 50000000
				usr.drain_1=0
				src.Active=0
				if(usr.White)
					usr.icon = 'Base_White.dmi'
				if(usr.Pale)
					usr.icon = 'Base_Pale.dmi'
				if(usr.Tan)
					usr.icon = 'Base_Tan.dmi'
				if(usr.Dark)
					usr.icon = 'Base_Black.dmi'
				if(usr.Hoshigaki)
					usr.icon= 'HosBase_White.dmi'
				if(usr.Hoshigaki&&usr.Female)
					usr.icon= 'HosBase_FemalePale.dmi'
				if(usr.White&&usr.Female)
					usr.icon = 'Base_FemaleWhite.dmi'
				if(usr.Pale&&usr.Female)
					usr.icon = 'Base_FemalePale.dmi'
				if(usr.Tan&&usr.Female)
					usr.icon = 'Base_FemaleTan.dmi'
				if(usr.Dark&&usr.Female)
					usr.icon = 'Base_FemaleBlack.dmi'
				sleep(2000)
				usr.Death(usr)
mob/var/drain_1=0
mob/proc
	drain_1()
		spawn() while(usr.drain_1)
			sleep(10)
			usr.Stamina -= 20
			if(usr.Stamina<=0)
				usr.Hachimon=0
				usr.Control=usr.MaxControl
				usr.MaxChakra/=1.5
				usr.drain_1=0
				usr.overlays -= 'Rocks.dmi'
				usr.overlays -= 'Gate_1.dmi'
				usr.overlays -= 'Gate_2.dmi'
				if(usr.White)
					usr.icon = 'Base_White.dmi'
				if(usr.Pale)
					usr.icon = 'Base_Pale.dmi'
				if(usr.Tan)
					usr.icon = 'Base_Tan.dmi'
				if(usr.Dark)
					usr.icon = 'Base_Black.dmi'
				if(usr.Hoshigaki)
					usr.icon= 'HosBase_White.dmi'
				if(usr.Hoshigaki&&usr.Female)
					usr.icon= 'HosBase_FemalePale.dmi'
				if(usr.White&&usr.Female)
					usr.icon = 'Base_FemaleWhite.dmi'
				if(usr.Pale&&usr.Female)
					usr.icon = 'Base_FemalePale.dmi'
				if(usr.Tan&&usr.Female)
					usr.icon = 'Base_FemaleTan.dmi'
				if(usr.Dark&&usr.Female)
					usr.icon = 'Base_FemaleBlack.dmi'
