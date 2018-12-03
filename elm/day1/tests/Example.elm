module Example exposing (..)

import Expect exposing (Expectation)
import Test exposing (..)
import Calibration


suite : Test
suite =
    describe "calibration"
        [ test "example 1" <|
            \_ -> Calibration.calculate ([ 1, 1, 1 ]) |> Expect.equal 3
        , test "example 2" <|
            \_ -> Calibration.calculate ([ 1, 1, -2 ]) |> Expect.equal 0
        , test "example 3" <|
            \_ -> Calibration.calculate ([ -1, -2, -3 ]) |> Expect.equal -6
        , describe "calibrate"
            [ test "example 1" <|
                \_ -> Calibration.calibrate [ 1, -2, 3, 1 ] |> Expect.equal [ [] ]
            ]
        , describe "difference"
            [ test "returns items in first list after second list is removed" <|
                \_ -> Calibration.difference [ 1, 2 ] [ 2 ] |> Expect.equal [ 1 ]
            ]
        , describe "duplicates"
            [ test "none" <|
                \_ -> Calibration.duplicates [ 1, 2, 3 ] |> Expect.equal []
            , test "one" <|
                \_ -> Calibration.duplicates [ 1, 2, 1 ] |> Expect.equal [ 1 ]
            ]
        ]
