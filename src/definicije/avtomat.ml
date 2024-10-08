type stanje = Stanje.t
type sklad = Sklad.t

type t = {
  stanja : stanje list;
  zacetno_stanje : stanje;
  sprejemna_stanja : stanje list;
  prehodi : (stanje * string * char * stanje * string list) list;
  zacetni_sklad : sklad
}

let prazen_avtomat zacetno_stanje =
  {
    stanja = [ zacetno_stanje ];
    zacetno_stanje;
    sprejemna_stanja = [];
    prehodi = [];
    zacetni_sklad = Sklad.prazen
  }

let dodaj_nesprejemno_stanje stanje avtomat =
  { avtomat with stanja = stanje :: avtomat.stanja }

let dodaj_sprejemno_stanje stanje avtomat =
  {
    avtomat with
    stanja = stanje :: avtomat.stanja;
    sprejemna_stanja = stanje :: avtomat.sprejemna_stanja;
  }

let dodaj_prehod stanje1 znak vrh1 stanje2 (vrh2 : string list) avtomat =
  { avtomat with prehodi = (stanje1, vrh1, znak, stanje2, vrh2) :: avtomat.prehodi }

let prehodna_funkcija avtomat stanje znak vrh =
  (* let vrh = Option.get Sklad.na_vrhu sklad in *)
  match
    List.find_opt
      (fun (stanje1, znak', vrh1 , _stanje2, _vrh22) -> 
        stanje1 = stanje && znak = znak' && vrh1 = vrh)
      avtomat.prehodi
  with
  | None -> None
  | Some (_, _, _, stanje2, vrh2) -> Some (stanje2, vrh2)

let zacetno_stanje avtomat = avtomat.zacetno_stanje
let seznam_stanj avtomat = avtomat.stanja
let seznam_prehodov avtomat = avtomat.prehodi
let zacetni_sklad avtomat = avtomat.zacetni_sklad

let je_sprejemno_stanje avtomat stanje =
  List.mem stanje avtomat.sprejemna_stanja
let vsota_prvih_dveh =
  let q1 = Stanje.iz_niza "q1"
  and q2 = Stanje.iz_niza "q2"
  and q3 = Stanje.iz_niza "q3"
  and q4 = Stanje.iz_niza "q4"
  in
  prazen_avtomat q1  
  |> dodaj_nesprejemno_stanje q2 |> dodaj_nesprejemno_stanje q3
  |> dodaj_sprejemno_stanje q4
  |> dodaj_prehod q1 'a' "" q1 ["x"]
  |> dodaj_prehod q1 'a' "x" q1 ["x";"x"]
  |> dodaj_prehod q1 'b' "" q2 ["x"]
  |> dodaj_prehod q1 'b' "x" q2 ["x";"x"]
  |> dodaj_prehod q2 'b' "" q2 ["x"]
  |> dodaj_prehod q2 'b' "x" q2 ["x";"x"]
  |> dodaj_prehod q1 'c' "x" q3 []
  |> dodaj_prehod q1 'c' "" q4 []
  |> dodaj_prehod q2 'c' "" q3 ["ne"]
  |> dodaj_prehod q2 'c' "x" q3 []
  |> dodaj_prehod q3 'c' "" q3 ["ne"]
  |> dodaj_prehod q3 'c' "x" q3 []
  |> dodaj_prehod q3 'c' "" q4 []
  |> dodaj_prehod q4 'c' "" q4 []
  