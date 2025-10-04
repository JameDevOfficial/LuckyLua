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
    -- I'm sorry, prettier went crazy below, rip
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
    1: Straight-up (any number 1-36, '0', or '00') [PAYOUT = 35:1]
    2: Split (any 2 numbers side by side) [PAYOUT = 17:1]
    3: Street (any 3 numbers in a row) [PAYOUT = 11:1]
    4: Six Line (a group of 6 numbers in 2 rows side by side) [PAYOUT = 5:1]
    5: Columns (Horizontal long column) [PAYOUT = 2:1]
    6: Dozens (1-12, 13-24, 25-36) [PAYOUT = 2:1]
    7: Lows/Highs (half table) (1-18, 19-36) [PAYOUT = 1:1]
    8: Colors (red, black) [PAYOUT = 1:1]
    9: Evens/Odds [PAYOUT = 1:1]
    ]])
end

M.handleGame = function()
    BP.printColor("Roulette!", BP.COLORS.bold.red)
    M.drawBoard()
    BP.printColor("How much do you want to bet?", BP.COLORS.regular.blue)
    local betAmount = Functions.readNumber(true)
end

return M;
