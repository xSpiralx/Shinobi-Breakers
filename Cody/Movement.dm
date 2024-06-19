mob/var
    MovementTiles = 3
    MaxMovementTiles = 3
    UsingMoveTiles = 0
    list/MovementGhosts = list()
mob/MovementGhost


client/Move()
    if(!usr.MovementTiles && usr.UsingMoveTiles)
        return
    if(usr.UsingMoveTiles)
        usr.MovementTiles--
    ..()