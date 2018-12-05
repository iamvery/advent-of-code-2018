module Calibration exposing (..)

import Iter


calculate =
    List.foldl (+) 0


type alias Frequency =
    Int


type alias Changes =
    List Frequency


calibrate : Changes -> Frequency
calibrate changes =
    changes
        |> Iter.cycle
        |> calibrate_ ( [], 0 )
        |> Tuple.second


calibrate_ : ( Changes, Frequency ) -> Iter.Iter Frequency Changes -> ( Changes, Frequency )
calibrate_ ( history, frequency ) changes =
    case Iter.step changes of
        ( _, Nothing ) ->
            ( history, frequency )

        ( nextChanges, Just change ) ->
            let
                newFrequency =
                    frequency + change
            in
                if List.member frequency history then
                    ( history, frequency )
                else
                    calibrate_ ( frequency :: history, newFrequency ) nextChanges
