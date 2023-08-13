using ibf, Polynomials

tol = 1e-6

function doloci_stopnjo_polinoma(f, a, b, n, x_interp)
    y_interp = f.(x_interp)
    interpolant = ibf.interpolate_function(f, a, b, n, x_interp)
    faktor = 10
    n_prev = n

    #Doličiti zgornjo mejo za bisekcijo
    while any(abs.(interpolant - y_interp) .> tol)
        n_prev = n
        n *= faktor
        interpolant = ibf.interpolate_function(f, a, b, n, x_interp)
        #println(interpolant)
    end

    #Bisekcija
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

    return n_b-1
end

# Primer uporabe za funkcijo e^(-x^2) na [-1, 1]
f1(x) = exp(-x^2)
a1, b1 = -1.0, 1.0
n = 10^3
n_interp = 30
x_interp = range(a1, stop=b1, length=n_interp)
stopnja = doloci_stopnjo_polinoma(f1, a1, b1, n, x_interp)
println("Stopnja interpolacijskega polinoma za funkcijo e^(-x^2) na [-1, 1]: ", stopnja)

# Primer uporabe za funkcijo sin(x)/x na [0, 10]
function f2(x)
    if x == 0
        return 1.0 # zaradi divergnečne vrednosti
    else
        return sin(x) / x
    end
end
a2, b2 = 0.0, 10.0
n = 10
n_interp = 30
x_interp = range(a2, stop=b2, length=n_interp)
stopnja = doloci_stopnjo_polinoma(f2, a2, b2, n, x_interp)
println("Stopnja interpolacijskega polinoma za funkcijo sin(x)/x na [0, 10]: ", stopnja)

# Primer uporabe za funkcijo |x^2-2x| na [1, 3]
f3(x) = abs(x^2 - 2x)
n = 10^3
a3, b3 = 1.0, 3.0
c3, d3 = 1.80, 2.20
x_interp1 = range(a3, stop=c3, length=5)
x_interp2 = range(c3, stop=d3, length=20)
x_interp3 = range(d3, stop=b3, length=5)
x_interp_combined = vcat(x_interp1, x_interp2, x_interp3)
stopnja = doloci_stopnjo_polinoma(f3, a3, b3, n, x_interp_combined)
println("Stopnja interpolacijskega polinoma za funkcijo |x^2-2x| na [1, 3]: ", stopnja)