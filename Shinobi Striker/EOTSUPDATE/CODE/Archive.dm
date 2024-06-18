/var/archive/archive = new /archive

/mob/var/view_archived_jutsu = 0
/mob/var/view_archived_perks = 0
/mob/var/view_available_squads = 0
/mob/var/view_hidden_actions = 1

proc/rename(old_path, new_path)
    if(fcopy(old_path, new_path))
        fdel(old_path)
        return 1
    return 0

/archive
    name = "Jutsu Archive"
    parent_type = /mob

    var/check_jutsu = 0
    var/admin_log = "<style>html, body { background:black; font-family:'Calibri'; }</style>"
    var/global_gravity = 6
    var/global_jumpheight = 32
    var/global_afk_limit = 9000
    var/guide = "guide"
    var/progress_on = 1
    var/progress_global_rate = 60
    var/global_progress_rate = 1
    var/database_leech_cost = 2
    var/global_stat_cap = 120
    var/lowcap = 3
    var/medcap = 2
    var/highcap = 1

    var/arc = "None"
    var/subarc = "None"

    var/login_screen = "<body background='loginbackground.png'><span style=\"font-family:'Calibri'; font-size:30px; color:white;\">Welcome to Shinobi Breakers, thank you for trying the game! We have a couple things that are still being fixed up so thank you for your patience! Akihibara does not have interiors yet!</span></body>"

    var/current_season = "Spring"
    var/current_day = "Monday"
    var/week_count = 7

    var/jutsu_drain = 1
    var/say_bubble = 1
    var/afk_check = 1

    var/uchiha_on = 1
    var/hyuuga_on = 1
    var/inuzuka_on = 1
    var/aburame_on = 0
    var/akimichi_on = 1
    var/nara_on = 1
    var/hozuki_on = 1
    var/yuki_on = 1
    var/senju_on = 1
    var/yomei_on = 0
    var/kaguya_on = 1
    var/samurai_on = 1
    var/Priest_on = 0
    var/Yotsuki_on = 0
    var/hoshigaki_on = 1
    var/uzumaki_on = 1
    var/Sabaku_on = 0
    var/Iwato_on = 0
    var/Fuujin_on = 0
    var/Yomei_on = 0
    var/auto_genin_bonus = 0

    var/list/page_text = list("here" = "goes")
    var/list/info_text = list("here" = "goes")
    var/list/button_icons = list("here" = "goes")
    var/list/big_button_icons = list("here" = "goes")
    var/list/info_text_green = list("here" = "goes")
    var/list/info_text_red = list("here" = "goes")

    var/list/fake_keys = list(".")

    var/ooc_color = "#009966"
    var/admin_color = "#E6C208"
    var/DRrate = 0.45
    var/list/incentive_villages = list("")
    var/incentive_large_bonus = 20
    var/incentive_small_bonus = 25
    var/list/bounty_list = list()
    var/list/notablelist = list()
    var/list/konoscrollinv = list()
    var/list/roguescrollinv = list()
    var/list/otogakurescrollinv = list()
    var/list/uzushiogakurescrollinv = list()
    var/list/yukigakurescrollinv = list()
    var/injallow = 0
    var/list/worldwide_ranks = list("C+" = 0, "B-" = 0, "B" = 0, "B+" = 0, "A-" = 0, "A" = 0, "A+" = 0)
    var/list/maximum_worldwide_ranks = list("C+" = 18, "B-" = 11, "B" = 8, "B+" = 7, "A-" = 6, "A" = 5, "A+" = 4)
    var/ARyoCost = 1800
    var/BRyoCost = 1200
    var/CRyoCost = 600
    var/DRyoCost = 300
    var/title_video = "ycdw1QUtE68"
    //var/title_video = "wgPcl1WJ98Y"
    var/Yukigakure = 0
    var/Sunagakure = 0

    proc/save_archive()
        try
            // Temporary file names
            var/tmpfile_jutsu = "archive_savefiles/archive_jutsu_tmp"
            var/tmpfile_perks = "archive_savefiles/archive_perks_tmp"
            var/tmpfile_scrolls = "archive_savefiles/archive_scrolls_tmp"
            var/tmpfile_jutsuapps = "archive_savefiles/archive_jutsuapps_tmp"
            var/tmpfile_weapons = "archive_savefiles/archive_weapons_tmp"
            var/tmpfile_variables = "archive_savefiles/archive_variables_tmp"
            var/tmpfile_gmhelps = "archive_savefiles/archive_gmhelps_tmp"
            var/tmpfile_clothing = "archive_savefiles/archive_clothing_tmp"
            var/tmpfile_poisons = "archive_savefiles/archive_poisons_tmp"
            var/tmpfile_databook = "archive_savefiles/archive_databook_tmp"
            var/tmpfile_bingobook = "archive_savefiles/archive_bingobook_tmp"

            var/savefile/a = new(tmpfile_jutsu)
            var/list/l_a = list()
            for(var/obj/jutsu/x in archive)
                if(x.jutsu_type != "perk")
                    l_a += x
            a["archive_list_storage"] << l_a

            var/savefile/b = new(tmpfile_perks)
            var/list/l_b = list()
            for(var/obj/jutsu/x in archive)
                if(x.jutsu_type == "perk")
                    l_b += x
            b["archive_list_storage"] << l_b

            var/savefile/c = new(tmpfile_scrolls)
            var/list/l_c = list()
            for(var/obj/items/jutsu_scroll/x in archive)
                l_c += x
            c["archive_list_storage"] << l_c

            var/savefile/cc = new(tmpfile_jutsuapps)
            var/list/l_cc = list()
            for(var/jutsuApp/app in archive)
                l_cc += app
            cc["archive_list_storage"] << l_cc

            var/savefile/e = new(tmpfile_weapons)
            var/list/l_e = list()
            for(var/obj/items/weapons/x in archive)
                l_e += x
            e["archive_list_storage"] << l_e

            var/savefile/d = new(tmpfile_variables)
            for(var/v in archive.vars - "contents" - "type" - "gender" - "transform")
                if(archive.vars[v] != initial(archive.vars[v]) && issaved(archive.vars[v]))
                    d[v] << archive.vars[v]

            var/savefile/f = new(tmpfile_gmhelps)
            var/list/l_f = list()
            f["archive_list_storage"] << l_f

            var/savefile/g = new(tmpfile_clothing)
            var/list/l_g = list()
            for(var/obj/items/Clothing/x in archive)
                l_g += x
            g["archive_list_storage"] << l_g

            var/savefile/h = new(tmpfile_poisons)
            var/list/l_h = list()
            for(var/obj/items/Poisons/x in archive)
                l_h += x
            h["archive_list_storage"] << l_h

            var/savefile/i = new(tmpfile_databook)
            var/list/l_i = list()
            for(var/obj/databook_page/x in archive)
                l_i += x
            i["archive_list_storage"] << l_i

            var/savefile/j = new(tmpfile_bingobook)
            var/list/l_j = list()
            for(var/obj/BingoBookEntry/x in archive)
                l_j += x
            j["archive_list_storage"] << l_j

            // Rename temporary files to final files
            rename(tmpfile_jutsu, "archive_savefiles/archive_jutsu")
            rename(tmpfile_perks, "archive_savefiles/archive_perks")
            rename(tmpfile_scrolls, "archive_savefiles/archive_scrolls")
            rename(tmpfile_jutsuapps, "archive_savefiles/archive_jutsuapps")
            rename(tmpfile_weapons, "archive_savefiles/archive_weapons")
            rename(tmpfile_variables, "archive_savefiles/archive_variables")
            rename(tmpfile_gmhelps, "archive_savefiles/archive_gmhelps")
            rename(tmpfile_clothing, "archive_savefiles/archive_clothing")
            rename(tmpfile_poisons, "archive_savefiles/archive_poisons")
            rename(tmpfile_databook, "archive_savefiles/archive_databook")
            rename(tmpfile_bingobook, "archive_savefiles/archive_bingobook")

        catch(var/e)
            world.log << "ARCHIVE: Error occurred while saving: [e]"
            return

    proc/load_archive()
        world.log << "ARCHIVE: Attempting to load archive files..."

        if(fexists("archive_savefiles/archive_jutsu"))
            var/savefile/a = new("archive_savefiles/archive_jutsu")
            var/list/l_a = list()
            a["archive_list_storage"] >> l_a
            archive.contents += l_a
            world_jutsu += l_a //instantiated in WorldDatabase.dm
            world.log << "ARCHIVE: Loaded archive_jutsu."

        if(fexists("archive_savefiles/archive_perks"))
            var/savefile/b = new("archive_savefiles/archive_perks")
            var/list/l_b = list()
            b["archive_list_storage"] >> l_b
            archive.contents += l_b
            world_perks += l_b
            world.log << "ARCHIVE: Loaded archive_perks."

        if(fexists("archive_savefiles/archive_scrolls"))
            var/savefile/c = new("archive_savefiles/archive_scrolls")
            var/list/l_c = list()
            c["archive_list_storage"] >> l_c
            archive.contents += l_c
            world.log << "ARCHIVE: Loaded archive_scrolls."

        if(fexists("archive_savefiles/archive_jutsuapps"))
            var/savefile/cc = new("archive_savefiles/archive_jutsuapps")
            var/list/l_cc = list()
            cc["archive_list_storage"] >> l_cc
            archive.contents += l_cc
            world.log << "ARCHIVE: Loaded archive_jutsuapps."

        if(fexists("archive_savefiles/archive_weapons"))
            var/savefile/e = new("archive_savefiles/archive_weapons")
            var/list/l_e = list()
            e["archive_list_storage"] >> l_e
            archive.contents += l_e
            world.log << "ARCHIVE: Loaded archive_weapons."

        if(fexists("archive_savefiles/archive_variables"))
            var/savefile/d = new("archive_savefiles/archive_variables")
            for(var/v in d.dir)
                if(v in archive.vars)
                    d[v] >> archive.vars[v]
            archive.progress_on = 1
            world.log << "ARCHIVE: Loaded archive_variables."

        if(fexists("archive_savefiles/archive_gmhelps"))
            var/savefile/f = new("archive_savefiles/archive_gmhelps")
            var/list/l_f = list()
            f["archive_list_storage"] >> l_f
            archive.contents += l_f
            world.log << "ARCHIVE: Loaded archive_gmhelps."

        if(fexists("archive_savefiles/archive_clothing"))
            var/savefile/g = new("archive_savefiles/archive_clothing")
            var/list/l_g = list()
            g["archive_list_storage"] >> l_g
            archive.contents += l_g
            world.log << "ARCHIVE: Loaded archive_clothing."

        if(fexists("archive_savefiles/archive_poisons"))
            var/savefile/h = new("archive_savefiles/archive_poisons")
            var/list/l_h = list()
            h["archive_list_storage"] >> l_h
            archive.contents += l_h
            world.log << "ARCHIVE: Loaded archive_poisons."

        if(fexists("archive_savefiles/archive_databook"))
            var/savefile/i = new("archive_savefiles/archive_databook")
            var/list/l_i = list()
            i["archive_list_storage"] >> l_i
            archive.contents += l_i
            world.log << "ARCHIVE: Loaded archive_databook."

        if(fexists("archive_savefiles/archive_bingobook"))
            var/savefile/j = new("archive_savefiles/archive_bingobook")
            var/list/l_j = list()
            j["archive_list_storage"] >> l_j
            archive.contents += l_j
            world.log << "ARCHIVE: Loaded archive_bingobook."

        world.log << "ARCHIVE: Load complete."

/mob/Admin4/verb/old_load_archive()
    set category = "Admin"
    if(fexists("Archived_Jutsu"))
        var/savefile/S = new("Archived_Jutsu")
        S["Archived_Jutsu"] >> archive
        world.log << "ARCHIVE: Loaded old archive file."