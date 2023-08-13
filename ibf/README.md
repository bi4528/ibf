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

Funkcija `doloci_stopnjo_polinoma(f, a, b, n, x_interp)` določi stopnjo interpolacijskega polinoma za funkcijo `f` na intervalu [a, b]. Parametri so enaki kot pri funkciji `interpolate_function`.

