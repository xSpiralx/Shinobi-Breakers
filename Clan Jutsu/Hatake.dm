obj/Doujutsu/TransplantSharingan1
	icon='Skillcard.dmi'
	icon_state="Sharingan1"
	Click()
		if(src in usr.contents)
			if(!usr.Sharingan)
				if(prob(25/skill/skill))
					if(skill>5)
						usr.contents += new/obj/Doujutsu/TransplantSharingan2
						return
					skill+=1
				usr.Sharingan=1
				usr.overlays += 'Sharingan2.dmi'
				usr.Taijutsu += 20
				usr.Agility += 20
				usr.drain4=1
				usr.drain4()
			else
				usr.Sharingan=0
				usr.overlays -= 'Sharingan2.dmi'
				usr.overlays -= 'Sharingan2.dmi'
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Agility = usr.MaxAgility
				usr.drain4=0

obj/Doujutsu/TransplantSharingan2
	icon='Skillcard.dmi'
	icon_state="Sharingan2"
	Click()
		if(src in usr.contents)
			if(!usr.Sharingan)
				if(prob(20/skill/skill))
					if(skill>10)
						usr.contents += new/obj/Doujutsu/TransplantSharingan3
						return
					skill+=1
				usr.Sharingan=1
				usr.overlays += 'Sharingan2.dmi'
				usr.Taijutsu += 40
				usr.Agility += 40
				usr.Defence += 40
				usr.drain4=1
				usr.drain4()
				usr.SC()
				for(var/obj/Doujutsu/TransplantSharingan1/A in usr.contents)
					del(A)
			else
				usr.Sharingan=0
				usr.overlays -= 'Sharingan2.dmi'
				usr.overlays -= 'Sharingan2.dmi'
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Agility = usr.MaxAgility
				usr.Defence = usr.MaxDefence
				usr.drain4=0

mob/var/MasteredT=0
obj/Doujutsu/TransplantSharingan3
	icon='Skillcard.dmi'
	icon_state="Sharingan3"
	Click()
		if(src in usr.contents)
			if(!usr.Sharingan)
				if(prob(15/skill/skill))
					if(skill>15)
						return
					skill+=1
				usr.SharinganCopy=1
				usr.Sharingan=1
				usr.overlays += 'Sharingan2.dmi'
				usr.Taijutsu += 80
				usr.Agility += 80
				usr.Defence += 80
				usr.drain4=1
				usr.drain4()
				usr.SC()
				if(skill>15)
					usr.MasteredT=1
			//	if(skill>5)
			//		usr.contents += new/obj/Doujutsu/Kyouten_Chiten
			//	if(skill>10)
			//		usr.contents += new/obj/Doujutsu/Kasegui_no_Jutsu
				for(var/obj/Doujutsu/TransplantSharingan2/A in usr.contents)
					del(A)
			else
				usr.SharinganCopy=0
				usr.Sharingan=0
				usr.overlays -= 'Sharingan2.dmi'
				usr.overlays -= 'Sharingan2.dmi'
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Agility = usr.MaxAgility
				usr.Defence = usr.MaxDefence
				usr.drain4=0
			//	for(var/obj/Doujutsu/Kyouten_Chiten/A in usr.contents)
			//		del(A)
			//	for(var/obj/Doujutsu/Kasegui_no_Jutsu/B in usr.contents)
			//		del(B)