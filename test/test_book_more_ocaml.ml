open Topics

let () =
  Alcotest.run "My Project" [
    "Book test cases", [
      Alcotest.test_case Fold.q_1 `Quick Fold.test_1;
      Alcotest.test_case Fold.q_2 `Quick Fold.test_2;
      Alcotest.test_case Fold.q_3 `Quick Fold.test_3;
      Alcotest.test_case Fold.q_4 `Quick Fold.test_4;
      Alcotest.test_case Fold.q_5 `Quick Fold.test_5;
      Alcotest.test_case Fold.q_6 `Quick Fold.test_6;
      Alcotest.test_case Fold.q_7 `Quick Fold.test_7;
      Alcotest.test_case Fold.q_8 `Quick Fold.test_8;

      Alcotest.test_case Lazylist.q_1 `Quick Lazylist.test_1;
      Alcotest.test_case Lazylist.q_2 `Quick Lazylist.test_2;
      Alcotest.test_case Lazylist.q_3 `Quick Lazylist.test_3;
      Alcotest.test_case Lazylist.q_4 `Quick Lazylist.test_4;
      Alcotest.test_case Lazylist.q_5 `Quick Lazylist.test_5;
      Alcotest.test_case Lazylist.q_6 `Quick Lazylist.test_6;
    ];
  ]