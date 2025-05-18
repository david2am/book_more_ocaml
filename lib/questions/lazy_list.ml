(* helpers *)
type 'a lazylist = Cons of 'a * (unit -> 'a lazylist)

let rec ltake (Cons (h, tf)) n =
  match n with
  | 0 -> []
  | _ -> h::ltake (tf ()) (n - 1)

(* 
1. Write the lazy list whose elements are the numbers 1, 2, 4, 8, 16 . . . What is its type?
*)
let rec dseq n = Cons (n, fun () -> dseq (n * 2))


(* 
2. Write a function to return the nth element of a lazy list where element zero is the head of the list.
*)
let rec lseq n = Cons (n, fun () -> lseq (n + 1))


(* 
3. Write a function which, given a list, returns the lazy list forming a repeated sequence taken
from that list. For example, given the list [1; 2; 3] it should return a lazy list with elements
1, 2, 3, 1, 2, 3, 1, 2 . . .
*)
let cycleseq lst =
  let rec make_lazy = function
    | [] -> make_lazy lst
    | h::t -> Cons (h, fun () -> make_lazy t)
  in
  match lst with
  | [] -> failwith "I shouldn't receive an empty list"
  | _ -> make_lazy lst

(* 
4. Write a lazy list whose elements are the fibonacci numbers 0, 1, 1, 2, 3, 5, 8 . . . whose first two
elements are zero and one by definition, and each ensuing element is the sum of the previous two.
*)
let rec lfib a b = Cons (a, fun () -> lfib b (a + b))


(* 
5. Write the function unleave which, given a lazy list, returns two lazy lists, one containing elements
at positions 0, 2, 4, 6 . . . of the original list, and the other containing elements at positions 1, 3, 5, 7 . . .
*)
let unleave ll = 
  let rec even (Cons (h, tf)) = 
    Cons (h, fun () ->
      let (Cons (_, tf')) = tf () in
      try
        even @@ tf' ()
      with
        _ -> failwith "end of list reached"
    )
  in
  let rec odd (Cons (_, tf)) =
    let (Cons (h', tf')) = tf () in
    Cons (h', fun () ->
      try
        odd @@ tf' ()
      with
        _ -> failwith "end of list reached"
    )
  in
  (even ll, odd ll)

(* 
6. Alphanumeric labels in documents go A, B, C, . . . , X, Y, Z, AA, AB, . . . , BA, BB, . . . AAA, . . . Write
the lazy list containing strings representing this sequence. You may (mis)use the Standard Library
function Char.escaped to convert a character to a string.
*)

let rec increment_label label =
  let len = String.length label in
  if len = 0 then "A"
  else
    let last_char = label.[len - 1] in
    let prefix = String.sub label 0 (len - 1) in
    if last_char = 'Z' then
      increment_label prefix ^ "A"
    else
      prefix ^ (Char.code last_char + 1 |> Char.chr |> Char.escaped)

let rec labels_from label = Cons (label, fun () -> labels_from (increment_label label))

let llabels = labels_from "A"