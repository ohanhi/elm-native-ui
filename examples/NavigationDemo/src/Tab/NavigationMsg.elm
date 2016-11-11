module Tab.NavigationMsg exposing (NavigationMsg(Exit, Jump, None, Pop, Push))


type NavigationMsg
    = Exit
    | Jump String
    | None
    | Pop
    | Push
