/obj/jutsu/proc/hiraishin(mob/user)
    if(!user.move)
        return
    else
        var/choice=input("What would  you like to do?") in list ("Mark","Teleport")
        if(choice=="Mark")
            for(var/mob/M in get_step(user,user.dir))
          //user << "You mark [M]"
                user.HiraishinList.Add(M)
        if(choice=="Teleport")
            var/list/V = new/list
            for(var/mob/M in user.HiraishinList)
                V.Add(M)
            var/mob/A=input("Who would you like to use the Hiraishin no Jutsu to?","Cancel") in V
            Active=1
            spawn(50) Active=0
            viewers(6)<<output("<font color=[user.SayFont]>[user] yells<font color = white>: Hiraishin no Jutsu!","outputic.output")
            usr.MaxNinjutsu += (1 *0.001)
            flick('smoke.dmi',user)
            usr.loc=locate(A.x,A.y,A.z)
            usr.y+=1
            usr.resetLuminosity()
/obj/jutsu/proc/ShikokuMujin(mob/user)
	icon='Skillcard.dmi'
	icon_state="Shikoku Mujin"
	if(src in usr.contents)
		if(usr.Mujin)
			return
		if(usr.Chakra<10)
			return
		usr.Chakra-=100
		usr.Mujin=1
		Active=1
		spawn(50) Active=0
		sleep(5)
		var/obj/items/Clothing/Curse_Seal_Container/D = new()
		D.loc = usr.loc
		sleep(4000)
		usr.Mujin=0
