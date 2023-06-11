--[[           Team Voter           ]]--
--[[          --Authors--           ]]--
--[[           Terminator           ]]--
--[[  (github.com/titaniummachine1  ]]--

-- Load MenuLib
local menuLoaded, MenuLib = pcall(require, "Menu")
-- If not found, throw error
assert(menuLoaded, "MenuLib not found, please install it!")
-- If version is too old, throw error
assert(MenuLib.Version >= 1.44, "MenuLib version is too old, please update it!")

-- Create the menu
local menu = MenuLib.Create("Swing Prediction", MenuFlags.AutoSize)
menu.Style.TitleBg = { 205, 95, 50, 255 } -- Title Background Color (Flame Pea)
menu.Style.Outline = true                 -- Outline around the menu

-- Add a checkbox to enable/disable votekick
local mEnable = menu:AddComponent(MenuLib.Checkbox("Enable Votekick", false, ItemFlags.FullWidth))

-- Initialize variables
local isVotekickInProgress = false
local tick_count = 0

-- Function to be called on every frame
local function OnCreateMove(pCmd)

  if not gamerules.IsMatchTypeCasual() then return end -- return if not in casual.
  -- Get the local player entity
  local me = entities.GetLocalPlayer()
  if not me then return end

  -- Get the local player's team number
  local myTeam = me:GetTeamNumber()

  -- Find all players in the game
  local players = entities.FindByClass("CTFPlayer")

  -- Get the list of party members
  local members = party.GetMembers()

  -- Create a table to store the local player's teammates
  local TeamMates = {}

  -- Initialize a variable to check if the target is a party member
  local isPartyMember = false

  -- Loop through all players in the game
  for i, player1 in ipairs(players) do
    player1 = players[i]

    -- Check if the player is on the same team as the local player
    if player1:GetTeamNumber() == myTeam
      and player1 ~= me
      and playerlist.GetPriority(player1) ~= -1 then

      -- Get the player's SteamID
      local playerInfo = client.GetPlayerInfo(player1:GetIndex())
      local steamID = playerInfo.SteamID

      -- Check if the player is a friend
      local isFriend = steam.IsFriend(steamID)

      -- Check if the player is a party member
      local partyMembers = party.GetMembers()
      if partyMembers ~= nil then
        for _, member in ipairs(partyMembers) do
          if string.match(member, steamID) then
            isPartyMember = true
          end
        end
      end

      -- If the player is not a friend or a party member, add them to the TeamMates table
      if not isFriend and not isPartyMember then
        table.insert(TeamMates, player1)
      end
    end
  end

  -- Increment the tick count
  tick_count = tick_count + 1

  -- If enough ticks have passed, start a votekick for each teammate
  if tick_count % 400 == 0 then
    if isVotekickInProgress == false then
      for i, player in ipairs(TeamMates) do
        -- Call a votekick for the player
        client.Command("callvote kick " .. player:GetName(), true)
        -- Reset the tick count
        tick_count = 0
        -- Say in chat that you voted to kick the player
        client.ChatSay("vote kicking \"" .. player:GetName() .. " for cheating\"")

        -- Print a message to the console
        print("vote kick on " .. player:GetName())

        
      end
    end
  end

end

--[[ Remove the menu when unloaded ]]--
local function OnUnload()                                -- Called when the script is unloaded
  MenuLib.RemoveMenu(menu)                             -- Remove the menu
  client.Command('play "ui/buttonclickrelease"', true) -- Play the "buttonclickrelease" sound
end

callbacks.Unregister("Unload", "MCT_Unload")                    -- Unregister the "Unload" callback
callbacks.Unregister("CreateMove", "MCT_CreateMove")            -- Unregister the "CreateMove" callback

callbacks.Register("Unload", "MCT_Unload", OnUnload)                         -- Register the "Unload" callback
callbacks.Register("CreateMove", "MCT_CreateMove", OnCreateMove)             -- Register the "CreateMove" callback
--[[ Play sound when loaded ]]--
client.Command('play "ui/buttonclick"', true) -- Play the "buttonclick" sound when the script is loaded
