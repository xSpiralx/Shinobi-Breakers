mob/var/mob/Target

mob/proc/Mob_AI()
	if(monster)
		spawn() while(src)
			sleep(1)
			if(name=="Guardian")
				if(!KO)
					if(!Target)
						for(var/mob/M in oview(3)) if(M.z==z&&!Target)
							Target=M
					if(Target)
						step_towards(src,Target)
						BunshinAttack()
						var/confirmtarget=0
						for(var/mob/M in oview(3))
							if(M.z==z&&Target==M)
								confirmtarget=1
								break
						if(!confirmtarget) Target=null
			else if(!KO)
				if(!Target)
					step_rand(src)
					for(var/mob/M in oview(6)) if(M.z==z&&!Target)
						Target=M
				if(Target)
					step_towards(src,Target)
					var/confirmtarget=0
					for(var/mob/M in oview(6))
						if(M.z==z&&Target==M)
							confirmtarget=1
							src.BunshinAttack()
							break
					if(!confirmtarget) Target=null
			if(Target) sleep(movespeed)
			else sleep(movespeed*rand(8,12))


mob/var
	movespeed=6
	movetimer
	monster=0
	hostile=0
mob/Enemy
	attackable=1
	monster=1
	KO=0
	move=1
	New()
		..()
		spawn Mob_AI()
		Strength*=rand(10,100)
		Agility*=rand(10,100)
		Offence*=rand(10,100)
		Defence*=rand(10,100)
		var/random158=rand(1,4)
		if(random158==1)
			src.overlays+='Hair_Villager.dmi'
			var/obj/A=new/obj/items/Clothing/Boots
			A.icon += rgb(0,0,50)
			src.overlays+=A
			src.overlays += A.icon
			var/obj/B=new/obj/items/Clothing/Jacket
			B.icon += rgb(150,0,0)
			src.overlays+=B
			src.overlays += B.icon
		if(random158==2)
			src.overlays+='Hair_Long.dmi'
			var/obj/A=new/obj/items/Clothing/Boots
			A.icon += rgb(150,0,0)
			src.overlays+=A
			src.overlays += A.icon
			var/obj/B=new/obj/items/Clothing/Female_Coat
			B.icon += rgb(204,51,102)
			src.overlays+=B
			src.overlays += B.icon
		if(random158==3)
			src.overlays+='Hair_Spikey2.dmi'
			var/obj/A=new/obj/items/Clothing/Boots
			A.icon += rgb(0,0,0)
			src.overlays+=A
			src.overlays += A.icon
			var/obj/B=new/obj/items/Clothing/Coat
			B.icon += rgb(150,150,150)
			src.overlays+=B
			src.overlays += B.icon
		if(random158==4)
			src.overlays+='Clothing_Kimono.dmi'
			src.overlays+='Hair_Loose_Ponytail.dmi'
			var/obj/A=new/obj/items/Clothing/Shoes
			A.icon += rgb(0,0,50)
			src.overlays+=A
			src.overlays += A.icon
			var/obj/C=new/obj/items/Clothing/Pants
			C.icon += rgb(0,112,223)
			src.overlays+=C
			src.overlays += C.icon
			var/obj/B=new/obj/items/Clothing/Kimono
			B.icon += rgb(0,112,223)
			src.overlays+=B
			src.overlays += B.icon

	Villager
		icon='Base_FemaleWhite.dmi'
		attackable=1
		monster=1
		Health=10
		MaxChakra=5
		Chakra=5
		Strength=3
		Agility=3
		Offence=15
		Defence=1
		movespeed=2
		BunshinAttack()

mob/Guard/WanderingGuard
	New()
		name="Guard [RandomName()]"
		icon=pick('Base_Black.dmi','Base_FemaleBlack.dmi','Base_FemalePale.dmi','Base_FemaleTan.dmi','Base_FemaleWhite.dmi','Base_Pale.dmi','Base_Tan.dmi','Base_White.dmi')
		spawn()src.Wander(2)
		spawn()src.AddHair()
		spawn()src.AddGuardOverlays()
		spawn()src.Guard_AI()
		..()
	attackable=1
	move=1
	Chakra=150
	MaxChakra=150
	Stamina=200
	Strength=150
	Agility=300
	Defence=150
	Offence=200
	Control=200
	Resistance=200
	Ninjutsu=80
	Genjutsu=80
	Taijutsu=80
	Health=1000
	MaxHealth=1000
	monster=1
	Village="None"

mob/Guard/StantionaryGuard
	New()
		name="Guard [RandomName()]"
		icon=pick('Base_Black.dmi','Base_FemaleBlack.dmi','Base_FemalePale.dmi','Base_FemaleTan.dmi','Base_FemaleWhite.dmi','Base_Pale.dmi','Base_Tan.dmi','Base_White.dmi')
		spawn()src.AddHair()
		spawn()src.AddGuardOverlays()
		spawn()src.Guard_AI()
		..()
	attackable=1
	move=1
	Chakra=500
	MaxChakra=500
	Stamina=500
	Strength=500
	Agility=500
	Defence=500
	Offence=500
	Control=500
	Resistance=500
	Ninjutsu=500
	Genjutsu=500
	Taijutsu=500
	Health=2500
	MaxHealth=2500
	monster=1
	Village="None"

mob/proc/Guard_AI()
	set background=1
	while(src)
		sleep(1)
		if(prob(5))
			src.Health+=src.MaxHealth/1
			if(src.Health>src.MaxHealth)
				src.Health=src.MaxHealth
		if(src.hostile==0)
			if(src.Health/MaxHealth < 0.9)
				hostile=1
				world<<"<font color=red>Village Information:<font color=#FFCC11> [src.Village] is under attack!"
			sleep(60)
		else
			for(var/mob/M in oview(10))
				if(src.Village!=M.Village)
					if(!src.KO)
						if(!src.Target)
							if(M.z==src.z&&!src.Target)
								Target=M
						if(Target)
							step_towards(src,src.Target)
							BunshinAttack()
							var/confirmtarget=0
							if(M.z==src.z&&src.Target==M)
								confirmtarget=1
								break
							if(!confirmtarget) src.Target=null
				if(src.Target) sleep(src.movespeed)
				else sleep(src.movespeed*rand(8,12))


mob/Villager
	New()
		name=RandomName()
		icon=pick('Base_Black.dmi','Base_FemaleBlack.dmi','Base_FemalePale.dmi','Base_FemaleTan.dmi','Base_FemaleWhite.dmi','Base_Pale.dmi','Base_Tan.dmi','Base_White.dmi')
		spawn()src.Wander(1)
		spawn()src.AddHair()
		spawn()src.AddOverlays()
		..()
	attackable=1
	move=1
	Chakra=5
	MaxChakra=5
	Stamina=100
	Strength=4
	Agility=4
	Defence=5
	Offence=6
	Control=4
	Resistance=4
	Ninjutsu=1
	Genjutsu=1
	Taijutsu=5
	Health=100
	MaxHealth=100

proc/RandomName()
	var/WTF=pick("Bob","John","Michael","Maya","Sayara","Mina","Honda","Hanzo","Zack","George","Michelle","Leo","Ven","Kira","Tilk","Teala","Mishy","Niss","Jay","Vagou","Danny","Gabriel","Esperanza","Nathaniel","Chris","Isaiah","Ian","Marshal","Wayne","Sean","Jean","Joey","Laura","Kiki","Coco","Kairi","Mengst","Kerry","Tim","Jamal","Timothy","Riesa","Rita","Karl","Carter","Jackie","Louis","Peter","Meg","Saiza","Mariah","Marsha","Dorris","Hezekaiah","Zen","Darrel","Mike","Vincent","Yuffie","Ayame","Kasumi","Tina","Nirithia","Titania","Odyssia","Bobby","Jesse","Jessica","Shaquana-leesha","Shanequa","Sara","Sarah","Paul","Amanda","Frank","Sora","Jaquelin","Kim","Kimmy","Pajamay","Niri","Hawthorne","Melanie","Jose","Jaze","Cerulean","Nick","James","Kadeem","Jack","Dave","David","Jackson","Clark","Kent","Mobey","Obi","Obey","Tazz","Raphael","Angelo","Leonardo","Donny","Donotello","Rad","Jamel","Krystie","Krystyna","Brittney","Lolli","Lily","Pedal","Sylvan","Tyri","Marsai","Kai","Koga","Rave","Raven","Robin","Strinn","Aeol","Zack","Rick","Ricky","Tifa","Reno","Tareno","Barret","Chip","Dale","Mirazoka","Peach","Gisae","Crystal","Mary","Marie","Melinda","Desiree","Caroll","Carrol","Faith","Dianna","Ray","Tyson","Max","Maximus","Keith","Cherish","Dijonae","Karina","Tyrell","Turell","Lee","Antonyo","Erik","Eryk","Eric","Elric","Alphonse","Al","Jon","Jones","Nala","Nahla","Nayla","Ysera","Alex","Alexander","Alexis","Alexa","Li","Jade","Ruby","Rubee","Saphire","Tae","Tita","Tristan","Isolde","Mark","Macho","Julio","Priscilla","Naomi","Cynthia","Milly","Nelly","Sabrina","Wilma","Jen","Jennifer","Giselle","Hara","Monica","Monique","Shaquille","Desmond","Allejulah","Vonz","Rebekah","Rebecca","Sanchez","Saneria","Carlos")
	return WTF
mob/proc
	Wander(var/Type)
		set background=1
		if(Type == 1)
			while(src)
				sleep(1)
				step_rand(src)
				var/Person="<b>[src.name]:</b>"
				for(var/mob/M in viewers(10))
					if(M.client&&prob(30))
						if(src.WHO)
							if(!(src.WHO.Find(M.ckey)))
								var/GreetingMessage=pick("Hello [M]!","Sup?","Hi.","Hey.","Wassup'!?","How are you?","How's it going?","Hey, my name's [src.name].","Hey, the name's [src.name].","What's your name?","Hi, my name is [src.name].","What're you doing around here?","We don't like your kind around here.","....","What're you lookin' at?","Why are you looking at me?","Did you want something?","I hear things are bad out at night, I wouldn't know. I'm too scared to go out around then!","You know� I dropped something around here the other day.","I hope she sends me mail!","I hope he sends me mail!","I wonder if they're thinking about me right now","I love her. I lo- Huh?! Oh, what are you doing here?","Look at this chump.","Anyone ever notice the baby boom around here?","Ninja's Yuk!","Ninjas don't bring anything but conflict!","Fighting doesn't solve anything.","Fighting is the only way to solve problems now'a'days.","I'm going to be an awesome ninja one day!","I'm going to be the Kage!","One day. One day you'll all see!","You'll all be sorry. Watch. All of you will be sorry.","You know that the human body can barely survive with five pints of blood. Right? Heheha","I just got a new blade!","My dad is the best ninja ever!","My dad is the best!","You seen my mom?","I wonder if I have a chance","Just put that there Cut th- Oh, hey."," Psst, come here Interested in a bit of 'Stuff'?","Hey, like what you see?","I never wanted this.","Another day, another dollar.","God� Work is so lame!","Babies. The lot of you.","Another pathetic guy.","I'm never dating another guy again!","I'm never dating another girl again!","You got a problem punk?!","The kage is horrible! The village is going downhill quick!","The Kage does such a great job, life is great!","Peace and prosperity. If only it would last.","Down with the Kage!","The Kage only brings trouble. We have to get rid of him.","The Kage, just like every other ninja, is destroying peace!","The Kage is great, those fanatics don't know what they're talking about.","The darkest place is inside a person's heart.","You never know what you got until its gone.")
								viewers(10) << "[Person] [GreetingMessage]"
								src.WHO+=M.ckey
								spawn(rand(1000,4000))src.WHO-=M.ckey
						else
							var/GreetingMessage=pick("Hello [M]!","Sup?","Hi.","Hey.","Wassup'!?","How are you?","How's it going?","Hey, my name's [src.name].","Hey, the name's [src.name].","What's your name?","Hi, my name is [src.name].","What're you doing around here?","We don't like your kind around here.","....","What're you lookin' at?","Why are you looking at me?","Did you want something?","I hear things are bad out at night, I wouldn't know. I'm too scared to go out around then!","You know� I dropped something around here the other day.","I hope she sends me mail!","I hope he sends me mail!","I wonder if they're thinking about me right now","I love her. I lo- Huh?! Oh, what are you doing here?","Look at this chump.","Anyone ever notice the baby boom around here?","Ninja's Yuk!","Ninjas don't bring anything but conflict!","Fighting doesn't solve anything.","Fighting is the only way to solve problems now'a'days.","I'm going to be an awesome ninja one day!","I'm going to be the Kage!","One day. One day you'll all see!","You'll all be sorry. Watch. All of you will be sorry.","You know that the human body can barely survive with five pints of blood. Right? Heheha","I just got a new blade!","My dad is the best ninja ever!","My dad is the best!","You seen my mom?","I wonder if I have a chance","Just put that there Cut th- Oh, hey."," Psst, come here Interested in a bit of 'Stuff'?","Hey, like what you see?","I never wanted this.","Another day, another dollar.","God� Work is so lame!","Babies. The lot of you.","Another pathetic guy.","I'm never dating another guy again!","I'm never dating another girl again!","You got a problem punk?!","The kage is horrible! The village is going downhill quick!","The Kage does such a great job, life is great!","Peace and prosperity. If only it would last.","Down with the Kage!","The Kage only brings trouble. We have to get rid of him.","The Kage, just like every other ninja, is destroying peace!","The Kage is great, those fanatics don't know what they're talking about.","The darkest place is inside a person's heart.","You never know what you got until its gone.")
							viewers(10) << "[Person] [GreetingMessage]"
							src.WHO+=M.ckey
							spawn(rand(1000,4000))src.WHO-=M.ckey
				sleep(rand(20,60))
		if(Type == 2)
			while(src)
				sleep(1)
				if(src.hostile!=1)
					step_rand(src)
					for(var/mob/M in viewers(10))
						if(M.client&&prob(30))
							if(src.WHO)
								if(!(src.WHO.Find(M.ckey)))
									var/Person="<b>[src.name]:</b>"
									var/GreetingMessage=pick("... Watch yourself... People are savages...","...If you wanna get out alive... Run for you life.","You can die in a second, anything more is a luxury.","I carry many knives...","How many pints of blood does it take for someone to die...? Want to find out?","...","If you take another step, you're liable to stop breathing.","Move along.","Don't piss me off!","Pathetic...","You picked the wrong day.","Move it!","Fool!","I hate cowards.","A scream sounds the same in every language.","How many cries could a blonde girl cry, if a blond girl had her throat cut...?","Anyone hear about that Darkness? He hasn't called me back in a while.","Man... Kage's fuckin' up lately.","I hate serving this pathetic place... These pathetic... People.","Only the strong survive!","I can see your future... And all I see is a bag.","The most frightening name you'll ever know is Hale.","From the day you were born... Killing was your instinct to live!")
									viewers(10) << "[Person] [GreetingMessage]"
									src.WHO+=M.ckey
									spawn(rand(1000,4000))src.WHO-=M.ckey
							else
								var/Person="<b>[src.name]:</b>"
								var/GreetingMessage=pick("... Watch yourself... People are savages...","...If you wanna get out alive... Run for you life.","You can die in a second, anything more is a luxury.","I carry many knives...","How many pints of blood does it take for someone to die...? Want to find out?","...","If you take another step, you're liable to stop breathing.","Move along.","Don't piss me off!","Pathetic...","You picked the wrong day.","Move it!","Fool!","I hate cowards.","A scream sounds the same in every language.","How many cries could a blonde girl cry, if a blond girl had her throat cut...?","Anyone hear about that Darkness? He hasn't called me back in a while.","Man... Kage's fuckin' up lately.","I hate serving this pathetic place... These pathetic... People.","Only the strong survive!","I can see your future... And all I see is a bag.","The most frightening name you'll ever know is Hale.","From the day you were born... Killing was your instinct to live!")
								viewers(10) << "[Person] [GreetingMessage]"
								src.WHO+=M.ckey
								spawn(rand(1000,4000))src.WHO-=M.ckey
				sleep(rand(20,60))

mob/proc/AddHair()
	var/obj/Hairz=new/obj/
	Hairz.icon=pick('Hair_Bowl.dmi','Hair_Hinata.dmi','Hair_Choji.dmi','Hair_Villager.dmi','Hair_Juugo.dmi','Tsunade.dmi','Hair_Kakashi.dmi','Hair_Kisame.dmi','Hair_Short.dmi','Hair_Chiyo.dmi','Jiraiya.dmi','Hair_Emo.dmi','Hair_Wild.dmi','Hair_Loose_Ponytail.dmi','Hair_Long.dmi','Hair_Little.dmi','Hair_Ponytail.dmi','Hair_Sakura.dmi','Hair_Sasuke.dmi','Hair_Naruto.dmi','Hair_Spikey.dmi','Hair_Spikey2.dmi','Hair_Spikey3.dmi','Hair_Topknot.dmi','Hair_Tenten.dmi','Hair_Mohawk.dmi','Afro.dmi','Hair_Crazy-Afro.dmi','Hair_Crazy.dmi','Hair_Untidy.dmi')
	Hairz.icon += rgb(rand(1,80),rand(1,80),rand(1,80))
	src.overlays+=Hairz.icon
mob/proc/AddOverlays()
	var/obj/A
	var/obj/B
	var/obj/C
	var/obj/D
	var/obj/E
	var/R=rand(1,3)
	var/RM=rand(1,3)
	if(R==1)
		A = new/obj/items/Clothing/Robe
	if(R==2)
		var/RA=rand(1,7)
		if(RA==1)
			A=new/obj/items/Clothing/Jacket
		if(RA==2)
			A=new/obj/items/Clothing/Sleeveless_Jacket
		if(RA==3)
			A=new/obj/items/Clothing/Long_Sleeved_Shirt
		if(RA==4)
			A=new/obj/items/Clothing/Vest
		if(RA==5)
			A=new/obj/items/Clothing/Coat
		if(RA==6)
			A=new/obj/items/Clothing/Female_Coat
		if(RA==7)
			A=new/obj/items/Clothing/Shirt
		if(prob(60))
			var/LOL=rand(1,2)
			if(LOL==1)
				B=new/obj/items/Clothing/Shoes
			if(LOL==2)
				B=new/obj/items/Clothing/Boots
		if(prob(60))
			var/LOL=rand(1,2)
			if(LOL==1)
				C=new/obj/items/Clothing/Slash
			if(LOL==2)
				C=new/obj/items/Clothing/Belt
		if(prob(80))
			var/LOL=rand(1,2)
			if(LOL==1)
				E=new/obj/items/Clothing/Pants
			if(LOL==2)
				E=new/obj/items/Clothing/Shorts
	if(R==3)
		A=new/obj/items/Clothing/Kimono
	if(RM==1)
		D=new/obj/items/Clothing/Facemask
	if(RM==2)
		D=new/obj/items/Clothing/Backwards_Scarf
	if(RM==3)
		D=new/obj/items/Clothing/Gloves
	if(A) if(A.icon)
		A.icon += rgb(rand(1,80),rand(1,80),rand(1,80))
		src.overlays+=A.icon
	if(B) if(B.icon)
		B.icon += rgb(rand(1,80),rand(1,80),rand(1,80))
		src.overlays+=B.icon
	if(C) if(C.icon)
		C.icon += rgb(rand(1,80),rand(1,80),rand(1,80))
		src.overlays+=C.icon
	if(D) if(D.icon)
		D.icon += rgb(rand(1,80),rand(1,80),rand(1,80))
		src.overlays+=D.icon
	if(E) if(E.icon)
		E.icon += rgb(rand(1,80),rand(1,80),rand(1,80))
		src.overlays+=E.icon



mob/proc/AddGuardOverlays()
	var/obj/I
	var/obj/H
	var/RI=rand(1,3)
	if(RI==1)
		I=new/obj/items/Clothing/Leaf_Jounin
	if(RI==2)
		I=new/obj/items/Clothing/Suna_Jounin
	if(RI==3)
		I=new/obj/items/Clothing/Mist_Jounin
	var/RH=rand(1,3)
	if(RH==1)
		H=new/obj/items/Clothing/Leaf_Chunin
	if(RH==2)
		H=new/obj/items/Clothing/Suna_Chunin
	if(RH==3)
		H=new/obj/items/Clothing/Mist_Chunin
	src.overlays+=I.icon
	src.overlays+=H.icon
	var/obj/N=new/obj/items/Clothing/Holster
	src.overlays+=N.icon
	var/obj/WTF=new/obj/items/Clothing/Headband
	src.overlays+=WTF.icon




mob/NPC

	Shopkeeper
		icon='Base_Pale.dmi'
		icon_state=""
		attackable=0
		New()
			spawn()src.AddHair()
			spawn()src.AddOverlays()
			..()
		Click()
			if(get_dist(src,usr)>2) return
			usr.barberShop = 0
			usr.skinCreate = 0
			var/X=usr.CustomInput("What can I help you with?","Shopkeep",list("Purchase","Nevermind"))
			if(!X) return
			switch(X:name)
				if("Nevermind")
					closeShop()
					return
				if("Sell")
					var/list/Items=list()
					for(var/obj/items/I in usr.contents)
						if(I.newbie)
							continue
						if(istype(I,/obj/items/Clothing/)&&!I:worn) Items["[I.name]"]=I
						if(istype(I,/obj/items/Weapon/Torch/)&&!I:worn) Items["[I.name]"]=I
						if(istype(I,/obj/items/Weapon/Pickaxe/)&&!I:worn) Items["[I.name]"]=I
						if(istype(I,/obj/items/Weapon/Fishing_Rod/)&&!I:worn) Items["[I.name]"]=I
						if(istype(I,/obj/items/Weapon/Axe/)&&!I:worn) Items["[I.name]"]=I
					if(!Items.len)
						usr<<output("<font size = -3>You have nothing of value!","outputic.output")
						usr<<output("<font size = -3>You have nothing of value!","outputall.output")
						return
					var/Choice=usr.CustomInput("What would you like to sell?","Shopkeep",Items)
					var/obj/items/O=Items["[Choice]"]
					if(!O) return
					if(O.newbie)
						usr<<output("<font size = -3>You cant sell that.","outputic.output")
						return
					if(istype(O,/obj/items/Clothing/))
						if(O:worn) return
						var/hasryo=0
						for(var/obj/items/Ryo/R in usr.contents)
							hasryo=R
						if(hasryo)
							hasryo:amount+=2
							hasryo:Update()
						else
							var/obj/items/Ryo/R=new(usr)
							R.amount=2
							R.Update()
						usr<<output("<font size = -3>The shopkeeper hands you 2 Ryo for this item.","outputic.output")
						usr<<output("<font size = -3>The shopkeeper hands you 2 Ryo for this item.","outputall.output")
						del(O)
						return
					if(istype(O,/obj/items/Weapon/Torch/))
						if(O:worn) return
						var/hasryo=0
						for(var/obj/items/Ryo/R in usr.contents)
							hasryo=R
						if(hasryo)
							hasryo:amount+=5
							hasryo:Update()
						else
							var/obj/items/Ryo/R=new(usr)
							R.amount=5
							R.Update()
						usr<<output("<font size = -3>The shopkeeper hands you 5 Ryo for this item.","outputic.output")
						usr<<output("<font size = -3>The shopkeeper hands you 5 Ryo for this item.","outputall.output")
						del(O)
						return
					if(istype(O,/obj/items/Weapon/Pickaxe/))
						if(O:worn) return
						var/hasryo=0
						for(var/obj/items/Ryo/R in usr.contents)
							hasryo=R
						if(hasryo)
							hasryo:amount+=75
							hasryo:Update()
						else
							var/obj/items/Ryo/R=new(usr)
							R.amount=75
							R.Update()
						usr<<output("<font size = -3>The shopkeeper hands you 75 Ryo for this item.","outputic.output")
						usr<<output("<font size = -3>The shopkeeper hands you 75 Ryo for this item.","outputall.output")
						del(O)
						return
					if(istype(O,/obj/items/Weapon/Axe/))
						if(O:worn) return
						var/hasryo=0
						for(var/obj/items/Ryo/R in usr.contents)
							hasryo=R
						if(hasryo)
							hasryo:amount+=75
							hasryo:Update()
						else
							var/obj/items/Ryo/R=new(usr)
							R.amount=75
							R.Update()
						usr<<output("<font size = -3>The shopkeeper hands you 75 Ryo for this item.","outputic.output")
						usr<<output("<font size = -3>The shopkeeper hands you 75 Ryo for this item.","outputall.output")
						del(O)
						return
					if(istype(O,/obj/items/Weapon/Fishing_Rod/))
						if(O:worn) return
						var/hasryo=0
						for(var/obj/items/Ryo/R in usr.contents)
							hasryo=R
						if(hasryo)
							hasryo:amount+=25
							hasryo:Update()
						else
							var/obj/items/Ryo/R=new(usr)
							R.amount=25
							R.Update()
						usr<<output("<font size = -3>The shopkeeper hands you 25 Ryo for this item.","outputic.output")
						usr<<output("<font size = -3>The shopkeeper hands you 25 Ryo for this item.","outputall.output")
						del(O)
						return
					if(istype(O,/obj/items/Food/Big_Fish/))
						if(O:worn) return
						var/hasryo=0
						for(var/obj/items/Ryo/R in usr.contents)
							hasryo=R
						if(hasryo)
							hasryo:amount+=1
							hasryo:Update()
						else
							var/obj/items/Ryo/R=new(usr)
							R.amount=1
							R.Update()
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputic.output")
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputall.output")
						del(O)
						return
					if(istype(O,/obj/items/Food/Big_Fish_Fry/))
						if(O:worn) return
						var/hasryo=0
						for(var/obj/items/Ryo/R in usr.contents)
							hasryo=R
						if(hasryo)
							hasryo:amount+=1
							hasryo:Update()
						else
							var/obj/items/Ryo/R=new(usr)
							R.amount=1
							R.Update()
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputic.output")
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputall.output")
						del(O)
						return
					if(istype(O,/obj/items/Food/Med_Fish/))
						if(O:worn) return
						var/hasryo=0
						for(var/obj/items/Ryo/R in usr.contents)
							hasryo=R
						if(hasryo)
							hasryo:amount+=1
							hasryo:Update()
						else
							var/obj/items/Ryo/R=new(usr)
							R.amount=1
							R.Update()
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputic.output")
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputall.output")
						del(O)
						return
					if(istype(O,/obj/items/Food/Med_Fish_Fry/))
						if(O:worn) return
						var/hasryo=0
						for(var/obj/items/Ryo/R in usr.contents)
							hasryo=R
						if(hasryo)
							hasryo:amount+=1
							hasryo:Update()
						else
							var/obj/items/Ryo/R=new(usr)
							R.amount=1
							R.Update()
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputic.output")
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputall.output")
						del(O)
						return
					if(istype(O,/obj/items/Food/Med_Fish2/))
						if(O:worn) return
						var/hasryo=0
						for(var/obj/items/Ryo/R in usr.contents)
							hasryo=R
						if(hasryo)
							hasryo:amount+=1
							hasryo:Update()
						else
							var/obj/items/Ryo/R=new(usr)
							R.amount=1
							R.Update()
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputic.output")
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputall.output")
						del(O)
						return
					if(istype(O,/obj/items/Food/Med_Fish2_Fry/))
						if(O:worn) return
						var/hasryo=0
						for(var/obj/items/Ryo/R in usr.contents)
							hasryo=R
						if(hasryo)
							hasryo:amount+=1
							hasryo:Update()
						else
							var/obj/items/Ryo/R=new(usr)
							R.amount=1
							R.Update()
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputic.output")
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputall.output")
						del(O)
						return
					if(istype(O,/obj/items/Food/Med_Fish3_Fry/))
						if(O:worn) return
						var/hasryo=0
						for(var/obj/items/Ryo/R in usr.contents)
							hasryo=R
						if(hasryo)
							hasryo:amount+=1
							hasryo:Update()
						else
							var/obj/items/Ryo/R=new(usr)
							R.amount=1
							R.Update()
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputic.output")
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputall.output")
						del(O)
						return
					if(istype(O,/obj/items/Food/Med_Fish3/))
						if(O:worn) return
						var/hasryo=0
						for(var/obj/items/Ryo/R in usr.contents)
							hasryo=R
						if(hasryo)
							hasryo:amount+=1
							hasryo:Update()
						else
							var/obj/items/Ryo/R=new(usr)
							R.amount=1
							R.Update()
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputic.output")
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputall.output")
						del(O)
						return
					if(istype(O,/obj/items/Food/Small_Fish/))
						if(O:worn) return
						var/hasryo=0
						for(var/obj/items/Ryo/R in usr.contents)
							hasryo=R
						if(hasryo)
							hasryo:amount+=1
							hasryo:Update()
						else
							var/obj/items/Ryo/R=new(usr)
							R.amount=1
							R.Update()
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputic.output")
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputall.output")
						del(O)
						return
					if(istype(O,/obj/items/Food/Small_Fish_Fry/))
						if(O:worn) return
						var/hasryo=0
						for(var/obj/items/Ryo/R in usr.contents)
							hasryo=R
						if(hasryo)
							hasryo:amount+=1
							hasryo:Update()
						else
							var/obj/items/Ryo/R=new(usr)
							R.amount=1
							R.Update()
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputic.output")
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputall.output")
						del(O)
						return
					usr<<output("<font size = -3>The shopkeeper doesn't seem to be interested in that.","outputic.output")
					usr<<output("<font size = -3>The shopkeeper doesn't seem to be interested in that.","outputall.output")
					return
				if("Purchase")
					var/I=usr.CustomInput("What would you like to see?","Shopkeep",list("Clothing","Scrolls","Misc","Furniture","Nothing"))
					if(!I) return
					switch(I:name)//obj/items/Weapon/Rope
						if("Nothing")
							closeShop()
							return
						if("Furniture")
							var/Z=usr.updateShopListing("What would you like to buy?","Shopkeep",list("Standup Lamp (250 Ryo)","Hanging Lamp (200 Ryo)","Chair (350 Ryo)","Phone (400 Ryo)","Couch (600 Ryo)","Television (1000 Ryo)","Nothing"))
							if(!Z) return
							switch(Z:name)
								if("Nothing")
									closeShop()
								if("Standup Lamp (250 Ryo)")
									for(var/obj/items/Ryo/R in usr.contents)
										if(R.amount>=250)
											R.amount-=250
											R.Update()
											var/obj/A = new/obj/build/Housing/Furniture/Lanterns/Inside
											usr.contents+=A
											usr.closeShop()
											break

								if("Hanging Lamp (200 Ryo)")
									for(var/obj/items/Ryo/R in usr.contents)
										if(R.amount>=200)
											R.amount-=200
											R.Update()
											var/obj/A = new/obj/build/Housing/Furniture/Lanterns/Hung
											usr.contents+=A
											usr.closeShop()
											break

								if("Chair (350 Ryo)")
									for(var/obj/items/Ryo/R in usr.contents)
										if(R.amount>=350)
											R.amount-=350
											R.Update()
											var/obj/A = new/obj/build/Housing/Furniture/Chair
											usr.contents+=A
											usr.closeShop()
											break
								if("Phone (400 Ryo)")
									for(var/obj/items/Ryo/R in usr.contents)
										if(R.amount>=400)
											R.amount-=400
											R.Update()
											var/obj/A = new/obj/build/Housing/Furniture/Phone
											usr.contents+=A
											usr.closeShop()
											break

								if("Couch (600 Ryo)")
									for(var/obj/items/Ryo/R in usr.contents)
										if(R.amount>=600)
											R.amount-=600
											R.Update()
											var/obj/A = new/obj/build/Housing/Furniture/Couch
											usr.contents+=A
											usr.closeShop()
											break
								if("Television (1000 Ryo)")
									for(var/obj/items/Ryo/R in usr.contents)
										if(R.amount>=1000)
											R.amount-=1000
											R.Update()
											var/obj/A = new/obj/build/Housing/Furniture/Television
											usr.contents+=A
											usr.closeShop()
											break
						if("Misc")
							startMisc:
							var/Z=usr.updateShopListing("What would you like to buy?","Shopkeep",list("Tent Kit (600 Ryo)","Tinderbox (100 Ryo)","Rope (20 Ryo)","Radio (350 Ryo)","Pickaxe (400 Ryo)","Axe (250 Ryo)","Torch (15 Ryo)","Fishing Rod (50 Ryo)","Back Pouch (60 Ryo)","Nothing"))
							if(!Z) return
							switch(Z:name)
								if("Nothing")
									closeShop()
								if("Rope (20 Ryo)")
									for(var/obj/items/Ryo/R in usr.contents)
										if(R.amount>=20)
											R.amount-=20
											R.Update()
											var/obj/A = new/obj/items/Weapon/Rope
											usr.contents+=A
											usr.closeShop()
											break
								if("Tent Kit (600 Ryo)")
									for(var/obj/items/Ryo/R in usr.contents)
										if(R.amount>=600)
											R.amount-=600
											R.Update()
											var/obj/A = new/obj/items/tentKit
											usr.contents+=A
											usr.closeShop()
											break
								if("Tinderbox (100 Ryo)")
									for(var/obj/items/Ryo/R in usr.contents)
										if(R.amount>=100)
											R.amount-=100
											R.Update()
											var/obj/A = new/obj/items/tinderbox
											usr.contents+=A
											usr.closeShop()
											break
								if("Radio (350 Ryo)")
									usr.addShopItem(new/obj/items/Clothing/Radio_Comm,350)
									goto startMisc
								if("Torch (15 Ryo)")
									usr.addShopItem(new/obj/items/Weapon/Torch,15)
									goto startMisc
								if("Pickaxe (400 Ryo)")
									usr.addShopItem(new/obj/items/Weapon/Pickaxe,400)
									goto startMisc
								if("Axe (250 Ryo)")
									usr.addShopItem(new/obj/items/Weapon/Axe,250)
									goto startMisc
								if("Fishing Rod (50 Ryo)")
									usr.addShopItem(new/obj/items/Weapon/Fishing_Rod,50)
									goto startMisc
								if("Back Pouch (60 Ryo)")
									usr.addShopItem(new/obj/items/Clothing/backpouch,60)
									goto startMisc
						if("Clothing")
							startClothes:
							var/Z=usr.updateShopListing("What would you like to buy? All clothes are 10 Ryo.","Shopkeep",list(,"Glasses","Scarf","Collared Robes","Straw Hat","Hooded Cloak","Fancy Top","Towel (F)","Towel (M)","Collared Shirt","Contacts","Hood","Shorts","Belt","Sidecut Dress", "Dress", "Tie", "Skirt", "Tilted Belt", "Bowtie","Sleeveless Turtle Neck","Sash","Kunai Holster","Boots","Cloak","Longcoat","Jump Jacket","Hoodie","Facemask","Female Longcoat","Kimono","Gloves","Long Sleeved Shirt","Pants","Backwards Scarf","T-shirt","Shoes","Vest","Cancel"))
							if(!Z) return
							switch(Z:name)
								if("Nothing")
									closeShop()
								if("Glasses")
									var/obj/A = new/obj/items/Clothing/Glasses
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Scarf")
									var/obj/A = new/obj/items/Clothing/Scarf
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Collared Robes")
									var/obj/A = new/obj/items/Clothing/Collared_Robes
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Straw Hat")
									var/obj/A = new/obj/items/Clothing/Straw_Hat
									usr.addShopItem(A,10)
									goto startClothes
								if("Hooded Cloak")
									var/obj/A = new/obj/items/Clothing/Hooded_Cloak
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Fancy Top")
									var/obj/A = new/obj/items/Clothing/Fancy_Top
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Towel (F)")
									var/obj/A = new/obj/items/Clothing/TowelF
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Towel (M)")
									var/obj/A = new/obj/items/Clothing/TowelM
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Contacts")
									var/obj/A = new/obj/items/Clothing/Contacts
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Collared Shirt")
									var/obj/A = new/obj/items/Clothing/Collared_Shirt
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Hood")
									var/obj/A = new/obj/items/Clothing/Hood
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes

								if("Sidecut Dress")
									var/obj/A = new/obj/items/Clothing/Sidecut_Dress
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Dress")
									var/obj/A = new/obj/items/Clothing/Dress
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes

								if("Tie")
									var/obj/A = new/obj/items/Clothing/Tie
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Tilted Belt")
									var/obj/A = new/obj/items/Clothing/Tilted_Belt
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Bowtie")
									var/obj/A = new/obj/items/Clothing/Bowtie
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Skirt")
									var/obj/A = new/obj/items/Clothing/Skirt
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Cloak")
									var/obj/A = new/obj/items/Clothing/Cloak
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Sleeveless Turtle Neck")
									var/obj/A = new/obj/items/Clothing/Sleeveturtle
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Hoodie")
									var/obj/A = new/obj/items/Clothing/Robe
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Jump Jacket")
									var/obj/A = new/obj/items/Clothing/Jacket
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Facemask")
									var/obj/A = new/obj/items/Clothing/Facemask
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Long Sleeved Shirt")
									var/obj/A = new/obj/items/Clothing/Long_Sleeved_Shirt
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Gloves")
									var/obj/A = new/obj/items/Clothing/Gloves
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Kunai Holster")
									var/obj/A = new/obj/items/Clothing/Holster
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Vest")
									var/obj/A = new/obj/items/Clothing/Vest
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Belt")
									var/obj/A = new/obj/items/Clothing/Belt
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Sash")
									var/obj/A = new/obj/items/Clothing/Slash
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Longcoat")
									var/obj/A = new/obj/items/Clothing/Coat
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								/*if("Swordsman Pants")
									var/obj/A = new/obj/items/Clothing/Swordsman_Pants
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes */
								if("Female Longcoat")
									var/obj/A = new/obj/items/Clothing/Female_Coat
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Kimono")
									var/obj/A = new/obj/items/Clothing/Kimono
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Pants")
									var/obj/A = new/obj/items/Clothing/Pants
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Backwards Scarf")
									var/obj/A = new/obj/items/Clothing/Backwards_Scarf
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("T-shirt")

									var/obj/A = new/obj/items/Clothing/Shirt
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Shoes")
									var/obj/A = new/obj/items/Clothing/Shoes
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Shorts")
									var/obj/A = new/obj/items/Clothing/Shorts
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Boots")
									var/obj/A = new/obj/items/Clothing/Boots
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
						if("Scrolls")
							var/O=usr.CustomInput("What would you like to buy?","Shopkeep",list("Empty Scroll (10 Ryo)","Weapon Scroll (200 Ryo)","Cancel"))
							if(!O) return
							switch(O:name)
								if("Empty Scroll (10 Ryo)")
									for(var/obj/items/Ryo/R in usr.contents)
										if(R.amount>=10)
											R.amount-=10
											R.Update()
											var/obj/A = new/obj/items/Scrolls/Scroll
											var/list/colors = usr.ColorInput("Please choose a color")
											A.icon += colors
											usr.contents+=A
											usr.closeShop()
											break
								/*if("Weapon Scroll (200 Ryo)")
									for(var/obj/items/Ryo/R in usr.contents)
										if(R.amount>=200)
											R.amount-=200
											R.Update()
											var/obj/A = new/obj/items/Scrolls/Weapon_Scroll
											var/list/colors = usr.ColorInput("Please choose a color")
											A.icon += colors
											usr.contents+=A
											usr.closeShop()
											break*/

	HoshiShopkeeper
		icon='HosBase_White.dmi'
		icon_state=""
		attackable=0
		New()
			spawn()src.AddHair()
			spawn()src.AddOverlays()
			..()
		Click()
			if(get_dist(src,usr)>2) return
			usr.barberShop = 0
			usr.skinCreate = 0
			var/X=usr.CustomInput("What can I help you with?","Shopkeep",list("Purchase","Sell","Nevermind"))
			if(!X) return
			switch(X:name)
				if("Nevermind")
					closeShop()
					return
				if("Sell")
					var/list/Items=list()
					for(var/obj/items/I in usr.contents)
						if(istype(I,/obj/items/Clothing/)&&!I:worn) Items["[I.name]"]=I
						if(istype(I,/obj/items/Weapon/Torch/)&&!I:worn) Items["[I.name]"]=I
						if(istype(I,/obj/items/Weapon/Pickaxe/)&&!I:worn) Items["[I.name]"]=I
						if(istype(I,/obj/items/Weapon/Fishing_Rod/)&&!I:worn) Items["[I.name]"]=I
						if(istype(I,/obj/items/Weapon/Axe/)&&!I:worn) Items["[I.name]"]=I
					if(!Items.len)
						usr<<output("<font size = -3>You have nothing of value!","outputic.output")
						usr<<output("<font size = -3>You have nothing of value!","outputall.output")
						return
					var/Choice=usr.CustomInput("What would you like to sell?","Shopkeep",Items)
					var/obj/items/O=Items["[Choice]"]
					if(!O) return
					if(istype(O,/obj/items/Clothing/))
						if(O:worn) return
						var/hasryo=0
						for(var/obj/items/Ryo/R in usr.contents)
							hasryo=R
						if(hasryo)
							hasryo:amount+=2
							hasryo:Update()
						else
							var/obj/items/Ryo/R=new(usr)
							R.amount=2
							R.Update()
						usr<<output("<font size = -3>The shopkeeper hands you 2 Ryo for this item.","outputic.output")
						usr<<output("<font size = -3>The shopkeeper hands you 2 Ryo for this item.","outputall.output")
						del(O)
						return
					if(istype(O,/obj/items/Weapon/Torch/))
						if(O:worn) return
						var/hasryo=0
						for(var/obj/items/Ryo/R in usr.contents)
							hasryo=R
						if(hasryo)
							hasryo:amount+=5
							hasryo:Update()
						else
							var/obj/items/Ryo/R=new(usr)
							R.amount=5
							R.Update()
						usr<<output("<font size = -3>The shopkeeper hands you 5 Ryo for this item.","outputic.output")
						usr<<output("<font size = -3>The shopkeeper hands you 5 Ryo for this item.","outputall.output")
						del(O)
						return
					if(istype(O,/obj/items/Weapon/Pickaxe/))
						if(O:worn) return
						var/hasryo=0
						for(var/obj/items/Ryo/R in usr.contents)
							hasryo=R
						if(hasryo)
							hasryo:amount+=75
							hasryo:Update()
						else
							var/obj/items/Ryo/R=new(usr)
							R.amount=75
							R.Update()
						usr<<output("<font size = -3>The shopkeeper hands you 75 Ryo for this item.","outputic.output")
						usr<<output("<font size = -3>The shopkeeper hands you 75 Ryo for this item.","outputall.output")
						del(O)
						return
					if(istype(O,/obj/items/Weapon/Axe/))
						if(O:worn) return
						var/hasryo=0
						for(var/obj/items/Ryo/R in usr.contents)
							hasryo=R
						if(hasryo)
							hasryo:amount+=75
							hasryo:Update()
						else
							var/obj/items/Ryo/R=new(usr)
							R.amount=75
							R.Update()
						usr<<output("<font size = -3>The shopkeeper hands you 75 Ryo for this item.","outputic.output")
						usr<<output("<font size = -3>The shopkeeper hands you 75 Ryo for this item.","outputall.output")
						del(O)
						return
					if(istype(O,/obj/items/Weapon/Fishing_Rod/))
						if(O:worn) return
						var/hasryo=0
						for(var/obj/items/Ryo/R in usr.contents)
							hasryo=R
						if(hasryo)
							hasryo:amount+=25
							hasryo:Update()
						else
							var/obj/items/Ryo/R=new(usr)
							R.amount=25
							R.Update()
						usr<<output("<font size = -3>The shopkeeper hands you 25 Ryo for this item.","outputic.output")
						usr<<output("<font size = -3>The shopkeeper hands you 25 Ryo for this item.","outputall.output")
						del(O)
						return
					if(istype(O,/obj/items/Food/Big_Fish/))
						if(O:worn) return
						var/hasryo=0
						for(var/obj/items/Ryo/R in usr.contents)
							hasryo=R
						if(hasryo)
							hasryo:amount+=1
							hasryo:Update()
						else
							var/obj/items/Ryo/R=new(usr)
							R.amount=1
							R.Update()
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputic.output")
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputall.output")
						del(O)
						return
					if(istype(O,/obj/items/Food/Big_Fish_Fry/))
						if(O:worn) return
						var/hasryo=0
						for(var/obj/items/Ryo/R in usr.contents)
							hasryo=R
						if(hasryo)
							hasryo:amount+=1
							hasryo:Update()
						else
							var/obj/items/Ryo/R=new(usr)
							R.amount=1
							R.Update()
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputic.output")
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputall.output")
						del(O)
						return
					if(istype(O,/obj/items/Food/Med_Fish/))
						if(O:worn) return
						var/hasryo=0
						for(var/obj/items/Ryo/R in usr.contents)
							hasryo=R
						if(hasryo)
							hasryo:amount+=1
							hasryo:Update()
						else
							var/obj/items/Ryo/R=new(usr)
							R.amount=1
							R.Update()
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputic.output")
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputall.output")
						del(O)
						return
					if(istype(O,/obj/items/Food/Med_Fish_Fry/))
						if(O:worn) return
						var/hasryo=0
						for(var/obj/items/Ryo/R in usr.contents)
							hasryo=R
						if(hasryo)
							hasryo:amount+=1
							hasryo:Update()
						else
							var/obj/items/Ryo/R=new(usr)
							R.amount=1
							R.Update()
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputic.output")
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputall.output")
						del(O)
						return
					if(istype(O,/obj/items/Food/Med_Fish2/))
						if(O:worn) return
						var/hasryo=0
						for(var/obj/items/Ryo/R in usr.contents)
							hasryo=R
						if(hasryo)
							hasryo:amount+=1
							hasryo:Update()
						else
							var/obj/items/Ryo/R=new(usr)
							R.amount=1
							R.Update()
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputic.output")
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputall.output")
						del(O)
						return
					if(istype(O,/obj/items/Food/Med_Fish2_Fry/))
						if(O:worn) return
						var/hasryo=0
						for(var/obj/items/Ryo/R in usr.contents)
							hasryo=R
						if(hasryo)
							hasryo:amount+=1
							hasryo:Update()
						else
							var/obj/items/Ryo/R=new(usr)
							R.amount=1
							R.Update()
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputic.output")
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputall.output")
						del(O)
						return
					if(istype(O,/obj/items/Food/Med_Fish3_Fry/))
						if(O:worn) return
						var/hasryo=0
						for(var/obj/items/Ryo/R in usr.contents)
							hasryo=R
						if(hasryo)
							hasryo:amount+=1
							hasryo:Update()
						else
							var/obj/items/Ryo/R=new(usr)
							R.amount=1
							R.Update()
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputic.output")
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputall.output")
						del(O)
						return
					if(istype(O,/obj/items/Food/Med_Fish3/))
						if(O:worn) return
						var/hasryo=0
						for(var/obj/items/Ryo/R in usr.contents)
							hasryo=R
						if(hasryo)
							hasryo:amount+=1
							hasryo:Update()
						else
							var/obj/items/Ryo/R=new(usr)
							R.amount=1
							R.Update()
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputic.output")
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputall.output")
						del(O)
						return
					if(istype(O,/obj/items/Food/Small_Fish/))
						if(O:worn) return
						var/hasryo=0
						for(var/obj/items/Ryo/R in usr.contents)
							hasryo=R
						if(hasryo)
							hasryo:amount+=1
							hasryo:Update()
						else
							var/obj/items/Ryo/R=new(usr)
							R.amount=1
							R.Update()
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputic.output")
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputall.output")
						del(O)
						return
					if(istype(O,/obj/items/Food/Small_Fish_Fry/))
						if(O:worn) return
						var/hasryo=0
						for(var/obj/items/Ryo/R in usr.contents)
							hasryo=R
						if(hasryo)
							hasryo:amount+=1
							hasryo:Update()
						else
							var/obj/items/Ryo/R=new(usr)
							R.amount=1
							R.Update()
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputic.output")
						usr<<output("<font size = -3>The shopkeeper hands you 1 Ryo for this item.","outputall.output")
						del(O)
						return
					usr<<output("<font size = -3>The shopkeeper doesn't seem to be interested in that.","outputic.output")
					usr<<output("<font size = -3>The shopkeeper doesn't seem to be interested in that.","outputall.output")
					return
				if("Purchase")
					var/I=usr.CustomInput("What would you like to see?","Shopkeep",list("Clothing","Scrolls","Misc","Furniture","Nothing"))
					if(!I) return
					switch(I:name)//obj/items/Weapon/Rope
						if("Nothing")
							closeShop()
							return
						if("Furniture")
							var/Z=usr.updateShopListing("What would you like to buy?","Shopkeep",list("Standup Lamp (250 Ryo)","Hanging Lamp (200 Ryo)","Chair (350 Ryo)","Phone (400 Ryo)","Couch (600 Ryo)","Television (1000 Ryo)","Nothing"))
							if(!Z) return
							switch(Z:name)
								if("Nothing")
									closeShop()
								if("Standup Lamp (250 Ryo)")
									for(var/obj/items/Ryo/R in usr.contents)
										if(R.amount>=250)
											R.amount-=250
											R.Update()
											var/obj/A = new/obj/build/Housing/Furniture/Lanterns/Inside
											usr.contents+=A
											usr.closeShop()
											break

								if("Hanging Lamp (200 Ryo)")
									for(var/obj/items/Ryo/R in usr.contents)
										if(R.amount>=200)
											R.amount-=200
											R.Update()
											var/obj/A = new/obj/build/Housing/Furniture/Lanterns/Hung
											usr.contents+=A
											usr.closeShop()
											break

								if("Chair (350 Ryo)")
									for(var/obj/items/Ryo/R in usr.contents)
										if(R.amount>=350)
											R.amount-=350
											R.Update()
											var/obj/A = new/obj/build/Housing/Furniture/Chair
											usr.contents+=A
											usr.closeShop()
											break
								if("Phone (400 Ryo)")
									for(var/obj/items/Ryo/R in usr.contents)
										if(R.amount>=400)
											R.amount-=400
											R.Update()
											var/obj/A = new/obj/build/Housing/Furniture/Phone
											usr.contents+=A
											usr.closeShop()
											break

								if("Couch (600 Ryo)")
									for(var/obj/items/Ryo/R in usr.contents)
										if(R.amount>=600)
											R.amount-=600
											R.Update()
											var/obj/A = new/obj/build/Housing/Furniture/Couch
											usr.contents+=A
											usr.closeShop()
											break
								if("Television (1000 Ryo)")
									for(var/obj/items/Ryo/R in usr.contents)
										if(R.amount>=1000)
											R.amount-=1000
											R.Update()
											var/obj/A = new/obj/build/Housing/Furniture/Television
											usr.contents+=A
											usr.closeShop()
											break
						if("Misc")
							startMisc:
							var/Z=usr.updateShopListing("What would you like to buy?","Shopkeep",list("Tent Kit (600 Ryo)","Tinderbox (100 Ryo)","Rope (20 Ryo)","Radio (350 Ryo)","Pickaxe (400 Ryo)","Axe (250 Ryo)","Torch (15 Ryo)","Fishing Rod (50 Ryo)","Back Pouch (60 Ryo)","Nothing"))
							if(!Z) return
							switch(Z:name)
								if("Nothing")
									closeShop()
								if("Rope (20 Ryo)")
									for(var/obj/items/Ryo/R in usr.contents)
										if(R.amount>=20)
											R.amount-=20
											R.Update()
											var/obj/A = new/obj/items/Weapon/Rope
											usr.contents+=A
											usr.closeShop()
											break
								if("Tent Kit (600 Ryo)")
									for(var/obj/items/Ryo/R in usr.contents)
										if(R.amount>=600)
											R.amount-=600
											R.Update()
											var/obj/A = new/obj/items/tentKit
											usr.contents+=A
											usr.closeShop()
											break
								if("Tinderbox (100 Ryo)")
									for(var/obj/items/Ryo/R in usr.contents)
										if(R.amount>=100)
											R.amount-=100
											R.Update()
											var/obj/A = new/obj/items/tinderbox
											usr.contents+=A
											usr.closeShop()
											break
								if("Radio (350 Ryo)")
									usr.addShopItem(new/obj/items/Clothing/Radio_Comm,350)
									goto startMisc
								if("Torch (15 Ryo)")
									usr.addShopItem(new/obj/items/Weapon/Torch,15)
									goto startMisc
								if("Pickaxe (400 Ryo)")
									usr.addShopItem(new/obj/items/Weapon/Pickaxe,400)
									goto startMisc
								if("Axe (250 Ryo)")
									usr.addShopItem(new/obj/items/Weapon/Axe,250)
									goto startMisc
								if("Fishing Rod (50 Ryo)")
									usr.addShopItem(new/obj/items/Weapon/Fishing_Rod,50)
									goto startMisc
								if("Back Pouch (60 Ryo)")
									usr.addShopItem(new/obj/items/Clothing/backpouch,60)
									goto startMisc
						if("Clothing")
							startClothes:
							var/Z=usr.updateShopListing("What would you like to buy? All clothes are 10 Ryo.","Shopkeep",list("Glasses","Scarf","Collared Robes","Straw Hat","Hooded Cloak","Fancy Top","Towel (F)","Towel (M)","Collared Shirt","Contacts","Hood","Shorts","Belt","Sidecut Dress", "Dress", "Tie", "Skirt", "Tilted Belt", "Bowtie","Sleeveless Turtle Neck","Sash","Kunai Holster","Boots","Cloak","Longcoat","Jump Jacket","Hoodie","Facemask","Female Longcoat","Kimono","Gloves","Long Sleeved Shirt","Pants","Backwards Scarf","T-shirt","Shoes","Vest","Cancel"))
							if(!Z) return
							switch(Z:name)
								if("Nothing")
									closeShop()
								if("Glasses")
									var/obj/A = new/obj/items/Clothing/Glasses
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Scarf")
									var/obj/A = new/obj/items/Clothing/Scarf
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Collared Robes")
									var/obj/A = new/obj/items/Clothing/Collared_Robes
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Straw Hat")
									var/obj/A = new/obj/items/Clothing/Straw_Hat
									usr.addShopItem(A,10)
									goto startClothes
								if("Hooded Cloak")
									var/obj/A = new/obj/items/Clothing/Hooded_Cloak
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Fancy Top")
									var/obj/A = new/obj/items/Clothing/Fancy_Top
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Towel (F)")
									var/obj/A = new/obj/items/Clothing/TowelF
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Towel (M)")
									var/obj/A = new/obj/items/Clothing/TowelM
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Contacts")
									var/obj/A = new/obj/items/Clothing/Contacts
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Collared Shirt")
									var/obj/A = new/obj/items/Clothing/Collared_Shirt
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Hood")
									var/obj/A = new/obj/items/Clothing/Hood
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes

								if("Sidecut Dress")
									var/obj/A = new/obj/items/Clothing/Sidecut_Dress
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Dress")
									var/obj/A = new/obj/items/Clothing/Dress
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes

								if("Tie")
									var/obj/A = new/obj/items/Clothing/Tie
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Tilted Belt")
									var/obj/A = new/obj/items/Clothing/Tilted_Belt
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Bowtie")
									var/obj/A = new/obj/items/Clothing/Bowtie
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Skirt")
									var/obj/A = new/obj/items/Clothing/Skirt
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Cloak")
									var/obj/A = new/obj/items/Clothing/Cloak
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Sleeveless Turtle Neck")
									var/obj/A = new/obj/items/Clothing/Sleeveturtle
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Hoodie")
									var/obj/A = new/obj/items/Clothing/Robe
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Jump Jacket")
									var/obj/A = new/obj/items/Clothing/Jacket
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Facemask")
									var/obj/A = new/obj/items/Clothing/Facemask
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Long Sleeved Shirt")
									var/obj/A = new/obj/items/Clothing/Long_Sleeved_Shirt
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Gloves")
									var/obj/A = new/obj/items/Clothing/Gloves
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Kunai Holster")
									var/obj/A = new/obj/items/Clothing/Holster
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Vest")
									var/obj/A = new/obj/items/Clothing/Vest
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Belt")
									var/obj/A = new/obj/items/Clothing/Belt
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Sash")
									var/obj/A = new/obj/items/Clothing/Slash
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Longcoat")
									var/obj/A = new/obj/items/Clothing/Coat
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Female Longcoat")
									var/obj/A = new/obj/items/Clothing/Female_Coat
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Kimono")
									var/obj/A = new/obj/items/Clothing/Kimono
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Pants")
									var/obj/A = new/obj/items/Clothing/Pants
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Backwards Scarf")
									var/obj/A = new/obj/items/Clothing/Backwards_Scarf
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("T-shirt")

									var/obj/A = new/obj/items/Clothing/Shirt
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Shoes")
									var/obj/A = new/obj/items/Clothing/Shoes
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Shorts")
									var/obj/A = new/obj/items/Clothing/Shorts
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
								if("Boots")
									var/obj/A = new/obj/items/Clothing/Boots
									var/list/colors = usr.ColorInput("Please choose a color")
									A.icon += colors
									usr.addShopItem(A,10)
									goto startClothes
						if("Scrolls")
							var/O=usr.CustomInput("What would you like to buy?","Shopkeep",list("Empty Scroll (10 Ryo)","Weapon Scroll (200 Ryo)","Cancel"))
							if(!O) return
							switch(O:name)
								if("Empty Scroll (10 Ryo)")
									for(var/obj/items/Ryo/R in usr.contents)
										if(R.amount>=10)
											R.amount-=10
											R.Update()
											var/obj/A = new/obj/items/Scrolls/Scroll
											var/list/colors = usr.ColorInput("Please choose a color")
											A.icon += colors
											usr.contents+=A
											usr.closeShop()
											break
								if("Weapon Scroll (200 Ryo)")
									for(var/obj/items/Ryo/R in usr.contents)
										if(R.amount>=200)
											R.amount-=200
											R.Update()
											var/obj/A = new/obj/items/Scrolls/Weapon_Scroll
											var/list/colors = usr.ColorInput("Please choose a color")
											A.icon += colors
											usr.contents+=A
											usr.closeShop()
											break

	Weapon_Supplier
		icon='Base_Pale.dmi'
		icon_state=""
		attackable=0
		var/Deactive=0
		New()
			spawn()src.AddHair()
			spawn()src.AddOverlays()
			..()
		Click()
			if(get_dist(src,usr)>2) return
			if(Deactive)
				usr<<output("<font size = -3>This shopkeeper is out of stock!","outputic.output")
				usr<<output("<font size = -3>This shopkeeper is out of stock!","outputall.output")
				return
			startMisc:
			var/I=usr.updateShopListing("What would you like to buy?","Shopkeep",list("Gunbai (25000 Ryo)","Claymore (20000 Ryo)","Naginata (14000 Ryo)","Zanbatou (15000 Ryo)","Kyodai Sensu (9500 Ryo)","Longsword (12000 Ryo)","Dagger (500 Ryo)","Armguard (6000 Ryo)","Back Shuriken (4000 Ryo)","Bo-staff (7000 Ryo)","Rapier (7500 Ryo)","Katana (8000 Ryo)","Wakizashi (3500 Ryo)","Kunai (15 Ryo)","Senbon (5 Ryo)","Shuriken (10 Ryo)","Explosive Tag (250 Ryo)",/*"Training Log",*/"Cancel"))
			if(!I) return
			switch(I:name)
				if("Cancel")
					usr.prompt.answer = "Cancel"
					usr.closeShop()
					return
				if("Kyodai Sensu (9500 Ryo)")
					usr.addShopItem(new/obj/items/Weapon/Kyodai_Sensu,9500)
					goto startMisc
				if("Armguard (6000 Ryo)")
					usr.addShopItem(new/obj/items/Clothing/Arm_Guard,6000)
					goto startMisc
				if("Dagger (500 Ryo)")
					usr.addShopItem(new/obj/items/Weapon/Dagger,500)
					goto startMisc
				if("Gunbai (25000 Ryo)")
					usr.addShopItem(new/obj/items/Weapon/Gunbai,25000)
					goto startMisc
				if("Naginata (14000 Ryo)")
					usr.addShopItem(new/obj/items/Weapon/Naginata,14000)
					goto startMisc
				if("Claymore (20000 Ryo)")
					usr.addShopItem(new/obj/items/Weapon/Claymore,20000)
					goto startMisc
				if("Zanbatou (15000 Ryo)")
					usr.addShopItem(new/obj/items/Weapon/Zanbatou,15000)
					goto startMisc
				if("Katana (8000 Ryo)")
					usr.addShopItem(new/obj/items/Weapon/Katana,8000)
					goto startMisc
				if("Longsword (12000 Ryo)")
					usr.addShopItem(new/obj/items/Weapon/Longsword,12000)
					goto startMisc
				if("Bo-staff (7000 Ryo)")
					usr.addShopItem(new/obj/items/Weapon/Bostaff,7000)
					goto startMisc
				if("Rapier (7500 Ryo)")
					usr.addShopItem(new/obj/items/Weapon/Rapier,7500)
					goto startMisc
				if("Wakizashi (3500 Ryo)")
					usr.addShopItem(new/obj/items/Weapon/Tanto,3500)
					goto startMisc
				if("Kunai (15 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=15)
							R.amount-=15
							R.Update()
							var/obj/A = new/obj/items/Weapon/Kunai
							usr.contents+=A
							usr.closeShop()
							break
						else
							usr << "Kunai's cost 15 Ryo!"
				if("Explosive Tag (250 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=250)
							R.amount-=250
							R.Update()
							var/obj/A = new/obj/items/Weapon/Explosive_Tag
							usr.contents+=A
							usr.closeShop()
							break
						else
							usr << "Explosive Tag's cost 250 Ryo!"
				/*if("Training Log")
					if(usr.Ryo>=250)
						usr.Ryo-=250
						var/obj/A = new/obj/items/Weapon/Log
						usr.contents+=A
					else
						usr << "Log's cost 250 Ryo!"*/

				if("Soldier Pill")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=50)
							R.amount-=50
							R.Update()
							var/obj/A = new/obj/items/Pills/Soldier_Pill
							usr.contents+=A
							usr.closeShop()
							break
						else
							usr << "Soldier Pill's cost 50 Ryo!"

				if("Senbon (5 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=5)
							R.amount-=5
							R.Update()
							var/obj/A = new/obj/items/Weapon/Senbon
							var/amount = input("How many would you like to purchase?\n(An extra 5 Ryo is required per Senbon)") as num
							var/decimal=num2text(amount)
							if(findtext(decimal,".",1,0)) return
							amount = amount*5
							if(amount<1)
								return
							if(amount<=R.amount)
								R.amount -= amount
								R.Update()
								amount = amount/5
								var/hasshuri=0
								for(var/obj/items/Weapon/Senbon/RR in usr.contents)
									hasshuri=RR
								if(hasshuri)
									hasshuri:senbon+=amount
									hasshuri:suffix = "You current have [hasshuri:senbon] in this stack"
									del(A)
									return
								A:senbon = amount
							usr.contents+=A
							A.suffix = "You current have [A:senbon] in this stack"
							usr.closeShop()
							break
						else
							usr << "Senbon's cost 5 Ryo!"

				if("Shuriken (10 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=10)
							R.amount-=10
							R.Update()
							var/obj/A = new/obj/items/Weapon/Shuriken
							var/amount = input("How many would you like to purchase?\n(An extra 5 Ryo is required per Shuriken)") as num
							var/decimal=num2text(amount)
							if(findtext(decimal,".",1,0)) return
							amount = amount*5
							if(amount<=0)
								return
							if(amount<=R.amount)
								R.amount -= amount
								R.Update()
								amount = amount/5
								var/hasshuri=0
								for(var/obj/items/Weapon/Shuriken/RR in usr.contents)
									hasshuri=RR
								if(hasshuri)
									hasshuri:shuriken+=amount
									hasshuri:suffix = "You current have [hasshuri:shuriken] in this stack"
									del(A)
									return
								A:shuriken = amount
							usr.contents+=A
							A.suffix = "You current have [A:shuriken] in this stack"
							usr.closeShop()
							break
						else
							usr << "Shuriken's cost 10 Ryo!"

				if("Back Shuriken (4000 Ryo)")
					usr.addShopItem(new/obj/items/Weapon/Giant_Shuriken,4000)
					goto startMisc

				if("Windmill (150 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=150)
							R.amount-=150
							R.Update()
							var/obj/A = new/obj/items/Weapon/Windmill
							usr.contents+=A
							usr.closeShop()
							break
						else
							usr << "Windmill's cost 150 Ryo!"


	Sunagakure_Smith
		icon='Base_Black.dmi'
		icon_state=""
		attackable=0
		var/Deactive=0
		New()
			spawn()src.AddHair()
			spawn()src.AddOverlays()
			..()
		Click()
			if(get_dist(src,usr)>2) return
			if(Deactive)
				usr<<output("<font size = -3>This shopkeeper is out of stock!","outputic.output")
				usr<<output("<font size = -3>This shopkeeper is out of stock!","outputall.output")
				return
			var/I=usr.CustomInput("What would you like to buy?","Shopkeep",list("Poison Bomb (50 Ryo)","Wakizashi (300 Ryo)","Kunai (15 Ryo)","Senbon (5 Ryo)","Shuriken (10 Ryo)","Explosive Tag(50 Ryo)","Windmill (150 Ryo)","Back Shuriken (200 Ryo)",/*"Training Log",*/"Cancel"))
			if(!I) return
			switch(I:name)
				if("Wakizashi (300 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=300)
							R.amount-=300
							R.Update()
							var/obj/A = new/obj/items/Weapon/Tanto
							usr.contents+=A
							break
						else
							usr << "Wakizashi's cost 300 Ryo!"
				if("Kunai (15 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=15)
							R.amount-=15
							R.Update()
							var/obj/A = new/obj/items/Weapon/Kunai
							usr.contents+=A
							break
						else
							usr << "Kunai's cost 15 Ryo!"
				if("Explosive Tag (50 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=50)
							R.amount-=50
							R.Update()
							var/obj/A = new/obj/items/Weapon/Explosive_Tag
							usr.contents+=A
							break
						else
							usr << "Explosive Tag's cost 50 Ryo!"
				/*if("Training Log")
					if(usr.Ryo>=250)
						usr.Ryo-=250
						var/obj/A = new/obj/items/Weapon/Log
						usr.contents+=A
					else
						usr << "Log's cost 250 Ryo!"*/

				if("Poison Bomb (50 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=50)
							R.amount-=50
							R.Update()
							var/obj/A = new/obj/items/Weapon/Poison_Bomb
							usr.contents+=A
							break
						else
							usr << "Poison bomb's cost 50 Ryo!"

				if("Senbon (5 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=5)
							R.amount-=5
							R.Update()
							var/obj/A = new/obj/items/Weapon/Senbon
							var/amount = input("How many would you like to purchase?\n(An extra 5 Ryo is required per Senbon)") as num
							var/decimal=num2text(amount)
							if(findtext(decimal,".",1,0)) return
							amount = amount*5
							if(amount<1)
								return
							if(amount<=R.amount)
								R.amount -= amount
								R.Update()
								amount = amount/5
								var/hasshuri=0
								for(var/obj/items/Weapon/Senbon/RR in usr.contents)
									hasshuri=RR
								if(hasshuri)
									hasshuri:senbon+=amount
									hasshuri:suffix = "You current have [hasshuri:senbon] in this stack"
									del(A)
									return
								A:senbon = amount
							usr.contents+=A
							A.suffix = "You current have [A:senbon] in this stack"
							break
						else
							usr << "Senbon's cost 5 Ryo!"

				if("Shuriken (10 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=10)
							R.amount-=10
							R.Update()
							var/obj/A = new/obj/items/Weapon/Shuriken
							var/amount = input("How many would you like to purchase?\n(An extra 5 Ryo is required per Shuriken)") as num
							var/decimal=num2text(amount)
							if(findtext(decimal,".",1,0)) return
							amount = amount*5
							if(amount<=0)
								return
							if(amount<=R.amount)
								R.amount -= amount
								R.Update()
								amount = amount/5
								var/hasshuri=0
								for(var/obj/items/Weapon/Shuriken/RR in usr.contents)
									hasshuri=RR
								if(hasshuri)
									hasshuri:shuriken+=amount
									hasshuri:suffix = "You current have [hasshuri:shuriken] in this stack"
									del(A)
									return
								A:shuriken = amount
							usr.contents+=A
							A.suffix = "You current have [A:shuriken] in this stack"
							break
						else
							usr << "Shuriken's cost 10 Ryo!"

				if("Back Shuriken (200 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=200)
							R.amount-=200
							R.Update()
							var/obj/A = new/obj/items/Weapon/Giant_Shuriken
							usr.contents+=A
							break
						else
							usr << "Back Shuriken's cost 200 Ryo!"

				if("Windmill (150 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=150)
							R.amount-=150
							R.Update()
							var/obj/A = new/obj/items/Weapon/Windmill
							usr.contents+=A
							break
						else
							usr << "Windmill's cost 150 Ryo!"

	Flower_Seller
		icon='Base_Pale.dmi'
		icon_state=""
		attackable=0
		New()
			spawn()src.AddHair()
			spawn()src.AddOverlays()
			..()
		Click()
			if(get_dist(src,usr)>2) return
			switch(input("What would you like to buy?") in list ("Natsu_Top","Bra","Natsu _Bottoms", "Eye_Wrap"))
				if("Natsu_Top")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=30)
							R.amount-=30
							R.Update()
							var/obj/A = new/obj/items/Clothing/Natsu_Top
							usr.contents+=A
							break
				if("Natsu_Bottoms")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=30)
							R.amount-=30
							R.Update()
							var/obj/A = new/obj/items/Clothing/Natsu_Bottoms
							usr.contents+=A
							break
				if("Eye_Wrap")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=10)
							R.amount-=10
							R.Update()
							var/obj/A = new/obj/items/Clothing/Eye_Wrap
							usr.contents+=A
							break
				if("Bra")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=10)
							R.amount-=10
							R.Update()
							var/obj/A = new/obj/items/Clothing/Bra
							A.icon += input("Please choose a color") as color
							usr.contents+=A
							break

	Farmer_Market_Vendor
		icon='Base_Pale.dmi'
		icon_state=""
		attackable=0
		name="Farmer Market Vendor"
		New()
			spawn()src.AddHair()
			spawn()src.AddOverlays()
			..()
		Click()
			if(get_dist(src,usr)>2) return
			switch(input("What would you like to buy?") in list ("Hoe (150 Ryo)","Pruners (150 Ryo)","Watering Can (150 Ryo)","Cotton Seeds (20 Ryo)","Root Seeds (20 Ryo)","Turnip Seeds (1 Ryo)","Tomato Seeds (1 Ryo)","Carrot Seeds (1 Ryo)","Cabbage Seeds (1 Ryo)","Cancel"))
				if("Cotton Seeds (20 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=20)
							R.amount-=20
							R.Update()
							var/obj/A = new/obj/items/Farming/Plants/Seeds/Cotton_Seeds
							usr.contents+=A
							break
						else
							usr << "Cotton seeds cost 20 Ryo!"
				if("Root Seeds (20 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=20)
							R.amount-=20
							R.Update()
							var/obj/A = new/obj/items/Farming/Plants/Seeds/Root_Seeds
							usr.contents+=A
							break
						else
							usr << "Root seeds cost 20 Ryo!"
				if("Turnip Seeds (1 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=1)
							R.amount-=1
							R.Update()
							var/obj/A = new/obj/items/Farming/Plants/Seeds/Turnip_Seeds
							usr.contents+=A
							break
						else
							usr << "Turnips seeds cost 1 Ryo!"
				if("Carrot Seeds (1 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=1)
							R.amount-=1
							R.Update()
							var/obj/A = new/obj/items/Farming/Plants/Seeds/Carrot_Seeds
							usr.contents+=A
							break
						else
							usr << "Carrots seeds cost 1 Ryo!"
				if("Cabbage Seeds (1 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=1)
							R.amount-=1
							R.Update()
							var/obj/A = new/obj/items/Farming/Plants/Seeds/Cabbage_Seeds
							usr.contents+=A
							break
						else
							usr << "Cabbage seeds cost 1 Ryo!"
				if("Tomato Seeds (1 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=1)
							R.amount-=1
							R.Update()
							var/obj/A = new/obj/items/Farming/Plants/Seeds/Tomato_Seeds
							usr.contents+=A
							break
						else
							usr << "Tomato seeds cost 1 Ryo!"
				if("Hoe (150 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=150)
							R.amount-=150
							R.Update()
							var/obj/A = new/obj/items/Weapon/Farming/Tools/Hoe
							usr.contents+=A
							break
						else
							usr << "A hoe costs 150 Ryo!"
				if("Pruners (150 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=150)
							R.amount-=150
							R.Update()
							var/obj/A = new/obj/items/Weapon/Farming/Tools/Pruners
							usr.contents+=A
							break
						else
							usr << "Pruners costs 150 Ryo!"
				if("Watering Can (150 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=150)
							R.amount-=150
							R.Update()
							var/obj/A = new/obj/items/Weapon/Farming/Tools/Watering_Can
							usr.contents+=A
							break
						else
							usr << "Watering Can costs 150 Ryo!"



	Konohagakure_Event_Vendor
		icon='Base_Pale.dmi'
		icon_state=""
		attackable=0
		name="Chef"
		New()
			spawn()src.AddHair()
			spawn()src.AddOverlays()
			..()
		Click()
			if(get_dist(src,usr)>2) return
			switch(input("Happy Chunin Accouncement Festival Day!! Haha. . *Awkward Silence* Would you like some Steak?") in list ("Konohagakure's Finest Steak! (15 Ryo)","Cancel"))
				if("Konohagakure's Finest Steak! (15 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=15)
							R.amount-=15
							R.Update()
							var/obj/A = new/obj/items/Food/Konoha_steak
							usr.contents+=A
							break
						else
							usr << "Konohagakure's Finest Steak cost 15 Ryo!"



	Ramen_Chef
		icon='Base_Pale.dmi'
		icon_state=""
		attackable=0
		name="Chef"
		New()
			spawn()src.AddHair()
			spawn()src.AddOverlays()
			..()
		Click()
			if(get_dist(src,usr)>2) return
			switch(input("What would you like to buy?") in list ("Ramen (10 Ryo)","Vegetable Ramen (15 Ryo)","Miso Ramen (30 Ryo)","Turnip (8 Ryo)","Tomato (8 Ryo)","Water (8 Ryo)","Noodle Package (8 Ryo)","Carrot (8 Ryo)","Cabbage (8 Ryo)","Milk (10 Ryo)","Celery (5 Ryo)","Apple (5 Ryo)","Egg (5 Ryo)","Orange (5 Ryo)","Apple Juice (12 Ryo)","Orange Juice (12 Ryo)","Beer (20 Ryo)","Shishcabob (23 Ryo)","Cancel"))


			//"Milk (10 Ryo)","Celery (5 Ryo)","Apple (5 Ryo)","Egg (5 Ryo)"
			//"Orange (5 Ryo)","Apple Juice (12 Ryo)","Orange Juice (12 Ryo)","Beer (20 Ryo)","Shishcabob (23 Ryo)
				if("Shishcabob (23 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=23)
							R.amount-=23
							R.Update()
							var/obj/A = new/obj/items/Food/Shishcabob
							usr.contents+=A
							break
						else
							usr << "Shishcabob costs 23 Ryo!"
				if("Beer (20 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=20)
							R.amount-=20
							R.Update()
							var/obj/A = new/obj/items/Food/Beer
							usr.contents+=A
							break
						else
							usr << "Beer costs 20 Ryo!"
				if("Orange Juice (12 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=12)
							R.amount-=12
							R.Update()
							var/obj/A = new/obj/items/Food/Orange_Juice
							usr.contents+=A
							break
						else
							usr << "Orange Juice costs 12 Ryo!"
				if("Apple Juice (12 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=12)
							R.amount-=12
							R.Update()
							var/obj/A = new/obj/items/Food/Apple_Juice
							usr.contents+=A
							break
						else
							usr << "Apple Juice costs 12 Ryo!"
				if("Orange (5 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=5)
							R.amount-=5
							R.Update()
							var/obj/A = new/obj/items/Food/Orange
							usr.contents+=A
							break
						else
							usr << "Oranges costs 5 Ryo!"
				if("Egg (5 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=5)
							R.amount-=5
							R.Update()
							var/obj/A = new/obj/items/Food/Egg
							usr.contents+=A
							break
						else
							usr << "Eggs costs 5 Ryo!"
				if("Apple (5 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=5)
							R.amount-=5
							R.Update()
							var/obj/A = new/obj/items/Food/Apple
							usr.contents+=A
							break
						else
							usr << "Apples costs 5 Ryo!"
				if("Celery (5 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=5)
							R.amount-=5
							R.Update()
							var/obj/A = new/obj/items/Food/Celery
							usr.contents+=A
							break
						else
							usr << "Celery costs 5 Ryo!"
				if("Milk (10 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=10)
							R.amount-=10
							R.Update()
							var/obj/A = new/obj/items/Food/Milk
							usr.contents+=A
							break
						else
							usr << "Milk costs 10 Ryo!"
				if("Ramen (10 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=10)
							R.amount-=10
							R.Update()
							var/obj/A = new/obj/items/Food/Ramen
							usr.contents+=A
							break
						else
							usr << "Ramens cost 10 Ryo!"
				if("Vegetable Ramen (15 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=15)
							R.amount-=15
							R.Update()
							var/obj/A = new/obj/items/Food/Vegetable_Ramen
							usr.contents+=A
							break
						else
							usr << "Vegetable Ramen's cost 15 Ryo!"
				if("Miso Ramen (30 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=30)
							R.amount-=30
							R.Update()
							var/obj/A = new/obj/items/Food/Miso_Ramen
							usr.contents+=A
							break
						else
							usr << "Miso Ramens cost 30 Ryo!"
				if("Turnip (8 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=8)
							R.amount-=8
							R.Update()
							var/obj/A = new/obj/items/Food/Turnip
							usr.contents+=A
							break
						else
							usr << "Turnips cost 8 Ryo!"
				if("Carrot (8 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=8)
							R.amount-=8
							R.Update()
							var/obj/A = new/obj/items/Food/Carrot
							usr.contents+=A
							break
						else
							usr << "Carrots cost 8 Ryo!"
				if("Cabbage (8 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=8)
							R.amount-=8
							R.Update()
							var/obj/A = new/obj/items/Food/Cabbage
							usr.contents+=A
							break
						else
							usr << "Cabbage cost 8 Ryo!"
				if("Tomato (8 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=8)
							R.amount-=8
							R.Update()
							var/obj/A = new/obj/items/Food/Tomato
							usr.contents+=A
							break
						else
							usr << "Tomato cost 8 Ryo!"
				if("Water (8 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=8)
							R.amount-=8
							R.Update()
							var/obj/A = new/obj/items/Food/Water
							usr.contents+=A
							break
						else
							usr << "Waters cost 8 Ryo!"
				if("Noodle Package (8 Ryo)")
					for(var/obj/items/Ryo/R in usr.contents)
						if(R.amount>=8)
							R.amount-=8
							R.Update()
							var/obj/A = new/obj/items/Food/Noodles
							usr.contents+=A
							break
						else
							usr << "Noodle Packages cost 8 Ryo!"



	Tea_Shop_Owner
		icon='NPCs.dmi'
		icon_state="Tea"
		attackable=0

	Newsman
		icon='Base_Pale.dmi'
		icon_state=""
		attackable=0
		New()
			spawn()src.AddHair()
			spawn()src.AddOverlays()
			..()
		Click()
			if(get_dist(src,usr)>2) return
			usr<<output("<font size = -3>Take a newspaper if you'd like, they're free. We cover all the happenings in the world!","outputic.output")
			usr<<output("<font size = -3>Take a newspaper if you'd like, they're free. We cover all the happenings in the world!","outputall.output")

	Barber
		icon='Base_Pale.dmi'
		icon_state=""
		attackable=0
		New()
			spawn()src.AddHair()
			spawn()src.AddOverlays()
			..()
		Click()
			if(get_dist(src,usr)>2) return
			usr.create_appearance()

	HoshiBarber
		icon='HosBase_White.dmi'
		icon_state=""
		attackable=0
		New()
			spawn()src.AddHair()
			spawn()src.AddOverlays()
			..()
		Click()
			if(get_dist(src,usr)>2) return
			usr.create_appearance()






















