io               = require "io"
os               = require "os"
Functions        = require "src.modules.functions"
Player           = require "src.modules.Player"
BP               = require "src.modules.betterPrint"
-------------------------------------------------------
Plinko           = require "src.modules.games.plinko"
CoinFlip         = require "src.modules.games.coinFlip"
Blackjack        = require "src.modules.games.blackjack"

local Main       = {}

Main.startScreen = function()
    local quit = false
    io.write("Your name: ")
    Player.name = io.read()

    repeat
        Functions.clearConsole()
        Functions.printLogoAsAsciiArtBetter()
        BP.printColor("Hello " .. Player.name .. "!", BP.COLORS.highIntensityBackground.purple)
        print("Your Stats:")
        BP.printColor("    Coins: " .. Player.currentCoins, BP.COLORS.regular.yellow)
        BP.printColor("    Rounds Played: " .. Player.roundsPlayed, BP.COLORS.regular.blue)
        Functions.printLine();
        print("Game Modes: ")
        print("1. Plinko (No losses!)")
        print("2. Coin Flip")
        print("3. Blackjack")
        Functions.printLine();
        BP.printColor("(Ran out of Money? Try entering \"Money\")", BP.COLORS.styles.italic, true, true)
        local gameMode = Functions.readValue({"1", "2", "3", "Money", "exit"}, true)
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
        local tempInp = io.read()
    elseif gameMode == "3" then
        Functions.clearConsole()
        BP.printColor("Blackjack!", BP.COLORS.bold.yellow)
        Blackjack.handleGame()
        Player.roundsPlayed = Player.roundsPlayed + 1
    elseif (gameMode) == "Money" then
        Player.currentCoins = Player.currentCoins + 100
    elseif gameMode == "exit" then
        return true;
    end

    return false
end

Main.startScreen()
