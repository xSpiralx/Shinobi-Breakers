datum/var
    min_zoom_size = 0.10
    max_zoom_size = 2.10
    zoom_size = 1.0

    zooming_in = null ; zooming_out = null

/*hebrons here just a little snippet
 so you get the jist this should
 work im guessing idk never really
 used something like this i hope it
 works for your though.*/

datum/proc
#define MAP_ZOOM_PERCENTAGE 0.1
#define ZOOM_TRANSITION_TIME 1
#define DEFUALT_ZOOM_SIZE 1.4
    zoom_in()   //proceedure for zooming in.
        while(zooming_in)   //while you are zooming in.
            sleep(ZOOM_TRANSITION_TIME)
            .=..()
            if(zoom_size > max_zoom_size)
                zoom_size = DEFUALT_ZOOM_SIZE   //set's the zoom size back to default.
                return

            zoom_size += MAP_ZOOM_PERCENTAGE    //add's on to the zoom size.
            winset(usr, "mappane.map", "zoom=[zoom_size]")

    zoom_out()
        while(zooming_out)  //while you are zooming out.
            world.log << "call"
            sleep(ZOOM_TRANSITION_TIME)
            .=..()

            if(zoom_size < min_zoom_size)
                zoom_size = DEFUALT_ZOOM_SIZE   //set's the zoom size back to default.
                return

            zoom_size -= MAP_ZOOM_PERCENTAGE//reduces the zoom size.
            winset(usr, "mappane.map", "zoom=[zoom_size]")

datum
    verb
        Zoom_In()
            zooming_out = null
            zooming_in = 1
            src.zoom_in()

        Zoom_Out()
            zooming_in = null
            zooming_out = 1
            src.zoom_out()
