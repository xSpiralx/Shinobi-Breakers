mob/var/list/CompletedTasks = list()
mob/var/GeninTasksAssigned = 0

mob/proc
	// Proc to create initial tasks
	creation_tasks()
		var/task
			acad = new
			basic = new
			genin = new

		acad.name = "Become an academy student (+2 points)"
		acad.reward_value = 2

		basic.name = "Learn a basic technique (+3 points)"
		basic.reward_value = 3

		genin.name = "Pass the genin exams (+5 points)"
		genin.reward_value = 5

		src.contents += acad
		src.contents += basic
		src.contents += genin

	// Check if a task is completed
	check_task_completion(task/T)
		if(T in src.contents)
			if(T.name == "Become an academy student (+2 points)" && src.Class == "Student")
				src.progress_points += T.reward_value
				src.lifetime_progress_points += T.reward_value
				src.stat_points += T.reward_value
				src << output("You have completed " + T.name, "outputall.output")
				src << output("You've been rewarded " + T.reward_value + " point(s).", "outputall.output")
				src.CompletedTasks += T
				src.contents -= T
			else if(T.name == "Pass the genin exams (+5 points)" && src.Class == "Genin")
				src.progress_points += T.reward_value
				src.lifetime_progress_points += T.reward_value
				src.stat_points += T.reward_value
				src << output("You have completed " + T.name, "outputall.output")
				src << output("You've been rewarded " + T.reward_value + " point(s).", "outputall.output")
				src.CompletedTasks += T
				src.contents -= T
			else if(T.name == "Learn a C-rank technique (+5 points)")
				for(var/obj/jutsu/o in src.contents)
					if(o.jutsu_rank == "C-rank")
						src.progress_points += T.reward_value
						src.lifetime_progress_points += T.reward_value
						src.stat_points += T.reward_value
						src << output("You have completed " + T.name, "outputall.output")
						src << output("You've been rewarded " + T.reward_value + " point(s).", "outputall.output")
						src.CompletedTasks += T
						src.contents -= T
			else if(T.name == "Learn a basic technique (+3 points)")
				for(var/obj/jutsu/o in src.contents)
					if(o.jutsu_rank == "E-rank")
						src.progress_points += T.reward_value
						src.lifetime_progress_points += T.reward_value
						src.stat_points += T.reward_value
						src << output("You have completed " + T.name, "outputall.output")
						src << output("You've been rewarded " + T.reward_value + " point(s).", "outputall.output")
						src.CompletedTasks += T
						src.contents -= T
						break

	// Assign New Tasks Based on Rank
	assign_tasks()
		if(src.Class == "Genin" && src.GeninTasksAssigned == 0)
			var/task
				Chunin = new
				cranktech = new
				//crankmission = new

			cranktech.name = "Learn a C-rank technique (+5 points)"
			cranktech.reward_value = 5

			Chunin.name = "Pass the chunin exams (+10 points)"
			Chunin.reward_value = 10

			/*crankmission.name = "Complete a C-Rank Mission"
			crankmission.reward_value = 1*/

			src.contents += cranktech
			src.contents += Chunin
			//src.contents += crankmission
			src.GeninTasksAssigned = 1

// The task!
task
	parent_type = /obj
	var
		reward_value = 0

	Click()
		usr.check_task_completion(src)

mob/verb/ViewTasks()
	winset(usr, "TasksList.grid", "cells=0x0")
	winset(src, "mainscreen.childtabpanes", "right=TasksList")
	var/row = 0
	for(var/task/t in usr.contents)
		row++
		usr << output(t.name, "TasksList.grid:1,[row]")