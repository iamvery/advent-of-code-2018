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
                \_ -> Calibration.calibrate [ 1, -2, 3, 1 ] |> Expect.equal 2
            , test "example 2" <|
                \_ -> Calibration.calibrate [ 1, -1 ] |> Expect.equal 0
            , test "example 3" <|
                \_ -> Calibration.calibrate [ 3, 3, 4, -2, -4 ] |> Expect.equal 10
            , test "example 4" <|
                \_ -> Calibration.calibrate [ -6, 3, 8, 5, -6 ] |> Expect.equal 5
            , test "example 5" <|
                \_ -> Calibration.calibrate [ 7, 7, -2, -7, -4 ] |> Expect.equal 14
            ]
        ]
