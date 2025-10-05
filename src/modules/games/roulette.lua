local M = {}

local numbers = {
    { color = "green", value = 0 },
    { color = "red",   value = 1 },
    { color = "black", value = 2 },
    { color = "red",   value = 3 },
    { color = "black", value = 4 },
    { color = "red",   value = 5 },
    { color = "black", value = 6 },
    { color = "red",   value = 7 },
    { color = "black", value = 8 },
    { color = "red",   value = 9 },
    { color = "black", value = 10 },
    { color = "black", value = 11 },
    { color = "red",   value = 12 },
    { color = "black", value = 13 },
    { color = "red",   value = 14 },
    { color = "black", value = 15 },
    { color = "red",   value = 16 },
    { color = "black", value = 17 },
    { color = "red",   value = 18 },
    { color = "red",   value = 19 },
    { color = "black", value = 20 },
    { color = "red",   value = 21 },
    { color = "black", value = 22 },
    { color = "red",   value = 23 },
    { color = "black", value = 24 },
    { color = "red",   value = 25 },
    { color = "black", value = 26 },
    { color = "red",   value = 27 },
    { color = "black", value = 28 },
    { color = "black", value = 29 },
    { color = "red",   value = 30 },
    { color = "black", value = 31 },
    { color = "red",   value = 32 },
    { color = "black", value = 33 },
    { color = "red",   value = 34 },
    { color = "black", value = 35 },
    { color = "red",   value = 36 },
}



M.drawBoard = function()
    local function redBG(text)
        return "\027[0;101m" .. text .. "\027[0m"
    end
    local function blackBG(text)
        return "\027[40m" .. text .. "\027[0m"
    end
    local function colorNum(num)
        local n = numbers[num + 1]
        if n.value == num then
            if n.color == "red" then
                return "\027[0;101m " .. tostring(num) .. " \027[0m"
            elseif n.color == "black" then
                return "\027[40m " .. tostring(num) .. " \027[0m"
            elseif n.color == "blue" then
                return "\27[0;104m " .. tostring(num) .. " \027[0m"
            elseif n.color == "green" then
                return "\27[0;102m " .. tostring(num) .. " \027[0m"
            else
                return tostring(num)
            end
        end
        return tostring(num)
    end
    -- prettier went crazy below, rip
    print([[
           |----------------|-------------------|-------------------|
        ___|    1st Dozen   |     2nd Dozen     |     3rd Dozen     |
       /   |----------------|-------------------|-------------------|----------|
      /    |]] ..
        colorNum(3) ..
        "|" ..
        colorNum(6) ..
        "|" ..
        colorNum(9) ..
        "|" ..
        colorNum(12) ..
        "|" ..
        colorNum(15) ..
        "|" ..
        colorNum(18) ..
        "|" ..
        colorNum(21) ..
        "|" ..
        colorNum(24) ..
        "|" .. colorNum(27) .. "|" .. colorNum(30) .. "|" .. colorNum(33) .. "|" .. colorNum(36) .. [[| Column 3 |
     /     |----------------|-------------------|-------------------|----------|
    |  ]] ..
        colorNum(0) ..
        [[ |]] ..
        colorNum(2) ..
        "|" ..
        colorNum(5) ..
        "|" ..
        colorNum(8) ..
        "|" ..
        colorNum(11) ..
        "|" ..
        colorNum(14) ..
        "|" ..
        colorNum(17) ..
        "|" ..
        colorNum(20) ..
        "|" ..
        colorNum(23) ..
        "|" .. colorNum(26) .. "|" .. colorNum(29) .. "|" .. colorNum(32) .. "|" .. colorNum(35) .. [[| Column 2 |
     \     |----------------|-------------------|-------------------|----------|
      \    |]] ..
        colorNum(1) ..
        "|" ..
        colorNum(4) ..
        "|" ..
        colorNum(7) ..
        "|" ..
        colorNum(10) ..
        "|" ..
        colorNum(13) ..
        "|" ..
        colorNum(16) ..
        "|" ..
        colorNum(19) ..
        "|" ..
        colorNum(22) ..
        "|" .. colorNum(25) .. "|" .. colorNum(28) .. "|" .. colorNum(31) .. "|" .. colorNum(34) .. [[| Column 1 |
       \___|----------------|-------------------|-------------------|----------|
           |  1-18 |  Even  |]] .. redBG("   Red   ") .. [[|]] .. blackBG("  Black  ") .. [[|   Odd   |  19-36  |
           |----------------|-------------------|-------------------|
    ]])
end



M.drawOptions = function()
    BP.printColor("Bet Options: ", BP.COLORS.bold.blue)
    print([[
    1: Straight-up (any number 1-36 or '0') [PAYOUT = 35:1]
    2: Columns (Horizontal long column) [PAYOUT = 2:1]
    3: Dozens (1-12, 13-24, 25-36) [PAYOUT = 2:1]
    4: Lows/Highs (half table) (1-18, 19-36) [PAYOUT = 1:1]
    5: Colors (red, black) [PAYOUT = 1:1]
    6: Evens/Odds [PAYOUT = 1:1]
    ]])
end

M.handleBet = function(type)
    local bet = { nums = {}, payout = 1 }
    if type == 1 then
        print("Number (0-36): ")
        bet.nums[1] = Functions.readNumberRange(0, 36, true)
        bet.payout = 35
    elseif type == 2 then
        local count = 1
        print("Column (1-3): ")
        local col = Functions.readNumberRange(1,3, true)
        for i, num in ipairs(numbers) do
            if num.value > 0 and (num.value - col) % 3 == 0 then
                bet.nums[count] = num.value
                count = count + 1
            end
        end
        bet.payout = 2
    elseif type == 3 then
        print("Dozen (1-3): ")
        local range = Functions.readNumberRange(1, 3)
        if range == 1 then
            bet.nums = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 }
        elseif range == 2 then
            bet.nums = { 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24 }
        elseif range == 3 then
            bet.nums = { 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36 }
        end
        bet.payout = 2
    elseif type == 4 then
        print("Low/High (L/H): ")
        local inp = Functions.readValue({ "L", "l", "H", "h" }, true)
        if inp == "L" or inp == "l" then
            bet.nums = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18 }
        elseif inp == "H" or inp == "h" then
            bet.nums = { 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36 }
        end
        bet.payout = 1
    elseif type == 5 then
        print("Color (red/black): ")
        local color = Functions.readValue({ "red", "black" }, true)
        if color == "red" then
            bet.nums = {}
            for _, num in ipairs(numbers) do
                if num.color == "red" and num.value ~= 0 then
                    table.insert(bet.nums, num.value)
                end
            end
        elseif color == "black" then
            bet.nums = {}
            for _, num in ipairs(numbers) do
                if num.color == "black" and num.value ~= 0 then
                    table.insert(bet.nums, num.value)
                end
            end
        end
        bet.payout = 1
    elseif type == 6 then
        print("Even or Odd (even/odd): ")
        local inp = Functions.readValue({ "even", "odd" }, true)
        if inp == "even" then
            for i = 2, 36, 2 do
                table.insert(bet.nums, i)
            end
        elseif inp == "odd" then
            for i = 1, 36, 2 do
                table.insert(bet.nums, i)
            end
        end
        bet.payout = 1
    end
    return bet
end

M.handleGame = function()
    BP.printColor("Roulette!", BP.COLORS.bold.red)
    M.drawBoard()
    BP.printColor("How much do you want to bet?", BP.COLORS.bold.blue)
    local betAmount = Functions.readNumber(true)
    M.drawOptions()
    local betType = Functions.readNumber(true)
    local bet = M.handleBet(betType)
    print(table.concat(bet.nums))

    local rounds = math.random(1,2)
    local number = math.random(0, 36)

    local steps = 37 * rounds + number + 1
    local count = 0
    local originalColors = {}
    for i, num in ipairs(numbers) do
        originalColors[i] = num.color
    end

    while count < steps do
        local idx = (count % #numbers) + 1
        local prevIdx = ((count - 1) % #numbers) + 1
        if count > 0 then
            numbers[prevIdx].color = originalColors[prevIdx]
        end
        numbers[idx].color = "blue"
        Functions.clearConsole()
        M.drawBoard()
        local waitTime = 0.05 + 0.45 * ((count / steps) ^ 2)
        Functions.wait(waitTime)
        count = count + 1
    end
    local finalIdx = (count % #numbers) + 1
    numbers[number+1].color = originalColors[number+1]

    if Functions.contains(bet.nums, number) then
        BP.printColor("You won!", BP.COLORS.bold.green)
        print("Payout: " .. betAmount * bet.payout .. " coins")
        Player.addCoins(betAmount * bet.payout)
    else
        BP.printColor("You lost ".. betAmount .. " coins!", BP.COLORS.bold.red)
        print("The number was: " .. number)
        print("Your winning numbers would have been: " .. table.concat(bet.nums, ", "))
        Player.addCoins(-betAmount)
    end
    _ = io.read()
    _ = io.read()
end

return M;
