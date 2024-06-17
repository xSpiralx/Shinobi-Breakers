/mob/var/cert = 0

obj/RPFlag/verb/Set_Icon()
	set src in view()

	if(!(src in usr.rpFlags))
		usr << "You can't change the icon of flags that don't belong to you."
		return

	icon = input("Please select an icon") as icon