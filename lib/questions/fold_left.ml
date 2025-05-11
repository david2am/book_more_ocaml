(*
Questions
1. Write a function which, given a list of integers representing expenses, removes them from a budget,
again represented by an integer.
2. Calculate the length of a list using one of the fold_ functions.
3. Use one of the fold_ functions to find the last element of list, if any. Behave sensibly if the list is
empty.
4. Write a function to reverse a list, using one of the fold_ functions.
5. Write a version of List.mem using one of the fold_ functions. Now setify can be defined entirely
using folds.
6. Use a fold to write a function which, given a list of non-empty strings representing words, returns a
single string where the words are separated by spaces. Comment on its efficiency.
7. Use fold_tree to write a function which calculates the maximum depth of a tree. What is its type?
8. Compare the time efficiency of one or more of your functions with the system implementation of
the same function (for example, our fold-based member function vs. List.mem) with regard to both
computational complexity and actual time taken.
9. Comment on whether the use of folds in each of Questions 1–7 is good style.
*)

let print expenses budget =
  print_endline (expenses ^ budget)