local M = {}

M.init = function()

end

M.drawBallInEmptyLine = function(leadingSpaces, ball)
    Functions.printSpaces(leadingSpaces)
    Functions.printSpaces(ball.column * 2 - 1)
    io.write("O")
end

M.drawGame = function(rows, ball)
    local lineCount = 3
    local maxWidth = rows * 2
    for i = 2, rows * 2 do
        local leadingSpaces = maxWidth - i / 2
        if i % 2 == 0 then
            if i == ball.row then
                M.drawBallInEmptyLine(leadingSpaces, ball)
            end
            print()
        else
            Functions.printSpaces(leadingSpaces)
            for j = 1, lineCount do
                io.write("|")
                if i ~= ball.row then
                    io.write(" ")
                else
                    if j == ball.column then
                        io.write("O")
                    else 
                        io.write(" ")
                    end
                end
            end
            lineCount = lineCount + 1
            print()
        end
    end
end

M.handleGame = function (rows)
    local won = false
    while (not won) do
        Ball.row = Ball.row + 1
        Ball.column = math.max(1, math.min(rows, math.random(Ball.column - 1, Ball.column + 1)))
        M.drawGame(rows, Ball)
        Functions.wait(1)
        Functions.clearConsole()
    end
end

return M;