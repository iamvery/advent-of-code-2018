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
        ]
