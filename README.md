# Nedeterministični skladovni avtomati
Projekt vsebuje implementacijo skladovnih avtomatov, torej končnih avtomatov, opremljenih s skladom. 

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

