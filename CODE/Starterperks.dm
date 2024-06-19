var/t1_starter_perks[] = list("")

var/t2_starter_perks[] = list("Body",
                              "Studious II",
                              "Primal Sensing",
                              "Eagle Eye",
                              "Bloodhound Nose",
                              "Speed",
                              "Dextrous",
                              "Extraordinary Hearing",
                              "Stamina",
                              "Chakra",
                              "Strength",
                              "Mind")

var/t3_starter_perks[] = list("Studious III",
                              "Massive Chakra",
                              "Massive Stamina",
                              "Control")

mob/var/starter_perk = ""

/mob/proc/give_starter_perk()
    var/list/choices = t2_starter_perks

    starter_perk = input("Which perk do you want to start with?", "Perk Selection", choices[1]) in choices

    var/obj/jutsu/archived_perk
    for (var/obj/jutsu/P in archive.contents)
        if (P.jutsu_type == "perk")
            if (P.name == starter_perk)
                archived_perk = P

    if (teach_jutsu(archived_perk, hidden = 1))
        if (progress_box)
            progress_box.display_interface(progress_list, src)
            progress_box.update_bars(src)
        if (character_box)
            character_box.update_bars(src)

/archive/var/list/NaturalRolls = list()