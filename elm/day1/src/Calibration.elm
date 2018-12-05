module Calibration exposing (..)

import Iter exposing (Iter)
import Set exposing (Set)


calculate =
    List.foldl (+) 0


type alias Frequency =
    Int


type alias Changes =
    List Frequency


type alias History =
    Set Frequency


calibrate : Changes -> Frequency
calibrate =
    Iter.cycle >> calibrate_ ( Set.empty, 0 ) >> Tuple.second


calibrate_ : ( History, Frequency ) -> Iter Frequency Changes -> ( History, Frequency )
calibrate_ ( history, frequency ) changes =
    case Iter.step changes of
        ( _, Nothing ) ->
            ( history, frequency )

        ( nextChanges, Just change ) ->
            let
                newFrequency =
                    frequency + change
            in
                if Set.member frequency history then
                    ( history, frequency )
                else
                    calibrate_ ( Set.insert frequency history, newFrequency ) nextChanges
