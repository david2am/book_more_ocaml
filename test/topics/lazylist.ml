open Questions.Lazy_list

let q_1 = "Write a function which, given a list of integers representing expenses, removes them from a budget,
again represented by an integer."

let test_1 () =
  let expected = 4 in
  let actual = 4 in

  Alcotest.(check int) "same int" expected actual
