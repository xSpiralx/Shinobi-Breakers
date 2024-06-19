
mob/proc/Training()
	var/helptext = {"
		<html>
		<STYLE>BODY {font-family: Verdana}</STYLE>
		<head>
		<title>Training</title>
		</head>
		<body bgcolor=black text=red>
		<center><h2>Training</h2></center><hr>
		<p><font size=3> Cliff Climbing:</font><br>
		Health & Physical Stats
		<p>Water Walking:<br>
		Chakra & Chakra Stats
		<p>Sparring:<br>
		Stamina & Physical Stats & Taijutsu
		<p>Using Jutsu:<br>
		Chakra & Chakra Stats & Jutsu's Type Stats.

		<p>
		<br>
		</body>
		</html>
		"}
	src << browse(helptext)

var/Rules={"<head><center><title>Rules</title></center></head><body>
<center><body bgcolor="#000000"><font size=6><font color="red"><b>
<u>Shinobi Saga</u></center></font>
<font size = 4><font color ="black"><MARQUEE BEHAVIOR="alternate" bgcolor="white">The Rules</MARQUEE></font>
<font color=purple><ul><font size=2>
<li>When creating a character please use your imagination when making your characters name, and avoid using propular anime and celeb names.</li>
<li>When playing please refrain from doing actions without first roleplaying thing, for example do not steal someones helmet they have dropped without roleplaying it first.</li>
<li>When roleplaying please try your best not to add into the roleplay the outcome of the fight. That is judged by the games mechanics and the other players reactions. Though this rule applies to everything else that may not work - for example do not roleplay using Kawarimi no Jutsu to escape and then find out you have no chakra so you wait a few minutes to regain enough chakra, instead roleplay not having enough chakra and then let the roleplay continue.</li>
<li>Do not continiously try to jump onto center stage, you are not the center of this game and it does no revolve around you, give other characters a chance to play aswell.</li>
</ul>
</body><html>"}

var/WritingRules=0
mob/verb/Rules()
	set hidden=1
	src<<browse(Rules,"window=Rules;size=500x350")

proc/SaveRules()
	var/savefile/S=new("Rules")
	S["Rulesline"]<<Rules
proc/LoadRules() if(fexists("Rules"))
	var/savefile/S=new("Rules")
	S["Rulesline"]>>Rules

mob/verb/Jutsu_Ranks()
	set hidden=1
	src<<browse(JutsuRanks,"window=Jutsu Ranks;size=500x350")
var/JutsuRanks={"<html><head><body bgcolor="#000000"><center><title>Jutsus</title></center></head>
<center>RPs Based on Rank</center>
Depending on the circumstance you could learn in one, or as many as twenty.
<center><font size=4>Jutsu list</center><br><br>
<font color="orange"><font size=3><center>Katon<br><br>
<font size=2>Katon Bunshin - C-rank<br>
Katon: Goukakyuu - C-rank<br>
Katon: Housenka - C-rank<br>
Katon: Endan - B-rank<br>
Katon: Dragon fire - B-rank<br>
Katon: Dai endan - A-rank<br><br>
<br><br>
<font color="cerulean"><font size=3><center>Suiton<br><br>
<font size=2> Mizubunshin - C-rank<br>
Suirou - C-rank<br>
Suiryuudan - C-rank<br>
Diabakufu - B-rank<br>
Baku Suishouha - A-rank<br>
Suijinheki - B-rank<br><br>
<br><br>
<font size=3><font color="robin"><center>Raiton<br><br>
<font size=2>Raiton Bunshin - C-rank<br>
Jibashi - C-rank<br>
Raikyuu - C-rank<br>
Ikazuchi - B-rank<br>
Ikadzuchi no kiba - B-rank<br>
Chidori - A-rank<br>
Raiton no yoroi - A-rank<br>
Chidori senbon - A-rank<br><br>
<center><font size=3><font color="Brown"><center>Doton<br><br>
<font size=2>Tsuchi Bunshin - D-rank<br>
Doryuuheki - C-rank<br>
Doryuudan - B-rank<br>
Domu - B-rank<br>
Yomi Numa - A-rank<br><br>
<center><font size=3><font color="light green">Fuuton<br><br>
<font size=2>Kaze - D-rank<br>
Kazekiri - C-rank<br>
Renkuudan - C-rank<br>
Reppushou - C-rank<br>
Kaze no Yaiba - A-rank<br><br>
<center><font size=3><font color="pink">Medical<br><br>
Shosen - C-rank<br>
Chakra no mesu - B-rank<br>
Oukashou - C-rank<br>
Saikan Chuusutsu - C-rank<br>
Shometsu - B-rank<br><br>
<center><font size=3><font color="gold">Sand Manipulator exclusive</center><br><br>
<font size=2>Tanukeneiri no jutsu(eye) - D-rank<br>
Suna no Yoroi - C-rank<br>
Suna no Mayu - D-rank<br>
Litmin Kyuu - C-rank<br>
Litmin Sousou - B-rank<br><br>
<center><font size=3><font color="gray">Ninjutsu(non-elemental)</center><br><br>
<font size=2>Kage bunshin - A-rank(Scroll only)<br>
Bunshin - E-rank<br>
Kawarimi - E-rank<br>
Henge - E-rank<br>
Hakai no Uda - A-rank<br>
Toogame no jutsu - Kage exclusive<br>
Sushin - D-rank (scout exclusive)Mbr>
Rasengan - A-rank<br>
Kagura Shingen - B-rank(scout exclusive)<br>
Kibaku Nendo - C-rank (clay exclusive)<br><br>
<center><font size=3><font color="green">Taijutsu</center><br><br>
<font size=2>Dynamic Entry - D-rank<br>
Hachimon Tomon - D-rank<br>
Hachimon Shoumon - C-rank<br>
Hachimon Kaiman - C-rank<br>
Hachimon Seimon - B-rank<br>
Hachimon Kyuumon - A-rank<br>
<br><center><font size=3><font color="white">Genjutsu</center><br><br>
<font size=2>Shikumi no jutsu - C-rank (Other . . . "special" requirements)<br>
Jabaku Satsu - A-rank<br>
Nehan Shoja - B-rank<br>
Kokaungyo - C-rank<br>
Kori Shinchuu - C-rank<br>
Kai - D-rank<br>
Toton - B-rank<br><br>
<center><font size=3><font color="purple">Uchiha</center><br><br>
<font size=2> Sharingan 1 - Special requirements<br>
Sharingan 2 - Special requirements<br>
Sharingan 3 - Special requirements<br><br>
<center><font size=3>Aburame</center><br><br>
<font size=2>Kikaichuu no jutsu - D-rank<br>
Mushi Yose no jutsu - C-rank<br>
Mushi Dama - B-rank<br><br>
<center><font size=3>Inuzuka</center><br><br>
<font size=2>Shikyaku no jutsu - D-rank<br>
Gatsuuga - B-rank<br><br>
<center><font size=3>Hozuki</center><br><br>
<font size=2>>Suika - D-rank<br>
Gousuiwan no jutsu - C-rank<br>
Water propell Jet - B-rank<br>
Suigadan - C-rank<br><br>
<center><font size=3>Kaguya</center><br><br><font size=2>
Tessenka no Mai - D-rank<br>
Yanagi no Mai - C-rank<br>
Tessenka no Mai Hana - B-rank<br>
KAramatsu no Mai - B-rank<br>
Swarabi no Mai - A-rank<br><br>
<font size=3><center>Akimichi</center><br><br><font size=2>
Ninkudan Sensha - D-rank<br>
Choudan Bakugeki - B-rank<br>
Babun Baika no Jutsu - C-rank<br><br>
<font size=3><center>Hyoumon</center><br><br><font size=2>
Gravity eyes - D-rank<br>
Gravity Bunshin - C-rank<br>
Gravity Distortion - B-rank<br><br>
<font size=3><center>Hyuuga</center><br><br><font size=2>
Byakugan - E-rank<br>
Jyuuken - C-rank<br><br>
<hr><center><font size=4><font color="blue"> Chronicle store</center><br><br>
<font size=2>
Weights - 5 yen per lb<br>
Zanbatou - 2000 yen<br>
Kyodai Sensu - 1750 yen<br>
Umbrella - 1500 yen<br>
Cross blade - 900 yen<br>
Polearm - 1000 yen<br>
"Samurai" Sword - 1500 yen<br>
"Demon Brother" Gaunlet - 3000 yen<br>
Bow-Sword - 3000 yen<br>
Warglaive - 2000 yen<br>
Chained Blades - 2250 yen
Water Gourd - 600 yen<br><br><br>
Medical suit - 45 yen<br>
Medical hat - 15 yen<br>
Long (Aburame) Jacket - 45 yen<br>
"Port" Hat - 35 yen<br>
Arm Cloth - 15 yen<br>
"Bahamut" Garb - 35 yen<br>
Chest Bandage - 10 yen<br>
Chest patch - 15 yen<br>
"Chuck Norris" Hat - 25 yen<br>
Back scrolls(Serve no ic purpose) - 25 yen<br>
Back shield - 250 yen<br>
Flowing Cloak - 35 yen<br>
"Idiot" Jacket - 45 yen<br>
"Rein" Uniform - 40 yen<br>
"Demon Brother" Clothes - 35 yen<br>
"Demon Brother" Cloak - 40 yen<br?
"Demon Brother" Headband - 10 yen(+your regular headband)<br>
"Dosu" Poncho - 25 yen<br>
"Edward Elric" shirt - 20 yen<br>
Eye Wrap - 10 yen<br>
Face wrappings - 20 yen<br>
"Hood Shin" Coat - 35 yen<br>
Axe Guitar - 300 yen<br>
Blindfold - 5 yen<br>
Hand wraps - 20 yen<br>
"Hijikata" Robes - 45 yen<br>
"Natsu" top - 25 yen<br>
"Natsu" Bottom - 35<br>
Cosplay Wings - 100 yen<br>
Rib Wrappings - 15 yen<br>
"Sham" Cloak - 35 yen<br>
Tilted Headband - Free (Trade in regular headband)<br>
"SinX" shirt (Comes in dark Variant) - 20 yen<br>
"Ningetsu" Jacket - 40 yen<br>
"Kurapika" Robe - 35 yen<br>
Gas Mask - 50 yen<br>"}

var/Storyline={"
<style type="text/css">
# { border: hidden;
background-color: transparent; }
body {background-color: #FFFFFF;}
body
{
background-repeat:no-repeat;
background-position:left bottom;
margin-leftt:200px;
}
a:active, a:visited, a:link { text-decoration: none; font: 10pt
Calibri; color: #000000; border: px solid #000000; margin
-bottom: 0px; margin-left: 0px; width: 0px; letter-spacing:
3px;
padding-left: 3px; padding-right: 3px; }

a:hover { text-decoration: none; font: 10pt Calibri;
color: #000000;; border: px solid #000000;; margin-bottom: 1px;
margin-left: 1px; width: 1px;  letter-spacing: 1px; padding-
left: 1px; }
</style>
<center><font size="5"><font color=black>Naruto Journey's</font></font></center>
<center>
<html>
<a href="#one">Prologue|</a>
<a href="#two">I|</a>
<a href="#three">II|</a>
<a href="#four">III</a>
</center>
<center>
<font face="Calibri"><font size="2"><font color=000000>
<div style="width: 550px; height: 650px; overflow-y: hidden;">
<a name="one"></a>
<div style="width: 550px; height: 650px; overflow: auto;">
<font face="Calibri"><font size="2"><font color=000000>
<hr>
<center><font size=5> Title (Prologue) </font></center>
<hr>
<center>Paragraph 1</center>
<center>Paragraph 2</center>
<center>Paragraph 3</center>
</div>

<div style="width: 550px; height: 650px; overflow-y: hidden;">
<a name="two"></a>
<div style="width: 550px; height: 650px; overflow: auto;">
<font face="Calibri"><font size="2"><font color=000000>
<hr>
<center><font size=5> Title (I) </font></center>
<hr>
<center>Paragraph 1</center>
<center>Paragraph 2</center>
<center>Paragraph 3</center>
</div>

<div style="width: 550px; height: 650px; overflow-y: hidden;">
<a name="three"></a>
<div style="width: 550px; height: 650px; overflow: auto;">
<font face="Calibri"><font size="2"><font color=000000>
<hr>
<center><font size=5> Title (II) </font></center>
<hr>
<center>Paragraph 1</center>
<center>Paragraph 2</center>
<center>Paragraph 3</center>
</div>


<div style="width: 550px; height: 650px; overflow-y: hidden;">
<a name="four"></a>
<div style="width: 550px; height: 650px; overflow: auto;">
<font face="Calibri"><font size="2"><font color=000000>
<hr>
<center><font size=5> Title (III) </font></center>
<hr>
<center>Paragraph 1</center>
<center>Paragraph 2</center>
<center>Paragraph 3</center>
</div>

"}

mob/verb/Storyline()
	set hidden=1
	LoadStory()
	src<<browse(Storyline,"window=Chronicle;size=500x350")



var/Notepad
var/Perkslist
var/WritingNotepad=0
//mob/verb/Notepad()
//	usr<<browse(Notepad,"window=Notepad;size=500x350")
proc/SaveNotepad()
proc/LoadNotepad()
	if(fexists("Notepad.sav"))
		var/savefile/F = new("Notepad.sav")
		F["Notepad"]>> Notepad
proc/LoadPerkslist()
	if(fexists("Perkssave.sav"))
		var/savefile/F = new("Perkssave.sav")
		F["Perkssave"]>> Perkslist
/* THIS HAS BEEN UPDATED IN PROFILE.DM under SOTO
mob/var
	profile={"<html>
<head><center><title>Character Profile</title></center></head>
<body><body bgcolor=#303A47 text=#FFFDCB>
This character has not setup their profile.
</body>
"}   */


proc/SaveStory()
	var/savefile/S=new("Storyline.txt")
	S["Storyline.txt"]<<Storyline
proc/LoadStory() if(fexists("Storyline.txt"))
	var/savefile/S=new("Storyline.txt")
	S["Storyline.txt"]>>Storyline
/*
mob/var/Height="Undefined"
mob/var/Weight="Undefined" */
mob/DblClick()
	if(!src.client&&!istype(src,/mob/Clone/)&&(!istype(src,/mob/Bunshin/)&&!istype(src,/mob/RaitonBunshin/)&&!istype(src,/mob/OboroBunshin/)&&!istype(src,/mob/KatonBunshin/)&&!istype(src,/mob/KageBunshin/)&&!istype(src,/mob/TsuchiBunshin/))) return

	winset(usr,"Profile","is-visible=true")
	winshow(usr,"Profile.afk",0)
	winshow(usr,"Profile.afktime",0)
	usr<<output(null,"Profile.AgeOut")
	usr<<output(null,"Profile.BloodOut")
	usr<<output(null,"Profile.WeightOut")
	usr<<output(null,"Profile.HeightOut")
	usr<<output(null,"Profile.StatOutput")
	usr<<output("[src.Age]","Profile.AgeOut")
	if(src.bloodtype=="?")
		usr<<output(null,"Profile.AgeOut")
		usr<<output("[src.Age-rand(1,3)] - [src.Age+rand(1,3)]","Profile.AgeOut")
	usr<<output("[src.bloodtype]","Profile.BloodOut")
	usr<<output("[src.Weight]","Profile.WeightOut")
	usr<<output("[src.Height]","Profile.HeightOut")
	usr<<browse(src.profile,"window=Profile.ProfileBrowse")//"window=[src];size=500x350")
	var/ReturnValues={"<font size=-4>[Injuries]

"}
	var/ReturnValues2={"<br><br><font size=-4>This person has a [Headbands] headband on.
"}
	var/ReturnValues3={"<br><br><font size=-4>Injuries:<br>[NewInjury]

"}
	usr<<output("[ReturnValues]","Profile.StatOutput")
	if(afk||autoafk)
		usr<<output(null,"Profile.afktime")
		usr<<output("[returnTime(afktime)]","Profile.afktime")
		winshow(usr,"Profile.afk",1)
		winshow(usr,"Profile.afktime",1)
	if(NewInjury)
		usr << output("[ReturnValues3]","Profile.StatOutput")
	if(Headbands)
		usr<<output("[ReturnValues2]","Profile.StatOutput")



mob/var/Injuries="This person has not setup a description."
mob/proc/returnTime(number)
	var/times = (world.timeofday - number)/10
	return "[times/3600>=1 ? "[round(times/3600)]h: " : ""][((times/60)%60)>=1 ? "[round((times/60)%60)]m: " : ""][round(times%60)]s"

mob/proc/ReturnStrength(orignum,comparenum)
	if(!isnum(orignum)) return
	if(!isnum(comparenum)) return
	var/num=(orignum/comparenum)*100
	if(!isnum(num)) return
	if(num>180) return "You are supremely stronger"
	if(num<=180&&num>150) return "You are vastly stronger"
	if(num<=150&&num>130) return "You are far stronger"
	if(num<=130&&num>110) return "You are much stronger"
	if(num<=110&&num>90) return "You are equal in strength"
	if(num<=90&&num>70) return "They are much stronger"
	if(num<=70&&num>50) return "They are far stronger"
	if(num<=50&&num>20) return "They are vastly stronger"
	if(num<=20) return "They are supremely stronger"
	return "Error Calculating"
mob/proc/ReturnNimble(orignum,comparenum)
	if(!isnum(orignum)) return
	if(!isnum(comparenum)) return
	var/num=(orignum/comparenum)*100
	if(!isnum(num)) return
	if(num>180) return "You are supremely more nimble"
	if(num<=180&&num>150) return "You are vastly more nimble"
	if(num<=150&&num>130) return "You are far more nimble"
	if(num<=130&&num>110) return "You are much more nimble"
	if(num<=110&&num>90) return "You are equal in your footing"
	if(num<=90&&num>70) return "They are much more nimble"
	if(num<=70&&num>50) return "They are far more nimble"
	if(num<=50&&num>20) return "They are vastly more nimble"
	if(num<=20) return "They are supremely more nimble"
	return "Error Calculating"
mob/proc/ReturnRes(orignum,comparenum)
	if(!isnum(orignum)) return
	if(!isnum(comparenum)) return
	var/num=(orignum/comparenum)*100
	if(!isnum(num)) return
	if(num>180) return "You are supremely tougher"
	if(num<=180&&num>150) return "You are vastly tougher"
	if(num<=150&&num>130) return "You are far tougher"
	if(num<=130&&num>110) return "You are much tougher"
	if(num<=110&&num>90) return "You are equal in toughness"
	if(num<=90&&num>70) return "They are much tougher"
	if(num<=70&&num>50) return "They are far tougher"
	if(num<=50&&num>20) return "They are vastly tougher"
	if(num<=20) return "They are supremely tougher"
	return "Error Calculating"