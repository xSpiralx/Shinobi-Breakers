//Z 1
turf/TeleporterOneNorth
	Entered(mob/M)
		if(istype(M, /mob/))
			if(M.teleporting) return
			if(M.client || (istype(M,/mob/Clone/) || istype(M,/mob/Bunshin/) || istype(M,/mob/RaitonBunshin/) || istype(M,/mob/OboroBunshin/) || istype(M,/mob/KatonBunshin/) || istype(M,/mob/KageBunshin/) || istype(M,/mob/TsuchiBunshin/)))
				if(M.LastTravelTime > (world.realtime-7200))

					if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) return
					if(M.MindAfflicted)
						M.MindAfflicted<<output("<font size = -3>You need to wait atleast 12 minutes before moving maps again!","outputic.output")
						M.MindAfflicted<<output("<font size = -3>You need to wait atleast 12 minutes before moving maps again!","outputall.output")
					else
						M<<output("<font size = -3>You need to wait atleast 12 minutes before moving maps again!","outputic.output")
						M<<output("<font size = -3>You need to wait atleast 12 minutes before moving maps again!","outputall.output")
					return
				for(var/mob/X in world)
					if(X.name==M.grabbee || X.grabber==usr.name)
						for(var/mob/Y in hearers())


						X.grabber=null
						M.grabbee=null
						M.attacking=0
						X.pixel_y=0
						X.pixel_x=0
				M.teleporting = 1
				M.density = 0
				M.Move(locate(M.x,2,4))
				M.density = 1
				if(M.chakraOverlay) M.chakraOverlay.loc = M.loc
				M.teleporting = 0
				M.overlays -= 'Swim.dmi'
				M.swim=0
				M.LastTravelTime = world.realtime
turf/TeleporterOneEast
	Entered(mob/M)
		if(istype(M, /mob/))
			if(M.teleporting) return
			if(M.client || (istype(M,/mob/Clone/) || istype(M,/mob/Bunshin/) || istype(M,/mob/RaitonBunshin/) || istype(M,/mob/OboroBunshin/) || istype(M,/mob/KatonBunshin/) || istype(M,/mob/KageBunshin/) || istype(M,/mob/TsuchiBunshin/)))
				if(M.LastTravelTime > (world.realtime-7200))

					if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) return
					if(M.MindAfflicted)
						M.MindAfflicted<<output("<font size = -3>You need to wait atleast 12 minutes before moving maps again!","outputic.output")
						M.MindAfflicted<<output("<font size = -3>You need to wait atleast 12 minutes before moving maps again!","outputall.output")
					else
						M<<output("<font size = -3>You need to wait atleast 12 minutes before moving maps again!","outputic.output")
						M<<output("<font size = -3>You need to wait atleast 12 minutes before moving maps again!","outputall.output")
					return
				for(var/mob/X in world)
					if(X.name==M.grabbee || X.grabber==usr.name)
						for(var/mob/Y in hearers())


						X.grabber=null
						M.grabbee=null
						M.attacking=0
						X.pixel_y=0
						X.pixel_x=0
				M.teleporting = 1
				M.density = 0
				M.Move(locate(2,M.y,2))
				M.density = 1
				if(M.chakraOverlay) M.chakraOverlay.loc = M.loc
				M.teleporting = 0
				M.overlays -= 'Swim.dmi'
				M.swim=0
				M.LastTravelTime = world.realtime
//Z 2
turf/TeleporterTwoEast
	Entered(mob/M)
		if(istype(M, /mob/))
			if(M.teleporting) return
			if(M.client || (istype(M,/mob/Clone/) || istype(M,/mob/Bunshin/) || istype(M,/mob/RaitonBunshin/) || istype(M,/mob/OboroBunshin/) || istype(M,/mob/KatonBunshin/) || istype(M,/mob/KageBunshin/) || istype(M,/mob/TsuchiBunshin/)))
				if(M.LastTravelTime > (world.realtime-7200))

					if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) return
					if(M.MindAfflicted)
						M.MindAfflicted<<output("<font size = -3>You need to wait atleast 12 minutes before moving maps again!","outputic.output")
						M.MindAfflicted<<output("<font size = -3>You need to wait atleast 12 minutes before moving maps again!","outputall.output")
					else
						M<<output("<font size = -3>You need to wait atleast 12 minutes before moving maps again!","outputic.output")
						M<<output("<font size = -3>You need to wait atleast 12 minutes before moving maps again!","outputall.output")
					return
				for(var/mob/X in world)
					if(X.name==M.grabbee || X.grabber==usr.name)
						for(var/mob/Y in hearers())


						X.grabber=null
						M.grabbee=null
						M.attacking=0
						X.pixel_y=0
						X.pixel_x=0
				M.teleporting = 1
				M.density = 0
				M.Move(locate(2,M.y,3))
				M.density = 1
				if(M.chakraOverlay) M.chakraOverlay.loc = M.loc
				M.teleporting = 0
				M.overlays -= 'Swim.dmi'
				M.swim=0
				M.LastTravelTime = world.realtime
turf/TeleporterTwoNorth
	Entered(mob/M)
		if(istype(M, /mob/))
			if(M.teleporting) return
			if(M.client || (istype(M,/mob/Clone/) || istype(M,/mob/Bunshin/) || istype(M,/mob/RaitonBunshin/) || istype(M,/mob/OboroBunshin/) || istype(M,/mob/KatonBunshin/) || istype(M,/mob/KageBunshin/) || istype(M,/mob/TsuchiBunshin/)))
				if(M.LastTravelTime > (world.realtime-7200))

					if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) return
					if(M.MindAfflicted)
						M.MindAfflicted<<output("<font size = -3>You need to wait atleast 12 minutes before moving maps again!","outputic.output")
						M.MindAfflicted<<output("<font size = -3>You need to wait atleast 12 minutes before moving maps again!","outputall.output")
					else
						M<<output("<font size = -3>You need to wait atleast 12 minutes before moving maps again!","outputic.output")
						M<<output("<font size = -3>You need to wait atleast 12 minutes before moving maps again!","outputall.output")
					return
				for(var/mob/X in world)
					if(X.name==M.grabbee || X.grabber==usr.name)
						for(var/mob/Y in hearers())


						X.grabber=null
						M.grabbee=null
						M.attacking=0
						X.pixel_y=0
						X.pixel_x=0
				M.teleporting = 1
				M.density = 0
				M.Move(locate(M.x,2,5))
				M.density = 1
				if(M.chakraOverlay) M.chakraOverlay.loc = M.loc
				M.teleporting = 0
				M.overlays -= 'Swim.dmi'
				M.swim=0
				M.LastTravelTime = world.realtime
turf/TeleporterTwoWest
	Entered(mob/M)
		if(istype(M, /mob/))
			if(M.teleporting) return
			if(M.client || (istype(M,/mob/Clone/) || istype(M,/mob/Bunshin/) || istype(M,/mob/RaitonBunshin/) || istype(M,/mob/OboroBunshin/) || istype(M,/mob/KatonBunshin/) || istype(M,/mob/KageBunshin/) || istype(M,/mob/TsuchiBunshin/)))
				if(M.LastTravelTime > (world.realtime-7200))

					if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) return
					if(M.MindAfflicted)
						M.MindAfflicted<<output("<font size = -3>You need to wait atleast 12 minutes before moving maps again!","outputic.output")
						M.MindAfflicted<<output("<font size = -3>You need to wait atleast 12 minutes before moving maps again!","outputall.output")
					else
						M<<output("<font size = -3>You need to wait atleast 12 minutes before moving maps again!","outputic.output")
						M<<output("<font size = -3>You need to wait atleast 12 minutes before moving maps again!","outputall.output")
					return
				for(var/mob/X in world)
					if(X.name==M.grabbee || X.grabber==usr.name)
						for(var/mob/Y in hearers())


						X.grabber=null
						M.grabbee=null
						M.attacking=0
						X.pixel_y=0
						X.pixel_x=0
				M.teleporting = 1
				M.density = 0
				M.Move(locate(2,M.y,1))
				M.density = 1
				if(M.chakraOverlay) M.chakraOverlay.loc = M.loc
				M.teleporting = 0
				M.overlays -= 'Swim.dmi'
				M.swim=0
				M.LastTravelTime = world.realtime
//Issac lined up maps perfect. Each North or South is +/- 3 (1, 4, 7, 10), east East or West is +1 or -1
turf/ZoneWarp/North
	Entered(mob/M)
		if(istype(M, /mob/))
			if(M.teleporting) return
			if(M.client || (istype(M,/mob/Clone/) || istype(M,/mob/Bunshin/) || istype(M,/mob/RaitonBunshin/) || istype(M,/mob/OboroBunshin/) || istype(M,/mob/KatonBunshin/) || istype(M,/mob/KageBunshin/) || istype(M,/mob/TsuchiBunshin/)))
				if(M.LastTravelTime > (world.realtime-7200))

					if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) return
					if(M.MindAfflicted)
						M.MindAfflicted<<output("<font size = -3>You need to wait atleast 12 minutes before moving maps again!","outputic.output")
						M.MindAfflicted<<output("<font size = -3>You need to wait atleast 12 minutes before moving maps again!","outputall.output")
					else
						M<<output("<font size = -3>You need to wait atleast 12 minutes before moving maps again!","outputic.output")
						M<<output("<font size = -3>You need to wait atleast 12 minutes before moving maps again!","outputall.output")
					return
				for(var/mob/X in world)
					if(X.name==M.grabbee || X.grabber==usr.name)
						for(var/mob/Y in hearers())


						X.grabber=null
						M.grabbee=null
						M.attacking=0
						X.pixel_y=0
						X.pixel_x=0
				M.teleporting = 1
				M.density = 0
				M.Move(locate(M.x,2,M.z+3))
				M.density = 1
				if(M.chakraOverlay) M.chakraOverlay.loc = M.loc
				M.teleporting = 0
				M.overlays -= 'Swim.dmi'
				M.swim=0
				M.LastTravelTime = world.realtime
turf/ZoneWarp/South
	Entered(mob/M)
		if(istype(M, /mob/))
			if(M.teleporting) return
			if(M.client || (istype(M,/mob/Clone/) || istype(M,/mob/Bunshin/) || istype(M,/mob/RaitonBunshin/) || istype(M,/mob/OboroBunshin/) || istype(M,/mob/KatonBunshin/) || istype(M,/mob/KageBunshin/) || istype(M,/mob/TsuchiBunshin/)))
				if(M.LastTravelTime > (world.realtime-7200))

					if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) return
					if(M.MindAfflicted)
						M.MindAfflicted<<output("<font size = -3>You need to wait atleast 12 minutes before moving maps again!","outputic.output")
						M.MindAfflicted<<output("<font size = -3>You need to wait atleast 12 minutes before moving maps again!","outputall.output")
					else
						M<<output("<font size = -3>You need to wait atleast 12 minutes before moving maps again!","outputic.output")
						M<<output("<font size = -3>You need to wait atleast 12 minutes before moving maps again!","outputall.output")
					return
				for(var/mob/X in world)
					if(X.name==M.grabbee || X.grabber==usr.name)
						for(var/mob/Y in hearers())


						X.grabber=null
						M.grabbee=null
						M.attacking=0
						X.pixel_y=0
						X.pixel_x=0
				M.teleporting = 1
				M.density = 0
				M.Move(locate(M.x,299,M.z-3))
				M.density = 1
				if(M.chakraOverlay) M.chakraOverlay.loc = M.loc
				M.teleporting = 0
				M.overlays -= 'Swim.dmi'
				M.swim=0
				M.LastTravelTime = world.realtime
turf/ZoneWarp/East
	Entered(mob/M)
		if(istype(M, /mob/))
			if(M.teleporting) return
			if(M.client || (istype(M,/mob/Clone/) || istype(M,/mob/Bunshin/) || istype(M,/mob/RaitonBunshin/) || istype(M,/mob/OboroBunshin/) || istype(M,/mob/KatonBunshin/) || istype(M,/mob/KageBunshin/) || istype(M,/mob/TsuchiBunshin/)))
				if(M.LastTravelTime > (world.realtime-7200))

					if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) return
					if(M.MindAfflicted)
						M.MindAfflicted<<output("<font size = -3>You need to wait atleast 12 minutes before moving maps again!","outputic.output")
						M.MindAfflicted<<output("<font size = -3>You need to wait atleast 12 minutes before moving maps again!","outputall.output")
					else
						M<<output("<font size = -3>You need to wait atleast 12 minutes before moving maps again!","outputic.output")
						M<<output("<font size = -3>You need to wait atleast 12 minutes before moving maps again!","outputall.output")
					return
				for(var/mob/X in world)
					if(X.name==M.grabbee || X.grabber==usr.name)
						for(var/mob/Y in hearers())


						X.grabber=null
						M.grabbee=null
						M.attacking=0
						X.pixel_y=0
						X.pixel_x=0
				M.teleporting = 1
				M.density = 0
				M.Move(locate(2,M.y,M.z+1))
				M.density = 1
				if(M.chakraOverlay) M.chakraOverlay.loc = M.loc
				M.teleporting = 0
				M.overlays -= 'Swim.dmi'
				M.swim=0
				M.LastTravelTime = world.realtime
turf/ZoneWarp/West
	Entered(mob/M)
		if(istype(M, /mob/))
			if(M.teleporting) return
			if(M.client || (istype(M,/mob/Clone/) || istype(M,/mob/Bunshin/) || istype(M,/mob/RaitonBunshin/) || istype(M,/mob/OboroBunshin/) || istype(M,/mob/KatonBunshin/) || istype(M,/mob/KageBunshin/) || istype(M,/mob/TsuchiBunshin/)))
				if(M.LastTravelTime > (world.realtime-7200))

					if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) return
					if(M.MindAfflicted)
						M.MindAfflicted<<output("<font size = -3>You need to wait atleast 12 minutes before moving maps again!","outputic.output")
						M.MindAfflicted<<output("<font size = -3>You need to wait atleast 12 minutes before moving maps again!","outputall.output")
					else
						M<<output("<font size = -3>You need to wait atleast 12 minutes before moving maps again!","outputic.output")
						M<<output("<font size = -3>You need to wait atleast 12 minutes before moving maps again!","outputall.output")
					return
				for(var/mob/X in world)
					if(X.name==M.grabbee || X.grabber==usr.name)
						for(var/mob/Y in hearers())


						X.grabber=null
						M.grabbee=null
						M.attacking=0
						X.pixel_y=0
						X.pixel_x=0
				M.teleporting = 1
				M.density = 0
				M.Move(locate(299,M.y,M.z-1))
				M.density = 1
				if(M.chakraOverlay) M.chakraOverlay.loc = M.loc
				M.teleporting = 0
				M.overlays -= 'Swim.dmi'
				M.swim=0
				M.LastTravelTime = world.realtime