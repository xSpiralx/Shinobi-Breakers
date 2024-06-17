/proc/markdown_format_text2(text)

	text = replace_with_html(text, "**", "b")
	text = replace_with_html(text, "*", "i")
	text = replace_with_html(text, "~~", "s")
	text = replace_with_html(text, "__", "u")

	return text

/proc/replace_with_html(text, seperator, replacement)

	if(findtext(text, seperator) == 0)
		return text

	var/list/l = text_to_list(text, seperator)

	var/result = "", iterator = 0
	for(var/t in l)
		result += "[t]<[iterator ? "/" : ""][replacement]>"
		iterator = !iterator

	return result

/proc/text_to_list(text, separator)
	var/textlength      = length(text)
	var/separatorlength = length(separator)
	var/list/textList   = new /list()
	var/searchPosition  = 1
	var/findPosition    = 1
	var/buggyText
	while (1)
		findPosition = findtext(text, separator, searchPosition, 0)
		buggyText = copytext(text, searchPosition, findPosition)
		textList += "[buggyText]"

		searchPosition = findPosition + separatorlength
		if (findPosition == 0)
			return textList
		else
			if (searchPosition > textlength)
				textList += ""
				return textList





proc/markdown_format_text(var/to_format = "")
	if(length(to_format) == 0) return
	to_format = Check_Quote2(to_format)
	to_format = html_encode(to_format)

	//to_format = htmlify_my_text(splittext(to_format,{"""}, 1, 0, 1), {"""})
	to_format = htmlify_my_text(splittext(to_format,"**", 1, 0, 1), "**")
	to_format = htmlify_my_text(splittext(to_format,"*", 1, 0, 1), "*")
	to_format = htmlify_my_text(splittext(to_format,"_", 1, 0, 1), "_")



	return html_decode(to_format)

proc/htmlify_my_text(var/list/my_text = list(), var/my_symbol)
	if(length(my_text) == 0)
		return ""
	var/my_new_text = ""
	var/my_opener = ""
	var/my_closer = ""
	var/opening = 1
	switch(my_symbol)
		if({"""})
			my_opener = "<font color= white>"
			my_closer = "</font>"
		if("**")
			my_opener = "<b>"
			my_closer = "</b>"
		if("*")
			my_opener = "<i>"
			my_closer = "</i>"
		if("_")
			my_opener = "<u>"
			my_closer = "</u>"

	for(var/my_t in my_text)
		if(cmptextEx(my_t, html_encode(my_symbol)))
			if(opening)
				my_new_text += my_opener
				opening = 0
			else
				my_new_text += my_closer
				opening = 1
		else
			my_new_text += html_encode(my_t)

	return html_decode(my_new_text)

proc/Check_Quote2(string)
	var
		q1 = findtext(string,"\"")
		q2 =  (q1 != 0 ? findtext(string,"\"", q1+1) : 0 )
		last_q2= q2
	if(!q1) return string
	if(!q2) return string
	. = html_encode(copytext(string,1,q1))
	while(q1 && q2)
		. += "<font color = white>[html_encode(copytext(string,q1,q2+1))]</font>"
		last_q2 = q2
		q1 = findtext(string, "\"", q2+1)
		if(!q1) break
		q2 = findtext(string, "\"", q1+1)
		if(q2)
			. += html_encode(copytext(string,  last_q2+1, q1))
	. += html_encode(copytext(string, last_q2+1))