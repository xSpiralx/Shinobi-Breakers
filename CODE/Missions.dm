
mob/var/Trash=0
mob/var/mission=0
obj/Sign
	icon='BillBoard.dmi'
	icon_state="full"
	density=1
	var/message
	layer=MOB_LAYER+71
	Click()
		usr.custom_alert("[message].","Alert")
		..()


obj/tutorialSign
	icon='BillBoard.dmi'
	icon_state="full"
	density=1
	var/list/messages = list("Konohagakure" = "This is the default message for Konoha.", "Kirigakure" = "This is the default message for Kirigakure", "Riverwatch" = "This is the default message for Riverwatch")
	layer=MOB_LAYER+71
	Click()
		usr.custom_alert("[messages[usr.Village]].","Alert")
		..()

obj/Villageboard
	name="Village Board"
	icon='BillBoard.dmi'
	var/Village="Konohagakure"
	icon_state="full2"
	density=1
	var/message
	layer=MOB_LAYER+71
	New()
		..()
		del(src)
	verb/Modify()
		set src in view(usr,2)
		if(Village!=usr.Village) return
		if(locate(/obj/Kazekage,usr.contents)||locate(/obj/Hokage,usr.contents)||locate(/obj/Mizukage,usr.contents)||locate(/obj/Jounin,usr.contents))
			if(usr.Village=="Konohagakure")
				KonohagakureNotes=input("Edit the VillageNotes!","Konohagakure","[KonohagakureNotes]")as message
				var/savefile/A = new ("Saga/KonohagakureNotes")
				A["[KonohagakureNotes]"]<< KonohagakureNotes
			if(usr.Village=="Kirigakure")
				KirigakureNotes=input("Edit the VillageNotes!","Kirigakure","[KirigakureNotes]")as message
				var/savefile/B = new("Saga/KirigakureNotes")
				B["[KirigakureNotes]"]<< KirigakureNotes
			if(usr.Village=="Sunagakure")
				SunagakureNotes=input("Edit the VillageNotes!","Sunagakure","[SunagakureNotes]")as message
				var/savefile/C = new ("Saga/SunagakureNotes")
				C["[SunagakureNotes]"]<< SunagakureNotes
			if(usr.Village=="Northern Temple")
				IronNotes=input("Edit the VillageNotes!","Northern Temple","[IronNotes]")as message
				var/savefile/C = new ("Saga/IronNotes")
				C["[SunagakureNotes]"]<< IronNotes
	Click()
		if(Village=="Konohagakure")
			usr<<browse("[KonohagakureNotes]","window=Village;size=300x500")
		if(Village=="Kirigakure")
			usr<<browse("[KirigakureNotes]","window=Village;size=300x500")
		if(Village=="Sunagakure")
			usr<<browse("[SunagakureNotes]","window=Village;size=300x500")

obj/Konoha_Mission_Board
	icon='BillBoard.dmi'
	icon_state="full"
	density=1
	verb/Take_a_Mission()
		set src in view(usr,2)
		if(locate(/obj/items/Clothing/Headband,usr.contents))
			if(!usr.mission)
				switch(input("Which Rank mission would you like to be assigned?") in list ("Trash Collection (D Rank)","Cancel"))
					if("Trash Collection (D Rank)")
						var/obj/items/Missions/Trash_1/D = new()
						D.landx=rand(44,230)
						D.landy=rand(83,261)
						D.landz=1
						D.loc=locate(D.landx,D.landy,D.landz)
						var/obj/items/Missions/Trash_2/A = new()
						A.landx=rand(44,230)
						A.landy=rand(83,261)
						A.landz=1
						A.loc=locate(A.landx,A.landy,A.landz)
						var/obj/items/Missions/Trash_1/B = new()
						B.landx=rand(44,230)
						B.landy=rand(83,261)
						B.landz=1
						B.loc=locate(B.landx,B.landy,B.landz)
						var/obj/items/Missions/Trash_2/C = new()
						C.landx=rand(44,230)
						C.landy=rand(83,261)
						C.landz=1
						C.loc=locate(C.landx,C.landy,C.landz)
						var/obj/items/Missions/Trash_1/E = new()
						E.landx=rand(44,230)
						E.landy=rand(83,261)
						E.landz=1
						E.loc=locate(E.landx,E.landy,E.landz)
						var/obj/items/Missions/Trash_2/F = new()
						F.landx=rand(44,230)
						F.landy=rand(83,261)
						F.landz=1
						F.loc=locate(F.landx,F.landy,F.landz)
						usr << "Your Mission is to pick up atleast 4 peices of trash found around the Village. You have 5 minutes to find them."
						usr.mission=1
						sleep(3000)
						del(A)
						del(B)
						del(C)
						del(D)
						del(E)
						del(F)




			else
				usr << "You have already accepted a Mission."
				return
	verb/Report_Mission()
		set src in view(usr,2)
		if(usr.mission)
			if(usr.Trash>3)
				usr << "You have Completed your Mission."
				usr.Trash=0
				usr.Yen += 50
				usr.mission=0
				for(var/obj/items/Missions/Trash_2/A)
					del(A)
				for(var/obj/items/Missions/Trash_1/B)
					del(B)



obj/items/Missions/Trash_1
	icon='trash.dmi'
	icon_state="1"
	var/landx=0
	var/landy=0
	var/landz=0


obj/items/Missions/Trash_2
	icon='trash.dmi'
	icon_state="2"
	var/landx=0
	var/landy=0
	var/landz=0


