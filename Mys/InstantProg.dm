mob/proc/InstantProg() // Keep this uncommented for global instant prog turned on
    if (progress_speed < 11)
        progress_speed = 1000
        src << output("Instant Prog turned on!")

/*mob/proc/InstantProg() // Uncomment when you want instant prog off
    if (progress_speed > 11)
        progress_speed = 10
        src << output("Instant Prog turned off!")*/
