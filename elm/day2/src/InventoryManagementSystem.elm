module InventoryManagementSystem exposing (..)

import List.Extra


checksum : List String -> number
checksum list =
    case List.foldl sumMeansurements ( 0, 0 ) list of
        ( x, y ) ->
            x * y


sumMeansurements candidate ( x, y ) =
    let
        g =
            group candidate
    in
        ( x + (measureDouble g), y + (measureTriple g) )


type alias ParsedCandidate =
    List ( Char, List Char )


group : String -> ParsedCandidate
group candidate =
    candidate
        |> String.toList
        |> List.Extra.gatherEquals


measureDouble : ParsedCandidate -> number
measureDouble =
    measure 2


measureTriple : ParsedCandidate -> number
measureTriple =
    measure 3


measure : Int -> ParsedCandidate -> number
measure count candidate =
    let
        remainingCount =
            count - 1

        check =
            \( _, remaining ) -> List.length remaining == remainingCount
    in
        if List.any check candidate then
            1
        else
            0
