(*
1. Show how to update a reference without using the := operator.
2. Using functions from the “Time Functions” section of the documentation to the Unix module, write
a program which, when run, returns a string containing the time and date, for example "It is
2:45 on Wednesday 8 January 2014".
3. What is the difference between type t = {x : int ref} and type t = {mutable x : int}? What
are the advantages and disadvantages of each?
4. Define a record of six items a...f where a and b have the same type as one another, c and d have the
same type as one another and e and f have the same type as one another.
5. Records are used in the module Gc which controls OCaml’s garbage collector (a garbage collector
is a system which automatically reclaims space the program has finished with as the program is
running). Use the data structures and functions in the Gc module to write programs which:
(a) write a summary of the state of the garbage collector to a text file; and
(b) alter the verbosity of the garbage collector as defined in the control record.
*)

open Unix

let convert_weekday = function
| 0 -> "Sunday"
| 1 -> "Monday"
| 2 -> "Tuestday"
| 3 -> "Wednessday"
| 4 -> "Thursday"
| 5 -> "Friday"
| _ -> "Saturday"

let convert_month = function
| 0 -> "January"
| 1 -> "February"
| 2 -> "March"
| 3 -> "April"
| 4 -> "May"
| 5 -> "June"
| 6 -> "July"
| 7 -> "August"
| 8 -> "September"
| 9 -> "October"
| 10 -> "November"
| _ -> "December"

let convert_year y = y + 1900 

let say_the_date () =
  let { tm_hour; tm_min; tm_wday; tm_mday; tm_mon; tm_year; _ } = time () |> localtime in
  Printf.printf "It is %i:%i on %s %i %s %i" tm_hour tm_min (convert_weekday tm_wday) tm_mday (convert_month tm_mon) (convert_year tm_year)
