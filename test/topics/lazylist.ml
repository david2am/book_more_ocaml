open Questions.Lazy_list

let q_1 = "Write a function which, given a list of integers representing expenses, removes them from a budget,
again represented by an integer."

let test_1 () =
  let expected = [1;2;4;8;16] in
  let actual = ltake (dseq 1) 5 in

  Alcotest.(check (int |> list)) "same int list" expected actual

let q_2 = "Write a function to return the nth element of a lazy list where element zero is the head of the list"

let test_2 () =
  let expected = [0;1;2;3] in
  let actual = ltake (lseq @@ 0) 4 in

  Alcotest.(check (int |> list)) "same int list" expected actual

let q_3 = "Write a function which, given a list, returns the lazy list forming a repeated sequence taken
from that list. For example, given the list [1; 2; 3] it should return a lazy list with elements
1, 2, 3, 1, 2, 3, 1, 2 . . ."

let test_3 () =
  let expected = [0;1;2;3] in
  let actual = ltake (cycleseq [0;1;2;3]) 4 in

  Alcotest.(check (int |> list)) "same int list" expected actual

let q_4 = "Write a lazy list whose elements are the fibonacci numbers 0, 1, 1, 2, 3, 5, 8 . . . whose first two
elements are zero and one by definition, and each ensuing element is the sum of the previous two."

let test_4 () =
  let expected = [0;1;1;2;3;5;8;13] in
  let actual = ltake (lfib 0 1) 8 in

  Alcotest.(check (int |> list)) "same int list" expected actual

let q_5 = "Write the function unleave which, given a lazy list, returns two lazy lists, one containing elements
at positions 0, 2, 4, 6 . . . of the original list, and the other containing elements at positions 1, 3, 5, 7 . . ."

let test_5 () =
  let expected_even = [0; 2; 4; 6; 8; 10; 12] in
  let expected_odd  = [1; 3; 5; 7; 9; 11; 13] in

  let even, odd = unleave (lseq 0) in

  let actual_even = ltake even 7 in
  let actual_odd = ltake odd 7 in

  let expected = expected_even @ expected_odd in
  let actual = actual_even @ actual_odd in

  Alcotest.(check (int |> list)) "same int list" expected actual

let q_6 = "Alphanumeric labels in documents go A, B, C, . . . , X, Y, Z, AA, AB, . . . , BA, BB, . . . AAA, . . . Write
the lazy list containing strings representing this sequence. You may (mis)use the Standard Library
function Char.escaped to convert a character to a string"

let test_6 () =
  let expected = ["A"; "B"; "C"; "D"; "E"; "F"; "G"; "H"; "I"; "J"; "K"; "L"; "M"; "N"; "O";"P"; "Q"; "R"; "S"; "T"; "U"; "V"; "W"; "X"; "Y"; "Z"; "AA"; "AB"; "AC"; "AD"] in
  let actual = ltake (labels_from "A") 30 in

  Alcotest.(check (string |> list)) "same string list" expected actual