var/MAX_PAGES = 26

mob
	var
		Boolswitch = 1
		Pagenum = 1
		tmp
			OpenClose = 0

			SkillTreeNode/tree_selection


/*

	[ Tutorial Time ]

     * * * * *

	'How do I make trees?'

	Well, all you have to do is edit the katon_order_h or katon_order_v list. In the future I'll fix the verb that lets you do it in-game.

	-Horizontal Trees-
	These are easy, to be honest. All you do is add the next perk in the horizontal tree in the list. So after Intense Heat, you could put 'Elemental Training - Fire'.

	-Vertical Trees-
	These are also easy, but cooler. Everything has been done for you already, so there's no need to really change the code at all.
	There are specific 'keys' that allow you to 'program' the tree.

		--Keys (in brackets is the key itself)--
		(-) -> the '-' key means you want to leave a blank space on the perk tree.
		(+) -> the '+' key means you want to increase the height of the tree. Think, Tier 1 perk -> Tier 2 perk - Tier 3 perk.
		(v) -> the 'v' key (letter v) means you want to decrease the height of the tree.

		Keep in mind that what goes up must come down. And what goes down, will eventually have to come back up.
		...I guess? It depends on how you want your tree to look. Mess around and find out, I suppose.

    * * * * *

	'How do I make trees for different elements?'

	There are two important variables in for each tree. In the context of the katon tree, thats...
		katon_order_h (the horizontal order of the katon tree)
		katon_order_v (the vertical order of the katon tree)

		These two combined make the 'katon tree'.

	To make a new tree, you need to make another two lists per tree. So for Doton, it'd look like...
		doton_order_h
		doton_order_v

	In programming, you should -always- initiliaze your lists. This means setting it to something.
	So...
		doton_order_h = list()
		doton_order_v = list()

	Now we have two empty lists. Fill them out as you wish to, using what you learned in the first section.
	Then, copy and paste my code from 'Auto_Gen() in the right section. 1 is Katon. 2 is Suiton. etc.

	Copy from this bit: //This is the Horizontal Tree [COPY AND PASTE START HERE]
	And end at the bit that say 'stop here'.
	You will need to do this for every skill tree.

	Make sure you change the list names, specifically replace all mention of 'katon_order_v' and 'katon_order_h'...
	...to whatever your corresponding list names are.

    * * * * *

	'How do I save these lists?'

	This is the important part. EVERY SINGLE LIST MUST BE SAVED!
	Otherwise, no matter what changes you make in runtime, it will refer to the hardcoded lists, and not what you've changed or altered!

		proc/save_tree_order()
			var/savefile/a = new("archive_savefiles/tree_order")
			a["katon_tree_order_h"] << katon_order_h
			a["katon_tree_order_v"] << katon_order_v

		proc/load_tree_order()
			if(fexists("archive_savefiles/tree_order"))
				var/savefile/a = new("archive_savefiles/tree_order")
				a["katon_tree_order_h"] >> katon_order_h
				a["katon_tree_order_v"] >> katon_order_v

				world.log << "ARCHIVE: Loaded skill tree."

	All you need to do is copy and paste the a["texthere"] << list_here structure put in these procs just down below.
	(<<) means 'writes into'.
	(>>) means reads from.

	For 'save_tree_order' Doton would look like...

	a["doton_tree_order_h"] << doton_order_h
	a["doton_tree_order_v"] << doton_order_v

	For 'read_tree_order' Doton would look like...

	a["doton_tree_order_h"] >> doton_order_h
	a["doton_tree_order_v"] >> doton_order_v

	And that's it. You're done.

*/


var
	list/katon_order_h = list("Katon Training","Katon Adept","Katon Expert","Katon Seal Mastery","Incinerator","Katon Master","Katon Grandmaster","Shape Training")
	list/katon_order_v = list("-","Incendiary Flame","+","Conflaguration","v","-","-","Dragon Breath","+","Iron Lungs","-","v","Scorching Inferno","Rekindled Flames","+","Heatwave")
//complete
	list/suiton_order_h = list("Suiton Training","Suiton Adept","Suiton Expert","Impermeable","Suiton Master","Maelstrom","Suiton Grandmaster")
	list/suiton_order_v = list("-","Reservoir I","+","Sanjin Sea","v","-","Reservoir II","+","Suiton Seal Mastery","v","Rolling Waves","Relentless Currents","+","Torrential Onslaught","v","-","-","-","Materialized Mist")
//complete
	list/doton_order_h = list("Doton Training","Doton Adept","Doton Expert","Bulwark","Doton Master","Heart of Iron","Stonework Artistry","Mud Proficiency")
	list/doton_order_v = list("-","Chakra Stone","Suiseki Masonry","+","Siesmic Waves","-","v","Dosojin Statue","+","Doton Seal Mastery","+","Dorotabo Spirit","-","v","-","v","Doton Grandmaster")
//complete
	list/raiton_order_h = list("Raiton Training","Raiton Adept","Polarity Master","Raiton Expert","Static Discharge","Lightning Rod","Raiton Master","Raiton Grandmaster")
	list/raiton_order_v = list("-","-","Numbing Joltage","Raiton Seal Mastery","+","Conductivity","v","-","-","-","True Lightning","+","Electromagnetic Discharge","+","Static Charge")
//complete
	list/fuuton_order_h = list("Fuuton Training","Fuuton Adept","Fuuton Expert","Nimble Breeze","Fuuton Master","Fuuton Grandmaster")
	list/fuuton_order_v = list("-","Turbulent Airflow","+","Razor Winds I","+","Razor Winds II","v","-","v","Fuuton Seal Mastery","+","Fujin's Cloak","v","-","Vacuum","+","Monsoon","+","Hurricane Force","v","v","-","Tempest")
//complete
	list/weap_order_h = list("Shurikenjutsu Training","Shurikenjutsu Adept","Shurikenjutsu Expert","Ricochet","Keen Eye","Shurikenjutsu Master","Raikou Kenka","Shurikenjutsu Grandmaster")
	list/weap_order_v = list("-","Utility I","+","Explosive Kawarimi","+","Shadow Shuriken","v","v","-","Wire Manipulation","+","Manipulated Shuriken","v","-","Utility II","-","Utility III",)
//incomplete
	list/tai_order_h = list("Taijutsu Training","Taijutsu Adept","Jarring Blows","Shintai Shunshin","Taijutsu Expert","Solid Feet","Taijutsu Master","Entry Gates","Taijutsu Grandmaster")
	list/tai_order_v = list("Foundation Breaker","30 Pound Burden","Drunken Fist")
	list/tai_order_b = list("Shinken Nodachidori")
//complete
	list/hoz_order_h = list("Hozuki Clan","Hozuki Water Mastery","Jellification","Water Regeneration","Body of Water","Suika Mastery","Oil Based")
	list/hoz_order_v = list("-","-","Innate Liquification","Volume Expansion","+","Ghost in the Mist","v","-","Body Infiltration","+","Undercurrent")
//complete
	/*list/kag_order_h = list("Kaguya Clan","Dance of Willow","Dance of Larch","Dance of Camelia","Sadomasochism","Exoskeleton","Blood Gorger!")
	list/kag_order_v = list("-","Dance of Willow Adept","+","Yanagi no Yure","v","-","Dance of Larch Adept","+","Sadistic Intimidation","v","-","Isshun Sengeki","+","Camelia Master","v","-","Bloodlust Detection","Ultimate Perk")*/
//complete
	list/uchiha_order_h = list("Uchiha Clan","Uchiha Katon Mastery","Illuminating Eyes","Pure Vision","Mastery of Mind","Sharingan Mastery","Mastery of Body")
	list/uchiha_order_v = list("-","-","-","Eye of Hypnotism","+","Eye of Hypnotism II","+","Eye of Hypnotism III","v","v","-","Eye of Insight I","+","Eye of Insight II","+","Eye of Insight III","v","v","-","Uchiha Spirit","+","Curse of Hatred")
//complete
	list/hyuuga_order_h = list("Hyuuga Clan","Telescopic Vision","Contortionist","Jyuken Adept","Rotation I","Jyuken Expert","Rotation II","Jyuken Master","Jyuken Grandmaster")
	list/hyuuga_order_v = list("-","-","Tenketsu Jolter","-","Tenketsu Cutter","+","Gate Shatterer","v","-","-","-","Revolving Heaven","+","Lightning Strikes")
//KAMI
	//list/kami_order_h = list("Kami Clan","Origami 1","Paper Frame","Origami 2","Elemental Resistence","Origami 3","Paper Storm")
	//list/kami_order_v = list("-","Paper Swarm","+","Fuuton Affinity","v","-","Blessed by the gods","+","Air Current","v","-","Paper Manipulation","+","Controlled Path","v","-","Projectile Mastery","Pin Cushion")
//Genjutsu
	list/gen_order_h = list("Control","Genjutsu Training","Genjutsu Adept","Illusionary Tribulation","Genjutsu Expert","Genjutsu Master","Shackles of Pain","Genjutsu Grandmaster","Trigger Mastery")
	list/gen_order_v = list("-","-","Doppleganger Artist","Collective Consciousness","Dissimulation","+","Bouqet of Almonds","+","Pertinacious Pantomimist","v","-","v","Percipient Mind","-","-","Vanishment")
//Akimichi
	list/aki_order_h = list("Akimichi Clan","Calorie Adept","Calorie Sustenance","The Keg","Calorie Expert","Calorie Master","Flawless Baika","Calorie Grandmaster","Butterfly Potential")
	list/aki_order_v = list("-","-","Calorie Flow","Akimichi Bo Mastery","Green Pill","+","Yellow Pill","+","Red Pill","v","-","v","Akimichi Armor","-","-","Brute")

//Inuzuka
	list/inu_order_h = list("Inuzuka Clan","Shikyaku Adept","Unstoppable Onslaught","Shikyaku Expert","Wolfman","Shikyaku Master")
	list/inu_order_v = list("-","-","Feral Fighter","+","Beast Pill","v","Dynamic Marking","Enhanced Senses","+","Canine Senses","-","v","Man-Beast Synchronization","+","Shikyaku Grandmaster")
//Hoshigaki
	list/hoshi_order_h = list("Hoshigaki Clan","Heightened Senses","Aquatic Adaption","Resilient Physiology","Hoshigaki Water Mastery")
	list/hoshi_order_v = list("-","Sword Fish","Blue Shark","Tiger Shark","+","Isotonic Skin","v","-","Predatory Instincts")
//Crafting
	list/crafting_order_h = list("Rookie Blacksmith","Trained Blacksmith","Veteran Blacksmith","Master Blacksmith","")
	list/crafting_order_v = list("-","Chef","Tailor","","+","","v","-","")
//Tsuchigumo
	list/spider_order_h = list("Tsuchigumo Clan","Swift Secretion","Stealth Spider","Sticky Gold","Spider Obscurity","Six arms","Spider Mastery","Sharp Shooter")
	list/spider_order_v = list("-","Rapid Secretion","Sticky Gold Enhancement","+","Stealth Sniper","-","v","Golden Fluid Reserves","+","Shadow Spider","+","Adhesive Substrate","-","v","-","v","Dragline silk")
//Nimbus
	//list/nimbus_order_h = list("Nimbus Clan","Kaminari Hidari","Oni Kanabo","Demonic Physique","Storm Cloaked")
	//list/nimbus_order_v = list("Ginki Shison","Storm Conduit","Lightning Conductor","Kekkei Genkai - Ranton","Bending Light")
	//list/nimbus_order_b = list("Kinki Shison","Hung-Kuen Rings","Unstoppable Force","Veil of Thunder")

//Medic
	list/medic_order_h = list("Medical Training","Medical Adept","Overflow","Medical Expert","Medical Master","Medical Grandmaster")
	list/medic_order_v = list("Needles of Death","Herbalist II","Herbalist III","Geneticist")
	list/medic_order_b = list("Surgeon","Field Medic","Undying Oath")

//Senju
	list/Senju_order_h = list("Senju Clan","Control","Senju Talent","Natural Gift","Expanded Potential","Great Vigor","Senju Weapon Mastery","Senju Armor Proficiency")
	list/Senju_order_v = list("Unlimited Vigor","Kekkei Genkai - Mokuton","Gatekeeper","Regenerative Cells","Chakra Sapping",)
	list/Senju_order_b = list("Senju Earth Mastery","Versatile","Senju Water Mastery","One-Handed Seals","Kaizen","Limitless Potential")
//Sakujak
	list/sakujak_order_h = list("Sakujak Clan","Kinetic Burst","Close Combat Specialist","Hearth and Home","Explosive Taijutsu Master","Passive Detonation","Big Bang")
	list/sakujak_order_v = list("Explosive Taijutsu","Clay Creation","+","Duplication","+","Second Life","v","v","-","Shell Shock","+","Flash Blast")


//Complete - Missing SSOM Perks
	list/ken_order_h = list("Kenjutsu Practitioner","Wakizashi Mastery","Katana Mastery","Battojutsu Practitioner","Nitoryu","Carving Strikes","One-Eyed Dragon")
	list/ken_order_v = list("-","-","-","Kogaryu","+","Cleaver","+","Butcher")

//Fuuin
	list/fuuin_order_h = list("Fuuinjutsu Training","Fuuinjutsu Adept","Fuuinjutsu Expert","Five Elements Sealing","Fuuinjutsu Master","Fuuinjutsu Grandmaster")
	list/fuuin_order_v = list("-","Summoning Contract","+","Blood Contract","+","Extended Contract","v","-","v","Contract Vigilance","+","Jutsu-Shiki Specialist")

//Yuki
	list/yuki_order_h = list("Yuki Clan","Shinkyuu Tsurara","Seiki Senmonka","Kagami Gohei","Shimoyake","Tousha","Yukionna")
	list/yuki_order_v = list("Kekkei Genkai: Hyouton","Hyouton Seal Mastery","+","Shunkan Reito","+","One Handed Seals","v","v","-","Moufubuki","+","Yukinba","-","-","v","Jitsugen")
/*
h = Yuki Clan, Shinkyuu Tsurara(1), Seiki Senmonka(2), Kagami Gohei, Shimoyake, Tousha(3*), Yukionna
v = Hyouton Seal Mastery (1*)(+) Shunkan Reito(1**)(+)One Handed Seals(highreqs 1***)(-)(v)(-) Moufubuki(2*)(+)Yukinba(2**)(-)(v)(-)(-)Jitsugen(3*)
*/

//Uzumaki
	list/uzu_order_h = list("Uzumaki Clan","Nintai-Ryoku","Vitality","Lost Traditions","Longevity","Heavy Chains","Torii Seal","Death's Face")
	list/uzu_order_v = list("-","-","Perfect Control","+","Eye of Kagura","+","Radiance","v","v","-","Uzumaki Unsealing","+","Kaifu Tactician","v","Uzushio","+","Okunouzu","v","-","Unbreakable","+","Consuming Chains","v","-","-")
//Shingen
	list/shingen_order_h = list("Shingen Clan","Shingen Doton","Crystal Mastery 1","Shimmer","Crystal Mastery 2","Crystal Fortress","Crystal Mastery 3","Healing Aura")
	list/shingen_order_v = list("-","-","Prism Burst","+","Elemental Conversion","+","Limitless Onslaught","v","v","-","Diamond Defense","+","Crystal Barrage","v","Crystal Skeleton","+","Crystal Scale","v","-","Diamond Defense","+","Crystal Barrage","v","-","-")


//complete
	//list/samurai_order_h = list("Samurai","Traditional Blade","Steel Reserves","Will of Iron","Sabre Mastery",)
	//list/samurai_order_v = list("-","Chi Based","Ittoryu","+","Samurai Armor Proficiency","Yonjibo","v","Iaido Master")
//incomplete
	//list/nara_order_h = list("Nara Clan","Kagemane Adept","Shady Tactics","Keen Strategist","Kagemane Expert","Devouring Shadow","Kagemane Master","Kagemane Grandmaster")
	//list/nara_order_v = list("-","Shadow Sewing","+","Shadow Split","v","-","-","Battle Intelligence","Spiritual Fortitude","+","Contorting Shadow","v","-","-","Shadow Meditation","+","Great Shadow")
// Kaifu
	list/kaifu_order_h = list("Kaifu Adept","Kaifu Expert","Gogyo Adept","Manipulated Tools","Emakimono Kassen","Kaifu Master","Kaifu Grandmaster")
	list/kaifu_order_v = list("Handscroll Dexterity","Martial Unsealing","+","Martial Adaptation","+","Eighteen Arms","v","-","v","Gogyo Expert","+","Gogyo Master","-","v","-","Ninpucho")
	///list/nimbus_order_h = list("")
//Sarutobi
	//list/sarutobi_order_h = list("Sarutobi Clan","Born For War","Natural Charisma","Jack Of All Trades","Indomitable","Dying Will","Versatility","Guardian Of The Flame")
	//list/sarutobi_order_v = list("-","Inheritors Of Fire","-","-","Kayaku-Hai Release","-","-","-","-","-","-","-","-","v","-","v","-")
//Yamanaka
	//list/yamanaka_order_h = list("Yamanaka Clan","Mind Mastery","Natural Charisma","Jack Of All Trades","Indomitable","Dying Will","Versatility","Guardian Of The Flame")
	//list/yamanaka_order_v = list("-","Inheritors Of Fire","-","-","Kayaku-Hai Release","-","-","-","-","-","-","-","-","v","-","v","-")

client
	Click(A,B,C)
/*		world<<"You clicked [A],[B],[C]." */
		if(C == "PerkTree1.Tree1")

			if(istype(A,/SkillTreeNode/))
				src.mob.tree_selection = A
				usr.output_details()

		..()
    // the above is for identifying what is clicked and running the function: refreshpublicdatabasemini2() which is a proc and can be found and explained below

mob
	proc
		output_details()

			clear_output()

			/*src << output("[tree_selection.mimic.name]","PerkTree1.NameOutput")
			src << output("[tree_selection.mimic.desc]","PerkTree1.DescOutput")
			for(var/i in tree_selection.mimic.prerequisites)
				src << output("[i]","PerkTree1.ReqsOutput")*/
			var/reqs
			for(var/i in tree_selection.mimic.prerequisites)
				reqs = i

			src << output({"
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<style>
	a{
	color:#DDBE0D;
	}
	body{
	color:[tree_selection.mimic.perk_color];
	background-color:black;
	font-family:calibri;
	}
	table, th, td {
	  vertical-align: top;
	  padding-left: 0px;
	  padding-right: 13px;
	  font-size:13px;
	}
	.leftcolumn {
	color:#DDBE0D;
	}
	</style>
	</head>
	<body>
	<table style="width:100%">
	  <tr>
	    <td><div class=leftcolumn>Name</div></td>
	    <td><b>[tree_selection.mimic.name] </b></td>
	  </tr>
	  <tr>
	    <td><div class=leftcolumn>Desc</div></td>
	    <td><font color=white>[tree_selection.mimic.desc]</font></td>
	  </tr>
	   <tr>
	    <td><div class=leftcolumn>Note</div></td>
	    <td><i>[tree_selection.mimic.perk_note]</i></td>
	  </tr>
	     <tr>
	    <td><div class=leftcolumn>Reqs</div></td>
	    <td><font color=white>[reqs]</td>
	  </tr>
	     <tr>
	    <td><div class=leftcolumn>Cost</div></td>
	    <td> <font color=white>[tree_selection.mimic.point_cost] point(s)</td>
	  </tr>
	</table>
	</body>
"},"PerkTree1.DescOutput")

		clear_output()
			/*src << output(null,"PerkTree1.NameOutput")
			src << output(null,"PerkTree1.DescOutput")
			src << output(null,"PerkTree1.ReqsOutput")*/
			src << output("<body bgcolor=black>","PerkTree1.DescOutput")

//when this proc is called, it checks if what was clicked by the above Click() function is a perk and if it is, it outputs it's variable details in the places written

obj/jutsu/perk/databaseperk
// calling upon the databaseperk object that's used in the Click() function and refreshpublicdatabasemini proc. perk gets stored in this variable

mob/verb
	PublicSkillTree()
		set hidden = 1
		winset(usr,"PerkTree1","is-visible=true")
		winset(usr,"PerkTree1.Tree1", "icon-size=35")
		src << output("<body bgcolor=black>","PerkTree1.DescOutput")
		//ClickForward()

	// the above is a verb connected to the 'Specialization' button which can be found in the skin_backup.dmf file, opens skill tree and also spawns first Node

	ClickForward()
		set hidden = 1

		Boolswitch += 1
		if(Boolswitch>=MAX_PAGES)
			Boolswitch = 1
		Pagenum = Boolswitch

		Clear_Tree() //Clears tree
		Auto_Gen() //Automaticaly generates the tree depending on the page number

		if(Pagenum>MAX_PAGES)
			Pagenum = MAX_PAGES

	ClickBackward()
		set hidden = 1

		Boolswitch = Boolswitch - 1
		if(Boolswitch<1)
			Boolswitch = MAX_PAGES
		Pagenum = Boolswitch

		Clear_Tree()
		Auto_Gen()

	ResetTree()
		set hidden=1
		return
		Boolswitch = 1
		Pagenum = 1

mob
	Admin6
		verb
			Change_SkillTrees()
				set category = "Skill Trees"
				var/i = input("Which skilltree would you like to change?") in list("Katon","Suiton","Doton","Raiton","Fuuton")
				switch(i)
					if("Katon")
						var/ii = input("Vertical Tree, or Horizontal Tree?") in list("Vertical","Horizontal")
						switch(ii)
							if("Vertical")
								var/c = input("Choose the Perk") in katon_order_v
								var/obj/rename = input("Replace with which perk?") in world_perks
								var/the_index = katon_order_h.Find(c)
								var/new_c = rename.name
								katon_order_v.Remove(c)
								katon_order_v.Insert(the_index,new_c)

							if("Horizontal")
								var/c = input("Choose the Perk") in katon_order_h
								var/obj/rename = input("Replace with which perk?") in world_perks
								var/the_index = katon_order_h.Find(c)
								var/new_c = rename.name
								katon_order_h.Remove(c)
								katon_order_h.Insert(the_index,new_c)
								alert("Changed [c] to [new_c].")
					if("Suiton")
						var/ii = input("Vertical Tree, or Horizontal Tree?") in list("Vertical","Horizontal")
						switch(ii)
							if("Vertical")
								var/c = input("Choose the Perk") in suiton_order_v
								var/obj/rename = input("Replace with which perk?") in world_perks
								var/the_index = suiton_order_v.Find(c)
								var/new_c = rename.name
								suiton_order_v.Remove(c)
								suiton_order_v.Insert(the_index,new_c)
								alert("Changed [c] to [new_c].")

							if("Horizontal")
								var/c = input("Choose the Perk") in suiton_order_h
								var/obj/rename = input("Replace with which perk?") in world_perks
								var/the_index = suiton_order_h.Find(c)
								var/new_c = rename.name
								suiton_order_h.Remove(c)
								suiton_order_h.Insert(the_index,new_c)
								alert("Changed [c] to [new_c].")
					if("Doton")
						var/ii = input("Vertical Tree, or Horizontal Tree?") in list("Vertical","Horizontal")
						switch(ii)
							if("Vertical")
								var/c = input("Choose the Perk") in doton_order_v
								var/obj/rename = input("Replace with which perk?") in world_perks
								var/the_index = doton_order_h.Find(c)
								var/new_c = rename.name
								doton_order_v.Remove(c)
								doton_order_v.Insert(the_index,new_c)
								alert("Changed [c] to [new_c].")

							if("Horizontal")
								var/c = input("Choose the Perk") in doton_order_h
								var/obj/rename = input("Replace with which perk?") in world_perks
								var/the_index = doton_order_h.Find(c)
								var/new_c = rename.name
								doton_order_h.Remove(c)
								doton_order_h.Insert(the_index,new_c)
								alert("Changed [c] to [new_c].")
					if("Raiton")
						var/ii = input("Vertical Tree, or Horizontal Tree?") in list("Vertical","Horizontal")
						switch(ii)
							if("Vertical")
								var/c = input("Choose the Perk") in raiton_order_v
								var/obj/rename = input("Replace with which perk?") in world_perks
								var/the_index = raiton_order_h.Find(c)
								var/new_c = rename.name
								raiton_order_v.Remove(c)
								raiton_order_v.Insert(the_index,new_c)
								alert("Changed [c] to [new_c].")

							if("Horizontal")
								var/c = input("Choose the Perk") in raiton_order_h
								var/obj/rename = input("Replace with which perk?") in world_perks
								var/the_index = raiton_order_h.Find(c)
								var/new_c = rename.name
								raiton_order_h.Remove(c)
								raiton_order_h.Insert(the_index,new_c)
								alert("Changed [c] to [new_c].")
					if("Fuuton")
						var/ii = input("Vertical Tree, or Horizontal Tree?") in list("Vertical","Horizontal")
						switch(ii)
							if("Vertical")
								var/c = input("Choose the Perk") in fuuton_order_v
								var/obj/rename = input("Replace with which perk?") in world_perks
								var/the_index = fuuton_order_v.Find(c)
								var/new_c = rename.name
								fuuton_order_v.Remove(c)
								fuuton_order_v.Insert(the_index,new_c)
								alert("Changed [c] to [new_c].")

							if("Horizontal")
								var/c = input("Choose the Perk") in fuuton_order_h
								var/obj/rename = input("Replace with which perk?") in world_perks
								var/the_index = fuuton_order_h.Find(c)
								var/new_c = rename.name
								fuuton_order_h.Remove(c)
								fuuton_order_h.Insert(the_index,new_c)
								alert("Changed [c] to [new_c].")


// from below and on will just be list of perks added to tree and their variables, first is doton. jutsu_type is commented out cause it procs error, may be needed in future though.
// refer to PerkSSO2.0.dmi file to get the references for icon states, screen_loc key is MapControl:X,Y


//okowo's way

// Save/Load the _order lists AKA the tree structure //

proc/save_tree_order()
	var/savefile/a = new("archive_savefiles/tree_order")
	a["katon_tree_order_h"] << katon_order_h
	a["katon_tree_order_v"] << katon_order_v
	a["suiton_tree_order_h"] << suiton_order_h
	a["suiton_tree_order_v"] << suiton_order_v
	a["doton_tree_order_h"] << doton_order_h
	a["doton_tree_order_v"] << doton_order_v
	a["fuuton_tree_order_h"] << fuuton_order_h
	a["fuuton_tree_order_v"] << fuuton_order_v
	a["raiton_tree_order_h"] << raiton_order_h
	a["raiton_tree_order_v"] << raiton_order_v
	a["inu_tree_order_h"] << inu_order_h
	a["inu_tree_order_v"] << inu_order_v
	a["weap_tree_order_h"] << weap_order_h
	a["weap_tree_order_v"] << weap_order_v
	//a["nara_tree_order_h"] << nara_order_h
	//a["nara_tree_order_v"] << nara_order_v
	a["shingen_tree_order_h"] << shingen_order_h
	a["shingen_tree_order_v"] << shingen_order_v
	a["uzu_tree_order_h"] << uzu_order_h
	a["uzu_tree_order_v"] << uzu_order_v
	a["Senju_tree_order_h"] << Senju_order_h
	a["Senju_tree_order_v"] << Senju_order_v
	a["Senju_tree_order_b"] << Senju_order_b
	//a["samurai_tree_order_v"] << samurai_order_v
	a["yuki_tree_order_h"] << yuki_order_h
	a["yuki_tree_order_v"] << yuki_order_v
	a["hoshi_tree_order_h"] << hoshi_order_h
	a["hoshi_tree_order_v"] << hoshi_order_v
	a["crafting_tree_order_h"] << hoshi_order_h
	a["crafting_tree_order_v"] << hoshi_order_v
	a["aki_tree_order_h"] << aki_order_h
	a["aki_tree_order_v"] << aki_order_v
	a["gen_tree_order_h"] << gen_order_h
	a["gen_tree_order_v"] << gen_order_v
	a["hoz_tree_order_h"] << hoz_order_h
	a["hoz_tree_order_v"] << hoz_order_v
	/*a["kag_tree_order_h"] << kag_order_h
	a["kag_tree_order_v"] << kag_order_v */
	//a["kami_tree_order_h"] << kami_order_h
	//a["kami_tree_order_v"] << kami_order_v
	a["ken_tree_order_h"] << ken_order_h
	a["ken_tree_order_v"] << ken_order_v
	a["fuuin_tree_order_h"] << fuuin_order_h
	a["fuuin_tree_order_v"] << fuuin_order_v
	//a["nimbus_tree_order_h"] << nimbus_order_h
	//a["nimbus_tree_order_v"] << nimbus_order_v
	//a["nimbus_tree_order_b"] << nimbus_order_b
	a["medic_tree_order_h"] << medic_order_h
	a["medic_tree_order_v"] << medic_order_v
	a["medic_tree_order_b"] << medic_order_b
	a["kaifu_tree_order_h"] << kaifu_order_h
	a["kaifu_tree_order_v"] << kaifu_order_v
	//a["sarutobi_tree_order_h"] << sarutobi_order_h
	//a["sarutobi_tree_order_v"] << sarutobi_order_v
	a["spider_tree_order_h"] << spider_order_h
	a["spider_tree_order_v"] << spider_order_v
	//a["yamanaka_tree_order_h"] << yamanaka_order_h
	//a["yamanaka_tree_order_v"] << yamanaka_order_v
	a["sakujak_tree_order_h"] << sakujak_order_h
	a["sakujak_tree_order_v"] << sakujak_order_v

proc/load_tree_order()
	if(fexists("archive_savefiles/tree_order"))
		//var/savefile/a = new("archive_savefiles/tree_order")
/*		a["katon_tree_order_h"] >> katon_order_h
		a["katon_tree_order_v"] >> katon_order_v
		a["suiton_tree_order_h"] >> suiton_order_h
		a["suiton_tree_order_v"] >> suiton_order_v
		a["doton_tree_order_h"] >> doton_order_h
		a["doton_tree_order_v"] >> doton_order_v
		a["fuuton_tree_order_h"] >> fuuton_order_h
		a["fuuton_tree_order_v"] >> fuuton_order_v
		a["raiton_tree_order_h"] >> raiton_order_h
		a["raiton_tree_order_v"] >> raiton_order_v
		a["inu_tree_order_h"] >> inu_order_h
		a["inu_tree_order_v"] >> inu_order_v
		a["weap_tree_order_h"] >> weap_order_h
		a["weap_tree_order_v"] >> weap_order_v
		a["nara_tree_order_h"] >> nara_order_h
		a["nara_tree_order_v"] >> nara_order_v
		a["uzu_tree_order_h"] >> uzu_order_h
		a["uzu_tree_order_v"] >> uzu_order_v
		a["Senju_tree_order_h"] >> Senju_order_h
		a["Senju_tree_order_v"] >> Senju_order_v
		a["Senju_tree_order_b"] >> Senju_order_b
		a["samurai_tree_order_h"] >> samurai_order_h
		a["samurai_tree_order_v"] >> samurai_order_v
		a["yuki_tree_order_h"] >> yuki_order_h
		a["yuki_tree_order_v"] >> yuki_order_v
		a["hoshi_tree_order_h"] >> hoshi_order_h
		a["hoshi_tree_order_v"] >> hoshi_order_v
		a["aki_tree_order_h"] << aki_order_h
		a["aki_tree_order_v"] << aki_order_v
		a["hoz_tree_order_h"] << hoz_order_h
		a["hoz_tree_order_v"] << hoz_order_v
		a["kag_tree_order_h"] << kag_order_h
		a["kag_tree_order_v"] << kag_order_v
		a["ken_tree_order_h"] << ken_order_h
		a["ken_tree_order_v"] << ken_order_v
		a["nimbus_tree_order_h"] >> nimbus_order_h
		a["nimbus_tree_order_v"] >> nimbus_order_v
		a["nimbus_tree_order_b"] >> nimbus_order_b
*/
		world.log << "ARCHIVE: Loaded skill tree."


// This proc will clear the map of the trees //

mob
	proc
		Clear_Tree()
			for(var/SkillTreeNode/o in src.client.screen)
				del(o)
			for(var/NodeLines/o in src.client.screen)
				del(o)

//This proc automatically generates the perk trees by referring to the relevant perk list. The convention is perk_order i.e. katon_order, uchiha_order, etc. //
//Please note that only the perks are really 'generated', you still have to define a structure for the tree in here. (like where everything is placed)

		Auto_Gen()

			switch(Pagenum)
				if(1) //Katon Page

					//This adds the big Katon image

					winset(src,"PerkTree1.PerkTreeImage","image=\ref[fcopy_rsc('Katon.png')]")
					winset(src,"PerkTree1.PerkTreeImage","image-mode=stretch")
					src << output(null,"PerkTree1.TreePageOutput")
					src << output("Katon Progression Tree","PerkTree1.TreePageOutput")

					//This is the Horizontal Tree [COPY AND PASTE START HERE]

					var/tree_length = katon_order_h.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems
					var/noodle_length = katon_order_h.len

					var/node_x = 16 //For the perks
					var/node_xx = 15 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = katon_order_h[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-4"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node


					for(var/i=1, i<noodle_length, i++)

						node_xx -= 2

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-4"

						src.client.screen += noodle


					//It's possible to add perks in different x positions (heights) by changing the '-4' in screen loc. We can do this for progressive perks/side perks, or whatever you want.

					//This is the Vertical Tree

					var/tree_length_v = katon_order_v.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems

					node_x = 14 //For the perks
					node_xx = 14 //For the spacers

					var/node_y = -2
					var/node_yy = -3

					for(var/i=1, i<tree_length_v, i++)

						if(katon_order_v[i] == "-") //If we want this bit to be blank...
							node_x -= 2  //Make space!
							node_xx -= 2
							continue //Go to the next iteration of the loop

						if(katon_order_v[i] == "+") //If we want to go even higher up the tree...
							node_y += 2 //We allow it to go higher, but this will affect every other future node
							node_yy += 2 //Then we go to the next iteration of the loop.
							continue

						if(katon_order_v[i] == "v") //So we must bring it back down after doing something like that unless we want each future node to be...
							node_y -= 2 //...On that same level.
							node_yy -= 2 //Though we can also just put 'v' in the list to make the tree have vertical lines going down too!
							continue //Then we go to the next iteration of the loop.

						var/SkillTreeNode/node = new
						node.name = katon_order_v[i]

						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],[node_y]"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Vertical"
						noodle.screen_loc = "Tree1:-[node_xx],[node_yy]"
						src.client.screen += node
						src.client.screen += noodle

						var/next_link = i+1
						if((katon_order_v[next_link] == "+") || (katon_order_v[next_link] == "v")) //If the next thing in the tree is just a perk higher or lower than the current one...
							continue //On the same x-axis, then we're not gonna change the x-axis value, yeah? Then we go to the next iteration of the loop.
						else
							node_x -= 2  //Otherwise, we move the tree along, as we should!
							node_xx -= 2

						//[COPY AND PASTE END HERE]

				if(24) //Weapon Page

					winset(src,"PerkTree1.PerkTreeImage","image=\ref[fcopy_rsc('Kenjutsu.png')]")
					winset(src,"PerkTree1.PerkTreeImage","image-mode=stretch")
					src << output(null,"PerkTree1.TreePageOutput")
					src << output("Kenjutsu Progression Tree","PerkTree1.TreePageOutput")

					var/tree_length = ken_order_h.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems
					var/noodle_length = ken_order_h.len

					var/node_x = 16 //For the perks
					var/node_xx = 15 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = ken_order_h[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-4"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node


					for(var/i=1, i<noodle_length, i++)

						node_xx -= 2

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-4"

						src.client.screen += noodle


					//It's possible to add perks in different x positions (heights) by changing the '-4' in screen loc. We can do this for progressive perks/side perks, or whatever you want.

					//This is the Vertical Tree

					var/tree_length_v = ken_order_v.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems

					node_x = 14 //For the perks
					node_xx = 14 //For the spacers

					var/node_y = -2
					var/node_yy = -3

					for(var/i=1, i<tree_length_v, i++)

						if(ken_order_v[i] == "-") //If we want this bit to be blank...
							node_x -= 2  //Make space!
							node_xx -= 2
							continue //Go to the next iteration of the loop

						if(ken_order_v[i] == "+") //If we want to go even higher up the tree...
							node_y += 2 //We allow it to go higher, but this will affect every other future node
							node_yy += 2 //Then we go to the next iteration of the loop.
							continue

						if(ken_order_v[i] == "v") //So we must bring it back down after doing something like that unless we want each future node to be...
							node_y -= 2 //...On that same level.
							node_yy -= 2 //Though we can also just put 'v' in the list to make the tree have vertical lines going down too!
							continue //Then we go to the next iteration of the loop.

						var/SkillTreeNode/node = new
						node.name = ken_order_v[i]

						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],[node_y]"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Vertical"
						noodle.screen_loc = "Tree1:-[node_xx],[node_yy]"
						src.client.screen += node
						src.client.screen += noodle

						var/SkillTreeNode/nodeE3x = new
						nodeE3x.name = "Iaido Master"
						nodeE3x.screen_loc ="Tree1:-12,0"
						nodeE3x.Find_Mimic()
						src.client.screen += nodeE3x

						var/NodeLines/diagNzabx = new
						diagNzabx.icon_state = "Horizontal"
						diagNzabx.screen_loc = "Tree1:-13,0"
						src.client.screen += diagNzabx


						var/SkillTreeNode/nodeE3xu = new
						nodeE3xu.name = "Ittoryu"
						nodeE3xu.screen_loc ="Tree1:-14,0"
						nodeE3xu.Find_Mimic()
						src.client.screen += nodeE3xu

						var/next_link = i+1
						if((ken_order_v[next_link] == "+") || (ken_order_v[next_link] == "v")) //If the next thing in the tree is just a perk higher or lower than the current one...
							continue //On the same x-axis, then we're not gonna change the x-axis value, yeah? Then we go to the next iteration of the loop.
						else
							node_x -= 2  //Otherwise, we move the tree along, as we should!
							node_xx -= 2


				if(2) //Suiton Page

					winset(src,"PerkTree1.PerkTreeImage","image=\ref[fcopy_rsc('Suiton.png')]")
					winset(src,"PerkTree1.PerkTreeImage","image-mode=stretch")
					src << output(null,"PerkTree1.TreePageOutput")
					src << output("Suiton Progression Tree","PerkTree1.TreePageOutput")

					var/tree_length = suiton_order_h.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems
					var/noodle_length = suiton_order_h.len

					var/node_x = 16 //For the perks
					var/node_xx = 15 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = suiton_order_h[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-4"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node


					for(var/i=1, i<noodle_length, i++)

						node_xx -= 2

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-4"

						src.client.screen += noodle


					//It's possible to add perks in different x positions (heights) by changing the '-4' in screen loc. We can do this for progressive perks/side perks, or whatever you want.

					//This is the Vertical Tree

					var/tree_length_v = suiton_order_v.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems

					node_x = 14 //For the perks
					node_xx = 14 //For the spacers

					var/node_y = -2
					var/node_yy = -3

					for(var/i=1, i<tree_length_v, i++)

						if(suiton_order_v[i] == "-") //If we want this bit to be blank...
							node_x -= 2  //Make space!
							node_xx -= 2
							continue //Go to the next iteration of the loop

						if(suiton_order_v[i] == "+") //If we want to go even higher up the tree...
							node_y += 2 //We allow it to go higher, but this will affect every other future node
							node_yy += 2 //Then we go to the next iteration of the loop.
							continue

						if(suiton_order_v[i] == "v") //So we must bring it back down after doing something like that unless we want each future node to be...
							node_y -= 2 //...On that same level.
							node_yy -= 2 //Though we can also just put 'v' in the list to make the tree have vertical lines going down too!
							continue //Then we go to the next iteration of the loop.

						var/SkillTreeNode/node = new
						node.name = suiton_order_v[i]

						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],[node_y]"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Vertical"
						noodle.screen_loc = "Tree1:-[node_xx],[node_yy]"
						src.client.screen += node
						src.client.screen += noodle

						var/next_link = i+1
						if((suiton_order_v[next_link] == "+") || (suiton_order_v[next_link] == "v")) //If the next thing in the tree is just a perk higher or lower than the current one...
							continue //On the same x-axis, then we're not gonna change the x-axis value, yeah? Then we go to the next iteration of the loop.
						else
							node_x -= 2  //Otherwise, we move the tree along, as we should!
							node_xx -= 2


				if(3) //Doton Page

					winset(src,"PerkTree1.PerkTreeImage","image=\ref[fcopy_rsc('Doton.png')]")
					winset(src,"PerkTree1.PerkTreeImage","image-mode=stretch")
					src << output(null,"PerkTree1.TreePageOutput")
					src << output("Doton Progression Tree","PerkTree1.TreePageOutput")

					var/tree_length = doton_order_h.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems
					var/noodle_length = doton_order_h.len

					var/node_x = 16 //For the perks
					var/node_xx = 15 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = doton_order_h[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-4"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node


					for(var/i=1, i<noodle_length, i++)

						node_xx -= 2

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-4"

						src.client.screen += noodle


					//It's possible to add perks in different x positions (heights) by changing the '-4' in screen loc. We can do this for progressive perks/side perks, or whatever you want.

					//This is the Vertical Tree

					var/tree_length_v = doton_order_v.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems

					node_x = 14 //For the perks
					node_xx = 14 //For the spacers

					var/node_y = -2
					var/node_yy = -3

					for(var/i=1, i<tree_length_v, i++)

						if(doton_order_v[i] == "-") //If we want this bit to be blank...
							node_x -= 2  //Make space!
							node_xx -= 2
							continue //Go to the next iteration of the loop

						if(doton_order_v[i] == "+") //If we want to go even higher up the tree...
							node_y += 2 //We allow it to go higher, but this will affect every other future node
							node_yy += 2 //Then we go to the next iteration of the loop.
							continue

						if(doton_order_v[i] == "v") //So we must bring it back down after doing something like that unless we want each future node to be...
							node_y -= 2 //...On that same level.
							node_yy -= 2 //Though we can also just put 'v' in the list to make the tree have vertical lines going down too!
							continue //Then we go to the next iteration of the loop.

						var/SkillTreeNode/node = new
						node.name = doton_order_v[i]

						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],[node_y]"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Vertical"
						noodle.screen_loc = "Tree1:-[node_xx],[node_yy]"
						src.client.screen += node
						src.client.screen += noodle

						var/next_link = i+1
						if((doton_order_v[next_link] == "+") || (doton_order_v[next_link] == "v")) //If the next thing in the tree is just a perk higher or lower than the current one...
							continue //On the same x-axis, then we're not gonna change the x-axis value, yeah? Then we go to the next iteration of the loop.
						else
							node_x -= 2  //Otherwise, we move the tree along, as we should!
							node_xx -= 2

				if(4) //Raiton Page

					winset(src,"PerkTree1.PerkTreeImage","image=\ref[fcopy_rsc('Raiton.png')]")
					winset(src,"PerkTree1.PerkTreeImage","image-mode=stretch")
					src << output(null,"PerkTree1.TreePageOutput")
					src << output("Raiton Progression Tree","PerkTree1.TreePageOutput")

					var/tree_length = raiton_order_h.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems
					var/noodle_length = raiton_order_h.len

					var/node_x = 16 //For the perks
					var/node_xx = 15 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = raiton_order_h[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-4"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node


					for(var/i=1, i<noodle_length, i++)

						node_xx -= 2

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-4"

						src.client.screen += noodle


					//It's possible to add perks in different x positions (heights) by changing the '-4' in screen loc. We can do this for progressive perks/side perks, or whatever you want.

					//This is the Vertical Tree

					var/tree_length_v = raiton_order_v.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems

					node_x = 14 //For the perks
					node_xx = 14 //For the spacers

					var/node_y = -2
					var/node_yy = -3

					for(var/i=1, i<tree_length_v, i++)

						if(raiton_order_v[i] == "-") //If we want this bit to be blank...
							node_x -= 2  //Make space!
							node_xx -= 2
							continue //Go to the next iteration of the loop

						if(raiton_order_v[i] == "+") //If we want to go even higher up the tree...
							node_y += 2 //We allow it to go higher, but this will affect every other future node
							node_yy += 2 //Then we go to the next iteration of the loop.
							continue

						if(raiton_order_v[i] == "v") //So we must bring it back down after doing something like that unless we want each future node to be...
							node_y -= 2 //...On that same level.
							node_yy -= 2 //Though we can also just put 'v' in the list to make the tree have vertical lines going down too!
							continue //Then we go to the next iteration of the loop.

						var/SkillTreeNode/node = new
						node.name = raiton_order_v[i]

						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],[node_y]"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Vertical"
						noodle.screen_loc = "Tree1:-[node_xx],[node_yy]"
						src.client.screen += node
						src.client.screen += noodle

						var/next_link = i+1
						if((raiton_order_v[next_link] == "+") || (raiton_order_v[next_link] == "v")) //If the next thing in the tree is just a perk higher or lower than the current one...
							continue //On the same x-axis, then we're not gonna change the x-axis value, yeah? Then we go to the next iteration of the loop.
						else
							node_x -= 2  //Otherwise, we move the tree along, as we should!
							node_xx -= 2


				if(5) //Fuuton Page

					winset(src,"PerkTree1.PerkTreeImage","image=\ref[fcopy_rsc('Fuuton.png')]")
					winset(src,"PerkTree1.PerkTreeImage","image-mode=stretch")
					src << output(null,"PerkTree1.TreePageOutput")
					src << output("Fuuton Progression Tree","PerkTree1.TreePageOutput")

					var/tree_length = fuuton_order_h.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems
					var/noodle_length = fuuton_order_h.len

					var/node_x = 16 //For the perks
					var/node_xx = 15 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = fuuton_order_h[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-4"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node


					for(var/i=1, i<noodle_length, i++)

						node_xx -= 2

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-4"

						src.client.screen += noodle


					//It's possible to add perks in different x positions (heights) by changing the '-4' in screen loc. We can do this for progressive perks/side perks, or whatever you want.

					//This is the Vertical Tree

					var/tree_length_v = fuuton_order_v.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems

					node_x = 14 //For the perks
					node_xx = 14 //For the spacers

					var/node_y = -2
					var/node_yy = -3

					for(var/i=1, i<tree_length_v, i++)

						if(fuuton_order_v[i] == "-") //If we want this bit to be blank...
							node_x -= 2  //Make space!
							node_xx -= 2
							continue //Go to the next iteration of the loop

						if(fuuton_order_v[i] == "+") //If we want to go even higher up the tree...
							node_y += 2 //We allow it to go higher, but this will affect every other future node
							node_yy += 2 //Then we go to the next iteration of the loop.
							continue

						if(fuuton_order_v[i] == "v") //So we must bring it back down after doing something like that unless we want each future node to be...
							node_y -= 2 //...On that same level.
							node_yy -= 2 //Though we can also just put 'v' in the list to make the tree have vertical lines going down too!
							continue //Then we go to the next iteration of the loop.

						var/SkillTreeNode/node = new
						node.name = fuuton_order_v[i]

						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],[node_y]"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Vertical"
						noodle.screen_loc = "Tree1:-[node_xx],[node_yy]"
						src.client.screen += node
						src.client.screen += noodle

						var/next_link = i+1
						if((fuuton_order_v[next_link] == "+") || (fuuton_order_v[next_link] == "v")) //If the next thing in the tree is just a perk higher or lower than the current one...
							continue //On the same x-axis, then we're not gonna change the x-axis value, yeah? Then we go to the next iteration of the loop.
						else
							node_x -= 2  //Otherwise, we move the tree along, as we should!
							node_xx -= 2

				if(6) //Shurikenjutsu Page

					winset(src,"PerkTree1.PerkTreeImage","image=\ref[fcopy_rsc('Shurikenjutsu.png')]")
					winset(src,"PerkTree1.PerkTreeImage","image-mode=stretch")
					src << output(null,"PerkTree1.TreePageOutput")
					src << output("Shurikenjutsu Prog Tree","PerkTree1.TreePageOutput")

					var/tree_length = weap_order_h.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems
					var/noodle_length = weap_order_h.len

					var/node_x = 16 //For the perks
					var/node_xx = 15 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = weap_order_h[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-4"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node


					for(var/i=1, i<noodle_length, i++)

						node_xx -= 2

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-4"

						src.client.screen += noodle


					//It's possible to add perks in different x positions (heights) by changing the '-4' in screen loc. We can do this for progressive perks/side perks, or whatever you want.

					//This is the Vertical Tree

					var/tree_length_v = weap_order_v.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems

					node_x = 14 //For the perks
					node_xx = 14 //For the spacers

					var/node_y = -2
					var/node_yy = -3

					for(var/i=1, i<tree_length_v, i++)

						if(weap_order_v[i] == "-") //If we want this bit to be blank...
							node_x -= 2  //Make space!
							node_xx -= 2
							continue //Go to the next iteration of the loop

						if(weap_order_v[i] == "+") //If we want to go even higher up the tree...
							node_y += 2 //We allow it to go higher, but this will affect every other future node
							node_yy += 2 //Then we go to the next iteration of the loop.
							continue

						if(weap_order_v[i] == "v") //So we must bring it back down after doing something like that unless we want each future node to be...
							node_y -= 2 //...On that same level.
							node_yy -= 2 //Though we can also just put 'v' in the list to make the tree have vertical lines going down too!
							continue //Then we go to the next iteration of the loop.

						var/SkillTreeNode/node = new
						node.name = weap_order_v[i]

						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],[node_y]"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Vertical"
						noodle.screen_loc = "Tree1:-[node_xx],[node_yy]"
						src.client.screen += node
						src.client.screen += noodle

						var/next_link = i+1
						if((weap_order_v[next_link] == "+") || (weap_order_v[next_link] == "v")) //If the next thing in the tree is just a perk higher or lower than the current one...
							continue //On the same x-axis, then we're not gonna change the x-axis value, yeah? Then we go to the next iteration of the loop.
						else
							node_x -= 2  //Otherwise, we move the tree along, as we should!
							node_xx -= 2
				if(9) //Tai Page

					winset(src,"PerkTree1.PerkTreeImage","image=\ref[fcopy_rsc('Taijutsu.png')]")
					winset(src,"PerkTree1.PerkTreeImage","image-mode=stretch")
					src << output(null,"PerkTree1.TreePageOutput")
					src << output("Taijutsu Progression Tree","PerkTree1.TreePageOutput")


//Middle Tree Portion
					var/tree_length = tai_order_h.len + 1
					var/noodle_length = tai_order_h.len

					var/node_x = 18 //For the perks
					var/node_xx = 17 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = tai_order_h[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-4"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node

					for(var/i=1, i<noodle_length, i++)
						node_xx -= 2
						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-4"

						src.client.screen += noodle


// Top Tree Portion
					tree_length = tai_order_v.len + 1
					noodle_length = tai_order_v.len

					node_x = 8 //For the perks
					node_xx = 7 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = tai_order_v[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-2"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node

					for(var/i=1, i<noodle_length, i++)
						node_xx -= 2
						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-2"

						src.client.screen += noodle

					var/SkillTreeNode/nodeE3 = new
					nodeE3.name = "60 Pound Burden"
					nodeE3.screen_loc ="Tree1:-4,0"
					nodeE3.Find_Mimic()
					src.client.screen += nodeE3

					var/SkillTreeNode/nodeE3h = new
					nodeE3h.name = "90 Pound Burden"
					nodeE3h.screen_loc ="Tree1:-2,0"
					nodeE3h.Find_Mimic()
					src.client.screen += nodeE3h


					var/SkillTreeNode/nodeE3a = new
					nodeE3a.name = "Build Up"
					nodeE3a.screen_loc ="Tree1:-8,-2"
					nodeE3a.Find_Mimic()
					src.client.screen += nodeE3a

					var/SkillTreeNode/nodeE3bz = new
					nodeE3bz.name = "Gate of Death"
					nodeE3bz.screen_loc ="Tree1:0,-6"
					nodeE3bz.Find_Mimic()
					src.client.screen += nodeE3bz

					var/NodeLines/diagNz = new
					diagNz.icon_state = "Vertical"
					diagNz.screen_loc = "Tree1:-8,-3"
					src.client.screen += diagNz

					var/NodeLines/diagNzab = new
					diagNzab.icon_state = "Horizontal"
					diagNzab.screen_loc = "Tree1:-7,-4"
					src.client.screen += diagNzab

					var/NodeLines/diagNzac = new
					diagNzac.icon_state = "Vertical"
					diagNzac.screen_loc = "Tree1:-4,-1"
					src.client.screen += diagNzac

					var/NodeLines/diagNzacv = new
					diagNzacv.icon_state = "Vertical"
					diagNzacv.screen_loc = "Tree1:-4,-3"
					src.client.screen += diagNzacv

					var/NodeLines/diagNzacva = new
					diagNzacva.icon_state = "Horizontal"
					diagNzacva.screen_loc = "Tree1:-3,0"
					src.client.screen += diagNzacva

					var/NodeLines/diagNzacvab = new
					diagNzacvab.icon_state = "Vertical"
					diagNzacvab.screen_loc = "Tree1:0,-5"
					src.client.screen += diagNzacvab
//Bot Tree Portion
					tree_length = tai_order_b.len + 1
					noodle_length = tai_order_b.len

					node_x = 14 //For the perks
					node_xx = 13 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = tai_order_b[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-6"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node

					for(var/i=1, i<noodle_length, i++)
						node_xx -= 2
						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-6"

						src.client.screen += noodle

					var/NodeLines/diagN = new
					diagN.icon_state = "Vertical"
					diagN.screen_loc = "Tree1:-12,-5"
					src.client.screen += diagN

					var/NodeLines/diagN2 = new
					diagN2.icon_state = "Vertical"
					diagN2.screen_loc = "Tree1:-12,-7"
					src.client.screen += diagN2

					var/NodeLines/diagNa = new
					diagNa.icon_state = "Vertical"
					diagNa.screen_loc = "Tree1:-8,-3"
					src.client.screen += diagNa

					var/NodeLines/diagN2a = new
					diagN2a.icon_state = "Vertical"
					diagN2a.screen_loc = "Tree1:-8,-5"
					src.client.screen += diagN2a

					var/NodeLines/diagN2ab = new
					diagN2ab.icon_state = "Vertical"
					diagN2ab.screen_loc = "Tree1:-8,-7"
					src.client.screen += diagN2ab

					var/NodeLines/diagN2abc = new
					diagN2abc.icon_state = "Horizontal"
					diagN2abc.screen_loc = "Tree1:-7,-8"
					src.client.screen += diagN2abc

					var/NodeLines/diagN2abcd = new
					diagN2abcd.icon_state = "Horizontal"
					diagN2abcd.screen_loc = "Tree1:-5,-8"
					src.client.screen += diagN2abcd

					var/SkillTreeNode/nodeE = new
					nodeE.name = "Kunai Knife Parrying"
					nodeE.screen_loc ="Tree1:-12,-8"
					nodeE.Find_Mimic()
					src.client.screen += nodeE

					var/SkillTreeNode/nodeEa = new
					nodeEa.name = "Free Runner"
					nodeEa.screen_loc ="Tree1:-8,-6"
					nodeEa.Find_Mimic()
					src.client.screen += nodeEa

					var/SkillTreeNode/nodeEb = new
					nodeEb.name = "Escape Artist"
					nodeEb.screen_loc ="Tree1:-8,-8"
					nodeEb.Find_Mimic()
					src.client.screen += nodeEb

					var/SkillTreeNode/nodeEc = new
					nodeEc.name = "Indirect Fighter"
					nodeEc.screen_loc ="Tree1:-6,-8"
					nodeEc.Find_Mimic()
					src.client.screen += nodeEc

					var/SkillTreeNode/nodeEd = new
					nodeEd.name = "Ephemeral Blur"
					nodeEd.screen_loc ="Tree1:-4,-8"
					nodeEd.Find_Mimic()
					src.client.screen += nodeEd

				//KAMI START
				/*if(29)
					winset(src,"PerkTree1.PerkTreeImage","image=\ref[fcopy_rsc('Kami.png')]")
					winset(src,"PerkTree1.PerkTreeImage","image-mode=stretch")
					src << output(null,"PerkTree1.TreePageOutput")
					src << output("Kami Progression Tree","PerkTree1.TreePageOutput")

					//This is the Horizontal Tree [COPY AND PASTE START HERE]

					var/tree_length = kami_order_h.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems
					var/noodle_length = kami_order_h.len

					var/node_x = 18 //For the perks
					var/node_xx = 17 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = kami_order_h[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-4"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node


					for(var/i=1, i<noodle_length, i++)

						node_xx -= 2

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-4"

						src.client.screen += noodle


					//It's possible to add perks in different x positions (heights) by changing the '-4' in screen loc. We can do this for progressive perks/side perks, or whatever you want.

					//This is the Vertical Tree

					var/tree_length_v = kami_order_v.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems

					node_x = 16 //For the perks
					node_xx = 16 //For the spacers

					var/node_y = -2
					var/node_yy = -3

					for(var/i=1, i<tree_length_v, i++)

						if(kami_order_v[i] == "-") //If we want this bit to be blank...
							node_x -= 2  //Make space!
							node_xx -= 2
							continue //Go to the next iteration of the loop

						if(kami_order_v[i] == "+") //If we want to go even higher up the tree...
							node_y += 2 //We allow it to go higher, but this will affect every other future node
							node_yy += 2 //Then we go to the next iteration of the loop.
							continue

						if(kami_order_v[i] == "v") //So we must bring it back down after doing something like that unless we want each future node to be...
							node_y -= 2 //...On that same level.
							node_yy -= 2 //Though we can also just put 'v' in the list to make the tree have vertical lines going down too!
							continue //Then we go to the next iteration of the loop.

						var/SkillTreeNode/node = new
						node.name = kami_order_v[i]

						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],[node_y]"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Vertical"
						noodle.screen_loc = "Tree1:-[node_xx],[node_yy]"
						src.client.screen += node
						src.client.screen += noodle

						var/next_link = i+1
						if((kami_order_v[next_link] == "+") || (kami_order_v[next_link] == "v")) //If the next thing in the tree is just a perk higher or lower than the current one...
							continue //On the same x-axis, then we're not gonna change the x-axis value, yeah? Then we go to the next iteration of the loop.
						else
							node_x -= 2  //Otherwise, we move the tree along, as we should!
							node_xx -= 2 */

						//[COPY AND PASTE END HERE]

				//KAGUYA START
				/*if()
					winset(src,"PerkTree1.PerkTreeImage","image=\ref[fcopy_rsc('Kaguya.png')]")
					winset(src,"PerkTree1.PerkTreeImage","image-mode=stretch")
					src << output(null,"PerkTree1.TreePageOutput")
					src << output("Kaguya Progression Tree","PerkTree1.TreePageOutput")

					//This is the Horizontal Tree [COPY AND PASTE START HERE]

					var/tree_length = kag_order_h.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems
					var/noodle_length = kag_order_h.len

					var/node_x = 18 //For the perks
					var/node_xx = 17 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = kag_order_h[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-4"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node


					for(var/i=1, i<noodle_length, i++)

						node_xx -= 2

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-4"

						src.client.screen += noodle


					//It's possible to add perks in different x positions (heights) by changing the '-4' in screen loc. We can do this for progressive perks/side perks, or whatever you want.

					//This is the Vertical Tree

					var/tree_length_v = kag_order_v.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems

					node_x = 16 //For the perks
					node_xx = 16 //For the spacers

					var/node_y = -2
					var/node_yy = -3

					for(var/i=1, i<tree_length_v, i++)

						if(kag_order_v[i] == "-") //If we want this bit to be blank...
							node_x -= 2  //Make space!
							node_xx -= 2
							continue //Go to the next iteration of the loop

						if(kag_order_v[i] == "+") //If we want to go even higher up the tree...
							node_y += 2 //We allow it to go higher, but this will affect every other future node
							node_yy += 2 //Then we go to the next iteration of the loop.
							continue

						if(kag_order_v[i] == "v") //So we must bring it back down after doing something like that unless we want each future node to be...
							node_y -= 2 //...On that same level.
							node_yy -= 2 //Though we can also just put 'v' in the list to make the tree have vertical lines going down too!
							continue //Then we go to the next iteration of the loop.

						var/SkillTreeNode/node = new
						node.name = kag_order_v[i]

						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],[node_y]"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Vertical"
						noodle.screen_loc = "Tree1:-[node_xx],[node_yy]"
						src.client.screen += node
						src.client.screen += noodle

						var/next_link = i+1
						if((kag_order_v[next_link] == "+") || (kag_order_v[next_link] == "v")) //If the next thing in the tree is just a perk higher or lower than the current one...
							continue //On the same x-axis, then we're not gonna change the x-axis value, yeah? Then we go to the next iteration of the loop.
						else
							node_x -= 2  //Otherwise, we move the tree along, as we should!
							node_xx -= 2 */

						//[COPY AND PASTE END HERE]
				//Spider//
				if(10) //Tsuchigumo

					winset(src,"PerkTree1.PerkTreeImage","image=\ref[fcopy_rsc('Spider.png')]")
					winset(src,"PerkTree1.PerkTreeImage","image-mode=stretch")
					src << output(null,"PerkTree1.TreePageOutput")
					src << output("Tsuchigumo Progression Tree","PerkTree1.TreePageOutput")

					var/tree_length = spider_order_h.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems
					var/noodle_length = spider_order_h.len

					var/node_x = 16 //For the perks
					var/node_xx = 15 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = spider_order_h[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-4"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node


					for(var/i=1, i<noodle_length, i++)

						node_xx -= 2

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-4"

						src.client.screen += noodle


					//It's possible to add perks in different x positions (heights) by changing the '-4' in screen loc. We can do this for progressive perks/side perks, or whatever you want.

					//This is the Vertical Tree

					var/tree_length_v = spider_order_v.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems

					node_x = 14 //For the perks
					node_xx = 14 //For the spacers

					var/node_y = -2
					var/node_yy = -3

					for(var/i=1, i<tree_length_v, i++)

						if(spider_order_v[i] == "-") //If we want this bit to be blank...
							node_x -= 2  //Make space!
							node_xx -= 2
							continue //Go to the next iteration of the loop

						if(spider_order_v[i] == "+") //If we want to go even higher up the tree...
							node_y += 2 //We allow it to go higher, but this will affect every other future node
							node_yy += 2 //Then we go to the next iteration of the loop.
							continue

						if(spider_order_v[i] == "v") //So we must bring it back down after doing something like that unless we want each future node to be...
							node_y -= 2 //...On that same level.
							node_yy -= 2 //Though we can also just put 'v' in the list to make the tree have vertical lines going down too!
							continue //Then we go to the next iteration of the loop.

						var/SkillTreeNode/node = new
						node.name = spider_order_v[i]

						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],[node_y]"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Vertical"
						noodle.screen_loc = "Tree1:-[node_xx],[node_yy]"
						src.client.screen += node
						src.client.screen += noodle

						var/next_link = i+1
						if((spider_order_v[next_link] == "+") || (spider_order_v[next_link] == "v")) //If the next thing in the tree is just a perk higher or lower than the current one...
							continue //On the same x-axis, then we're not gonna change the x-axis value, yeah? Then we go to the next iteration of the loop.
						else
							node_x -= 2  //Otherwise, we move the tree along, as we should!
							node_xx -= 2
				//spider end//

				/*if(10) //Sarutobi Page

					winset(src,"PerkTree1.PerkTreeImage","image=\ref[fcopy_rsc('Sarutobi.jpg')]")
					winset(src,"PerkTree1.PerkTreeImage","image-mode=stretch")
					src << output(null,"PerkTree1.TreePageOutput")
					src << output("Sarutobi Progression Tree","PerkTree1.TreePageOutput")

					var/tree_length = sarutobi_order_h.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems
					var/noodle_length = sarutobi_order_h.len

					var/node_x = 16 //For the perks
					var/node_xx = 15 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = sarutobi_order_h[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-4"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node


					for(var/i=1, i<noodle_length, i++)

						node_xx -= 2

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-4"

						src.client.screen += noodle


					//It's possible to add perks in different x positions (heights) by changing the '-4' in screen loc. We can do this for progressive perks/side perks, or whatever you want.

					//This is the Vertical Tree

					var/tree_length_v = sarutobi_order_v.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems

					node_x = 14 //For the perks
					node_xx = 14 //For the spacers

					var/node_y = -2
					var/node_yy = -3

					for(var/i=1, i<tree_length_v, i++)

						if(sarutobi_order_v[i] == "-") //If we want this bit to be blank...
							node_x -= 2  //Make space!
							node_xx -= 2
							continue //Go to the next iteration of the loop

						if(sarutobi_order_v[i] == "+") //If we want to go even higher up the tree...
							node_y += 2 //We allow it to go higher, but this will affect every other future node
							node_yy += 2 //Then we go to the next iteration of the loop.
							continue

						if(sarutobi_order_v[i] == "v") //So we must bring it back down after doing something like that unless we want each future node to be...
							node_y -= 2 //...On that same level.
							node_yy -= 2 //Though we can also just put 'v' in the list to make the tree have vertical lines going down too!
							continue //Then we go to the next iteration of the loop.

						var/SkillTreeNode/node = new
						node.name = sarutobi_order_v[i]

						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],[node_y]"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Vertical"
						noodle.screen_loc = "Tree1:-[node_xx],[node_yy]"
						src.client.screen += node
						src.client.screen += noodle

						var/next_link = i+1
						if((sarutobi_order_v[next_link] == "+") || (sarutobi_order_v[next_link] == "v")) //If the next thing in the tree is just a perk higher or lower than the current one...
							continue //On the same x-axis, then we're not gonna change the x-axis value, yeah? Then we go to the next iteration of the loop.
						else
							node_x -= 2  //Otherwise, we move the tree along, as we should!
							node_xx -= 2 */


				/*if(11) //YAMANAKA Page

					winset(src,"PerkTree1.PerkTreeImage","image=\ref[fcopy_rsc('Yamanaka.jpg')]")
					winset(src,"PerkTree1.PerkTreeImage","image-mode=stretch")
					src << output(null,"PerkTree1.TreePageOutput")
					src << output("Yamanaka Progression Tree","PerkTree1.TreePageOutput")

					var/tree_length = yamanaka_order_h.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems
					var/noodle_length = yamanaka_order_h.len

					var/node_x = 16 //For the perks
					var/node_xx = 15 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = yamanaka_order_h[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-4"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node


					for(var/i=1, i<noodle_length, i++)

						node_xx -= 2

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-4"

						src.client.screen += noodle


					//It's possible to add perks in different x positions (heights) by changing the '-4' in screen loc. We can do this for progressive perks/side perks, or whatever you want.

					//This is the Vertical Tree

					var/tree_length_v = yamanaka_order_v.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems

					node_x = 14 //For the perks
					node_xx = 14 //For the spacers

					var/node_y = -2
					var/node_yy = -3

					for(var/i=1, i<tree_length_v, i++)

						if(yamanaka_order_v[i] == "-") //If we want this bit to be blank...
							node_x -= 2  //Make space!
							node_xx -= 2
							continue //Go to the next iteration of the loop

						if(yamanaka_order_v[i] == "+") //If we want to go even higher up the tree...
							node_y += 2 //We allow it to go higher, but this will affect every other future node
							node_yy += 2 //Then we go to the next iteration of the loop.
							continue

						if(yamanaka_order_v[i] == "v") //So we must bring it back down after doing something like that unless we want each future node to be...
							node_y -= 2 //...On that same level.
							node_yy -= 2 //Though we can also just put 'v' in the list to make the tree have vertical lines going down too!
							continue //Then we go to the next iteration of the loop.

						var/SkillTreeNode/node = new
						node.name = yamanaka_order_v[i]

						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],[node_y]"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Vertical"
						noodle.screen_loc = "Tree1:-[node_xx],[node_yy]"
						src.client.screen += node
						src.client.screen += noodle

						var/next_link = i+1
						if((yamanaka_order_v[next_link] == "+") || (yamanaka_order_v[next_link] == "v")) //If the next thing in the tree is just a perk higher or lower than the current one...
							continue //On the same x-axis, then we're not gonna change the x-axis value, yeah? Then we go to the next iteration of the loop.
						else
							node_x -= 2  //Otherwise, we move the tree along, as we should!
							node_xx -= 2 */

				if(19) //Hozuki Page

					winset(src,"PerkTree1.PerkTreeImage","image=\ref[fcopy_rsc('Hozuki.jpeg')]")
					winset(src,"PerkTree1.PerkTreeImage","image-mode=stretch")
					src << output(null,"PerkTree1.TreePageOutput")
					src << output("Hozuki Progression Tree","PerkTree1.TreePageOutput")

					var/tree_length = hoz_order_h.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems
					var/noodle_length = hoz_order_h.len

					var/node_x = 16 //For the perks
					var/node_xx = 15 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = hoz_order_h[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-4"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node


					for(var/i=1, i<noodle_length, i++)

						node_xx -= 2

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-4"

						src.client.screen += noodle


					//It's possible to add perks in different x positions (heights) by changing the '-4' in screen loc. We can do this for progressive perks/side perks, or whatever you want.

					//This is the Vertical Tree

					var/tree_length_v = hoz_order_v.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems

					node_x = 14 //For the perks
					node_xx = 14 //For the spacers

					var/node_y = -2
					var/node_yy = -3

					for(var/i=1, i<tree_length_v, i++)

						if(hoz_order_v[i] == "-") //If we want this bit to be blank...
							node_x -= 2  //Make space!
							node_xx -= 2
							continue //Go to the next iteration of the loop

						if(hoz_order_v[i] == "+") //If we want to go even higher up the tree...
							node_y += 2 //We allow it to go higher, but this will affect every other future node
							node_yy += 2 //Then we go to the next iteration of the loop.
							continue

						if(hoz_order_v[i] == "v") //So we must bring it back down after doing something like that unless we want each future node to be...
							node_y -= 2 //...On that same level.
							node_yy -= 2 //Though we can also just put 'v' in the list to make the tree have vertical lines going down too!
							continue //Then we go to the next iteration of the loop.

						var/SkillTreeNode/node = new
						node.name = hoz_order_v[i]

						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],[node_y]"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Vertical"
						noodle.screen_loc = "Tree1:-[node_xx],[node_yy]"
						src.client.screen += node
						src.client.screen += noodle

						var/next_link = i+1
						if((hoz_order_v[next_link] == "+") || (hoz_order_v[next_link] == "v")) //If the next thing in the tree is just a perk higher or lower than the current one...
							continue //On the same x-axis, then we're not gonna change the x-axis value, yeah? Then we go to the next iteration of the loop.
						else
							node_x -= 2  //Otherwise, we move the tree along, as we should!
							node_xx -= 2
				//Samurai
				/*if(13)
					winset(src,"PerkTree1.PerkTreeImage","image=\ref[fcopy_rsc('Samurai.png')]")
					winset(src,"PerkTree1.PerkTreeImage","image-mode=stretch")
					src << output(null,"PerkTree1.TreePageOutput")
					src << output("Samurai Progression Tree","PerkTree1.TreePageOutput")

					//This is the Horizontal Tree [COPY AND PASTE START HERE]

					var/tree_length = samurai_order_h.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems
					var/noodle_length = samurai_order_h.len

					var/node_x = 12 //For the perks
					var/node_xx = 11 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = samurai_order_h[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-4"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node


					for(var/i=1, i<noodle_length, i++)

						node_xx -= 2

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-4"

						src.client.screen += noodle


					//It's possible to add perks in different x positions (heights) by changing the '-4' in screen loc. We can do this for progressive perks/side perks, or whatever you want.

					//This is the Vertical Tree

					var/tree_length_v = samurai_order_v.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems

					node_x = 10 //For the perks
					node_xx = 10 //For the spacers

					var/node_y = -2
					var/node_yy = -3

					for(var/i=1, i<tree_length_v, i++)

						if(samurai_order_v[i] == "-") //If we want this bit to be blank...
							node_x -= 2  //Make space!
							node_xx -= 2
							continue //Go to the next iteration of the loop

						if(samurai_order_v[i] == "+") //If we want to go even higher up the tree...
							node_y += 2 //We allow it to go higher, but this will affect every other future node
							node_yy += 2 //Then we go to the next iteration of the loop.
							continue

						if(samurai_order_v[i] == "v") //So we must bring it back down after doing something like that unless we want each future node to be...
							node_y -= 2 //...On that same level.
							node_yy -= 2 //Though we can also just put 'v' in the list to make the tree have vertical lines going down too!
							continue //Then we go to the next iteration of the loop.

						var/SkillTreeNode/node = new
						node.name = samurai_order_v[i]

						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],[node_y]"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Vertical"
						noodle.screen_loc = "Tree1:-[node_xx],[node_yy]"
						src.client.screen += node
						src.client.screen += noodle

						var/next_link = i+1
						if((samurai_order_v[next_link] == "+") || (samurai_order_v[next_link] == "v")) //If the next thing in the tree is just a perk higher or lower than the current one...
							continue //On the same x-axis, then we're not gonna change the x-axis value, yeah? Then we go to the next iteration of the loop.
						else
							node_x -= 2  //Otherwise, we move the tree along, as we should!
							node_xx -= 2 */
						//[COPY AND PASTE END HERE]
				//Uchiha
				if(13)
					winset(src,"PerkTree1.PerkTreeImage","image=\ref[fcopy_rsc('Uchiha3.jpeg')]")
					winset(src,"PerkTree1.PerkTreeImage","image-mode=stretch")
					src << output(null,"PerkTree1.TreePageOutput")
					src << output("Uchiha Progression Tree","PerkTree1.TreePageOutput")

					//This is the Horizontal Tree [COPY AND PASTE START HERE]

					var/tree_length = uchiha_order_h.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems
					var/noodle_length = uchiha_order_h.len

					var/node_x = 16 //For the perks
					var/node_xx = 15 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = uchiha_order_h[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-4"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node


					for(var/i=1, i<noodle_length, i++)

						node_xx -= 2

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-4"

						src.client.screen += noodle


					//It's possible to add perks in different x positions (heights) by changing the '-4' in screen loc. We can do this for progressive perks/side perks, or whatever you want.

					//This is the Vertical Tree

					var/tree_length_v = uchiha_order_v.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems

					node_x = 14 //For the perks
					node_xx = 14 //For the spacers

					var/node_y = -2
					var/node_yy = -3

					for(var/i=1, i<tree_length_v, i++)

						if(uchiha_order_v[i] == "-") //If we want this bit to be blank...
							node_x -= 2  //Make space!
							node_xx -= 2
							continue //Go to the next iteration of the loop

						if(uchiha_order_v[i] == "+") //If we want to go even higher up the tree...
							node_y += 2 //We allow it to go higher, but this will affect every other future node
							node_yy += 2 //Then we go to the next iteration of the loop.
							continue

						if(uchiha_order_v[i] == "v") //So we must bring it back down after doing something like that unless we want each future node to be...
							node_y -= 2 //...On that same level.
							node_yy -= 2 //Though we can also just put 'v' in the list to make the tree have vertical lines going down too!
							continue //Then we go to the next iteration of the loop.

						var/SkillTreeNode/node = new
						node.name = uchiha_order_v[i]

						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],[node_y]"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Vertical"
						noodle.screen_loc = "Tree1:-[node_xx],[node_yy]"
						src.client.screen += node
						src.client.screen += noodle

						var/next_link = i+1
						if((uchiha_order_v[next_link] == "+") || (uchiha_order_v[next_link] == "v")) //If the next thing in the tree is just a perk higher or lower than the current one...
							continue //On the same x-axis, then we're not gonna change the x-axis value, yeah? Then we go to the next iteration of the loop.
						else
							node_x -= 2  //Otherwise, we move the tree along, as we should!
							node_xx -= 2

				//Akimichi Start
				if(17)
					winset(src,"PerkTree1.PerkTreeImage","image=\ref[fcopy_rsc('Akimichi.png')]")
					winset(src,"PerkTree1.PerkTreeImage","image-mode=stretch")
					src << output(null,"PerkTree1.TreePageOutput")
					src << output("Akimichi Progression Tree","PerkTree1.TreePageOutput")

					//This is the Horizontal Tree [COPY AND PASTE START HERE]

					var/tree_length = aki_order_h.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems
					var/noodle_length = aki_order_h.len

					var/node_x = 18 //For the perks
					var/node_xx = 17 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = aki_order_h[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-4"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node


					for(var/i=1, i<noodle_length, i++)

						node_xx -= 2

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-4"

						src.client.screen += noodle


					//It's possible to add perks in different x positions (heights) by changing the '-4' in screen loc. We can do this for progressive perks/side perks, or whatever you want.

					//This is the Vertical Tree

					var/tree_length_v = aki_order_v.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems

					node_x = 16 //For the perks
					node_xx = 16 //For the spacers

					var/node_y = -2
					var/node_yy = -3

					for(var/i=1, i<tree_length_v, i++)

						if(aki_order_v[i] == "-") //If we want this bit to be blank...
							node_x -= 2  //Make space!
							node_xx -= 2
							continue //Go to the next iteration of the loop

						if(aki_order_v[i] == "+") //If we want to go even higher up the tree...
							node_y += 2 //We allow it to go higher, but this will affect every other future node
							node_yy += 2 //Then we go to the next iteration of the loop.
							continue

						if(aki_order_v[i] == "v") //So we must bring it back down after doing something like that unless we want each future node to be...
							node_y -= 2 //...On that same level.
							node_yy -= 2 //Though we can also just put 'v' in the list to make the tree have vertical lines going down too!
							continue //Then we go to the next iteration of the loop.

						var/SkillTreeNode/node = new
						node.name = aki_order_v[i]

						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],[node_y]"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Vertical"
						noodle.screen_loc = "Tree1:-[node_xx],[node_yy]"
						src.client.screen += node
						src.client.screen += noodle

						var/next_link = i+1
						if((aki_order_v[next_link] == "+") || (aki_order_v[next_link] == "v")) //If the next thing in the tree is just a perk higher or lower than the current one...
							continue //On the same x-axis, then we're not gonna change the x-axis value, yeah? Then we go to the next iteration of the loop.
						else
							node_x -= 2  //Otherwise, we move the tree along, as we should!
							node_xx -= 2
				//Akimichi End

				if(23) // Genjutsu Tree
					winset(src,"PerkTree1.PerkTreeImage","image=\ref[fcopy_rsc('GenjutsuTree.png')]")
					winset(src,"PerkTree1.PerkTreeImage","image-mode=stretch")
					src << output(null,"PerkTree1.TreePageOutput")
					src << output("Genjutsu Progression Tree","PerkTree1.TreePageOutput")

					//This is the Horizontal Tree [COPY AND PASTE START HERE]

					var/tree_length = gen_order_h.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems
					var/noodle_length = gen_order_h.len

					var/node_x = 18 //For the perks
					var/node_xx = 17 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = gen_order_h[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-4"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node


					for(var/i=1, i<noodle_length, i++)

						node_xx -= 2

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-4"

						src.client.screen += noodle


					//It's possible to add perks in different x positions (heights) by changing the '-4' in screen loc. We can do this for progressive perks/side perks, or whatever you want.

					//This is the Vertical Tree

					var/tree_length_v = gen_order_v.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems

					node_x = 16 //For the perks
					node_xx = 16 //For the spacers

					var/node_y = -2
					var/node_yy = -3

					for(var/i=1, i<tree_length_v, i++)

						if(gen_order_v[i] == "-") //If we want this bit to be blank...
							node_x -= 2  //Make space!
							node_xx -= 2
							continue //Go to the next iteration of the loop

						if(gen_order_v[i] == "+") //If we want to go even higher up the tree...
							node_y += 2 //We allow it to go higher, but this will affect every other future node
							node_yy += 2 //Then we go to the next iteration of the loop.
							continue

						if(gen_order_v[i] == "v") //So we must bring it back down after doing something like that unless we want each future node to be...
							node_y -= 2 //...On that same level.
							node_yy -= 2 //Though we can also just put 'v' in the list to make the tree have vertical lines going down too!
							continue //Then we go to the next iteration of the loop.

						var/SkillTreeNode/node = new
						node.name = gen_order_v[i]

						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],[node_y]"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Vertical"
						noodle.screen_loc = "Tree1:-[node_xx],[node_yy]"
						src.client.screen += node
						src.client.screen += noodle

						var/next_link = i+1
						if((gen_order_v[next_link] == "+") || (gen_order_v[next_link] == "v")) //If the next thing in the tree is just a perk higher or lower than the current one...
							continue //On the same x-axis, then we're not gonna change the x-axis value, yeah? Then we go to the next iteration of the loop.
						else
							node_x -= 2  //Otherwise, we move the tree along, as we should!
							node_xx -= 2

						//[COPY AND PASTE END HERE]

				//Hyuuga
				if(18)
					winset(src,"PerkTree1.PerkTreeImage","image=\ref[fcopy_rsc('hyuuga.jpeg')]")
					winset(src,"PerkTree1.PerkTreeImage","image-mode=stretch")
					src << output(null,"PerkTree1.TreePageOutput")
					src << output("Hyuuga Progression Tree","PerkTree1.TreePageOutput")

					//This is the Horizontal Tree [COPY AND PASTE START HERE]

					var/tree_length = hyuuga_order_h.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems
					var/noodle_length = hyuuga_order_h.len

					var/node_x = 18 //For the perks
					var/node_xx = 17 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = hyuuga_order_h[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-4"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node


					for(var/i=1, i<noodle_length, i++)

						node_xx -= 2

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-4"

						src.client.screen += noodle


					//It's possible to add perks in different x positions (heights) by changing the '-4' in screen loc. We can do this for progressive perks/side perks, or whatever you want.

					//This is the Vertical Tree

					var/tree_length_v = hyuuga_order_v.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems

					node_x = 16 //For the perks
					node_xx = 16 //For the spacers

					var/node_y = -2
					var/node_yy = -3

					for(var/i=1, i<tree_length_v, i++)

						if(hyuuga_order_v[i] == "-") //If we want this bit to be blank...
							node_x -= 2  //Make space!
							node_xx -= 2
							continue //Go to the next iteration of the loop

						if(hyuuga_order_v[i] == "+") //If we want to go even higher up the tree...
							node_y += 2 //We allow it to go higher, but this will affect every other future node
							node_yy += 2 //Then we go to the next iteration of the loop.
							continue

						if(hyuuga_order_v[i] == "v") //So we must bring it back down after doing something like that unless we want each future node to be...
							node_y -= 2 //...On that same level.
							node_yy -= 2 //Though we can also just put 'v' in the list to make the tree have vertical lines going down too!
							continue //Then we go to the next iteration of the loop.

						var/SkillTreeNode/node = new
						node.name = hyuuga_order_v[i]

						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],[node_y]"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Vertical"
						noodle.screen_loc = "Tree1:-[node_xx],[node_yy]"
						src.client.screen += node
						src.client.screen += noodle

						var/next_link = i+1
						if((hyuuga_order_v[next_link] == "+") || (hyuuga_order_v[next_link] == "v")) //If the next thing in the tree is just a perk higher or lower than the current one...
							continue //On the same x-axis, then we're not gonna change the x-axis value, yeah? Then we go to the next iteration of the loop.
						else
							node_x -= 2  //Otherwise, we move the tree along, as we should!
							node_xx -= 2

						//[COPY AND PASTE END HERE]

				//INUZUKA
				if(14)
					winset(src,"PerkTree1.PerkTreeImage","image=\ref[fcopy_rsc('Inuzuka.jpg')]")
					winset(src,"PerkTree1.PerkTreeImage","image-mode=stretch")
					src << output(null,"PerkTree1.TreePageOutput")
					src << output("Inuzuka Progression Tree","PerkTree1.TreePageOutput")

					//This is the Horizontal Tree [COPY AND PASTE START HERE]

					var/tree_length = inu_order_h.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems
					var/noodle_length = inu_order_h.len

					var/node_x = 18 //For the perks
					var/node_xx = 17 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = inu_order_h[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-4"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node


					for(var/i=1, i<noodle_length, i++)

						node_xx -= 2

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-4"

						src.client.screen += noodle


					//It's possible to add perks in different x positions (heights) by changing the '-4' in screen loc. We can do this for progressive perks/side perks, or whatever you want.

					//This is the Vertical Tree

					var/tree_length_v = inu_order_v.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems

					node_x = 16 //For the perks
					node_xx = 16 //For the spacers

					var/node_y = -2
					var/node_yy = -3

					for(var/i=1, i<tree_length_v, i++)

						if(inu_order_v[i] == "-") //If we want this bit to be blank...
							node_x -= 2  //Make space!
							node_xx -= 2
							continue //Go to the next iteration of the loop

						if(inu_order_v[i] == "+") //If we want to go even higher up the tree...
							node_y += 2 //We allow it to go higher, but this will affect every other future node
							node_yy += 2 //Then we go to the next iteration of the loop.
							continue

						if(inu_order_v[i] == "v") //So we must bring it back down after doing something like that unless we want each future node to be...
							node_y -= 2 //...On that same level.
							node_yy -= 2 //Though we can also just put 'v' in the list to make the tree have vertical lines going down too!
							continue //Then we go to the next iteration of the loop.

						var/SkillTreeNode/node = new
						node.name = inu_order_v[i]

						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],[node_y]"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Vertical"
						noodle.screen_loc = "Tree1:-[node_xx],[node_yy]"
						src.client.screen += node
						src.client.screen += noodle

						var/next_link = i+1
						if((inu_order_v[next_link] == "+") || (inu_order_v[next_link] == "v")) //If the next thing in the tree is just a perk higher or lower than the current one...
							continue //On the same x-axis, then we're not gonna change the x-axis value, yeah? Then we go to the next iteration of the loop.
						else
							node_x -= 2  //Otherwise, we move the tree along, as we should!
							node_xx -= 2


				if(15) //Hoshi Tree

					winset(src,"PerkTree1.PerkTreeImage","image=\ref[fcopy_rsc('Hoshigaki.jpg')]")
					winset(src,"PerkTree1.PerkTreeImage","image-mode=stretch")
					src << output(null,"PerkTree1.TreePageOutput")
					src << output("Hoshigaki Progression Tree","PerkTree1.TreePageOutput")

					var/tree_length = hoshi_order_h.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems
					var/noodle_length = hoshi_order_h.len

					var/node_x = 16 //For the perks
					var/node_xx = 15 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = hoshi_order_h[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-4"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node


					for(var/i=1, i<noodle_length, i++)

						node_xx -= 2

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-4"

						src.client.screen += noodle


					//It's possible to add perks in different x positions (heights) by changing the '-4' in screen loc. We can do this for progressive perks/side perks, or whatever you want.

					//This is the Vertical Tree

					var/tree_length_v = hoshi_order_v.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems

					node_x = 14 //For the perks
					node_xx = 14 //For the spacers

					var/node_y = -2
					var/node_yy = -3

					for(var/i=1, i<tree_length_v, i++)

						if(hoshi_order_v[i] == "-") //If we want this bit to be blank...
							node_x -= 2  //Make space!
							node_xx -= 2
							continue //Go to the next iteration of the loop

						if(hoshi_order_v[i] == "+") //If we want to go even higher up the tree...
							node_y += 2 //We allow it to go higher, but this will affect every other future node
							node_yy += 2 //Then we go to the next iteration of the loop.
							continue

						if(hoshi_order_v[i] == "v") //So we must bring it back down after doing something like that unless we want each future node to be...
							node_y -= 2 //...On that same level.
							node_yy -= 2 //Though we can also just put 'v' in the list to make the tree have vertical lines going down too!
							continue //Then we go to the next iteration of the loop.

						var/SkillTreeNode/node = new
						node.name = hoshi_order_v[i]

						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],[node_y]"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Vertical"
						noodle.screen_loc = "Tree1:-[node_xx],[node_yy]"
						src.client.screen += node
						src.client.screen += noodle

						var/next_link = i+1
						if((hoshi_order_v[next_link] == "+") || (hoshi_order_v[next_link] == "v")) //If the next thing in the tree is just a perk higher or lower than the current one...
							continue //On the same x-axis, then we're not gonna change the x-axis value, yeah? Then we go to the next iteration of the loop.
						else
							node_x -= 2  //Otherwise, we move the tree along, as we should!
							node_xx -= 2

				if(25) //Crafting

					winset(src,"PerkTree1.PerkTreeImage","image=\ref[fcopy_rsc('Shurikenjutsu.png')]")
					winset(src,"PerkTree1.PerkTreeImage","image-mode=stretch")
					src << output(null,"PerkTree1.TreePageOutput")
					src << output("Crafting Progression Tree","PerkTree1.TreePageOutput")

					var/tree_length = crafting_order_h.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems
					var/noodle_length = crafting_order_h.len

					var/node_x = 16 //For the perks
					var/node_xx = 15 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = crafting_order_h[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-4"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node


					for(var/i=1, i<noodle_length, i++)

						node_xx -= 2

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-4"

						src.client.screen += noodle


					//It's possible to add perks in different x positions (heights) by changing the '-4' in screen loc. We can do this for progressive perks/side perks, or whatever you want.

					//This is the Vertical Tree

					var/tree_length_v = crafting_order_v.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems

					node_x = 14 //For the perks
					node_xx = 14 //For the spacers

					var/node_y = -2
					var/node_yy = -3

					for(var/i=1, i<tree_length_v, i++)

						if(crafting_order_v[i] == "-") //If we want this bit to be blank...
							node_x -= 2  //Make space!
							node_xx -= 2
							continue //Go to the next iteration of the loop

						if(crafting_order_v[i] == "+") //If we want to go even higher up the tree...
							node_y += 2 //We allow it to go higher, but this will affect every other future node
							node_yy += 2 //Then we go to the next iteration of the loop.
							continue

						if(crafting_order_v[i] == "v") //So we must bring it back down after doing something like that unless we want each future node to be...
							node_y -= 2 //...On that same level.
							node_yy -= 2 //Though we can also just put 'v' in the list to make the tree have vertical lines going down too!
							continue //Then we go to the next iteration of the loop.

						var/SkillTreeNode/node = new
						node.name = crafting_order_v[i]

						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],[node_y]"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Vertical"
						noodle.screen_loc = "Tree1:-[node_xx],[node_yy]"
						src.client.screen += node
						src.client.screen += noodle

						var/next_link = i+1
						if((crafting_order_v[next_link] == "+") || (crafting_order_v[next_link] == "v")) //If the next thing in the tree is just a perk higher or lower than the current one...
							continue //On the same x-axis, then we're not gonna change the x-axis value, yeah? Then we go to the next iteration of the loop.
						else
							node_x -= 2  //Otherwise, we move the tree along, as we should!
							node_xx -= 2

				if(16) //Senju Page

					winset(src,"PerkTree1.PerkTreeImage","image=\ref[fcopy_rsc('Senju.jpg')]")
					winset(src,"PerkTree1.PerkTreeImage","image-mode=stretch")
					src << output(null,"PerkTree1.TreePageOutput")
					src << output("Senju Progression Tree","PerkTree1.TreePageOutput")


//Middle Tree Portion
					var/tree_length = Senju_order_h.len + 1
					var/noodle_length = Senju_order_h.len

					var/node_x = 18 //For the perks
					var/node_xx = 17 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = Senju_order_h[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-4"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node

					for(var/i=1, i<noodle_length, i++)
						node_xx -= 2
						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-4"

						src.client.screen += noodle


// Top Tree Portion
					tree_length = Senju_order_v.len + 1
					noodle_length = Senju_order_v.len

					node_x = 12 //For the perks
					node_xx = 11 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = Senju_order_v[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-2"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node

					for(var/i=1, i<noodle_length, i++)
						node_xx -= 2
						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-2"

						src.client.screen += noodle

					var/SkillTreeNode/nodeD = new
					nodeD.name = "Sankosho"
					nodeD.screen_loc ="Tree1:-12,0"
					nodeD.Find_Mimic()
					src.client.screen += nodeD

					var/SkillTreeNode/nodeE = new
					nodeE.name = "Tokkosho"
					nodeE.screen_loc ="Tree1:-12,-2"
					nodeE.Find_Mimic()
					src.client.screen += nodeE

					var/NodeLines/nodelineC = new
					nodelineC.screen_loc ="Tree1:-12,-1"
					nodelineC.icon_state = "Vertical"
					src.client.screen += nodelineC

					var/SkillTreeNode/nodeA = new
					nodeA.name = "Bijuu Tamer"
					nodeA.screen_loc ="Tree1:-2,0"
					nodeA.Find_Mimic()
					src.client.screen += nodeA

					var/NodeLines/nodelineA = new
					nodelineA.screen_loc ="Tree1:-2,-1"
					nodelineA.icon_state = "Vertical"
					src.client.screen += nodelineA

					var/SkillTreeNode/nodeB = new
					nodeB.name = "Mokuton Mastery"
					nodeB.screen_loc ="Tree1:-2,2"
					nodeB.Find_Mimic()
					src.client.screen += nodeB

					var/NodeLines/nodelineB = new
					nodelineB.screen_loc ="Tree1:-2,1"
					nodelineB.icon_state = "Vertical"
					src.client.screen += nodelineB


//Bot Tree Portion
					tree_length = Senju_order_b.len + 1
					noodle_length = Senju_order_b.len

					node_x = 12 //For the perks
					node_xx = 11 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = Senju_order_b[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-6"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node

					for(var/i=1, i<noodle_length, i++)
						node_xx -= 2
						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-6"

						src.client.screen += noodle

					var/NodeLines/diagNE = new
					diagNE.icon_state = "Vertical"
					diagNE.screen_loc = "Tree1:-8,-3"

					src.client.screen += diagNE

					var/NodeLines/diagN = new
					diagN.icon_state = "Vertical"
					diagN.screen_loc = "Tree1:-12,-3"

					src.client.screen += diagN

					var/NodeLines/diagSE = new
					diagSE.icon_state = "Vertical"
					diagSE.screen_loc = "Tree1:-8,-5"

					src.client.screen += diagSE


					var/SkillTreeNode/nodeC = new
					nodeC.name = "Arsenal"
					nodeC.screen_loc ="Tree1:-10,-8"
					nodeC.Find_Mimic()
					src.client.screen += nodeC

					var/SkillTreeNode/nodeF = new
					nodeF.name = "Keihatsu"
					nodeF.screen_loc ="Tree1:0,-8"
					nodeF.Find_Mimic()
					src.client.screen += nodeF

					var/NodeLines/nodelineF = new
					nodelineF.screen_loc ="Tree1:0,-7"
					nodelineF.icon_state = "Vertical"
					src.client.screen += nodelineF

					var/NodeLines/nodelineD = new
					nodelineD.screen_loc ="Tree1:-10,-7"
					nodelineD.icon_state = "Vertical"
					src.client.screen += nodelineD

					//Sakujak Start
				if(11) //Sakujak Page
					winset(src,"PerkTree1.PerkTreeImage","image=\ref[fcopy_rsc('Sakujak.png')]")
					winset(src,"PerkTree1.PerkTreeImage","image-mode=stretch")
					src << output(null,"PerkTree1.TreePageOutput")
					src << output("Sakujak Progression Tree","PerkTree1.TreePageOutput")

					var/tree_length = sakujak_order_h.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems
					var/noodle_length = sakujak_order_h.len

					var/node_x = 15 //For the perks
					var/node_xx = 14 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = sakujak_order_h[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-4"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node


					for(var/i=1, i<noodle_length, i++)

						node_xx -= 2

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-4"

						src.client.screen += noodle


					//It's possible to add perks in different x positions (heights) by changing the '-4' in screen loc. We can do this for progressive perks/side perks, or whatever you want.

					//This is the Vertical Tree

					var/tree_length_v = sakujak_order_v.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems

					node_x = 13 //For the perks
					node_xx = 13 //For the spacers

					var/node_y = -2
					var/node_yy = -3

					for(var/i=1, i<tree_length_v, i++)

						if(sakujak_order_v[i] == "-") //If we want this bit to be blank...
							node_x -= 2  //Make space!
							node_xx -= 2
							continue //Go to the next iteration of the loop

						if(sakujak_order_v[i] == "+") //If we want to go even higher up the tree...
							node_y += 2 //We allow it to go higher, but this will affect every other future node
							node_yy += 2 //Then we go to the next iteration of the loop.
							continue

						if(sakujak_order_v[i] == "v") //So we must bring it back down after doing something like that unless we want each future node to be...
							node_y -= 2 //...On that same level.
							node_yy -= 2 //Though we can also just put 'v' in the list to make the tree have vertical lines going down too!
							continue //Then we go to the next iteration of the loop.

						var/SkillTreeNode/node = new
						node.name = sakujak_order_v[i]

						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],[node_y]"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Vertical"
						noodle.screen_loc = "Tree1:-[node_xx],[node_yy]"
						src.client.screen += node
						src.client.screen += noodle

						var/next_link = i+1
						if((sakujak_order_v[next_link] == "+") || (sakujak_order_v[next_link] == "v")) //If the next thing in the tree is just a perk higher or lower than the current one...
							continue //On the same x-axis, then we're not gonna change the x-axis value, yeah? Then we go to the next iteration of the loop.
						else
							node_x -= 2  //Otherwise, we move the tree along, as we should!
							node_xx -= 2



					//Sakujak End


				/*if(20) //Nimbus Page

					winset(src,"PerkTree1.PerkTreeImage","image=\ref[fcopy_rsc('Nimbus.jpg')]")
					winset(src,"PerkTree1.PerkTreeImage","image-mode=stretch")
					src << output(null,"PerkTree1.TreePageOutput")
					src << output("Nimbus Progression Tree","PerkTree1.TreePageOutput")


//Middle Tree Portion
					var/tree_length = nimbus_order_h.len + 1
					var/noodle_length = nimbus_order_h.len

					var/node_x = 18 //For the perks
					var/node_xx = 17 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = nimbus_order_h[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-4"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node

					for(var/i=1, i<noodle_length, i++)
						node_xx -= 2
						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-4"

						src.client.screen += noodle


// Top Tree Portion
					tree_length = nimbus_order_v.len + 1
					noodle_length = nimbus_order_v.len

					node_x = 12 //For the perks
					node_xx = 11 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = nimbus_order_v[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-2"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node

					for(var/i=1, i<noodle_length, i++)
						node_xx -= 2
						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-2"

						src.client.screen += noodle

					var/SkillTreeNode/nodeI = new
					nodeI.name = "Storm Bringer"
					nodeI.screen_loc ="Tree1:-2,0"
					nodeI.Find_Mimic()
					src.client.screen += nodeI

					var/NodeLines/nodelineI = new
					nodelineI.screen_loc ="Tree1:-2,-1"
					nodelineI.icon_state = "Vertical"
					src.client.screen += nodelineI


//Bot Tree Portion
					tree_length = nimbus_order_b.len + 1
					noodle_length = nimbus_order_b.len

					node_x = 12 //For the perks
					node_xx = 11 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = nimbus_order_b[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-6"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node

					for(var/i=1, i<noodle_length, i++)
						node_xx -= 2
						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-6"

						src.client.screen += noodle

					var/NodeLines/diagNE = new
					diagNE.icon_state = "Vertical"
					diagNE.screen_loc = "Tree1:-10,-3"

					src.client.screen += diagNE

					var/NodeLines/diagSE = new
					diagSE.icon_state = "Vertical"
					diagSE.screen_loc = "Tree1:-10,-5"

					src.client.screen += diagSE


					var/SkillTreeNode/nodeH = new
					nodeH.name = "Three Days and Nights"
					nodeH.screen_loc ="Tree1:-6,-8"
					nodeH.Find_Mimic()
					src.client.screen += nodeH

					var/SkillTreeNode/nodeG = new
					nodeG.name = "Strongest Shield"
					nodeG.screen_loc ="Tree1:-4,-8"
					nodeG.Find_Mimic()
					src.client.screen += nodeG

					var/NodeLines/nodelineG = new
					nodelineG.screen_loc ="Tree1:-4,-7"
					nodelineG.icon_state = "Vertical"
					src.client.screen += nodelineG

					var/NodeLines/nodelineH = new
					nodelineH.screen_loc ="Tree1:-6,-7"
					nodelineH.icon_state = "Vertical"
					src.client.screen += nodelineH */

				if(21) //Yuki Page

					winset(src,"PerkTree1.PerkTreeImage","image=\ref[fcopy_rsc('Yuki.jpg')]")
					winset(src,"PerkTree1.PerkTreeImage","image-mode=stretch")
					src << output(null,"PerkTree1.TreePageOutput")
					src << output("Yuki Progression Tree","PerkTree1.TreePageOutput")

					var/tree_length = yuki_order_h.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems
					var/noodle_length = yuki_order_h.len

					var/node_x = 16 //For the perks
					var/node_xx = 15 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = yuki_order_h[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-4"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node


					for(var/i=1, i<noodle_length, i++)

						node_xx -= 2

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-4"

						src.client.screen += noodle


					//It's possible to add perks in different x positions (heights) by changing the '-4' in screen loc. We can do this for progressive perks/side perks, or whatever you want.

					//This is the Vertical Tree

					var/tree_length_v = yuki_order_v.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems

					node_x = 14 //For the perks
					node_xx = 14 //For the spacers

					var/node_y = -2
					var/node_yy = -3

					for(var/i=1, i<tree_length_v, i++)

						if(yuki_order_v[i] == "-") //If we want this bit to be blank...
							node_x -= 2  //Make space!
							node_xx -= 2
							continue //Go to the next iteration of the loop

						if(yuki_order_v[i] == "+") //If we want to go even higher up the tree...
							node_y += 2 //We allow it to go higher, but this will affect every other future node
							node_yy += 2 //Then we go to the next iteration of the loop.
							continue

						if(yuki_order_v[i] == "v") //So we must bring it back down after doing something like that unless we want each future node to be...
							node_y -= 2 //...On that same level.
							node_yy -= 2 //Though we can also just put 'v' in the list to make the tree have vertical lines going down too!
							continue //Then we go to the next iteration of the loop.

						var/SkillTreeNode/node = new
						node.name = yuki_order_v[i]

						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],[node_y]"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Vertical"
						noodle.screen_loc = "Tree1:-[node_xx],[node_yy]"
						src.client.screen += node
						src.client.screen += noodle

						var/next_link = i+1
						if((yuki_order_v[next_link] == "+") || (yuki_order_v[next_link] == "v")) //If the next thing in the tree is just a perk higher or lower than the current one...
							continue //On the same x-axis, then we're not gonna change the x-axis value, yeah? Then we go to the next iteration of the loop.
						else
							node_x -= 2  //Otherwise, we move the tree along, as we should!
							node_xx -= 2

				if(20) //Uzumaki Page

					winset(src,"PerkTree1.PerkTreeImage","image=\ref[fcopy_rsc('Uzumaki.png')]")
					winset(src,"PerkTree1.PerkTreeImage","image-mode=stretch")
					src << output(null,"PerkTree1.TreePageOutput")
					src << output("Uzumaki Progression Tree","PerkTree1.TreePageOutput")

					var/tree_length = uzu_order_h.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems
					var/noodle_length = uzu_order_h.len

					var/node_x = 16 //For the perks
					var/node_xx = 15 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = uzu_order_h[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-4"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node


					for(var/i=1, i<noodle_length, i++)

						node_xx -= 2

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-4"

						src.client.screen += noodle


					//It's possible to add perks in different x positions (heights) by changing the '-4' in screen loc. We can do this for progressive perks/side perks, or whatever you want.

					//This is the Vertical Tree

					var/tree_length_v = uzu_order_v.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems

					node_x = 14 //For the perks
					node_xx = 14 //For the spacers

					var/node_y = -2
					var/node_yy = -3

					for(var/i=1, i<tree_length_v, i++)

						if(uzu_order_v[i] == "-") //If we want this bit to be blank...
							node_x -= 2  //Make space!
							node_xx -= 2
							continue //Go to the next iteration of the loop

						if(uzu_order_v[i] == "+") //If we want to go even higher up the tree...
							node_y += 2 //We allow it to go higher, but this will affect every other future node
							node_yy += 2 //Then we go to the next iteration of the loop.
							continue

						if(uzu_order_v[i] == "v") //So we must bring it back down after doing something like that unless we want each future node to be...
							node_y -= 2 //...On that same level.
							node_yy -= 2 //Though we can also just put 'v' in the list to make the tree have vertical lines going down too!
							continue //Then we go to the next iteration of the loop.

						var/SkillTreeNode/node = new
						node.name = uzu_order_v[i]

						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],[node_y]"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Vertical"
						noodle.screen_loc = "Tree1:-[node_xx],[node_yy]"
						src.client.screen += node
						src.client.screen += noodle

						var/next_link = i+1
						if((uzu_order_v[next_link] == "+") || (uzu_order_v[next_link] == "v")) //If the next thing in the tree is just a perk higher or lower than the current one...
							continue //On the same x-axis, then we're not gonna change the x-axis value, yeah? Then we go to the next iteration of the loop.
						else
							node_x -= 2  //Otherwise, we move the tree along, as we should!
							node_xx -= 2
/*SHINGEN HERE*/
				if(12) //Shingen Page

					winset(src,"PerkTree1.PerkTreeImage","image=\ref[fcopy_rsc('Shingen1.png')]")
					winset(src,"PerkTree1.PerkTreeImage","image-mode=stretch")
					src << output(null,"PerkTree1.TreePageOutput")
					src << output("Shingen Progression Tree","PerkTree1.TreePageOutput")

					var/tree_length = shingen_order_h.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems
					var/noodle_length = shingen_order_h.len

					var/node_x = 16 //For the perks
					var/node_xx = 15 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = shingen_order_h[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-4"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node


					for(var/i=1, i<noodle_length, i++)

						node_xx -= 2

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-4"

						src.client.screen += noodle


					//It's possible to add perks in different x positions (heights) by changing the '-4' in screen loc. We can do this for progressive perks/side perks, or whatever you want.

					//This is the Vertical Tree

					var/tree_length_v = shingen_order_v.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems

					node_x = 14 //For the perks
					node_xx = 14 //For the spacers

					var/node_y = -2
					var/node_yy = -3

					for(var/i=1, i<tree_length_v, i++)

						if(shingen_order_v[i] == "-") //If we want this bit to be blank...
							node_x -= 2  //Make space!
							node_xx -= 2
							continue //Go to the next iteration of the loop

						if(shingen_order_v[i] == "+") //If we want to go even higher up the tree...
							node_y += 2 //We allow it to go higher, but this will affect every other future node
							node_yy += 2 //Then we go to the next iteration of the loop.
							continue

						if(shingen_order_v[i] == "v") //So we must bring it back down after doing something like that unless we want each future node to be...
							node_y -= 2 //...On that same level.
							node_yy -= 2 //Though we can also just put 'v' in the list to make the tree have vertical lines going down too!
							continue //Then we go to the next iteration of the loop.

						var/SkillTreeNode/node = new
						node.name = shingen_order_v[i]

						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],[node_y]"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Vertical"
						noodle.screen_loc = "Tree1:-[node_xx],[node_yy]"
						src.client.screen += node
						src.client.screen += noodle

						var/next_link = i+1
						if((shingen_order_v[next_link] == "+") || (shingen_order_v[next_link] == "v")) //If the next thing in the tree is just a perk higher or lower than the current one...
							continue //On the same x-axis, then we're not gonna change the x-axis value, yeah? Then we go to the next iteration of the loop.
						else
							node_x -= 2  //Otherwise, we move the tree along, as we should!
							node_xx -= 2
/*Shingen ^ */

				/*if(23) //Nara Page

					winset(src,"PerkTree1.PerkTreeImage","image=\ref[fcopy_rsc('Nara.png')]")
					winset(src,"PerkTree1.PerkTreeImage","image-mode=stretch")
					src << output(null,"PerkTree1.TreePageOutput")
					src << output("Nara Progression Tree","PerkTree1.TreePageOutput")

					var/tree_length = nara_order_h.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems
					var/noodle_length = nara_order_h.len

					var/node_x = 16 //For the perks
					var/node_xx = 15 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = nara_order_h[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-4"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node


					for(var/i=1, i<noodle_length, i++)

						node_xx -= 2

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-4"

						src.client.screen += noodle


					//It's possible to add perks in different x positions (heights) by changing the '-4' in screen loc. We can do this for progressive perks/side perks, or whatever you want.

					//This is the Vertical Tree

					var/tree_length_v = nara_order_v.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems

					node_x = 14 //For the perks
					node_xx = 14 //For the spacers

					var/node_y = -2
					var/node_yy = -3

					for(var/i=1, i<tree_length_v, i++)

						if(nara_order_v[i] == "-") //If we want this bit to be blank...
							node_x -= 2  //Make space!
							node_xx -= 2
							continue //Go to the next iteration of the loop

						if(nara_order_v[i] == "+") //If we want to go even higher up the tree...
							node_y += 2 //We allow it to go higher, but this will affect every other future node
							node_yy += 2 //Then we go to the next iteration of the loop.
							continue

						if(nara_order_v[i] == "v") //So we must bring it back down after doing something like that unless we want each future node to be...
							node_y -= 2 //...On that same level.
							node_yy -= 2 //Though we can also just put 'v' in the list to make the tree have vertical lines going down too!
							continue //Then we go to the next iteration of the loop.

						var/SkillTreeNode/node = new
						node.name = nara_order_v[i]

						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],[node_y]"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Vertical"
						noodle.screen_loc = "Tree1:-[node_xx],[node_yy]"
						src.client.screen += node
						src.client.screen += noodle

						var/next_link = i+1
						if((nara_order_v[next_link] == "+") || (nara_order_v[next_link] == "v")) //If the next thing in the tree is just a perk higher or lower than the current one...
							continue //On the same x-axis, then we're not gonna change the x-axis value, yeah? Then we go to the next iteration of the loop.
						else
							node_x -= 2  //Otherwise, we move the tree along, as we should!
							node_xx -= 2 */

				if(22) //Medical Page

					winset(src,"PerkTree1.PerkTreeImage","image=\ref[fcopy_rsc('sakuramedic.png')]")
					winset(src,"PerkTree1.PerkTreeImage","image-mode=stretch")
					src << output(null,"PerkTree1.TreePageOutput")
					src << output("Medical Progression Tree","PerkTree1.TreePageOutput")


//Middle Tree Portion
					var/tree_length = medic_order_h.len + 1
					var/noodle_length = medic_order_h.len

					var/node_x = 18 //For the perks
					var/node_xx = 17 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = medic_order_h[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-4"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node

					for(var/i=1, i<noodle_length, i++)
						node_xx -= 2
						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-4"

						src.client.screen += noodle


// Top Tree Portion
					tree_length = medic_order_v.len + 1
					noodle_length = medic_order_v.len

					node_x = 12 //For the perks
					node_xx = 11 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = medic_order_v[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-2"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node

					for(var/i=1, i<noodle_length, i++)
						node_xx -= 2
						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-2"

						src.client.screen += noodle
/*
					var/SkillTreeNode/nodeI = new
					nodeI.name = "Storm Bringer"
					nodeI.screen_loc ="Tree1:-2,0"
					nodeI.Find_Mimic()
					src.client.screen += nodeI

					var/NodeLines/nodelineI = new
					nodelineI.screen_loc ="Tree1:-2,-1"
					nodelineI.icon_state = "Vertical"
					src.client.screen += nodelineI
					*/


//Bot Tree Portion
					tree_length = medic_order_b.len + 1
					noodle_length = medic_order_b.len

					node_x = 12 //For the perks
					node_xx = 11 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = medic_order_b[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-6"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node

					for(var/i=1, i<noodle_length, i++)
						node_xx -= 2
						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-6"

						src.client.screen += noodle

					var/NodeLines/diagNE = new
					diagNE.icon_state = "Vertical"
					diagNE.screen_loc = "Tree1:-10,-3"

					src.client.screen += diagNE

					var/NodeLines/diagSE = new
					diagSE.icon_state = "Vertical"
					diagSE.screen_loc = "Tree1:-10,-5"

					src.client.screen += diagSE


					var/SkillTreeNode/nodeH = new
					nodeH.name = "Antitoxin"
					nodeH.screen_loc ="Tree1:-14,-2"
					nodeH.Find_Mimic()
					src.client.screen += nodeH

					var/SkillTreeNode/nodeG = new
					nodeG.name = "Herbalist I"
					nodeG.screen_loc ="Tree1:-12,-2"
					nodeG.Find_Mimic()
					src.client.screen += nodeG

					var/NodeLines/nodelineG = new
					nodelineG.screen_loc ="Tree1:-11,-2"
					nodelineG.icon_state = "Horizontal"
					src.client.screen += nodelineG

					var/NodeLines/nodelineH = new
					nodelineH.screen_loc ="Tree1:-14,-1"
					nodelineH.icon_state = "Vertical"
					src.client.screen += nodelineH

					var/NodeLines/nodelineX = new
					nodelineX.screen_loc ="Tree1:-14,-3"
					nodelineX.icon_state = "Vertical"
					src.client.screen += nodelineX

					var/NodeLines/nodelineI2 = new
					nodelineH.screen_loc ="Tree1:-13,-2"
					nodelineH.icon_state = "Horizontal"
					src.client.screen += nodelineI2



//FUUINJUTSU TREE EXTRAS
				if(7) //Fuuin Page

					winset(src,"PerkTree1.PerkTreeImage","image=\ref[fcopy_rsc('Fuuin.png')]")
					winset(src,"PerkTree1.PerkTreeImage","image-mode=stretch")
					src << output(null,"PerkTree1.TreePageOutput")
					src << output("Fuuin Progression Tree","PerkTree1.TreePageOutput")


					var/tree_length = fuuin_order_h.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems
					var/noodle_length = fuuin_order_h.len

					var/node_x = 16 //For the perks
					var/node_xx = 15 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = fuuin_order_h[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-4"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node


					for(var/i=1, i<noodle_length, i++)

						node_xx -= 2

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-4"

						src.client.screen += noodle


					//It's possible to add perks in different x positions (heights) by changing the '-4' in screen loc. We can do this for progressive perks/side perks, or whatever you want.

					//This is the Vertical Tree

					var/tree_length_v = fuuin_order_v.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems

					node_x = 14 //For the perks
					node_xx = 14 //For the spacers

					var/node_y = -2
					var/node_yy = -3

					for(var/i=1, i<tree_length_v, i++)

						if(fuuin_order_v[i] == "-") //If we want this bit to be blank...
							node_x -= 2  //Make space!
							node_xx -= 2
							continue //Go to the next iteration of the loop

						if(fuuin_order_v[i] == "+") //If we want to go even higher up the tree...
							node_y += 2 //We allow it to go higher, but this will affect every other future node
							node_yy += 2 //Then we go to the next iteration of the loop.
							continue

						if(fuuin_order_v[i] == "v") //So we must bring it back down after doing something like that unless we want each future node to be...
							node_y -= 2 //...On that same level.
							node_yy -= 2 //Though we can also just put 'v' in the list to make the tree have vertical lines going down too!
							continue //Then we go to the next iteration of the loop.

						var/SkillTreeNode/node = new
						node.name = fuuin_order_v[i]

						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],[node_y]"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Vertical"
						noodle.screen_loc = "Tree1:-[node_xx],[node_yy]"
						src.client.screen += node
						src.client.screen += noodle

						var/next_link = i+1
						if((fuuin_order_v[next_link] == "+") || (fuuin_order_v[next_link] == "v")) //If the next thing in the tree is just a perk higher or lower than the current one...
							continue //On the same x-axis, then we're not gonna change the x-axis value, yeah? Then we go to the next iteration of the loop.
						else
							node_x -= 2  //Otherwise, we move the tree along, as we should!
							node_xx -= 2

//KaifU TREE EXTRAS
				if(8) //Kaifu Page

					winset(src,"PerkTree1.PerkTreeImage","image=\ref[fcopy_rsc('Kaifu.png')]")
					winset(src,"PerkTree1.PerkTreeImage","image-mode=stretch")
					src << output(null,"PerkTree1.TreePageOutput")
					src << output("Kaifu Progression Tree","PerkTree1.TreePageOutput")


					var/tree_length = kaifu_order_h.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems
					var/noodle_length = kaifu_order_h.len

					var/node_x = 16 //For the perks
					var/node_xx = 15 //For the spacers

					for(var/i=1, i<tree_length, i++)

						node_x -= 2

						var/SkillTreeNode/node = new
						node.name = kaifu_order_h[i]
						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],-4"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						src.client.screen += node


					for(var/i=1, i<noodle_length, i++)

						node_xx -= 2

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Horizontal"
						noodle.screen_loc = "Tree1:-[node_xx],-4"

						src.client.screen += noodle


					//It's possible to add perks in different x positions (heights) by changing the '-4' in screen loc. We can do this for progressive perks/side perks, or whatever you want.

					//This is the Vertical Tree

					var/tree_length_v = kaifu_order_v.len + 1 //This gives the full size of the list. For some reason, setting i=0 is problems

					node_x = 14 //For the perks
					node_xx = 14 //For the spacers

					var/node_y = -2
					var/node_yy = -3

					for(var/i=1, i<tree_length_v, i++)

						if(kaifu_order_v[i] == "-") //If we want this bit to be blank...
							node_x -= 2  //Make space!
							node_xx -= 2
							continue //Go to the next iteration of the loop

						if(kaifu_order_v[i] == "+") //If we want to go even higher up the tree...
							node_y += 2 //We allow it to go higher, but this will affect every other future node
							node_yy += 2 //Then we go to the next iteration of the loop.
							continue

						if(kaifu_order_v[i] == "v") //So we must bring it back down after doing something like that unless we want each future node to be...
							node_y -= 2 //...On that same level.
							node_yy -= 2 //Though we can also just put 'v' in the list to make the tree have vertical lines going down too!
							continue //Then we go to the next iteration of the loop.

						var/SkillTreeNode/node = new
						node.name = kaifu_order_v[i]

						node.Find_Mimic()
						node.screen_loc = "Tree1:-[node_x],[node_y]"
						for(var/obj/jutsu/O in src.contents)
							if(O.name == node.name)
								node.icon = 'purchased.dmi'

						var/NodeLines/noodle = new
						noodle.name = "Noodle[i]"
						noodle.icon_state = "Vertical"
						noodle.screen_loc = "Tree1:-[node_xx],[node_yy]"
						src.client.screen += node
						src.client.screen += noodle

						var/next_link = i+1
						if((kaifu_order_v[next_link] == "+") || (kaifu_order_v[next_link] == "v")) //If the next thing in the tree is just a perk higher or lower than the current one...
							continue //On the same x-axis, then we're not gonna change the x-axis value, yeah? Then we go to the next iteration of the loop.
						else
							node_x -= 2  //Otherwise, we move the tree along, as we should!
							node_xx -= 2


// Datums (Classes)


SkillTreeNode
	parent_type = /obj

	icon='PerkTreeCards.dmi'

	var
		obj/jutsu/mimic // This will be the Jutsu that the node refers to
						// We'll output the name of the mimic alongside other vars


	MouseEntered()
		overlays += 'TreeNodeHighlight.dmi'
		usr << sound('perk-mouse-over.wav',volume=50)

	MouseExited()
		overlays = new

	New()
		..()
		Find_Mimic()
		src.alpha=0
		animate(src,alpha=255,time=5)

	Click()
		if(mimic == null) return
		usr << sound('menubeep.wav',volume=50)

	DblClick()
		for(var/obj/jutsu/O in archive)
			if(O.name == src.name)
				usr.databaseperk = O
				usr.BuySelectedPerk()


	proc
		Find_Mimic()
			for(var/obj/o in world_perks)
				if(o.name == src.name)
					src.mimic = o
					src.icon_state = o.icon_state
					return


NodeLines
	parent_type =/obj
	icon ='NodeLine.dmi'
	mouse_opacity = 0

	New()
		..()
		src.alpha=0
		animate(src,alpha=255,time=5)