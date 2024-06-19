var/daytime="Day"
area/var/Weather="Clear"

#define RENDER_WEATHER 1

var/tmp
	list/temperate_turfs= list()
	list/arid_turfs= list()
	list/tropical_turfs= list()
	list/frozen_turfs= list()

	climates = list("temperate" = null,"arid" = null,"tropical" = null,"frozen" = null)

area/proc/StripWeather()
	overlays-=image('Weather.dmi',icon_state="Raining")
	overlays-=image('Weather.dmi',icon_state="Drizzling")
	overlays-=image('Weather.dmi',icon_state="Pouring")
	overlays-=image('Weather.dmi',icon_state="Storming")
	overlays-=image('Weather.dmi',icon_state="Misty")
	overlays-=image('Weather.dmi',icon_state="Blizzarding")
	overlays-=image('Weather.dmi',icon_state="Snowing")
	overlays-=image('Weather.dmi',icon_state="Sandstorm")

area
	mouse_opacity=0
	Caves
		luminosity=0
	Interior
		layer = 1
		luminosity=1
		NoShunshin
			luminosity=1
		New()
			..()
			layer = 99
	AlwaysLit
	Exterior
		layer				= EFFECTS_LAYER
		appearance_flags	= NO_CLIENT_COLOR
/*		New()
			..()
			switch(Climate)
				if("Temperate")
					for(var/turf/t in contents)
						temperate_turfs += t
				if("Arid")
					for(var/turf/t in contents)
						arid_turfs += t
				if("Tropical")
					for(var/turf/t in contents)
						tropical_turfs += t
				if("Frozen")
					for(var/turf/t in contents)
						frozen_turfs += t
			del src*/
		var/Climate="Temperate"
		SunaDesert
			Climate="Arid"
		KiriOutside
			Climate="Tropical"
		SnowOutside
			Climate="Frozen"


proc/Weather()
	set background=1

	while(1)
		for(var/area/Exterior/A in world)
			A.StripWeather()
			A.Weather="Clear"
		sleep(30000)
		var/list/TWeather=list("Raining"=20,"Drizzling"=30,"Pouring"=15)
		var/TWeatherChosen=pick(TWeather)
		if(prob(TWeather[TWeatherChosen]))
			for(var/area/Exterior/A in world)
				if(A.Climate=="Temperate")
					A.overlays+=image('Weather.dmi',icon_state="[TWeatherChosen]")
					A.Weather=TWeatherChosen
			if(TWeatherChosen=="Pouring"&&prob(15))
				for(var/area/Exterior/A in world)
					if(A.Climate=="Temperate")
						A.overlays+=image('Weather.dmi',icon_state="Storming")
						A.Weather="Storming"
		var/list/DWeather=list("Sandstorm"=10)
		var/DWeatherChosen=pick(DWeather)
		if(prob(DWeather[DWeatherChosen]))
			for(var/area/Exterior/A in world)
				if(A.Climate=="Arid")
					A.overlays+=image('Weather.dmi',icon_state="[DWeatherChosen]")
					A.Weather=DWeatherChosen
		var/list/TRWeather=list("Raining"=20,"Drizzling"=30,"Pouring"=15,"Misty"=25)
		var/TRWeatherChosen=pick(TRWeather)
		if(prob(TRWeather[TRWeatherChosen]))
			for(var/area/Exterior/A in world)
				if(A.Climate=="Tropical")
					A.overlays+=image('Weather.dmi',icon_state="[TRWeatherChosen]")
					A.Weather=TRWeatherChosen
			if(TWeatherChosen=="Pouring"&&prob(50))
				for(var/area/Exterior/A in world)
					if(A.Climate=="Tropical")
						A.overlays+=image('Weather.dmi',icon_state="Storming")
						A.Weather="Storming"
		var/list/FWeather=list("Snowing"=25,"Blizzarding"=10)
		var/FWeatherChosen=pick(FWeather)
		if(prob(FWeather[FWeatherChosen]))
			for(var/area/Exterior/A in world)
				if(A.Climate=="Frozen")
					A.overlays+=image('Weather.dmi',icon_state="[TRWeatherChosen]")
					A.Weather=TRWeatherChosen
		sleep(30000)






/*
proc
	Weather()
		set waitfor = 0
		var/timer = 0
		while(world)
			if(!RENDER_WEATHER) return
			sleep world.tick_lag
			timer++
			if(timer >= rand(10000,20000))
				var/biome = pick(climates)
				if(climates[biome]!=null) climates[biome] = null
				climates[biome] = pick("rain")
			if(temperate_turfs.len && climates["temperate"] != null) weather_start("temperate")
			if(arid_turfs.len && climates["arid"] != null) weather_start("arid")
			if(tropical_turfs.len && climates["tropical"] != null) weather_start("tropical")
			if(frozen_turfs.len && climates["frozen"] != null) weather_start("frozen")


	weather_start(var/biome)
		set waitfor = 0
		var/list/weather_tiles = list()
		var/list/players_outside = list()
		switch(biome)
			if("temperate") weather_tiles = temperate_turfs.Copy()
			if("arid") weather_tiles = arid_turfs.Copy()
			if("tropical") weather_tiles = tropical_turfs.Copy()
			if("frozen") weather_tiles = frozen_turfs.Copy()
		for(var/mob/M)										// an empty for() loop is faster than a while().
			if(climates[biome] == null) return
			if(!M.client) continue
			if(M.loc in weather_tiles)
				players_outside += M
		for(var/mob/M in players_outside)
			if(istype(M.loc,/area/Interior) || istype(M.loc,/area/Caves))
				players_outside -= M
				continue
			var/turf/t	= pick(block(locate(M.x-15,M.y-15,M.z),locate(M.x+15,M.y+15,M.z)))
			t.weather_effect(biome)
			sleep 0.1

turf
	proc
		weather_effect(var/biome)
			var/obj/weather/r 	= new /obj/weather/rain	// I use object pooling instead of calling new.. I suggest you do the same!
			r.loc 				= src
			animate(r,icon_state = "[climates[biome]]", pixel_y = 400, pixel_x = 0, alpha = 155, loop = 1)
			animate(pixel_y	= 5, pixel_x = pick(-10,10), time = 10.8)
			animate(icon_state = "[climates[biome]]land", time = rand(1.2, 4.8))
			spawn(17) del r								// again, I'd recollect the rain for recycling instead of deleting it.


obj/weather
	icon	= 'x16.dmi'
	layer	= EFFECTS_LAYER+11
	rain
		icon_state	= "rain"



mob/Admin2/verb/
	start_weather()
		set category="Admin"
		var/biome = lowertext(input("Which biome?") in list("Temperate","Tropical","Arid","Frozen"))
		var/weather = lowertext(input("Which weather type") in list("Rain"))
		climates[biome] = weather
		weather_start(biome)









*/
















proc/DayCycle()
	var
		time = 10
		light = 7
		d = 1
	while(1)
		sd_OutsideLight(light)
		time=YearSpeed/2
		sleep(time)
		time = YearSpeed/2
		light += d
		if((light < 1) || (light > 7))
			d = -d
			light += d
			time = YearSpeed
		switch(d*light)
			if(-7,7)
				daytime = "Day"
			//	for(var/area/Interior/A in world)
			//		A.sd_SetLuminosity(1)
			if(-6,-5,-4,-3,-2,-1)
				daytime = "Dusk"
			//	for(var/area/Interior/A in world)
			//		A.sd_SetLuminosity(0)
			if(1)
				daytime = "Night"
				Day+=1
				elapsedtime+=1
				SaveTime()
			//	CurrentDay=Days[CurrentDay+1]
			//	for(var/area/Interior/A in world)
			//		A.sd_SetLuminosity(0)
				for(var/mob/M in world)
					if(M.isinjured) M.RecoverInjury()
					if(M.libCD) M.Library_CD()
				UpdateNotableList()
				YearCheck()
			if(2,3,4,5,6)
				daytime = "Dawn"
			//	for(var/area/Interior/A in world)
			//		A.sd_SetLuminosity(1)


	//	sleep((60*600)*1.5)
/*
	switch(d*light)
			if(-4,4)
				daytime = "Day"
			if(-3,-2,-1)
				daytime = "Dusk"
			if(0)
				daytime = "Night"
			if(1,2,3)
				daytime = "Dawn"
				Day+=1*/

/* This is the original payment
mob/proc/Payment()

	var/Paytimes=Month-LogMonth
	if(!Paytimes) return
	while(Paytimes>0)
		var/PaidRyo=0
		Paytimes--
		if(findtext(Class,"Jounin")) PaidRyo=rand(920,1300)
		if(findtext(Class,"Chunin")) PaidRyo=rand(750,920)
		if(findtext(Class,"Genin")) PaidRyo=rand(400,750)
		if(findtext(Class,"Hokage")) PaidRyo=rand(1300,2500)
		if(findtext(Class,"Kazekage")) PaidRyo=rand(1300,2500)
		if(findtext(Class,"Mizukage")) PaidRyo=rand(1300,2500)
		if(!PaidRyo) continue
		src<<"Your check has been sent to you with a sum of $[PaidRyo] Ryo!"
		var/hasryo=0
		for(var/obj/items/Ryo/R in contents)
			hasryo=R
		if(hasryo)
			hasryo:amount+=PaidRyo
			hasryo:Update()
		else
			var/obj/items/Ryo/R=new(src)
			R.amount=PaidRyo
			R.Update()
	LogMonth=Month
mob/var/LogMonth=6

proc/YearCheck(var/msg=1)
	if(Day>=31)
		Day=1
		Month+=1
	for(var/mob/M in world)
		if(!M.client) continue

		var/Paytimes=Month-M.LogMonth
		if(!Paytimes) return
		while(Paytimes>0)
			var/PaidRyo=0
			Paytimes--
			if(findtext(M.Class,"Jounin")) PaidRyo=rand(920,1300)
			if(findtext(M.Class,"Chunin")) PaidRyo=rand(750,920)
			if(findtext(M.Class,"Genin")) PaidRyo=rand(400,750)
			if(findtext(M.Class,"Hokage")) PaidRyo=rand(1300,2500)
			if(findtext(M.Class,"Kazekage")) PaidRyo=rand(1300,2500)
			if(findtext(M.Class,"Mizukage")) PaidRyo=rand(1300,2500)
			if(!PaidRyo) continue
			M<<"Your check has been sent to you with a sum of $[PaidRyo] Ryo!"
			var/hasryo=0
			for(var/obj/items/Ryo/R in M.contents)
				hasryo=R
			if(hasryo)
				hasryo:amount+=PaidRyo
				hasryo:Update()
			else
				var/obj/items/Ryo/R=new(src)
				R.amount=PaidRyo
				R.Update()
		M.LogMonth=Month
	if(Month>12)
		Month=1
		Year+=1
		for(var/mob/P in world)
			if(P.client) P.Aging()
			P.LogMonth=Month
	if(msg) world<<"<font size=-1>Current date is the [Day][Days(Day)] of [Months(Month)] in the year [Year+100]"
//	global.OOC=!global.OOC
//	world<<"<font size=-1>The OOC channel has been [global.OOC ? "enabled" : "disabled"] during this day."
	SaveYear()

	*/
mob
	see_in_dark=3
proc/Days(var/num)
	var/stringnum=num2text(num)
	if(findtext(stringnum,"1")&&length(stringnum)==1) return "st"
	if(findtext(stringnum,"2")&&length(stringnum)==1) return "nd"
	if(findtext(stringnum,"3")&&length(stringnum)==1) return "rd"
	if(findtext(stringnum,"1",2)&&length(stringnum)==2&&stringnum!="11"&&stringnum!="12"&&stringnum!="13") return "st"
	if(findtext(stringnum,"2",2)&&length(stringnum)==2&&stringnum!="11"&&stringnum!="12"&&stringnum!="13") return "nd"
	if(findtext(stringnum,"3",2)&&length(stringnum)==2&&stringnum!="11"&&stringnum!="12"&&stringnum!="13") return "rd"
	return "th"
proc/Months(var/num)
	if(num==1) return "January"
	if(num==2) return "February"
	if(num==3) return "March"
	if(num==4) return "April"
	if(num==5) return "May"
	if(num==6) return "June"
	if(num==7) return "July"
	if(num==8) return "August"
	if(num==9) return "September"
	if(num==10) return "October"
	if(num==11) return "November"
	if(num==12) return "December"
/*proc/Years()

	sleep(YearSpeed/2)
	Day+=0.5
	sleep(YearSpeed/2)
	Day+=0.5
proc/YearCheck
	if(Day==31)
		Day=0
		Month+=1
		if(Month==12)
			Month=0
			Year+=1
			for(var/mob/P in world)
				P.Aging()
	world<<"<center>(Current date is Day:[Day] Month:[Month] Year:[Year])</center>"
	Years()
	SaveYear()
	*/