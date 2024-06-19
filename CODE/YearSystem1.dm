mob/var/Log_Year=0
var/YearSpeed=10000

mob/var
	update2
	update1
var/Year=900
var/Month=1
var/Day=1

mob/proc/Aging()
	if(!client) return
	if(istext(Age))
		Age=text2num(Age)
	Age+=1
	Log_Year=Year
	LogMonth=Month
	src<<"You're now [lowertext(AgeReturn(Age))] years old"
mob/proc/Age_Update()
	Payment()
	Age+=Year-Log_Year
	Log_Year=Year


proc/LoadYear()
	if(fexists("Saga/Year.sav"))
		var/savefile/F=new("Saga/Year.sav")
		F["Year"]>>Year
		F["Month"]>>Month
		F["Day"]>>Day
		F["YearSpeed"]>>YearSpeed

proc/SaveYear()
	var/savefile/F=new("Saga/Year.sav")
	F["Year"]<<Year
	F["Month"]<<Month
	F["Day"]<<Day
	F["YearSpeed"]<<YearSpeed

mob/Admin5
	verb
		DaySpeed()
			set category="Admin"
			set hidden = 1
			YearSpeed=input("Adjust year speed.","[YearSpeed]")as num
			if(YearSpeed<=1000)
				alert("Fuck you Rich")
				YearSpeed=1000
			if(src.key!="LordMachiavelli") Admin_Logs+="<br>[usr]([usr.key]) adjusted the year speed to [YearSpeed]."
			SaveYear()
			SaveLogs()