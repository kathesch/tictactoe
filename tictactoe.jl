using StatsBase

function eval_move(A)
    B = zeros(3, 3)
    for (i, v) in enumerate(A)
        if v == 0
            a = copy(A)
            a[i] = -1
            evals = [game(copy(a)) for k in 1:1000]
            counted = count(x -> x[2] == -1, evals)
            B[i] = counted
        end
    end
    return findmax(B)[2] |> Tuple
end


function move!(A)
    for i in 1:1000
        a = rand(1:9)
        if A[a] == 0
            A[a] = sum(A) == 1 ? -1 : 1
            break
        end
    end
    return A
end

function game(A)
    while iswin(A) == 0
        move!(A)
        if 0 ∉ A
            break
        end
    end
    return (A, iswin(A))
end

function iswin(A)
    n = 1
    player1 = any(sum(row) == 3 * n for row in eachrow(A)) ||
              any(sum(col) == 3 * n for col in eachcol(A)) ||
              sum(diag(A)) == 3 * n ||
              sum(crossdiag(A)) == 3 * n

    n = -1
    player2 = any(sum(row) == 3 * n for row in eachrow(A)) ||
              any(sum(col) == 3 * n for col in eachcol(A)) ||
              sum(diag(A)) == 3 * n ||
              sum(crossdiag(A)) == 3 * n

    if player1
        return 1
    end
    if player2
        return -1
    end
    return 0
end

function diag(A)
    [A[i, i] for i in 1:size(A)[1]]
end

function crossdiag(A)
    [A[i, end-i+1] for i in 1:size(A)[1]]
end