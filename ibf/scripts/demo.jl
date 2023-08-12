using ibf, Polynomials
using Interpolations

# Določite točke za interpolacijo
#x = [1.0, 2.0, 3.0, 4.0]
#y = [2.0, 5.0, 4.0, 8.0]

# Ustvarite interpolacijski polinom
#interp = interpolate((x,), y, Gridded(Linear()))

# Izračunajte vrednosti interpolacijskega polinoma v določenih točkah
#x_interp = [1.5, 2.5, 3.5]
#y_interp = interp[x_interp]

#println("Interpolated values: ", y_interp)

# Primer uporabe za funkcijo e^(-x^2) na [-1, 1]
f1(x) = exp(-x^2)
a1, b1 = -1.0, 1.0
n = 1000
n_interp1 = 30
#x_interp = range(a1, stop=b1, length=n_interp1)
#interpolant1 = ibf.interpolate_function(f1, a1, b1, n, x_interp)
#y_interp = f1.(x_interp)
#println("Interpolant for e^(-x^2): ", interpolant1)
#println("y_interp for e^(-x^2): ", y_interp)

tol = 1e-6

function doloci_stopnjo_polinoma(f, a, b, n, n_interp)
    x_interp = range(a1, stop=b1, length=n_interp)
    y_interp = f.(x_interp)
    interpolant = ibf.interpolate_function(f, a, b, n, x_interp)
    faktor = 10
    n_prev = n
    while any(abs.(interpolant - y_interp) .> tol)
        n_prev = n
        n *= faktor
        interpolant = ibf.interpolate_function(f, a, b, n, x_interp)
    end

    n_a = n_prev
    n_b = n
    while n_a < n_b-1
        n_c = div(n_a+n_b, 2)
        interpolant = ibf.interpolate_function(f, a, b, n_c, x_interp)
        if any(abs.(interpolant - y_interp) .> tol)
            n_a = n_c
        else
            n_b = n_c
        end
    end

    return n_b
end

doloci_stopnjo_polinoma(f1, a1, b1, n, n_interp1)

# Primer uporabe za funkcijo sin(x)/x na [0, 10]
f2(x) = sin(x)/x
a2, b2 = 0.0, 10.0
doloci_stopnjo_polinoma(f2, a2, b2, n, n_interp1)

# Primer uporabe za funkcijo sin(x)/x na [1, 3]
f3(x) = abs(x^2 - 2x)
n = 10^6
a3, b3 = 1.0, 3.0
doloci_stopnjo_polinoma(f3, a3, b3, n, n_interp1)