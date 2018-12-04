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


calibrate_ : ( Changes, Frequency ) -> Iter.Iter Frequency (List Frequency) -> ( Changes, Frequency )
calibrate_ ( frequencies, frequency ) changes =
    case Iter.step changes of
        ( _, Nothing ) ->
            ( frequencies, frequency )

        ( nextChanges, Just change ) ->
            let
                newFrequency =
                    frequency + change
            in
                if List.member frequency frequencies then
                    ( frequencies, frequency )
                else
                    calibrate_ ( frequency :: frequencies, newFrequency ) nextChanges
