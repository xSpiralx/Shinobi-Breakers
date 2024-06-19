/mob/verb/attack()
	set name = "Attack"
	set category = "Combat"
	set desc = "A command used to determine the results of close quarters combat."

	var/mob/m = locate() in get_step(src, dir)

	if(!m) return

	if(world.time > m.last_hit_taken + 36000) //if it's been an hour since they've last engaged in cqc, reset
		m.times_hit = -1

	m.last_hit_taken = world.time

	if(m.times_hit == -1)
		system_message("[src] has initiated <a href='?databook_close_quarters_combat' style='color:#339933; font-family:Arial;'>Close Quarters Combat</a>.")
		m.times_hit = 0

	var/advantage = (agility + agility_boost()) - (m.agility + m.agility_boost())

	m.times_hit++

	if(m.times_hit >= get_hit_threshold(advantage))
		//if(advantage > -10 && advantage < 10 && prob( 50 - (advantage * 5) ))
		//	system_message("[src] can land a mitigated attack. If [his()] opponent would take damage, that damage is capped at <a href='?databook_light_injury' style='color:[COLOR_LIGHT_INJURY]; font-family:Arial;'>Light Injury</a>.")
		//else
		system_message("[src] can land a decisive attack. It does <a href='?databook_heavy_injury' style='color:[COLOR_HEAVY_INJURY]; font-family:Arial;'>Full Damage</a> to [his()] opponent.")
		m.times_hit = 0

	else if(m.times_hit >= get_hit_threshold(advantage) - 1)
		system_message("[src] can land a mitigated attack. If [his()] opponent would take damage, that damage is capped at <a href='?databook_light_injury' style='color:[COLOR_LIGHT_INJURY]; font-family:Arial;'>Light Injury</a>.")

	else system_message("[src] can not damage [his()] opponent this round. They may dodge or block the attack as they see fit.")

/proc/get_hit_threshold(advantage)
	if(advantage >= 40) return 1
	if(advantage >= 30) return 2
	if(advantage >= 20) return 3
	if(advantage >= 10) return 4
	if(advantage > -10) return 5
	if(advantage > -20) return 6
	if(advantage > -30) return 7
	if(advantage > -40) return 8
	return 100

/mob/var/tmp/times_hit = -1
/mob/var/tmp/last_hit_taken = 0

/mob/proc/damage(var/mob/m as mob in view())
	set name = "Damage"
	set category = "Combat"

	var/d = abs(input("Input damage:") as num)

	if(d >= m.endurance + 32)
		system_message("A total damage value of [d] applied to [m] would lead to <a href='?databook_death' style='color:[COLOR_CRITICAL_INJURY]; font-family:Arial;'>Death</a>.")
	else if(d >= m.endurance + 24)
		system_message("A total damage value of [d] applied to [m] would lead to <a href='?databook_heavy_injury' style='color:[COLOR_HEAVY_INJURY]; font-family:Arial;'>Heavy Injury</a>.")
	else if(d >= m.endurance + 16)
		system_message("A total damage value of [d] applied to [m] would lead to <a href='?databook_moderate_injury' style='color:[COLOR_MODERATE_INJURY]; font-family:Arial;'>Moderate Injury</a>.")
	else if(d >= m.endurance + 8)
		system_message("A total damage value of [d] applied to [m] would lead to <a href='?databook_light_injury' style='color:[COLOR_LIGHT_INJURY]; font-family:Arial;'>Light Injury</a>.")
	else if(d >= m.endurance + 0)
		system_message("A total damage value of [d] applied to [m] would lead to <a href='?databook_petty_injury' style='color:[COLOR_PETTY_INJURY]; font-family:Arial;'>Petty Injury</a>.")
	else
		system_message("A total damage value of [d] applied to [m] would not damage [m.him()] at all.")


/var/const/COLOR_PETTY_INJURY = "#999999"
/var/const/COLOR_LIGHT_INJURY = "#ff9900"
/var/const/COLOR_MODERATE_INJURY = "#ff3300"
/var/const/COLOR_HEAVY_INJURY = "#cc0000"
/var/const/COLOR_CRITICAL_INJURY = "#660000"

/*
0 5 rounds
10 4 rounds
20 3 rounds
30 2 rounds

0 petty injury #999999
8 light injury #ff9900
16 moderate injury #ff3300
24 heavy injury #cc0000
32 death #660000

flicker
1 use, 3x cost per use
I. no attack after use
shar, lighting armor, attack after use
shar, shisui, no 3x cost, highest level genjutsu user


two types
conditional and unconditional

conditional during melee combat
+24 power
+24 agi
if conditional miss, still pay chakra

types:
feint -> enemy block/dodge
dodge 3 in a row without attacking back

all grapples are conditional
+24 agi
+24 power

unconditional to enter melee combat
+24 power
+24 speed

weapons
shuriken, kunai - normal melee
windmills, giants - treated like jutsu
senbon - only really useful for poison & pressure points

*/