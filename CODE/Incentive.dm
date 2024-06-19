/*/mob/proc/incentive_system()
	return
	if(archive.incentive_villages)
		if(archive.incentive_villages.Find(Village))
			Class = "Genin"
			new/obj/items/Clothing/Headband(src)

			var/bonus = Age >= 14 ? archive.incentive_large_bonus : archive.incentive_small_bonus

			progress_points += bonus
			lifetime_progress_points += bonus
			stat_points += bonus

			src << output("You've been rewarded [bonus] point(s) and genin rank as part of an incentive.", "outputall.output")

			if(character_box)
				character_box.update_stats(src)*/