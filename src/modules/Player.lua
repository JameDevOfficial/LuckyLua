local M = {
    baseCoins = 100,
    currentCoins = 100,
    minCoins = 0,
    roundsPlayed = 0,
    -- collect more DATA!!!!
    name = "undefined"
}

M.addCoins = function (amount)
    Player.currentCoins = Player.currentCoins + amount
    if Player.currentCoins < Player.minCoins then
        Player.currentCoins = Player.minCoins
    end
end

return M;