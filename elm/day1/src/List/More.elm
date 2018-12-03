module List.More exposing (difference, duplicates)

import Set


remove element list =
    case list of
        [] ->
            list

        e :: l ->
            if e == element then
                l
            else
                e :: (remove element l)


difference l1 l2 =
    List.foldl remove l1 l2


duplicates list =
    difference list (Set.fromList list |> Set.toList)
