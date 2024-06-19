obj/items/Scrolls/Fuuinjutsu_Scroll
    icon='Mscroll.dmi'
    var
        used = FALSE
        sealed = FALSE
        jutsuselect
    verb
        Seal_Jutsu()
            var/mob/target
            for(var/mob/T in get_step(usr, usr.dir))
                target = T
                if(target)
                    jutsuselect = target.Seal_Jutsu_Prompt(usr, target)
                    if(jutsuselect != "Canceled")
                        src.contents += jutsuselect
                        src.sealed = TRUE
                        src.name = jutsuselect:name + " Jutsu Scroll - Sealed"
        Reveal_Jutsu()
            if(src.sealed == TRUE && src.used == FALSE)
                jutsuselect:display_desc(usr)
                src.used = TRUE
                src.name = jutsuselect:name + " Jutsu Scroll - Used"
            else 
                usr << "This is either empty or used"




mob/proc/Seal_Jutsu_Prompt(mob/user, mob/target)
    var choice = input(target, "[user] is requesting to seal a jutsu from you") in list ("No","Yes")
    switch(choice)
        if("No")
            user << "[src] rejected your request."
        if("Yes")
            var/list/jutsus = list()
            jutsus += "cancel"
            for(var/obj/jutsu/J in target.contents)
                jutsus += J
            var jutsuselect = input(target, "Select a jutsu to seal for [user]") in jutsus
            if(jutsuselect != "cancel")
                var/obj/jutsu/JJ = jutsuselect
                return JJ
            else
                return "Canceled"
        


