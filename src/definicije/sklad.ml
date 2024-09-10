type t = {seznam : string list
}

(* type t = 
|prazen
|nekaj of char * t *)

let vrh sklad = match sklad.seznam with
|[] -> ""
|x :: _ -> x

let prazen = {seznam = [""]}

let na vrh sklad =
  let rec aux acc vrh = match vrh with
  |[] -> {seznam = acc}
  |x :: xs -> aux (x :: acc) xs
  in aux sklad.seznam vrh

let z sklad = match sklad.seznam with
|[] -> {seznam = []}
|_ :: xs -> {seznam = xs}