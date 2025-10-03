local M = {}

M.printLine = function()
    print("--------------------------")
end

M.clearConsole = function()
    if package.config:sub(1, 1) == "\\" then
        os.execute("cls")
    elseif package.config:sub(1, 1) == "/" then
        os.execute("clear")
    else
        for i = 1, 25 do
            print("\n\n")
        end
    end
end

M.printSpaces = function(n)
    for i = 1, n, 1 do
        io.write(" ")
    end
end

M.wait = function(t)
    local start = os.clock()
    repeat until os.clock() > start + t
end

M.printLogoAsAsciiArt = function()
    print([[
.-----------------------------------------------------------.
|                                                           |
|  ___       ___  ___  ________  ___  __        ___    ___  |
| |\  \     |\  \|\  \|\   ____\|\  \|\  \     |\  \  /  /| |
| \ \  \    \ \  \\\  \ \  \___|\ \  \/  /|_   \ \  \/  / / |
|  \ \  \    \ \  \\\  \ \  \    \ \   ___  \   \ \    / /  |
|   \ \  \____\ \  \\\  \ \  \____\ \  \\ \  \   \/  /  /   |
|    \ \_______\ \_______\ \_______\ \__\\ \__\__/  / /     |
|  ___\|_______|\|_______|\|_______|\|__| \|__|\___/ /      |
| |\  \     |\  \|\  \|\   __  \              \|___|/       |
| \ \  \    \ \  \\\  \ \  \|\  \                           |
|  \ \  \    \ \  \\\  \ \   __  \                          |
|   \ \  \____\ \  \\\  \ \  \ \  \                         |
|    \ \_______\ \_______\ \__\ \__\                        |
|     \|_______|\|_______|\|__|\|__|                        |
|                                                           |
'-----------------------------------------------------------'
    ]])
end

M.printLogoAsAsciiArtBetter = function()
    BP.printColor([[
.-----------------------------------------------------------.
|                                                           |
|  ___       ___  ___  ________  ___  __     ____    ____   |
| |\  \     |\  \|\  \|\   ____\|\  \|\  \  |\   \  /   /|  |
| \ \  \    \ \  \\\  \ \  \___|\ \  \/  /|_\ \   \/   / /  |
|  \ \  \    \ \  \\\  \ \  \    \ \   ___  \\ \      / /   |
|   \ \  \____\ \  \\\  \ \  \____\ \  \\ \  \\ \    / /    |
|    \ \_______\ \_______\ \_______\ \__\\ \__\\/   / /     |
|  ___\|_______|\|_______|\|_______|\|__| \|__|/   / /      |
| |\  \     |\  \|\  \|\   __  \          ____/   / /       |
| \ \  \    \ \  \\\  \ \  \|\  \         \ \____/ /        |
|  \ \  \    \ \  \\\  \ \   __  \         \|___|/          |
|   \ \  \____\ \  \\\  \ \  \ \  \                         |
|    \ \_______\ \_______\ \__\ \__\                        |
|     \|_______|\|_______|\|__|\|__|                        |
|                                                           |
'-----------------------------------------------------------'
]], BP.COLORS.bold.blue, true)
end

M.readNumber = function(repeatUntilValid)
    local number = io.read("*n")
    if number == nil then
        BP.printColor("Invalid input. Please enter a valid number.", BP.COLORS.bold.red)
        if repeatUntilValid then
            while number == nil do
                _ = io.read()
                number = io.read("*n")
                if number == nil then
                    BP.printColor("Invalid input. Please enter a valid number.", BP.COLORS.bold.red)
                end
            end
        else return 0
        end
    end
    return number
end

M.readValue = function(validValues, repeatUntilValid)
    local function contains(tbl, val)
        for _, v in ipairs(tbl) do
            if v == val then return true end
        end
        return false
    end

    local value = io.read()
    if not contains(validValues, value) then
        BP.printColor("Invalid input. Please enter a valid value. ["..value.."]", BP.COLORS.bold.red)
        if repeatUntilValid then
            while not contains(validValues, value) do
                _ = io.read()
                value = io.read()
                if value == nil then
                    BP.printColor("Invalid input. Please enter a valid value. [" .. value .. "]", BP.COLORS.bold.red)
                end
            end
        else
            return nil
        end
    end
    return value
end

return M;
