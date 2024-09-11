# Deterministični skladovni avtomati
Projekt vsebuje implementacijo skladovnega avtomatoa, torej končnih avtomata, opremljenega s skladom. 

Končni avtomati začnejo v enem stanju, nato pa glede na trenutni simbol iz traka in trenutno stanje preidejo v drugo stanje. Izpis, ko avtomat gre čez celoten trak, je odvisen od trenutnega simbola in stanja.

Skladovni avtomati se od navadnih končnih avtomatov razlikujejo na dva načina:
- za izbiro prehoda lahko uporabijo tudi vrh sklada
- vrh sklada lahko spreminjajo glede na izbiro prehoda

## Matematična definicija
Končni avtomat je definiran kot sedmerica $(Q, \Sigma, \Gamma, \delta, q_0, Z, F,)$, kjer so:
- $Q$ množica stanj,
- $\Sigma$ končna množica simbolov oz. abeceda,
- $\Gamma$ končna množica, ki se imenuje skladovna abeceda
- $\delta \subseteq Q \times (\Sigma \cup \\{\varepsilon\\}) \times \Gamma \times Q \times \Gamma^\*$, končna podmnožica, imenovana prehodna relacija, kjer $\varepsilon$ oznažuje prazen niz, $\Gamma^*$ pa množico vseh končnih podnizov $\Gamma$
- $q_0 \in Q$ začetno stanje
- $Z \in \Gamma$ začetni simbol sklada
- $F \subseteq Q$ množica sprejemnih stanj

$\delta$ lahko ekvilalentno predstavimo kot prehodno funkcijo, ki slika iz $Q \times (\Sigma \cup \\{\varepsilon\\}) \times \Gamma$ v končne podmnožice $Q \times \Gamma^\*$. Tako element $(p,a,A,q,\alpha) \in \delta$ razumemo kot prehod, ki vzame stanje $q$ in glede na $a$, trenutni znak iz traka, in glede na $A$, znak na vrhu sklada, vrne novo stanje $p$ in spremeni sklad, tako da je zdaj na vrhu $\alpha$. Sklad lahko spremenimo tako, da odvzamemo element na vrhu ali ga dodamo.

## Moj avtomat
Avtomat, ki je implementiran v tej projektni nalogi, vrednoti nize oblike $a^ib^jc^k$, sprejme pa takšne, za katere velja $i+j<k$.
Tako na primer: 
- sprejme niz oblike $"aabbccccc"$
- ne sprejme niza oblike $"abcc"$
- niz oblike $"acbcccc"$ označi za neveljavnega, prav tako niz $"š"$.

### Uporaba
Avtomat poženemo tako, da v terminal napišemo **dune build**, ki zgradi datoteko _tekstovniVmesnik.exe_. Tekstovni vmesnik nato odpremo tako, da v terminal napišemo **./tekstovniVmesnik.exe**.
### Implementacija avtomata
Avtomat je sestavljen iz dveh map, ki sta razdeljeni na module:
1. V mapi **definicije** najdemo:
   -  **avtomat.ml**, kjer je definiran avtomat in funkcije, potrebne za implementacijo avtomata
   -  **sklad.ml**, kjer je definiran tip sklada in funkcije, s katerimi sklad spreminjamo
   -  **trak.ml**, kjer je definiran trak in funkcije, s katerimi se po traku premikamo
   -  **stanje.ml**, kjer je definiran tip stanje
   -  **zagnaniAvtomat.ml**, kjer je definiran "zagnani avtomat", torej avtomat, ki mu lahko spreminjamo trenutno stanje in sklad ter se z njim premikamo po traku. V datoteki so prav tako definirane funkcije, s katerimi avtomat zaženemo ter prehajamo med stanji.

2. V mapi **tekstovniVmesnik** je datoteka **tekstovniVmesnik.ml**, v kateri je implementiran tekstovni vmesnik, ki posreduje med uporabnikom in avtomatom.
