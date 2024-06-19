
mob/var/KitMath = 0
//mob/var/MathComplete = FALSE
mob/verb
	ShinobiKitUpdate()
		set hidden = 1
		set category = "Combat"
		for(var/obj/jutsu/P in src)
			if(P.jutsu_type == "perk" || P.boost_shinobikit == TRUE)
				usr.KitMath += P.boost_shinobikit
				usr.shinobikit_limit = (usr.KitMath + 5)
					//usr.MathComplete = TRUE
				spawn(5)ShinobiKitReset()
	ShinobiKitReset()
		set hidden = 1
		usr.KitMath = 0
		//usr.MathComplete = FALSE

mob/var/warringclanspawn = 0
var/AJutsuScroll_Logs={"<html><title>Jutsu Scroll log</title><body>
"}
