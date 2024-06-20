

/obj/items/weapons
    var
        cost = 50
        mineral_cost = 50
        village = "Global"
        slots = 1
        kitexcluded = 0
        equippable = 0
        last_edit

    craftRank = "Trained Blacksmith"
    craftChance = 60
    craftCost = 50
    gridbased = 1

    Click()
        if(src in usr.contents)
            if(!src.worn)
                if(src.equippable)
                    src.worn = 1
                    src.suffix = "**Equipped**"
                    usr.overlays += src.icon
            else
                src.worn = 0
                src.suffix = ""
                usr.overlays -= src.icon

mob/var/tmp/mob/NPC/Akihibara_Weapon_Dealer

mob/NPC/Akihabara_Weapon_Dealer
    icon='Base_Pale.dmi'
    icon_state=""
    attackable=0
    var/assigned_regions = "Akihabara"
    var/minerals_available = 999999999
    New()
        spawn() src.AddHair()
        spawn() src.AddOverlays()
        ..()

    Click()
        if(get_dist(src, usr) > 2) return
        if(usr.Village == "Akihabara")
            usr.current_vendor = src

            winset(usr, "NewShop", "is-visible=true")
            winset(usr, "NewShop.grid", "cells=0x0")
            var/row = 1

            usr << output("<font color=#DDBE0D><b>Items", "NewShop.grid:1,1")
            usr << output("<font color=#DDBE0D><b>Price", "NewShop.grid:2,1")
            usr << output("<font color=#DDBE0D><b>Purchase", "NewShop.grid:3,1")

            for(var/obj/items/weapons/o in archive)
                if(usr.Village == o.village || o.village == "Global")
                    row++
                    usr << output("<a href=?databook_[o.databookname]>[o.name]", "NewShop.grid:1,[row]")
                    usr << output("[o.mineral_cost] minerals", "NewShop.grid:2,[row]")
                    usr << output("<a href=?src=\ref[usr];action=Buy;weap=[md5(o.name)]>Buy</a>", "NewShop.grid:3,[row]")

mob/var/tmp/mob/NPC/Iwagakure_Weapon_Dealer/current_vendor

mob/NPC/Iwagakure_Weapon_Dealer
    icon='Base_Pale.dmi'
    icon_state=""
    attackable=0
    var/assigned_regions = "Iwagakure"
    var/minerals_available = 999999999
    New()
        spawn() src.AddHair()
        spawn() src.AddOverlays()
        ..()

    Click()
        if(get_dist(src, usr) > 2) return
        if(usr.Village == "Iwagakure")
            usr.current_vendor = src

            winset(usr, "NewShop", "is-visible=true")
            winset(usr, "NewShop.grid", "cells=0x0")
            var/row = 1

            usr << output("<font color=#DDBE0D><b>Items", "NewShop.grid:1,1")
            usr << output("<font color=#DDBE0D><b>Price", "NewShop.grid:2,1")
            usr << output("<font color=#DDBE0D><b>Purchase", "NewShop.grid:3,1")

            for(var/obj/items/weapons/o in archive)
                if(usr.Village == o.village || o.village == "Global")
                    row++
                    usr << output("<a href=?databook_[o.databookname]>[o.name]", "NewShop.grid:1,[row]")
                    usr << output("[o.mineral_cost] minerals", "NewShop.grid:2,[row]")
                    usr << output("<a href=?src=\ref[usr];action=Buy;weap=[md5(o.name)]>Buy</a>", "NewShop.grid:3,[row]")

mob/NPC/Amegakure_Weapon_Dealer
    icon='Base_Pale.dmi'
    icon_state=""
    attackable=0
    var/assigned_regions = "Amegakure"
    var/minerals_available = 999999999
    New()
        spawn() src.AddHair()
        spawn() src.AddOverlays()
        ..()

    Click()
        if(get_dist(src, usr) > 2) return
        if(usr.Village == "Amegakure")
            usr.current_vendor = src

            winset(usr, "NewShop", "is-visible=true")
            winset(usr, "NewShop.grid", "cells=0x0")
            var/row = 1

            usr << output("<font color=#DDBE0D><b>Items", "NewShop.grid:1,1")
            usr << output("<font color=#DDBE0D><b>Cost", "NewShop.grid:2,1")
            usr << output("<font color=#DDBE0D><b>Purchase", "NewShop.grid:3,1")

            for(var/obj/items/weapons/o in archive)
                if(usr.Village == o.village || o.village == "Global")
                    row++
                    usr << output("<a href=?databook_[o.databookname]>[o.name]", "NewShop.grid:1,[row]")
                    usr << output("[o.mineral_cost] minerals", "NewShop.grid:2,[row]")
                    usr << output("<a href=?src=\ref[usr];action=Buy;weap=[md5(o.name)]>Buy</a>", "NewShop.grid:3,[row]")

mob/NPC/HoshiWeapon_Dealer
    icon='HosBase_White.dmi'
    icon_state=""
    attackable=0
    var/assigned_regions[]
    var/minerals_available = 0
    New()
        spawn() src.AddHair()
        spawn() src.AddOverlays()
        ..()

    Click()
        if(get_dist(src, usr) > 2) return
        if(usr.Village in assigned_regions)
            usr.current_vendor = src

            winset(usr, "NewShop", "is-visible=true")
            winset(usr, "NewShop.grid", "cells=0x0")
            var/row = 1

            usr << output("<font color=#DDBE0D><b>Items", "NewShop.grid:1,1")
            usr << output("<font color=#DDBE0D><b>Price", "NewShop.grid:2,1")
            usr << output("<font color=#DDBE0D><b>Purchase", "NewShop.grid:3,1")

            for(var/obj/items/weapons/o in archive)
                if(usr.Village == o.village || o.village == "Global")
                    row++
                    usr << output("<a href=?databook_[o.databookname]>[o.name]", "NewShop.grid:1,[row]")
                    usr << output("[o.cost] ryo", "NewShop.grid:2,[row]")
                    usr << output("<a href=?src=\ref[usr];action=Buy;weap=[md5(o.name)]>Buy</a>", "NewShop.grid:3,[row]")

mob/Admin6
    verb/Create_Archive_Weapon()
        set category = "Admin"

        var/obj/items/weapons/k = new
        k.name = input("Write a name for this weapon", "Weapon Name", k.name)
        if(k.name == "")
            usr << "You must give a this weapon a name"
            return

        for(var/obj/items/weapons/u in archive.contents)
            if(u.name == k.name)
                usr << "There is already a weapon with this name archived."
                return

        k.icon = 'AllWeapons.dmi'
        k.icon_state = input("What is the icon state?", "Icon State", k.icon_state)
        k.cost = input("What do you want this weapon to cost?", "Weapon Cost", k.cost) as num
        k.mineral_cost = input("How many minerals does this weapon cost?", "Weapon Mineral Cost", k.mineral_cost) as num
        k.village = input("Which village is this weapon for?", "Region", k.village)
        k.slots = input("How many slots does this weapon take?", "Weapon Slots", k.slots) as num
        k.durability = input("How durable is this weapon?", "Weapon Durability", k.durability) as num
        k.durabilityRemaining = k.durability
        k.strength = input("How strong is this weapon?", "Weapon Strength", k.strength) as num

        archive.contents += k
        archive.save_archive()
        usr << "[k] has been added to the weapon archive."
        world.log << "[k.name] has been saved to the weapon archives."
        message_admins("[usr.key] has saved [k] to the weapon archives.")
        Admin_Logs += "<br>[usr]([usr.key]) archived the [k.name] perk."
        SaveLogs()