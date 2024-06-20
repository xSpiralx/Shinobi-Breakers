mob/var/RelayerHairCheck = 0

mob/proc/HairCheck()
    if (RelayerHairCheck < 1)
        for (var/i in hair_stack)
            overlays -= i
        for (var/i in hair_stack)
            overlays += i
        src << output("Debug Hair Relayered!", "outputall.output")
        RelayerHairCheck = 1
