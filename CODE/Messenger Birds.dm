obj/Owl
	icon = 'bird.dmi'
	name = "Bird Stand"
	icon_state = "bird stand"
	var/image/I
	density = 1
	Click()
		if(get_dist(src,usr)>2) return
		var/mob/M = input("It costs 30 Ryo to send a message to someone. Who would you like to send a message to?","Send a Message") in usr.listOfKnownStrangers()+"Cancel"

		if(name=="Cancel") return
		if(usr.Dead) return
		var/list/scrolls = list()
		for(var/obj/items/Scrolls/S in usr)
			scrolls+=S
		var/obj/S = input("What do you want to send?:") as null|anything in scrolls
		if(!S)
			usr << output("You have no scrolls to send!", "outputall.output")
			return
		if(!M || !S) return
		for(var/obj/items/Ryo/R in usr.contents)
			if(R.amount>=30)
				R.amount-=30
				R.Update()
				break
			else
				usr << output("It costs 30 Ryo to send a message!", "outputall.output")
				return

		for(var/mob/person in view(15))
			person << output("[person.getStrangerName(usr)] uses the messenger birds.", "outputall.output")


		for(var/mob/admn in world)
			if(admn.Admin)
				admn << "[usr] just sent a letter to [M]"

		var/mob/F = new/mob
		F.speeddelay = 1
		I = image('bird.dmi', F ,"bird",9000)
		for(var/mob/watcher in view(15,M))
			watcher << I
		F.loc = locate(M.x,M.y + 7, M.z)
		walk_to(F, M,0)
		S.loc = null
		sleep(12)
		S.Move(M)
		del(F.chakraOverlay)
		del(F)

		for(var/mob/hearer in hearers(15, M))
			if(hearer.MindTransfer) if(hearer == hearer.MindTransfer.MindAfflicted) continue
			if(hearer.MindAfflicted)
				hearer.MindAfflicted << output("<font color=[M.SayFont]>A small messenger bird flutters in and lands on [hearer.MindAfflicted.getStrangerName(M)]'s shoulder.", "outputall.output")
			else
				hearer << output("<font color=[M.SayFont]>A small messenger bird flutters in and lands on [hearer.getStrangerName(M)]'s shoulder.", "outputall.output")