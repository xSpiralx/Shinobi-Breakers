var
	KonohaFunds
	KiriFunds
	SunaFunds

proc/LoadFunds()
	if(fexists("Funds"))
		var/savefile/G=new("Funds")
		G["KonohaFunds"]>>KonohaFunds
		G["KiriFunds"]>>KiriFunds
		G["SunaFunds"]>>SunaFunds

proc/SaveFunds()
	var/savefile/G=new("Funds")
	G["KonohaFunds"]<<KonohaFunds
	G["KiriFunds"]<<KiriFunds
	G["SunaFunds"]<<SunaFunds


var
	perkSelected
	perkBlank
	jutsuSelected
	jutsuBlank
world/New()
	..()
	if(fexists("Funds"))
		LoadFunds()
	else
		SaveFunds()
	var/icon/Y = icon('combined1.png')
	perkSelected = fcopy_rsc(Y)

	var/icon/X = icon('combined2.png')
	jutsuSelected = fcopy_rsc(X)

	var/icon/ZZ = icon('jutsuUnSel.png')
	jutsuBlank = fcopy_rsc(ZZ)

	var/icon/ZZZ = icon('perkUnSel.png')
	perkBlank = fcopy_rsc(ZZZ)

world/Del()
	SaveFunds()
	..()

/*Notes
			else	M.Yen += reward;KonohaFunds -= reward;SaveFunds()
			Example of reward taken funds. Also
			Read this code
src << "Your village funds are [SunaFunds]. Remember, those funds are increased daily by admins and are decreased whenever you reward or a certain thing is performed."
<3ly
*/