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
        ]
