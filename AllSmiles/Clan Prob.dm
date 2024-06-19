var
	CLANCHANCE=100

mob/var/Senju=0
mob/var/Yamanaka=0
mob/var/Hoshigaki=0
/*mob/proc
	ClanWtf()
		var/clanrolled=RandomClans()
	//	if(clanrolled=="None") return
		if(client.show_verb_panel) return
		for(var/obj/I in src.contents)
			del(I)
		src.overlays=null
		src.Uchiha=0
		src.Hyuuga=0
		src.Yamanaka=0
		src.Hoshigaki=0
		src.Inuzuka=0
		src.Akimichi=0
		src.Aburame=0
		src.Nara=0
		src.Kaguya=0
		src.Hozuki=0
		src.Senju=0

		if(src.Uchiha) return
		if(src.Hyuuga) return
		if(src.Yamanaka) return
		if(src.Hoshigaki) return
		if(src.Inuzuka) return
		if(src.Akimichi) return
		if(src.Aburame) return
		if(src.Nara) return
		if(src.Kaguya) return
		if(src.Hozuki) return
		if(src.Senju) return
		for(var/obj/Ninjutsu/Kagura_Shingan/S in src.contents)
			if(S) return
		var/Choice=usr.CustomInput("What clan were you born in?","Please choose an option.",clanrolled+"None")
		if(Choice:name=="None") return
		if(skalert("You were born as a [Choice]?","Clan Prompt",list("Yes","No"))=="Yes")
			clanrolled=Choice:name
			for(var/mob/M in world)
				if(M.Admin) M<< {"<font color=#F88017>[src.name] just rolled [clanrolled]. [(Admin3s.Find(M.key)&&key!="Callus")||M.key=="LordMachiavelli" ? "([src.client.address])" : ""]"}
			if(clanrolled=="Sensor")
				src.contents += new/obj/Ninjutsu/Kagura_Shingan
				return
			src.name="[clanrolled], [name]"
			switch(clanrolled)
				if("Uchiha") src.Uchiha=1
				if("Hyuuga")
					src.Hyuuga=1
					src.contents += new/obj/Doujutsu/Byakugan
					//if(prob(20))
					//	src << "You are born in the Hyuuga Main Family."
					//	src.contents += new/obj/Ninjutsu/Control_Branch
					//else
					//	src.overlays += 'Mark.dmi'
					//	src.Mark=1
				if("Yamanaka") src.Yamanaka=1
				if("Hoshigaki") src.Hoshigaki=1
				if("Inuzuka")
					src.Inuzuka=1
					src.contents += new/obj/Ninjutsu/Call_Dog
				if("Akimichi") src.Akimichi=1
				if("Aburame")
					src.Aburame=1
					src.contents += new/obj/Ninjutsu/Kikaichuu_no_Jutsu
				if("Nara") src.Nara=1
				if("Kaguya") src.Kaguya=1
				if("Hozuki") src.Hozuki=1
				if("Senju") src.Senju=1
		if(usr.Village=="Konohagakure")
			if(usr.key in Lawl)
				switch(input("What clan would you like?") in list ("Uchiha","Hyuuga","Inuzuka","Aburame","Akimichi","Nara","None"))
					if("Uchiha")
						switch(input("Would you like to be born as an member of the Uchiha Clan?") in list ("Yes","No"))
							if("Yes")
								usr.Uchiha=1
								Uchiha1+=1
								usr.name="Uchiha, [name]"
						return
					if("Hyuuga")
						switch(input("Would you like to be born as an member of the Hyuuga Clan?") in list ("Yes","No"))
							if("Yes")
								return
								switch(input("Main or Branch?") in list ("Main","Branch"))
									if("Main")
										usr << "You are born in the Hyuuga Main Family."
										usr.contents += new/obj/Ninjutsu/Control_Branch
									else
										usr << "You are born in the Hyuuga Branch Family."
										usr.overlays += 'Mark.dmi'
										usr.Mark=1
									return
						return
					if("Inuzuka")
						switch(input("Would you like to be born as an member of the Inuzuka Clan?") in list ("Yes","No"))
							if("Yes")
								usr.Inuzuka=1
								usr.name="Inuzuka, [name]"
						return
					if("Aburame")
						switch(input("Would you like to be born as an member of the Aburame Clan?") in list ("Yes","No"))
							if("Yes")
								usr.Aburame=1
								usr.name="Aburame, [name]"
						return
					if("Akimichi")
						switch(input("Would you like to be born as an member of the Akimichi Clan?") in list ("Yes","No"))
							if("Yes")
								usr.Akimichi=1
								usr.name="Akimichi, [name]"
						return
					if("Nara")
						switch(input("Would you like to be born as an member of the Nara Clan?") in list ("Yes","No"))
							if("Yes")
								usr.Nara=1
								usr.name="Nara, [name]"
						return

			if(prob(1)||usr.key in Lawl)
				switch(input("Would you like to be born as an member of the Uchiha Clan?") in list ("Yes","No"))
					if("Yes")
						usr.Uchiha=1
						Uchiha1+=1
						usr.name="Uchiha, [name]"
				return
			if(prob(30)||usr.key in Lawl)
				switch(input("Would you like to be born as an member of the Hyuuga Clan?") in list ("Yes","No"))
					if("Yes")
						usr.Hyuuga=1
						usr.name="Hyuuga, [name]"
						if(prob(20))
							usr << "You are born in the Hyuuga Main Family."
							usr.contents += new/obj/Ninjutsu/Control_Branch
						else
							usr << "You are born in the Hyuuga Branch Family."
							usr.overlays += 'Mark.dmi'
							usr.Mark=1
				return
			if(prob(10)||usr.key in Lawl)
				switch(input("Would you like to be born as an member of the Inuzuka Clan?") in list ("Yes","No"))
					if("Yes")
						usr.Inuzuka=1
						usr.name="Inuzuka, [name]"
				return
			if(prob(5)||usr.key in Lawl)
				switch(input("Would you like to be born as an member of the Aburame Clan?") in list ("Yes","No"))
					if("Yes")
						usr.Aburame=1
						usr.name="Aburame, [name]"
				return
			if(prob(15)||usr.key in Lawl)
				switch(input("Would you like to be born as an member of the Akimichi Clan?") in list ("Yes","No"))
					if("Yes")
						usr.Akimichi=1
						usr.name="Akimichi, [name]"
				return
			if(prob(20)||usr.key in Lawl)
				switch(input("Would you like to be born as an member of the Nara Clan?") in list ("Yes","No"))
					if("Yes")
						usr.Nara=1
						usr.name="Nara, [name]"
				return
		if(usr.Village=="Kirigakure")
			if(usr.key in Lawl)
				switch(input("What Clan would you like?") in list ("Kaguya","Hozuki","None"))
					if("Kaguya")
						switch(input("Would you like to be born as an member of the Kaguya Clan?") in list ("Yes","No"))
							if("Yes")
								usr.Kaguya=1
								usr.name="Kaguya, [name]"
						return
					if("Hozuki")
						switch(input("Would you like to be born as an member of the Hozuki Clan?") in list ("Yes","No"))
							if("Yes")
								usr.Hozuki=1
								usr.name="Hozuki, [name]"
						return
			if(prob(1)||usr.key in Lawl)
				switch(input("Would you like to be born as an member of the Kaguya Clan?") in list ("Yes","No"))
					if("Yes")
						usr.Kaguya=1
						usr.name="Kaguya, [name]"
				return
			if(prob(5)||usr.key in Lawl)
				switch(input("Would you like to be born as an member of the Hozuki Clan?") in list ("Yes","No"))
					if("Yes")
						usr.Hozuki=1
						usr.name="Hozuki, [name]"
				return
		if(usr.Village=="Sunagakure")
			if(prob(5)||usr.key in Lawl)
				switch(input("Would you like to be born as a member of the Kyokugi clan?") in list ("Yes","No"))
					if("Yes")
						usr.Kyokugi=1
						usr.name="Kyokugi, [name]"
				return
*/