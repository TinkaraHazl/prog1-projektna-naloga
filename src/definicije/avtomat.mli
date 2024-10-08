type t

val prazen_avtomat : Stanje.t -> t
val dodaj_nesprejemno_stanje : Stanje.t -> t -> t
val dodaj_sprejemno_stanje : Stanje.t -> t -> t
val dodaj_prehod : Stanje.t -> char -> string -> Stanje.t -> string list -> t -> t
val prehodna_funkcija : t -> Stanje.t -> string -> char -> (Stanje.t * string list) option
val zacetno_stanje : t -> Stanje.t
val zacetni_sklad : t-> Sklad.t
val seznam_stanj : t -> Stanje.t list
val seznam_prehodov : t -> (Stanje.t * string * char * Stanje.t * string list) list
val je_sprejemno_stanje : t -> Stanje.t -> bool
val vsota_prvih_dveh : t
