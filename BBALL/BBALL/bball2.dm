var/list/SuperRookies=list("")
proc
	Steal(Stolen=1,mob/m)
		var/obj/Sports/Basketball/ShotEffects/S = new
		S.alpha=0
		S.loc=m.loc
		S.pixel_x=-8
		S.pixel_y=-4
		if(Stolen==1)
			S.icon_state="Thief"
		else if(Stolen==2)
			S.icon_state="Swat"
		else
			S.icon_state="Crossed"
		animate(S,alpha=255,pixel_z=8,time=3)
		spawn(3)
			animate(S,alpha=255,pixel_z=20,time=8)
			spawn(8)
				animate(S,alpha=0,pixel_z=24,time=3)
				spawn(3)
					del S
	Swish(Goal,Score=0)


		for(var/obj/Sports/Basketball/ScoreBoard/SB in range(32))

			if(Goal:icon=='RightGoal.dmi')
				if(Score==1||Score==2)
					SB:Team2Score+=2
				else if(Score==3)
					SB:Team2Score+=3

			else
				if(Score==1||Score==2)
					SB:Team1Score+=2
				else if(Score==3)
					SB:Team1Score+=3
			for(var/obj/Sports/Visual/ScoreBoard/SV in range(32))
				SV:overlays+="T2 [SB:Team2Score]"
				SV:overlays+="T1 [SB:Team1Score]"
			if(SB:Team1Score>21)
				del SB:Ball
			if(SB:Team2Score>21)
				del SB:Ball
		var/obj/Sports/Basketball/ShotEffects/S = new
		S.alpha=0
		S.loc=Goal:loc
		if(Score==3)
			S.icon_state="Three"
		else if(Score==2)
			S.icon_state="Two"
		else if(Score==1)
			S.icon_state="One"
		else if(Score==4)
			S.icon_state="Three"
		else
			S.icon_state="Miss"
		animate(S,alpha=255,pixel_z=8,time=3)
		spawn(3)
			animate(S,alpha=255,pixel_z=20,time=8)
			spawn(8)
				animate(S,alpha=0,pixel_z=24,time=3)
				spawn(3)
					del S
obj
	Sports

		Visual
			ScoreBoard
				icon='Scoreboard.dmi'
				layer=EFFECTS_LAYER
				pixel_x=-32
				pixel_y=32
		Basketball


			ScoreBoard
				var
					Team1Score=0
					Team2Score=0
					list/TeamOne=list()
					list/TeamTwo=list()
					Captain1
					Captain2
					Ball
				proc
					FollowTheBall()
						spawn(0.1)
							if(Ball)
								for(var/mob/m in oview(6,Ball))

									if(Ball:Owner==m)
									else
										if(TeamOne.Find(m)||TeamTwo.Find(m))

											m.dir=get_dir(m,Ball)
								FollowTheBall()
				verb
					PickUpGame()
						set category="Basketball"
						set src in oview(1)

						if(!Ball)
							var/obj/Sports/Basketball/Rock/R = new
							R.Take()
							R.Game=src
							Ball = R
							overlays=null
							Team1Score=0
							Team2Score=0
							TeamOne=list()
							TeamTwo=list()
							Captain1=usr
							TeamOne:Add(usr)
							var/list/Players=list()
							for(var/mob/m in view(12,src))
								if(m.client)
									Players:Add(m)
							Players:Remove(usr)

							Players:Add("Cancel")
							Captain2 = input(usr,"Select another captain") in Players
							var/Choosing=1
							if(Captain2 =="Cancel")
								Choosing = 0
							else
								Players:Remove(Captain2)
								TeamTwo.Add(Captain2)
							while(Choosing)
								sleep(1)
								if(Choosing==1&&length(Players)>0)
									Choosing=0.5
									var/Pick=input(Captain2,"Select a player for your team. (Choose cancel to end the selection process)","[length(TeamOne)] v [length(TeamTwo)]") in Players
									if(Pick=="Cancel")
										Choosing=0
									else
										TeamTwo:Add(Pick)
										Players:Remove(Pick)
										Choosing=2
								else if(Choosing==2&&length(Players)>0)
									Choosing=0.5
									var/Pick=input(Captain1,"Select a player for your team. (Choose cancel to end the selection process)","[length(TeamOne)] v [length(TeamTwo)]") in Players
									if(Pick=="Cancel")
										Choosing=0
									else
										TeamOne:Add(Pick)
										Players:Remove(Pick)
										Choosing=1
								else if(length(Players)==0)
									Choosing=0
							FollowTheBall()
						else if(Ball:Owner==usr)
							del Ball
			ShotEffects
				icon='BBallText.dmi'
				pixel_y=32
				layer=EFFECTS_LAYER
			Bounds
				New()
					alpha=0
				icon='OOB.dmi'
				layer=EFFECTS_LAYER
			ThreePoint
				layer=MOB_LAYER-0.1
				icon='OOB.dmi'
				icon_state="3"
				New()
					alpha=0
			TwoPoint
				layer=MOB_LAYER-0.1
				icon='OOB.dmi'
				icon_state="2"
				New()
					alpha=0

			LayUps
				layer=MOB_LAYER-0.1
				icon='OOB.dmi'
				icon_state="1"
				New()
					alpha=0

			Court
				icon='FullCourt.dmi'
				pixel_x=-288
			Goal

				layer=MOB_LAYER+0.01
				icon='BBallGoal.dmi'
				pixel_x=20
				Right
					pixel_x=-20
					icon='RightGoal.dmi'

			Rock

				layer=MOB_LAYER+0.01
				var
					Owner
					CrossOver=1
					Game
					Shooting=0
				pixel_y=-16
				icon='balls.dmi'
				icon_state="rock"
				Cross(a)
					if(!Owner)
						Take()

					return 1
				verb
					TossUp()
						set src in oview(0)
						set name = "Shoot"
						set category = "Basketball"
						var
							Distance=999999999999999
							Hoop
							Loc=usr.loc
						for(var/obj/Sports/Basketball/Goal/G in range(8))
							if(get_dist(G,usr)<Distance)
								Distance=get_dist(G,usr)
								Hoop=G
						if(Hoop)
							for(var/obj/Sports/Basketball/Rock/B in usr.loc)
								if(B.Owner==usr)
									var/Shot=roll("1d20")
									if(usr.key in SuperRookies)
										Shot*=1.20
									if(Shot>=20)
										icon_state="fire"
									for(var/obj/Sports/Basketball/ThreePoint/T in usr:loc)
										if(Shot>=12&&usr.loc==Loc)
											B.Shoot(Roll=3,Goal=Hoop,Tiles=get_dist(usr,Hoop),Distance=3)
										else
											B.Shoot(Roll=0,Goal=Hoop,Tiles=get_dist(usr,Hoop))
									for(var/obj/Sports/Basketball/TwoPoint/T in usr:loc)
										if(Shot>=8&&usr.loc==Loc)
											B.Shoot(Roll=2,Goal=Hoop,Tiles=get_dist(usr,Hoop),Distance=2)
										else
											B.Shoot(Roll=0,Goal=Hoop,Tiles=get_dist(usr,Hoop))
									for(var/obj/Sports/Basketball/LayUps/T in usr:loc)
										if(Shot>=3&&usr.loc==Loc)
											B.Shoot(Roll=1,Goal=Hoop,Tiles=get_dist(usr,Hoop),Distance=1)
										else
											B.Shoot(Roll=0,Goal=Hoop,Tiles=get_dist(usr,Hoop))
					Take()
						set src in oview(1)
						set name = "Take(Drop)"
						set category = "Basketball"
						if(!Shooting)
							if(!Owner)
								Owner=usr
								pixel_z=initial(pixel_z)
								pixel_x=initial(pixel_x)
								pixel_y=initial(pixel_y)
								src.pixel_x=-12
								Handles()
								Dribble()
							else
								var/Same_Team=0
								if((Game:TeamOne:Find(usr)&&Game:TeamOne:Find(Owner))||(Game:TeamTwo:Find(usr)&&Game:TeamTwo:Find(Owner)))
									Same_Team=1
								if(Owner&&Owner!=usr&&!Same_Team)
									var
										Steal=roll("1d10")-2
										Handles=roll("1d10")

									if(Owner:key in SuperRookies)
										Handles*=1.20
									if(usr.key in SuperRookies)
										Steal*=1.20
									if(Steal>Handles)
										Steal(1,Owner)
										Owner=usr
									else
										Steal(0,usr)

								else if(Owner&&Owner==usr)
									Owner=null
					CrossOver()
						set category = "Basketball"
						set src in oview(0)
						if(!Owner)
							Take()
						if(Owner==usr)
							CrossOver*=-1
					Pass()
						set category="Basketball"
						set src in oview(0)
						if(!Owner)
							Take()
						if(Game:TeamOne:Find(usr))
							var/X = input(usr,"Who do you want to pass to?") in Game:TeamOne
							Owner=null
							walk_to(src,X)
							spawn(3)
								Owner=X
								Handles()
								Dribble()
						else if(Game:TeamTwo:Find(usr))
							var/X = input(usr,"Who do you want to pass to?") in Game:TeamTwo
							Owner=null
							walk_to(src,X)
							spawn(3)
								Owner=X
								Handles()
								Dribble()
				proc
					JumpShot(Defenders)

						if(Owner)
							var/mob/Jump=Owner
							for(var/mob/X in Defenders)
								animate(X,pixel_z=16,time=1.5)
							animate(Jump,pixel_z=16,time=1.5)
							animate(src,pixel_z=32+8,time=1.5)
							sleep(1.5)
							for(var/mob/X in Defenders)
								animate(X,pixel_z=24,time=3)
							animate(Jump,pixel_z=24,time=3)
							animate(src,pixel_z=48+8,time=3)
							spawn(4.5)
								for(var/mob/X in Defenders)
									animate(X,pixel_z=0,time=3.5)
								animate(Jump,pixel_z=0,time=3.5)
								//animate(src,pixel_z=8,time=3.5)

					Soar()
						set src in world
						var
							Distance=999999999999999
							Hoop


						for(var/obj/Sports/Basketball/Goal/G in range(8))
							if(get_dist(G,usr)<Distance)
								Distance=get_dist(G,usr)
								Hoop=G
						var
							Half_Dist=3
							Half_Dist2=3
							Next_Step=0
							Peak_Pixel=8
						Owner=null

						while(Half_Dist>0)

							Half_Dist-=0.2
							sleep(0.1)

							Next_Step+=0.2
							if(pixel_z<256)

								pixel_z+=Peak_Pixel
							if(Next_Step>=1)

								step_towards(src,Hoop)
								Next_Step=0
						Next_Step=0

						while(Half_Dist2>0)

							sleep(0.1)

							Next_Step+=0.2
							if(pixel_z>60)

								pixel_z-=2

							if(pixel_z<60)
								pixel_z=60

							if(Next_Step>=1)

								step_towards(src,Hoop)
								Next_Step=0
							if(loc==Hoop:loc&&pixel_z>=60)
								Half_Dist2=0
						while(pixel_z>60)
							sleep(0.1)
							pixel_z-=8




					Swat()
						if(Owner)
							Owner=null
						src.dir=pick(NORTH,SOUTH,EAST,WEST,NORTHWEST,NORTHEAST,SOUTHWEST,SOUTHEAST)
						walk(src,src.dir,1,2)
						spawn(1.5)
							animate(src,pixel_z=0,time=2)
							spawn(2)
								walk(src,0)
					Shoot(Roll,Goal,Tiles,Distance)
						var
							Shooter=Owner
							list/Defenders=list()
							NewRoll=roll("1d20")
							Defend_Roll=0

						if(Game:TeamOne:Find(Shooter))

							for(var/mob/m in Game:TeamTwo)
								if(get_dist(m,Shooter)==1)
									Defenders.Add(m)
						else if(Game:TeamTwo:Find(Shooter))

							for(var/mob/m in Game:TeamOne)
								if(get_dist(m,Shooter)==1)
									Defenders.Add(m)
						if(length(Defenders))
							Defend_Roll=roll("[length(Defenders)]d10")+length(Defenders)
							NewRoll=round(NewRoll*0.75)


						Shooter:dir=get_dir(Shooter,Goal)
						Shooting=1

						JumpShot(Defenders)

						Owner=null
						spawn(6)
							if(Defend_Roll>NewRoll)
								Steal(2,Shooter)
								Swat()
							else
								Soar()


								Swish(Goal,Roll)
								if(Roll)
									animate(src,pixel_z=0,time=3)
									/*if(Distance==3)

									*/
								else
									Swat()
							Shooting=0
							icon_state="rock"

					Handles()
						spawn(0.1)
							if(Owner)
								walk(src,0)
								loc=Owner:loc
								var/OOB=0
								for(var/obj/Sports/Basketball/Bounds/B in loc)

									OOB=1
								if(OOB)
									Owner=null
									loc=initial(loc)
									pixel_z=initial(pixel_z)
									pixel_x=initial(pixel_x)
									pixel_y=initial(pixel_y)
								else
									Handles()
					Dribble()
						if(Owner)
							animate(src,pixel_y=-12,pixel_x=8*CrossOver,time=2)
							spawn(2)
								if(Owner)
									animate(src,pixel_y=8,time=2)
									spawn(2)
										Dribble()
								else
									animate(src,pixel_y=initial(pixel_y),pixel_x=initial(pixel_x))
						else
							animate(src,pixel_y=initial(pixel_y),pixel_x=initial(pixel_x))

				New()
					animate(src,transform=matrix())