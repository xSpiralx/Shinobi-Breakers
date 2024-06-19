mob/verb
	CombatGuide()
		set hidden = 1
		winshow(usr,"Guides",1)
	StatGuide()
		set hidden = 1
		src << output(null,"Guides.guideoutput")
		src<<output("[archive.statguide]","Guides.guideoutput")
	ShonenGuide()
		set hidden = 1
		src << output(null,"Guides.guideoutput")
		src<<output("[archive.shonenguide]","Guides.guideoutput")
	FlyingGuide()
		set hidden = 1
		src << output(null,"Guides.guideoutput")
		src<<output("[archive.flyingguide]","Guides.guideoutput")
	SiegeGuide()
		set hidden = 1
		src << output(null,"Guides.guideoutput")
		src<<output("[archive.siegeguide]","Guides.guideoutput")
	GenjutsuGuide()
		set hidden = 1
		src << output(null,"Guides.guideoutput")
		src<<output("[archive.genjutsuguide]","Guides.guideoutput")
	ProgressGuide()
		set hidden = 1
		src << output(null,"Guides.guideoutput")
		src<<output("[archive.progressguide]","Guides.guideoutput")
	DRGuide()
		set hidden = 1
		src << output(null,"Guides.guideoutput")
		src<<output("[archive.drguide]","Guides.guideoutput")
	TalentGuide()
		set hidden = 1
		src << output(null,"Guides.guideoutput")
		src<<output("[archive.talentguide]","Guides.guideoutput")
	NinjutsuGuide()
		set hidden = 1
		src << output(null,"Guides.guideoutput")
		src<<output("[archive.ninjutsuguide]","Guides.guideoutput")
	MedicalGuide()
		set hidden = 1
		src << output(null,"Guides.guideoutput")
		src<<output("[archive.medicalguide]","Guides.guideoutput")
	HandsealGuide()
		set hidden = 1
		src << output(null,"Guides.guideoutput")
		src<<output("[archive.handsealguide]","Guides.guideoutput")
	ProjectileGuide()
		set hidden = 1
		src << output(null,"Guides.guideoutput")
		src<<output("[archive.projectileguide]","Guides.guideoutput")
	DamageGuide()
		set hidden = 1
		src << output(null,"Guides.guideoutput")
		src<<output("[archive.damageguide]","Guides.guideoutput")
/archive

	var/statguide = {"
<center><font face=cambria color=color>
<Title>Stats</Title>
<br><br>
<br><b>Strength</b> - This is your characters body strength, it applies to techniques that state 'User's Strength' and basic punches and kicks.  verb 'strength' to show strength.<br>
<br><b>Endurance</b> - This is the vitality of your body.  Your health bar increases with this stat, as well as being able to withstand more damage.  verb 'endurance' to show endurance.<br>
<br><b>Agility</b> - This state is broken off into two sections 'Striking Agility' - is when you are performing CQC or Tai/Ken/Nintai techniques.  | 'Reactive Agility' - is what lets you dodge hits in close quarters, It also allows for mitigation of techniques not used as an AOE.  verb' agility' for showing agility.
<br><b>Speed</b> - Your characters overall body speed.  It increases tile-movements and allows for mitigation on AOE's so long as you make it out of the techniques tile range.  verb 'Speed' to see speed, verb 'tile-movements' shows sprinting, evading and walking tiles.
<br><b>Reserves</b> - This is what makes up your stamina bar.  To access your stamina bar, you goto combat and use 'deduct-stamina, restore-stamina' verbs when your techniques say to drain.  It also adds on to Chakra.  verb 'stamina' to show stamina.
<br><b>Control</b>- This is what makes your jutsu damage and jutsu speed increase.  Used for Nintai, Ninjutsu and any other chakra related technique.  verb 'Control' for showing control.
<br><b>Chakra</b> - Made up from Stamina and Control.  verb 'Chakra' to see chakra.
<br><br><b><U>Stat Caps:</U></B> As you gain more progress points, the maximum amount of points you can invest in any one area is raised. Below is a list of letter ranks, and how many overall points are needed in order to achieve these checkpoints.
<br>
D:   42 PP<br>
D+: 57 PP<br>
C-:  81 PP<br>
C:   96 PP<br>
C+: 111 PP<br>
B-:  129 PP<br>
B:   147 PP<br>
B+: 168 PP<br>
A-:  192 PP<br>
A:   219 PP <br>
A+: 252 PP<br>
S-:  297 PP<br>
S:   330 PP<br
"}
	var/projectileguide = {"
<Center><font face=cambria color=black><Title>Projectile Guide</Title>
<br><br>
All situations of combat involving weaponry should follow this guide. When using weaponry in combat the <b>Damage</b> and <B>Speed</B>  of said weapon is different depending on each weapon. Usually however, these are decided by either the users <B>Strength</b> or <b>Agility</b>.  Example Weapons:
<B><U>Shuriken</B></U>
<Br>
Damage: (Users Agility(Cap D]))<br>
Tile-Range: 5<br>
Speed: (Users Agility)<br>
<B><U>Kunai</B></U><br>
Damage: (Users Strength(Cap D+))<br>
Tile-Range: 5<br>
Speed: (Users Strenght)<br><br>

<b>Flashing Weaponry</b><br>
Flashing weaponry makes things a lot easier to calculate in combat. When the user flashes their choice of weapon it will display the Damage as well as the Speed of that weapon. This is used by the target to determine how to react to the oncoming attack.
<br><br>
<b>Dodging Projectiles</b><br>
When reacting to projectiles its typically in numbers, making the risk of injury especially dangerous. Reacting to these attacks is made easy, however it is slightly different then then the usual dodging method. As listed below, this is how all reactive situations should be handled:
<br><br>
<br>If users<b> Speed/Agility</b> is<b> Two Steps Higher(D -> C-) </B>then <b>Weapon Speed</b> then target<b> Dodges.</b>
<br>If users <b>Speed/Agility</b> is<b> One Step Higher(D -> D+) </b>then<b> Weapon Speed</b> then target <b>takes -2 Steps of Damage.</b>
<br>If users <b>Speed/Agility</b> is<b> equal to Weapon Speed</b> then target <b>takes -1 Steps of Damage.</b>
<br>If users <b>Speed/Agility</b> is <b>One Step Below(D -> E+)</b>incoming <b>Weapon Speed </b>then target takes <b>Full Damages</b>
<br><br>
<b>Multiple Projectiles:</b> When dealing with multiple incoming projectile at a time, each 	individual projectile typically acts as a additional step of damage after the first. If your 	opponent throws multiple weapons at you, you take the maximum amount of damage 	after stacking and use the dodging calculator to then mitigate from that number.
<br>	<b>Note: Projectiles can be countered with attacks with equal speed.</b>
<Br><br>
<b>General Weapon Rulings
No more then 3 SMALL projectile are to be thrown per turn. (With the exception of modifying perks.)<br>
No more then 1 LARGE projectile are to be thrown per turn. (With the exception of modifying perks.)<br>
Ranged projectile cannot be used to stop the usage of handseals.</b>
"}
	var/medicalguide = {"
		<center><Big><B><font face=cambria color=black>Shosen</big></b><br><font face=cambria color=black>
		With Shosen, you are not, under any circumstance, permitted to use Shosen to fully heal anything beyond minor injuries in one sitting. Shosen is a jutsu that amplifies the healing process of an injury; it does not heal it entirely. It doesn't cleanse wounds, it doesn't nullify poison, and it certainly doesn't heal broken bones. It can and will cut back the time it takes for injuries to heal. For those times, let's view the list below.<br><br>
		<center><Big><B><font face=cambria color=black>Shosen Limitations</big></b><font face=cambria color=black>
		Minor injuries WITHOUT Shosen: 2 OOC days.<br>
		Minor injuries WITH Shosen: One sitting.<br>
		Moderate injuries WITHOUT Shosen: Around 5 OOC days.<br>
		Moderate injuries WITH Shosen: Around 3 OOC days.<br>
		Severe injuries WITHOUT Shosen: Around 1 OOC week.<br>
		Severe injuries WITH Shosen: Around 5 OOC days.<br><br>
		Anyone found not adhering to and treating their injuries properly will be punished, and whilst you can fight with injuries with enough pain tolerance, you will risk obtaining a permanent wound by the end of it depending on the situation. With that aside, however, let's move on to the final two parts of this guide.<br>
		<center><Big><B><font face=cambria color=black>Bleeding out and Map Changes.</big></b><br><font face=cambria color=black>
		So, a lot of the time, if you obtain a serious injury you obtain it outside of the village. Realistically, even on map change is miles upon miles upon miles upon miles on foot. Hours away from your homeland; far too away to have moderate or severe injury without bleeding out from it (if it's an open wound). For moderate injuries, we allow 2 map changes before the player is knocked unconscious from blood loss, and three map changes before said player dies. For severe injuries, we allow 1 map change before the player is knocked unconscious from their injury, and 2 before they die from their loss of blood. This emphasizes the need for medics, and enforces consequence to those who travel without being fully prepared, first. If we find out that you map switched over your limit with a moderate or severe wound and with no medical attention, then we will enforce punishment for it without hesitation.<br><br>
		<center><Big><B><font face=cambria color=black>Surgery Rolls and Limb Replacement</big></b><br><font face=cambria color=black>
		And last but not least, surgery rolls and limbs! With tier two medic, you can attempt a surgery on an individual, but your odds for success will be very, very low. (Must roll D1-D6 on a D10 for success,  D7-10 is a failure). With tier three medic, your roll chances are greatly increased. (D1-8 on a D10 is a success, D9-D10 is a failure). With that being said, however, you must first GM-Help before writing your success/failure RP for a surgery, so that we can see your roll before you write out your IC conclusion to the operation. Any failure to do so will result in a failed operation, should we find out about it. This applies to limb reattaching as well. To attach a limb to an individual, you must have at least T2 medic, and should you be using an actual human (player char) body part as the replacement, it can be no older than 2 OOC days to be an eligible replacement.<br><br>
		<center><Big><B><font face=cambria color=black>Surgery in the Field</big></b><br><font face=cambria color=black>
		Performing surgery on the battlefield isn't an easy feat. Not only is the risk for mistakes, interruption, and infection higher; but you'll be ultimately lacking all of the necessary equipment and gear one might need for a safe and smooth surgery. This will drastically lower your chances for success on the field (D7+ on a D10 is a success, anything below D7 is a failure), and present the risk that the patient being operated on might even obtain a more severe injury from the attempt. Should the medic have the Improv Surgeon perk, however, then they'll be permitted the ability to perform surgery on the field with the only slightly less chances of success than an average surgeon in a hospital would. (D5+ on a D10 is a success, D4 or below is a failure.)<br><br>
		<center><Big><B><font face=cambria color=black>NPC Nurses</big></b><br><font face=cambria color=black>
		Last but not least, we have our whole 'interactive world vs. NPCs doing everything' debate. One of the most frequent arguments that occurs when there are NPC medics around is that they suck potential roleplay out of the world by doing things themselves, and that they make being a medic kind of a moot profession. However, being the only or one of the few medics in a village can be extremely overwhelming at times. You can't be online twenty-four seven, and it's not particularly fair for people to die just because you had to sleep OOCly, or had to attend class or have a real life. Plus, is it entirely realistic for there to be a hospital but no nurses or anything walking around within it? Nope. Because of this, we're going to allow NPC nurses to do the bear minimum of what is needed to stabilize injuries that don't need immediate attention. So, for example, if you had a cut gushing with blood, an NPC nurse would be able to clean it and wrap it up. Not stitch it, not doing anything advanced; but slow the blood flow and get it ready for a more advanced medic to take over.
		<br><br>
		Use the GM-Help verb to call forth one of these nurses. If none come to you, then you may RP it yourself so long as you stay within these guidelines. However, if we catch you doing so without GMHelping first, then it will more than likely result in your injury getting ruled worse.
	"}
	var/damageguide = {"
	<html>
	<head>
	<Center><Font Color=Black face=Cambria>
	<title>Health Guide</title>
	</head>
	<body><Center><Font Color=Black face=Cambria><b><U>Damage Guide</b></u>
	<br><br>Have you always struggled with calculating how much damage you or your opponent would take during combat? Say no more, as this is the guide that will teach you everything you need to know. Firstly, most techiques and strikes will cause the target to take damage. This in turn requires said target to deduct from their <b>Health Bar</B>.<br><br>Damage can be mitigated through evasion, which is where Agility and Speed come into play:<br><Br>

	Speed or Agility Two Steps or higher then attack speed can be Dodged.<br><Br>

	Speed or Agility One Step Higher then attack speed equates to -1 Grade Damage<br><Br>

	Speed or Agility Equal to the attack speed equates -2 Steps Damage<br><Br>

	Speed or Agility One Step below the attack speed equates to -1 Steps of damage<br><Br>

	Speed or Agility Two Steps below the attack speed equates to Full Damage.<br><Br>

	This excludes jutsu that bind/hold one in place such as but not limited to Shadow bind, Sand Coffin, Earth dome, and many others. Jutsu of this nature only require you have higher speed and the needed movement tiles to escape the jutsu radius if it has one. When dodging you move at your dodge tiles for said turn, so if I'm attempting to dodge a jutsu and outrun an AOE I calculate this with my dodge tiles NOT my sprint tiles. <br><Br>
	<B><U>The Health Bar</B></U>
	<br><br>Your Health bar is the represented by the topmost red bar in your character hub. When taking damage you can either <b>Deduct or Add</b> more health, by clicking the <b>(-) or (+)</b> buttons adjacent to the bar. After clicking these you will be prompted to drain accordingly to the damage of the incoming technique. The <b>Overall Amount of Health</b> you have is determined by your <b>Endurance</b> Stat.
	<br><img src="https://i.imgur.com/zOXwM1l.png"><Br><br><B><u>Injuries</b></u><br><br><b>Severe injuries such as: Breaking/Severing limbs, Removing Eyes etc.aren't inflictable until you or your opponent is below 20% Health.</b> This is to discourage players from trying to mortally wound individuals at the start of conflicts and to also encourage injuries oppossed to killing. Its always better to let some live opposed to outright killing them.<b>All other Injuries of moderate and below will not result in debuffs.<br><br>When a major injury is inflicted, the resulting debuffs of said injury can be decided between players or by admin decision.  GM-Help for assistance and wait for reviewal.</b>

	</body>
	"}




	var/flyingguide = {"
	<Font Face= Cambria Color=Black>
	<html>
	<head>
	<Center>
	<title>Flying Guide</title>
	</head>
	<body><Center><Font Color=Black>
	<br><br>We all been there...bullshit flying gets the better of us. Well this is to help limit that and not make it as OP as some people make it sound like. No one wants to lose just cause they are unable to fly as well.
	<br><br>
	There two ways to fly, by a technique, or if you summon a creature that enables you to fly with them. The speed of the flight depends on the speed of the technique or the summons movement speed.
	<br><br>
	Speed of the technique will be affected by how far up in the air you are. I don't want to hear no gravity bullshit, it works both ways.
	<br><br>
	If you are falling from the sky then you will descend five tiles a turn until you land on the ground.
	Falling 8-12 tiles is Light Damage, 13-17 is Moderate damage, 18+ is Heavy Damage.
	<br><br>
	If this still doesn't make sense then you are more than welcome to PM your GM!
	<br>

	</body>
	"}


	var/shonenguide = {"
	<Font Face= Cambria Color=Black>
	<html>
	<head>
	<Center>
	<title>Shonen Roll Guide</title>
	</head>
	<body><Center><Font Color=Black>
	<br><br>This is where the guide for Shonen rolls will be WIP.
	<br><br>
	WIP 1
	<br><br>
	WIP 2
	<br><br>
	WIP 3
	<br><br>
	If this still doesn't make sense then you are more than welcome to PM your GM!
	<br>

	</body>
	"}

	var/siegeguide = {"

	<html>
	<head>
	<title>Siege Guide</title>
	</head>
	<body>

	Alright, lets make this simple and clear. There are some few do's and don'ts when raiding another faction/village. No one wants that random 20 man army coming to them while they already made plans that day and are unable to protect the place they worked so damn hard to build.




	You are able to raid any faction/village at anytime if you have no more than FOUR people. If you are trying to attack a place and want more people to join your forces than please make a forum post about it in at least 24 hours in advance.

	No one likes random 10 man armies coming towards their village without knowing.

	Also...for the love of god if you are raiding go through the front gates first. Do not just try to sneak through the back place where no one is there cause no one has time to do that. If you want to raid, go through the front of the gates.

	Logging into Combat: If you were away and log into an attack that was on your faction than you have to wait FOUR turns before entering the fight.

	Same Map?: If you were on the same map, but were not there for the intial start of the battle then you must wait THREE turns before entering the fight.

	Entering Combat From Another Map: If you cross one map then reach the battle then you must wait six turns before entering the battle. If you cross two maps then reach the battle then you must wait ten turns before entering the battle. If you cross more than two maps then you are not able to enter the battle or start another battle once that one is over.

	Coming back From AFK, but your character was there: If you character was in the battle, but you were not there or you had to go do something IRL, we all have those emergencies sometimes. Then you only need to wait one turn before entering the battle.

	If another situation arises that I did not list then you may GMHelp for ruling or DM anyone on discord. Hopes this clears most of this stuff up!

	</body>
	"}



	var/genjutsuguide = {"
<center><Big><body><center><font face=cambria color=black>
<title>Genjutsu Guide</title>
<body><center><font face=cambria color=black>
<br>
What is Genjutsu?
<br><br><br>

Genjutsu (??, Literally meaning: Illusionary Techniques) is one of the main jutsu categories which uses chakra. Unlike ninjutsu, the effects of genjutsu are not real, being only illusions experienced by those who fall victim to it. According to the Second Mizukage, genjutsu falls under the broad category of Yin Release.
<br><br>
How do you counter Genjutsu?
<br><br>
There are two main ways of battling against Genjutsu.  The first is Genjutsu Kai, this is where the ninja stops the flow of the chakra flow and then applying an even stronger power to disrupt the flow of the genjutsu user's chakra. The other way is to apply pain to the user that is getting affected by the jutsu, not from the jutsu itself.
<br><br>
Genjutsu Scaling Based On Their Grade
<br><br>
D-Rank Genjutsu: The user will experience very small changes from their environments, such as hearing something that does not exist.
<br><br>
C-Rank Genjutsu: The opponent will experience some tricks to their minds. This genjutsu will travel deeper into the opponents mind. The pain isn't devasting, but enough to numb the user. They will believe something that looks real, like Itachi's crow substitution technique.
<br><br>
B-Rank Genjutsu: The user is able to create great changes towards the opponents mind. The pain is more realistic, almost as if it was real. Some people are unable to move, others has pain throughout their bodies. This is all still damage mentally, and does not perform any physical damage.
<br><br>
A-Rank Genjutsu: This is a devastating level of Genjutsu. They are able to perform technique throughout multiple people. They do not feel like illusion anymore and can actually damages ones physical body. They are able to take away senses from their opponents, stun their opponents, and even leave with opponent unconscious.
<br><br>
S-Rank Genjutsu: This is a legendary level of Genjutsu. This is a very rare level where most individual are not able to reach. There is no limit in what this person is able to do. The effects are very real.
<br><br>
Once a Genjutsu is broken, the opponent is unable to be trapped once again. This is only temporary though. Breaking out of a jutsu in terms of inflicting pain to oneself, the damage cause by the opponent must be equal to the power of the jutsu.
<br><br>
Damage:<br>
D-Rank Damage: Very light damage, like a slap to the face, or any type of physical damage.<br>
C-Rank Damage: Moderate damage such as a broken finger, or stabbing onesself.<br>
B-Rank Damage: Heavy damage, like a breaking a bone, or serious burns.<br>
A-Rank Damage: Damage so great that is causes one to be the brink of death.<br>
S-Rank Damage: Good Game.<br>
<br>
Most people will try to overplay Genjutsu, but do not let that happen. A person only specializing in genjutsu should also pick up another spec since it's hard to get into the late game genjutsu. Do not solelyrely on it.
	</body>
	"}

	var/drguide = {"
	<style>
	html, body { margin:0px; padding:0px; }

	#profile {
	border: hidden;
	background-color: transparent; }

	body {
	font-family:"Calibri";
	font-size:13px;
	color:white;
	background-image:url('loginbackground.png');
	background-attachment:fixed;
	background-position:center;
	}

	h2{
	font-family: "Palatino Linotype";
	}
	   .more {
	      display: none;
	      border-top: 1px solid #666;
	      border-bottom: 1px solid #666; }
	   a.showLink, a.hideLink {
	      text-decoration: none;
	      color: #36f;
	      padding-left: 8px;
	      background: transparent url(down.gif) no-repeat left; }
	   a.hideLink {
	      background: transparent url(up.gif) no-repeat left; }
	   a.showLink:hover, a.hideLink:hover {
	      border-bottom: 1px dotted #36f; }
	</style>

	<html>
	<head>
	<title>Death Reward Guide</title>
	</head>
	<body>

	After many up's and down's it seems like your long journey has finally came to an end. You worked your way up through the ranks of your village and were one step away from becoming the Kage. Everyone looked up to you in the village and your name spread throughout the entire Shinobi world. Through all your experience of fighting, you made some friends and lost some. It wasn't a perfect life, but you made most of it.

	All of a sudden, the village is attacked by a Tailed-Beast, and no one knows how to get rid of it...but only you. You have been working on a secret technique to seal up any Tailed-Beast...the only cost is the user's life. The village is panicking as you face fear right in the face. Your younger brother is clinging onto you, not knowing what else it could do. All you can do crouch down and pat his head while giving a big ol' smile. You hand him a scroll of all your techniques you have created in the past and your jounin vest for him to remember you by. He looks confused as you head off towards the beast. A flash of light occurs throughout the village as the beast is no longer there. Instead, your lifeless body on the ground.

	Rest In Peace.




	But all is not lost! This is not the end of your naruto role-playing adventure. You will begin your adventure as a different character, you will have no previous knowledge of your last character. This is a clean-state, you have zero connection to your last character. So don't be that guy to go get his revenge when you have no reason to do so...cough..cough...meta-gamers. Don't be that guy or else...

	This is "Death Rewards", don't think you will lose everything when you die. You will only get stronger my friend! By determining all the actions you have done in the past will take into consideration of your reward.

	Some examples are..

	What are some accomplishments you have completed?
	How long have you been playing?
	How did you die?
	How important was your character?
	And so on...

	You can request some uniques and we will either approve or decline it. If you are a character that just sat around and did nothing then of course you won't be getting a tailed-beast. Or get more PP back by going non-clan. The choice is your. Just send a list of five things you want as your DR then us the GM will approve one of them. The list may include, locked clans, perks, KKG, abilities, or so on...

	If you request a Special DR you will retain 70% of your PP back.
	Special DR includes things like KKG or Jinchuuriki.

	If you request a locked clan or a special perk as your DR you will retain 80% of your PP back

	If you request just going non-clan you will get 90% of your PP back.



	THIS IS A PRIVILEGE! Do not spam us if you do not like the reward. We are all civilize human-beings, if you feel like you should of got something better then just message us and we can talk it out. The most important thing is to make sure everyone is happy and getting fair things if they deserve it.
	Don't be that guy throwing a hissy-fit in the chat.

	ENJOY THE RP AND DON'T BE AFRAID TO DIE!</body>
	"}

	var/ninjutsuguide = {"
<center><font face=cambria color=black>

<Title>Clashing Guide</Title>
<br><BR>
When Clashing Ninjutsu there is much to consider; The elemental expertisy of each combatant, the damage of both jutsu at play, and the element affinities of both techniques.
<br><BR>
<b>Damage</b>  - If a technique with no elemental advantage clashes with another technique and they have equal power then they both cancel each other out. Common sense & logic apply, if you have six Housenka coming towards you, they cannot all be stopped with one teppodama bullet.
<br><BR>
If two techniques clash and one has more power than the other, the weaker of the two jutsu loses out (EX: C+ technique will defeat a C damage technique). <b>Unless the technique is one entire grade of power above the losing technique it will suffer -2 steps to damage after the clash</b>. If it is <b>two steps of power above</b> the losing technique the debuff is lowered to -1 step.
<br><BR>
<b>Speed</b>  - Hand seal speed does not have anything to do with the speed jutsu are cast. This means that your jutsu will not travel towards an opponent faster simply because your seals were completed first. In order to counter a jutsu with a jutsu the speed of said technique needs to be within two steps of the technique your attempting to intercept.
<br><BR>
<b>What does that mean? </b>It means you cannot shoot a B speed wind blast at a A speed lightning bolt, but you could if the Wind blast was B+ speed.  <b>Note:</b> You and your opponent must have equal handseal speed, if with in 3 tiles in order to clash.
<br><BR>
<b>Proficiency</b> - Every element and KKG has a proficiency associated with the skill. Justu will gain one step of power for every proficiency the caster has above the proficiency their opponent has for the technique they're countering with. If you use a Daitoppa with Fuuton Expert  and your opponent uses a Daitoppa at Fuuton initiate, your own Daitoppa immediately gains +2 steps of power towards the jutsu clash itself. This does not affect the damage it does to your opponent once it hits, this is solely for the clashing part of the encounter.
<br><BR>
<b>Elemental Advantages</b>  - If you go up against an element that counters your element, +2 Steps of damage is added to the superior element. A C power Katon technique becomes B- power when going against any Fuuton techniques.
<br><BR>
<b>Jutsu Empowering</b> - Techniques can also be empowered the same way if the element allows it, so you're able to do such a thing with a partner or dual caster. Empowered techniques gain +2 step of damage to the stronger of the two techniques. D rank techniques can't be empowered or used to empower other techniques.
<br><BR>
</body>
	"}

	var/dodgeguide = {"
	<Center><font face=cambria color=black>
	<title>Dodge Guide</title>
	</head>
	<body>



	(Projectile, Jutsu and AOE's)



	Speed or Agility Two Steps or higher then attack speed can be Dodged.

	Speed or Agility One Step Higher then attack speed equates to -1 Grade Damage

	Speed or Agility Equal to the attack speed equates -2 Steps Damage

	Speed or Agility One Step below the attack speed equates to -1 Steps of damage

	Speed or Agility Two Steps below the attack speed equates to Full Damage.

	--------------------------------
	This excludes jutsu that bind/hold one in place such as but not limited to Shadow bind, Sand Coffin, Earth dome, and many others. Jutsu of this nature only require you have higher speed and the needed movement tiles to escape the jutsu radius if it has one. When dodging you move at your dodge tiles for said turn, so if I'm attempting to dodge a jutsu and outrun an AOE I calculate this with my dodge tiles NOT my sprint tiles.

	Range modifiers:

	1-3 tiles = +1 Step to Jutsu speed

	4-5 tiles = No change in speed

	6-8 tiles = -1 step to jutsu speed

	Each 2 tiles distance further is -1 steps, so 10 tiles is -2 steps to jutsu speed.

	(This is strictly for dodging purposes not jutsu clashes)


	Injury Guide




	Light Injury
	Light Injuries are an everyday encounter in the life of the shinobi. This can stem from small bruises, 1st and 2nd-degree burns, to even lesser cuts. Most of these type of injuries will go unnoticed in the fray of combat. Easily brushed off for the most part, the pain usually falling short to adrenaline in the heat of the moment.

	Moderate Damage
	Moderate damage is no doubt a wound or pain that needs to be acknowledged during Roleplay. Moderate damage can be fractures, serious burns to the point one has permanent scars, or even deep wounds that aren't exactly life threatening.

	Heavy Damage
	Heavy damage is very severe damage. Heavy damage normally poses a risk of death but this isn't always 100% accurate. Heavy damage can be severed limbs, broken bones, punctured organs, and number other serious situations. This however does not exactly mean you will die from your injuries, in most cases you can push through heavy damage but will likely need some type of medical treatment.

	Debuffs
	Debuffs are stat-modifiers applied AFTER a fight, once conflict has subsided. This is inflicted through the usage of the Give Injury verb. These debuffs typically result in stat deductions or some type of handicap that the injured combatant will have to deal with until his injury is healed.  Be reasonable when inflicting debuffs, and keep it realistic. If need be GM-HELP for an admin but only as a last resort. If you can, try to sort out injuries civically.


	Endurance Threshold

	Endurance One Grade and one step or more = Ineffective
	Endurance One Grade Higher = Light Injury
	Endurance Two Step Higher = Light Injury
	Endurance One Step Higher = Light Injury
	Endurance Equal with Damage = Light Injury
	Endurance One step Below = Moderate Injury
	Endurance Two Steps Below = Moderate Injury
	Endurance One grade below = Two Moderate Injuries
	Endurance One Grade & One step Below = Heavy Injury
	Endurance One Grade & Two Steps Below = Heavy Injury
	Endurance Two Grades Below Damage = Lethal



	Damage Consumption

	Two Instances of Light Injuries equate to a Moderate Injury

	Three Instances of Moderate Injuries equate to a Heavy Injury.

	Two Instances of Heavy Injuries will make a combatant incapable of continuing combat.

	"}


	var/handsealguide = {"
<center><font face=cambria color=black>
<title>Handseal Guide</title>
<br><br>

Handseal Speed<br>

Handseal Rookie - D speed (Able to perform 6 seals per turn.)<br>
Handseal Expert - C speed (Able to perform 10 seals per turn.)<br>
Handseal Elite - B speed (Able to perform 22 seals per turn.)<br>
Handseal Master - A speed (Able to perform 34 seals per turn.)<br>
Note: Seals are indistinguishable without the use of Doujutsu.<br>
Handseal Sage - S speed (Able to perform 46 seals per turn.)<br>
Note: Seals are indistinguishable, even through the use of  Doujutsu.<br>
<br>
Handseal speed scales with each perk you have, the default speed is 4 per turn without any perks.<br><br>
<B><U>Handseal Speed Modifiers</u></B><br><br>
Handseal speed is increased by a one grade if using between 1-3 handseals.<br>
Handseal Speed is is unaffected if using between 4-6 handseals.<br>
Handseal Speed is decreased by one grade if using 7 or more handseals.<br><br>
One to three hand seals increase your hand seal speed by one grade and nine or more seals decreases it by one grade<br><br>
<br>
<b><U>Interrupting Handseals</B></u>
In order to interrupt someone's hand seals you need to be within 3 tiles of them and have striking speed equal to or higher than their hand seal speed<br>
You cannot interrupt handseals with techniques and/or projectiles, only a direct strike is capable of stopping seals unless stated otherwise.
<br><br>
"}

	var/talentguide = {"

	<html>
	<head>
	<Center><Font Color=Black face=Cambria>
	<title>Talent Guide</title>
	</head>
	<body><Center><Font Color=Black face=Cambria><b><U>Different Talents</b></u>
	<br><br>At birth, each shinobi is born with a talent. Most shinobi are born with atleast one talent, and while they are not forced to take this route they thrive when seeking out their birth right. Below is a list of all talents and what benefit they provide:<br><Br>

	**Note: All Talents are unlocked at 20 PP<br><Br>
Katon: -3 PP on all related perks.<br>
Suiton: -3 PP on all related perks.<br>
Doton: -3 PP on all related perks.<br>
Fuuton: -3 PP on all related perks.<br>
Raiton: -3 PP on all related perks.<br>
Medical: -3 PP on all related perks.<br>
Genjutsu: -3 PP on all related perks.<br>
Fuuinjutsu: -3 PP on all related perks.<br>
Taijutsu: -3 PP on all related perks. <br>
Hardworker: Allows you to pick an of the talents listed above(Rare Roll).<br>
Genius: -2 PP on a wider selection of perks (Rare Roll).<br><Br>
	</body>
	"}

	var/progressguide = {"

	<html>
	<head>
	<Center><Font Color=Black face=Cambria>
	<title>Progress Guide</title>
	</head>
	<body><Center><Font Color=Black face=Cambria>
	<br><br>There's various ways of progressing your skills, though only shinobi who truely get involved will prosper. Firstly, well cover the multiple different ways of gaining strength and/or progression.

<B>Daily Reward</B> - This is relatively self-explaintory but for thoose who don't know. Every day you should recieve a number of PP. Depending on your total number of progress points you can recieve more or less then your peers.  120+ PP  = 2 PP a day. 150+ PP = 1 a day.
<BR><BR>
<B>Progress Logs</B> - At the end of every Story Arc, players are to recieve arc checks. Story Arcs can last an undisclosed amount of time but in between the gap. Players are expected to note down importantion information pertaining to their character's progression. Only major advancements are to be noted here. Such as interacting in an Event, Going on a Mission, Losing a Comrade etc.
<BR><BR>
<b>Missions</B> - Once your character has graduated the Academy and dwelved into becoming a true shinobi they can take on missions. These can be orchestrated in two differents forms. PVP or PVE
<BR><BR>
	<b>Player Vs Player(PVP)</B> ­- These missions usually come in the form of IC situations but can also be setup in a scheduled manner. An example of this would be being assigned to capture or kill another player character.  As said before, these also can be done in an organized manner. Lets break this down.
<BR><BR>
	Let's paint a scenario to give you better understanding how this works. Lets say both village leaders are given word that an ancient artifact has been discovered in distant land. Each Kage will now send out a properly sized squad for whatever the missions called for. Now each squad will be sent out to the location of said item, and when they arrive they will now have to interact to claim ownership over said artifact.
<BR><BR>
	Also, a <B>BIG FACTOR</B> in these type of missions is death. Death is 100% a risk when attending these types of missions and can be severely costly. Battle Conditions will sometimes be posted on the bottom of mission scrolls when given by admins. These will be kept on a need to know basis, as you will understand what this means when you begin attending these missions.
<BR><BR>
	<B>Note:</B> Each mission will have an assigned number of squadmembers. This cannot be modified and/or changed.
<BR><BR>
	<B>Player Vs Everyone(PVE)</B> - These are less important but still prove to be beneficial depending on the situation. These missions can stretch anywhere from being self-RP with a group of friends or a eventmin controlled situation. Depending on the rank of the missions, these can prove to be highly rewarding.
<BR><BR>
<B>Mission Rewards</B> - When completing a mission and returning it to your respective village leader, you will be granted a reward. This reward can be in the form of Jutsu Scrolls, Ryo, Legendary Weapons, Influence Points etc. This is all dependant on the level of the mission.
	</body>
	"}