mob/var/tmp/mob/MindTransfer
mob/var/tmp/mob/MindAfflicted=0
obj/Ninjutsu/Shintenshin
	icon='Skillcard.dmi'
	icon_state="PLACEHOLDER"
	Click()
		if(src in usr.contents)
			if(!usr.Yamanaka)
				return
			if(!usr.MindTransfer)
				if(usr.Chakra<90)
					return
				if(prob(25/skill/skill/skill))
					if(skill>5)
						return
					skill+=1
				var/list/Mobs=list()
				for(var/mob/M in orange(10))
					if(M.client) Mobs+=M
				if(!Mobs.len)
					usr<<output("<font size = -3>No available targets!","outputic.output")
					return
				var/mob/Target=input("Who do you wish to mind transfer with?","Transfer Mind") in Mobs
				if(!Target) return
				if(usr.Ninjutsu < Target.Ninjutsu*1.25)
					usr<<output("<font size = -3>[Target] is able to resist your mind heist!","outputic.output")
					usr<<output("<font size = -3>[Target] is able to resist your mind heist!","outputall.output")
					Target<<output("<font size = -3>You feel someone attempt to probe your mind, but you are able to resist!","outputic.output")
					Target<<output("<font size = -3>You feel someone attempt to probe your mind, but you are able to resist!","outputall.output")
					return
				usr.MindTransfer=Target
				Target.MindAfflicted=usr
				usr.Chakra-=90
				usr.client.eye=Target
				usr.client.perspective=EYE_PERSPECTIVE
				usr.<<output("<font size = -3>You slowly feel your mind leak into [Target]'s consciousness.","outputic.output")
				usr.<<output("<font size = -3>You slowly feel your mind leak into [Target]'s consciousness.","outputall.output")
				return
			if(usr.MindTransfer)
				usr.MindTransfer<<output("<font size = -3>You slowly feel the presence fade from your mind, and you regain control.","outputic.output")
				usr.MindTransfer<<output("<font size = -3>You slowly feel the presence fade from your mind, and you regain control.","outputall.output")
				usr.MindTransfer.MindAfflicted=usr
				usr.MindTransfer=null
				usr.client.eye=usr
				usr.client.perspective=EYE_PERSPECTIVE
				return