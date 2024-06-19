mob/var/Savable=1
mob
	proc
		Save()
			if(key)
				if(!src.loc)
					return
				if(src.loc==locate(80,250,27))
					return
				if(name == key) return
				var/savefile/F=new("Save/[src.ckey]")
				F["x"]<<src.x
				F["y"]<<src.y
				F["z"]<<src.z
				Write(F)
		AutoSave()
			Save()
			spawn(6000)
				AutoSave()

/*		Load()
			if(client)
				if(fexists("Save/[src.ckey]"))
					var/savefile/F=new("Save/[src.ckey]")
					Read(F)
					F["x"]>>src.x
					F["y"]>>src.y
					F["z"]>>src.z
					src.loc = locate(src.x,src.y,src.z)
					if(src.Village=="Konohagakure")
						if(src.name in KonoNin)
							return
						else
							KonoNin+=src.name
					if(src.Village=="Sunagakure")
						if(src.name in SunaNin)
							return
						else
							SunaNin+=src.name
					if(src.Village=="Kirigakure")
						if(src.name in KiriNin)
							return
						else
							KiriNin+=src.name
				else
					alert("You do not have any characters on this server.")
					usr.Start()*/

		Load()
			if(client)
				var/outputFile = file("Debug/Loads/[time2text(world.realtime,"DD-MM-YY")].txt")
				if(fexists(outputFile))
					outputFile << "[time2text(world.realtime,"DD-MM-YY hh:mm")]:[src.ckey] is about to load"
				else
					outputFile << "[time2text(world.realtime,"DD-MM-YY hh:mm")]:[src.ckey]"
				if(fexists("Save/[src.ckey]"))
					outputFile << "[time2text(world.realtime,"DD-MM-YY hh:mm")]:[src.ckey] is loading"
					var/savefile/F=new("Save/[src.ckey]")
					Read(F)
					F["x"]>>src.x
					F["y"]>>src.y
					F["z"]>>src.z
					src.loc = locate(src.x,src.y,src.z)
					overlays-='afk.dmi'
					overlays-= 'Swim.dmi'
					overlays-='Bubble.dmi'
					src.icon_state=""
					pixel_y=0
					pixel_x=0
					see_in_dark=3
					if(!usr.icon) usr.icon=usr.Oicon
					src<<"<font size=-1>Current date is the [Day][Days(Day)] of [Months(Month)] in the year [Year+100]"
					src << "Help keep the game alive by subscribing. Use the 'login-box' verb for more information."
					FixIcon(src)
					for(var/obj/items/Weapon/Torch/T in src.contents)
						T.worn = 0
						T.suffix=""
						Weapon=0
						overlays -= T.icon
						Taijutsu = MaxTaijutsu
						Ninjutsu = MaxNinjutsu
						Agility = MaxAgility
					OOCFont = "#858755"
					if(client.IsByondMember())
						OOCFont = "#81BDD9"
					if(Admin)
						OOCFont="#3B56E1"
					if(Donator)
						OOCFont = "#B52735"

					LoginUpdate()
					checkSubscription()
					squad_check()
					//loadCharacterSheet()
					//checkOfflineReward()
					lastOn = time2text(world.realtime,"DD/MM/YYYY")
					src.text = null
					src.see_invisible = 0
					outputFile << "[time2text(world.realtime,"DD-MM-YY hh:mm")]:[src.ckey] is loaded"
				else
					outputFile << "[time2text(world.realtime,"DD-MM-YY hh:mm")]:[src.ckey] didn't have a save."
					alert("You do not have any characters on this server.")
					del(src)

mob/var/lastOn


/*mob
	proc
		Save()
			if(Savable)
				var/savefile/F=new("Save/[key]")
				Write(F)

		AutoSave()
			Save()
			spawn(3000)
			AutoSave()

		Load()
			if(client)
				if(fexists("Save/[key]"))
					var/savefile/F=new("Save/[key]")
					Read(F)
					x=returnx
					y=returny
					z=returnz
				else
					alert("You do not have any characters on this server.")
					usr.Start()*/


/*mob
	proc
		Save() // This is the proc that saves the player
			if(src.Savable==1)
				var/savefile/F = new("Save/[src.ckey]") // This creates a new file called your key.sav in the file Save
				F["last_x"] << src.x// This stuff saves the players location
				F["last_y"] << src.y
				F["last_z"] << src.z
				Write(F) // This Writes the file

		AutoSave()
			Save()
			spawn(3000)
			AutoSave()

		Load()
			if(fexists("Save/[src.ckey]")) // This checks if they player has a savfile
				var/savefile/F = new("Save/[src.ckey]")
				Read(F) // This reads the file!
				F["last_x"] >> src.x
				F["last_y"] >> src.y
				F["last_z"] >> src.z
			else
				alert("You do not have any characters on this server.")
				usr.Start()*/