mob/var
	learning=0
	teaching=0

mob/verb
	Learning_Mode()
		set name="Learn"
		set category="Commands"
		set hidden=1
	/*	if(!src.learning)
			if(RecentVerbCheck("Learn", 120,1)) return
			recentverbs["Learn"]=world.realtime
			src<<output("You have activated learning mode. Use this with a partner when utilizing techniques in tandum with teaching mode!","outputic.output")
			src.learning=1
			Learning()
			src.ChatLog("<font color=blue>*[src.name]([src.key]) has activated Learning Mode*")
		else
			src << "You are no longer attempting to learn from those around you."
			src.learning=0
			src.ChatLog("<font color=blue>*[src.name]([src.key]) has Deactivated Learning Mode*")
*/
mob/verb
	Teaching_Mode()
		set name="Teach"
		set category="Commands"
		set hidden=1
	/*	if(!src.teaching)
			if(RecentVerbCheck("Teach", 120,1)) return
			recentverbs["Teach"]=world.realtime
			src << output("You are now instructing those around you.","outputic.output")
			src.ChatLog("<font color=blue>*[src.name]([src.key]) has activated Teaching Mode*")
			src.teaching=1
		else
			src << output("You are no longer instructing those around you.","outputic.output")
			src.ChatLog("<font color=blue>*[src.name]([src.key]) has deactivated Teaching Mode*")
			src.teaching=0*/

