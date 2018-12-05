module Example exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)
import InventoryManagementSystem
import Input


suite : Test
suite =
    describe "InventoryManagementSystem"
        [ describe "checksum"
            [ test "example" <|
                \_ -> InventoryManagementSystem.checksum Input.example |> Expect.equal 12
            ]
        , describe "group"
            [ test "candidate with double and triple" <|
                \_ ->
                    InventoryManagementSystem.group "bababc"
                        |> Expect.equal
                            [ ( 'b', [ 'b', 'b' ] )
                            , ( 'a', [ 'a' ] )
                            , ( 'c', [] )
                            ]
            ]
        , describe "measureDouble"
            [ test "group with double" <|
                \_ -> InventoryManagementSystem.measureDouble [ ( 'a', [ 'a' ] ) ] |> Expect.equal 1
            , test "group with triple" <|
                \_ -> InventoryManagementSystem.measureDouble [ ( 'a', [ 'a', 'a' ] ) ] |> Expect.equal 0
            ]
        ]
