(*
1. Write the lazy list whose elements are the numbers 1, 2, 4, 8, 16 . . . What is its type?
2. Write a function to return the nth element of a lazy list where element zero is the head of the list.
3. Write a function which, given a list, returns the lazy list forming a repeated sequence taken
from that list. For example, given the list [1; 2; 3] it should return a lazy list with elements
1, 2, 3, 1, 2, 3, 1, 2 . . .
4. Write a lazy list whose elements are the fibonacci numbers 0, 1, 1, 2, 3, 5, 8 . . . whose first two
elements are zero and one by definition, and each ensuing element is the sum of the previous two.
5. Write the function unleave which, given a lazy list, returns two lazy lists, one containing elements
at positions 0, 2, 4, 6 . . . of the original list, and the other containing elements at positions 1, 3, 5, 7 . . .
6. Alphanumeric labels in documents go A, B, C, . . . , X, Y, Z, AA, AB, . . . , BA, BB, . . . AAA, . . . Write
the lazy list containing strings representing this sequence. You may (mis)use the Standard Library
function Char.escaped to convert a character to a string.
*)

type 'a lazylist = Cons of 'a * (unit -> 'a lazylist)

let rec dseq n = Cons (n, (fun () -> dseq (n * 2)))