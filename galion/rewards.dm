
past_reward
	var
		date_delivered = null
		list/marks = list()

reward_mark
	parent_type = /obj
	var
		mark_level = null //CoD or CoI or FP
		day = null
		mark_no = 0		//Which mark number is this? How many marks has the person received up to this one?
		reward_no = 0	//Which reward does this belong to. How many rewards has the person gained up until now?
		list/comments = list()

	New(delete = 1)
		..()
		if(delete) del src

mob
	var
		last_logcheck = null

		lc_cooldown
		daily_lc = 0
		lc_reward_counter = 0

		karma = 0
		lifetime_karma = 0

		last_mark = 0 // time2text(world.realtime, "MMM DD") -- people can only be marked once a day.

		list/reward_marks = list()
		list/past_rewards = list()

		reward_no




	proc
		GetTodaysMark()
			var reward_mark/r
			if(!reward_marks.len)
				r = new(0)

				r.day = time2text(world.realtime, "MMM DD")

				r.reward_no = past_rewards.len + 1
				for(var/past_reward/p in past_rewards)
					r.mark_no += p.marks.len

				reward_marks += r

			else
				r = reward_marks[reward_marks.len]
				if(r.day != time2text(world.realtime, "MMM DD"))

					r = new(0)
					r.day = time2text(world.realtime, "MMM DD")
					r.reward_no = past_rewards.len + 1
					for(var/past_reward/p in past_rewards)
						r.mark_no += p.marks.len
					reward_marks += r

			return r


		GetTMComments()
			var reward_mark/r = GetTodaysMark()
			var message
			if(!r.comments.len)
				message = "No Comments. (If this mark is worth anything right now, please remove that."
			else
				for(var/c in r.comments) message += "[c]<br><br>"
			//output

		GetCoDMarks()

		GetCoIMarks()

		GetFPMarks()

		AccumulateRewardPointsWorth()


	//	GetRewardReadyPlayers() //returns a list of players who meet the reward critea.
	//		for(var/mob/m in world) if(m.client)


	Admin3
		//verb
		//	Reward(var/mob/m in world) //Players can't receive more then 1 check bonus per day.
		//		if(time2text(world.realtime, "MMM DD") != last_reward)
			//		switch(input("





//		cod_marks = 0
//		lifetime_cod = 0

//		coi_marks = 0
//		lifetime_coi = 0