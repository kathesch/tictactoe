A = zeros(3,3)

#=

=#

function player_move!(A, x,y)
    A[x,y] = 1
    return A
end

player_move!(A,1,1)

computer_move!(A)


factorial(9)

#Lets enumerate every single tic tac toe board

A = zeros(3,3)

b = []
for (i,v) in enumerate(A)
    B = deepcopy(A)
    B[i] = 1
    push!(b,B)
end


#Write a function that given a board state A, returns a vector of all possible moves on that state


function move(A::Matrix)
    b = Array[]
    for (i,v) in enumerate(A)
        if v == 0
            B = copy(A)
            B[i] = 1
            push!(b, B)
        end
    end
    return b
end

function move(A::Vector{Array})
    b = Array[]
    for (i,v) in enumerate(A)
        push!(b, move(v))
    end
    return b
end


fullname



#Uses event listeners to drive the game board state forward. On click basically. 