mob/verb/Handseals()

	var/list/_possibleSealSpeeds = list()

	if(HasPerk("Blinding Seals"))
		_possibleSealSpeeds.Add("S")

	if(HasPerk("Lightning Seals"))
		_possibleSealSpeeds.Add("A")

	if(HasPerk("Handseal Speed III"))
		_possibleSealSpeeds.Add("B")

	if(HasPerk("Handseal Speed II"))
		_possibleSealSpeeds.Add("C")

	if(HasPerk("Handseal Speed I"))
		_possibleSealSpeeds.Add("D")

	_possibleSealSpeeds.Add("E")

	var/_sealSpeed = input("How fast are you performing handsigns?") in _possibleSealSpeeds + "Cancel"
	if(_sealSpeed == "Cancel")
		return

	var/_seals = input("How many handsigns are you performing?") as num

	if(_seals <= 0)
		return

	if(_seals == 1)
		switch(_sealSpeed)
			if("S")
				_sealSpeed = "<u>unstoppable</u>"
			if("A")
				_sealSpeed = "S"
			if("B")
				_sealSpeed = "A"
			if("C")
				_sealSpeed = "B"
			if("D")
				_sealSpeed = "C"
			if("E")
				_sealSpeed = "D"

	if(_seals in 2 to 3)
		switch(_sealSpeed)
			if("S")
				_sealSpeed = "S+"
			if("A")
				_sealSpeed = "S-"
			if("B")
				_sealSpeed = "A-"
			if("C")
				_sealSpeed = "B-"
			if("D")
				_sealSpeed = "C-"
			if("E")
				_sealSpeed = "D-"


	if(_seals in 4 to 5)
		switch(_sealSpeed)
			if("S")
				_sealSpeed = "S"
			if("A")
				_sealSpeed = "A+"
			if("B")
				_sealSpeed = "B+"
			if("C")
				_sealSpeed = "C+"
			if("D")
				_sealSpeed = "D+"
			if("E")
				_sealSpeed = "E+"

	if(_seals == 6)
		switch(_sealSpeed)
			if("S")
				_sealSpeed = "S"
			if("A")
				_sealSpeed = "A"
			if("B")
				_sealSpeed = "B"
			if("C")
				_sealSpeed = "C"
			if("D")
				_sealSpeed = "D"
			if("E")
				_sealSpeed = "E"

	if(_seals in 7 to 8)
		switch(_sealSpeed)
			if("S")
				_sealSpeed = "S-"
			if("A")
				_sealSpeed = "A-"
			if("B")
				_sealSpeed = "B-"
			if("C")
				_sealSpeed = "C-"
			if("D")
				_sealSpeed = "D-"
			if("E")
				_sealSpeed = "E"

	if(_seals in 9 to 10)
		switch(_sealSpeed)
			if("S")
				_sealSpeed = "A+"
			if("A")
				_sealSpeed = "B+"
			if("B")
				_sealSpeed = "C+"
			if("C")
				_sealSpeed = "D+"
			if("D")
				_sealSpeed = "E+"
			if("E")
				_sealSpeed = "E"

	if(_seals > 10)
		switch(_sealSpeed)
			if("S")
				_sealSpeed = "A"
			if("A")
				_sealSpeed = "B"
			if("B")
				_sealSpeed = "C"
			if("C")
				_sealSpeed = "D"
			if("D")
				_sealSpeed = "E"
			if("E")
				_sealSpeed = "E"


	for(var/mob/M in hearers(20,usr))
		M << output("<i><font size=-3><font color = white>[M.getStrangerName(usr)] has performed [_seals] [_seals > 1 ? "handseals" : "handsign"] at [_sealSpeed] speed!</i>","outputall.output")




proc/letter_to_num(_grade)
	switch(_grade)
		if("E")
			return 1
		if("E+")
			return 2
		if("D-")
			return 3
		if("D")
			return 4
		if("D+")
			return 5
		if("C-")
			return 6
		if("C")
			return 7
		if("C+")
			return 8
		if("B-")
			return 9
		if("B")
			return 10
		if("B+")
			return 11
		if("A-")
			return 12
		if("A")
			return 13
		if("A+")
			return 14
		if("S-")
			return 15
		if("S")
			return 16
		if("S+")
			return 17


proc/num_to_word(_num)
	switch(_num)
		if(0)
			return "no"
		if(1)
			return "one"
		if(2)
			return "two"
		if(3)
			return "three"
		if(4)
			return "four"
		if(5)
			return "five"
		if(6)
			return "six"
		if(7)
			return "seven"
		if(8)
			return "eight"
		if(9)
			return "nine"
		if(10)
			return "ten"
		if(11)
			return "eleven"
		if(12)
			return "twelve"
		if(13)
			return "thirteen"

mob/verb/Defensive_Turns()
	set hidden = 1

	var/_letters[] = list("E","E+","D-","D","D+","C-","C","C+","B-","B","B+","A-","A","A+","S-","S","S+")

	var/_defensiveAgility = input("What is your base defensive agility, meaning without bonuses?") in _letters
	var/_bonus = input("What is your bonus defensive agility?") in list(0,1,2,3,4,5,6)
	var/_defends = input("How many turns have you defended?") in list(0,1,2,3,4,5,6,7,8)

	var/_offensiveAgility = input("What is the offensive agility?") in _letters

	var/_difference = letter_to_num(_defensiveAgility) - letter_to_num(_offensiveAgility)
	var/_result = clamp((4+_bonus) + _difference,0,(4+_bonus))
	_result = max(_result - _defends,0)

	var/_option = input(usr,"Do you want to flash this publicly or privately?") in list("Public","Private")
	if(_option == "Public")
		for(var/mob/M in hearers(20,usr))
			M << output("<i><font size=-3><font color=white>[M.getStrangerName(usr)] has defended [num_to_word(_defends)] [_defends > 1 ? "turns" : "turn"], with [_defensiveAgility] [_bonus > 0 ? "base ":""]defensive agility [_bonus > 0 ? "and [num_to_word(_bonus)] bonus agility " : ""]they can defend <u>[num_to_word(_result)]</u> more [_result == 1 ? "turn" : "turns"] against [_offensiveAgility] offensive agility.","outputall.output")
	else
		usr << output("<i><font size=-3><font color=white>[usr] has defended [num_to_word(_defends)] [_defends > 1 ? "turns" : "turn"], with [_defensiveAgility] [_bonus > 0 ? "base ":""]defensive agility [_bonus > 0 ? "and [num_to_word(_bonus)] bonus agility " : ""]they can defend <u>[num_to_word(_result)]</u> more [_result == 1 ? "turn" : "turns"] against [_offensiveAgility] offensive agility.","outputall.output")


/*
mob/var/turf/selectedTurf

mob/verb/AoE_Marker()
	selectedTurf = null
	var/length, width, list/turfs

	//length = input("What is the length of the jutsu?") as num
	//width = input("What is the width of the jutsu?") as num

	while(!selectedTurf)
		sleep(1)

	var/dx, dy, x1, x2, y1, y2

	x1 = x
	x2 = selectedTurf.x
	y1 = y
	y2 = selectedTurf.y

	dx = x2 - x1
	dy = y2 - y1

	for(var/i in x1 to x2)
		var/_x = i
		var/_y = y1 + dy * (i − x1) / dx

		turfs |= locate(_x,_y,z)


	for(var/turf/t in turfs)
		t.color = "yellow"


turf
	Click()
		..()
		usr.selectedTurf = src


*/