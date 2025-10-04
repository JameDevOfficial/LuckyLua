local M = {}

M.prizes = {
    baseReward = 10,
    multiplier = 3,
    cost = 20,
}


M.drawCoin = function(state)
    Functions.clearConsole()
    if state == 1 then
        BP.printColor([[
        #########
     ###         ###
   ##               ##
  ##      TAILS      ##
 ##                   ##
 ##                   ##
 ##                   ##
  ##                 ##
   ##               ##
     ###         ###
        #########
    ]],
            BP.COLORS.regular.yellow)
    elseif state == 2 then
        BP.printColor([[
        #########
     ###         ###
   ###             ###
 ###                 ###
 ###                 ###
   ###             ###
     ###         ###
        #########
    ]],
            BP.COLORS.regular.yellow)
    elseif state == 3 then
        BP.printColor([[

        #########
    ####         ####
####                 ####
####                 ####
    ####         ####
        ##########
    ]],
            BP.COLORS.regular.yellow)
    elseif state == 4 then
        BP.printColor([[
        

,,,,,,,,,,,,,,,,,,,,,,,,,
*************************
    ]],
            BP.COLORS.regular.yellow)
    elseif state == 0 then
        BP.printColor([[
        #########
     ###         ###
   ##               ##
  ##      HEADS      ##
 ##                   ##
 ##                   ##
 ##                   ##
  ##                 ##
   ##               ##
     ###         ###
        #########


    ]],
            BP.COLORS.regular.yellow)
    end
end

M.drawGame = function(result)
    local animCount = 0
    local animRand = math.random(5, 7)
    local lastFace = 0
    while animCount < animRand do
        M.drawCoin(lastFace)
        Functions.wait(0.1)
        M.drawCoin(2)
        Functions.wait(0.1)
        M.drawCoin(3)
        Functions.wait(0.1)
        M.drawCoin(4)
        Functions.wait(0.1)
        M.drawCoin(3)
        Functions.wait(0.1)
        M.drawCoin(2)
        Functions.wait(0.1)
        animCount = animCount + 1
        lastFace = lastFace == 1 and 0 or 1
    end
    M.drawCoin(result)
end

M.handleGame = function()
    BP.printColor("How much do you want to bet?", BP.COLORS.bold.red)
    local betAmount = Functions.readNumber(true)
    BP.printColor("Heads (0) or Tails (1)?", BP.COLORS.bold.red)
    local betResult = Functions.readNumber(true)
    local result = math.random(0, 1) -- 0 Heads, 1 Tails
    M.drawGame(result)

    if result == betResult then
        Player.addCoins(betAmount)
        BP.printColor("You won " .. betAmount .. " coins!", BP.COLORS.regular.green)
    else
        Player.addCoins(-betAmount)
        BP.printColor("You lost " .. betAmount .. " coins!", BP.COLORS.regular.red)
        BP.printColor("Better luck next time.", BP.COLORS.regular.cyan)
    end
    print("Press enter to continue ... ")
    io.flush()
    _ = io.read()
end

return M;
