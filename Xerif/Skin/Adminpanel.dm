mob/Admin4
	verb
		Admin_Panel()
			set category = "Admin"
			winshow(src, "adminpanel", 1)
			beep()

		adminpanel_close()
			set hidden = 1
			beep()
			winshow(src, "adminpanel", 0)