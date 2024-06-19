turf/BH
	layer = 1000
	main
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/BH/main1)
	main1
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/BH/main)

	ea1
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/BH/ea2)
	ea2
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/BH/ea1)

	eb1
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/BH/eb2)
	eb2
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/BH/eb1)

	ec1
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/BH/ec2)
	ec2
		Entered(mob/M)
			if(istype(M,/mob))
				M.loc=locate(/turf/BH/ec1)
