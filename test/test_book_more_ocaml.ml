open Questions.Fold_left

let q_1 = "Write a function which, given a list of integers representing expenses, removes them from a budget,
again represented by an integer."

let test_1 () =
  let expenses = [1;2;3] in
  let budget = 10 in

  let expected = 4 in
  let actual = budget_after_expenses expenses budget in

  Alcotest.(check int) "same int" expected actual

let q_2 = "Calculate the length of a list using one of the fold_ functions."

let test_2 () =
  let input = [1;2;3] in

  let expected = 3 in
  let actual = length input in

  Alcotest.(check int) "same int" expected actual

let q_3 = "Use one of the fold_ functions to find the last element of list, if any. Behave sensibly if the list is
empty"

let test_3 () =
  let input = [1;2;3] in

  let expected = 3 in
  let actual = last input in

  Alcotest.(check int) "same int" expected actual

let q_4 = "Write a function to reverse a list, using one of the fold_ functions"

let test_4 () =
  let input = [1;2;3] in

  let expected = [3;2;1] in
  let actual = reverse input in

  Alcotest.(check (int |> list)) "same int list" expected actual

let q_5 = "Write a version of List.mem using one of the fold_ functions"

let test_5 () =
  let input = [1;2;3] in

  let expected = true in
  let actual = is_mem 2 input in

  Alcotest.(check bool) "same bool" expected actual

let q_6 = "Use a fold to write a function which, given a list of non-empty strings representing words, returns a
single string where the words are separated by spaces"

let test_6 () =
  let input = ["hola";"mundo";"sono";"io"] in

  let expected = "hola mundo sono io" in
  let actual = join_string input in

  Alcotest.(check string) "same string" expected actual

let q_7 = "Use a fold to write a function which, given a list of non-empty strings representing words, returns a
single string where the words are separated by spaces"

let test_7 () =
  let input = Br (
    1,
    Lf,
    Br (
      2,
      Br (3, Lf, Lf),
      Br (4, Lf, Lf)
    )
  )
  in

  let expected = 3 in
  let actual = tree_depth input in

  Alcotest.(check int) "same string" expected actual

let q_8 = "Use a fold to write a function which, given a list of non-empty strings representing words, returns a
single string where the words are separated by spaces"

let test_8 () =
  let input = Br (1, Lf, Br (2, Br (3, Lf, Lf), Br (4, Lf, Lf))) in

  let expected = 4 in
  let actual = tree_length input in

  Alcotest.(check int) "same string" expected actual

let () =
  Alcotest.run "My Project" [
    "Fold test cases", [
      Alcotest.test_case q_1 `Quick test_1;
      Alcotest.test_case q_2 `Quick test_2;
      Alcotest.test_case q_3 `Quick test_3;
      Alcotest.test_case q_4 `Quick test_4;
      Alcotest.test_case q_5 `Quick test_5;
      Alcotest.test_case q_6 `Quick test_6;
      Alcotest.test_case q_7 `Quick test_7;
      Alcotest.test_case q_8 `Quick test_8;
    ];
  ]