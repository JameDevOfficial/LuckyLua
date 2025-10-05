io               = require "io"
os               = require "os"
Functions        = require "src.modules.functions"
Player           = require "src.modules.Player"
BP               = require "src.modules.betterPrint"
-------------------------------------------------------
Plinko           = require "src.modules.games.plinko"
CoinFlip         = require "src.modules.games.coinFlip"
Blackjack        = require "src.modules.games.blackjack"
Roulette         = require "src.modules.games.roulette"

local Main       = {}

Main.startScreen = function()
    local quit = false
    io.write("Your name: ")
    Player.name = io.read()

    repeat
        Functions.clearConsole()
        Functions.printLogoAsAsciiArtBetter()
        local colors = { "black", "red", "green", "yellow", "blue", "purple", "cyan", "white" }
        local randomColor = colors[math.random(1, #colors)]
        BP.printColor("Hello " .. Player.name .. "!", BP.COLORS.highIntensityBackground[randomColor])
        print("Your Stats:")
        BP.printColor("    Coins: " .. Player.currentCoins, BP.COLORS.regular.yellow)
        BP.printColor("    Rounds Played: " .. Player.roundsPlayed, BP.COLORS.regular.blue)
        Functions.printLine();
        print("Game Modes: ")
        print("1. Plinko (No losses!)")
        print("2. Coin Flip")
        print("3. Blackjack")
        print("4. Roulette")
        Functions.printLine();
        BP.printColor("(Ran out of Money? Try entering \"Money\")", BP.COLORS.styles.italic, true, true)
        local gameMode = Functions.readValue({ "1", "2", "3", "4", "Money", "exit" }, true)
        quit = Main.handleGame(gameMode)
    until quit
end

Main.handleGame  = function(gameMode)
    if (gameMode == "1") then
        Functions.clearConsole()
        BP.printColor("PLINKO!!!", BP.COLORS.bold.blue)
        Plinko.handleGame(7)
        Player.roundsPlayed = Player.roundsPlayed + 1
    elseif gameMode == "2" then
        Functions.clearConsole()
        BP.printColor("Heads or Tails!", BP.COLORS.bold.red)
        CoinFlip.handleGame()
        Player.roundsPlayed = Player.roundsPlayed + 1
        _ = io.read()
    elseif gameMode == "3" then
        Functions.clearConsole()
        BP.printColor("Blackjack!", BP.COLORS.bold.yellow)
        Blackjack.handleGame()
        Player.roundsPlayed = Player.roundsPlayed + 1
    elseif gameMode == "4" then
        Functions.clearConsole()
        Roulette.handleGame()
        Player.roundsPlayed = Player.roundsPlayed + 1
    elseif (gameMode) == "Money" then
        Player.currentCoins = Player.currentCoins + 100
    elseif gameMode == "exit" then
        return true;
    end

    return false
end

Main.startScreen()
