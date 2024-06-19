//mob/verb/Teleport_To_Mission_Area()
//

/*

missions increase caps

forced promotion necessity
D, genin - minor
C, Chunin - lethal
B, special jounin - lethal
A, jounin - lethal

You've completed 9 c-rank missions. You're due an examination to test you for promotion.

C = 3v3, C C C vs C C C, no deaths +5 reward

B = 1v1, B vs B, 1 death of B rank +15 reward
B = 2v2, B C vs B C, 1 death of B rank +15 reward
B = 3v3, B C C vs B C C, 1 death of B rank +15 reward
B = 4v2, B C vs B D D D, 1 death of B rank +15 reward
B = 4v4, B D D D vs B D D D, 1 death of B rank +15 reward

A = 1v1, A vs A, 1 death of A rank +15 reward
A = 4v4, A C C C vs A C C C, 1 death of A rank +15 reward

S = 4v2, A C C C vs S S, 1 death of A rank or above, +15 reward

C = no deaths
B = 1 death, (3 deaths per A rank)
A = all deaths (9 deaths per S rank)

                      S         kills chart
               A      A      A
             B B B  B B B  B B B

             B = C C C  C C C  C C C   missions

             C- cap
             9 C rank missions to get B-
             3 B rank missions to get A- (1 B must die)
             3 A rank missions to get S  (1 A must die)

   Chunin   C = 2v2, C C vs C C, no deaths +5 reward
             C = 3v3, C C C vs C C C, no deaths +5 reward

    jounin   B = 1v1, B vs B, 1 death +15 reward
             B = 4v2, B C vs B D D D, 1 death of B rank +15 reward
             B = 2v2, B C vs B C, 1 death of B rank +15 reward
             B  = 4v4, B D D D vs B D D D, 1 death of B rank +15 reward

      kage   A = 1v1, A vs A, 1 death of A rank +15 reward
             A = 4v4, A C C C vs A C C C, 1 death of A rank +15 reward

c+ = Chunin
b- = Chunin/jounin

genin (c- max)
Chunin (b- max)
tokubetsu jounin (a- max)
jounin (a+ max)
criminal/kage/sage/jinchuuriki (s max)

genin d-/d/d+/c-
Chunin c-/c/c+/b-
jounin b-/b/b+/a-
criminal/kage/sage a-/a/a+/s

Mission!
Name: School of Hard Knocks
Grade: B - Lethal
Squad Leader: Yuudai

She was in an alley with high, brick walls that showed their age. There were five windows visible from where she sat and two of them were broken. A dog howled, somewhere nearby, and someone in a heavy coat walked by without so much as glancing at the child strewn out in an alley.

A note was pinned to her nightshirt.

Welcome to Hae, little chameleon. I was pleasantly surprised at your preparedness; you hid your tools well but I am afraid my assignment serves best while you have nothing. I hope you can forgive me.

I am not your sensei. She cannot teach you what I can; the poor darling is too straightforward and too kind. Today I have left you in Hae, old jewel of the Snow empire, heart of its military, and dying husk of a city without the Snow war to keep it fed. This will be our arena, sweetling. If you attempt to leave at any time, I will stop you and drag you back until you have learned what there is to learn.

It has been over twenty-four hours since your last meal, and a vicious blizzard will arrive from the west in a number of hours. Your first task is this; with no tools in a city where everybody hates you, survive.

Good luck, Darling.

    ~M~

Can click the mission to get a summary


/proc/get_rank_grade(mob/M)
	var/total = M.total_stats()
	if(total > 205) return "S"
	if(total > 195) return "A+"
	if(total > 180) return "A"
	if(total >= 165) return "A-"
	if(total >= 150) return "B+"
	if(total >= 135) return "B"
	if(total >= 120) return "B-"
	if(total >= 105) return "C+"
	if(total >= 90) return "C"
	if(total >= 75) return "C-"
	if(total >= 60) return "D+"
	if(total >= 45) return "D"
	if(total >= 30) return "D-"
	if(total >= 15) return "E+"
	if(total >= 5) return "E"
	return "E-"

*/