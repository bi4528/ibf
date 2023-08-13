module ibf

# Funkcija za izračun Čebiševih točk na intervalu [-1, 1]
function chebyshev_points(n)
    points = [cos(i * π / n) for i in 1:n]
    return points
end

# Baricentrična Lagrangeva interpolacija
function baricentric_lagrange_interpolation(x, y, x_interp)
    n_interp = length(x_interp)
    n = length(x)
    interpolant = []
    weights = [((-1)^i) * (i == 0 || i == n ? 0.5 : 1.0) for i in 0:n-1]
    
    for i in 1:n_interp
        if x_interp[i] in x
            index = findfirst(comp -> comp == x_interp[i], x)
            push!(interpolant, y[index])
        else
            w = sum(weights[j] / (x_interp[i] - x[j]) for j in 1:n if j != i)
            interpolant_value = sum(y[j] * weights[j] / (x_interp[i] - x[j]) / w for j in 1:n if j != i)
            push!(interpolant, interpolant_value)
        end
    end
    
    return interpolant
end

# Funkcija za izračun interpolanta na poljubnem intervalu [a, b]
function interpolate_function(f, a, b, n, x_interp)
    # Preslikava intervala na [-1, 1]
    x_cheb = chebyshev_points(n)
    x_mapped = [(a + b) / 2 + ((b - a) / 2) * x for x in x_cheb]
    y_mapped = [f(x) for x in x_mapped]
    
    # Izračun interpolanta
    interpolant = baricentric_lagrange_interpolation(x_mapped, y_mapped, x_interp)
    
    return interpolant
end

end # module ibf
