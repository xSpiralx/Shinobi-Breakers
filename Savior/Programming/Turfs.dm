turf
	buildings1
		New()
			..()
			sleep(10)
			//world << "[icon] - [icon_state]"

		konohagakure
			CultureBuilding
				blue
					icon = 'culturebuildingblue.dmi'
					layer=4
					Big
						icon = 'culturebuildingblue.dmi'
						layer=4
					Big46
						layer=4
						icon = 'culturebuildingblue.dmi'
				red
					icon = 'culturebuildingred.dmi'
					layer=4
					Big
						icon = 'culturebuildingred.dmi'
						layer=4
					Big46
						layer=4
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
					layer=4
					A
						icon = 'KonohaBUILDING.dmi'
					B
						icon = 'KonohaBUILDINGB.dmi'
				Big47
					layer=4
					A
						icon = 'KonohaBUILDING.dmi'
					B
						icon = 'KonohaBUILDINGB.dmi'
				Big50
					layer=4
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
					layer=4

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
		var/step_x
		var/step_y
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
				bridge
					icon = 'bridge.dmi'
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
							icon = 'tree.dmi'
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

obj
	buildings
		layer = 23
		door1
			icon='door1.dmi'
			icon_state="close"
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
				if(istype(T,/turf/WARPERSKIRI/)) GoesHome=T
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
					layer=25
					flick("closing",src)
					icon_state="close"
					density=1
					layer=25
					if(Opacity) opacity=1

		door2
			icon='door2.dmi'
			icon_state="close"
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
				if(istype(T,/turf/WARPERSKIRI/)) GoesHome=T
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
					layer=25
					flick("closing",src)
					icon_state="close"
					density=1
					layer=25
					if(Opacity) opacity=1
		door3
			icon='door3.dmi'
			icon_state="close"
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
				if(istype(T,/turf/WARPERSKIRI/)) GoesHome=T
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
					layer=25
					flick("closing",src)
					icon_state="close"
					density=1
					layer=25
					if(Opacity) opacity=1


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
				layer=4
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
							icon = 'tree.dmi'
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


