//avainer
//var/worldTravelLimit = 36000 // One Hour

mob/Admin3/verb/changeTravelLimit()
	set category = "Admin"
	worldTravelLimit = input("Input the number of minutes between map changes: ") as num
	worldTravelLimit = worldTravelLimit * 600
	 //60 minutes * 60 seconds * 10


mob/var/crossTime = 0

turf/RoSWarpers/World
	var
		exitx;exity;exitz
	A1
		A1East
			exitx = 2
			exity = 0
			exitz = 12
		A1South
			exitx = 0
			exity = 299
			exitz = 7
	A2
		A2East
			exitx = 2
			exity = 0
			exitz = 5
		A2South
			exitx = 0
			exity = 299
			exitz = 16
		A2West
			exitx = 299
			exity = 0
			exitz = 20
	A3Konoha
		A3West
			exitx = 299
			exity = 0
			exitz = 12
		A3East
			exitx = 2
			exity = 0
			exitz = 2
		A3South
			exitx = 0
			exity = 299
			exitz = 14
	A4
		A4West
			exitx = 299
			exity = 0
			exitz = 5
		A4South
			exitx = 0
			exity = 299
			exitz = 24
	B1
		B1North
			exitx = 0
			exity = 2
			exitz = 20
		B1South
			exitx = 0
			exity = 299
			exitz = 16
		B1East
			exitx = 2
			exity = 0
			exitz = 16
	B2
		B2North
			exitx = 0
			exity = 2
			exitz = 20
		B2East
			exitx = 2
			exity = 0
			exitz = 14
		B2South
			exitx = 0
			exity = 299
			exitz = 15
		B2West
			exitx = 299
			exity = 0
			exitz = 7
	B3
		B3North
			exitx = 0
			exity = 2
			exitz = 5
		B3West
			exitx = 299
			exity = 0
			exitz = 16
		B3South
			exitx = 0
			exity = 299
			exitz = 22
		B3East
			exitx = 2
			exity = 0
			exitz = 24
	B4
		B4North
			exitx = 0
			exity = 2
			exitz = 2
		B4West
			exitx = 299
			exity = 0
			exitz = 14
		B4South
			exitx = 0
			exity = 299
			exitz = 3
	C1Ame
		C1North
			exitx = 0
			exity = 2
			exitz = 7
		C1East
			exitx = 2
			exity = 0
			exitz = 15
		C1South
			exitx = 0
			exity = 299
			exitz = 10
	C2
		C2North
			exitx = 0
			exity = 2
			exitz = 16
		C2East
			exitx = 2
			exity = 0
			exitz = 22
		C2West
			exitx = 299
			exity = 0
			exitz = 18
		C2South
			exitx = 0
			exity = 299
			exitz = 1
	C3
		C3North
			exitx = 0
			exity = 2
			exitz = 14
		C3East
			exitx = 2
			exity = 0
			exitz = 3
		C3West
			exitx = 299
			exity = 0
			exitz = 15
		C3South
			exitx = 0
			exity = 299
			exitz = 9
	C4
		C4North
			exitx = 0
			exity = 2
			exitz = 24
		C4West
			exitx = 299
			exity = 0
			exitz = 22
		C4South
			exitx = 0
			exity = 299
			exitz = 11
	D1
		D1North
			exitx = 0
			exity = 2
			exitz = 18
		D1East
			exitx = 2
			exity = 0
			exitz = 1
	D2
		D2North
			exitx = 0
			exity = 2
			exitz = 15
		D2West
			exitx = 299
			exity = 0
			exitz = 10
		D2East
			exitx = 2
			exity = 0
			exitz = 9
	D3
		D3West
			exitx = 299
			exity = 0
			exitz = 1
		D3North
			exitx = 0
			exity = 2
			exitz = 22
		D3East
			exitx = 2
			exity = 0
			exitz = 11
	D4
		D4West
			exitx = 299
			exity = 0
			exitz = 9
		D4North
			exitx = 0
			exity = 2
			exitz = 3

//299 if right of map, 2 if left. East = 0, West = 0, North = 2, South = 299
 //299 if top of map, 2 if bottom. East = 2, West = 299, North = 0, South = 0




	Entered(mob/M)
		if(istype(M, /mob/))
			if(M.teleporting) return
			if(M.client)
			//(istype(M,/mob/Clone/) || istype(M,/mob/Bunshin/) || istype(M,/mob/RaitonBunshin/) || istype(M,/mob/OboroBunshin/) || istype(M,/mob/KatonBunshin/) || istype(M,/mob/KageBunshin/) || istype(M,/mob/TsuchiBunshin/)))
				var/limit = worldTravelLimit
				for(var/obj/jutsu/perk in M)
					if(perk.name == "Will Perk: Pack Mule")
						limit = worldTravelLimit / 2
						break

				if( (world.realtime - M.crossTime) < limit)

					if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) return
					if(M.MindAfflicted)
						M.MindAfflicted<<output("<font size = -3>You need to wait atleast [limit/(36000)] hour(s) before moving maps again!","outputic.output")
						M.MindAfflicted<<output("<font size = -3>You need to wait atleast [limit/(36000)] hour(s) before moving maps again!","outputall.output")
					else
						M<<output("<font size = -3>You need to wait atleast [limit/(36000)] hour(s) before moving maps again!","outputic.output")
						M<<output("<font size = -3>You need to wait atleast [limit/(36000)] hour(s) before moving maps again!","outputall.output")
					return


				for(var/mob/X in world)
					if(X.name==M.grabbee || X.grabber==usr.name)
						if((world.realtime - X.crossTime) < worldTravelLimit)
							X.crossTime = world.realtime
							X.grabber=null
							M.grabbee=null
							M.attacking=0
							X.pixel_y=0
							X.pixel_x=0


				M.teleporting = 1
				M.density = 0
				var/xx = exitx
				var/yy = exity
				if(exitx == 0) xx = src.x
				if(exity == 0) yy = src.y
				M.Move(locate(xx,yy,exitz))
				M.density = 1
				if(M.chakraOverlay) M.chakraOverlay.loc = M.loc
				M.teleporting = 0
				M.overlays -= 'Swim.dmi'
				M.swim=0
				M.crossTime = world.realtime