//obj/items/Clothing
//	flowers
//		redflower
//			name="Rose"
//			icon='redflower.dmi'
//			icon_state="Inv"
//			Click()
//				..()
//				if(src in usr.contents)
//					if(!src.worn)
//						src.worn = 1
//						src.suffix = "Equipped"
//						usr.overlays += src.icon
//					else
//						src.worn = 0
//						src.suffix=""
//						usr.overlays -= src.icon
//		blueflower
//			name="Violet"
//			icon='blueflower.dmi'
//			icon_state="Inv"
//			Click()
//				..()
//				if(src in usr.contents)
//					if(!src.worn)
//						src.worn = 1
//						src.suffix = "Equipped"
//						usr.overlays += src.icon
//					else
//						src.worn = 0
//						src.suffix=""
//						usr.overlays -= src.icon
//		yellowflower
//			name="Tullip"
//			icon='yellowflower.dmi'
//			icon_state="Inv"
//			Click()
//				..()
//				if(src in usr.contents)
//					if(!src.worn)
//						src.worn = 1
//						src.suffix = "Equipped"
//						usr.overlays += src.icon
//					else
//						src.worn = 0
//						src.suffix=""
//						usr.overlays -= src.icon
turf/ASaviorturf
	Konohatempgate
		temp
			icon = 'konohanewgate.dmi'
			layer = 250
	amegakureplat
		v1
			icon = 'ameplatform.dmi'
	amegakure
		v1
			icon = 'amebuildings.dmi'
			layer= 5
			Roof
			layer=6
			VA
				layer=7
			RoofA
				layer=8
			VB
				layer=9
			RoofB
				layer=10
			VC
				layer=11
			VD
				layer=13
			RoofC
				layer=12
			RoofD
				layer=14
		v2
			icon = 'newamebuilding.dmi'
			layer= 25
		floor
			icon = 'floora1.dmi'
		misc
			icon = 'amebuildingtower.dmi'
			A
				layer=7
			B
				layer=9
			C
				layer=11
	amegakurekage
		icon = 'amekagebuildingreal.dmi'
		layer=200
	nwalls
		v1
			icon = 'wall1.dmi'
			layer= 4
	stairs
		v1
			icon = 'stairssideways.dmi'

	background
		ok
			grass
				grasspale
					icon = 'palegrass.dmi'
					layer=2
				grass
					icon = 'grass.dmi'
					layer=2
				grassturfedges
					icon = 'grassdirtedges.dmi'
					layer=2
				turf64
					icon = 'turf64.dmi'
					layer=2
				grasssoftedges
					icon = 'grasssoftedges.dmi'
					layer=2
				grassmisc
					icon = 'grassmisc1.dmi'
					layer=4
				grassinside
					icon = 'grassinside1.dmi'
					layer = 2
				grassm
					icon = 'grassm.dmi'
				grassmt
					icon = 'grassmt.dmi'
				grassce
					icon = 'grasscementedges.dmi'
					layer = 2
				grassmisSTACK
					icon = 'grassmiscC.dmi'
					layer = 3
					a1
						icon_state="1"
					a2
						icon_state="2"
					a3
						icon_state="3"
					a4
						icon_state="4"
					a5
						icon_state="5"
					a6
						icon_state="6"
					a7
						icon_state="7"
					a8
						icon_state="8"
					a9
						icon_state="9"
					a10
						icon_state="10"
					a11
						icon_state="11"
					a12
						icon_state="12"
					a13
						icon_state="13"
					a14
						icon_state="14"
					a15
						icon_state="15"
					a16
						icon_state="16"



			dirt
				lightdirtedge
					icon = 'dirtledge.dmi'
					layer=2
					a1
						icon_state="1"
					a2
						icon_state="2"
					a3
						icon_state="3"
					a4
						icon_state="4"
					a5
						icon_state="5"
					a6
						icon_state="6"
					a7
						icon_state="7"
					a8
						icon_state="8"
					a9
						icon_state="9"
					b1
						icon_state="10"
					b2
						icon_state="11"
					b3
						icon_state="12"
					b4
						icon_state="13"
					b5
						icon_state="14"
					b6
						icon_state="15"
					b7
						icon_state="16"
					b8
						icon_state="17"
					b9
						icon_state="18"
					c1
						icon_state="19"
					c2
						icon_state="20"
					c3
						icon_state="21"
					c4
						icon_state="22"
					c5
						icon_state="23"
					c6
						icon_state="24"
					c7
						icon_state="25"
					c8
						icon_state="26"
					c9
						icon_state="27"
					d1
						icon_state="28"
					d2
						icon_state="29"
					d3
						icon_state="30"
					d4
						icon_state="31"
					d5
						icon_state="32"
					d6
						icon_state="33"
					d7
						icon_state="34"
					d8
						icon_state="35"
					d9
						icon_state="36"
					e1
						icon_state="37"
					e2
						icon_state="38"
					e3
						icon_state="39"
					e4
						icon_state="40"
					e5
						icon_state="41"
					e6
						icon_state="42"
					e7
						icon_state="43"
					e8
						icon_state="44"
					e9
						icon_state="45"
					f1
						icon_state="46"
					f2
						icon_state="47"
					f3
						icon_state="48"
					f4
						icon_state="49"
					f5
						icon_state="50"
					f6
						icon_state="51"
					f7
						icon_state="52"
					f8
						icon_state="53"
					f9
						icon_state="54"
					g1
						icon_state="55"
					g2
						icon_state="56"
					g3
						icon_state="57"
					g4
						icon_state="58"
					g5
						icon_state="59"
					g6
						icon_state="60"
					g7
						icon_state="61"
					g8
						icon_state="62"
					g9
						icon_state="63"
					h1
						icon_state="64"
					h2
						icon_state="65"
					h3
						icon_state="66"
					h4
						icon_state="67"
				meddirtedge
					icon = 'dirtmedges.dmi'
					layer=2
					a1
						icon_state="1"
					a2
						icon_state="2"
					a3
						icon_state="3"
					a4
						icon_state="4"
					a5
						icon_state="5"
					a6
						icon_state="6"
					a7
						icon_state="7"
					a8
						icon_state="8"
					a9
						icon_state="9"
					b1
						icon_state="10"
					b2
						icon_state="11"
					b3
						icon_state="12"
					b4
						icon_state="13"
					b5
						icon_state="14"
					b6
						icon_state="15"
					b7
						icon_state="16"
					b8
						icon_state="17"
					b9
						icon_state="18"
					c1
						icon_state="19"
					c2
						icon_state="20"
					c3
						icon_state="21"
					c4
						icon_state="22"
					c5
						icon_state="23"
					c6
						icon_state="24"
					c7
						icon_state="25"
					c8
						icon_state="26"
					c9
						icon_state="27"
					d1
						icon_state="28"
					d2
						icon_state="29"
					d3
						icon_state="30"
					d4
						icon_state="31"
					d5
						icon_state="32"
					d6
						icon_state="33"
					d7
						icon_state="34"
					d8
						icon_state="35"
					d9
						icon_state="36"
					e1
						icon_state="37"
					e2
						icon_state="38"
					e3
						icon_state="39"
					e4
						icon_state="40"
					e5
						icon_state="41"
					e6
						icon_state="42"
					e7
						icon_state="43"
					e8
						icon_state="44"
					e9
						icon_state="45"
					f1
						icon_state="46"
					f2
						icon_state="47"
					f3
						icon_state="48"
					f4
						icon_state="49"
					f5
						icon_state="50"
					f6
						icon_state="51"
					f7
						icon_state="52"
					f8
						icon_state="53"
					f9
						icon_state="54"
					g1
						icon_state="55"
					g2
						icon_state="56"
					g3
						icon_state="57"
					g4
						icon_state="58"
					g5
						icon_state="59"
					g6
						icon_state="60"
					g7
						icon_state="61"
					g8
						icon_state="62"
					g9
						icon_state="63"
					h1
						icon_state="64"
					h2
						icon_state="65"
					h3
						icon_state="66"
					h4
						icon_state="67"


			tree
				AA
					Dead
						A
							icon = 'treesmall.dmi'
							icon_state="1"
							layer=4
						B
							icon = 'treesmall.dmi'
							icon_state="2"
							layer=4
					Misc
						A
							icon = 'Treemisc.dmi'
							icon_state="a1"
							layer=4
						B
							icon = 'Treemisc.dmi'
							icon_state="a2"
							layer=4
						C
							icon = 'Treemisc.dmi'
							icon_state="a3"
							layer=4
						D
							icon = 'Treemisc.dmi'
							icon_state="a4"
							layer=4
						A1
							icon = 'Treemisc.dmi'
							icon_state="b1"
							layer=4
						B1
							icon = 'Treemisc.dmi'
							icon_state="b2"
							layer=4
						C1
							icon = 'Treemisc.dmi'
							icon_state="b3"
							layer=4
						D1
							icon = 'Treemisc.dmi'
							icon_state="b4"
							layer=4


				A
					Top
						A
							icon = 'tree1.dmi'
							icon_state="a2"
							layer=55
						B
							icon = 'tree1.dmi'
							icon_state="b2"
							layer=55
						C
							icon = 'tree1.dmi'
							icon_state="d1"
							layer=55
					Bot
						A
							icon = 'tree.dmi'
							icon_state="a1"
							layer=4
						B
							icon = 'tree.dmi'
							icon_state="b1"
							layer=4
						C
							icon = 'tree.dmi'
							icon_state="c1"
							layer=4
						D
							icon = 'tree.dmi'
							icon_state="d2"
							layer=4
						E
							icon = 'tree.dmi'
							icon_state="d5"
							layer=4
						F
							icon = 'tree.dmi'
							icon_state="d3"
							layer=4

				B
					Top
						A
							icon = 'tree1.dmi'
							icon_state="c2"
							layer=55
						B
							icon = 'tree1.dmi'
							icon_state="t1"
							layer=55
						C
							icon = 'tree1.dmi'
							icon_state="t2"
							layer=55
						D
							icon = 'tree1.dmi'
							icon_state="f1"
							layer=55
						E
							icon = 'tree1.dmi'
							icon_state="f2"
							layer=55
					Bot
						A
							icon = 'tree.dmi'
							icon_state="g1"
							layer=4
						B
							icon = 'tree.dmi'
							icon_state="g4"
							layer=4
						C
							icon = 'tree.dmi'
							icon_state="g2"
							layer=4
						D
							icon = 'tree.dmi'
							icon_state="g3"
							layer=4
				C
					Misc
						A
							icon = 'tree.dmi'
							icon_state="t1"
							layer=4
						B
							icon = 'tree.dmi'
							icon_state="t2"
							layer=4
						C
							icon = 'tree.dmi'
							icon_state="t3"
							layer=4
						D
							icon = 'tree.dmi'
							icon_state="t4"
							layer=4
					Shadows
						A
							icon = 'trees123.dmi'
							icon_state="a"
							layer=54
						B
							icon = 'trees123.dmi'
							icon_state="b"
							layer=54
						C
							icon = 'trees123.dmi'
							icon_state="c"
							layer=54
						D
							icon = 'trees123.dmi'
							icon_state="d"
							layer=54
						E
							icon = 'trees123.dmi'
							icon_state="e"
							layer=54
						F
							icon = 'trees123.dmi'
							icon_state="f"
							layer=54
						G
							icon = 'trees123.dmi'
							icon_state="g"
							layer=54


	amegakurecoded
		v1
			icon = 'amebuildings.dmi'
			base
				icon_state="1"
				layer= 22
			basealt
				icon_state="2a"
				layer= 22
			basealt1
				icon_state="2ac"
				layer= 22
			L
				icon_state="1a"
				layer= 22
			R
				icon_state="3a"
				layer= 22
		streetmisc
			icon = 'cart.dmi'
			base
				icon_state="base"
				layer= 4
			basealt
				icon_state="base1"
				layer= 4
			basealt1
				icon_state="base2"
				layer= 4
			b
				icon_state="1"
				layer= 4
			b1
				icon_state="2"
				layer= 4
		platform
			icon = 'platform.dmi'
			layer= 4
		v155
			icon = 'amebuildings.dmi'
			layer= 55
			base
				icon_state="1"
			basealt
				icon_state="2a"
			basealt1
				icon_state="2ac"
			L
				icon_state="1a"
			R
				icon_state="3a"
		v2rail
			icon = 'amebuildings.dmi'
			base
				icon_state="2b"
				layer= 55
			L
				icon_state="1b"
				layer= 55
			R
				icon_state="3b"
				layer= 55
			basea
				icon_state="2ba"
				layer= 4
			La
				icon_state="1ba"
				layer= 4
			Ra
				icon_state="3ba"
				layer= 4
		misc
			icon = 'amebuildingtower.dmi'
			a
				icon_state="b"
				layer= 151
			b
				icon_state="1"
				layer= 151
			c
				icon_state="2"
				layer= 151
			a1
				icon_state="e1"
				layer= 151
			b1
				icon_state="e2"
				layer= 151
			c1
				icon_state="e3"
				layer= 151
		miscwindows
			icon = 'amebuildingwindows.dmi'
			a
				icon
				layer= 55
		garbage
			A
				icon = 'garbagea.dmi'
				icon_state="a"
				layer=4

			B
				icon = 'garbagea.dmi'
				icon_state="b"
				layer=4
turf
	buildings1
		RoundBASE
			icon = 'roundbuilding.dmi'
			Round55
				icon = 'roundbuilding.dmi'
				layer=55

			Gridfence
				icon = 'fence.dmi'
				layer=4
				L56
					layer=56

obj
	buildings
		layer = 55
		icon='amedoor.dmi'
		icon_state="close"


		amedoora
			layer = 355
			icon='amedoor.dmi'
			icon_state="close1"
			density=1
			var/Opacity=0
			var/password=null
			var/Locked=0
			New()
				..()
				if(Opacity)
					opacity=1
			Click()
				if(get_dist(src,usr)>1) return
				if(usr.RecentVerbCheck("Knock", 100,1)) return
				usr.recentverbs["Knock"]=world.realtime
				var/GoesHome=0
				var/turf/T=src.loc
				if(!T) return
				if(istype(T,/turf/WARPERHOMES/)) GoesHome=T
				if(istype(T,/turf/WARPERSUNA/)) GoesHome=T
				if(istype(T,/turf/WARPERCOUNTRY/)) GoesHome=T
				if(GoesHome)
					for(var/mob/M in range(14))
						M<<output("[usr] knocks on the door.","ICout")
					for(var/mob/M in range(14,GoesHome:goingto))
						M<<output("[usr] knocks on the door.","ICout")
				else
					for(var/mob/M in range(14))
						M<<output("[usr] knocks on the door.","ICout")
			proc/Open()
				layer=9
				flick("opening",src)
				icon_state="open"
				if(Opacity) opacity=0
				density=0
				spawn(30)
					layer=355
					flick("closing",src)
					icon_state="close"
					density=1
					layer=355
					if(Opacity) opacity=0



		amedoorbase
			density=1
			var/Opacity=0
			var/password=null
			var/Locked=0
			New()
				..()
				if(Opacity)
					opacity=1
			Click()
				if(get_dist(src,usr)>1) return
				if(usr.RecentVerbCheck("Knock", 100,1)) return
				usr.recentverbs["Knock"]=world.realtime
				var/GoesHome=0
				var/turf/T=src.loc
				if(!T) return
				if(istype(T,/turf/WARPERHOMES/)) GoesHome=T
				if(istype(T,/turf/WARPERSUNA/)) GoesHome=T
				if(istype(T,/turf/WARPERCOUNTRY/)) GoesHome=T
				if(GoesHome)
					for(var/mob/M in range(14))
						M<<output("[usr] knocks on the door.","ICout")
					for(var/mob/M in range(14,GoesHome:goingto))
						M<<output("[usr] knocks on the door.","ICout")
				else
					for(var/mob/M in range(14))
						M<<output("[usr] knocks on the door.","ICout")
			a
				icon='amedoor.dmi'
				icon_state="a1"
				layer = 354
			b
				icon='amedoor.dmi'
				icon_state="a2"
				layer = 354
			c
				icon='amedoor.dmi'
				icon_state="ez"
				density = 1
				layer = 354
			twina
				icon='amedoor1.dmi'
				icon_state="a2"
				layer = 355
			twinb
				icon='amedoor1.dmi'
				icon_state="a1"
				density = 1
				layer = 355
			twinamedoorr
				layer = 355
				icon='amedoor1.dmi'
				icon_state="close"
				density=1
				proc/Open()
					layer=355
					flick("opening",src)
					icon_state="open"
					if(Opacity) opacity=0
					density=0
					spawn(30)
						layer=355
						flick("closing",src)
						icon_state="close"
						density=1
						layer=355
						if(Opacity) opacity=0
				Cross()
					if(src.icon_state == "close")
						Open()
					return ..()
			twinamedoorl
				layer = 355
				icon='amedoor1.dmi'
				icon_state="close1"
				density=1
				proc/Open()
					layer=355
					flick("opening1",src)
					icon_state="open1"
					if(Opacity) opacity=0
					density=0
					spawn(30)
						layer=355
						flick("closing1",src)
						icon_state="close1"
						density=1
						layer=355
						if(Opacity) opacity=0
				Cross()
					if(src.icon_state == "close1")
						Open()
					return ..()


turf
	buildings1
		New()
			..()
			sleep(10)
			//world << "[icon] - [icon_state]"

		konohagakure
			CultureBuilding
				blue
					icon = 'buildingblue1.dmi'
					layer=4
					Big
						icon = 'buildingblue1.dmi'
						layer=4
					Big46
						layer=4
						icon = 'buildingblue1.dmi'
				red
					icon = 'culturebuildingred.dmi'
					layer=4
					Big
						icon = 'culturebuildingred.dmi'
						layer=4
					Big46
						layer=4
						icon = 'culturebuildingred.dmi'
					Big146
						layer=146
						icon = 'culturebuildingred.dmi'
				green
					icon = 'culturebuildinggreen.dmi'
					layer=4
					Big
						icon = 'culturebuildinggreen.dmi'
						layer=4
					Big46
						layer=4
						icon = 'culturebuildinggreen.dmi'
				brown
					icon = 'culturebuildingbrown.dmi'
					layer=4
					Big
						icon = 'culturebuildingbrown.dmi'
						layer=4
					Big46
						layer=4
						icon = 'culturebuildingbrown.dmi'
			Spastuff
				icon = 'spastuff.dmi'
				layer=4
			KonohagakureBASE
				icon = 'KonohaBUILDING.dmi'
				layer=4
				Addons
					icon = 'buildingaddons.dmi'
					layer=4
				Big
					icon = 'KonohaBUILDINGB.dmi'
					layer=4
				Big41
					layer=41
					A
						icon = 'KonohaBUILDING.dmi'
					B
						icon = 'KonohaBUILDINGB.dmi'
				Big47
					layer=47
					A
						icon = 'KonohaBUILDING.dmi'
					B
						icon = 'KonohaBUILDINGB.dmi'
				Big50
					layer=50
					A
						icon = 'KonohaBUILDING.dmi'
					B
						icon = 'KonohaBUILDINGB.dmi'
				Big55
					layer=55
					A
						icon = 'KonohaBUILDING.dmi'
					B
						icon = 'KonohaBUILDINGB.dmi'
				Big60
					layer=60
					A
						icon = 'KonohaBUILDING.dmi'
					B
						icon = 'KonohaBUILDINGB.dmi'
				Big160
					layer=160
					A
						icon = 'KonohaBUILDING.dmi'
					B
						icon = 'KonohaBUILDINGB.dmi'

			building2
				icon = 'building2.dmi'
				layer=4
			PoorMisc
				icon = 'poormisc.dmi'
				layer=4
			Gridfence
				icon = 'fence.dmi'
				layer=4
				L23
					layer=2
				L41
					layer=4
				L46
					layer=4
			Trashmisc
				icon = 'trtash.dmi'
				layer=4
			Bmisc
				icon = 'bmisc.dmi'
				layer=23
				Big
					icon = 'bmisc1.dmi'
					layer=4
				I41
					layer=4
					Small
						icon = 'bmisc.dmi'
					Big
						icon = 'bmisc1.dmi'
			Playground
				icon = 'playground.dmi'

			BmiscRoof
				icon = 'broofmisc.dmi'
				layer=4
				I23
					icon = 'broofmisc.dmi'
					layer=4
				I41
					layer=4
					Small
						icon = 'broofmisc.dmi'
					Big
						icon = 'broofmisc.dmi'
			RoundBASE
				icon = 'roundbuilding.dmi'
				layer=4
				Round41
					icon = 'roundbuilding.dmi'
					layer=41
				Round60
					icon = 'roundbuilding.dmi'
					layer=60
				Round80
					icon = 'roundbuilding.dmi'
					layer=80
			Konohagakureextra
				icon = 'smallparts.dmi'
				layer=20
			Konohagakurewall
				icon = 'konohagakurewall.dmi'
				layer=40
				Hort
					icon = 'konohagakurewallh.dmi'
					layer=40
				Vert
					icon = 'konohagakurewallV.dmi'
					layer=40
				KW45
					icon = 'konohagakurewall.dmi'
					layer=45
					Hort
						icon = 'konohagakurewallh.dmi'
					Vert
						icon = 'konohagakurewallV.dmi'
				KW50
					icon = 'konohagakurewall.dmi'
					layer=50
					Hort
						icon = 'konohagakurewallh.dmi'
					Vert
						icon = 'konohagakurewallV.dmi'
				KW100
					icon = 'konohagakurewall.dmi'
					layer=100
					Hort
						icon = 'konohagakurewallh.dmi'
					Vert
						icon = 'konohagakurewallV.dmi'
			Roofs
				layer=24
				Brown
					icon = 'KonohagakureROOFbrownb.dmi'
				Red
					icon = 'KonohagakureROOFredb.dmi'
				Blue
					icon = 'KonohagakureROOFblueb.dmi'
				Green
					icon = 'KonohagakureROOFgreenb.dmi'
				Orange
					icon = 'KonohagakureROOForangeb.dmi'
				Big
					Brown
						icon = 'KonohagakureROOFbrown.dmi'
					Red
						icon = 'KonohagakureROOFred.dmi'
					Blue
						icon = 'KonohagakureROOFblue.dmi'
					Green
						icon = 'KonohagakureROOFgreen.dmi'
					Orange
						icon = 'KonohagakureROOForange.dmi'
				Big23
					layer=23
					Brown
						icon = 'KonohagakureROOFbrown.dmi'
					Red
						icon = 'KonohagakureROOFred.dmi'
					Blue
						icon = 'KonohagakureROOFblue.dmi'
					Green
						icon = 'KonohagakureROOFgreen.dmi'
					Orange
						icon = 'KonohagakureROOForange.dmi'
				Big41
					layer=41
					Brown
						icon = 'KonohagakureROOFbrown.dmi'
					Red
						icon = 'KonohagakureROOFred.dmi'
					Blue
						icon = 'KonohagakureROOFblue.dmi'
					Green
						icon = 'KonohagakureROOFgreen.dmi'
					Orange
						icon = 'KonohagakureROOForange.dmi'
				Big49
					layer=49
					Brown
						icon = 'KonohagakureROOFbrown.dmi'
					Red
						icon = 'KonohagakureROOFred.dmi'
					Blue
						icon = 'KonohagakureROOFblue.dmi'
					Green
						icon = 'KonohagakureROOFgreen.dmi'
					Orange
						icon = 'KonohagakureROOForange.dmi'
			streetlight
				icon = 'streetlights.dmi'
				layer=40
				plus51
					layer=51
	border
		icon = 'borderthings.dmi'
		layer = 100
turf
	backdrop
		cliff
			cliff
				icon = 'cliff.dmi'
				layer=2
			cliff1a
				icon = 'cliff1.dmi'
				layer=2
			NEW
				cliffBASE
					cliff
						icon = 'cliff.dmi'
						layer=2
					cliff1a
						icon = 'cliff1.dmi'
						layer=2
				cliffUP
					cliff
						icon = 'cliff.dmi'
						layer=2
					cliff1a
						icon = 'cliff1.dmi'
						layer=2
		ground
			groundfinal
				icon = 'grroundmisc1.dmi'
				layer=2
			grass
				grass
					icon = 'grass.dmi'
				grassturfedges
					icon = 'grassdirtedges.dmi'
					layer=2
				turf64
					icon = 'turf64.dmi'
				grasssoftedges
					icon = 'grasssoftedges.dmi'
				grassmisc
					icon = 'grassmisc.dmi'
				grassinside
					icon = 'grassinside1.dmi'
					layer = 2
				grassm
					icon = 'grassm.dmi'
				grassce
					icon = 'grasscementedges.dmi'
					layer = 2
			cement
				c1
					icon = 'cement.dmi'
					layer=2
			uwalls
				w1
					icon = 'urbanwalls.dmi'
					layer = 20
			water1
				water
					icon = 'water2.dmi'
					layer = 2
					Entered(mob/M)
						if(ismob(M)&&M.Convert)
							M.onwater=1
						if(ismob(M)&&M.Convert==0)
							if(!M.overlays.Find('Swim.dmi')) M.overlays += 'Swim.dmi'
							M.swim=1
					Exited(mob/M)
						if(ismob(M)&&M.Convert)
							M.onwater=0
						if(ismob(M)&&M.Convert==0)
							M.overlays -= 'Swim.dmi'
							M.swim=0
							M.onwater=0
			dirt
				dirtlightsides
					icon = 'dirt.dmi'
					layer = 2
				dirtmedsides
					icon = 'dirtm.dmi'
					layer = 2
				dirtlpath
					icon = 'dirtpath.dmi'
					layer = 2
			misc
				boxes
					icon = 'groundmisc.dmi'
					layer = 25
				tombstone
					icon = 'graveyard.dmi'
					layer = 15
				garbage
					icon = 'garbagecan.dmi'
					layer = 25
				sidewalk
					icon = 'sidewalk.dmi'
					layer = 2
				sidewalkcorners
					icon = 'sidecorner.dmi'
					layer = 2
				stairs
					icon = 'stairs.dmi'
				fence
					icon = 'fences.dmi'
					layer = 15
				fence1
					icon = 'fence1.dmi'
					layer = 15
				fence2
					icon = 'fence2.dmi'
					layer = 15
				fence3
					icon = 'fencew.dmi'
					layer = 15
				Fenceplus
					layer = 50
					fence
						icon = 'fences.dmi'
					fence1
						icon = 'fence1.dmi'
					fence2
						icon = 'fence2.dmi'
					fence3
						icon = 'fencew.dmi'
					fenceb
						icon = 'fenceb.dmi'
				bridge
					icon = 'bridge.dmi'
					l150
						layer=100
			Tree1
				TreeA
					Shadow
						treeb
							layer = 19
							icon = 'trees1.dmi'
						treeH
							layer = 19
							icon = 'treehbases.dmi'
						treev
							layer = 19
							icon = 'treevbases.dmi'
					Base
						treeb
							layer = 6
							icon = 'CODE/tree.dmi'
						treeH
							layer = 6
							icon = 'treehbase.dmi'
						treev
							layer = 6
							icon = 'treevbase.dmi'
					TransT
						Top
							layer = 20
							icon = 'treet1.dmi'
					Top
						treeb
							layer = 20
							icon = 'tree1.dmi'
						treeH
							layer = 20
							icon = 'treeh.dmi'
						treev
							layer = 20
							icon = 'treev.dmi'
				TreeA24
					Top
						treeb
							layer = 24
							icon = 'tree1.dmi'
						treeH
							layer = 24
							icon = 'treeh.dmi'
						treev
							layer = 24
							icon = 'treev.dmi'
				TreeA39
					Top
						treeb
							layer=49
							icon = 'tree1.dmi'
						treeH
							layer=49
							icon = 'treeh.dmi'
						treev
							layer=49
							icon = 'treev.dmi'
				TreeA40
					Top
						treeb
							layer = 41
							icon = 'tree1.dmi'
						treeH
							layer = 41
							icon = 'treeh.dmi'
						treev
							layer = 41
							icon = 'treev.dmi'
				TreeA46
					Top
						treeb
							layer = 46
							icon = 'tree1.dmi'
						treeH
							layer = 46
							icon = 'treeh.dmi'
						treev
							layer = 46
							icon = 'treev.dmi'
				TreeA50
					Top
						treeb
							layer = 50
							icon = 'tree1.dmi'
						treeH
							layer = 50
							icon = 'treeh.dmi'
						treev
							layer = 50
							icon = 'treev.dmi'
				TreeA100
					Top
						treeb
							layer = 100
							icon = 'tree1.dmi'
						treeH
							layer = 100
							icon = 'treeh.dmi'
						treev
							layer = 100
							icon = 'treev.dmi'
				TreeA175
					Top
						treeb
							layer = 175
							icon = 'tree1.dmi'
						treeH
							layer = 175
							icon = 'treeh.dmi'
						treev
							layer = 175
							icon = 'treev.dmi'

				TreeA250
					Top
						treeb
							layer = 250
							icon = 'tree1.dmi'
						treeH
							layer = 250
							icon = 'treeh.dmi'
						treev
							layer = 250
							icon = 'treev.dmi'
obj
	buildings
		layer = 79
		door1
			icon='door1.dmi'
			icon_state="close"
			density=1
			var/Opacity=0
			var/password=null
			var/Locked=0
			proc/Open()
				layer=78
				flick("opening",src)
				icon_state="open"
				if(Opacity) opacity=0
				density=0
				spawn(30)
					for(var/mob/M in src.loc)
						if(M)
							while(M in src.loc) sleep(1)
					flick("closing",src)
					icon_state="close"
					density=1
					layer=78

					if(Opacity) opacity=1
			Cross()
				if(src.icon_state == "close")
					Open()
				return ..()
		door2
			icon='door2.dmi'
			icon_state="close"
			density=1
			var/Opacity=0
			var/password=null
			var/Locked=0
			proc/Open()
				layer=78
				flick("opening",src)
				icon_state="open"
				if(Opacity) opacity=0
				density=0
				spawn(30)
					layer=78
					flick("closing",src)
					icon_state="close"
					density=1
					layer=78
					if(Opacity) opacity=1
			Cross()
				if(src.icon_state == "close")
					Open()
				return ..()

		door3
			icon='door3.dmi'
			icon_state="close"
			density=1
			var/Opacity=0
			var/password=null
			var/Locked=0
			proc/Open()
				layer=78
				flick("opening",src)
				icon_state="open"
				if(Opacity) opacity=0
				density=0
				spawn(30)
					for(var/mob/M in src.loc)
						if(M)
							while(M in src.loc) sleep(1)
					flick("closing",src)
					icon_state="close"
					density=1
					layer=78

					if(Opacity) opacity=1
			Cross()
				if(src.icon_state == "close")
					Open()
				return ..()
obj
	buildings
		New()
			..()
			sleep(10)
			//world << "[icon] - [icon_state]"
		konohagakure
			KonohagakureBASE
				icon = 'KonohaBUILDING.dmi'
				layer=4
				Big
					icon = 'KonohaBUILDINGB.dmi'
					layer=4
			building2
				icon = 'building2.dmi'
				layer=4
			Bmisc
				icon = 'bmisc.dmi'
				layer=4
				Big
					icon = 'bmisc1.dmi'
					layer=4
			RoundBASE
				icon = 'roundbuilding.dmi'
				layer=4
			Konohagakureextra
				icon = 'smallparts.dmi'
				layer=4
			Konohagakurewall
				icon = 'konohagakurewall.dmi'
				layer=4
				Hort
					icon = 'konohagakurewallh.dmi'
					layer=4
				Vert
					icon = 'konohagakurewallV.dmi'
					layer=4
			Roofs
				Brown
					icon = 'KonohagakureROOFbrownb.dmi'
					layer=80
				Red
					icon = 'KonohagakureROOFredb.dmi'
					layer=80
				Blue
					icon = 'KonohagakureROOFblueb.dmi'
					layer=80
				Green
					icon = 'KonohagakureROOFgreenb.dmi'
					layer=80
				Orange
					icon = 'KonohagakureROOForangeb.dmi'
					layer=80
				Big
					Brown
						icon = 'KonohagakureROOFbrown.dmi'
						layer=80
					Red
						icon = 'KonohagakureROOFred.dmi'
						layer=80
					Blue
						icon = 'KonohagakureROOFblue.dmi'
						layer=80
					Green
						icon = 'KonohagakureROOFgreen.dmi'
						layer=80
					Orange
						icon = 'KonohagakureROOForange.dmi'
						layer=80
			streetlight
				icon = 'streetlights.dmi'
				layer=40
	border
		icon = 'borderthings.dmi'
		layer = 100
turf
	backdrop

		cliff
			cliff
				icon = 'cliff.dmi'
				layer=2
			cliff1
				icon = 'cliff1.dmi'
				layer=2
		ground
			grass
				grass
					icon = 'grass.dmi'
				turf64
					icon = 'turf64.dmi'
				grasssoftedges
					icon = 'grasssoftedges.dmi'
				grassmisc
					icon = 'grassmisc.dmi'
				grassinside
					icon = 'grassinside1.dmi'
				grassm
					icon = 'grassm.dmi'
			cement
				c1
					icon = 'cement.dmi'
					layer = 2
			uwalls
				w1
					icon = 'urbanwalls.dmi'
					layer = 20
			water1
				water
					icon = 'water2.dmi'
					layer = 4
			dirt
				dirtlightsides
					icon = 'dirt.dmi'
				dirtmedsides
					icon = 'dirtm.dmi'
				dirtlpath
					icon = 'dirtpath.dmi'
			misc
				boxes
					icon = 'groundmisc.dmi'
					layer = 25
				sidewalk
					icon = 'sidewalk.dmi'
					layer = 4
				sidewalkcorners
					icon = 'sidecorner.dmi'
					layer = 2
				stairs
					icon = 'stairs.dmi'
				fence
					icon = 'fences.dmi'
					layer = 15
				fence1
					icon = 'fence1.dmi'
					layer = 15
				fence2
					icon = 'fence2.dmi'
					layer = 15
				bridge
					icon = 'bridge.dmi'
			Tree
				TreeA
					Shadow
						treeb
							layer = 19
							icon = 'trees.dmi'
						treeH
							layer = 19
							icon = 'treehbases.dmi'
						treev
							layer = 19
							icon = 'treevbases.dmi'
					Base
						treeb
							layer = 6
							icon = 'CODE/tree.dmi'
						treeH
							layer = 6
							icon = 'treehbase.dmi'
						treev
							layer = 6
							icon = 'treevbase.dmi'
					Top
						treeb
							layer = 20
							icon = 'tree1.dmi'


						treeH
							layer = 20
							icon = 'treeh.dmi'
						treev
							layer = 20
							icon = 'treev.dmi'
				TreeA40
					Top
						treeb
							layer = 40
							icon = 'tree1.dmi'

						treeH
							layer = 40
							icon = 'treeh.dmi'
						treev
							layer = 40
							icon = 'treev.dmi'

obj
	buildings
		door1
			icon = 'door1.dmi'
		door2
			icon = 'door2.dmi'
		door3
			icon = 'door3.dmi'


