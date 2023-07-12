using HTTP, Oxygen, JSON3
include("tictactoe.jl")

get("/") do req
    file("content/index.html")
end

route(["GET"], "/static/styles.css") do req
    content = file("content/styles.css")
    headers = ["Content-Type" => "text/css"]
    HTTP.Response(200, headers, body=content)
end

post("/helpme") do req
    "whats up $(text(req))"
end

@get "/data" function (req::HTTP.Request)
    content = "Hello"#Dict("message" => "hello!", "value" => 99.3)
    headers = ["Access-Control-Allow-Origin" => "*", "Content-Type" => "text/html"]
    HTTP.Response(200, headers, body=content)
end

@post "/display" function (req)
    content = "hello my friend not today $(text(req))"
    headers = ["Access-Control-Allow-Origin" => "*"]
    HTTP.Response(200, headers, body=content)
end


@post "/json" function (req)
    # content = req
    # headers = ["Access-Control-Allow-Origin" => "*", "Content-Type" => "application/json"]
    # HTTP.Response(200, headers, body=content)
    a = json(req)
    print(a["username"])
    return a
end

b = 0
@post "/tic" function (req)
    global b = req.body
    json_handle(req)
    headers = ["Access-Control-Allow-Origin" => "*", "Content-Type" => "application/json"]
    return HTTP.Response(200, headers, file("test.json"))
end



function json_handle(req)
    s = String(req.body)
    k = JSON3.read(s)
    a = copy(k)
    A = reshape(a[:data], 3, 3)'
    A[eval_move(A)...] = -1
    d = Dict(:data => vec(A'))

    open("test.json", "w") do io
        JSON3.pretty(io, d)
    end
end


# s = String(b)
# k = JSON3.read(s)
# a = copy(k)
# A = reshape(a[:data], 3,3)'
# A[eval_move(A)...] = -1
# d = Dict(:data => vec(A))








serve()

