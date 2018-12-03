module TestListMore exposing (..)

import Expect exposing (Expectation)
import Test exposing (..)
import List.More


suite : Test
suite =
    describe "List.More"
        [ describe "difference"
            [ test "returns items in first list after second list is removed" <|
                \_ -> List.More.difference [ 1, 2 ] [ 2 ] |> Expect.equal [ 1 ]
            ]
        , describe "duplicates"
            [ test "none" <|
                \_ -> List.More.duplicates [ 1, 2, 3 ] |> Expect.equal []
            , test "one" <|
                \_ -> List.More.duplicates [ 1, 2, 1 ] |> Expect.equal [ 1 ]
            ]
        ]
