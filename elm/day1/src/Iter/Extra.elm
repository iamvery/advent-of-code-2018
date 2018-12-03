module Iter.Extra exposing (..)

import Iter


makeIter st f =
    Iter.It { state = st, next = f }


dropWhile : (a -> Bool) -> Iter.Iter a b -> Iter.Iter a b
dropWhile pred (Iter.It it) =
    makeIter it.state
        (\s -> dropWhile_ pred s it.next)


dropWhile_ pred s n =
    case n s of
        Just ( s_, x ) ->
            if pred x then
                dropWhile_ pred s_ n
            else
                Just ( s_, x )

        Nothing ->
            Nothing
