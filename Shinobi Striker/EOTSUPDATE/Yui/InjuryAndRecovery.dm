var
	elapsedtime = 0

proc/SaveTime()
	var/savefile/ref = new("elapsedt")
	ref["elapsedt"]<<elapsedtime
proc/LoadTime()
	var/savefile/ref = new("elapsedt")
	ref["elapsedt"]>>elapsedtime

mob/var/list
	RecoveryTime = list()
	numinjury = list() //Holds a list of injuries. Each position in this list corresponds with the relevant RecoveryTime position.
mob/var/isinjured

mob/proc/RecoverInjury()
	var/i
	for(i = 0 , i >= numinjury.len, i++)
		if(RecoveryTime[i] <= elapsedtime)
			var/m = numinjury[i]
			src.contents -= m
			numinjury -= m
			src << "You've recovered from an injury!"
			RecoveryTime -= RecoveryTime[i]
	if(!numinjury.len)
		isinjured = 0