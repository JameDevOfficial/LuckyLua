local M = {}

local _cards = {
    11, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10
}

M.getRandomCard = function()
    local cardIndex = math.random(1, #_cards)
    return _cards[cardIndex]
end

M.getCardsValue = function(cards)
    local totalValue = 0
    for _, card in ipairs(cards) do
        totalValue = totalValue + card
    end
    return totalValue
end
M.getAces = function(cards)
    local aces = 0
    for _, card in ipairs(cards) do
        if card >= 11 then
            aces = aces + 1
        end
    end
    return aces
end

M.optimizeAces = function(cards)
    local totalValue = M.getCardsValue(cards)
    local aceCount = M.getAces(cards)

    if totalValue > 21 and aceCount > 0 then
        for i, card in ipairs(cards) do
            if card == 11 then
                cards[i] = 1
                print("Changed card from 11 to 1!")
                break
            end
        end
    end

    return M.getCardsValue(cards)
end

M.checkStatus = function(playerValue, dealerValue)
    if playerValue > 21 then
        return -1
    elseif playerValue == 21 then
        return 1
    else
        return 0
    end
end

M.checkFinalStatus = function(playerValue, dealerValue)
    if playerValue > 21 then
        return -1
    elseif dealerValue > 21 then
        return 1
    elseif playerValue > dealerValue then
        return 1
    elseif playerValue < dealerValue then
        return -1
    else
        return 0
    end
end

M.drawGame = function(betAmount, player, dealer, gameStatus)
    print("Bet amount: " .. betAmount)
    print("---------------------")
    BP.printColor(
        "Dealer's cards: " .. dealer.cards[1] .. ", _",
        BP.COLORS.regular.red
    )
    BP.printColor(
        "Your cards: " .. table.concat(player.cards, ", ") .. " (Total: " .. player.totalValue .. ")",
        BP.COLORS.regular.red
    )
end

M.handleGame = function()
    BP.printColor("How much do you want to bet?", BP.COLORS.bold.red)
    local betAmount = io.read("n")

    local dealer = {
        cards = { M.getRandomCard(), M.getRandomCard() },
        totalValue = 0
    }
    local player = {
        cards = { M.getRandomCard(), M.getRandomCard() },
        totalValue = 0
    }
    dealer.totalValue = M.getCardsValue(dealer.cards)
    player.totalValue = M.getCardsValue(player.cards)

    while dealer.totalValue <= 16 do
        dealer.cards[#dealer.cards + 1] = M.getRandomCard()
        M.optimizeAces(dealer.cards)
        dealer.totalValue = M.getCardsValue(dealer.cards)
    end

    M.optimizeAces(player.cards)
    local gameStatus = M.checkStatus(player.totalValue, dealer.totalValue)
    M.drawGame(betAmount, player, dealer, gameStatus)
    BP.printColor("Hit (H), Stay (S), Double (D)", BP.COLORS.bold.blue)
    local inp
    while inp ~= "S" and gameStatus == 0 do
        inp = io.read()
        if inp == "H" then
            player.cards[#player.cards + 1] = M.getRandomCard()
            M.optimizeAces(player.cards)
            player.totalValue = M.getCardsValue(player.cards)
            gameStatus = M.checkStatus(player.totalValue, dealer.totalValue)
            M.drawGame(betAmount, player, dealer, gameStatus)
            if gameStatus ~= 0 then break end
            BP.printColor("Hit (H), Stay (S), Double (D)", BP.COLORS.bold.blue)
        end
    end
    local finalStatus = M.checkFinalStatus(player.totalValue, dealer.totalValue)

    if finalStatus == -1 then
        BP.printColor(
            "Dealer's cards: " .. table.concat(dealer.cards, ", ") .. " (Total: " .. dealer.totalValue .. ")",
            BP.COLORS.regular.red
        )
        print("You lost " .. betAmount .. " coins!")
        Player.addCoins(-betAmount)
    elseif finalStatus == 1 then
        BP.printColor(
            "Dealer's cards: " .. table.concat(dealer.cards, ", ") .. " (Total: " .. dealer.totalValue .. ")",
            BP.COLORS.regular.red
        )
        print("You won " .. betAmount .. " coins!")
        Player.addCoins(betAmount)
    else 
        BP.printColor(
            "Dealer's cards: " .. table.concat(dealer.cards, ", ") .. " (Total: " .. dealer.totalValue .. ")",
            BP.COLORS.regular.red
        )
        print("Tie! ("..player.totalValue.."), ("..dealer.totalValue..")")
    end
    print("Press enter to continue ... ")
    io.flush()
    _ = io.read()
end

return M;
