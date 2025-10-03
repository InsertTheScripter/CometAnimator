local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Dev check
local devUsers = {
    ["YoInsertStar"] = true,
    ["ItzNotInfected"] = true,
    ["Cr7N0wxD"] = true,
    ["mizukie_x0x"] = true,
    ["InsertTextHereH2O"] = true
}
local isDev = Instance.new("IntValue")
isDev.Name = "IsDev"
isDev.Value = devUsers[player.Name] and 1 or 0
isDev.Parent = player
if isDev.Value == 1 then print("You have been granted Dev Tools!") end

-- ScreenGui setup
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui
screenGui.IgnoreGuiInset = true
screenGui.DisplayOrder = 100

-- Load modules
local function safeRequire(fileName)
    local success, err = pcall(function()
        local module = require(script:WaitForChild(fileName))
        if module.Init then
            module.Init(player, screenGui)
        end
    end)
    if not success then
        warn("Failed to load", fileName, "|", err)
    end
end

safeRequire("intro_button")
-- safeRequire("particles") -- future modules
-- safeRequire("settings")
-- safeRequire("player_creation")
