obj/var/screentext

mob
	var/tmp
		jutsu_box/jutsu_box

	verb
		jutsu_box()
			set hidden = 1
			if(!jutsu_box)
				jutsu_box = new(src)
				jutsu_box.display_interface(contents)
				jutsu_box.show()
			else
				if(jutsu_box.visible)
					jutsu_box.hide()
				else
					jutsu_box.show()

			jutsu_box.center(src)

jutsu_back_button
	parent_type = /HudObject
	layer = 100000000

	mouse_over_pointer = MOUSE_HAND_POINTER

	Click()
		usr.jutsu_box.backwardspage(usr)

	MouseEntered()
		icon_state = "left2"

	MouseExited()
		icon_state = "left1"

jutsu_forwards_button
	parent_type = /HudObject
	layer = 100000000

	mouse_over_pointer = MOUSE_HAND_POINTER

	Click()
		usr.jutsu_box.forwardspage(usr)

	MouseEntered()
		icon_state = "right2"

	MouseExited()
		icon_state = "right1"

perk_box
	parent_type = /HudObject
	layer = 101000000
	icon_state = "card1"
	var/obj/reference

	New()
		..()
		underlays += 'Box.dmi'

	Click()
		if(reference)
			reference.Click()
	DblClick()
		if(reference)
			reference.DblClick()
	MouseEntered()
		if(icon_state <> "card1")
			overlays = null
			overlays += 'Boxglow.dmi'

	MouseExited()
		overlays = null

perk_info_box
	parent_type = /HudObject
	layer = 101000000
	icon_state = "card1"

	proc/display_text(t)
		icon = t


jutsu_button_on
	parent_type = /HudGroup

	icon = 'Jutsubox.dmi'
	layer = 101000000

	New(mob/m)
		..()

		for(var/x = 0 to 3)
			for(var/y = 0 to 1)
				var/px = x * 32 + 0
				var/py = y * 32 + 201
				add(px, py, icon_state = "ja[x],[y]")

jutsu_button_off
	parent_type = /HudGroup

	icon = 'Jutsubox.dmi'
	layer = 101000000

	New(mob/m)
		..()

		var/jutsu_button_off_image/button = new(src, 'Jutsuboxbuttons.dmi', "jutsu1")
		button.pos(0, 201)
		add(button)

	Click()
		parent:tab_switch(usr)

perk_button_on
	parent_type = /HudGroup

	icon = 'Jutsubox.dmi'
	layer = 101000000

	New(mob/m)
		..()

		for(var/x = 0 to 3)
			for(var/y = 0 to 1)
				var/px = x * 32 + 76
				var/py = y * 32 + 201
				add(px, py, icon_state = "pa[x],[y]")

perk_button_off
	parent_type = /HudGroup

	icon = 'Jutsubox.dmi'
	layer = 101000000

	New(mob/m)
		..()

		var/perk_button_off_image/button = new(src, 'Jutsuboxbuttons.dmi', "perks1")
		button.pos(77, 201)
		add(button)

	Click()
		parent:tab_switch(usr)

perk_button_off_image
	parent_type = /HudObject
	layer = 101000001

	mouse_over_pointer = MOUSE_HAND_POINTER

	MouseEntered()
		icon_state = "perks2"

	MouseExited()
		icon_state = "perks1"

jutsu_button_off_image
	parent_type = /HudObject
	layer = 101000001

	mouse_over_pointer = MOUSE_HAND_POINTER

	MouseEntered()
		icon_state = "jutsu2"

	MouseExited()
		icon_state = "jutsu1"

perk_boxes
	parent_type = /HudGroup

	icon = 'Jutsubox.dmi'
	layer = 100000000

	var/list/perk_box/perk_boxes[8]
	var/list/perk_info_box/perk_info[8]

	var/perk_info_box/pagecounter

	New(mob/m)
		..()

		var/perk_box/card = new(src, icon, "card1")
		card.pos(10, 161)
		add(card)
		perk_boxes[1] = card

		card = new(src, icon, "card1")
		card.pos(224, 161)
		add(card)
		perk_boxes[2] = card

		card = new(src, icon, "card1")
		card.pos(10, 119)
		add(card)
		perk_boxes[3] = card

		card = new(src, icon, "card1")
		card.pos(224, 119)
		add(card)
		perk_boxes[4] = card

		card = new(src, icon, "card1")
		card.pos(10, 77)
		add(card)
		perk_boxes[5] = card

		card = new(src, icon, "card1")
		card.pos(224, 77)
		add(card)
		perk_boxes[6] = card

		card = new(src, icon, "card1")
		card.pos(10, 35)
		add(card)
		perk_boxes[7] = card

		card = new(src, icon, "card1")
		card.pos(224, 35)
		add(card)
		perk_boxes[8] = card

		var/perk_info_box/card2 = new(src, 'Blank.dmi', "card1")
		card2.pos(60, 151)
		add(card2)
		perk_info[1] = card2

		card2 = new(src, 'Blank.dmi', "card1")
		card2.pos(274, 151)
		add(card2)
		perk_info[2] = card2

		card2 = new(src, 'Blank.dmi', "card1")
		card2.pos(60, 109)
		add(card2)
		perk_info[3] = card2

		card2 = new(src, 'Blank.dmi', "card1")
		card2.pos(274, 109)
		add(card2)
		perk_info[4] = card2

		card2 = new(src, 'Blank.dmi', "card1")
		card2.pos(60, 67)
		add(card2)
		perk_info[5] = card2

		card2 = new(src, 'Blank.dmi', "card1")
		card2.pos(274, 67)
		add(card2)
		perk_info[6] = card2

		card2 = new(src, 'Blank.dmi', "card1")
		card2.pos(60, 25)
		add(card2)
		perk_info[7] = card2

		card2 = new(src, 'Blank.dmi', "card1")
		card2.pos(274, 25)
		add(card2)
		perk_info[8] = card2

		pagecounter = new(src, 'Blank.dmi', "card1")
		pagecounter.pos(196, -9)
		add(pagecounter)

jutsu_box
	parent_type = /HudGroup

	icon = 'Jutsubox.dmi'
	layer = 100000000

	var/jutsu_back_button/jutsu_back_button
	var/jutsu_forwards_button/jutsu_forwards_button

	var/perk_boxes/perk_boxes

	var/jutsu_button_on/jutsu_button_on
	var/jutsu_button_off/jutsu_button_off
	var/perk_button_on/perk_button_on
	var/perk_button_off/perk_button_off

	var/total_pages = 1
	var/user_page = 1
	var/tab = 1

	New(mob/m)
		..()

		for(var/x = 0 to 13)
			for(var/y = 0 to 7)
				var/px = x * 32
				var/py = y * 32
				add(px, py, icon_state = "[x],[y]")

		jutsu_back_button = new(src, icon, "left1")
		jutsu_back_button.pos(9, 7)
		add(jutsu_back_button)

		jutsu_forwards_button = new(src, icon, "right1")
		jutsu_forwards_button.pos(406, 7)
		add(jutsu_forwards_button)

		jutsu_button_on = new(m)
		add(jutsu_button_on)

		jutsu_button_off = new(m)
		add(jutsu_button_off)

		perk_button_on = new(m)
		add(perk_button_on)

		perk_button_off = new(m)
		add(perk_button_off)

		perk_boxes = new(m)
		add(perk_boxes)

		jutsu_button_off.hide()
		perk_button_on.hide()

	show()
		..()
		if(tab)
			jutsu_button_on.show()
			jutsu_button_off.hide()
			perk_button_off.show()
			perk_button_on.hide()
		else
			jutsu_button_off.show()
			jutsu_button_on.hide()
			perk_button_on.show()
			perk_button_off.hide()

	proc/tab_switch(var/mob/user)
		if(tab)
			jutsu_button_off.show()
			jutsu_button_on.hide()
			perk_button_on.show()
			perk_button_off.hide()
		else
			jutsu_button_on.show()
			jutsu_button_off.hide()
			perk_button_off.show()
			perk_button_on.hide()
		tab = !tab
		user_page = 1
		display_interface(user.contents)

	proc/display_interface(var/list/objects)
		var/list/pages = list()
		var/i = 1
		var/page = new/list()
		for(var/obj/object in objects)
			if(!tab)
				if(!isperk(object))
					continue
			else
				if(!isjutsu(object))
					continue
			if(i < 8)
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

		total_pages = pages.len
		if(!archive.page_text["Page [user_page] of [pages.len]"])
			archive.page_text["Page [user_page] of [pages.len]"] = drawfont.QuickText(src, "Page [user_page] of [pages.len]", "#E6C208", 1, layer = 102000000)
		perk_boxes.pagecounter.display_text(archive.page_text["Page [user_page] of [pages.len]"])

	proc/display_objects(var/list/objects)
		clear_objects()
		for(var/i = 1, i < min(objects.len, 8) + 1, i++)
			var/perk_box/perk_box = perk_boxes.perk_boxes[i]
			var/perk_info_box/perk_info = perk_boxes.perk_info[i]
			var/obj/object = objects[i]
			if(!object.screentext)
				object.screentext = drawfont.QuickText(src, "[object.name]", "#E6C208", 1, layer = 102000000)
			perk_box.icon = object.icon
			perk_box.icon_state = object.icon_state
			perk_box.reference = object
			perk_info.display_text(object.screentext)

	proc/clear_objects()
		for(var/i = 1, i < min(objects.len, 8 + 1), i++)
			var/perk_box/perk_box = perk_boxes.perk_boxes[i]
			var/perk_info_box/perk_info = perk_boxes.perk_info[i]
			perk_box.icon = 'Jutsubox.dmi'
			perk_box.icon_state = "card1"
			perk_info.icon = null

	proc/forwardspage(var/mob/user)
		if(++user_page > total_pages)
			user_page--
		else
			display_interface(user.contents)

	proc/backwardspage(var/mob/user)
		if(--user_page < 1)
			user_page++
		else
			display_interface(user.contents)

	proc/isperk(var/obj/jutsu/object)
		if(!istype(object))
			return 0
		if(object.jutsu_type <> "perk")
			return 0
		return 1

	proc/isjutsu(var/obj/jutsu/object)
		if(!istype(object))
			return 0
		if(object.jutsu_type == "perk")
			return 0
		return 1

	proc/totalspace(var/list/objects)
		var/i = 0
		for(var/obj/O in objects)
			if(!tab)
				if(isperk(O)) i++
			else
				if(isjutsu(O)) i++
		return i

	proc/center(var/mob/user)
		pos((user.get_client_width() * 16) - 220, (user.get_client_height() * 16) - 115)