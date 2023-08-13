using Test
using ibf

# Testi za funkcijo chebyshev_points
@testset "chebyshev_points test" begin
    n = 5
    points = ibf.chebyshev_points(n)
    @test length(points) == n
    @test points[1] ≈ cos(1*π/n)
    @test points[end] ≈ cos(5*π/n)
end

# Testi za funkcijo interpolate_function
@testset "interpolate_function test" begin
    f(x) = x^2
    a, b = 0.0, 2.0
    n = 10^7
    x_interp = [0.5, 1.0, 1.5]
    
    interpolant = ibf.interpolate_function(f, a, b, n, x_interp)
    
    @test length(interpolant) == length(x_interp)
    @test isapprox(interpolant[1], f(x_interp[1]), atol = 1e-6) # Primerjamo približno vrednost
    @test isapprox(interpolant[2], f(x_interp[2]), atol = 1e-6)
    @test isapprox(interpolant[3], f(x_interp[3]), atol = 1e-6)

    f1(x) = exp(-x^2)
    a1, b1 = -1.0, 1.0
    n1 = 10^6
    x_interp1 = [-1.0, 0.0, 1.0]
    
    interpolant1 = ibf.interpolate_function(f1, a1, b1, n1, x_interp1)
    @test length(interpolant1) == length(x_interp1)
    @test isapprox(interpolant1[1], f1(x_interp1[1]), atol = 1e-6)
    @test isapprox(interpolant1[2], f1(x_interp1[2]), atol = 1e-6)
    @test isapprox(interpolant1[3], f1(x_interp1[3]), atol = 1e-6)

    function f2(x)
        if x == 0
            return 1.0 # zaradi divergnečne vrednosti
        else
            return sin(x) / x
        end
    end
    a2, b2 = 0.0, 10.0
    n2 = 10^6
    x_interp2 = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]
    
    interpolant2 = ibf.interpolate_function(f2, a2, b2, n2, x_interp2)
    @test length(interpolant2) == length(x_interp2)
    @test isapprox(interpolant2[1], f2(x_interp2[1]), atol = 1e-6)
    @test isapprox(interpolant2[2], f2(x_interp2[2]), atol = 1e-6)
    @test isapprox(interpolant2[3], f2(x_interp2[3]), atol = 1e-6)
    @test isapprox(interpolant2[4], f2(x_interp2[4]), atol = 1e-6)
    @test isapprox(interpolant2[5], f2(x_interp2[5]), atol = 1e-6)
    @test isapprox(interpolant2[6], f2(x_interp2[6]), atol = 1e-6)
    @test isapprox(interpolant2[7], f2(x_interp2[7]), atol = 1e-6)
    @test isapprox(interpolant2[8], f2(x_interp2[8]), atol = 1e-6)
    @test isapprox(interpolant2[9], f2(x_interp2[9]), atol = 1e-6)
    @test isapprox(interpolant2[10], f2(x_interp2[10]), atol = 1e-6)
    @test isapprox(interpolant2[11], f2(x_interp2[11]), atol = 1e-6)

    f3(x) = abs(x^2 - 2x)
    n3 = 10^8
    a3, b3 = 1.0, 3.0
    c3, d3 = 1.80, 2.20
    x_interp3 = [1.0, 1.5, 2.0, 2.5, 3.0]
    interpolant3 = ibf.interpolate_function(f3, a3, b3, n3, x_interp3)
    @test length(interpolant3) == length(x_interp3)
    @test isapprox(interpolant3[1], f3(x_interp3[1]), atol = 1e-6)
    @test isapprox(interpolant3[2], f3(x_interp3[2]), atol = 1e-6)
    @test isapprox(interpolant3[3], f3(x_interp3[3]), atol = 1e-6)
    @test isapprox(interpolant3[4], f3(x_interp3[4]), atol = 1e-6)
    @test isapprox(interpolant3[5], f3(x_interp3[5]), atol = 1e-6)
end