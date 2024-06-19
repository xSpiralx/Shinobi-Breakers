/obj/jutsu/proc/summon(mob/m)
	var/mob/summon/d = new()
	d.Owner = m.key
	d.loc = m.loc
	d.icon = buff_icon
	if(extra_type)
		d.name = extra_type