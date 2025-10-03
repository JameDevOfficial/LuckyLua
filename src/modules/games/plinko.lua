local M = {}

M.Ball = { row = 2, column = 1 }

M.prizes = {
    baseReward = 10,
    multiplier = 3,
    cost = 20,
}

M.drawBallInEmptyLine = function(leadingSpaces, ball)
    Functions.printSpaces(leadingSpaces)
    Functions.printSpaces(ball.column * 2 - 1)
    BP.printColor("O", BP.COLORS.bold.blue, true, false)
end

M.drawGame = function(rows, ball)
    local endRow = rows * 2 - 1
    print(endRow)
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
                    if i == endRow and j < lineCount then
                        io.write("_")
                    else
                        io.write(" ")
                    end
                else
                    if j == ball.column then
                        BP.printColor("O", BP.COLORS.bold.blue, true, false)
                    else
                        if i == endRow and j ~= lineCount and j < lineCount then
                            io.write("_")
                        else
                            io.write(" ")
                        end
                    end
                end
            end
            lineCount = lineCount + 1
            print()
        end
    end
end

M.getRewards = function(rows, ball)
    local base = M.prizes.baseReward
    local mult = M.prizes.multiplier
    local center = math.ceil(rows / 2)
    local distance = math.abs(ball.column - center)
    local reward = base * mult ^ distance
    return reward
end

M.handleGame = function(rows)
    local ball = { row = M.Ball.row, column = M.Ball.column }
    local won = false
    while (ball.row ~= 13) do
        ball.row = ball.row + 1
        if ball.row % 2 ~= 0 then
            local direction = math.random(0, 1)
            ball.column = math.max(1, math.min(rows, ball.column + direction))
        end
        print(ball.row, ball.column)
        M.drawGame(rows, ball)
        Functions.wait(0.3)
        Functions.clearConsole()
    end
    local reward = M.getRewards(rows, ball)
    Player.addCoins(reward)
    print("You won " .. reward .. " coins!")
    print("Press enter to continue ... ")
    _ = io.read("*l")
end

return M;
