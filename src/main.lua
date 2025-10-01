io        = require "io"
os        = require "os"
Functions = require "src.modules.functions"
Plinko    = require "src.modules.games.plinko"

print("Lua Gambler")
Functions.printLine();
print("1. Plinko")
Functions.printLine();
local gameMode = io.read();
Ball = {row=6, column=3}

if (gameMode == "1") then
    Functions.clearConsole()
    print("PLINKO!!!")
    print("Press enter to drop the ball ...")
    local tempInp = io.read()
    Plinko.handleGame(7)
end
