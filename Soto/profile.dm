
mob/var/Height="Undefined"
mob/var/Weight="Undefined"


mob/var
	profile_title = "Profile"

mob/var/profile={"<html>
<head><center><title>Character Profile</title></center></head>
<body><body bgcolor="black" text=white>
This character has not setup their profile.
</body>
"}


mob/var/descrip={"<html>
<center>
<body><body bgcolor="black" text=white>
This character has not setup their profile.
</body>
"}

mob/var/injury_table = {"<html>
"}

mob/DblClick()
	winshow(usr,"Profile",1)
	winset(usr,null,"Profile.AgeOutput.Text=[src.Age]")
	winset(usr,null,"Profile.HeightOutput.Text=[src.Height]")
	winset(usr,null,"Profile.WeightOutput.Text=[src.Weight]")
	winset(usr,null,"Profile.Title=[src.profile_title]")

	usr<<browse(src.profile,"window=Profile.ProfileBrowse")
	usr<<browse(src.descrip,"window=Profile.DescBrowse")
	usr<<browse(check_injuries(src),"window=Profile.InjuryBrowse")


mob/verb/viewinjury()
	set hidden = 1
	winset(src,"Profile.DescBrowse", "is-visible=false")

mob/verb/viewdesc()
	set hidden = 1
	winset(src,"Profile.DescBrowse","is-visible=true")


mob/verb/edit_profile()
	set hidden = 1

	winset(usr,"EditProfile","is-visible=true")
	winset(usr,null,"EditProfile.TitleInput.text=[usr.profile_title]")
	winset(usr,null,"EditProfile.HeightInput.text=[usr.Height]")
	winset(usr,null,"EditProfile.WeightInput.text=[usr.Weight]")
	winset(usr,null,"EditProfile.ProfileInput.text=\"[usr.profile]")
	winset(usr,null,"EditProfile.DescInput.text=\"[usr.descrip]")

mob/verb/updateprofile()
	set hidden = 1

	var/_htmlProfile = "[winget(usr, "EditProfile.ProfileInput", "Text")]"
	var/_htmlTitle = "[winget(usr, "EditProfile.TitleInput", "Text")]"

	var/_height = "[winget(usr, "EditProfile.HeightInput", "Text")]"
	var/_weight = "[winget(usr, "EditProfile.WeightInput", "Text")]"

	var/_htmlDesc = "[winget(usr, "EditProfile.DescInput", "Text")]"

	src.profile = _htmlProfile
	src.descrip = _htmlDesc
	src.profile_title = _htmlTitle
	src.Height = _height
	src.Weight = _weight

	winset(src,"EditProfile","is-visible=false")

mob/verb/preview_profile()
	set hidden = 1

	winshow(usr,"Profile",1)
	winset(usr,null,"Profile.AgeOutput.Text=[src.Age]")
	winset(usr,null,"Profile.HeightOutput.Text=[winget(usr, "EditProfile.HeightInput", "Text")]")
	winset(usr,null,"Profile.WeightOutput.Text=[winget(usr, "EditProfile.WeightInput", "Text")]")
	winset(usr,null,"Profile.Title=[winget(usr, "EditProfile.TitleInput", "Text")]")

	usr<<browse(winget(usr, "EditProfile.ProfileInput", "Text"),"window=Profile.ProfileBrowse")
	usr<<browse(winget(usr, "EditProfile.DescInput", "Text"),"window=Profile.DescBrowse")
	usr<<browse(check_injuries(usr),"window=Profile.InjuryBrowse")