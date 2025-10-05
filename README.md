<div align="center">
<img src="assets/logo.png" width="100%" alt="Prism File Explorer Logo"/>

------

Lucky Lua is a CLI programm for gambling away your coins! 

[![LuckyLua](https://hackatime-badge.hackclub.com/U087BUC6ZFW/LuckyLua)](https://hackatime-badge.hackclub.com/U087BUC6ZFW/LuckyLua) 
[![MIT License](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Release](https://img.shields.io/github/v/release/JameDevOfficial/LuckyLua?label=Release)](https://github.com/JameDevOfficial/LuckyLua/releases/latest)
[![Commits](https://img.shields.io/github/commit-activity/t/JameDevOfficial/LuckyLua?label=Commits)](https://github.com/JameDevOfficial/LuckyLua/commits/main)

</div>

# Run
Download the latest [release](https://github.com/JameDevOfficial/LuckyLua/releases/latest) and execute it via

```sh
lua lucky.lua
```
Make sure you have a lua interpreter installed! 
## Installing a Lua Interpreter

### Linux
Most Linux distributions include Lua in their package manager. You can install it using:
```sh
sudo apt-get install lua5.3  # For Debian/Ubuntu-based systems
sudo yum install lua         # For Red Hat-based systems
```

### Windows
Download the Lua binaries from the [official Lua website](https://www.lua.org/download.html) (requires compiling yourself) or use a package manager like [Chocolatey](https://chocolatey.org/):
```sh
choco install lua
```

### macOS
Install Lua using [Homebrew](https://brew.sh/):
```sh
brew install lua
```
## Features
- Play a game of Plinko, you don't have to pay any fees, so you only can win!
- Flip a coin to double your money or loose it!
- Play a round of blackjack against the dealer!
- Play a round of roulette and bet on various things like red, black, odd, even, column n, row n, a number, ... (may not have all functionalities of a real roulette game)
- Custom print functions for supporting printed output in the console

## Bugs
- You may encounter issues with invalid input when playing roulette. I am aware of this, but neither flushing the input or changing the input mode fixes this. Just ignore this error and try entering your input again. (Make sure its a valid input and try at least 3 times!) 