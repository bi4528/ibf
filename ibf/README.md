# Interpolacija z Baricentrično Lagrangevo metodo

Ta programski modul omogoča interpolacijo funkcij na poljubnih intervalih z uporabo Baricentrične Lagrangeve metode. Metoda omogoča določanje interpolacijskega polinoma na intervalu [a, b] glede na podane interpolacijske točke in funkcijo.

### Generiranje Čebiševih točk

Funkcija `chebyshev_points(n)` omogoča generiranje `n` Čebiševih točk na intervalu [-1, 1].


### Baricentrična Lagrangeva interpolacija

Funkcija `baricentric_lagrange_interpolation(x, y, x_interp)` izvede Baricentrično Lagrangevo interpolacijo. Parametri so:

- `x`: Vektor interpolacijskih točk
- `y`: Vektor vrednosti funkcije v interpolacijskih točkah
- `x_interp`: Vektor točk, kjer želimo izračunati interpolirane vrednosti


### Interpolacija na poljubnem intervalu

Funkcija `interpolate_function(f, a, b, n, x_interp)` omogoča interpolacijo funkcije `f` na intervalu [a, b]. Parametri so:

- `f`: Funkcija, ki jo želimo interpolirati
- `a`, `b`: Interval, na katerem izvajamo interpolacijo
- `n`: Število točk za generiranje interpolacijskih točk
- `x_interp`: Vektor točk, kjer želimo izračunati interpolirane vrednosti


### Določanje stopnje polinoma

Funkcija `doloci_stopnjo_polinoma(f, a, b, n, x_interp)` določi stopnjo interpolacijskega polinoma za funkcijo `f` na intervalu [a, b]. Parametri so enaki kot pri funkciji `interpolate_function`. V njej najprej z zviševanjem začetnega parametra `n` grobo ocenimo vrednost, da je stopnja polinoma takšna, da je napaka $10^(-6)$, potem pa z biskecijo med to vrednostjo in predhodno vrednostjo `n`-ja dobimo natačno stopnjo polinoma, ki je `n-1`.

### Rezultati i testiranje

Vse implementacije metod so testirane s primerjanjem vrednosti interpolacije in dejanske vrednosti funkcije v neki točki, razen metode `doloci_stopnjo_polnioma`, ki jo težko testirati, saj zunanje knjižnice na drugačen način računajo stopnje polinoma.

Za raziskavo interpolacijskih polinomov smo uporabili različne funkcije in metode. V naslednjih primerih smo preizkusili 3 različne funkcije in določili ustrezno stopnjo interpolacijskega polinoma na osnovi števila točk interpolacije. Preverjanje interpolacijskega polnima smo preizkusili na 30 točkah zaradi časovne zahtevnosti.

#### Funkcija exp(-x^2) na intervalu [-1, 1]

Stopnja interpolacijskega polinoma za funkcijo e^(-x^2) na [-1, 1] je 889123.

#### Funkcija sin(x)/x na intervalu [0, 10]

Stopnja interpolacijskega polinoma za funkcijo sin(x)/x na [0, 10]: 780856. Ta funkcija ima divergenčno vrednost v točki `0` in zaradi tega vrednost pred preizkusom definirana kot `1`.

#### Funkcija |x^2-2x| na intervalu [1, 3]
Stopnja interpolacijskega polinoma za funkcijo |x^2-2x| na [1, 3]: 2687499. 
Ta funkcija je ostra v točki `2` in okoli nje je bilo potrebno uporabiti več točk, kjer želimo izračunati interpolirane vrednosti za preverjanje interpolacije, da bi dosegli izračun stopnje interpolacije.

Dokumentacijo pripravil [Bojan Ilić].
