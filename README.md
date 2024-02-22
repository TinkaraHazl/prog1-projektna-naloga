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
- $\delta : Q \times \Sigma \to Q$ prehodna funkcija.
- $q_0 \in Q$ začetno stanje,
- $Z \in \Gamma$ začetni simbol sklada
- $F \subseteq Q$ množica sprejemnih stanj


