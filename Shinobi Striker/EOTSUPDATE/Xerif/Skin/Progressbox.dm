mob
	var/tmp
		progress_box/progress_box

	verb
		progress_box()
			set hidden = 1
			if(!progress_box)
				progress_box = new(src)
				progress_box.display_interface(progress_list, src)
				progress_box.update_bars(src)
				progress_box.show()
			else
				if(progress_box.visible)
					progress_box.hide()
				else
					progress_box.show()
			progress_box.center(src)

/var/perk_mask = null

progress_back_button
	parent_type = /HudObject
	layer = 80000000

	mouse_over_pointer = MOUSE_HAND_POINTER

	Click()
		usr.progress_box.backwardspage(usr)

	MouseEntered()
		icon_state = "left2"

	MouseExited()
		icon_state = "left1"

progress_forwards_button
	parent_type = /HudObject
	layer = 80000000

	mouse_over_pointer = MOUSE_HAND_POINTER

	Click()
		usr.progress_box.forwardspage(usr)

	MouseEntered()
		icon_state = "right2"

	MouseExited()
		icon_state = "right1"

progress_card_box
	parent_type = /HudObject
	layer = 81000000
	icon_state = "card1"
	var/obj/reference

	New()
		..()
		underlays += 'Box.dmi'

	MouseEntered()
		if(icon_state <> "card1")
			overlays = null
			overlays += 'Boxglow.dmi'

	MouseExited()
		overlays = null

	Click()
		if(reference)
			reference.Click()

	DblClick()
		if(reference)
			reference.DblClick()

progress_info_box
	parent_type = /HudObject
	layer = 81000000
	icon_state = "card1"

	proc/display_text(t)
		icon = t

progress_boxes
	parent_type = /HudGroup

	icon = 'Jutsubox.dmi'
	layer = 80000000

	var/list/progress_card_box/perk_boxes[3]
	var/list/progress_info_box/perk_info[3]

	var/progress_info_box/pagecounter

	New(mob/m)
		..()

		var/progress_card_box/card = new(src, icon, "card1")
		card.pos(10, 118)
		add(card)
		perk_boxes[1] = card

		card = new(src, icon, "card1")
		card.pos(10, 77)
		add(card)
		perk_boxes[2] = card

		card = new(src, icon, "card1")
		card.pos(10, 36)
		add(card)
		perk_boxes[3] = card

		var/progress_info_box/card2 = new(src, 'Blank.dmi', "card1")
		card2.pos(61, 109)
		add(card2)
		perk_info[1] = card2

		card2 = new(src, 'Blank.dmi', "card1")
		card2.pos(61, 68)
		add(card2)
		perk_info[2] = card2

		card2 = new(src, 'Blank.dmi', "card1")
		card2.pos(61, 27)
		add(card2)
		perk_info[3] = card2

		pagecounter = new(src, 'Blank.dmi', "card1")
		pagecounter.pos(85, -8)
		add(pagecounter)

progress_box
	parent_type = /HudGroup

	icon = 'Progressbox.dmi'
	layer = 80000000

	var/progress_back_button/progress_back_button
	var/progress_forwards_button/progress_forwards_button

	var/progress_boxes/progress_boxes

	var/progress_card_box/progress_current_card
	var/progress_info_box/progress_current_info

	var/bar/progress_bar

	var/total_pages = 1
	var/user_page = 1

	New(mob/m)
		..()

		for(var/x = 0 to 7)
			for(var/y = 0 to 7)
				var/px = x * 32
				var/py = y * 32
				add(px, py, icon_state = "[x],[y]")

		progress_back_button = new(src, 'Jutsubox.dmi', "left1")
		progress_back_button.pos(9, 8)
		add(progress_back_button)

		progress_forwards_button = new(src, 'Jutsubox.dmi', "right1")
		progress_forwards_button.pos(198, 8)
		add(progress_forwards_button)

		progress_current_card = new(src, icon, "card1")
		progress_current_card.pos(10, 175)
		add(progress_current_card)

		progress_current_info = new(src, 'Blank.dmi', "card1")
		progress_current_info.pos(61, 166)
		add(progress_current_info)

		progress_bar = new(src, 'Barprogress2.dmi', "0")
		progress_bar.pos(8, 157)
		add(progress_bar)

		progress_boxes = new(m)
		add(progress_boxes)

	proc/display_interface(var/list/objects, var/mob/user)
		var/list/pages = list()
		var/i = 1
		var/page = new/list()
		for(var/obj/progress_card/object in objects - user.progress_target)
			if(i < 3)
				if(!page)
					page = new/list()
				page += object
				i++
			else
				page += object
				pages += list(page)
				page = null
				i = 1
		if(page) pages += list(page)
		if(user_page > pages.len) user_page = 1
		display_objects(pages[user_page])

		if(user.progress_target)
			var/obj/progress_card/object = user.progress_target
			if(!object.hidden)
				if(!object.screentext)
					object.screentext = drawfont.QuickText(src, "[object.name]", "#E6C208", 1, layer = 102000000)
				progress_current_card.icon = object.icon
				progress_current_card.icon_state = object.icon_state
				progress_current_card.reference = object
				progress_current_info.display_text(object.screentext)
			else
				if(!perk_mask)
					perk_mask = drawfont.QuickText(src, "Natural Trait (Hidden)", "#E6C208", 1, layer = 102000000)
				progress_current_card.icon = 'Perkmask.dmi'
				progress_current_card.icon_state = "hidden"
				progress_current_card.reference = object
				progress_current_info.display_text(perk_mask)
		else
			progress_current_card.icon = null
			progress_current_card.icon_state = null
			progress_current_card.reference = null
			progress_current_info.display_text(null)

		total_pages = pages.len
		if(!archive.page_text["Page [user_page] of [pages.len]"])
			archive.page_text["Page [user_page] of [pages.len]"] = drawfont.QuickText(src, "Page [user_page] of [pages.len]", "#E6C208", 1, layer = 102000000)
		progress_boxes.pagecounter.display_text(archive.page_text["Page [user_page] of [pages.len]"])

	proc/display_objects(var/list/objects)
		clear_objects()
		for(var/i = 1, i < min(objects.len, 3) + 1, i++)
			var/progress_card_box/perk_box = progress_boxes.perk_boxes[i]
			var/progress_info_box/perk_info = progress_boxes.perk_info[i]
			var/obj/progress_card/object = objects[i]
			if(!object.hidden)
				if(!object.screentext)
					object.screentext = drawfont.QuickText(src, "[object.name]", "#E6C208", 1, layer = 102000000)
				perk_box.icon = object.icon
				perk_box.icon_state = object.icon_state
				perk_box.reference = object
				perk_info.display_text(object.screentext)
			else
				if(!perk_mask)
					perk_mask = drawfont.QuickText(src, "Natural Trait (Hidden)", "#E6C208", 1, layer = 102000000)
				perk_box.icon = 'Perkmask.dmi'
				perk_box.reference = object
				perk_box.icon_state = "hidden"
				perk_info.display_text(perk_mask)

	proc/clear_objects()
		for(var/i = 1, i < min(objects.len, 3 + 1), i++)
			var/perk_box/perk_box = progress_boxes.perk_boxes[i]
			var/perk_info_box/perk_info = progress_boxes.perk_info[i]
			perk_box.icon = 'Jutsubox.dmi'
			perk_box.icon_state = "card1"
			perk_info.icon = null

	proc/forwardspage(var/mob/user)
		if(++user_page > total_pages)
			user_page--
		else
			var/list/l = list()
			for(var/obj/progress_card/c in user)
				l += c
			display_interface(user.progress_list, user)

	proc/backwardspage(var/mob/user)
		if(--user_page < 1)
			user_page++
		else
			display_interface(user.progress_list, user)

	proc/totalspace(var/list/objects)
		var/i = 0
		for(var/obj/O in objects)
			i++
		return i

	proc/set_progress(num)
		if(num >= 100)
			progress_bar.icon_state = "20"
		else
			progress_bar.icon_state = "[max(round(num/5), 0)]"


	proc/update_bars(var/mob/user)
		if(user.progress_target)
			if(user.progress_target.learn_progress/max(user.progress_target.learn_req, 1) < ((user.control + user.control_boost())/max(user.progress_target.control_req, 1)))
				progress_bar.icon = 'Barprogress2.dmi'
				if(user.progress_target.learning_from)
					if(user.progress_target.learning_from == "SCROLL")
						progress_bar.icon = 'Barprogress3.dmi'
						for(var/obj/items/jutsu_scroll/scroll in user)
							if(scroll.source == user.progress_target.name)
								progress_bar.icon = 'Barprogress2.dmi'
					else if(!(user.teacher_activity && user.progress_activity))
						progress_bar.icon = 'Barprogress3.dmi'
			else
				progress_bar.icon = 'Barprogress4.dmi'

			set_progress(round((user.progress_target.learn_progress/max(user.progress_target.learn_req, 1))*100))
		else
			set_progress(0)


/*	proc/update_bars(var/mob/user)
		if(user.progress_target)
			set_progress(round((user.progress_target.learn_progress/user.progress_target.learn_req)*100))
		else
			set_progress(0)
*/
	proc/center(var/mob/user)
		if(!user.client) return
		var/size = winget(user, "mappane", "size")
		if(!user.client) return
		var/width = text2num(copytext(size, 1, findtext(size, "x", 1, length(size) + 1)))
		var/height = text2num(copytext(size, findtext(size, "x", 1, length(size) + 1) + 1, length(size) + 1))

		var/cwidth = user.get_client_width() * 32
		var/cheight = user.get_client_height() * 32

		var/i = round((cwidth - width) * 0.5)
		var/j = round((cheight - height) * 0.5)

		pos(cwidth - 228 - i + 2, user.get_client_height() * 32 - 239 - j + 1)