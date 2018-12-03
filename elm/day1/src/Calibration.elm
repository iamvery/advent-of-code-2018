module Calibration exposing (..)

import Iter
import Set


calculate =
    List.foldl (+) 0


remove element list =
    case list of
        [] ->
            list

        e :: l ->
            if e == element then
                l
            else
                e :: (remove element l)


difference l1 l2 =
    List.foldl remove l1 l2


duplicates list =
    difference list (Set.fromList list |> Set.toList)


makeIter st f =
    Iter.It { state = st, next = f }


dropWhile pred (Iter.It it) =
    makeIter it.state
        (\s ->
            case it.next s of
                Just ( s_, x ) ->
                    if pred x then
                        Nothing
                    else
                        Just ( s_, x )

                Nothing ->
                    Nothing
        )


calibrate changes =
    Iter.cycle changes
        |> Iter.accumulate (+) 0
        |> Iter.accumulate (::) []
        |> Iter.map duplicates
        -- find duplicates in each list here!
        --|> dropWhile List.isEmpty
        -- filter on non-empty lists, first one is our match!
        |> Iter.take 10
        |> Iter.toList
