
turf/TeleporterGenIn
	Enter(mob/M)
		if(istype(M, /mob/))
			if(M.client)
				M.loc = locate(299,M.y,29)
				M.overlays -= 'Swim.dmi'
turf/TeleporterGenOut
	Enter(mob/M)
		if(istype(M, /mob/))
			if(M.client)
				M.loc = locate(256,M.y,29)
				M.overlays -= 'Swim.dmi'

turf/TeleporterGenIn2
	Enter(mob/M)
		if(istype(M, /mob/))
			if(M.client)
				M.loc = locate(M.x,14,29)
				M.overlays -= 'Swim.dmi'
turf/TeleporterGenOut2
	Enter(mob/M)
		if(istype(M, /mob/))
			if(M.client)
				M.loc = locate(M.x,1,29)
				M.overlays -= 'Swim.dmi'



turf/Tsukuyomi
	icon='Tsukuyomi.dmi'
	Floor
		icon_state="Black"
	Base
		icon_state="Base"
	Cross
		icon_state="Cross"

/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
turf/House/IwaHouse1I
	Enter()
		for(var/turf/House/IwaHouse1O/H in world)
			usr.loc=locate(H.x,H.y,H.z)
turf/House/IwaHouse1O
	Enter()
		for(var/turf/House/IwaHouse1I/H in world)
			usr.loc=locate(H.x,H.y,H.z)
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
turf/House/IwaHouse2I
	Enter()
		for(var/turf/House/IwaHouse2O/H in world)
			usr.loc=locate(H.x,H.y,H.z)
turf/House/IwaHouse2O
	Enter()
		for(var/turf/House/IwaHouse2I/H in world)
			usr.loc=locate(H.x,H.y,H.z)
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
turf/House/IwaHouse3I
	Enter()
		for(var/turf/House/IwaHouse3O/H in world)
			usr.loc=locate(H.x,H.y,H.z)
turf/House/IwaHouse3O
	Enter()
		for(var/turf/House/IwaHouse3I/H in world)
			usr.loc=locate(H.x,H.y,H.z)
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
turf/House/IwaHouse4I
	Enter()
		for(var/turf/House/IwaHouse4O/H in world)
			usr.loc=locate(H.x,H.y,H.z)
turf/House/IwaHouse4O
	Enter()
		for(var/turf/House/IwaHouse4I/H in world)
			usr.loc=locate(H.x,H.y,H.z)
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
turf/House/IwaHouse5I
	Enter()
		for(var/turf/House/IwaHouse5O/H in world)
			usr.loc=locate(H.x,H.y,H.z)
turf/House/IwaHouse5O
	Enter()
		for(var/turf/House/IwaHouse5I/H in world)
			usr.loc=locate(H.x,H.y,H.z)
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
turf/House/IwaHouse6I
	Enter()
		for(var/turf/House/IwaHouse6O/H in world)
			usr.loc=locate(H.x,H.y,H.z)
turf/House/IwaHouse6O
	Enter()
		for(var/turf/House/IwaHouse6I/H in world)
			usr.loc=locate(H.x,H.y,H.z)
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
turf/House/IwaHouse7I
	Enter()
		for(var/turf/House/IwaHouse7O/H in world)
			usr.loc=locate(H.x,H.y,H.z)
turf/House/IwaHouse7O
	Enter()
		for(var/turf/House/IwaHouse7I/H in world)
			usr.loc=locate(H.x,H.y,H.z)
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
turf/House/IwaHouse8I
	Enter()
		for(var/turf/House/IwaHouse8O/H in world)
			usr.loc=locate(H.x,H.y,H.z)
turf/House/IwaHouse8O
	Enter()
		for(var/turf/House/IwaHouse8I/H in world)
			usr.loc=locate(H.x,H.y,H.z)
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
turf/House/IwaHouse9I
	Enter()
		for(var/turf/House/IwaHouse9O/H in world)
			usr.loc=locate(H.x,H.y,H.z)
turf/House/IwaHouse9O
	Enter()
		for(var/turf/House/IwaHouse9I/H in world)
			usr.loc=locate(H.x,H.y,H.z)
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
turf/House/IwaKageI
	Enter()
		for(var/turf/House/IwaKageO/H in world)
			usr.loc=locate(H.x,H.y,H.z)
turf/House/IwaKageO
	Enter()
		for(var/turf/House/IwaKageI/H in world)
			usr.loc=locate(H.x,H.y,H.z)
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
turf/House/IwaAcadI
	Enter()
		for(var/turf/House/IwaAcadO/H in world)
			usr.loc=locate(H.x,H.y,H.z)
turf/House/IwaAcadO
	Enter()
		for(var/turf/House/IwaAcadI/H in world)
			usr.loc=locate(H.x,H.y,H.z)
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
turf/House/IwaShopI
	Enter()
		for(var/turf/House/IwaShopO/H in world)
			usr.loc=locate(H.x,H.y,H.z)
turf/House/IwaShopO
	Enter()
		for(var/turf/House/IwaShopI/H in world)
			usr.loc=locate(H.x,H.y,H.z)
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////

mob
	Bump(obj/A)
		..()
		if(istype(A,/obj/Prison_Door))
			for(var/obj/items/Police_Badge/Z in usr.contents)
				if(Z.Password==A:Password)
					A:OpenClose(usr)
					return
			if(A:Password)
				var/Guess=input(src,"You must know the password to enter here") as text
				if(Guess==A:Password) A:OpenClose(usr)
			else
				A:OpenClose(usr)
obj/Prison_Door/proc/OpenClose(var/mob/Guy)
	if(!src.open)
		src.open=1
		src.density=0
		src.icon_state="Celldoor2"
		view() << "[Guy] opens the door"
		spawn(60)src.open=0
		spawn(60)src.density=1
		spawn(60)src.icon_state="Celldoor"



obj/Prison_Door
	icon='InteriorDeco.dmi'
	icon_state="Celldoor"
	density=1
	var/open=0
	var/Password="PolicePassword"

turf
	name="Era of the Shinobi"


turf/Blah
	opacity=1

turf/Teleporter
	var/goto_x
	var/goto_y
	var/goto_z

turf/TeleporterFODIn
turf/TeleporterFODOut
turf/TeleporterNorthDesertIn
turf/TeleporterNorthDesertKonoIn
turf/TeleporterNorthDesertInOut
turf/TeleporterNorthDesertKonoOut
turf/TeleporterKonOut
turf/TeleporterKonIn
turf/TeleporterKonSouthOut
turf/TeleporterKonSouthIn
turf/TeleporterSnowIn
turf/TeleporterSnowOut
turf/TeleporterSnowIn2
turf/TeleporterSnowOut2
turf/TeleporterForest2
turf/TeleporterForest2Out
turf/TeleporterSamuraiIn
turf/TeleporterSamuraiOut
turf/TeleporterKiriIn
turf/TeleporterKiriOut
turf/TeleporterForestIn
turf/TeleporterForestOut
turf/TeleporterKonForestIn
turf/TeleporterKonForestOut
turf/TeleporterSunaIn
turf/TeleporterSunaOut
turf/TeleporterSunaKazeIn
turf/TeleporterSunaKazeOut
turf/TeleporterValleyIn
turf/TeleporterValleyOut
turf/TeleporterSoundIn
turf/TeleporterSoundOut
turf/TeleporterIslandInKiri
turf/TeleporterIslandOutKiri
turf/TeleporterIslandInTemple
turf/TeleporterIslandOutTemple
turf/TeleporterIslandInLake
turf/TeleporterIslandOutLake
turf/Clan
	icon='SkillCard.dmi'
	Uchiha
		icon_state="Uchiha"
		layer = 15
	Nara
		icon_state="Nara"
		layer = 15
	Hyuuga
		icon_state="Hyuuga"
		layer = 15
	Inuzuka
		icon_state="Inuzuka"
		layer = 15
	Aburame
		icon_state="Aburame"
		layer = 15
	Akimichi
		icon_state="Akimichi"
		layer = 15
	Fire
		icon_state="Katon"
		layer = 15
	Water
		icon_state="Suiton"
		layer = 15
	Lightning
		icon_state="Raiton"
		layer = 15
	Earth
		icon_state="Doton"
		layer = 15
	Wind
		icon_state="Fuuton"
		layer = 15
turf
	Block
		icon='black.dmi'
		opacity=1
		density=1
		layer = 9999

	white
		icon='white.dmi'
		opacity=1
		density=1
		layer = 2
	Dense
		density=1
		mouse_opacity=0
		layer = 4000
		New()
			..()
			icon=null
turf/Bamboo
	icon='Turf.dmi'
	Bamboo
		icon_state="Bamboo"
		density=1
	Bamboo_2
		icon_state="Bamboo"
		layer=MOB_LAYER+1
	Bamboo_Head
		icon_state="Bamboo Head"
		layer=MOB_LAYER+1

	Big_Bamboo
		icon_state="Big Bamboo"
		density=1
	Big_Bamboo_2
		icon_state="Big Bamboo"
		layer=MOB_LAYER+1
	Big_Bamboo_Head
		icon_state="Big Bamboo Head"
		layer=MOB_LAYER+1

turf/Powerline
	Powerlinemainover
		icon='Powerline.dmi'
		layer=MOB_LAYER+30
	Powerlinemainunder
		icon='Powerline.dmi'
		layer=MOB_LAYER+5

turf/Terrain/Grasslight
	icon='turfgrass.dmi'
	layer=2
turf/Terrain/Grassd
	icon='turfgrassD.dmi'
	layer=2
turf/Terrain/Grass/miscc
	icon='grassmisc.dmi'
	layer=2

turf/Terrain/dirtd
	icon='dirtd.dmi'
	Grass

turf/Terrain/snow
	icon='snow.dmi'

turf/Terrain/sand1
	icon='sandd.dmi'
	//Entered(mob/M)
	//	if(!ismob(M)) return ..()
	//	src.overlays+=image(

turf/Terrain
	icon='grassmisc.dmi'
	Rock
		icon='grassmisc.dmi'
	Flower
		icon='grassmisc.dmi'


turf/Terrain
	Bunker
		Bunker
			icon='BunkGates.dmi'
		BunkernoTop
			icon='BunkGates - withouttop.dmi'
		Ancient_Bunker
			icon = 'bunkerdoorancient.dmi'
turf/Terrain
	icon='Turf.dmi'

	Sand
		icon_state="Sand"


	Grass
		var/mob/Body
		Dark
			icon_state="darkgrass"
		Center
			icon_state="grass"
		Horizon
			icon_state="horizon"
		Verticle
			icon_state="verticle"
		BL
			icon_state="bl"
		BR
			icon_state="br"
		TL
			icon_state="tl"
		TR
			icon_state="tr"
		C1
			icon_state="1"
		C2
			icon_state="2"
		C3
			icon_state="3"
		C4
			icon_state="4"
		Path
			icon_state="path"
turf/Interior
	ClothesInside
		icon='ClothesInside.dmi'
		density=1

obj/smallsign
	icon='MISC.dmi'
	layer=999


obj/Chunin_Door1
	icon='InteriorDeco.dmi'
	icon_state="Celldoor2"
	density=1
	var/open=0
	verb/Open_or_Close()
		set src in view(usr,2)
		if(!open)
			open=1
			density=0
			icon_state="Celldoor3"
			view() << "[usr] opens the door"
			return
		else
			open=0
			density=1
			icon_state="Celldoor2"
			view() << "[usr] closes the door"
			return
obj/blkover
	icon='Blank.dmi'
	layer=37
turf/Interior
	Desk
		icon='Desk.dmi'
		density=1
	Ramen
		icon='RamenInside.dmi'
		tlwall
			icon_state="tlwall"
			density=1
		tbwall
			icon_state="tbwall"
			density=1
		lrwall
			icon_state="lrwall"
			density=1
		trwall
			icon_state="trwall"
			density=1
		wall1
			icon_state="wall1"
			density=1
		wall2
			icon_state="wall2"
		doorway2
			icon_state="doorway2"
			density=1
		doorway1
			icon_state="doorway1"
			density=1
		chair
			icon_state="chair"
		wallA
			icon_state="wallA"
			density=1
		wallB
			icon_state="wallB"
			density=1
		outside
			icon_state="outside"
			density=1
		bchair
			icon_state="bchair/floor"
		floor
			icon_state="floor"
		fridge1
			icon_state="fridge1"
			density=1
		fridge2
			icon_state="fridge2"
			density=1
		cabinet1
			icon_state="cabinet1"
			density=1
		cabinet2
			icon_state="cabinet2"
			density=1
		stove1
			icon_state="stove1"
			density=1
		stove2
			icon_state="stove2"
			density=1
		sink2
			icon_state="sink2"
			density=1
		sink1
			icon_state="sink1"
			density=1
		sign1
			icon_state="sign1"
			layer = MOB_LAYER+1
		sign2
			icon_state="sign2"
			layer = MOB_LAYER+1
		sign3
			icon_state="sign3"
			layer = MOB_LAYER+1
		sign4
			icon_state="sign4"
			layer = MOB_LAYER+1
		sign5
			icon_state="sign5"
			layer = MOB_LAYER+1
		pipe2
			icon_state="pipe2"
			density=1
		pipe1
			icon_state="pipe1"
			density=1
		doorside
			icon_state="doorside"
			density=1
		pipe3
			icon_state="pipe/doorside"
			density=1
		stuff1
			icon_state="stuff1"
			density=1
		stuff2
			icon_state="stuff2"
			density=1
		stuff3
			icon_state="stuff3"
			density=1
		stuff4
			icon_state="stuff4"
			density=1
		ramen
			icon_state="ramen"
			density=1
		counter
			icon_state="counter"
			density=1
		empty
			icon_state="empty"
			density=1
		stuff5
			icon_state="stuff5"
			density=1


obj/TreeLeaves
	icon='TreeLeaves.dmi'
	New()
		src.pixel_x=rand(-22,22)
		src.pixel_y=rand(-22,22)
		src.icon_state=pick("1","2","3")
		..()

turf/Ground
	name=""
	Trees
		layer=MOB_LAYER+70
		mouse_opacity=0
	//	New()
			//src.dir=pick(NORTH,EAST,WEST,SOUTH)
			//..()
		MidPineTree
			icon='TreeMidd1.dmi'
			icon_state="r"

		MidPineTree2
			icon='TreePine.dmi'
			icon_state="r"
		MidTree2
			icon='Tree2.dmi'
			icon_state="r"
		MidTree3
			icon='Tree3.dmi'
			icon_state="end"
		MidTree4
			icon='Tree4.dmi'
			icon_state="r"
		MidPineTreeEnd
			icon='TreeMidd1.dmi'
			icon_state="end"
		MidPineTreeEnd2
			icon='TreePine.dmi'
			icon_state="end"
		MidTree2End
			icon='Tree2.dmi'
			icon_state="end"
		MidTree3End
			icon='Tree3.dmi'
			icon_state="r"
		MidTree4End
			icon='Tree4.dmi'
			icon_state="end"

		treedead
			icon='IECtrees.dmi'


		new_tree
			icon = 'tree112.dmi'
			icon_state="end"
			other
				icon='tree12.dmi'
				icon_state="r"

turf/loltree
	icon='NPTree.dmi'

turf/konohatree
	icon='treekonohagakuretree.dmi'
	layer=3
turf/konohatree1
	icon='treekonohagakuretree2.dmi'
	layer=999
turf/Tree1
	icon='Trees.dmi'
	layer=99
	var/
		Color=0
	T1
		icon_state="1"
		density=1
		var/attackable=1
		New()
			..()
			spawn(2)
				if(src.icon=='Trees3.dmi'||src.icon=='Trees2.dmi')
					var/leave=pick(1,2)
					if(leave==1)
						new/obj/TreeLeaves(locate(src.x,src.y,src.z))
						new/obj/TreeLeaves(locate(src.x,src.y,src.z))
						new/obj/TreeLeaves(locate(src.x,src.y,src.z))
						new/obj/TreeLeaves(locate(src.x,src.y,src.z))
						new/obj/TreeLeaves(locate(src.x,src.y,src.z))
						new/obj/TreeLeaves(locate(src.x,src.y,src.z))
	T4
		icon_state="4"
		layer=MOB_LAYER+1
		New()
			..()
			src.Color=pick(1,2,3)
			if(src.Color==1)
				for(var/turf/Tree1/T in view(src,1))
					T.icon='Trees2.dmi'
			if(src.Color==2)
				for(var/turf/Tree1/T in view(src,1))
					T.icon='Trees3.dmi'
			if(src.Color==3)
				for(var/turf/Tree1/T in view(src,1))
					T.icon='Trees.dmi'

turf/Tree2
	icon='Trees2.dmi'
	layer=99
	var/
		Color=0
	T1
		icon_state="1"
		density=1
		var/attackable=1
		New()
			..()
			spawn(2)
				if(src.icon=='Trees3.dmi'||src.icon=='Trees2.dmi')
					var/leave=pick(1,2)
					if(leave==1)
						new/obj/TreeLeaves(locate(src.x,src.y,src.z))
						new/obj/TreeLeaves(locate(src.x,src.y,src.z))
						new/obj/TreeLeaves(locate(src.x,src.y,src.z))
						new/obj/TreeLeaves(locate(src.x,src.y,src.z))
						new/obj/TreeLeaves(locate(src.x,src.y,src.z))
						new/obj/TreeLeaves(locate(src.x,src.y,src.z))
	T2
		icon_state="2"
		layer=MOB_LAYER+1
	T3
		icon_state="3"
		layer=MOB_LAYER+1
	T4
		icon_state="4"
		layer=MOB_LAYER+1
		New()
			..()
			src.Color=pick(1,2,3)
			if(src.Color==1)
				for(var/turf/Tree1/T in view(src,1))
					T.icon='Trees2.dmi'
			if(src.Color==2)
				for(var/turf/Tree1/T in view(src,1))
					T.icon='Trees3.dmi'
			if(src.Color==3)
				for(var/turf/Tree1/T in view(src,1))
					T.icon='Trees.dmi'
	T5
		icon_state="5"
		layer=MOB_LAYER+1
	T6
		icon_state="6"
		layer=99

turf/Tree3
	icon='Trees3.dmi'
	layer=99
	var/
		Color=0
	T1
		icon_state="1"
		density=1
		var/attackable=1
		New()
			..()
			spawn(2)
				if(src.icon=='Trees3.dmi'||src.icon=='Trees2.dmi')
					var/leave=pick(1,2)
					if(leave==1)
						new/obj/TreeLeaves(locate(src.x,src.y,src.z))
						new/obj/TreeLeaves(locate(src.x,src.y,src.z))
						new/obj/TreeLeaves(locate(src.x,src.y,src.z))
						new/obj/TreeLeaves(locate(src.x,src.y,src.z))
						new/obj/TreeLeaves(locate(src.x,src.y,src.z))
						new/obj/TreeLeaves(locate(src.x,src.y,src.z))
	T2
		icon_state="2"
		layer=MOB_LAYER+1
	T3
		icon_state="3"
		layer=MOB_LAYER+1
	T4
		icon_state="4"
		layer=MOB_LAYER+1
		New()
			..()
			src.Color=pick(1,2,3)
			if(src.Color==1)
				for(var/turf/Tree1/T in view(src,1))
					T.icon='Trees2.dmi'
			if(src.Color==2)
				for(var/turf/Tree1/T in view(src,1))
					T.icon='Trees3.dmi'
			if(src.Color==3)
				for(var/turf/Tree1/T in view(src,1))
					T.icon='Trees.dmi'
	T5
		icon_state="5"
		layer=MOB_LAYER+1
	T6
		icon_state="6"
		layer=99
turf/Wood
	icon='Turf.dmi'
	icon_state="wood"
turf/Bridge
	icon='Turf.dmi'
	icon_state="Bridge"

turf/Bench
	Bench
		icon='Turf.dmi'
		icon_state="Bench"





turf/Climbing
	icon='Trees.dmi'
	Tree
		icon_state="7"



turf/Climbing
	icon='Trees.dmi'
	TreeBottom
		icon_state="8"
		Entered(mob/M)
			if(ismob(M))
				M.ontree=1
				M.Tree()
		Exited(mob/M)
			if(ismob(M))
				M.ontree=0
turf
	Suna
		SunaBuilding
			icon='Sand.dmi'
			density=1
		SunaAcademy
			icon='SunaAcademy.dmi'
			density=1
		c2
			icon='SunaAcademy.dmi'
			icon_state="c2"
		Kagebuild
			icon='kazekagebuild.dmi'
			layer=MOB_LAYER+30
		sunanewbuild
			icon='sunabuilding1.dmi'
			layer=MOB_LAYER+30
		SUNANEWKAGEBG
			icon='Kazekagebg.dmi'
			layer=MOB_LAYER+30
		SUNANEWKAGEFRONT
			icon='Kazekagefront.dmi'
	Konoha
		Stand
			icon='Turf.dmi'
			Part1
				icon_state="b1"
				layer=MOB_LAYER+1
			Part2
				icon_state="b2"
				layer=MOB_LAYER+1
			Part3
				icon_state="b3"
				layer=MOB_LAYER+1
			Part4
				icon_state="b4"
				density=1
				layer=MOB_LAYER+1
			Part5
				icon_state="b5"
				density=1
				layer=MOB_LAYER+1
		Buildingkiriwall
			icon='kiriwall.dmi'
			density=1
		Buildingsunawall
			icon='sunawall.dmi'
			density=1
		Buildingsuna
			icon='sunabuilding.dmi'
			density=1
		Grave
			icon='Grave.dmi'
		AcademyEnt
			density=1
		newbuilding
			icon='newbuildings.dmi'
			layer=MOB_LAYER+30
		newbuilding1
			icon='newbuildingsnew.dmi'
			layer=MOB_LAYER+30
		NewsStand1
			icon='newstand.dmi'
			layer=30
		ERA
		Ramen
			icon='Ramen.dmi'
			density=1
		Kage
			icon='hokage.dmi'
			layer=MOB_LAYER+70
		toi
			icon='templeofironback.dmi'
			layer=MOB_LAYER+70
		toi1
			icon='templeofironfront.dmi'
		mizuKage
			icon='mizukagebg.dmi'
			layer=MOB_LAYER+70
		Kagefront
			icon='kagefront.dmi'
			layer=2
		Floor
			icon='Turf.dmi'
			Stone1
				icon_state="stone1"
			Stone2
				icon_state="stone2"
			Stone3
				icon_state="stone3"
	Fence
		icon='Turf.dmi'
		density=1


	Wall
		icon='Wall.dmi'
		layer= MOB_LAYER+20
	arrowpointer
		icon='arrowpoint.dmi'
		layer= MOB_LAYER+20
	Wallkiri
		icon='Wallkiri.dmi'
		layer= MOB_LAYER+20
	Wallsuna
		icon='Wallsuna.dmi'
		layer= MOB_LAYER+29
	Windows
		icon='windows.dmi'
		density=1
	TreeClimbinga
		icon='Tree.dmi'
		T1
			icon_state="1"
			layer= MOB_LAYER+1
		T2
			icon_state="2"
			Entered(mob/M)
				if(ismob(M))
					M.ontree=1
					M.Tree()
			Exited(mob/M)
				if(ismob(M))
					M.ontree=0
		T3
			icon_state="3"
			Entered(mob/M)
				if(ismob(M))
					M.ontree=1
					M.Tree()
			Exited(mob/M)
				if(ismob(M))
					M.ontree=0
		T4
			icon_state="4"
			layer= MOB_LAYER+1
		T5
			icon_state="5"
			layer= MOB_LAYER+1
		T6
			icon_state="6"
			Entered(mob/M)
				if(ismob(M))
					M.ontree=1
					M.Tree()
			Exited(mob/M)
				if(ismob(M))
					M.ontree=0
		T7
			icon_state="7"
			Entered(mob/M)
				if(ismob(M))
					M.ontree=1
					M.Tree()
			Exited(mob/M)
				if(ismob(M))
					M.ontree=0
		T8
			icon_state="8"
			Entered(mob/M)
				if(ismob(M))
					M.ontree=1
					M.Tree()
			Exited(mob/M)
				if(ismob(M))
					M.ontree=0
		T9
			icon_state="9"
			Entered(mob/M)
				if(ismob(M))
					M.ontree=1
					M.Tree()
			Exited(mob/M)
				if(ismob(M))
					M.ontree=0
		T10
			icon_state="10"
			layer= MOB_LAYER+1
		T11
			icon_state="11"
			Entered(mob/M)
				if(ismob(M))
					M.ontree=1
					M.Tree()
			Exited(mob/M)
				if(ismob(M))
					M.ontree=0

		T12
			icon_state="12"
			Entered(mob/M)
				if(ismob(M))
					M.ontree=1
					M.Tree()
			Exited(mob/M)
				if(ismob(M))
					M.ontree=0
		T13
			icon_state="13"
			Entered(mob/M)
				if(ismob(M))
					M.ontree=1
					M.Tree()
			Exited(mob/M)
				if(ismob(M))
					M.ontree=0
		T14
			icon_state="14"
			Entered(mob/M)
				if(ismob(M))
					M.ontree=1
					M.Tree()
			Exited(mob/M)
				if(ismob(M))
					M.ontree=0
		T15
			icon_state="15"
			Entered(mob/M)
				if(ismob(M))
					M.ontree=1
					M.Tree()
			Exited(mob/M)
				if(ismob(M))
					M.ontree=0
		T16
			icon_state="16"
			layer= MOB_LAYER+1
		T17
			icon_state="17"
			density=1
		T18
			icon_state="18"
			Entered(mob/M)
				if(ismob(M))
					M.ontree=1
					M.Tree()
			Exited(mob/M)
				if(ismob(M))
					M.ontree=0
		T19
			icon_state="19"
			density=1
		T20
			icon_state="20"
			density=1
		T21
			icon_state="21"
			Entered(mob/M)
				if(ismob(M))
					M.ontree=1
					M.Tree()
			Exited(mob/M)
				if(ismob(M))
					M.ontree=0
		T22
			icon_state="22"
			density=1
		T23
			icon_state="23"
			density=1
		T24
			icon_state="24"
			Entered(mob/M)
				if(ismob(M))
					M.ontree=1
					M.Tree()
			Exited(mob/M)
				if(ismob(M))
					M.ontree=0
		T25
			icon_state="25"
			density=1
		T26
			icon_state="26"
			density=1
		T27
			icon_state="27"
			Entered(mob/M)
				if(ismob(M))
					M.ontree=1
					M.Tree()
			Exited(mob/M)
				if(ismob(M))
					M.ontree=0
		T28
			icon_state="28"
			density=1
		T29
			icon_state="29"
			density=0
		T30
			icon_state="30"
			Entered(mob/M)
				if(ismob(M))
					M.ontree=1
					M.Tree()
			Exited(mob/M)
				if(ismob(M))
					M.ontree=0
		T31
			icon_state="31"
			density=0
		T32
			icon_state="32"
			density=0
		T33
			icon_state="33"
			density=0
		T34
			icon_state="34"
			density=0
