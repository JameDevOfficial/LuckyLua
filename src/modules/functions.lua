local M = {}

M.printLine = function()
    print("--------------------------")
end

M.clearConsole = function()
    if package.config:sub(1, 1) == "\\" then
        os.execute("cls")
    elseif package.config:sub(1, 1) == "/" then
        os.execute("clear")
    else
        for i = 1, 25 do
            print("\n\n")
        end
    end
end

M.printSpaces = function (n)
    for i = 1, n, 1 do
        io.write(" ")
    end
end

M.wait = function(t)
    local start = os.time()
    repeat until os.time() > start + t
end

return M;
