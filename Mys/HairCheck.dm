mob/var/RelayerHairCheck = 0

mob/proc/HairCheck()
    if (RelayerHairCheck < 2)
        overlays = null
        for (var/i in hair_stack)
            overlays -= i
        for (var/i in hair_stack)
            overlays += i
        src << output("One time overlays removed, hair relayered!", "outputall.output")
        RelayerHairCheck = 2
