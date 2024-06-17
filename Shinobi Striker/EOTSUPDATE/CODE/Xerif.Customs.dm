/obj/custom_jutsu
	name = "Jutsu: Custom"
	desc = "Your bog standard custom jutsu."
	suffix = "Rookie Mastery"
	var/jutsu_icon = null
	var/trail_icon = null
	var/jutsu_type = "projectile"
	var/yell_name = "custom"
	var/chakra_cost = 100
	var/delay = 45
	var/skill = 1
	var/mastery = 10
	var/active = 0
	var/projectilenums=0
	var/jutsu_overlay
	var/taibuff
	var/staminabuff
	var/chakrabuff
	var/strbuff
	var/agilitybuff
	var/defbuff
	var/controlbuff
	var/resistbuff
	var/ninbuff
	var/genbuff
	var/buffduration
	var/element="Fire"
	var/bigatom=0
	Click()
		if(src in usr)
			use(usr)

	proc/use(mob/M)

		if(!active)
			active = 1
			spawn(delay)
				active = 0
		else
			switch(jutsu_type)
				if("toggle buff")
					toggleoverlaybuff(M,1)
					return
				if("target toggle buff")
					toggleoverlaybuff(M)
					return

		if(!has_chakra(M, chakra_cost))
			M << "Your chakra is too low to perform [name]!"
			return
		else
			consume_chakra(M, chakra_cost)

		if(prob(10/skill))
			M << "Your understanding of [name] has increased."
			if(++skill > mastery)
				skill = mastery
			suffix = get_mastery()

		switch(jutsu_type)
			if("multiprojectile")
				multiprojectile(M)
			if("projectile")
				projectile(M)
			if("bind")
				bind(M)
			if("summon")
				summon(M)
			if("target buff")
				overlaybuff(M)
			if("buff")
				overlaybuff(M,1)
			if("toggle buff")
				toggleoverlaybuff(M,1)
			if("target toggle buff")
				toggleoverlaybuff(M)
		//viewers(16, M) << output("<font color=[M.SayFont]>[M] yells<font color = white>: [yell_name]!","outputic.output")

	proc/toggleoverlaybuff(mob/M,var/self)
		var/mob/target=M
		if(!self)
			target = input("Who would you like to use [name] on?") in oview(16, M)
			if(!target ||  target.KO) return
		if(active)
			if(!target) return
			active=0
			target.overlays-=jutsu_overlay
			if(taibuff) target.Taijutsu = target.MaxTaijutsu
			if(staminabuff) target.Stamina = target.MaxStamina
			if(chakrabuff) target.Chakra = target.MaxChakra
			if(strbuff) target.Strength = target.MaxStrength
			if(agilitybuff) target.Agility = target.MaxAgility
			if(defbuff) target.Defence = target.MaxDefence
			if(controlbuff) target.Control = target.MaxControl
			if(resistbuff) target.Resistance = target.MaxResistance
			if(ninbuff) target.Ninjutsu = target.MaxNinjutsu
			if(genbuff) target.Genjutsu = target.MaxGenjutsu
			if(taibuff) target.Taijutsu = target.MaxTaijutsu
			return



		if(bigatom)
			var/scale=bigatom
			if(scale>256) scale=256
			scale=round(scale,32)
			if(scale<32) scale=32
			var/xtiles=(scale*0.03125)
			var/ytiles=xtiles
			var/icon/I=new(jutsu_overlay)
			I.Scale(scale,scale)
			var/disposition
			if(scale==32) disposition=32
			if(scale==64) disposition=48
			if(scale==128) disposition=80
			if(scale==256) disposition=144
			if(scale==512) disposition=272
			while(ytiles>0)
				sleep(1)
				if(prob(20)) sleep(1)
				target.overlays+=image(icon=I,icon_state="[xtiles-1],[ytiles-1]",pixel_x=(xtiles*32)-disposition,pixel_y=(ytiles*32)-disposition)
				xtiles-=1
				if(!xtiles)
					ytiles-=1
					xtiles=(scale*0.03125)
		else
			target.overlays+=jutsu_overlay
			active=1


		if(taibuff) target.Taijutsu += taibuff
		if(staminabuff) target.Stamina += staminabuff
		if(chakrabuff) target.Chakra += chakrabuff
		if(strbuff) target.Strength += strbuff
		if(agilitybuff) target.Agility += agilitybuff
		if(defbuff) target.Defence += defbuff
		if(controlbuff) target.Control += controlbuff
		if(resistbuff) target.Resistance += resistbuff
		if(ninbuff) target.Ninjutsu += ninbuff
		if(genbuff) target.Genjutsu +=genbuff


	proc/overlaybuff(mob/M,var/self)
		var/mob/target=M
		if(!self)
			target = input("Who would you like to use [name] on?") in oview(16, M)
			if(!target ||  target.KO) return



		if(bigatom)
			var/scale=bigatom
			if(scale>256) scale=256
			scale=round(scale,32)
			if(scale<32) scale=32
			var/xtiles=(scale*0.03125)
			var/ytiles=xtiles
			var/icon/I=new(jutsu_overlay)
			I.Scale(scale,scale)
			var/disposition
			if(scale==32) disposition=32
			if(scale==64) disposition=48
			if(scale==128) disposition=80
			if(scale==256) disposition=144
			if(scale==512) disposition=272
			while(ytiles>0)
				sleep(1)
				if(prob(20)) sleep(1)
				target.overlays+=image(icon=I,icon_state="[xtiles-1],[ytiles-1]",pixel_x=(xtiles*32)-disposition,pixel_y=(ytiles*32)-disposition)
				xtiles-=1
				if(!xtiles)
					ytiles-=1
					xtiles=(scale*0.03125)
		else
			target.overlays+=jutsu_overlay


		if(taibuff) target.Taijutsu += taibuff
		if(staminabuff) target.Stamina += staminabuff
		if(chakrabuff) target.Chakra += chakrabuff
		if(strbuff) target.Strength += strbuff
		if(agilitybuff) target.Agility += agilitybuff
		if(defbuff) target.Defence += defbuff
		if(controlbuff) target.Control += controlbuff
		if(resistbuff) target.Resistance += resistbuff
		if(ninbuff) target.Ninjutsu += ninbuff
		if(genbuff) target.Genjutsu +=genbuff
		spawn(buffduration)
			if(!target) return
			target.overlays-=jutsu_overlay
			if(taibuff) target.Taijutsu = target.MaxTaijutsu
			if(staminabuff) target.Stamina = target.MaxStamina
			if(chakrabuff) target.Chakra = target.MaxChakra
			if(strbuff) target.Strength = target.MaxStrength
			if(agilitybuff) target.Agility = target.MaxAgility
			if(defbuff) target.Defence = target.MaxDefence
			if(controlbuff) target.Control = target.MaxControl
			if(resistbuff) target.Resistance = target.MaxResistance
			if(ninbuff) target.Ninjutsu = target.MaxNinjutsu
			if(genbuff) target.Genjutsu = target.MaxGenjutsu
			if(taibuff) target.Taijutsu = target.MaxTaijutsu
	proc/multiprojectile(mob/M)
		for(var/i,i<projectilenums,i++)
			var/obj/jutsu_projectile/projectile = new(M.loc)
			projectile.icon = jutsu_icon
			if(bigatom)
				var/scale=bigatom
				if(scale>256) scale=256
				scale=round(scale,32)
				if(scale<32) scale=32
				var/xtiles=(scale*0.03125)
				var/ytiles=xtiles
				var/icon/I=new(jutsu_icon)
				I.Scale(scale,scale)
				var/disposition
				if(scale==32) disposition=32
				if(scale==64) disposition=48
				if(scale==128) disposition=80
				if(scale==256) disposition=144
				if(scale==512) disposition=272
				while(ytiles>0)
					sleep(1)
					if(prob(20)) sleep(1)
					projectile.overlays+=image(icon=I,icon_state="[xtiles-1],[ytiles-1]",pixel_x=(xtiles*32)-disposition,pixel_y=(ytiles*32)-disposition)
					xtiles-=1
					if(!xtiles)
						ytiles-=1
						xtiles=(scale*0.03125)
			projectile.trail_icon = trail_icon
			projectile.damage = rand(18, 24)
			projectile.dir = M.dir
			walk(projectile, M.dir)
	proc/projectile(mob/M)
		var/obj/jutsu_projectile/projectile = new(M.loc)
		projectile.icon = jutsu_icon
		if(bigatom)
			var/scale=bigatom
			if(scale>256) scale=256
			scale=round(scale,32)
			if(scale<32) scale=32
			var/xtiles=(scale*0.03125)
			var/ytiles=xtiles
			var/icon/I=new(jutsu_icon)
			I.Scale(scale,scale)
			var/disposition
			if(scale==32) disposition=32
			if(scale==64) disposition=48
			if(scale==128) disposition=80
			if(scale==256) disposition=144
			if(scale==512) disposition=272
			while(ytiles>0)
				sleep(1)
				if(prob(20)) sleep(1)
				projectile.overlays+=image(icon=I,icon_state="[xtiles-1],[ytiles-1]",pixel_x=(xtiles*32)-disposition,pixel_y=(ytiles*32)-disposition)
				xtiles-=1
				if(!xtiles)
					ytiles-=1
					xtiles=(scale*0.03125)
		projectile.trail_icon = trail_icon
		projectile.damage = rand(18, 24)
		projectile.dir = M.dir
		walk(projectile, M.dir)
	proc/summon(mob/M)
		var/mob/summon/D = new()
		D.Owner = M.key
		D.loc = M.loc
		D.icon = jutsu_icon
		if(bigatom)
			var/scale=bigatom
			if(scale>256) scale=256
			scale=round(scale,32)
			if(scale<32) scale=32
			var/xtiles=(scale*0.03125)
			var/ytiles=xtiles
			var/icon/I=new(D.icon)
			I.Scale(scale,scale)
			var/disposition
			if(scale==32) disposition=32
			if(scale==64) disposition=48
			if(scale==128) disposition=80
			if(scale==256) disposition=144
			if(scale==512) disposition=272
			while(ytiles>0)
				sleep(1)
				if(prob(20)) sleep(1)
				D.overlays+=image(icon=I,icon_state="[xtiles-1],[ytiles-1]",pixel_x=(xtiles*32)-disposition,pixel_y=(ytiles*32)-disposition)
				xtiles-=1
				if(!xtiles)
					ytiles-=1
					xtiles=(scale*0.03125)
		D.displaykey=M.key
		D.MaxChakra=rand(M.MaxChakra/5,M.MaxChakra/3)
		D.Chakra=D.MaxChakra
		D.Strength=rand(M.Strength/5,M.Strength/3)
		D.Agility=rand(M.Agility/5,M.Agility/3)
		D.Defence=rand(M.Defence/5,M.Defence/3)
		D.Control=rand(M.Control/5,M.Control/3)
		D.Resistance=rand(M.Resistance/5,M.Resistance/3)
		D.Ninjutsu=rand(M.Ninjutsu/5,M.Ninjutsu/3)
		D.Genjutsu=rand(M.Genjutsu/3,M.Genjutsu/2)
		D.Taijutsu = rand(M.Taijutsu/5,M.Taijutsu/3)
		D.attackable=1
		D.Health=100
		D.MaxHealth=100

	proc/bind(mob/M)
		var/mob/target = input("Who would you like to use [lowertext(yell_name)] on?") in oview(16, M)

		if(!target ||  target.KO)
			return

		if(target.Ninjutsu+target.Resistance < M.Ninjutsu+M.Control)

			target.move = 0
			target.icon_state = ""
			target.dir = SOUTH
			target.overlays += jutsu_icon

			sleep(delay * 5)

			target.move = 1
			target.overlays -= jutsu_icon

		else
			usr << "[target] dodged your [lowertext(yell_name)]!"

	proc/get_mastery()
		var/percentage = round((skill/mastery)*100)

		if(percentage <= 20)
			return "Apprentice"
		else if(percentage <= 40)
			return "Novice"
		else if(percentage <= 60)
			return "Veteran"
		else if(percentage <= 80)
			return "Elite"
		else if(percentage == 100)
			return "Master"

/proc/has_chakra(mob/M as mob, amount as num)
	if(M.Chakra >= amount)
		return 1
	else
		return 0

/proc/consume_chakra(mob/M as mob, amount as num)
	M.Chakra -= amount
	if(M.Chakra < 1)
		M.Chakra = 1

/obj/jutsu_projectile
	density = 1
	var/damage
	var/trail_icon

	New()
		spawn(150) del(src)

	Bump(mob/M)
		if(ismob(M))
			if(M.attackable)
				M.Ko()
				del(src)
		else del(src)

	Move()
		var/obj/jutsu_trail/O = new(loc)
		O.icon = trail_icon
		O.dir = dir
		..()

/obj/jutsu_trail
	density = 0

	New()
		spawn(150) del(src)

mob/summon/MouseDrag()
	..()
	if(src.displaykey==usr.key)
		mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)
mob/summon/New()
	..()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)


mob/summon/MouseDrop(o_o,s_l,o_l) //make it so if an object has been dragged to someplace...
	..()
	if(src.Owner == usr.key)
		if(isturf(o_l)) //making sure it was dropped on the map, and not in a statpanel or off the map
			walk_towards(src,o_l)

mob/summon
	var/function
	var/Owner = null
	New()
		..()
	Click()
		if(Owner==usr.key)
			var/list/Choices=new/list
			Choices.Add("Attack Target")
			Choices.Add("Follow")
			Choices.Add("Stay")
			Choices.Add("Unsummon")
			Choices.Add("Cancel")
			switch(input("Choose Option","",text) in Choices)
				if("Unsummon")
					flick('Smoke.dmi',src)
					del(src)
				if("Follow")
					function=1
					spawn while(function==1)
						sleep(5)
						if(prob(20)) step_rand(src)
						else step_towards(src,usr)
				if("Stay") function=2
				if("Attack Target")
					function=3
					var/mob/list/Targets=new/list
					for(var/mob/M in oviewers(12)) Targets.Add(M)
					var/mob/Choice=input("Attack who?") in Targets
					for(var/mob/M in oviewers(12)) if(Choice==M)
						spawn while(function==3)
							sleep(20)
							if(prob(10)) step_rand(src)
							else step_towards(src,M)
							BunshinAttack()