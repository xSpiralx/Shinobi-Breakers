


obj/items/Clothing
	Samurai_Robe
		name="Samurai Robe"
		icon = 'Samurai_Robe_Black.dmi'
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "Equipped"
					usr.overlays += src.icon


				else
					src.worn = 0
					src.suffix=""
					usr.overlays -= src.icon
	Kiri_Academy1
		name="Kiri Academy Uniform"
		icon = 'Icons/Kiri_Acad_tee_1.dmi'
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "Equipped"
					usr.overlays += src.icon


				else
					src.worn = 0
					src.suffix=""
					usr.overlays -= src.icon
	Kiri_Academy2
		name="Kiri Academy Uniform"
		icon = 'Icons/Kiri_Acad_tee_2.dmi'
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "Equipped"
					usr.overlays += src.icon


				else
					src.worn = 0
					src.suffix=""
					usr.overlays -= src.icon
	Suna_Academy1
		name="Suna Academy Uniform"
		icon = 'Icons/Suna_Acad_Tee_1.dmi'
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "Equipped"
					usr.overlays += src.icon


				else
					src.worn = 0
					src.suffix=""
					usr.overlays -= src.icon
	Suna_Academy2
		name="Suna Academy Uniform"
		icon = 'Icons/Suna_Acad_tee_2.dmi'
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "Equipped"
					usr.overlays += src.icon


				else
					src.worn = 0
					src.suffix=""
					usr.overlays -= src.icon
	Kono_Academy1
		name="Konoha Academy Uniform"
		icon = 'Icons/Konoha_Acad_tee_1.dmi'
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "Equipped"
					usr.overlays += src.icon


				else
					src.worn = 0
					src.suffix=""
					usr.overlays -= src.icon
	Kono_Academy2
		name="Konoha Academy Uniform"
		icon = 'Icons/Konoha_Acad_tee_2.dmi'
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "Equipped"
					usr.overlays += src.icon


				else
					src.worn = 0
					src.suffix=""
					usr.overlays -= src.icon

	Fishnet_Shirt
		name="Fishnet Shirt"
		icon='Fishnet1.dmi'
		//icon_state="Inv"

		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "Equipped"
					usr.overlays += src.icon


				else
					src.worn = 0
					src.suffix=""
					usr.overlays -= src.icon



	Fishnet_Leggings
		name="Fishnet Leggings"
		icon='Fishnet2.dmi'
		//icon_state="Inv"

		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "Equipped"
					usr.overlays += src.icon


				else
					src.worn = 0
					src.suffix=""
					usr.overlays -= src.icon


	Sakura_Shorts
		name="Sakura_Shorts"
		icon='Sakuraflap.dmi'
		//icon_state="Inv"

		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "Equipped"
					usr.overlays += src.icon


				else
					src.worn = 0
					src.suffix=""
					usr.overlays -= src.icon


	Long_Shoes
		icon='Clothing_Long Shoes.dmi'
		name="Knee Boots"
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "Equipped"
					usr.overlays += src.icon

				else
					src.worn = 0
					src.suffix=""
					usr.overlays -= src.icon


	Swimsuit
		icon='Swimsuit.dmi'
		name="Swimsuit"
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "Equipped"
					usr.overlays += src.icon

				else
					src.worn = 0
					src.suffix=""
					usr.overlays -= src.icon
