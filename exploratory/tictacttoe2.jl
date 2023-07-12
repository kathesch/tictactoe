using Chain

A = zeros(3, 3)

function move(A::Matrix, n=1)
    b = Array[]
    for (i, v) in enumerate(A)
        if v == 0
            B = copy(A)
            B[i] = n
            push!(b, B)
        end
    end
    return b
end

function move(A::Vector{Array}, n)
    [move(i, n) for i in A] |> Iterators.flatten |> collect
end

A = zeros(3, 3)
for i in turns
    A = move(A, i)
end

turns = [isodd(i) ? 1 : -1 for i in 1:9]

using Chain

A = zeros(3, 3)

using LinearAlgebra, Graphs, Plots, GraphRecipes

g = binary_tree(4) |> adjacency_matrix |> UpperTriangular |> DiGraph


a = @chain g laplacian_matrix(_, dir=:out) Matrix

A = abs.(a) ./ sum(abs.(a), dims=1)


f = zeros(size(A)[1])
f[end] = 1


@gif for i in 1:30
    @chain A^i * f plot(_, ylims=(0, 1))
end

plot(g)

using Combinatorics, Chain
using Distances, Plots

using Chian
a = @chain begin
    Iterators.product([-1:1 for i in 1:9]...)
    collect
    vec
    collect.(_)
    reshape.(_, 3, 3)
end





@chain hamming.([a[1]], a) findall(x -> x == 1, _) a[_]

using Plots
A = zeros(3, 3)

function random_game(A=zeros(3, 3))
    for i in 1:9
        for j in 1:1000
            if iswin(A)
                return (A, whowin(A))
            end
            a = rand(1:9)
            if A[a] == 0
                A[a] = (isodd(i) ? 1 : -1)
                break
            end
        end
    end
    return (A, nobody)
end

@enum Winner begin
    X=1
    O=-1
    nobody=0
end

function diag(A)
    [A[i, i] for i in 1:size(A)[1]]
end

function crossdiag(A)
    [A[i, end-i+1] for i in 1:size(A)[1]]
end

function iswin(A, player::Winner)
    n = Int64(player)
    return any(sum(row) == 3 * n for row in eachrow(A)) ||
           any(sum(col) == 3 * n for col in eachcol(A)) ||
           sum(diag(A)) == 3 * n ||
           sum(crossdiag(A)) == 3 * n
end

function iswin(A)
    return any([iswin(A, X::Winner), iswin(A, O::Winner)])
end

function whowin(A)
    if iswin(A, O::Winner)
        return O::Winner
    elseif iswin(A, X::Winner)
        return X::Winner
    else
        return nobody::Winner
    end
end

A = random_game()

[random_game() for i in 1:10000]

A = zeros(3,3)
#A[1:2] .= 1
#A[1] = -1

games = [random_game(copy(A)) for i in 1:10000]

c= [i[2] for i in games]

countmap(c)
sort(collect(countmap(c)), by=x->x[2], rev=true)

o_games = [i[1] for i in games if i[2] == X]
sum(o_games)

sum(c)

A
sum(o_games)







countmap(c)
using StatsBase
