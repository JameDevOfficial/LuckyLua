-- Better Prints
-- JameDev, 1st of October 2025
io = require "io"
local M = {}

M.COLORS = {
    reset = "\27[0m",
    regular = {
        black = "\27[0;30m",
        red = "\27[0;31m",
        green = "\27[0;32m",
        yellow = "\27[0;33m",
        blue = "\27[0;34m",
        purple = "\27[0;35m",
        cyan = "\27[0;36m",
        white = "\27[0;37m",
    },
    bold = {
        black = "\27[1;30m",
        red = "\27[1;31m",
        green = "\27[1;32m",
        yellow = "\27[1;33m",
        blue = "\27[1;34m",
        purple = "\27[1;35m",
        cyan = "\27[1;36m",
        white = "\27[1;37m",
    },
    underline = {
        black = "\27[4;30m",
        red = "\27[4;31m",
        green = "\27[4;32m",
        yellow = "\27[4;33m",
        blue = "\27[4;34m",
        purple = "\27[4;35m",
        cyan = "\27[4;36m",
        white = "\27[4;37m",
    },
    background = {
        black = "\27[40m",
        red = "\27[41m",
        green = "\27[42m",
        yellow = "\27[43m",
        blue = "\27[44m",
        purple = "\27[45m",
        cyan = "\27[46m",
        white = "\27[47m",
    },
    highIntensity = {
        black = "\27[0;90m",
        red = "\27[0;91m",
        green = "\27[0;92m",
        yellow = "\27[0;93m",
        blue = "\27[0;94m",
        purple = "\27[0;95m",
        cyan = "\27[0;96m",
        white = "\27[0;97m",
    },
    boldHighIntensity = {
        black = "\27[1;90m",
        red = "\27[1;91m",
        green = "\27[1;92m",
        yellow = "\27[1;93m",
        blue = "\27[1;94m",
        purple = "\27[1;95m",
        cyan = "\27[1;96m",
        white = "\27[1;97m",
    },
    highIntensityBackground = {
        black = "\27[0;100m",
        red = "\27[0;101m",
        green = "\27[0;102m",
        yellow = "\27[0;103m",
        blue = "\27[0;104m",
        purple = "\27[0;105m",
        cyan = "\27[0;106m",
        white = "\27[0;107m",
    },
    styles = {
        bold = "\27[1m",
        italic = "\27[3m",
        boldItalic = "\27[1;3m",
        underline = "\27[4m",
        strikethrough = "\27[9m",
    }
}

--- Prints text with color formatting.
-- @param text string: The text to print.
-- @param format string: The ANSI color format.
-- @param[opt] reset boolean: Whether to reset color after printing. Optional, defaults to true.
M.printColor = function(text, format, reset, newLine)
    if reset == nil then reset = true end
    if newLine == nil then newLine = true end
    io.write(format)
    io.write(text)
    if reset then io.write(M.COLORS.reset) end
    if newLine then print() end
end

return M;
