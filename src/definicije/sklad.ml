type t = {seznam : string list}

let prazen_sklad = {seznam = []}

let na_sklad znak sklad = {seznam = znak :: sklad.seznam}

let z_sklada sklad = match sklad.seznam with
|[] -> {seznam = []}
|_ :: xs -> {seznam = xs}