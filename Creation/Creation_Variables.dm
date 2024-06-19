//This is used to prevent special characters.
var/const/allowed_characters_name = "abcdefghijklmnopqrstuvwxyz' .	"

//This is for the intro. Not currently being used.
var/Intro={"<html>
<head><title>Welcome to Issac World</title></head><body><body bgcolor="#000000"><font size=2><font color="#0099FF"><html>
<center><h1>The Intro Verb will pull up this menu once admins have updated it.</h1></center>
<br>
<br>
<hr>
<br>
"}
var/WritingIntro=0


//Mob Variables.
mob/var
    AffinityType = "None"
    hair
    facialhair
    Ranmaru=0
    Uchiha=0
    Hyuuga=0
    Uchiha1=0
    Inuzuka=0
    Nara=0
    Hozuki=0
    Kaguya=0
    Akimichi=0
    Aburame=0
    Memori=0
    Samurai=0
    Priest=0
    Yotsuki=0
    Uzumaki=0
    Sabaku=0
    Iwato=0
    Fuujin=0
    Yomei=0
    Karasu=0
    Yuki=0
    Dead=0
    White=0
    Pale=1
    Tan=0
    Dark=0
    Female=0
    Kai=0
    returnx
    returny
    returnz
    Kyokugi=0
    copyable=1
    bloodtype=""
    fakeName=""
    Donator=0
    Hiding
    Gender="male"
    PerkAffinity = "None"
    DiscountActive = 0

mob/var/tmp/obj/chakraoverlay/chakraOverlay = new
obj/chakraoverlay
	icon = 'chakraoverlay.dmi'
	invisibility = 1
	layer = 5
	mouse_opacity = 0
	alpha = 210
