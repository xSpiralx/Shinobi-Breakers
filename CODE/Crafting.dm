/var/list/craftItems = list()

/world/New()
    ..()
    spawn(50)
        for(var/I in typesof(/obj/items/))
            var/obj/O = new I
            if(!O) continue
            if(O.craftRank)
                O.gridbased = 1
                craftItems += O
            else
                del(O)

/obj/var/craftRank
/obj/var/craftChance = 60
/obj/var/craftCost
/obj/var/gridbased = 0

/obj/DblClick()
    if(gridbased && craftRank && craftCost && craftChance)
        if(!usr.canCraft(src)) return
        var/mineralsAmount = usr.getMinerals(src)
        if(mineralsAmount < craftCost)
            usr << output("You don't have enough [craftType()] to craft this!", "outputic.output")
            usr << output("You don't have enough [craftType()] to craft this!", "outputall.output")
            return
        if(alert(usr, "Are you sure you want to craft this?", "Crafting", "Yes", "No") == "No") return
        var/probability = usr.getChanceToCraft(src)
        if(!prob(probability))
            usr << output("The [src] breaks apart when you try to craft it!", "outputic.output")
            usr << output("The [src] breaks apart when you try to craft it!", "outputall.output")
            usr.updateCraftBox()
            usr.removeMinerals(src, craftCost)
            return
        else
            if(istype(src, /obj/items/Weapon/Shuriken))
                var/amountWanted = input("How many Shuriken would you like to craft?") as num
                if(mineralsAmount < amountWanted * craftCost)
                    usr << output("You don't have enough [craftType()] to craft this!", "outputic.output")
                    usr << output("You don't have enough [craftType()] to craft this!", "outputall.output")
                    return
                var/obj/items/Weapon/Shuriken/S = locate() in usr
                if(!S)
                    var/obj/items/Weapon/Shuriken/R = new()
                    usr.contents += R
                    R.shuriken = amountWanted
                    R.suffix = "You currently have [R.shuriken] in this stack"
                else
                    S.shuriken += amountWanted
                    S.suffix = "You currently have [S.shuriken] in this stack"
                usr << output("You successfully create [amountWanted] Shuriken!", "outputic.output")
                usr << output("You successfully create [amountWanted] Shuriken!", "outputall.output")
                usr.removeMinerals(src, craftCost * amountWanted)
            else if(istype(src, /obj/items/Weapon/Senbon))
                var/amountWanted = input("How many Senbon would you like to craft?") as num
                if(mineralsAmount < amountWanted * craftCost)
                    usr << output("You don't have enough [craftType()] to craft this!", "outputic.output")
                    usr << output("You don't have enough [craftType()] to craft this!", "outputall.output")
                    return
                var/obj/items/Weapon/Senbon/S = locate() in usr
                if(!S)
                    var/obj/items/Weapon/Senbon/R = new()
                    usr.contents += R
                    R.senbon = amountWanted
                    R.suffix = "You currently have [R.senbon] in this stack"
                else
                    S.senbon += amountWanted
                    S.suffix = "You currently have [S.senbon] in this stack"
                usr << output("You successfully create [amountWanted] Senbon!", "outputic.output")
                usr << output("You successfully create [amountWanted] Senbon!", "outputall.output")
                usr.removeMinerals(src, craftCost * amountWanted)
            else
                usr << output("You successfully create a [src]!", "outputic.output")
                usr << output("You successfully create a [src]!", "outputall.output")
                usr.removeMinerals(src, craftCost)
                usr.updateCraftBox()
                var/obj/O = new src.type
                usr.contents += O
                if(alert(usr, "Does this have a name?", "Crafting", "Yes", "No") == "Yes")
                    name:
                    O.name = input(usr, "Edit Name", "Edit Name", name) as text
                    if(length(O.name) > 20 || length(O.name) < 3)
                        O.name = initial(O.name)
                        usr.custom_alert("The name must be between 3 and 20 characters.")
                        goto name
                    if(uppertext(O.name) == src.name)
                        O.name = initial(O.name)
                        usr.custom_alert("Your name may not consist entirely of capital letters.")
                        goto name
                    if(filter_characters(O.name) != O.name)
                        O.name = initial(O.name)
                        usr.custom_alert("\"[src.name]\" contains an invalid character. Allowed characters are:\n[allowed_characters_name]")
                        goto name
                    if(O.name == "" || findtext(O.name, "\n"))
                        O.name = initial(O.name)
                        usr.custom_alert("Your name contains an invalid character.")
                        goto name

/obj/proc/craftType()
    if(!craftRank) return "things"
    if(findtext("[craftRank]", "Smith") || findtext("[craftRank]", "Sealing"))
        return "Minerals"
    if(findtext("[craftRank]", "Tailor"))
        return "Cotton"
    if(findtext("[craftRank]", "Poison") || findtext("[craftRank]", "Medical"))
        return "Roots"
    return "things"

/mob/verb/closeCraft()
    set hidden = 1
    winset(src, "crafting", "is-visible=false")

/mob/verb/craft()
    set hidden = 1
    if(!client) return
    if(getPerk("Trained Blacksmith") || getPerk("Veteran Blacksmith") || getPerk("Rookie Blacksmith") || getPerk("Lotus Sealing") || getPerk("Pharmacist") || getPerk("Herbalist") || getPerk("Tailor"))
        if(RecentVerbCheck("Craft", 1, 1)) return
        recentverbs["Craft"] = world.realtime
        updateCraftBox()

/mob/proc/canCraft(var/obj/O)
    if(!O) return 0
    if(getPerk(O.craftRank)) return 1
    else
        if(O.craftRank == "Medical Proficiency I" && getPerk("Medical Proficiency II")) return 1
        if(O.craftRank == "Poison Fighter I" && getPerk("Poison Fighter II")) return 1
    return 0

/mob/proc/getChanceToCraft(var/obj/O)
    return O.craftChance

/mob/proc/getMinerals(var/obj/O)
    if(findtext("[O.craftRank]", "Trained Blacksmith") || findtext("[O.craftRank]", "Lotus Sealing") || findtext("[O.craftRank]", "Rookie Blacksmith"))
        var/obj/items/Bars/hasMineral = 0
        for(var/obj/items/Bars/R in contents)
            hasMineral = R
            break
        if(hasMineral) return hasMineral.amount
        return 0
    if(findtext("[O.craftRank]", "Herbalist") || findtext("[O.craftRank]", "Pharmacist"))
        var/obj/items/Roots/hasMineral = 0
        for(var/obj/items/Roots/R in contents)
            hasMineral = R
            break
        if(hasMineral) return hasMineral.amount
        return 0
    if(findtext("[O.craftRank]", "Tailor"))
        var/obj/items/Cotton/hasMineral = 0
        for(var/obj/items/Cotton/R in contents)
            hasMineral = R
            break
        if(hasMineral) return hasMineral.amount
        return 0

/mob/proc/removeMinerals(var/obj/O, var/num)
    if(findtext("[O.craftRank]", "Rookie Blacksmith") || findtext("[O.craftRank]", "Lotus Sealing") || findtext("[O.craftRank]", "Trained Blacksmith") || findtext("[O.craftRank]", "Veteran Blacksmith") || findtext("[O.craftRank]", "Master Blacksmith"))
        for(var/obj/items/Bars/R in contents)
            R.amount = max(R.amount - num, 0)
            R.Update()
            break
    if(findtext("[O.craftRank]", "Herbalist") || findtext("[O.craftRank]", "Pharmacist"))
        for(var/obj/items/Roots/R in contents)
            R.amount = max(R.amount - num, 0)
            R.Update()
            break
    if(findtext("[O.craftRank]", "Tailor"))
        for(var/obj/items/Cotton/R in contents)
            R.amount = max(R.amount - num, 0)
            R.Update()
            break

/mob/proc/getCraftableItems()
    var/list/itemsAvailable = list()
    for(var/obj/O in craftItems)
        if(O) if(canCraft(O)) itemsAvailable += O
    return itemsAvailable


/mob/verb/openCraftingMenu()
    set hidden = 0
    if(!client) return
    if(getPerk("Trained Blacksmith") || getPerk("Veteran Blacksmith") || getPerk("Rookie Blacksmith") || getPerk("Lotus Sealing") || getPerk("Pharmacist") || getPerk("Herbalist") || getPerk("Tailor"))
        if(RecentVerbCheck("Craft", 1, 1)) return
        recentverbs["Craft"] = world.realtime
        updateCraftBox()

/mob/proc/updateCraftBox()
    if(!client) return
    winset(src, "crafting", "is-visible=true")
    winset(src, "crafting.itemGrid", "cells=0x0")
    var/Row = 1
    src << output("Craftable Items", "crafting.itemGrid:1,1")
    src << output("Cost / Success Rate", "crafting.itemGrid:2,1")

    for(var/obj/O in getCraftableItems())
        if(!src.client) continue
        Row++
        spawn() if(client) while(winget(src, "crafting", "is-visible") == "true" && client) sleep(rand(30, 45))
        if(client)
            src << output(O, "crafting.itemGrid:1,[Row]")
            src << output("[O.craftCost] [O.craftType()]  /  [getChanceToCraft(O)]%", "crafting.itemGrid:2,[Row]")
/obj/proc/initiateCrafting(mob/usr, obj/src, mineralsAmount)
    var/probability = usr.getChanceToCraft(src)
    if(!prob(probability))
        usr << output("The [src] breaks apart when you try to craft it!", "outputic.output")
        usr << output("The [src] breaks apart when you try to craft it!", "outputall.output")
        usr.updateCraftBox()
        usr.removeMinerals(src, craftCost)
        return
    else
        if(istype(src, /obj/items/Weapon/Shuriken))
            var/amountWanted = input("How many Shuriken would you like to craft?") as num
            if(mineralsAmount < amountWanted * craftCost)
                usr << output("You don't have enough [craftType()] to craft this!", "outputic.output")
                usr << output("You don't have enough [craftType()] to craft this!", "outputall.output")
                return
            var/obj/items/Weapon/Shuriken/S = locate() in usr
            if(!S)
                var/obj/items/Weapon/Shuriken/R = new()
                usr.contents += R
                R.shuriken = amountWanted
                R.suffix = "You currently have [R.shuriken] in this stack"
            else
                S.shuriken += amountWanted
                S.suffix = "You currently have [S.shuriken] in this stack"
            usr << output("You successfully create [amountWanted] Shuriken!", "outputic.output")
            usr << output("You successfully create [amountWanted] Shuriken!", "outputall.output")
            usr.removeMinerals(src, craftCost * amountWanted)
        else if(istype(src, /obj/items/Weapon/Senbon))
            var/amountWanted = input("How many Senbon would you like to craft?") as num
            if(mineralsAmount < amountWanted * craftCost)
                usr << output("You don't have enough [craftType()] to craft this!", "outputic.output")
                usr << output("You don't have enough [craftType()] to craft this!", "outputall.output")
                return
            var/obj/items/Weapon/Senbon/S = locate() in usr
            if(!S)
                var/obj/items/Weapon/Senbon/R = new()
                usr.contents += R
                R.senbon = amountWanted
                R.suffix = "You currently have [R.senbon] in this stack"
            else
                S.senbon += amountWanted
                S.suffix = "You currently have [S.senbon] in this stack"
            usr << output("You successfully create [amountWanted] Senbon!", "outputic.output")
            usr << output("You successfully create [amountWanted] Senbon!", "outputall.output")
            usr.removeMinerals(src, craftCost * amountWanted)
        else
            usr << output("You successfully create a [src]!", "outputic.output")
            usr << output("You successfully create a [src]!", "outputall.output")
            usr.removeMinerals(src, craftCost)
            usr.updateCraftBox()
            var/obj/O = new src.type
            usr.contents += O
            if(alert(usr, "Does this have a name?", "Crafting", "Yes", "No") == "Yes")
                name:
                O.name = input(usr, "Edit Name", "Edit Name", name) as text
                if(length(O.name) > 20 || length(O.name) < 3)
                    O.name = initial(O.name)
                    usr.custom_alert("The name must be between 3 and 20 characters.")
                    goto name
                if(uppertext(O.name) == src.name)
                    O.name = initial(O.name)
                    usr.custom_alert("Your name may not consist entirely of capital letters.")
                    goto name
                if(filter_characters(O.name) != O.name)
                    O.name = initial(O.name)
                    usr.custom_alert("\"[src.name]\" contains an invalid character. Allowed characters are:\n[allowed_characters_name]")
                    goto name
                if(O.name == "" || findtext(O.name, "\n"))
                    O.name = initial(O.name)
                    usr.custom_alert("Your name contains an invalid character.")
                    goto name
/obj/Click()
    if(gridbased && craftRank && craftCost && craftChance)
        if(!usr.canCraft(src)) return
        var/mineralsAmount = usr.getMinerals(src)
        if(mineralsAmount < craftCost)
            usr << output("You don't have enough [craftType()] to craft this!", "outputic.output")
            usr << output("You don't have enough [craftType()] to craft this!", "outputall.output")
            return
        if(alert(usr, "Are you sure you want to craft this?", "Crafting", "Yes", "No") == "No") return
        initiateCrafting(usr, src, mineralsAmount)