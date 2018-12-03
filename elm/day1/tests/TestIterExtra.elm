module TestIterExtra exposing (..)

import Expect exposing (Expectation)
import Test exposing (..)
import Iter
import Iter.Extra


input =
    Iter.fromList [ [], [], [ 1 ] ]


suite : Test
suite =
    describe "Iter.Extra"
        [ describe "takeWhile"
            [ test "it works" <|
                \_ ->
                    Iter.takeWhile List.isEmpty input
                        |> Iter.toList
                        |> Expect.equal [ [], [] ]
            ]
        , describe "dropWhile"
            [ test "it works" <|
                \_ ->
                    Iter.Extra.dropWhile List.isEmpty input
                        |> Iter.toList
                        |> Expect.equal [ [ 1 ] ]
            ]
        ]
