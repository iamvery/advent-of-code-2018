module InventoryManagementSystem exposing (..)

import List.Extra
import EditDistance exposing (levenshteinOfStrings)


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


locateSimilarIDs : List String -> List ( String, String )
locateSimilarIDs ids =
    pairs ids
        |> List.filter (\( x, y ) -> levenshteinOfStrings x y == 1)


pairs : List a -> List ( a, a )
pairs list =
    case list of
        [] ->
            []

        h :: t ->
            eachPair h t ++ pairs t


eachPair : a -> List a -> List ( a, a )
eachPair element list =
    case list of
        [] ->
            []

        h :: t ->
            ( element, h ) :: eachPair element t
