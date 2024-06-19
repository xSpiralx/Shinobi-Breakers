/* Weapons
Samehada
Kunai
Shuriken
Needles
Tanto
Katana
Staff?
*/
obj/items/Poisons
	var/last_edit










obj/items/Weapon
	var/shuriken=1

obj/items/Chakra_Paper
	icon='Paper.dmi'
	verb/Chakra_Test()
		set src in usr
		usr << "Your primary element is: [usr.PrimaryElement]"
		usr << "Your secondary element is: [usr.SecondaryElement]"
		if(usr.Has3rd)
			usr<< "Your Trietary Element is: [usr.TrietaryElement]"
		del src

mob/Tsukuyomi_Body
	icon='Tsukuyomi.dmi'
	icon_state="Base"
obj/Bloodtrail
	icon='bloodtrail.dmi'
	icon_state=""
	var/mob/Owner
	New()
		..()
		if(icon == 'bloodtrail.dmi')
			spawn()
				icon_state=""
				var/turf/T=src.loc
				if(!T) del(src)
				while(Owner in T)
					src.icon_state="front"
					sleep(1)
				spawn(3)
					var/TOP = 0
					var/BOTTOM = 0
					var/LEFT = 0
					var/RIGHT = 0
					for(var/obj/Bloodtrail/O in get_step(src,NORTH))
						TOP = 1
					for(var/obj/Bloodtrail/O in get_step(src,SOUTH))
						BOTTOM = 1
					for(var/obj/Bloodtrail/O in get_step(src,EAST))
						RIGHT = 1
					for(var/obj/Bloodtrail/O in get_step(src,WEST))
						LEFT = 1
					if(TOP&&RIGHT)
						icon_state="dl"
					if(TOP&&LEFT)
						icon_state="dr"
					if(BOTTOM&&RIGHT)
						icon_state="tl"
					if(BOTTOM&&LEFT)
						icon_state="tr"
	Click()
		if(get_dist(src,usr)>1) return
		if(prob(20))
			for(var/mob/M in view(14,usr))
				M<<output("<font size = -3><font color = white><font color=[usr.SayFont]>[M.getStrangerName(usr)] scrubs the floor.<font color = white>","outputic.output")
				M<<output("<font size = -3><font color = white><font color=[usr.SayFont]>[M.getStrangerName(usr)] scrubs the floor.<font color = white>","outputall.output")
		del(src)

mob/Dead_Body
	var/Bloods=145
	var/Bloodied=0
	var/description="No visible markings."
	var/Killer="Unknown"
	var/Capacity=0
	var/MaxCapacity=1500
	var/list/Contents=list()
	var/ContainerName
	var/Verification
	Click()
		if(get_dist(src,usr)>1) return
		ContainerName = src.name
		var/choice=input(usr,"Choose an option","[src]") in list ("Bury","Examine","Inventory")
		switch(choice)
			if("Examine")
				usr<<output("<font size = -3>[src] description: [description]","outputic.output")
				usr<<output("<font size = -3>[src] description: [description]","outputall.output")
				return
			if("Bury")
				var/turf/Terrain/Grass/T=src.loc
				if(!istype(T,/turf/Terrain/Grass/) && !istype(T,/turf/Terrain/Grasslight/)) return
				T.bur_info = input("What is written on this grave?") as text
				if(T.bur_info == null) T.bur_info = "N/A"
				T.overlays+=image('new_grave.dmi',T,"1")
				T.Body=src
				src.loc=null

			if("Inventory")
				if(usr.ContainerCheck) return
				usr.move=0
				usr.ContainerCheck=src
				winset(usr,"Container.ContainerName","text=\"[src.ContainerName]\"")
				winset(usr,"Container","is-visible=true")
				winset(usr,"Container.Grid","cells=0x0")
				var/Row = 1
				usr<<output("Capacity: [Capacity]/[MaxCapacity]","Container.Grid:1,1")
				for(var/obj/items/O in Contents)
					Row++
					usr << output(O,"Container.Grid:1,[Row]")
					spawn() while(winget(usr,"Container","is-visible")=="true") sleep(10)
					usr << output("Weight: [O.Weight]","Container.Grid:2,[Row]")


mob/Genjutsu

mob/var
	Weapon=0
	Weights=0
	Samehada=0
	Fan=0
obj/Shuriken
	icon='Shuriken.dmi'
	density=1
	var/damage
	New()
		..()
		spawn(50) del(src)
	Bump(mob/M)
		if(istype(M,/mob))
			if(M.attackable)
				if(M.Weapon&&M.attacking)
					if(get_step(M,src))
						walk(src,0)
						var/obj/items/Weapon/Shuriken/A = new
						A.loc = src.loc
						del(src)
					else
						del(src)
				else
					del(src)
			else
				del(src)
		if(istype(M,/turf))
			if(M.density)
				walk(src,0)
				var/obj/items/Weapon/Shuriken/A = new
				A.loc = src.loc
				del(src)

obj/Explosive_Tag
	icon='Explosive tag.dmi'
	density=1
	var/damage
	New()
		..()
		spawn(50) del(src)
	Bump(mob/M)
		if(istype(M,/mob))
			if(M.attackable)
				if(M.Weapon&&M.attacking)
					if(get_step(M,src))
						walk(src,0)
						var/obj/Smoke/A=new()
						var/obj/Smoke/B=new()
						var/obj/Smoke/C=new()
						var/obj/Smoke/D=new()
						var/obj/Smoke/E=new()
						var/obj/Smoke/F=new()
						var/obj/Smoke/G=new()
						var/obj/Smoke/H=new()
						var/obj/Smoke/I=new()
						A.loc=locate(M.x-1,M.y,M.z)
						B.loc=locate(M.x-1,M.y-1,M.z)
						C.loc=locate(M.x-1,M.y+1,M.z)
						D.loc=locate(M.x,M.y-1,M.z)
						E.loc=locate(M.x,M.y,M.z)
						F.loc=locate(M.x,M.y+1,M.z)
						G.loc=locate(M.x+1,M.y-1,M.z)
						H.loc=locate(M.x+1,M.y,M.z)
						I.loc=locate(M.x+1,M.y+1,M.z)
						del(src)

					else
						M.Ko()
						spawn() flick('Explode.dmi',M)
						del(src)
						var/obj/Smoke/A=new()
						var/obj/Smoke/B=new()
						var/obj/Smoke/C=new()
						var/obj/Smoke/D=new()
						var/obj/Smoke/E=new()
						var/obj/Smoke/F=new()
						var/obj/Smoke/G=new()
						var/obj/Smoke/H=new()
						var/obj/Smoke/I=new()
						A.loc=locate(M.x-1,M.y,M.z)
						B.loc=locate(M.x-1,M.y-1,M.z)
						C.loc=locate(M.x-1,M.y+1,M.z)
						D.loc=locate(M.x,M.y-1,M.z)
						E.loc=locate(M.x,M.y,M.z)
						F.loc=locate(M.x,M.y+1,M.z)
						G.loc=locate(M.x+1,M.y-1,M.z)
						H.loc=locate(M.x+1,M.y,M.z)
						I.loc=locate(M.x+1,M.y+1,M.z)

				else
					M.Ko()
					var/obj/Smoke/A=new()
					var/obj/Smoke/B=new()
					var/obj/Smoke/C=new()
					var/obj/Smoke/D=new()
					var/obj/Smoke/E=new()
					var/obj/Smoke/F=new()
					var/obj/Smoke/G=new()
					var/obj/Smoke/H=new()
					var/obj/Smoke/I=new()
					A.loc=locate(M.x-1,M.y,M.z)
					B.loc=locate(M.x-1,M.y-1,M.z)
					C.loc=locate(M.x-1,M.y+1,M.z)
					D.loc=locate(M.x,M.y-1,M.z)
					E.loc=locate(M.x,M.y,M.z)
					F.loc=locate(M.x,M.y+1,M.z)
					G.loc=locate(M.x+1,M.y-1,M.z)
					H.loc=locate(M.x+1,M.y,M.z)
					I.loc=locate(M.x+1,M.y+1,M.z)
					del(src)
			else
				del(src)
		if(istype(M,/turf))
			if(M.density)
				walk(src,0)
				var/obj/Smoke/A=new()
				var/obj/Smoke/B=new()
				var/obj/Smoke/C=new()
				var/obj/Smoke/D=new()
				var/obj/Smoke/E=new()
				var/obj/Smoke/F=new()
				var/obj/Smoke/G=new()
				var/obj/Smoke/H=new()
				var/obj/Smoke/I=new()
				A.loc=locate(M.x-1,M.y,M.z)
				B.loc=locate(M.x-1,M.y-1,M.z)
				C.loc=locate(M.x-1,M.y+1,M.z)
				D.loc=locate(M.x,M.y-1,M.z)
				E.loc=locate(M.x,M.y,M.z)
				F.loc=locate(M.x,M.y+1,M.z)
				G.loc=locate(M.x+1,M.y-1,M.z)
				H.loc=locate(M.x+1,M.y,M.z)
				I.loc=locate(M.x+1,M.y+1,M.z)
				del(src)

obj/Smoke
	icon='Explode.dmi'
	icon_state="1"
	layer=9
	New()
		..()
		spawn(1)
			icon_state="2"
			spawn(1)
				icon_state="3"
				spawn(1)
					icon_state="4"
					spawn(1)
						icon_state="5"
						spawn(1)
							del src



obj/Kunai
	icon='Kunai.dmi'
	icon_state="Throw"
	density=1
	var/damage
	New()
		..()
		spawn(50) del(src)
	Bump(mob/M)
		if(istype(M,/mob))
			if(M.attackable)
				if(M.Weapon&&M.attacking)
					if(get_step(M,src))
						walk(src,0)
						var/obj/items/Weapon/Kunai/A = new
						A.loc = src.loc
						del(src)
					else
						M.Ko()
						del(src)
				else
					M.Ko()
					del(src)
			else
				del(src)
		if(istype(M,/turf))
			if(M.density)
				walk(src,0)
				var/obj/items/Weapon/Kunai/A = new
				A.loc = src.loc
				del(src)
obj/Giant_Shuriken
	icon='Giant Shuriken.dmi'
	icon_state="Throw"
	density=1
	var/damage
	New()
		..()
		spawn(50) del(src)
	Bump(mob/M)
		if(istype(M,/mob))
			if(M.attackable)
				if(M.Weapon&&M.attacking)
					if(get_step(M,src))
						walk(src,0)
						var/obj/items/Weapon/Giant_Shuriken/A = new
						A.loc = src.loc
						del(src)
					else
						M.Ko()
						del(src)
				else
					M.Ko()
					del(src)
			else
				del(src)
		if(istype(M,/turf))
			if(M.density)
				walk(src,0)
				var/obj/items/Weapon/Giant_Shuriken/A = new
				A.loc = src.loc
				del(src)

obj/Windmill
	icon='Windmill.dmi'
	density=1
	var/damage
	New()
		..()
		spawn(50) del(src)
	Bump(mob/M)
		if(istype(M,/mob))
			if(M.attackable)
				if(M.Weapon&&M.attacking)
					if(get_step(M,src))
						walk(src,0)
						var/obj/items/Weapon/Windmill/A = new
						A.loc = src.loc
						del(src)
					else
						M.Ko()
						del(src)
				else
					M.Ko()
					del(src)
			else
				del(src)
		if(istype(M,/turf))
			if(M.density)
				walk(src,0)
				var/obj/items/Weapon/Windmill/A = new
				A.loc = src.loc
				del(src)
obj/Senbon
	icon='Senbon.dmi'
	density=1
	var/damage
	New()
		..()
		spawn(50) del(src)
	Bump(mob/M)
		if(istype(M,/mob))
			if(M.attackable)
				if(M.Weapon&&M.attacking)
					if(get_step(M,src))
						walk(src,0)
						var/obj/items/Weapon/Senbon/A = new
						A.loc = src.loc
						del(src)
					else
						M.Ko()
						del(src)
				else
					M.Ko()
					del(src)
			else
				del(src)
		if(istype(M,/turf))
			if(M.density)
				walk(src,0)
				var/obj/items/Weapon/Senbon/A = new
				A.loc = src.loc
				del(src)














obj/items/
	var/Description = "N/A"
	verb/View()
		set src in usr
		if(Description == "N/A")
			usr << "This is a [src.name]."
			return
		usr.showWeapon = src
		usr<<output(null,"Weapon.Description")
		usr<<output(null,"Weapon.Name")
		winshow(usr,"Weapon.Show",0)
		winset(usr,"Weapon","is-visible=true")
		var/icon/I = icon(icon,icon_state)
		var/newPicture = fcopy_rsc(I)
		winset(usr,"Weapon.Picture","image=\ref[newPicture]")
		winset(usr,"Weapon.Name","text=\"[name]\"")
		winshow(usr,"Weapon.Show",1)
		usr<<output("[Description]","Weapon.Description")

	proc/Descshow(mob/user)
		var/mob/controlMob = user
		if(controlMob.MindTransfer) controlMob=controlMob.MindTransfer
		display_desc(controlMob)

	proc/display_desc(mob/user)
		var/boost = 0
		for(var/obj/jutsu/P in src)
			if(P.jutsu_type == "perk" || (P.jutsu_type == "buff" && P.active))
				if(P.boost_kenjutsu) boost += P.boost_kenjutsu
		if(!user.showWeapon:Ranged)
			for(var/mob/M in hearers(16, user))
				if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) continue
				if(M.MindAfflicted)
					M.MindAfflicted << output("<font size=-2><font color=[user.SayFont]>[M.MindAfflicted.getStrangerName(user)] shows: <a href=?src=\ref[user];action=Weapon;weapon=[md5(name)]>[name]</a>! In this user's hands, this weapon does [get_grade_stat(user.showWeapon:Damage + user.strength)]. Its speed is [get_grade_stat(user.showWeapon:Speed + user.agility + boost)]. </font>", "outputall.output")
					M.MindAfflicted << output("<font size=-2><font color=[user.SayFont]>[M.MindAfflicted.getStrangerName(user)] shows: <a href=?src=\ref[user];action=Weapon;weapon=[md5(name)]>[name]</a>! In this user's hands, this weapon does [get_grade_stat(user.showWeapon:Damage + user.strength)]. Its speed is [get_grade_stat(user.showWeapon:Speed + user.agility + boost)]. </font>", "outputcombat.output")
				else
					M << output("<font size=-2><font color=[user.SayFont]>[M.getStrangerName(user)] shows: <a href=?src=\ref[user];action=Weapon;weapon=[md5(name)]>[name]</a>! In this user's hands, this weapon does [get_grade_stat(user.showWeapon:Damage + user.strength)]. Its speed is [get_grade_stat(user.showWeapon:Speed + user.agility + boost)].</font>", "outputall.output")
					M << output("<font size=-2><font color=[user.SayFont]>[M.getStrangerName(user)] shows: <a href=?src=\ref[user];action=Weapon;weapon=[md5(name)]>[name]</a>! In this user's hands, this weapon does [get_grade_stat(user.showWeapon:Damage + user.strength)]. Its speed is [get_grade_stat(user.showWeapon:Speed + user.agility + boost)].</font>", "outputcombat.output")
		else
			for(var/mob/M in hearers(16, user))
				if(M.MindTransfer) if(M == M.MindTransfer.MindAfflicted) continue
				if(M.MindAfflicted)
					M.MindAfflicted << output("<font size=-2><font color=[user.SayFont]>[M.MindAfflicted.getStrangerName(user)] shows: <a href=?src=\ref[user];action=Weapon;weapon=[md5(name)]>[name]</a>! In this user's hands, this weapon does [get_grade_stat(user.showWeapon:Damage + user.strength)]. Its speed is [get_grade_stat(user.showWeapon:Speed + user.agility + boost)]. </font>", "outputall.output")
					M.MindAfflicted << output("<font size=-2><font color=[user.SayFont]>[M.MindAfflicted.getStrangerName(user)] shows: <a href=?src=\ref[user];action=Weapon;weapon=[md5(name)]>[name]</a>! In this user's hands, this weapon does [get_grade_stat(user.showWeapon:Damage + user.strength)]. Its speed is [get_grade_stat(user.showWeapon:Speed + user.agility + boost)]. </font>", "outputcombat.output")
				else
					M << output("<font size=-2><font color=[user.SayFont]>[M.getStrangerName(user)] shows: <a href=?src=\ref[user];action=Weapon;weapon=[md5(name)]>[name]</a>! In this user's hands, this weapon does [get_grade_stat(user.showWeapon:Damage + user.strength)]. Its speed is [get_grade_stat(user.showWeapon:Speed + user.agility + boost)].</font>", "outputall.output")
					M << output("<font size=-2><font color=[user.SayFont]>[M.getStrangerName(user)] shows: <a href=?src=\ref[user];action=Weapon;weapon=[md5(name)]>[name]</a> ! In this user's hands, this weapon does [get_grade_stat(user.showWeapon:Damage + user.strength)]. Its speed is [get_grade_stat(user.showWeapon:Speed + user.agility + boost)].</font>", "outputcombat.output")

mob
	var/tmp/obj/items/showWeapon
	verb/showWeapon()
		set hidden = 1
		if(!showWeapon) return
		if(!(showWeapon in src.contents))
			return
		winset(src,"Weapon","is-visible=false")

		showWeapon.Descshow(src)



/*

obj/items
	var/Description="This item does not have a description."
	verb/Examine()
		usr << "[Description]"


*/

obj/items/Weapon
	var
		last_edit = 0
		Damage = 0
		Speed = 0
		Ranged = 0
		Poison = 0

	Rope
		icon='Icons/Rope.dmi'
		icon_state="Inv"
		verb/Use()
			if(src in usr.contents)
				if(usr.move)
					if(usr.Stamina<usr.MaxStamina*0.20)
						return
					usr.Stamina-=(usr.MaxStamina*0.20)
					var/list/V = new/list
					for(var/mob/M in oview(1))
						V.Add(M)
					var/mob/A=input("Who would you like to use the rope on?") in V
					if(A==null)
						return
					for(var/mob/M in hearers())
						M << "[M.getStrangerName(usr)] is attempting to bind [A] with rope!"
					var/L = usr.loc
					sleep(20)
					if(!(usr.loc == L && (L in oview(usr, 1)) && A))
						usr << "You failed to rope [A]"
						return
					if(A.Agility+A.Defence/2.5 >= usr.Agility*usr.Strength/1.7)
						usr.overlays += 'Icons/Rope2.dmi'
						usr.move=0
						usr.icon_state="KO"
						usr.roped=1
						A.MaxStamina += (1 *0.01)
						usr << "[A] was able to reverse the situation and tie you in a rope!"
						del(src)
					if(A.Agility+A.Defence/2.5 <= usr.Agility*usr.Strength/1.6)
						A.overlays += 'Icons/Rope2.dmi'
						A.move=0
						A.icon_state="KO"
						A.roped=1
						usr.MaxStamina += (1 *0.01)
						del(src)
	Samehada
		icon='Samehada.dmi'
		icon_state="Inv"
		Weight=7
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
					usr.Samehada=1
					usr.Taijutsu *= 1.4
					usr.Agility *= 0.7
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Samehada=0
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Agility = usr.MaxAgility
	Kiba
		icon='kibasscabbard.dmi'
		icon_state="Inv"
		var/Sheathe=1
		Weight=5
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Agility = usr.MaxAgility
		verb/Sheathe()
			if(src in usr.contents)
				if(!worn) return
				if(Sheathe)
					usr.overlays+='Raiga.dmi'
					Sheathe=0
					usr.Taijutsu *= 1.9
					usr.Agility *=1.6
				else
					usr.overlays-='Raiga.dmi'
					Sheathe=1
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Agility = usr.MaxAgility

	Enma_Pole
		icon='Enma Pole.dmi'
		icon_state="Inv"
		Weight=6
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
					usr.Taijutsu *= 1.5
					usr.Agility /= 1.3
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Agility = usr.MaxAgility
		verb/Summon_King_Enma()
			src.worn = 0
			src.suffix=""
			usr.Weapon=0
			usr.overlays -= src.icon
			usr.Taijutsu = usr.MaxTaijutsu
			usr.Agility = usr.MaxAgility
			var/mob/King_Enma/D = new()
			D.Owner = usr.key
			D.loc = usr.loc
			D.Chakra=usr.Chakra/2
			D.MaxChakra=usr.MaxChakra/2
			D.Strength=usr.Strength/2
			D.Agility=usr.Agility/3
			D.Defence=usr.Defence/2
			D.Control=usr.Control/3
			D.Resistance=usr.Resistance/3
			D.Ninjutsu=usr.Ninjutsu/2
			D.Genjutsu=usr.Genjutsu/3
			D.Taijutsu = usr.Taijutsu/2
			D.attackable=1
			D.Health=100
			D.MaxHealth=100
			del(src)


	Kubiriki
		icon='Kubiriki.dmi'
		icon_state="Inv"
		Weight=7
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
					usr.Taijutsu *= 2
					usr.Agility *= 0.4
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Agility = usr.MaxAgility

	Zanbatou
		icon='Zanbatou.dmi'
		icon_state="Inv"
		Damage= 12
		Speed= -10
		Weight= 7
		craftRank = "Trained Blacksmith"
		craftChance = 60
		craftCost = 7500

		Description = "This requires D+ strength to use in combat. Damage scales with strength + 2 steps, capping at A. This weapon uses the higher of strength and agility for striking speed. This reduces the user�s striking speed by four steps. Having the �Zanbatou Fighter� perk reduces this debuff to two steps. Two tile attack range. \[This requires 'Zanbatou Fighter' to apply the Combat Prof. perk boosts.]"

		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
					usr.Strength *= 2.2
					usr.Agility *= 0.3
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Strength = usr.MaxStrength
					usr.Agility = usr.MaxAgility

	Gunbai
		icon='Gunbai.dmi'
		icon_state="Inv"
		Weight=7
		Damage= 9
		Speed= -7
		craftRank = "Veteran Blacksmith"
		craftChance = 60
		craftCost = 12500
		Description = " This requires D strength to use in combat. It deals blunt damage that starts at D and scales with the user�s strength, capping at A. When using this weapon, there is an agility debuff of two steps unless the perk �Zanbatou Fighter� is present, in which it is reduced to one step. The defense of this weapon is C. It can only be broken through with C damage or higher. This defense can be improved using chakra flow (refer to relevant Chakra Flow technique.) \[This requires 'Zanbatou Fighter' to apply the Combat Prof. perk boosts.]"

		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
					usr.Strength *= 2.2
					usr.Agility *= 0.3
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Strength = usr.MaxStrength
					usr.Agility = usr.MaxAgility

	Test
		icon='Gunbai.dmi'
		icon_state="Inv"
		Weight=7

		craftRank = "Weapon-Smith"
		craftChance = 60
		craftCost = 12500
		Description = " This requires D strength to use in combat. It deals blunt damage that starts at D and scales with the user�s strength, capping at A. When using this weapon, there is an agility debuff of two steps unless the perk �Zanbatou Fighter� is present, in which it is reduced to one step. The defense of this weapon is C. It can only be broken through with C damage or higher. This defense can be improved using chakra flow (refer to relevant Chakra Flow technique.) \[This requires 'Zanbatou Fighter' to apply the Combat Prof. perk boosts.]"

		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
					usr.Strength *= 2.2
					usr.Agility *= 0.3
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Strength = usr.MaxStrength
					usr.Agility = usr.MaxAgility

	Naginata
		icon='naginata.dmi'
		icon_state="Inv"
		Weight=5
		Damage= 6
		Speed= -3
		craftRank = "Trained Blacksmith"
		craftChance = 60
		craftCost = 7000

		Description = "This requires D strength to use in combat. Damage scales with strength + 1 step, capping at B. It reduces the user�s striking speed by two steps. Two tiles attack range if length is used fully.  Requires two hands to use at all times. \[This requires 'Halberd/Polearm Proficiency' to apply the Combat Prof. perk boosts.]"


		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
					usr.Strength *= 2.2
					usr.Agility *= 0.3
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Strength = usr.MaxStrength
					usr.Agility = usr.MaxAgility

	Dagger
		icon='Dirk.dmi'
		icon_state="Inv"
		Weight=1
		Damage= 4
		Speed= 0
		craftRank = "Rookie Blacksmith"
		craftChance = 60
		craftCost = 500
		Description = {"\[Meele] Damage scales with strength + 1 step, capping at C \[This requires 'Knife Fighter' to apply the Combat Prof. perk boosts.]
\[Thrown] Thrown weapon - \[Damage= Speed minus one step, caps at C] \[Speed= User�s strength, caps at B]
"}

		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
					usr.Strength *= 2.2
					usr.Agility *= 0.3
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Strength = usr.MaxStrength
					usr.Agility = usr.MaxAgility

	Hiramekarei
		icon='Hiramekarei.dmi'
		icon_state="Inv"
		Weight=8
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
					usr.Taijutsu *= 1.8
					usr.Strength *= 1.8
					usr.Agility *= 0.3
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Strength = usr.MaxStrength
					usr.Agility = usr.MaxAgility

	Kyodai_Sensu
		icon='Fan.dmi'
		icon_state="Inv"
		Weight=4

		craftRank = "Trained Blacksmith"
		craftChance = 60
		craftCost = 4750


		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
					usr.Taijutsu *= 1.3
					usr.Ninjutsu *= 2.5
					usr.Agility /= 1.5
					usr.Fan=1
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Ninjutsu = usr.MaxNinjutsu
					usr.Agility = usr.MaxAgility
					usr.Fan=0
	Torch
		icon='torch.dmi'
		icon_state="Inv"
		var/fuel=300
		Weight=1
		var
			obj/light/light
			matrix
				on_matrix = matrix()
				off_matrix = matrix()
		Move()
			..()
			del(light)
			if(istype(loc,/turf/))
				on_matrix = new()
				off_matrix = new()
				light = new(src.loc)
				on_matrix.Scale(8)
				off_matrix.Scale(0)
				animate(light,transform=on_matrix,time=5)
				sleep(6)
				// And flickering...
				animate(light,color=rgb(220,220,220),time=4,loop=-1)
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
					usr.Taijutsu *= 1.3
					usr.Ninjutsu *= 1
					usr.Agility *= 1
					usr.light = new(usr.loc)
					usr.light.alpha = 250
					var/matrix/m = new()
					m.Scale(8)
					animate(usr.light,transform=m,time=5)
					sleep(6)
					// And flickering...
					animate(usr.light,color=rgb(220,220,220),time=4,loop=-1)
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Ninjutsu = usr.MaxNinjutsu
					usr.Agility = usr.MaxAgility
					animate(usr.light,transform=off_matrix,time=5)
					sleep(6)
					del(usr.light)
	Raijin
		icon='Raijin.dmi'
		icon_state="Inv"
		Weight=4
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
					usr.Taijutsu *= 1.3
					usr.Ninjutsu *= 2
					usr.Agility *= 1.3
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Ninjutsu = usr.MaxNinjutsu
					usr.Agility = usr.MaxAgility

	Umbrella
		icon='Umbrella.dmi'
		icon_state="Inv"
		Weight=3
		craftRank = "Trained Blacksmith"
		craftChance = 60
		craftCost = 6000
		Description = "This requires D strength to use in combat. Damage scales with strength + 1 step, capping at C. \[This requires 'Exotic Weapon Proficiency' to apply the Combat Prof. perk boosts.]"
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
					usr.Taijutsu *= 1.6
					usr.Ninjutsu *= 1.2
					usr.Agility *= 1.2
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Ninjutsu = usr.MaxNinjutsu
					usr.Agility = usr.MaxAgility

	Cross_Blade
		icon='Sword_Sheathed.dmi'
		icon_state="Inv"
		Weight=2
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
					usr.Taijutsu *= 1.6
					usr.Agility *= 0.9
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Agility = usr.MaxAgility


	Memori_Tail
		icon='Tail of Memori.dmi'
		icon_state="Inv"
		Weight=1
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
					usr.Agility *= 1.4
					usr.Strength *= 1.6
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Strength = usr.MaxStrength
					usr.Agility = usr.MaxAgility

	Tan_Polearm
		icon='Suna no Geton Staff Blade.dmi'
		icon_state="Inv"
		Weight=1
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
					usr.Agility *= 0.8
					usr.Defence *= 0.7
					usr.Strength *= 1.6
					usr.Taijutsu *= 1.4
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Strength = usr.MaxStrength
					usr.Defence = usr.MaxDefence
					usr.Agility = usr.MaxAgility

	Spear
		icon='Spear.dmi'
		icon_state="Inv"
		Weight=6
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
					usr.Agility *= 1.2
					usr.Taijutsu *= 2
					usr.Defence *= 0.6
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Defence = usr.MaxDefence
					usr.Agility = usr.MaxAgility

	Shuusui
		icon='Shuusui Unsheathed.dmi'
		icon_state="Inv"
		Weight=4
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
					usr.Agility *= 1.8
					usr.Taijutsu *= 0.6
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Agility= usr.MaxAgility

	Samurai_Sword
		icon='Samurai Sword.dmi'
		icon_state="Inv"
		Weight=3
		craftRank = "Trained Blacksmith"
		craftChance = 60
		craftCost = 5000
		Description = "Damage scales with strength + 2 steps, capping at B. This reduces the user�s striking speed by one step. \[This requires 'Katana Prof.' to apply the Combat Prof. perk boosts.]"
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
					usr.Agility *= 1.4
					usr.Defence *= 1.3
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Defence = usr.MaxDefence
					usr.Agility = usr.MaxAgility

	Water_Form
		icon='WaterArmorJutsu.dmi'
		icon_state="Inv"
		Weight=1
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
					usr.Agility *= 1.4
					usr.Defence *= 1.3
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Agility = usr.Agility
					usr.Defence = usr.Defence

	Garian
		icon='Garian.dmi'
		icon_state="Inv"
		Weight=6
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
					usr.Agility *= 0.4
					usr.Strength *= 2.3
					usr.Ninjutsu *=1.3
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Agility = usr.MaxAgility
					usr.Strength = usr.MaxStrength
					usr.Ninjutsu = usr.MaxNinjutsu

	Demon_Brother_Arm_1
		icon='Demon Bro Arm.dmi'
		icon_state="Inv"
		Weight=4
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
					usr.Agility *= 0.8
					usr.Defence *= 1.2
					usr.Strength *= 1.6
					usr.Taijutsu *= 0.8
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Strength = usr.MaxStrength
					usr.Defence = usr.MaxDefence
					usr.Agility = usr.MaxAgility

	Demon_Brother_Arm_2
		icon='Demon Bro Arm 2.dmi'
		icon_state="Inv"
		Weight=4
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
					usr.Agility *= 0.8
					usr.Defence *= 1.2
					usr.Strength *= 1.6
					usr.Taijutsu *= 0.8
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Strength = usr.MaxStrength
					usr.Defence = usr.MaxDefence
					usr.Agility = usr.MaxAgility

	Kura_Bow_Sword
		icon='Bow Sword right.dmi'
		icon_state="Inv"
		Weight=5
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
					usr.Agility *= 1.2
					usr.Defence *= 1.3
					usr.Strength *= 1.3
					usr.Taijutsu *= 0.5
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Strength = usr.MaxStrength
					usr.Defence = usr.MaxDefence
					usr.Agility = usr.MaxAgility

	Kura_Bow_Sword_2
		icon='Bow Sword left.dmi'
		icon_state="Inv"
		Weight=5
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
					usr.Agility *= 1.2
					usr.Defence *= 1.3
					usr.Strength *= 1.3
					usr.Taijutsu *= 0.5
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Strength = usr.MaxStrength
					usr.Defence = usr.MaxDefence
					usr.Agility = usr.MaxAgility




	Jet_Warglaive
		icon='Hand blade 2.dmi'
		icon_state="Inv"
		Weight=5
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
					usr.Agility *= 1.4
					usr.Defence *= 0.7
					usr.Offence *= 1.3
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Defence = usr.MaxDefence
					usr.Offence = usr.MaxOffence
					usr.Agility = usr.MaxAgility

	Jet_Warglaive_2
		icon='Hand blade.dmi'
		icon_state="Inv"
		Weight=5
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
					usr.Agility *= 1.4
					usr.Defence *= 0.7
					usr.Offence *= 1.3
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Defence = usr.MaxDefence
					usr.Offence = usr.MaxOffence
					usr.Agility = usr.MaxAgility


	BlackStar_Chained_Scythes
		icon='Black Star Chained Scythe.dmi'
		icon_state="Inv"
		Weight=5
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
					usr.Agility *= 1.2
					usr.Defence *= 1.2
					usr.Offence *= 1.3
					usr.Taijutsu *= 0.5
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Defence = usr.MaxDefence
					usr.Offence = usr.MaxOffence
					usr.Agility = usr.MaxAgility

	Fishing_Rod
		icon='fisherpole.dmi'
		icon_state="inv"
		Weight=3
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
				else
					if(usr.Fishing)
						usr<<"You cannot unequip this while you're fishing!"
						return
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Ninjutsu = usr.MaxNinjutsu
					usr.Strength = usr.MaxStrength
					usr.Defence = usr.MaxDefence
					usr.Offence = usr.MaxOffence
					usr.Agility = usr.MaxAgility
	Void_Blade
		icon='KuraSword.dmi'
		icon_state="Inv"
		Weight=4
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
					usr.Agility *= 0.6
					usr.Defence *= 0.7
					usr.Offence *= 1.3
					usr.Strength *= 2
					usr.Taijutsu *= 0.9
					usr.Ninjutsu *= 1.4
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Ninjutsu = usr.MaxNinjutsu
					usr.Strength = usr.MaxStrength
					usr.Defence = usr.MaxDefence
					usr.Offence = usr.MaxOffence
					usr.Agility = usr.MaxAgility

	Ender_Blade
		icon='Ender Blade.dmi'
		icon_state="Inv"
		Weight=10
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
					usr.Agility *= 0.4
					usr.Defence *= 0.7
					usr.Control *= 1.3
					usr.Strength *= 2
					usr.Taijutsu *= 0.6
					usr.Ninjutsu *= 1.9
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Ninjutsu = usr.MaxNinjutsu
					usr.Agility = usr.MaxAgility
					usr.Defence = usr.MaxDefence
					usr.Control = usr.MaxControl
					usr.Strength = usr.MaxStrength

	Gord
		icon='Gord.dmi'
		icon_state="Inv"
		Weight=5
		Description = "This has a minus three tiles slow down. With the relevant Gourd Combatant perk, this slowdown is reduced to one tile."
		craftRank = "Trained Blacksmith"
		craftChance = 60
		craftCost = 6000
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
					usr.Taijutsu *= 0.7
					usr.Agility /= 2
					usr.Ninjutsu *= 2.3
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Ninjutsu = usr.MaxNinjutsu
					usr.Agility = usr.MaxAgility
	Kunai
		icon='Kunai.dmi'
		icon_state="Inv"
		var/Kunai=1
		Weight=1
		Description = {"<center><font color=white><font face="Tahoma"><font size=1><b><Font color=#A81C1C>(Damage: Users Strenth(Cap D+))<br><font color=#2EC13A>(Speed: Users Strength)<br><font color=#768177> (Tile-Range: 5) </b></font><br>Note: Three Kunai can be thrown per turn; Every Kunai after the first adds +1 Step of damage, capping at C damage</center>"}


		craftRank = "Rookie Blacksmith"
		craftChance = 60
		craftCost = 15


		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
					usr.Taijutsu *= 1.15
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu

		verb/Throw()
			if(src.worn==0&&usr.Weapon==0)
				if(prob(20/usr.KunaiSkill/usr.KunaiSkill/usr.KunaiSkill))
					usr.KunaiSkill+=rand(0.5,1.2)
				var/obj/Kunai/A = new
				A.damage = (usr.KunaiSkill/1.15)+6
				A.loc=usr.loc
				A.dir = usr.dir
				walk(A,usr.dir)
				if(Kunai==1)
					del(src)
					return
				Kunai-=1

	Giant_Shuriken
		name="Back Shuriken"
		icon='Giant Shuriken.dmi'
		icon_state="Inv"
		var/GiantShuriken=1
		Weight=6
		Description = "<center><font color=white><font face=Tahoma><font size=1><b><Font color=#A81C1C>(Damage: Users Strength(Cap B-))<br><font color=#2EC13A>(Speed: Users Strength)<br><font color=#768177> (Tile-Range: 4) </b></font><br>Note: Use can only throw 1 Giant Shuriken per turn;</center>"

		craftRank = "Trained Blacksmith"
		craftChance = 60
		craftCost = 1200


		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
					usr.Taijutsu *= 1.89
					usr.Agility *= 0.8
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Agility = usr.MaxAgility

		verb/Throw()
			if(src.worn==0&&usr.Weapon==0)
				if(prob(10/usr.ShurikenSkill/usr.ShurikenSkill/usr.ShurikenSkill))
					usr.ShurikenSkill+=rand(0.5,1.2)
				var/obj/Giant_Shuriken/A = new
				A.damage = (usr.ShurikenSkill/1.2)+2
				A.loc=usr.loc
				A.dir = usr.dir
				walk(A,usr.dir)
				if(GiantShuriken==1)
					del(src)
					return
				GiantShuriken-=1
	Poison_Bomb
		icon='Poison.dmi'
		icon_state="Inv"
		var/Bomb=1
		Weight=1
		verb/Throw()
			if(src.worn==0&&usr.Weapon==0)
				var/obj/Poison_Bomb/A = new
				A.damage = (usr.Ninjutsu/10)+2
				A.loc=usr.loc
				A.dir = usr.dir
				walk(A,usr.dir)
				if(Bomb==1)
					del(src)
					return
				Bomb-=1


	Explosive_Tag
		icon='Explosive Tag.dmi'
		icon_state="Inv"
		var/Tag=1
		Weight=1
		Description = "Explosion is a two tile radius. C damage. For each aditional two tags, the damage goes up by one step to a maximum of B. Explosion speed is C rank."
		craftRank = "Fuuinjutsu Practitioner"
		craftChance = 60
		craftCost = 250

		/*Click()
			if(src in usr.contents)
				del(src)
				var/obj/items/Weapons/Explosive_Tag/A = new
				A.loc=usr.loc
				sleep(400,500)
				var/obj/Smoke/W=new()
				var/obj/Smoke/B=new()
				var/obj/Smoke/C=new()
				var/obj/Smoke/D=new()
				var/obj/Smoke/E=new()
				var/obj/Smoke/F=new()
				var/obj/Smoke/G=new()
				var/obj/Smoke/H=new()
				var/obj/Smoke/I=new()
				W.loc=locate(A.x-1,A.y,A.z)
				B.loc=locate(A.x-1,A.y-1,A.z)
				C.loc=locate(A.x-1,A.y+1,A.z)
				D.loc=locate(A.x,A.y-1,A.z)
				E.loc=locate(A.x,A.y,A.z)
				F.loc=locate(A.x,A.y+1,A.z)
				G.loc=locate(A.x+1,A.y-1,A.z)
				H.loc=locate(A.x+1,A.y,A.z)
				I.loc=locate(A.x+1,A.y+1,A.z)
				for(var/mob/M in oview(4,A))
					if(W)
						if(M.loc==W.loc)
							var/damage=round(M.Defence*1.2/2)
							// M.Health -= damage
							M.Ko()
				for(var/mob/M in oview(4,A))
					if(B)
						if(M.loc==B.loc)
							var/damage=round(M.Defence*1.2/2)
							// M.Health -= damage
							M.Ko()
				for(var/mob/M in oview(4,A))
					if(C)
						if(M.loc==C.loc)
							var/damage=round(M.Defence*1.2/2)
							// M.Health -= damage
							M.Ko()
				for(var/mob/M in oview(4,A))
					if(D)
						if(M.loc==D.loc)
							var/damage=round(M.Defence*1.2/2)
							// M.Health -= damage
							M.Ko()
				for(var/mob/M in oview(4,A))
					if(E)
						if(M.loc==E.loc)
							var/damage=round(M.Defence*1.2/2)
							// M.Health -= damage
							M.Ko()
				for(var/mob/M in oview(4,A))
					if(F)
						if(M.loc==F.loc)
							var/damage=round(M.Defence*1.2/2)
							// M.Health -= damage
							M.Ko()
				for(var/mob/M in oview(4,A))
					if(G)
						if(M.loc==G.loc)
							var/damage=round(M.Defence*1.2/2)
							// M.Health -= damage
							M.Ko()
				for(var/mob/M in oview(4,A))
					if(H)
						if(M.loc==H.loc)
							var/damage=round(M.Defence*1.2/2)
							// M.Health -= damage
							M.Ko()
				for(var/mob/M in oview(4,A))
					if(I)
						if(M.loc==I.loc)
							var/damage=round(M.Defence*1.2/2)
							// M.Health -= damage
							M.Ko()
				del(A)*/



		verb/Throw()
			if(src.worn==0&&usr.Weapon==0)
				var/obj/Explosive_Tag/A = new
				A.damage = (usr.Ninjutsu/5)+2
				A.loc=usr.loc
				A.dir = usr.dir
				walk(A,usr.dir)
				if(Tag==1)
					del(src)
					return
				Tag-=1


	Log
		icon='Log.dmi'
		icon_state="Inv"
	Katana
		icon='katana(sleath.dmi'
		icon_state="Inv"
		var/Sheathe=1
		Description = "Damage scales with strength + 1 steps, capping at B. This reduces the user�s striking speed by one step. \[This requires 'Katana Prof.' to apply the Combat Prof. perk boosts.]"
		craftRank = "Trained Blacksmith"
		craftChance = 60
		craftCost = 3000
		Damage= 7
		Speed= -5

		Weight=4
		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Agility = usr.MaxAgility
		verb/Sheathe()
			if(src in usr.contents)
				if(!worn) return
				if(Sheathe)
					usr.overlays+='katana(atk).dmi'
					Sheathe=0
					usr.Taijutsu *= 1.9
					usr.Agility *=1.6
				else
					usr.overlays-='katana(atk).dmi'
					Sheathe=1
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Agility = usr.MaxAgility
	Bokken
		name="Training Sword"
		icon='bokken.dmi'
		icon_state="Inv"
		Weight=2
		Damage= 2
		Speed= 0
		craftRank = "Rookie Blacksmith"
		craftChance = 60
		craftCost = 10

		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.Taijutsu *= 1.3
					usr.Agility *=1.25
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Agility = usr.MaxAgility
	Tanto
		name="Wakizashi"
		icon='Tanto.dmi'
		icon_state="Inv"
		Weight=2
		Damage= 5
		Speed= 0
		Description = "Damage scales with strength, capping at B. \[This requires 'Knife Fighter.' to apply the Combat Prof. perk boosts.]"
		craftRank = "Rookie Blacksmith"
		craftChance = 60
		craftCost = 500


		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.Taijutsu *= 1.3
					usr.Agility *=1.25
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Agility = usr.MaxAgility
	Longsword
		name="Longsword"
		icon='Longsword.dmi'
		icon_state="Inv"
		Damage= 8
		Speed= -6

		Weight=2
		Description = "This requires D strength to use in combat. Damage scales with strength + 2 steps, capping at B. This reduces the user�s striking speed by two steps. \[This requires 'Zanbatou Fighter.' to apply the Combat Prof. perk boosts.]"
		craftRank = "Trained Blacksmith"
		craftChance = 60
		craftCost = 6000


		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.Taijutsu *= 1.3
					usr.Agility *=1.25
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Agility = usr.MaxAgility
	Rapier
		name="Rapier"
		icon='Rapier.dmi'
		icon_state="Inv"
		Weight=2
		Damage= 6
		Speed= -3

		Description = "Damage scales with strength + 1 step, capping at C. \[This requires 'Katana Prof.' to apply the Combat Prof. perk boosts.]"
		craftRank = "Trained Blacksmith"
		craftChance = 60
		craftCost = 3750


		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.Taijutsu *= 1.3
					usr.Agility *=1.25
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Agility = usr.MaxAgility
	Bostaff
		name="Bo-staff"
		icon='bostaff.dmi'
		icon_state="Inv"
		Weight=2
		Damage= 3
		Speed= 0

		Description = "Damage scales with strength + 1 step, capping at C. It reduces the user�s striking speed by one step. Two tiles attack range if length is used fully. \[This requires 'Polearm prof.' to apply the Combat Prof. perk boosts.]"
		craftRank = "Rookie Blacksmith"
		craftChance = 60
		craftCost = 3500


		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.Taijutsu *= 1.3
					usr.Agility *=1.25
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Agility = usr.MaxAgility
	Claymore
		name="Claymore"
		icon='7bustersword.dmi'
		icon_state="Inv"
		Weight=2
		Description = "This requires D+ strength to use in combat. Damage scales with strength + 3 steps, capping at A.This weapon uses strength for striking speed. This reduces the user�s striking speed by five steps. Having the �Zanbatou Fighter� perk reduces this debuff to two steps. Two tile attack range. \[This requires 'Zanbatou Fighter' to apply the Combat Prof. perk boosts.]"
		craftRank = "Trained Blacksmith"
		craftChance = 60
		craftCost = 10000
		Damage= 10
		Speed= -8


		Click()
			..()
			if(src in usr.contents)
				if(!src.worn)

					src.worn = 1
					src.suffix = "Equipped"

					usr.Taijutsu *= 1.3
					usr.Agility *=1.25
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Agility = usr.MaxAgility
	Shuriken
		icon='Shuriken.dmi'
		icon_state="Inv"
		Weight=1
		Description = "<center><font color=white><font face=Tahoma><font size=1><b><Font color=#A81C1C>(Damage: Users Agility (Cap D))<br><font color=#2EC13A>(Speed: Users Agility)<br><font color=#768177> (Tile-Range: 5) </b></font><br>Note: Three Shuriken can be thrown per turn; Every shuriken after the first adds +1 Step of damage, capping at C damage</center>"
		craftRank = "Rookie Blacksmith"
		craftChance = 100
		craftCost = 10


		verb/Throw()
			if(prob(10/usr.ShurikenSkill/usr.ShurikenSkill/usr.ShurikenSkill))
				usr.ShurikenSkill+=rand(0.5,1)
			var/obj/Shuriken/A = new
			A.damage = (usr.ShurikenSkill/1.5)+2
			A.loc=usr.loc
			A.dir = usr.dir
			walk(A,usr.dir)
			if(shuriken==1)
				del(src)
				return
			shuriken-=1
			src.suffix = "You current have [src.shuriken] in this stack"
	Windmill
		icon='Windmill.dmi'
		icon_state="Inv"
		var/Windmill=1
		Weight=2
		Description = "<center><font color=white><font face=Tahoma><font size=1><b><Font color=#A81C1C>(Damage: Users Strength(Cap C+))<br><font color=#2EC13A>(Speed: Users Strength)<br><font color=#768177> (Tile-Range: 4) </b></font><br>Note: Use can only throw 1 Windmill Shuriken per turn;</center>"
		craftRank = "Rookie Blacksmith"
		craftChance = 60
		craftCost = 500


		verb/Throw()
			if(prob(10/usr.WindmillSkill/usr.WindmillSkill/usr.WindmillSkill))
				usr.WindmillSkill+=rand(0.5,1)
			var/obj/Windmill/A = new
			A.damage = (usr.ShurikenSkill/1.3)+5
			A.loc=usr.loc
			A.dir = usr.dir
			walk(A,usr.dir)
			if(Windmill==1)
				del(src)
				return
			Windmill-=1
			src.suffix = "You current have [src.Windmill] in this stack"


	Senbon
		icon='Senbon.dmi'
		icon_state="Inv"
		var/senbon=1
		Weight=1
		Description = "\[Thrown] \[Damage= Speed minus four steps, caps at C] \[Speed= User�s strength, caps at B]"
		craftRank = "Rookie Blacksmith"
		craftChance = 100
		craftCost = 5


		verb/Throw()
			if(prob(10/usr.SenbonSkill/usr.SenbonSkill/usr.SenbonSkill))
				usr.SenbonSkill+=rand(0.5,1)
			var/obj/Senbon/A = new
			A.damage = (usr.SenbonSkill/1.7)+2
			A.loc=usr.loc
			A.dir = usr.dir
			walk(A,usr.dir)
			if(senbon==1)
				del(src)
				return
			senbon-=1
			src.suffix = "You current have [src.senbon] in this stack"
	/*Weights
		icon='Weights.dmi'
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "Equipped"
					usr.overlays += src.icon
					//usr.Weights()
					usr.weights=1
				else
					src.worn = 0
					src.suffix=""
					usr.overlays -= src.icon
					usr.weights=0*/


	/*Weights
		icon='Weights.dmi'
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "Equipped"
					usr.overlays += src.icon
					usr.Weights()
					usr.Weights=1
				else
					src.worn = 0
					src.suffix=""
					usr.overlays -= src.icon
					usr.Weights=0


mob/proc
	Weights()
		if(!usr.Weights)
			usr.MaxStamina += (1 *0.015)
			if(usr.Stamina > 0)
				if(usr.MaxStamina >= 75)
					usr.Spar_Gain()
				else
					usr.Stamina -= rand(1,3)
					usr.Spar_Gain()
					usr.MaxStamina += (1 *0.018)
			else
				usr.Health -= rand(1,3)
				usr.Ko()
			usr.waterproc=0
			spawn(30)
			usr.Weights()
		else
			usr.Weights=0*/

