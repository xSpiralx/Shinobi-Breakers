var/KonohaLights=1
var/KonohaHomeLights=1
var/KonohaHospitalLights=1
var/KonohaAcademyLights=1
var/KonohaSpaLights=1
var/KonohaHokageMansion=1
var/KonohaRadio=1
var/KonohaPowerLights=1
var/RadioPower=1
var/PoliceStationPower=1

var/KiriLights=1
var/KiriHomeLights=1
var/KiriHospitalLights=1
var/KiriAcademyLights=1
var/KiriSpaLights=1
var/MizukageMansion=1
var/KiriRadio=1
var/KiriPowerLights=1
var/KiriRadioPower=1
var/KiriPoliceStationPower=1
area/var/Area
area/var/Powered=1
obj/Lightpoint/var/Village="Konohagakure"
atom/Topic(href,href_list[])
	switch(href_list["action"])
	//	world<<"1.22312"
	//<a href=?src=\ref[M];action=Reward;mob=[ControlledMob.ckey]>Reward</a>
//	<a href=?src=\ref[M];action=ToggleBreaker;mob=[src.key]>Reward</a>
		if("ToggleBreakerOffOut")
			//var/obj/Infrastructure/Power/Control_Panel/N = href_list["panel"]
			var/obj/Infrastructure/Power/Control_Panel/N
			for(var/obj/Infrastructure/Power/Control_Panel/S in world)
				if(S.ID==href_list["panel"]) N=S
			if(!N) return
			if(get_dist(src,N)>1) return
			if(src:RecentVerbCheck("Power", 300,1)) return
			src:recentverbs["Power"] = world.realtime
			if(N.Village=="Konohagakure")
				for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just toggled Konoha's outside lights off.</i>"
				for(var/obj/Lightpoint/L in world)
					if(L.z!=1) continue
					animate(L,transform=L.off_matrix,time=5)
				for(var/turf/Speakers/S in world) if(S.z==1) S.Power=0
				for(var/obj/Technology/Camera/S in world) if(S.z==1)  S.Power=0
				for(var/obj/Technology/Camera_Monitor/S in world) if(S.z==1)  S.Power=0
				KonohaLights=0
				N.displayHTML(src)
				return
			if(N.Village=="Kirigakure")
				for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just toggled Kirigakure's outside lights off.</i>"
				for(var/obj/Lightpoint/L in world)
					if(L.z!=3) continue
					animate(L,transform=L.off_matrix,time=5)
				for(var/turf/Speakers/S in world) if(S.z==3) S.Power=0
				for(var/obj/Technology/Camera/S in world) if(S.z==3)  S.Power=0
				for(var/obj/Technology/Camera_Monitor/S in world) if(S.z==3)  S.Power=0
				KiriLights=0
				N.displayHTML(src)
				return
		if("ToggleBreakerOnOut")
			//var/obj/Infrastructure/Power/Control_Panel/N = href_list["panel"]
			var/obj/Infrastructure/Power/Control_Panel/N
			for(var/obj/Infrastructure/Power/Control_Panel/S in world)
				if(S.ID==href_list["panel"]) N=S
			if(!N) return
			if(get_dist(src,N)>1) return
			if(src:RecentVerbCheck("Power", 300,1)) return
			src:recentverbs["Power"] = world.realtime
			if(N.Village=="Konohagakure")
				for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just toggled Konoha's outside lights on.</i>"
				for(var/obj/Lightpoint/L in world)
					if(L.z!=1) continue
					animate(L,transform=L.on_matrix,time=5)
				for(var/turf/Speakers/S in world) if(S.z==1) S.Power=1
				for(var/obj/Technology/Camera/S in world) if(S.z==1)  S.Power=1
				for(var/obj/Technology/Camera_Monitor/S in world) if(S.z==1)  S.Power=1
				KonohaLights=1
				N.displayHTML(src)
				return
			if(N.Village=="Kirigakure")
				for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just toggled Kirigakure's outside lights on.</i>"
				for(var/obj/Lightpoint/L in world)
					if(L.z!=3) continue
					animate(L,transform=L.off_matrix,time=5)
				for(var/turf/Speakers/S in world) if(S.z==3) S.Power=1
				for(var/obj/Technology/Camera/S in world) if(S.z==3)  S.Power=1
				for(var/obj/Technology/Camera_Monitor/S in world) if(S.z==3)  S.Power=1
				KiriLights=1
				N.displayHTML(src)
				return
		if("ToggleBreakerHomesOff")
			var/obj/Infrastructure/Power/Control_Panel/N
			for(var/obj/Infrastructure/Power/Control_Panel/S in world)
				if(S.ID==href_list["panel"]) N=S
			if(!N) return
			if(get_dist(src,N)>1) return
			if(src:RecentVerbCheck("Power", 300,1)) return
			if(N.Village=="Konohagakure")
				for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just toggled Konoha's homes lights off.</i>"
				src:recentverbs["Power"] = world.realtime
				for(var/area/I in world)
					if(I.Area!="Homes") continue
					for(var/turf/Speakers/S in I) S.Power=0
					for(var/obj/Lightpoint/L in I) animate(L,transform=L.off_matrix,time=5)
					for(var/obj/Technology/Camera/S in I) S.Power=0
					for(var/obj/Technology/Camera_Monitor/S in I) S.Power=0
					I.Powered=0
					I.luminosity=0
				KonohaHomeLights=0
				N.displayHTML(src)
				return
			if(N.Village=="Kirigakure")
				for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just toggled Kirigakure's homes lights off.</i>"
				src:recentverbs["Power"] = world.realtime
				for(var/area/I in world)
					if(I.Area!="Homes Kiri") continue
					for(var/turf/Speakers/S in I) S.Power=0
					for(var/obj/Lightpoint/L in I) animate(L,transform=L.off_matrix,time=5)
					for(var/obj/Technology/Camera/S in I) S.Power=0
					for(var/obj/Technology/Camera_Monitor/S in I) S.Power=0
					I.Powered=0
					I.luminosity=0
				KiriHomeLights=0
				N.displayHTML(src)
				return
		if("ToggleBreakerHomesOn")
			var/obj/Infrastructure/Power/Control_Panel/N
			for(var/obj/Infrastructure/Power/Control_Panel/S in world)
				if(S.ID==href_list["panel"]) N=S
			if(!N) return
			if(get_dist(src,N)>1) return
			if(src:RecentVerbCheck("Power", 300,1)) return
			if(N.Village=="Konohagakure")
				for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just toggled Konoha's home lights on.</i>"
				src:recentverbs["Power"] = world.realtime
				for(var/area/I in world)
					if(I.Area!="Homes") continue
					I.luminosity=1
					for(var/turf/Speakers/S in I) S.Power=1
					for(var/obj/Lightpoint/L in I) animate(L,transform=L.on_matrix,time=5)
					for(var/obj/Technology/Camera/S in I) S.Power=1
					for(var/obj/Technology/Camera_Monitor/S in I) S.Power=1
					I.Powered=1
				KonohaHomeLights=1
				N.displayHTML(src)
				return
			if(N.Village=="Kirigakure")
				for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just toggled Kirigakure's home lights on.</i>"
				src:recentverbs["Power"] = world.realtime
				for(var/area/I in world)
					if(I.Area!="Homes Kiri") continue
					I.luminosity=1
					for(var/turf/Speakers/S in I) S.Power=1
					for(var/obj/Lightpoint/L in I) animate(L,transform=L.on_matrix,time=5)
					for(var/obj/Technology/Camera/S in I) S.Power=1
					for(var/obj/Technology/Camera_Monitor/S in I) S.Power=1
					I.Powered=1
				KiriHomeLights=1
				N.displayHTML(src)
				return
		if("ToggleSpaLightsOn")
			var/obj/Infrastructure/Power/Control_Panel/N
			for(var/obj/Infrastructure/Power/Control_Panel/S in world)
				if(S.ID==href_list["panel"]) N=S
			if(!N) return
			if(get_dist(src,N)>1) return
			if(src:RecentVerbCheck("Power", 300,1)) return
			if(N.Village=="Konohagakure")
				for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just toggled Konoha's spa lights on.</i>"
				src:recentverbs["Power"] = world.realtime
				for(var/area/I in world)
					if(I.Area!="Spa") continue
					I.luminosity=1
					for(var/turf/Speakers/S in I) S.Power=1
					for(var/obj/Lightpoint/L in I) animate(L,transform=L.on_matrix,time=5)
					for(var/obj/Technology/Camera/S in I) S.Power=1
					for(var/obj/Technology/Camera_Monitor/S in I) S.Power=1
					I.Powered=1
				KonohaSpaLights=1
				N.displayHTML(src)
				return
			if(N.Village=="Kirigakure")
				for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just toggled Kirigakure's spa lights on.</i>"
				src:recentverbs["Power"] = world.realtime
				for(var/area/I in world)
					if(I.Area!="Spa Kiri") continue
					I.luminosity=1
					for(var/turf/Speakers/S in I) S.Power=1
					for(var/obj/Lightpoint/L in I) animate(L,transform=L.on_matrix,time=5)
					for(var/obj/Technology/Camera/S in I) S.Power=1
					for(var/obj/Technology/Camera_Monitor/S in I) S.Power=1
					I.Powered=1
				KiriSpaLights=1
				N.displayHTML(src)
				return
		if("ToggleSpaLightsOff")
			var/obj/Infrastructure/Power/Control_Panel/N
			for(var/obj/Infrastructure/Power/Control_Panel/S in world)
				if(S.ID==href_list["panel"]) N=S
			if(!N) return
			if(get_dist(src,N)>1) return
			if(src:RecentVerbCheck("Power", 300,1)) return
			if(N.Village=="Konohagakure")
				for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just toggled Konoha's spa lights off.</i>"
				src:recentverbs["Power"] = world.realtime
				for(var/area/I in world)
					if(I.Area!="Spa") continue
					I.luminosity=0
					for(var/turf/Speakers/S in I) S.Power=0
					for(var/obj/Lightpoint/L in I) animate(L,transform=L.off_matrix,time=5)
					for(var/obj/Technology/Camera/S in I) S.Power=0
					for(var/obj/Technology/Camera_Monitor/S in I) S.Power=0
					I.Powered=0
				KonohaSpaLights=0
				N.displayHTML(src)
				return
			if(N.Village=="Kirigakure")
				for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just toggled Kirigakure's spa lights off.</i>"
				src:recentverbs["Power"] = world.realtime
				for(var/area/I in world)
					if(I.Area!="Spa Kiri") continue
					I.luminosity=0
					for(var/turf/Speakers/S in I) S.Power=0
					for(var/obj/Lightpoint/L in I) animate(L,transform=L.off_matrix,time=5)
					for(var/obj/Technology/Camera/S in I) S.Power=0
					for(var/obj/Technology/Camera_Monitor/S in I) S.Power=0
					I.Powered=0
				KiriSpaLights=0
				N.displayHTML(src)
				return
		if("ToggleAcademyLightsOn")
			var/obj/Infrastructure/Power/Control_Panel/N
			for(var/obj/Infrastructure/Power/Control_Panel/S in world)
				if(S.ID==href_list["panel"]) N=S
			if(!N) return
			if(get_dist(src,N)>1) return
			if(src:RecentVerbCheck("Power", 300,1)) return
			if(N.Village=="Konohagakure")
				for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just toggled Konoha's academy lights on.</i>"
				src:recentverbs["Power"] = world.realtime
				for(var/area/I in world)
					if(I.Area!="Academy") continue
					I.luminosity=1
					for(var/turf/Speakers/S in I) S.Power=1
					for(var/obj/Lightpoint/L in I) animate(L,transform=L.on_matrix,time=5)
					for(var/obj/Technology/Camera/S in I) S.Power=1
					for(var/obj/Technology/Camera_Monitor/S in I) S.Power=1
					I.Powered=1
				KonohaAcademyLights=1
				N.displayHTML(src)
				return
			if(N.Village=="Kirigakure")
				for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just toggled Kirigakure's academy lights on.</i>"
				src:recentverbs["Power"] = world.realtime
				for(var/area/I in world)
					if(I.Area!="Academy Kiri") continue
					I.luminosity=1
					for(var/turf/Speakers/S in I) S.Power=1
					for(var/obj/Lightpoint/L in I) animate(L,transform=L.on_matrix,time=5)
					for(var/obj/Technology/Camera/S in I) S.Power=1
					for(var/obj/Technology/Camera_Monitor/S in I) S.Power=1
					I.Powered=1
				KiriAcademyLights=1
				N.displayHTML(src)
				return
		if("ToggleAcademyLightsOff")
			var/obj/Infrastructure/Power/Control_Panel/N
			for(var/obj/Infrastructure/Power/Control_Panel/S in world)
				if(S.ID==href_list["panel"]) N=S
			if(!N) return
			if(get_dist(src,N)>1) return
			if(src:RecentVerbCheck("Power", 300,1)) return
			if(N.Village=="Konohagakure")
				for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just toggled Konoha's academy lights off.</i>"
				src:recentverbs["Power"] = world.realtime
				for(var/area/I in world)
					if(I.Area!="Academy") continue
					I.luminosity=0

					for(var/turf/Speakers/S in I) S.Power=0
					for(var/obj/Lightpoint/L in I) animate(L,transform=L.off_matrix,time=5)
					for(var/obj/Technology/Camera/S in I) S.Power=0
					for(var/obj/Technology/Camera_Monitor/S in I) S.Power=0
					I.Powered=0
				KonohaAcademyLights=0
				N.displayHTML(src)
				return
			if(N.Village=="Kirigakure")
				for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just toggled Kirigakure's academy lights off.</i>"
				src:recentverbs["Power"] = world.realtime
				for(var/area/I in world)
					if(I.Area!="Academy Kiri") continue
					I.luminosity=0

					for(var/turf/Speakers/S in I) S.Power=0
					for(var/obj/Lightpoint/L in I) animate(L,transform=L.off_matrix,time=5)
					for(var/obj/Technology/Camera/S in I) S.Power=0
					for(var/obj/Technology/Camera_Monitor/S in I) S.Power=0
					I.Powered=0
				KiriAcademyLights=0
				N.displayHTML(src)
				return
		if("ToggleHospitalLightsOn")
			var/obj/Infrastructure/Power/Control_Panel/N
			for(var/obj/Infrastructure/Power/Control_Panel/S in world)
				if(S.ID==href_list["panel"]) N=S
			if(!N) return
			if(get_dist(src,N)>1) return
			if(src:RecentVerbCheck("Power", 300,1)) return
			if(N.Village=="Konohagakure")
				for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just toggled Konoha's hospital lights on.</i>"
				src:recentverbs["Power"] = world.realtime
				for(var/area/I in world)
					if(I.Area!="Hospital") continue
					I.luminosity=1
					for(var/turf/Speakers/S in I) S.Power=1
					for(var/obj/Lightpoint/L in I) animate(L,transform=L.on_matrix,time=5)
					for(var/obj/Technology/Camera/S in I) S.Power=1
					for(var/obj/Technology/Camera_Monitor/S in I) S.Power=1
					I.Powered=1
				KonohaHospitalLights=1
				N.displayHTML(src)
				return
			if(N.Village=="Kirigakure")
				for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just toggled Kirigakure's hospital lights on.</i>"
				src:recentverbs["Power"] = world.realtime
				for(var/area/I in world)
					if(I.Area!="Hospital Kiri") continue
					I.luminosity=1
					for(var/turf/Speakers/S in I) S.Power=1
					for(var/obj/Lightpoint/L in I) animate(L,transform=L.on_matrix,time=5)
					for(var/obj/Technology/Camera/S in I) S.Power=1
					for(var/obj/Technology/Camera_Monitor/S in I) S.Power=1
					I.Powered=1
				KiriHospitalLights=1
				N.displayHTML(src)
				return
		if("ToggleHospitalLightsOff")
			var/obj/Infrastructure/Power/Control_Panel/N
			for(var/obj/Infrastructure/Power/Control_Panel/S in world)
				if(S.ID==href_list["panel"]) N=S
			if(!N) return
			if(get_dist(src,N)>1) return
			if(src:RecentVerbCheck("Power", 300,1)) return
			if(N.Village=="Konohagakure")
				for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just toggled Konoha's hospital lights off.</i>"
				src:recentverbs["Power"] = world.realtime
				for(var/area/I in world)
					if(I.Area!="Hospital") continue
					I.luminosity=0
					for(var/turf/Speakers/S in I) S.Power=0
					for(var/obj/Lightpoint/L in I) animate(L,transform=L.off_matrix,time=5)
					for(var/obj/Technology/Camera/S in I) S.Power=0
					for(var/obj/Technology/Camera_Monitor/S in I) S.Power=0
					I.Powered=0
				KonohaHospitalLights=0
				N.displayHTML(src)
				return
			if(N.Village=="Kirigakure")
				for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just toggled Kirigakure's hospital lights off.</i>"
				src:recentverbs["Power"] = world.realtime
				for(var/area/I in world)
					if(I.Area!="Hospital Kiri") continue
					I.luminosity=0
					for(var/turf/Speakers/S in I) S.Power=0
					for(var/obj/Lightpoint/L in I) animate(L,transform=L.off_matrix,time=5)
					for(var/obj/Technology/Camera/S in I) S.Power=0
					for(var/obj/Technology/Camera_Monitor/S in I) S.Power=0
					I.Powered=0
				KiriHospitalLights=0
				N.displayHTML(src)
				return
		if("ToggleHokageMansionOn")
			var/obj/Infrastructure/Power/Control_Panel/N
			for(var/obj/Infrastructure/Power/Control_Panel/S in world)
				if(S.ID==href_list["panel"]) N=S
			if(!N) return
			if(get_dist(src,N)>1) return
			if(src:RecentVerbCheck("Power", 300,1)) return
			if(N.Village=="Konohagakure")
				for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just toggled Konoha's mansion lights on.</i>"
				src:recentverbs["Power"] = world.realtime
				for(var/area/I in world)
					if(I.Area!="Hokage Mansion") continue
					I.luminosity=1
					for(var/turf/Speakers/S in I) S.Power=1
					for(var/obj/Lightpoint/L in I) animate(L,transform=L.on_matrix,time=5)
					for(var/obj/Technology/Camera/S in I) S.Power=1
					for(var/obj/Technology/Camera_Monitor/S in I) S.Power=1
					I.Powered=1
				KonohaHokageMansion=1
				N.displayHTML(src)
				return
			if(N.Village=="Kirigakure")
				for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just toggled Kirigakure's mansion lights on.</i>"
				src:recentverbs["Power"] = world.realtime
				for(var/area/I in world)
					if(I.Area!="Mizukage Mansion") continue
					I.luminosity=1
					for(var/turf/Speakers/S in I) S.Power=1
					for(var/obj/Lightpoint/L in I) animate(L,transform=L.on_matrix,time=5)
					for(var/obj/Technology/Camera/S in I) S.Power=1
					for(var/obj/Technology/Camera_Monitor/S in I) S.Power=1
					I.Powered=1
				MizukageMansion=1
				N.displayHTML(src)
				return
		if("ToggleHokageMansionOff")
			var/obj/Infrastructure/Power/Control_Panel/N
			for(var/obj/Infrastructure/Power/Control_Panel/S in world)
				if(S.ID==href_list["panel"]) N=S
			if(!N) return
			if(get_dist(src,N)>1) return
			if(src:RecentVerbCheck("Power", 300,1)) return
			if(N.Village=="Konohagakure")
				for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just toggled Konoha's mansion lights off.</i>"
				src:recentverbs["Power"] = world.realtime
				for(var/area/I in world)
					if(I.Area!="Hokage Mansion") continue
					I.luminosity=0
					for(var/turf/Speakers/S in I) S.Power=0
					for(var/obj/Lightpoint/L in I) animate(L,transform=L.off_matrix,time=5)
					for(var/obj/Technology/Camera/S in I) S.Power=0
					for(var/obj/Technology/Camera_Monitor/S in I) S.Power=0
					I.Powered=0
				KonohaHokageMansion=0
				N.displayHTML(src)
				return
			if(N.Village=="Kirigakure")
				for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just toggled Kirigakure's mansion lights off.</i>"
				src:recentverbs["Power"] = world.realtime
				for(var/area/I in world)
					if(I.Area!="Mizukage Mansion") continue
					I.luminosity=0
					for(var/turf/Speakers/S in I) S.Power=0
					for(var/obj/Lightpoint/L in I) animate(L,transform=L.off_matrix,time=5)
					for(var/obj/Technology/Camera/S in I) S.Power=0
					for(var/obj/Technology/Camera_Monitor/S in I) S.Power=0
					I.Powered=0
				MizukageMansion=0
				N.displayHTML(src)
				return
		if("TogglePowerStationOn")
			var/obj/Infrastructure/Power/Control_Panel/N
			for(var/obj/Infrastructure/Power/Control_Panel/S in world)
				if(S.ID==href_list["panel"]) N=S
			if(!N) return
			if(get_dist(src,N)>1) return
			if(src:RecentVerbCheck("Power", 300,1)) return
			if(N.Village=="Konohagakure")
				for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just toggled Konoha's Power Station lights on.</i>"
				src:recentverbs["Power"] = world.realtime
				for(var/area/I in world)
					if(I.Area!="Power Station") continue
					I.luminosity=1
					for(var/turf/Speakers/S in I) S.Power=1
					for(var/obj/Lightpoint/L in I) animate(L,transform=L.on_matrix,time=5)
					for(var/obj/Technology/Camera/S in I) S.Power=1
					for(var/obj/Technology/Camera_Monitor/S in I) S.Power=1
					I.Powered=1
				KonohaPowerLights=1
				N.displayHTML(src)
				return

			if(N.Village=="Kirigakure")
				for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just toggled Kirigakure's Power Station lights on.</i>"
				src:recentverbs["Power"] = world.realtime
				for(var/area/I in world)
					if(I.Area!="Power Station Kiri") continue
					I.luminosity=1
					for(var/turf/Speakers/S in I) S.Power=1
					for(var/obj/Lightpoint/L in I) animate(L,transform=L.on_matrix,time=5)
					for(var/obj/Technology/Camera/S in I) S.Power=1
					for(var/obj/Technology/Camera_Monitor/S in I) S.Power=1
					I.Powered=1
				KiriPowerLights=1
				N.displayHTML(src)
				return
		if("TogglePowerStationOff")
			var/obj/Infrastructure/Power/Control_Panel/N
			for(var/obj/Infrastructure/Power/Control_Panel/S in world)
				if(S.ID==href_list["panel"]) N=S
			if(!N) return
			if(get_dist(src,N)>1) return
			if(src:RecentVerbCheck("Power", 300,1)) return
			if(N.Village=="Konohagakure")
				for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just toggled Konoha's Power Station lights off.</i>"
				src:recentverbs["Power"] = world.realtime
				for(var/area/I in world)
					if(I.Area!="Power Station") continue
					I.luminosity=0
					for(var/turf/Speakers/S in I) S.Power=0
					for(var/obj/Lightpoint/L in I) animate(L,transform=L.off_matrix,time=5)
					for(var/obj/Technology/Camera/S in I) S.Power=0
					for(var/obj/Technology/Camera_Monitor/S in I) S.Power=0
					I.Powered=0
				KonohaPowerLights=0
				N.displayHTML(src)
				return

			if(N.Village=="Kirigakure")
				for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just toggled Kirigakure's Power Station lights off.</i>"
				src:recentverbs["Power"] = world.realtime
				for(var/area/I in world)
					if(I.Area!="Power Station Kiri") continue
					I.luminosity=0
					for(var/turf/Speakers/S in I) S.Power=0
					for(var/obj/Lightpoint/L in I) animate(L,transform=L.off_matrix,time=5)
					for(var/obj/Technology/Camera/S in I) S.Power=0
					for(var/obj/Technology/Camera_Monitor/S in I) S.Power=0
					I.Powered=0
				KiriPowerLights=0
				N.displayHTML(src)
				return
		if("ToggleRadioTowerOn")
			var/obj/Infrastructure/Power/Control_Panel/N
			for(var/obj/Infrastructure/Power/Control_Panel/S in world)
				if(S.ID==href_list["panel"]) N=S
			if(!N) return
			if(get_dist(src,N)>1) return
			if(src:RecentVerbCheck("Power", 300,1)) return
			if(N.Village=="Konohagakure")
				for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just toggled Konoha's Radio Tower lights on.</i>"
				src:recentverbs["Power"] = world.realtime
				for(var/area/I in world)
					if(I.Area!="Radio Tower") continue
					I.luminosity=1
					for(var/turf/Speakers/S in I) S.Power=1
					for(var/obj/Lightpoint/L in I) animate(L,transform=L.on_matrix,time=5)
					for(var/obj/Technology/Camera/S in I) S.Power=1
					for(var/obj/Technology/Camera_Monitor/S in I) S.Power=1
					I.Powered=1
				RadioPower=1
				N.displayHTML(src)
				return
			if(N.Village=="Kirigakure")
				for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just toggled Kirigakure's Radio Tower lights on.</i>"
				src:recentverbs["Power"] = world.realtime
				for(var/area/I in world)
					if(I.Area!="Radio Tower Kiri") continue
					I.luminosity=1
					for(var/turf/Speakers/S in I) S.Power=1
					for(var/obj/Lightpoint/L in I) animate(L,transform=L.on_matrix,time=5)
					for(var/obj/Technology/Camera/S in I) S.Power=1
					for(var/obj/Technology/Camera_Monitor/S in I) S.Power=1
					I.Powered=1
				KiriRadioPower=1
				N.displayHTML(src)
				return
		if("ToggleRadioTowerOff")
			var/obj/Infrastructure/Power/Control_Panel/N
			for(var/obj/Infrastructure/Power/Control_Panel/S in world)
				if(S.ID==href_list["panel"]) N=S
			if(!N) return
			if(get_dist(src,N)>1) return
			if(src:RecentVerbCheck("Power", 300,1)) return
			if(N.Village=="Konohagakure")
				src:recentverbs["Power"] = world.realtime
				for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just toggled Konoha's Radio Tower lights off.</i>"
				for(var/area/I in world)
					if(I.Area!="Radio Tower") continue
					I.luminosity=0
					for(var/turf/Speakers/S in I) S.Power=0
					for(var/obj/Lightpoint/L in I) animate(L,transform=L.off_matrix,time=5)
					for(var/obj/Technology/Camera/S in I) S.Power=0
					for(var/obj/Technology/Camera_Monitor/S in I) S.Power=0
					I.Powered=0
				RadioPower=0
				N.displayHTML(src)
				return
			if(N.Village=="Kirigakure")
				src:recentverbs["Power"] = world.realtime
				for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just toggled Kirigakure's Radio Tower lights off.</i>"
				for(var/area/I in world)
					if(I.Area!="Radio Tower Kiri") continue
					I.luminosity=0
					for(var/turf/Speakers/S in I) S.Power=0
					for(var/obj/Lightpoint/L in I) animate(L,transform=L.off_matrix,time=5)
					for(var/obj/Technology/Camera/S in I) S.Power=0
					for(var/obj/Technology/Camera_Monitor/S in I) S.Power=0
					I.Powered=0
				KiriRadioPower=0
				N.displayHTML(src)
				return
		if("TogglePoliceStationOn")
			var/obj/Infrastructure/Power/Control_Panel/N
			for(var/obj/Infrastructure/Power/Control_Panel/S in world)
				if(S.ID==href_list["panel"]) N=S
			if(!N) return
			if(get_dist(src,N)>1) return
			if(src:RecentVerbCheck("Power", 300,1)) return
			if(N.Village=="Konohagakure")
				for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just toggled Konoha's Police Station lights on.</i>"
				src:recentverbs["Power"] = world.realtime
				for(var/area/I in world)
					if(I.Area!="Police Station") continue
					I.luminosity=1
					for(var/turf/Speakers/S in I) S.Power=1
					for(var/obj/Lightpoint/L in I) animate(L,transform=L.on_matrix,time=5)
					for(var/obj/Technology/Camera/S in I) S.Power=1
					for(var/obj/Technology/Camera_Monitor/S in I) S.Power=1
					I.Powered=1
				PoliceStationPower=1
				N.displayHTML(src)
				return
			if(N.Village=="Kirigakure")
				for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just toggled Kirigakure's Police Station lights on.</i>"
				src:recentverbs["Power"] = world.realtime
				for(var/area/I in world)
					if(I.Area!="Police Station Kiri") continue
					I.luminosity=1
					for(var/turf/Speakers/S in I) S.Power=1
					for(var/obj/Lightpoint/L in I) animate(L,transform=L.on_matrix,time=5)
					for(var/obj/Technology/Camera/S in I) S.Power=1
					for(var/obj/Technology/Camera_Monitor/S in I) S.Power=1
					I.Powered=1
				KiriPoliceStationPower=1
				N.displayHTML(src)
				return
		if("TogglePoliceStationOff")
			var/obj/Infrastructure/Power/Control_Panel/N
			for(var/obj/Infrastructure/Power/Control_Panel/S in world)
				if(S.ID==href_list["panel"]) N=S
			if(!N) return
			if(get_dist(src,N)>1) return
			if(src:RecentVerbCheck("Power", 300,1)) return
			if(N.Village=="Konohagakure")
				src:recentverbs["Power"] = world.realtime
				for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just toggled Konoha's Police Station lights off.</i>"
				for(var/area/I in world)
					if(I.Area!="Police Station") continue
					I.luminosity=0
					for(var/turf/Speakers/S in I) S.Power=0
					for(var/obj/Lightpoint/L in I) animate(L,transform=L.off_matrix,time=5)
					for(var/obj/Technology/Camera/S in I) S.Power=0
					for(var/obj/Technology/Camera_Monitor/S in I) S.Power=0
					I.Powered=0
				PoliceStationPower=0
				N.displayHTML(src)
			if(N.Village=="Kirigakure")
				src:recentverbs["Power"] = world.realtime
				for(var/mob/XX in world) if(XX.Admin) XX << "<i>[usr.Oname]([usr.key]) just toggled Kirigakure's Police Station lights off.</i>"
				for(var/area/I in world)
					if(I.Area!="Police Station Kiri") continue
					I.luminosity=0
					for(var/turf/Speakers/S in I) S.Power=0
					for(var/obj/Lightpoint/L in I) animate(L,transform=L.off_matrix,time=5)
					for(var/obj/Technology/Camera/S in I) S.Power=0
					for(var/obj/Technology/Camera_Monitor/S in I) S.Power=0
					I.Powered=0
				KiriPoliceStationPower=0
				N.displayHTML(src)
	.=..()


obj/Infrastructure
	var/Village="Konohagakure"
	Radio
		Wall
			icon='Security Panel.dmi'
			icon_state="wall"
		See_All_Control_Panel
			icon='Security Panel.dmi'
			Click()
				if(get_dist(src,usr)>1) return
				if(Village=="Konohagakure")
					if(!RadioPower)
						usr<<output("The power is off to this panel!","outputic.output")
						usr<<output("The power is off to this panel!","outputall.output")
						return
					for(var/mob/M in hearers(14,usr))
						M<<output("<font color = white><font color=[usr.SayFont]>[M.getStrangerName(usr)] flicks on the communications log.<font color = white>","outputic.output")
						M<<output("<font color = white><font color=[usr.SayFont]>[M.getStrangerName(usr)] flicks on the communications log.<font color = white>","outputall.output")
					while(get_dist(src,usr)==1)
						winset(usr,"Radio","is-visible=true")
						sleep(5)
					winset(usr,"Radio","is-visible=false")
				if(Village=="Kirigakure")
					if(!KiriRadioPower)
						usr<<output("The power is off to this panel!","outputic.output")
						usr<<output("The power is off to this panel!","outputall.output")
						return
					for(var/mob/M in hearers(14,usr))
						M<<output("<font color = white><font color=[usr.SayFont]>[M.getStrangerName(usr)] flicks on the communications log.<font color = white>","outputic.output")
						M<<output("<font color = white><font color=[usr.SayFont]>[M.getStrangerName(usr)] flicks on the communications log.<font color = white>","outputall.output")
					while(get_dist(src,usr)==1)
						winset(usr,"Radio","is-visible=true")
						sleep(5)
					winset(usr,"Radio","is-visible=false")
		Control_Panel
			icon='Security Panel.dmi'
			Click()
				if(get_dist(src,usr)>1) return
				if(Village=="Konohagakure")
					if(!RadioPower)
						usr<<output("The power is off to this panel!","outputic.output")
						usr<<output("The power is off to this panel!","outputall.output")
						return
					if(usr.RecentVerbCheck("Radio", 300,1)) return
					var/i=usr.CustomInput("This lever controls the power to Konoha's radio tower. Switch it:","Control Lever",list("[KonohaRadio ? "Off": "On"]","Cancel"))
					if(!i) return
					switch(i:name)
						if("Cancel") return
						if("On")
							usr.recentverbs["Radio"] = world.realtime
							for(var/mob/M in hearers(14,usr))
								M<<output("<font color = white><font color=[usr.SayFont]>[M.getStrangerName(usr)] pulls the lever up.<font color = white>","outputic.output")
								M<<output("<font color = white><font color=[usr.SayFont]>[M.getStrangerName(usr)] pulls the lever up.<font color = white>","outputall.output")
							KonohaRadio=1
							return
						if("Off")
							usr.recentverbs["Radio"] = world.realtime
							for(var/mob/M in hearers(14,usr))
								M<<output("<font color = white><font color=[usr.SayFont]>[M.getStrangerName(usr)] pulls the lever down.<font color = white>","outputic.output")
								M<<output("<font color = white><font color=[usr.SayFont]>[M.getStrangerName(usr)] pulls the lever down.<font color = white>","outputall.output")
							KonohaRadio=0
							return
				if(Village=="Kirigakure")
					if(!KiriRadioPower)
						usr<<output("The power is off to this panel!","outputic.output")
						usr<<output("The power is off to this panel!","outputall.output")
						return
					if(usr.RecentVerbCheck("Radio", 300,1)) return
					var/i=usr.CustomInput("This lever controls the power to Kirigakure's radio tower. Switch it:","Control Lever",list("[KiriRadio ? "Off": "On"]","Cancel"))
					if(!i) return
					switch(i:name)
						if("Cancel") return
						if("On")
							usr.recentverbs["Radio"] = world.realtime
							for(var/mob/M in hearers(14,usr))
								M<<output("<font color = white><font color=[usr.SayFont]>[M.getStrangerName(usr)] pulls the lever up.<font color = white>","outputic.output")
								M<<output("<font color = white><font color=[usr.SayFont]>[M.getStrangerName(usr)] pulls the lever up.<font color = white>","outputall.output")
							KiriRadio=1
							return
						if("Off")
							usr.recentverbs["Radio"] = world.realtime
							for(var/mob/M in hearers(14,usr))
								M<<output("<font color = white><font color=[usr.SayFont]>[M.getStrangerName(usr)] pulls the lever down.<font color = white>","outputic.output")
								M<<output("<font color = white><font color=[usr.SayFont]>[M.getStrangerName(usr)] pulls the lever down.<font color = white>","outputall.output")
							KiriRadio=0
							return

	Power
		Wall
			icon='Security Panel.dmi'
			icon_state="wall"
		Fake_Control_Panel
			icon='Security Panel.dmi'
			Click()
				if(get_dist(src,usr)>1) return
				var/HTML={"
<style>
body{
background: black;
}
table, td, th{
spacing: 0;
border: 1px solid white;
border-collapse: collapse;
color: white;
font-size: 15 px;
}
td,th{
padding:10px;
}
</style>
<center>This console contains a lot of diagnostic information about the station's power systems.</center>
</body>
</html>"}
				usr<<browse(HTML,"window=Panel;size=300x500")
		Control_Panel
			icon='Security Panel.dmi'
			var/ID
			New()
				..()
				ID="[rand(1,10)][rand(1,190)][rand(1,10)][rand(1,100)][rand(1,100)][rand(1,100)][rand(1,10)][rand(1,160)][rand(1,10)][rand(1,10)]"
			Click()
				if(get_dist(src,usr)>1) return
				var/list/applicableLights=list()
				for(var/obj/Lightpoint/L in world)
					if(L.Village==src.Village) applicableLights+=L
				displayHTML(usr)
			proc/displayHTML(mob/M)
				var/HTML
				if(Village=="Konohagakure")
					HTML={"
<style>
body{
background: black;
}
table, td, th{
spacing: 0;
border: 1px solid white;
border-collapse: collapse;
color: white;
font-size: 15 px;
}
td,th{
padding:10px;
}
</style>
<table>
<tr>
<th>Breaker</th>
<th>Status</th>
</tr>
<tr>
<td>Outdoor Lights</td>
<td>[KonohaLights ? "<a href=?src=\ref[M];action=ToggleBreakerOffOut;panel=[src.ID]>Online</a>" : "<a href=?src=\ref[M];action=ToggleBreakerOnOut;panel=[src.ID]>Offline</a>"]</td>
</tr>
<tr>
<td>Homes</td>
<td>[KonohaHomeLights ? "<a href=?src=\ref[M];action=ToggleBreakerHomesOff;panel=[src.ID]>Online</a>" : "<a href=?src=\ref[M];action=ToggleBreakerHomesOn;panel=[src.ID]>Offline</a>"]</td>
</tr>
<tr>
<td>Academy</td>
<td>[KonohaAcademyLights ? "<a href=?src=\ref[M];action=ToggleAcademyLightsOff;panel=[src.ID]>Online</a>" : "<a href=?src=\ref[M];action=ToggleAcademyLightsOn;panel=[src.ID]>Offline</a>"]</td>
</tr>
<tr>
<td>Hokage Mansion</td>
<td>[KonohaHokageMansion ? "<a href=?src=\ref[M];action=ToggleHokageMansionOff;panel=[src.ID]>Online</a>" : "<a href=?src=\ref[M];action=ToggleHokageMansionOn;panel=[src.ID]>Offline</a>"]</td>
</tr>
<tr>
<td>Spa</td>
<td>[KonohaSpaLights ? "<a href=?src=\ref[M];action=ToggleSpaLightsOff;panel=[src.ID]>Online</a>" : "<a href=?src=\ref[M];action=ToggleSpaLightsOn;panel=[src.ID]>Offline</a>"]</td>
</tr>
<tr>
<td>Hospital</td>
<td>[KonohaHospitalLights ? "<a href=?src=\ref[M];action=ToggleHospitalLightsOff;panel=[src.ID]>Online</a>" : "<a href=?src=\ref[M];action=ToggleHospitalLightsOn;panel=[src.ID]>Offline</a>"]</td>
</tr>
<tr>
<td>Power Station</td>
<td>[KonohaPowerLights ? "<a href=?src=\ref[M];action=TogglePowerStationOff;panel=[src.ID]>Online</a>" : "<a href=?src=\ref[M];action=TogglePowerStationOn;panel=[src.ID]>Offline</a>"]</td>
</tr>
<tr>
<td>Radio Tower</td>
<td>[RadioPower ? "<a href=?src=\ref[M];action=ToggleRadioTowerOff;panel=[src.ID]>Online</a>" : "<a href=?src=\ref[M];action=ToggleRadioTowerOn;panel=[src.ID]>Offline</a>"]</td>
</tr>
<tr>
<td>Police Station</td>
<td>[PoliceStationPower ? "<a href=?src=\ref[M];action=TogglePoliceStationOff;panel=[src.ID]>Online</a>" : "<a href=?src=\ref[M];action=TogglePoliceStationOn;panel=[src.ID]>Offline</a>"]</td>
</tr>
</table>
</body>
</html>"}





				if(Village=="Kirigakure")
					HTML={"
<style>
body{
background: black;
}
table, td, th{
spacing: 0;
border: 1px solid white;
border-collapse: collapse;
color: white;
font-size: 15 px;
}
td,th{
padding:10px;
}
</style>
<table>
<tr>
<th>Breaker</th>
<th>Status</th>
</tr>
<tr>
<td>Outdoor Lights</td>
<td>[KiriLights ? "<a href=?src=\ref[M];action=ToggleBreakerOffOut;panel=[src.ID]>Online</a>" : "<a href=?src=\ref[M];action=ToggleBreakerOnOut;panel=[src.ID]>Offline</a>"]</td>
</tr>
<tr>
<td>Homes</td>
<td>[KiriHomeLights ? "<a href=?src=\ref[M];action=ToggleBreakerHomesOff;panel=[src.ID]>Online</a>" : "<a href=?src=\ref[M];action=ToggleBreakerHomesOn;panel=[src.ID]>Offline</a>"]</td>
</tr>
<tr>
<td>Academy</td>
<td>[KiriAcademyLights ? "<a href=?src=\ref[M];action=ToggleAcademyLightsOff;panel=[src.ID]>Online</a>" : "<a href=?src=\ref[M];action=ToggleAcademyLightsOn;panel=[src.ID]>Offline</a>"]</td>
</tr>
<tr>
<td>Mizukage Mansion</td>
<td>[MizukageMansion ? "<a href=?src=\ref[M];action=ToggleHokageMansionOff;panel=[src.ID]>Online</a>" : "<a href=?src=\ref[M];action=ToggleHokageMansionOn;panel=[src.ID]>Offline</a>"]</td>
</tr>
<tr>
<td>Spa</td>
<td>[KiriSpaLights ? "<a href=?src=\ref[M];action=ToggleSpaLightsOff;panel=[src.ID]>Online</a>" : "<a href=?src=\ref[M];action=ToggleSpaLightsOn;panel=[src.ID]>Offline</a>"]</td>
</tr>
<tr>
<td>Hospital</td>
<td>[KiriHospitalLights ? "<a href=?src=\ref[M];action=ToggleHospitalLightsOff;panel=[src.ID]>Online</a>" : "<a href=?src=\ref[M];action=ToggleHospitalLightsOn;panel=[src.ID]>Offline</a>"]</td>
</tr>
<tr>
<td>Power Station</td>
<td>[KiriPowerLights ? "<a href=?src=\ref[M];action=TogglePowerStationOff;panel=[src.ID]>Online</a>" : "<a href=?src=\ref[M];action=TogglePowerStationOn;panel=[src.ID]>Offline</a>"]</td>
</tr>
<tr>
<td>Radio Tower</td>
<td>[KiriRadioPower ? "<a href=?src=\ref[M];action=ToggleRadioTowerOff;panel=[src.ID]>Online</a>" : "<a href=?src=\ref[M];action=ToggleRadioTowerOn;panel=[src.ID]>Offline</a>"]</td>
</tr>
<tr>
<td>Police Station</td>
<td>[KiriPoliceStationPower ? "<a href=?src=\ref[M];action=TogglePoliceStationOff;panel=[src.ID]>Online</a>" : "<a href=?src=\ref[M];action=TogglePoliceStationOn;panel=[src.ID]>Offline</a>"]</td>
</tr>
</table>
</body>
</html>"}
				M<<browse(HTML,"window=Panel;size=300x500")