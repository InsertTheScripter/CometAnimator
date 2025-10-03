local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ====================
-- Developer check
-- ====================
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
if isDev.Value == 1 then
    print("You have been granted Dev Tools!")
end

-- ====================
-- ScreenGui setup
-- ====================
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui
screenGui.IgnoreGuiInset = true
screenGui.DisplayOrder = 100

-- ====================
-- Load modules via loadstring
-- ====================
local function loadModule(url)
    local success, err = pcall(function()
        loadstring(game:HttpGet(url))()(player, screenGui)
    end)
    if not success then
        warn("Failed to load module:", url, "|", err)
    end
end

-- Load intro_button module from GitHub raw
loadModule("https://raw.githubusercontent.com/InsertTheScripter/CometAnimator/refs/heads/main/intro_button.lua")

-- Future modules can be added like this:
-- loadModule("https://raw.githubusercontent.com/InsertTheScripter/CometAnimator/refs/heads/main/particles.lua")
-- loadModule("https://raw.githubusercontent.com/InsertTheScripter/CometAnimator/refs/heads/main/settings.lua")
