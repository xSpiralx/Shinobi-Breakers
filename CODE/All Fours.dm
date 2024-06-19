obj/Taijutsu
	var/skill=1
	proc/Update()
		set background=1
		suffix="[Skills(skill)] Mastery"
	New()
		..()
		spawn() Update()
obj/Kenjutsu
	var/skill=1
	proc/Update()
		suffix="[Skills(skill)] Mastery"
	New()
		..()
		spawn() Update()
obj/Doujutsu
	var/skill=1
	proc/Update()
		suffix="[Skills(skill)] Mastery"
	New()
		..()
		spawn() Update()
obj/Fuuinjutsu
	var/skill=1
	proc/Update()
		suffix="[Skills(skill)] Mastery"
	New()
		..()
		spawn() Update()
obj/Senjutsu
	var/skill=1
	proc/Update()
		suffix="[Skills(skill)] Mastery"
	New()
		..()
		spawn() Update()
obj/Genjutsu
	var/skill=1
	proc/Update()
		suffix="[Skills(skill)] Mastery"
	New()
		..()
		spawn() Update()
obj/Ninjutsu
	var/skill=1
	proc/Update()
		suffix="[Skills(skill)] Mastery"
		var/mob/M=src.loc
		if(!ismob(M)) return
		if(istype(src,/obj/Ninjutsu/Kawarimi))
			suffix="[Skills(M.kawarimiskill)] Mastery"
			return
		if(istype(src,/obj/Ninjutsu/Shunshin))
			suffix="[Skills(M.shunshinskill)] Mastery"
			return
	New()
		..()
		spawn() Update()


proc/Skills(var/num)
	if(num<=1) return "Rookie"
	if(num<=3&&num>1) return "Skilled"
	if(num<=5&&num>3) return "Veteran"
	if(num>5) return "Master"
	return "Experienced"