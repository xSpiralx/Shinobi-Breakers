mob/proc
	GetPowerRank(var/Rank)
		var/PeopleOnline=1
		for(var/mob/K) if(K.client)
			PeopleOnline+=1
		if(Rank==1)
			var/StrongerStats=1
			var/StrengthX=MaxStrength/StrengthGain
			if(StrengthX<1)
				StrengthX=1
			var/AgilityX=MaxAgility/AgilityGain
			if(AgilityX<1)
				AgilityX=1
			var/DefenceX=MaxDefence/DefenceGain
			if(DefenceX<1)
				DefenceX=1
			var/OffenceX=MaxOffence/OffenceGain
			if(OffenceX<1)
				Offence=src.MaxOffence
			var/TaijutsuX=MaxTaijutsu/TaijutsuGain
			if(TaijutsuX<1)
				TaijutsuX=1
			var/ResistanceX=MaxResistance/ResistanceGain
			if(ResistanceX<1)
				ResistanceX=1
			var/ControlX=MaxControl/ControlGain
			if(ControlX<1)
				ControlX=1
			var/NinjutsuX=MaxNinjutsu/NinjutsuGain
			if(NinjutsuX<1)
				NinjutsuX=1
			var/GenjutsuX=MaxGenjutsu/GenjutsuGain
			if(GenjutsuX<1)
				Genjutsu=1
			var/YourStats=(StrengthX+AgilityX+DefenceX+OffenceX+TaijutsuX+ResistanceX+ControlX+NinjutsuX+GenjutsuX)/9
			for(var/mob/A) if(A.client&&A.Savable)
				var/StrengthZ=A.MaxStrength/A.StrengthGain
				if(StrengthZ<1)
					StrengthZ=1
				var/AgilityZ=A.MaxAgility/A.AgilityGain
				if(AgilityZ<1)
					AgilityZ=1
				var/DefenceZ=A.MaxDefence/A.DefenceGain
				if(DefenceZ<1)
					DefenceZ=1
				var/OffenceZ=A.MaxOffence/A.OffenceGain
				if(OffenceZ<1)
					Offence=src.MaxOffence
				var/TaijutsuZ=A.MaxTaijutsu/A.TaijutsuGain
				if(TaijutsuZ<1)
					TaijutsuZ=1
				var/ResistanceZ=A.MaxResistance/A.ResistanceGain
				if(ResistanceZ<1)
					ResistanceZ=1
				var/ControlZ=A.MaxControl/A.ControlGain
				if(ControlZ<1)
					ControlZ=1
				var/NinjutsuZ=A.MaxNinjutsu/A.NinjutsuGain
				if(NinjutsuZ<1)
					NinjutsuZ=1
				var/GenjutsuZ=A.MaxGenjutsu/A.GenjutsuGain
				if(GenjutsuZ<1)
					Genjutsu=1
				var/TheirStats=(StrengthZ+AgilityZ+DefenceZ+OffenceZ+TaijutsuZ+ResistanceZ+ControlZ+NinjutsuZ+GenjutsuZ)/9
				if(TheirStats>YourStats) StrongerStats+=1
			//return round((100/PeopleOnline)*StrongerStats)
			return 1

mob/var
	Gain1=1
	Gain2=0
	Gain3=0
	Gain4=0
	Gain5=0

	MGain1=1
	MGain2=0
	MGain3=0
var/WORLDGAIN=0.2
mob/proc
	Spar_Gain(var/Type)
		var/Multiz=1
		Multiz=WORLDGAIN
		if(istype(Type,/mob/Guard/))
			Multiz=0.1
		if(istype(Type,/mob/Villager))
			Multiz=0.01
		MaxStamina += (1 *0.0187/1.5*usr.StaminaGain)*Multiz
		MaxTaijutsu += (1 *0.0023/1.5*usr.TaijutsuGain)*Multiz
		if(src.Gain1)
			MaxStrength += (1 *0.0024/3.5*usr.StrengthGain)*Multiz
			MaxAgility += (1 *0.0024/3.5*usr.AgilityGain)*Multiz
			MaxDefence += (1 *0.0024/3.5*usr.DefenceGain)*Multiz
			MaxOffence += (1 *0.0024/3.5*usr.OffenceGain)*Multiz
		if(src.Gain2)
			MaxStrength += (1 *0.0032/2.8*usr.StrengthGain)*Multiz
			MaxAgility += (1 *0.0019/3.5*usr.AgilityGain)*Multiz
			MaxDefence += (1 *0.0021/2.5*usr.DefenceGain)*Multiz
			MaxOffence += (1 *0.0021/3.5*usr.OffenceGain)*Multiz
		if(src.Gain3)
			MaxStrength += (1 *0.0019/3.5*usr.StrengthGain)*Multiz
			MaxAgility += (1 *0.0032/2.8*usr.AgilityGain)*Multiz
			MaxDefence += (1 *0.0021/3.5*usr.DefenceGain)*Multiz
			MaxOffence += (1 *0.0021/3.5*usr.OffenceGain)*Multiz
		if(src.Gain4)
			MaxStrength += (1 *0.0021/3.5*usr.StrengthGain)*Multiz
			MaxAgility += (1 *0.0021/3.5*usr.AgilityGain)*Multiz
			MaxDefence += (1 *0.0032/2.8*usr.DefenceGain)*Multiz
			MaxOffence += (1 *0.0019/3.5*usr.OffenceGain)*Multiz
		if(src.Gain5)
			MaxStrength += (1 *0.0021/3.5*usr.StrengthGain)*Multiz
			MaxAgility += (1 *0.0021/3.5*usr.AgilityGain)*Multiz
			MaxDefence += (1 *0.0019/3.5*usr.DefenceGain)*Multiz
			MaxOffence += (1 *0.0032/2.8*usr.OffenceGain)*Multiz
	Jutsu_Gain()
		var/Multiz=1
		Multiz=WORLDGAIN
		MaxChakra += (1 *0.0021*usr.ChakraGain)*Multiz
		if(src.MGain1)
			MaxControl += (1 *0.0018/3.5*usr.ControlGain)*Multiz
			MaxResistance += (1 *0.0018/3.5*usr.ResistanceGain)*Multiz
			MaxNinjutsu += (1 *0.0015/3.5*usr.NinjutsuGain)*Multiz
			MaxGenjutsu += (1 *0.0015/3.5*usr.GenjutsuGain)*Multiz
		if(src.MGain2)
			MaxControl += (1 *0.0025/2.8*usr.ControlGain)*Multiz
			MaxResistance += (1 *0.0015/3.5*usr.ResistanceGain)*Multiz
			MaxNinjutsu += (1 *0.0022/3.5*usr.NinjutsuGain)*Multiz
			MaxGenjutsu += (1 *0.0012/3.5*usr.GenjutsuGain)*Multiz
		if(src.MGain3)
			MaxControl += (1 *0.0015/3.5*usr.ControlGain)*Multiz
			MaxResistance += (1 *0.0025/2.8*usr.ResistanceGain)*Multiz
			MaxNinjutsu += (1 *0.0012/3.5*usr.NinjutsuGain)*Multiz
			MaxGenjutsu += (1 *0.0021/3.5*usr.GenjutsuGain)*Multiz