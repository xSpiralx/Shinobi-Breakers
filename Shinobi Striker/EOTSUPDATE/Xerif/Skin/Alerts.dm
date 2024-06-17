
mob
	verb
		login_box()
			set hidden = 1

			if(!client) return

			var/pos = winget(src, "default.screenlabel", "size")
			var/xx = text2num(copytext(pos, 1, findtext(pos, "x", 1, length(pos) + 1)))
			var/yy = text2num(copytext(pos, findtext(pos, "x", 1, length(pos) + 1) + 1, length(pos) + 1))

			var/pos1 = winget(src, "default", "pos")
			//var/xx1 = text2num(copytext(pos1, 1, findtext(pos1, ",", 1, length(pos1) + 1)))
			var/yy1 = text2num(copytext(pos1, findtext(pos1, ",", 1, length(pos1) + 1) + 1, length(pos1) + 1))

			winset(src, "welcome", "pos=[(xx/2) - 210],[yy1 + (yy/2) - 360]")

			src << browse_rsc('loginbackground.png')
			src << output(archive.login_screen, "welcome.browser")
			winshow(src, "welcome", 1)

		login_close()
			set hidden = 1
			if(!client) return
			winshow(src, "welcome", 0)
			beep()

		alert_close()
			set hidden = 1
			alert_clicked = 1
			beep()

		input_close()
			set hidden = 1
			alert_answer = winget(src, "alert4.input", "text")
			beep()

		alert_yes()
			set hidden = 1
			alert_answer = "yes"
			beep()

		alert_no()
			set hidden = 1
			alert_answer = "no"
			beep()

	proc

		get_header(msg, big = 0)
			if(!big)
				switch(msg)
					if("Stranger description?")
						return "https://i.postimg.cc/qqkmKrcj/Stranger-Description.png"
					if("Alert")
						return "https://i.postimg.cc/9fQPMNYH/Alert.png"
					if("Please select an option")
						return "https://i.postimg.cc/4yKDLVhc/header-2.png"
					if("Which clan do you belong to?")
						return "https://i.postimg.cc/SRgxkF7q/header-3.png"
					if("Which village do you belong to?")
						return "https://i.postimg.cc/4yKDLVhc/header-2.png"
					if("Custom clan selection")
						return "https://i.postimg.cc/D09f7w7k/header-4.png"
					if("What will your family name be?")
						return "https://i.postimg.cc/j2nqh642/What-will-your-family-name-be.png"
					if("Please enter your Age from 10-61")
						return "https://i.postimg.cc/44zs0MDd/unknown-1.png"
					if("What will your name be?")
						return "https://i.postimg.cc/RFwNcMPX/header-5.png"
			else
				switch(msg)
					if("Would you like to be born as a member of the Uchiha clan?")
						return "https://i.postimg.cc/yxX1SKpT/Would-you-like-to-be-born-as-a-member-of-the-Uch.png"
					if("Would you like to be born as a member of the Hyuuga clan?")
						return "https://i.postimg.cc/9XYb04hP/Would-you-like-to-be-born-as-a-member-of-the-Hyu.png"
					if("Would you like to be born as a member of the Inuzuka clan?")
						return "https://i.postimg.cc/4yzb1c0q/Would-you-like-to-be-born-as-a-member-of-the-Inu.png"
					if("Would you like to be born as a member of the Aburame clan?")
						return "https://i.postimg.cc/66hsK5bg/Would-you-like-to-be-born-as-a-member-of-the-Abu.png"
					if("Would you like to be born as a member of the Akimichi clan?")
						return "https://i.postimg.cc/wMfh1rcc/big-header-2.png"
					if("Would you like to be born as a member of the Senju clan?")
						return "https://i.postimg.cc/65QW0R9x/Would-you-like-to-be-born-as-a-member-of-the-Sen.png"
					if("Would you like to be born as a member of the Nara clan?")
						return "https://i.postimg.cc/Ghtvp3Bd/big-header-4.png"
					if("Would you like to be born as a member of the Hozuki clan?")
						return "https://i.postimg.cc/ydxFvCrZ/Would-you-like-to-be-born-as-a-member-of-the-Hoz.png"
					if("Would you like to be born as a member of the Kaguya clan?")
						return "https://i.postimg.cc/Gtx1MQCP/Would-you-like-to-be-born-as-a-member-of-the-Kag.png"
					if("Would you like to be born as a member of the Yuki clan?")
						return "https://i.imgur.com/9sI5Omh.png"
					if("Would you like to be born as a member of the Yotsuki clan?")
						return "https://i.imgur.com/jc9HT45.png"
					if("Would you like to be born as a member of the Hoshigaki clan?")
						return "https://static1.cbrimages.com/wordpress/wp-content/uploads/2021/09/Kisame-Hoshigaki-prepares-to-fight.jpg"
					if("Would you like to be born as a member of the Uzumaki clan?")
						return "https://static.wikia.nocookie.net/naruto/images/6/6f/Ashina_Uzumaki_Anime.png/revision/latest?cb=20120202162334&path-prefix=es"
					if("Would you like to be born as a member of the Iron Stronghold?")
						return "https://static.wikia.nocookie.net/naruto/images/1/13/Samurai_Sabre_Technique.png/revision/latest/scale-to-width-down/713?cb=20140813081538"

		custom_alert_html(msg, title = "Alert")
			if(!src.client) return

			var/pos = winget(src, "default.screenlabel", "size")
			var/xx = text2num(copytext(pos, 1, findtext(pos, "x", 1, length(pos) + 1)))
			var/yy = text2num(copytext(pos, findtext(pos, "x", 1, length(pos) + 1) + 1, length(pos) + 1))

			var/pos1 = winget(src, "default", "pos")
			var/xx1 = text2num(copytext(pos1, 1, findtext(pos1, ",", 1, length(pos1) + 1)))
			var/yy1 = text2num(copytext(pos1, findtext(pos1, ",", 1, length(pos1) + 1) + 1, length(pos1) + 1))

			winset(src, "alert_html", "pos=[(xx/2) - 115 + xx1],[yy1 + (yy/2) - 60]")

			src << output("[skin_tab["html"]]<img src=[get_header(title)]></body><html>", "alert_html.header")



			//winset(src, "alert_html", "size=227x[round(11 * ((length(msg) * 5) / 192) ) + 100]")
			src << output(null,"alert_html.text")
			src << output(msg, "alert_html.text")
			winshow(src, "alert_html", 1)
			alert_clicked = 0
			while(!alert_clicked)
				sleep(1)
			winshow(src, "alert_html", 0)
		custom_alert(msg, title = "Alert")
			if(!src.client) return

			var/pos = winget(src, "default.screenlabel", "size")
			var/xx = text2num(copytext(pos, 1, findtext(pos, "x", 1, length(pos) + 1)))
			var/yy = text2num(copytext(pos, findtext(pos, "x", 1, length(pos) + 1) + 1, length(pos) + 1))

			var/pos1 = winget(src, "default", "pos")
			var/xx1 = text2num(copytext(pos1, 1, findtext(pos1, ",", 1, length(pos1) + 1)))
			var/yy1 = text2num(copytext(pos1, findtext(pos1, ",", 1, length(pos1) + 1) + 1, length(pos1) + 1))

			winset(src, "alert", "pos=[(xx/2) - 115 + xx1],[yy1 + (yy/2) - 60]")

			src << output("[skin_tab["html"]]<img src=[get_header(title)]></body><html>", "alert.header")



			winset(src, "alert", "size=227x[round(11 * ((length(msg) * 5) / 192) ) + 100]")

			src << output(msg, "alert.text")
			winshow(src, "alert", 1)
			alert_clicked = 0
			while(!alert_clicked)
				sleep(1)
			winshow(src, "alert", 0)

		custom_alert2(msg, title = "Alert")
			if(!src.client) return

			var/pos = winget(src, "default.screenlabel", "size")
			var/xx = text2num(copytext(pos, 1, findtext(pos, "x", 1, length(pos) + 1)))
			var/yy = text2num(copytext(pos, findtext(pos, "x", 1, length(pos) + 1) + 1, length(pos) + 1))

			var/pos1 = winget(src, "default", "pos")
			var/xx1 = text2num(copytext(pos1, 1, findtext(pos1, ",", 1, length(pos1) + 1)))
			var/yy1 = text2num(copytext(pos1, findtext(pos1, ",", 1, length(pos1) + 1) + 1, length(pos1) + 1))

			src << output("[skin_tab["html"]]<img src=[get_header(title)]></body><html>", "alert2.header")

			winset(src, "alert2", "pos=[(xx/2) - 115 + xx1],[yy1 + (yy/2) - 60]")

			winset(src, "alert2", "size=227x[round(11 * ((length(msg) * 5) / 192) ) + 100]")

			src << output(msg, "alert2.text")
			winshow(src, "alert2", 1)
			alert_answer = null
			while(!alert_answer)
				sleep(1)
			winshow(src, "alert2", 0)
			return alert_answer

		custom_alert3(var/list/grid_list, title = "Alert")
			if(!src.client) return
			var/pos = winget(src, "default.screenlabel", "size")
			var/xx = text2num(copytext(pos, 1, findtext(pos, "x", 1, length(pos) + 1)))
			var/yy = text2num(copytext(pos, findtext(pos, "x", 1, length(pos) + 1) + 1, length(pos) + 1))

			var/pos1 = winget(src, "default", "pos")
			var/xx1 = text2num(copytext(pos1, 1, findtext(pos1, ",", 1, length(pos1) + 1)))
			var/yy1 = text2num(copytext(pos1, findtext(pos1, ",", 1, length(pos1) + 1) + 1, length(pos1) + 1))

			src << output("[skin_tab["html"]]<img src=[get_header(title)]></body><html>", "alert3.header")

			winset(src, "alert3", "pos=[(xx/2) - 115 + xx1],[yy1 + (yy/2) - 60]")

			winset(src, "alert3", "size=227x[min((20 * grid_list.len) + 60, 350)]")
			winset(src, "alert3.grid", "cells=1x[grid_list.len]")
			winset(usr, "alert3.grid", {"style="body {color:#FFFDCA;}""})
			var/row = 1

			for(var/t in grid_list)
				var/obj/grid_object/g = new(src)
				g.name = t
				g.real_name = t
				g.row = row
				src << output(g, "alert3.grid:[row]")
				row++

			winshow(src, "alert3", 1)
			alert_answer = null
			while(!alert_answer)
				sleep(1)
			for(var/obj/grid_object/g in src)
				del(g)
			winshow(src, "alert3", 0)
			return alert_answer

		custom_alert4(title = "Alert")
			if(!src.client) return
			var/pos = winget(src, "default.screenlabel", "size")
			var/xx = text2num(copytext(pos, 1, findtext(pos, "x", 1, length(pos) + 1)))
			var/yy = text2num(copytext(pos, findtext(pos, "x", 1, length(pos) + 1) + 1, length(pos) + 1))

			var/pos1 = winget(src, "default", "pos")
			var/xx1 = text2num(copytext(pos1, 1, findtext(pos1, ",", 1, length(pos1) + 1)))
			var/yy1 = text2num(copytext(pos1, findtext(pos1, ",", 1, length(pos1) + 1) + 1, length(pos1) + 1))

			src << output("[skin_tab["html"]]<img src=[get_header(title)]></body><html>", "alert4.header")

			winset(src, "alert4.input", "text=''")

			winset(src, "alert4", "pos=[(xx/2) - 150 + xx1],[yy1 + (yy/2) - 60]")

			winshow(src, "alert4", 1)
			alert_answer = null
			while(!alert_answer)
				sleep(1)
			winshow(src, "alert4", 0)
			return alert_answer

		custom_bigalert1(msg, msg2, file, title = "Alert")
			if(!src.client) return

			var/pos = winget(src, "default.screenlabel", "size")
			var/xx = text2num(copytext(pos, 1, findtext(pos, "x", 1, length(pos) + 1)))
			var/yy = text2num(copytext(pos, findtext(pos, "x", 1, length(pos) + 1) + 1, length(pos) + 1))

			var/pos1 = winget(src, "default", "pos")
			var/xx1 = text2num(copytext(pos1, 1, findtext(pos1, ",", 1, length(pos1) + 1)))
			var/yy1 = text2num(copytext(pos1, findtext(pos1, ",", 1, length(pos1) + 1) + 1, length(pos1) + 1))

			src << output("[skin_tab["html"]]<img src=[get_header(title, 1)]></body><html>", "bigalert1.header")

			winset(src, "bigalert1", "pos=[(xx/2) - 268 + xx1],[yy1 + (yy/2) - 165]")

			//winset(src, "bigalert1", "size=536x[round(11 * ((length(msg) * 5) / 500) ) + 100]")

			src << output("[msg]", "bigalert1.text")
			src << output("[msg2]", "bigalert1.text2")

			winset(src, "bigalert1.picture", "image='[file]'")

			winshow(src, "bigalert1", 1)
			alert_answer = null
			while(!alert_answer)
				sleep(1)
			winshow(src, "bigalert1", 0)
			return alert_answer

	var
		tmp/alert_answer
		tmp/alert_clicked
		tmp/alert_selected
		tmp/list/obj/grid_object/grid_objects = list()

/obj/grid_object
	mouse_over_pointer = MOUSE_HAND_POINTER
	var/real_name
	var/row

	MouseEntered()
		winset(usr, "alert3.grid", {"style="body {color:#E9C80D;}""})
		usr << output(src, "alert3.grid:1,[row]")

	MouseExited()
		winset(usr, "alert3.grid", {"style="body {color:#FFFDCA;}""})
		usr << output(src, "alert3.grid:1,[row]")

	Click()
		mouse_over_pointer = MOUSE_INACTIVE_POINTER
		usr.alert_answer = real_name
		usr.beep()
