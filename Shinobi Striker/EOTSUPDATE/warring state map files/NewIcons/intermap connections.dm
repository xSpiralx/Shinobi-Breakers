//avainer
var/worldTravelLimit = 0 // One Hour

mob/Admin5/verb/changeTravelLimit()
	set category = "Admin"
	worldTravelLimit = input("Input the number of minutes between map changes: ") as num
	worldTravelLimit = worldTravelLimit * 60
	 //60 minutes * 60 seconds * 10


//mob/var/crossTime = 0



turf/OriginZConnectors
	var
		exitx;exity;exitz
	zOneEast
		exitx = 1
		exity = 0
		exitz = 9

	zOneNorth
		exitx = 0
		exity = 1
		exitz = 5

	zTwoEast
		exitx = 1
		exity = 0
		exitz = 3

	zTwoWest
		exitx = 199
		exity = 0
		exitz = 1

	zTwoNorth
		exitx = 0
		exity = 1
		exitz = 6

	zThreeEast
		exitx = 1
		exity = 0
		exitz = 10

	zThreeWest
		exitx = 199
		exity = 0
		exitz = 2

	zThreeNorth
		exitx = 0
		exity = 1
		exitz = 7

	zFourWest
		exitx = 199
		exity = 0
		exitz = 3

	zFourNorth
		exitx = 0
		exity = 1
		exitz = 8

	zFiveEast
		exitx = 1
		exity = 0
		exitz = 6

	zFiveNorth
		exitx = 0
		exity = 1
		exitz = 9

	zFiveSouth
		exitx = 0
		exity = 199
		exitz = 1

	zSixEast
		exitx = 1
		exity = 0
		exitz = 7

	zSixNorth
		exitx = 0
		exity = 1
		exitz = 10

	zSixSouth
		exitx = 0
		exity = 199
		exitz = 2

	zSixWest
		exitx = 199
		exity = 0
		exitz = 5

	zSevenEast
		exitx = 1
		exity = 0
		exitz = 8

	zSevenNorth
		exitx = 0
		exity = 1
		exitz = 11

	zSevenSouth
		exitx = 0
		exity = 199
		exitz = 3

	zSevenWest
		exitx = 199
		exity = 0
		exitz = 6

	zEightNorth
		exitx = 0
		exity = 1
		exitz = 12

	zEightSouth
		exitx = 0
		exity = 199
		exitz = 4

	zEightWest
		exitx = 199
		exity = 0
		exitz = 7

	zNineEast
		exitx = 1
		exity = 0
		exitz = 10

	zNineNorth
		exitx = 0
		exity = 1
		exitz = 13

	zNineSouth
		exitx = 0
		exity = 199
		exitz = 5

	zTenEast
		exitx = 1
		exity = 0
		exitz = 11

	zTenNorth
		exitx = 0
		exity = 1
		exitz = 14

	zTenSouth
		exitx = 0
		exity = 199
		exitz = 6

	zTenWest
		exitx = 199
		exity = 0
		exitz = 9

	zElevenEast
		exitx = 1
		exity = 0
		exitz = 12

	zElevenNorth
		exitx = 0
		exity = 1
		exitz = 15

	zElevenSouth
		exitx = 0
		exity = 199
		exitz = 7

	zElevenWest
		exitx = 199
		exity = 0
		exitz = 10

	zTwelveNorth
		exitx = 0
		exity = 1
		exitz = 16

	zTwelveSouth
		exitx = 0
		exity = 199
		exitz = 8

	zTwelveWest
		exitx = 199
		exity = 0
		exitz = 11

	zThirteenNorth
		exitx = 0
		exity = 1
		exitz = 17

	zThirteenSouth
		exitx = 0
		exity = 199
		exitz = 9

	zThirteenEast
		exitx = 1
		exity = 0
		exitz = 14

	zFourteenEast
		exitx = 1
		exity = 0
		exitz = 15

	zFourteenNorth
		exitx = 0
		exity = 1
		exitz = 18

	zFourteenSouth
		exitx = 0
		exity = 199
		exitz = 10

	zFourteenWest
		exitx = 199
		exity = 0
		exitz = 13

	zFifteenEast
		exitx = 1
		exity = 0
		exitz = 16

	zFifteenNorth
		exitx = 0
		exity = 1
		exitz = 19

	zFifteenSouth
		exitx = 0
		exity = 199
		exitz = 11

	zFifteenWest
		exitx = 199
		exity = 0
		exitz = 14

	zSixteenNorth
		exitx = 0
		exity = 1
		exitz = 20

	zSixteenSouth
		exitx = 0
		exity = 199
		exitz = 12

	zSixteenWest
		exitx = 199
		exity = 0
		exitz = 15

	zSeventeenEast
		exitx = 1
		exity = 0
		exitz = 18

	zSeventeenSouth
		exitx = 0
		exity = 199
		exitz = 13

	zEighteenEast
		exitx = 1
		exity = 0
		exitz = 19

	zEighteenSouth
		exitx = 0
		exity = 199
		exitz = 14

	zEighteenWest
		exitx = 199
		exity = 0
		exitz = 17

	zNineteenEast
		exitx = 1
		exity = 0
		exitz = 20

	zNineteenSouth
		exitx = 0
		exity = 199
		exitz = 15

	zNineteenWest
		exitx = 199
		exity = 0
		exitz = 18

	zTwentySouth
		exitx = 0
		exity = 199
		exitz = 16

	zTwentyWest
		exitx = 199
		exity = 0
		exitz = 19

	zFixIronTempleWest
		exitx = 1
		exity = 0
		exitz = 17

	Entered(mob/M)
		if(istype(M, /mob/))
			if(M.teleporting) return
			if(M.client)
			//(istype(M,/mob/Clone/) || istype(M,/mob/Bunshin/) || istype(M,/mob/RaitonBunshin/) || istype(M,/mob/OboroBunshin/) || istype(M,/mob/KatonBunshin/) || istype(M,/mob/KageBunshin/) || istype(M,/mob/TsuchiBunshin/)))
				var/limit = worldTravelLimit
				for(var/obj/jutsu/perk in M)
					if(perk.name == "Courier")
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

turf/warringStateWarper
	var
		exitx;exity;exitz
	zOneSouth
		exitx = 0
		exity = 299
		exitz = 15

	zOneEast
		exitx = 2
		exity = 0
		exitz = 3

	zOneWest
		exitx = 299
		exity = 0
		exitz = 24

	zOneNorth
		exitx = 0
		exity = 2
		exitz = 13

	zThreeSouth
		exitx = 0
		exity = 299
		exitz = 22

	zThreeWest
		exitx = 299
		exity= 0
		exitz= 1

	zThreeEast
		exitx = 2
		exity= 0
		exitz= 18
	zThreeNorth
		exitx = 0
		exity = 2
		exitz= 5
	zFiveSouth
		exitx = 0
		exity = 299
		exitz = 3
	zFiveWest
		exitx = 299
		exity = 0
		exitz = 13

	zSevenSouth
		exitx = 0
		exity = 299
		exitz= 13

	zNineEast
		exitx = 2
		exity = 0
		exitz = 24

	zNineNorth
		exitx = 0
		exity = 2
		exitz= 28

	zElevenSouth
		exitx = 0
		exity = 299
		exitz = 24

	zElevenEast
		exitx = 2
		exity = 0
		exitz = 13


	z13South
		exitx = 0
		exity = 299
		exitz = 1

	z13East
		exitx = 2
		exity = 0
		exitz = 5

	z13West
		exitx = 299
		exity = 0
		exitz = 11

	z13North
		exitx = 0
		exity = 2
		exitz = 7

	z15South
		exitx = 0
		exity = 299
		exitz = 17

	z15East
		exitx = 2
		exity = 0
		exitz = 22

	z15West
		exitx = 299
		exity = 0
		exitz = 20

	z15North
		exitx = 2
		exity = 0
		exitz = 1

	z17North
		exitx=0
		exity=2
		exitz=15

	z18West
		exitx = 299
		exity=0
		exitz=3

	z20North
		exitx= 0
		exity= 2
		exitz= 24
	z20East
		exitx = 2
		exity= 0
		exitz= 15


	z22West
		exitx = 299
		exity= 0
		exitz=15

	z22North
		exitx=0
		exity=2
		exitz=3
	z24South
		exitx = 0
		exity = 299
		exitz = 20

	z24East
		exitx = 2
		exity = 0
		exitz = 1

	z24West
		exitx = 299
		exity = 0
		exitz = 9

	z24North
		exitx = 0
		exity = 2
		exitz = 11

	z28South
		exitx = 0
		exity = 299
		exitz = 9




	Entered(mob/M)
		if(istype(M, /mob/))
			if(M.teleporting) return
			if(M.client)
			//(istype(M,/mob/Clone/) || istype(M,/mob/Bunshin/) || istype(M,/mob/RaitonBunshin/) || istype(M,/mob/OboroBunshin/) || istype(M,/mob/KatonBunshin/) || istype(M,/mob/KageBunshin/) || istype(M,/mob/TsuchiBunshin/)))
				var/limit = worldTravelLimit
				for(var/obj/jutsu/perk in M)
					if(perk.name == "Courier")
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
