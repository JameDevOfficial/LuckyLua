io               = require "io"
os               = require "os"
Functions        = require "src.modules.functions"
Plinko           = require "src.modules.games.plinko"
CoinFlip         = require "src.modules.games.coinFlip"
Player           = require "src.modules.Player"
BP               = require "src.modules.betterPrint"

local Main       = {}

Main.startScreen = function()
    local quit = false
    io.write("Your name: ")
    Player.name = io.read()

    repeat
        Functions.clearConsole()
        Functions.printLogoAsAsciiArtBetter()
        BP.printColor("Hello " .. Player.name .. "!", BP.COLORS.highIntensityBackground.purple)
        print("\nYour Stats:")
        BP.printColor("    Coins: " .. Player.currentCoins, BP.COLORS.regular.yellow)
        BP.printColor("    Rounds Played: " .. Player.roundsPlayed, BP.COLORS.regular.blue)
        Functions.printLine();
        print("Game Modes: ")
        print("1. Plinko (No playing Fee!)")
        print("2. Coin Flip")
        Functions.printLine();
        BP.printColor("(Ran out of Money? Try entering \"Money\")", BP.COLORS.styles.italic, true, true)
        local gameMode = io.read()
        quit = Main.handleGame(gameMode)
    until quit
end

Main.handleGame  = function(gameMode)
    if (gameMode == "1") then
        Functions.clearConsole()
        BP.printColor("PLINKO!!!", BP.COLORS.bold.blue)
        print("Press enter to drop the ball ...")
        local tempInp = io.read()
        Plinko.handleGame(7)
    elseif gameMode == "2" then
        Functions.clearConsole()
        BP.printColor("Heads or Tails!", BP.COLORS.bold.red)
        CoinFlip.handleGame()
        local tempInp = io.read()
    elseif (gameMode) == "Money" then
        Player.currentCoins = Player.currentCoins + 100
    elseif gameMode == "exit" then
        return true;
    end

    return false
end

Main.startScreen()
