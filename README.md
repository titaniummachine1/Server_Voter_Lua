![Visitors](https://api.visitorbadge.io/api/visitors?path=https%3A%2F%2Fgithub.com%2Ftitaniummachine1%2FServer_Voter_Lua&label=Visitors&countColor=%23263759&style=plastic)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

🤖🗳️ Kick out unwanted players automatically! This script creates a cool menu to enable/disable the votekick feature. Once enabled, it keeps an eye on your team and regularly initiates votekicks against non-friends and non-party members. No more annoying teammates! 😎🎮

Plus, it's smart enough to skip kicking your party members. So you can focus on playing with your squad! The script uses MenuLib and callbacks library for easy setup. Say goodbye to troublesome teammates with this script! 💪🔥


## Requirements

[![Menulib](https://img.shields.io/badge/Download-Menu.lua_lnx00-blue?style=for-the-badge&logo=github)](https://github.com/lnx00/Lmaobox-LUA/blob/main/Menu.lua) and copy the `Menu.lua` file to your `%localappdata%` folder.

## Download

[![Download Latest](https://img.shields.io/github/downloads/titaniummachine1/Server_Voter_Lua/total.svg?style=for-the-badge&logo=download&label=Download%20Latest)](https://github.com/titaniummachine1/Server_Voter_Lua/releases/latest/download/A_server_voter.lua)

## describtion
This script is designed to automatically initiate a votekick against players who are not friends or party members and are on the same team as the local player in a casual game mode.

The script creates a menu that allows the user to enable or disable the votekick feature. When the feature is enabled, the script will periodically check for teammates who are not friends or party members and initiate a votekick against them.

The script also checks if the target player is a party member and skips the votekick if they are.

The script uses the MenuLib library to create the menu and the callbacks library to register and unregister callbacks for when the script is loaded and unloaded.

Overall, this script is designed to help automatically initiating votekicks against teammates.

# Setup
Put all required files in your %localappdata% folder.
including Menu.lua and Lualib.lua

How to run Swing_prediction.lua:
  1. Create a .bat file in the same directory as lmaobox.exe.
  2. Right-click the .bat file and click "edit".
  3. Put "Lmaobox file name.exe -beta" inside the file, save, and run it.
  4. It should look similar to this: `start Lmaobox file-name.exe -beta`


