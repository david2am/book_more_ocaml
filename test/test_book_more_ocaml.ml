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

let () =
  Alcotest.run "My Project" [
    "Fold test cases", [
      Alcotest.test_case q_1 `Quick test_1;
      Alcotest.test_case q_2 `Quick test_2;
    ];
  ]