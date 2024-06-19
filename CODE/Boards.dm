var/list/globalMessages=list()
var/list/unapprovedGlobal=list()
var/list/deniedGlobal=list()
mob/var/tmp/activeEntry=0
proc/
	saveBoards()
		var/list/boards = list()
		var/savefile/F =new("Saga/Boards.sav")
		for(var/obj/MessageBoard/O in world)
			if(O.messages.len)
				boards["[O.x],[O.y],[O.z]"]=O.messages
		F["globalboard"]<<globalMessages
		F["boards"]<<boards
	loadBoards()
		if(fexists("Saga/Map.sav"))
			var/savefile/F =new("Saga/Boards.sav")
			var/list/boards = list()
			F["boards"]>>boards
			for(var/obj/MessageBoard/O in world)
				if(boards.Find("[O.x],[O.y],[O.z]"))
					O.messages=boards["[O.x],[O.y],[O.z]"]

			F["globalboard"]>>globalMessages









atom/Topic(href,href_list[])
	switch(href_list["action"])
		if("AddMessage")
			var/mob/M = src
			if(!M) return
			var/obj/MessageBoard/board = locate(href_list["board"])
			board.addMessage(M)
		if("RemoveMessage")
			var/mob/M = src
			if(!M) return
			var/obj/MessageBoard/board = locate(href_list["board"])
			board.removeMessage(M,text2num(href_list["entry"]))
		if("ViewMessage")
			var/mob/M = src
			if(!M) return
			var/obj/MessageBoard/board = locate(href_list["board"])
			var/entry = href_list["entry"]
			M.activeEntry = board.messages[text2num(entry)]
			board.displayMessages(M)


		if("AddMessageGlobal")
			var/mob/M = src
			if(!M) return
			var/obj/MessageBoard/board = locate(href_list["board"])
			board.addMessageGlobal(M)
		if("RemoveMessageGlobal")
			var/mob/M = src
			if(!M) return
			var/obj/MessageBoard/board = locate(href_list["board"])
			board.removeMessageGlobal(M,text2num(href_list["entry"]))
		if("ViewMessageGlobal")
			var/mob/M = src
			if(!M) return
			var/obj/MessageBoard/board = locate(href_list["board"])
			var/entry = href_list["entry"]
			M.activeEntry = globalMessages[text2num(entry)]
			board.displayMessages(M)


		if("ApproveGlobal")
			var/mob/M = src
			if(!M) return
			var/entry = href_list["entry"]
			for(var/i=1, i<=unapprovedGlobal.len,i++)
				if(md5(unapprovedGlobal[i])==entry)
					entry=unapprovedGlobal[i]
			unapprovedGlobal-=entry
			M<<"Approved."
		if("DenyGlobal")
			var/mob/M = src
			if(!M) return
			var/entry = href_list["entry"]
			for(var/i=1, i<=unapprovedGlobal.len,i++)
				if(md5(unapprovedGlobal[i])==entry)
					entry=unapprovedGlobal[i]
			unapprovedGlobal-=entry
			deniedGlobal+=entry
			M<<"Denied."

	.=..()
obj/MessageBoard
	name = "Messageboard"
	icon='BillBoard.dmi'
	icon_state="full"
	density = 1
	var/list/messages=list()
	var/village="Konohagakure"
	Click()
		displayMessages(usr)
	proc/displayMessages(mob/M)

		var/HTML={"

<style>
body {
  color:black;
  background-color:#F7F3C0;
}
hr{
  width:100%;
  position:absolute;left;
  border: none;
  height: 2px;
  color: #333;
  background-color: #333;
  margin:2px;
}
h3{
  margin:0px;
  padding:0px;
}
#contentright{
  width:75%;
  float:right;
  word-wrap:break-word;
}

#contentleft{
  width:25%;
  float:left;
}

</style>
<div id = "contentleft">
<h3>[village] Message Board <a href=?src=\ref[M];action=AddMessage;board=\ref[src]>(+)</a></h3>
<hr/><br>
<ol type="I">"}
		for(var/i=1,i<=messages.len,i++)
			if(messages[i]!=M.activeEntry)
				HTML+={"<li><a href=?src=\ref[M];action=ViewMessage;board=\ref[src];entry=[i]>[src.messages[i]]</a></li>"}
			else
				HTML+={"<li><b>[src.messages[i]]</b></li>"}
		HTML+={"</ol><br><br>
<h3>Ninja Times <a href=?src=\ref[M];action=AddMessageGlobal;board=\ref[src]>(+)</a></h3>
<hr/><br>
<ol type="I">"}
		for(var/i=1,i<=globalMessages.len,i++)
			if(globalMessages[i]!=M.activeEntry)
				HTML+={"<li><a href=?src=\ref[M];action=ViewMessageGlobal;board=\ref[src];entry=[i]>[globalMessages[i]]</a></li>"}
			else
				HTML+={"<li><b>[globalMessages[i]]</b></li>"}
		HTML+="</ol></div>"
		if(M.activeEntry)
			var/activeText=null
			var/info = null
			for(var/i=1,i<=src.messages.len,i++)
				if(messages[i]==M.activeEntry)
					activeText=i
					info = src.messages[M.activeEntry]
					if(M.Admin)
						info+="<br><br><a href=?src=\ref[M];action=RemoveMessage;board=\ref[src];entry=[activeText]>Remove</a>"
			for(var/i=1,i<=globalMessages.len,i++)
				if(globalMessages[i] == M.activeEntry)
					activeText=i
					info = globalMessages[M.activeEntry]
					if(M.Admin)
						info+="<br><br><a href=?src=\ref[M];action=RemoveMessageGlobal;board=\ref[src];entry=[activeText]>Remove</a>"
			HTML+={"
<div id = "contentright">
<br><br>
<center>
<h1><u>[M.activeEntry]</u></h1>
[info]
</center></div>"}
		M<<browse(HTML,"window=Message Board;size=640x480")
	proc/addMessage(mob/M)
		var/title = input(M,"What is the title?","Title") as text
		if(!title) return
		if(length(title)<3||length(title)>25) return
		title=html_encode(title)
		var/message = input(M,"The message content?") as message
		if(!message) return
		message = escapeHTML(message)
		messages.Insert(1,title)
		messages[title]="<i>(Published [Day][Days(Day)] of [Months(Month)], [Year+100])</i><br><br>"+message
		if(messages.len>8)
			messages-=messages[9]
		M.activeEntry=messages[1]
		displayMessages(M)
		if(alert("Confirm this submission?","Confirm","Confirm","Erase")=="Confirm")
			for(var/mob/Admin in world)
				if(Admin.Admin)
					Admin<<"[M] just posted [title] to the message board."
			return
		removeMessage(M,1)

	proc/removeMessage(mob/M,entry)
		messages -= messages[entry]
		resort()

	proc/addMessageGlobal(mob/M)
		var/title = input(M,"What is the title?","Title") as text
		if(!title) return
		if(length(title)<3||length(title)>25) return
		title=html_encode(title)
		var/message = input(M,"The message content?") as message
		if(!message) return
		message = escapeHTML(message)
		displayMessages(M)
		if(alert("Confirm this submission?","Confirm","Confirm","Erase")=="Confirm")
			M<<"Confirmed. Please wait for it to be approved."
			approveGlobal(M,message,title)
			for(var/mob/Admin in world)
				if(Admin.Admin)
					Admin<<"[M] just posted [title] to the message board."

			return


	proc/approveGlobal(mob/M,message,title)
		unapprovedGlobal+=title
		unapprovedGlobal[title]=message
		for(var/mob/Admin in world)
			if(Admin.Admin)
				Admin<<"[M] just posted [title] to the message board. <a href=?src=\ref[Admin];action=ApproveGlobal;board=\ref[src];entry=[md5(title)]>Approve</a> or <a href=?src=\ref[Admin];action=DenyGlobal;board=\ref[src];entry=[md5(title)]>Deny</a>"
		while(unapprovedGlobal.Find(title))
			sleep(10)
		if(deniedGlobal.Find(title)) return
		globalMessages.Insert(1,title)
		globalMessages[title]="<i>(Published [Day][Days(Day)] of [Months(Month)], [Year+100])</i><br><br>"+message
		if(globalMessages.len>8)
			globalMessages-=messages[9]

	proc/removeMessageGlobal(mob/M,entry)
		globalMessages -= globalMessages[entry]
		resort()


	proc/resort()
		for(var/i=1,i<messages.len,i++)
			if(messages[i]==null && messages[i+1])
				messages[i]=messages[i+1]
		for(var/i=1,i<globalMessages.len,i++)
			if(globalMessages[i]==null && globalMessages[i+1])
				globalMessages[i]=globalMessages[i+1]
	proc/escapeHTML(message)
		var/style = findtext(message,"<style>")
		if(style)
			message = copytext(message,1,style) + copytext(message,style+6)
		var/body = findtext(message,"<body")
		if(body)
			message = copytext(message,1,body) + copytext(message,body+5)
		var/html = findtext(message,"<html")
		if(html)
			message = copytext(message,1,html) + copytext(message,html+5)
		var/iframe = findtext(message,"<iframe")
		if(iframe)
			message = copytext(message,1,iframe) + copytext(message,iframe+7)
		var/embed = findtext(message,"<embed")
		if(embed)
			message = copytext(message,1,embed) + copytext(message,embed+6)
		var/object = findtext(message,"<object")
		if(object)
			message = copytext(message,1,object) + copytext(message,object+7)
		var/java = findtext(message,"<java")
		if(java)
			message = copytext(message,1,java) + copytext(message,java+5)
		return message
