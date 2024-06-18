//Clan rolling is long and often changed. Breaking it out.
mob/proc
	ClanWtf()
		/*if(src.Village=="Sunagakure")*/
		/*	if(archive.hyuuga_on) switch(custom_bigalert1(hyuuga_clan_info, "All members born into this clan possess the Byakugan, a kekkei genkai that gives them extended fields of vision and the ability to see through solid objects and even the chakra circulatory system, amongst other things.", 'clan_hyuuga.png', "Would you like to be born as a member of the Hyuuga clan?"))
				if("yes")
					src.Hyuuga=1
					src.name="Hyuuga, [name]"
					if(prob(20))
						src << "You are born in the Hyuuga Main Family."
					else
						src << "You are born in the Hyuuga Branch Family."
						src.overlays += 'Mark.dmi'
						src.Mark=1*/
			/*if(archive.aburame_on) switch(custom_bigalert1(aburame_clan_info, "At birth, members of this clan are offered to several special breed of insects as a nest, residing just under their host's skin. These insects will then live in symbiosis with their host from that point on. Because of this, its members are characterised by their use of insects as weapons.", 'clan_aburame.png', "Would you like to be born as a member of the Aburame clan?"))
				if("yes")
					src.Aburame=1
					src.name="Aburame, [name]"
					return*/
			/*if(archive.nara_on) switch(custom_bigalert1(nara_clan_info, "The Nara Clan is known for their intelligence, and special ninjutsu that entails the manipulation of shadows through the use of Yin Release.", 'clan_nara.png', "Would you like to be born as a member of the Nara clan?"))
				if("yes")
					src.Nara=1
					src.name="Nara, [name]"
					return*/
		/*if(src.Village=="Iwagakure")
			if(archive.inuzuka_on) switch(custom_bigalert1(inuzuka_clan_info, "You get a good boy, congrats.", 'clan_inuzuka.png', "Would you like to be born as a member of the Inuzuka clan?"))
				if("yes")
					src.Inuzuka=1
					src.name="Inuzuka, [name]"
					return
			if(archive.akimichi_on) switch(custom_bigalert1(akimichi_clan_info, "You are a mighty titan amongst shinobi, enjoy!", 'clan_akimichi.png', "Would you like to be born as a member of the Akimichi clan?"))
				if("yes")
					src.Akimichi=1
					src.name="Akimichi, [name]"
					return
		if(src.Village=="Amegakure")
			if(archive.hyuuga_on) switch(custom_bigalert1(hyuuga_clan_info, "All members born into this clan possess the Byakugan, a kekkei genkai that gives them extended fields of vision and the ability to see through solid objects and even the chakra circulatory system, amongst other things.", 'clan_hyuuga.png', "Would you like to be born as a member of the Hyuuga clan?"))
				if("yes")
					src.Hyuuga=1
					src.name="Hyuuga, [name]"
					return*/

/*	if(src.Village=="Yukigakure")
			/*if(prob(4) && archive.uchiha_on)
				switch(custom_bigalert1(uchiha_clan_info, "Members of the Uchiha clan have a natural affinity for the fire nature transformation; Uchiha are not truly considered adults until they can successfully perform the Fire Release: Great Fireball Technique. The Uchiha clan are most feared for their dojutsu kekkei genkai, the Sharingan.", 'clan_uchiha.png', "Would you like to be born as a member of the Uchiha clan?"))
					if("yes")
						src.Uchiha=1
						Uchiha1+=1
						src.name="Uchiha, [name]"
				return*/
			//if(prob(100)) ///hold up wana see sumfin
		/*	if(archive.hyuuga_on) switch(custom_bigalert1(hyuuga_clan_info, "All members born into this clan possess the Byakugan, a kekkei genkai that gives them extended fields of vision and the ability to see through solid objects and even the chakra circulatory system, amongst other things.", 'clan_hyuuga.png', "Would you like to be born as a member of the Hyuuga clan?"))
				if("yes")
					src.Hyuuga=1
					src.name="Hyuuga, [name]"
					if(prob(20))
						src << "You are born in the Hyuuga Main Family."
					else
						src << "You are born in the Hyuuga Branch Family."
						src.overlays += 'Mark.dmi'
						src.Mark=1
					return*/
			/*if(archive.yuki_on) switch(custom_bigalert1(yuki_clan_info, "The members of this clan possess the ability utilize the intimidating ice release.", 'clan_yuki.png', "Would you like to be born as a member of the Yuki clan?"))
				if("yes")
					src.Yuki=1
					src.name="Yuki, [name]"
					return*/
			if(archive.Yotsuki_on) switch(custom_bigalert1(yotsuki_clan_info, "The members of this clan possess display exceptional skill with the Raiton element.", 'clan_yotsuki.png', "Would you like to be born as a member of the Yotsuki clan?"))
				if("yes")
					src.Yotsuki=1
					src.name="Yotsuki, [name]"
					return
			//if(prob(20))
			if(archive.inuzuka_on) switch(custom_bigalert1(inuzuka_clan_info, "The clan's fighting style primarily revolves around their enhanced speed, strength and agility granted by the Four Legs Technique and other canine-based attacks, in conjunction with the tactical advantages granted by their heightened senses.", 'clan_inuzuka.png', "Would you like to be born as a member of the Inuzuka clan?"))
				if("yes")
					src.Inuzuka=1
					src.name="Inuzuka, [name]"
					if(autogenin)
						src.npcLimit=1
					return
			if(archive.hozuki_on) switch(custom_bigalert1(hozuki_clan_info, "The members of this clan possess the ability to turn their bodies into liquid state using the Hydrification Technique. This technique makes it impossible to receive damage from physical attacks. From a single hair, to the skin and muscles, everything can be liquefied and solidified at will.", 'clan_hozuki.png', "Would you like to be born as a member of the Hozuki clan?"))
				if("yes")
					src.Hozuki=1
					src.name="Hozuki, [name]"
					return
			//if(prob(25))

			//if(prob(30))
		/*	if(archive.akimichi_on) switch(custom_bigalert1(akimichi_clan_info, "The Akimichi are well known for their baika no jutsu, a hidden technique passed down in the Akimichi clan that increases the users body size by converting their calories into chakra.", 'clan_akimichi.png', "Would you like to be born as a member of the Akimichi clan?"))
				if("yes")
					src.Akimichi=1
					src.name="Akimichi, [name]"
					return
			if(prob(4) && archive.uchiha_on)
				switch(custom_bigalert1(senju_clan_info, "Unlike most other clans, the Senju never developed a trademark ability or style of combat, its members instead being equally proficient in all the ninja arts. It is from this balance that they acquired their name, 'Senju' (Literally meaning: 'a thousand skills'), in reference to their being 'the clan with a thousand skills'.", 'clan_senju.png', "Would you like to be born as a member of the Senju clan?"))
					if("yes")
						src.Senju=1
						src.name="Senju, [name]"
				return*/
			//if(prob(20))


	/*	if(src.Village=="Southern Region")
			if(archive.kaguya_on) switch(custom_bigalert1(kaguya_clan_info, "Shikotsumyaku (Macabre Bone Pulse) is a kekkei genkai which gives its wielder the ability to manipulate their own skeletal structure. By infusing their calcium with chakra, they can manipulate the growth and properties of their bones to their liking.", "Would you like to be born as a member of the Kaguya clan?"))
				if("yes")
					src.Kaguya=1
					src.name="Kaguya, [name]"
					return
			//if(prob(10))
			if(archive.hozuki_on) switch(custom_bigalert1(hozuki_clan_info, "The members of this clan possess the ability to turn their bodies into liquid state using the Hydrification Technique. This technique makes it impossible to receive damage from physical attacks. From a single hair, to the skin and muscles, everything can be liquefied and solidified at will.", 'clan_hozuki.png', "Would you like to be born as a member of the Hozuki clan?"))
				if("yes")
					src.Hozuki=1
					src.name="Hozuki, [name]"
					return
			if(archive.Hoshigaki_on) switch(custom_bigalert1(hoshigaki_clan_info, "", "Would you like to be born as a member of the Hoshigaki Clan?"))
				if("yes")
					src.Hoshigaki=1
					src.name="Hoshigaki, [name]"
					return
			if(archive.yuki_on) switch(custom_bigalert1(yuki_clan_info, "This is also a test by big bur", "Would you like to be born as a member of the Femboy clan?" ))
				if("yes")
					src.Yuki=1
					src.name="Yuki, [name]"  gonna move all this to a new dm - burr*/
					return
			//if(prob(9))


		//if(src.Village=="Sunagakure")
			/*if(prob(4))
				switch(custom_bigalert1(karasu_clan_info, "The Karasu Clan are a nomadic tribe known for their xenophobia. Their rare kekkei genkai, the Kuroshukufuku. This rare ability allows them to craft wings akin to that of crows or the <i>raven</i>, taking after their idols of worship and granting them a great and powerful chakra. They have great potential in healing and other chakra-based ventures, but shine best when among others alike themselves.",'clan_karasu.png',"Would you like to be born as a member of the Karasu clan?"))
					if("yes")
						src.Karasu=1
						src.name="Karasu, [name]"
				return
			if(prob(2))
				switch(custom_bigalert1(memori_clan_info, "An ancient and deadly clan known for its most prominent and long time only member-- Bahamut Memori. Bahamut was a man who sought immortality, and achieved it through a never ending struggle to steal the youth of others. When he was defeated and sealed away, his power had been received by the kin of those affected by his techniques in the past, giving birth to the rare power of the Emerald Dragon.",'clan_memori.png',"Would you like to be born as a member of the Memori Clan?"))
					if("yes")
						src.Memori=1
						src.name="Memori, [name]"
				return*/

*/