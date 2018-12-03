module Calibration exposing (..)

import Iter
import Iter.Extra
import List.More


calculate =
    List.foldl (+) 0


calibrate changes =
    changes
        |> Iter.cycle
        |> Iter.accumulate (+) 0
        |> Iter.accumulate (::) [ 0 ]
        |> Iter.map List.More.duplicates
        |> Iter.Extra.dropWhile List.isEmpty
        |> Iter.take 1
        |> Iter.toList
        |> List.head
        |> Maybe.withDefault []
        |> List.head
        |> Maybe.withDefault 0
