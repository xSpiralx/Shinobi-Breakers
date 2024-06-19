/*
  ////////////////////////////////////////
  Riggedy riggedy white,
  Come and spend the night.
  We'll play some games,                  IOCA'S CARD SYSTEM
  Some wild, some tame,
  Cause if you will, you might.
            -Ioca Laberge
  ////////////////////////////////////////


*/



/*
mob/verb/Create_Deck()
	var/obj/items/Deck/D=new(src.loc)
	D.owner=src
*/

/*
obj/Technology
	Deck_Of_Cards
		Level=5
		Creates=/obj/items/Deck
		Cost=100000
*/

obj/items/Deck
	icon='Cards.dmi'
	icon_state="deck"
	desc="A pack of playing cards."
	var/owner
	var/list/Cards=list()
	New()
		src.owner=usr
		for(var/v in typesof(/obj/items/Cards/)-(/obj/items/Cards/))
			var/obj/items/Cards/b=new v
			if(b in Cards)
				..()
			else
				Cards+=b
				..()
	verb/View_Cards()
		set src in oview(1)
		var/count
		var/cards="<body bgcolor=black><font color=white><font face='times'><title>[length(Cards)] Cards</title>"
		for(var/v in Cards)
			count++
			cards+="[v:cardname]<br>"
		if(count==null)
			count=0
		usr<<browse(cards, "window= ")
	verb/Draw()
		set src in oview(2)
		if(length(src.Cards))
			var/Draw=pick(src.Cards)
			Draw:owner=src.owner
			Draw:desc="This is a card. ([Draw:owner]'s card)"
			usr<<"You draw a [Draw:cardname]."
			viewers()<<"[usr] just drew a card."
			usr.contents+=Draw
			src.Cards-=Draw
		else
			usr<<"There are no more cards in this deck."
/*	verb/Drop()
		src.Move(usr.loc)
	verb/Pick_Up()
		set src in oview(1)
		src.Move(usr)  */

obj/items/Cards
	name="Card"
	icon='Cards.dmi'
	icon_state="facedown"
	desc="This is a card."
	var/owner
	var/cardname
	verb/Place_In_Deck()
		for(var/obj/items/Deck/D in oview(2, usr.loc))
			var/obj/items/Cards/C=new src.type
			if(locate(C) in D.Cards)
				usr<<"[C.cardname] is already in this deck."
			else
				usr<<"You place [C.cardname] in the deck."
				D.Cards+=C
				usr.contents-=src
				viewers()<<"[usr] just returned a card to the deck. ([length(D:Cards)] Cards in deck)"
	verb/Place_Down()
		var/choice=input("Place this card face down, or face up?")in list("Face Up","Face Down","Cancel")
		if(choice=="Face Down")
			src.icon_state="facedown"
			src.Move(usr.loc)
			usr<<"You've placed down [src.cardname]."
		if(choice=="Face Up")
			src.icon_state=initial(src.icon_state)
			src.Move(usr.loc)
			usr<<"You've placed down [src.cardname]."
/*	verb/Pick_Up()
		set src in oview(1)
		src.icon_state=initial(src.icon_state)
		src.Move(usr) */
	verb/Flip()
		set src in oview(1)
		if(src.icon_state==initial(src.icon_state))
			src.icon_state="facedown"
		else
			src.icon_state=initial(src.icon_state)
			usr<<"You've flipped over a [src.cardname]."

	ClubA
		cardname="Ace of Clubs"
		icon='Cards.dmi'
		icon_state="cluba"
	Club2
		cardname="Two of Clubs"
		icon='Cards.dmi'
		icon_state="club2"
	Club3
		cardname="Three of Clubs"
		icon='Cards.dmi'
		icon_state="club3"
	Club4
		cardname="Four of Clubs"
		icon='Cards.dmi'
		icon_state="club4"
	Club5
		cardname="Five of Clubs"
		icon='Cards.dmi'
		icon_state="club5"
	Club6
		cardname="Six of Clubs"
		icon='Cards.dmi'
		icon_state="club6"
	Club7
		cardname="Seven of Clubs"
		icon='Cards.dmi'
		icon_state="club7"
	Club8
		cardname="Eight of Clubs"
		icon='Cards.dmi'
		icon_state="club8"
	Club9
		cardname="Nine of Clubs"
		icon='Cards.dmi'
		icon_state="club9"
	Club10
		cardname="Ten of Clubs"
		icon='Cards.dmi'
		icon_state="club10"
	ClubJ
		cardname="Jack of Clubs"
		icon='Cards.dmi'
		icon_state="clubj"
	ClubQ
		cardname="Queen of Clubs"
		icon='Cards.dmi'
		icon_state="clubq"
	ClubK
		cardname="King of Clubs"
		icon='Cards.dmi'
		icon_state="clubk"
	DiamondA
		cardname="Ace of Diamonds"
		icon='Cards.dmi'
		icon_state="diamonda"
	Diamond2
		cardname="Two of Diamonds"
		icon='Cards.dmi'
		icon_state="diamond2"
	Diamond3
		cardname="Three of Diamonds"
		icon='Cards.dmi'
		icon_state="diamond3"
	Diamond4
		cardname="Four of Diamonds"
		icon='Cards.dmi'
		icon_state="diamond4"
	Diamond5
		cardname="Five of Diamonds"
		icon='Cards.dmi'
		icon_state="diamond5"
	Diamond6
		cardname="Six of Diamonds"
		icon='Cards.dmi'
		icon_state="diamond6"
	Diamond7
		cardname="Seven of Diamonds"
		icon='Cards.dmi'
		icon_state="diamond7"
	Diamond8
		cardname="Eight of Diamonds"
		icon='Cards.dmi'
		icon_state="diamond8"
	Diamond9
		cardname="Nine of Diamonds"
		icon='Cards.dmi'
		icon_state="diamond9"
	Diamond10
		cardname="Ten of Diamonds"
		icon='Cards.dmi'
		icon_state="diamond10"
	DiamondJ
		cardname="Jack of Diamonds"
		icon='Cards.dmi'
		icon_state="diamondj"
	DiamondQ
		cardname="Queen of Diamonds"
		icon='Cards.dmi'
		icon_state="diamondq"
	DiamondK
		cardname="King of Diamonds"
		icon='Cards.dmi'
		icon_state="diamondk"
	HeartA
		cardname="Ace of Hearts"
		icon='Cards.dmi'
		icon_state="hearta"
	Heart2
		cardname="Two of Hearts"
		icon='Cards.dmi'
		icon_state="heart2"
	Heart3
		cardname="Three of Hearts"
		icon='Cards.dmi'
		icon_state="heart3"
	Heart4
		cardname="Four of Hearts"
		icon='Cards.dmi'
		icon_state="heart4"
	Heart5
		cardname="Five of Hearts"
		icon='Cards.dmi'
		icon_state="heart5"
	Heart6
		cardname="Six of Hearts"
		icon='Cards.dmi'
		icon_state="heart6"
	Heart7
		cardname="Seven of Hearts"
		icon='Cards.dmi'
		icon_state="heart7"
	Heart8
		cardname="Eight of Hearts"
		icon='Cards.dmi'
		icon_state="heart8"
	Heart9
		cardname="Nine of Hearts"
		icon='Cards.dmi'
		icon_state="heart9"
	Heart10
		cardname="Ten of Hearts"
		icon='Cards.dmi'
		icon_state="heart10"
	HeartJ
		cardname="Jack of Hearts"
		icon='Cards.dmi'
		icon_state="heartj"
	HeartQ
		cardname="Queen of Hearts"
		icon='Cards.dmi'
		icon_state="heartq"
	HeartK
		cardname="King of Hearts"
		icon='Cards.dmi'
		icon_state="heartk"
	SpadeA
		cardname="Ace of Spades"
		icon='Cards.dmi'
		icon_state="spadea"
	Spade2
		cardname="Two of Spades"
		icon='Cards.dmi'
		icon_state="spade2"
	Spade3
		cardname="Three of Spades"
		icon='Cards.dmi'
		icon_state="spade3"
	Spade4
		cardname="Four of Spades"
		icon='Cards.dmi'
		icon_state="spade4"
	Spade5
		cardname="Five of Spades"
		icon='Cards.dmi'
		icon_state="spade5"
	Spade6
		cardname="Six of Spades"
		icon='Cards.dmi'
		icon_state="spade6"
	Spade7
		cardname="Seven of Spades"
		icon='Cards.dmi'
		icon_state="spade7"
	Spade8
		cardname="Eight of Spades"
		icon='Cards.dmi'
		icon_state="spade8"
	Spade9
		cardname="Nine of Spades"
		icon='Cards.dmi'
		icon_state="spade9"
	Spade10
		cardname="Ten of Spades"
		icon='Cards.dmi'
		icon_state="spade10"
	SpadeJ
		cardname="Jack of Spades"
		icon='Cards.dmi'
		icon_state="spadej"
	SpadeQ
		cardname="Queen of Spades"
		icon='Cards.dmi'
		icon_state="spadeq"
	SpadeK
		cardname="King of Spades"
		icon='Cards.dmi'
		icon_state="spadek"

/*
mob/verb/Roll_Dice()
	var/many=1
	var/count=1
	var/times=1
	var/total
	many=input("How many sides?") as num
	if(many>100) return
	if(many<1) return
	times=input("Roll how many times?") as num
	if(times>100) return
	if(many<1) return
	if(many==1)
		viewers()<<"[usr] has rolled a 1d[times].  Total: [times]"
		return
	if(count==times)
		total+=rand(1, many)
	while(count<times)
		count++
		total+=rand(many)
		continue
	viewers()<<"[usr] has rolled a [many]d[times].  Total: [total]"
*/



