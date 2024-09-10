type t = { avtomat : Avtomat.t; trak : Trak.t; stanje : Stanje.t; sklad: Sklad.t }

let pozeni avtomat trak =
  { avtomat; trak; stanje = Avtomat.zacetno_stanje avtomat; sklad = Sklad.prazen }

let avtomat { avtomat; _ } = avtomat
let trak { trak; _ } = trak
let stanje { stanje; _ } = stanje

let korak_naprej { avtomat; trak; stanje; sklad } =
  if Trak.je_na_koncu trak then None
  else
    let novo_stanje_vrh =
      Avtomat.prehodna_funkcija avtomat stanje (Sklad.vrh sklad) (Trak.trenutni_znak trak)
    in
    match novo_stanje_vrh with
    | None -> None
    | Some (stanje', vrh') ->
        Some { avtomat; trak = Trak.premakni_naprej trak; stanje = stanje'; sklad = (Sklad.na vrh' (Sklad.z sklad)) }

let je_v_sprejemnem_stanju { avtomat; stanje; _ } =
  Avtomat.je_sprejemno_stanje avtomat stanje
