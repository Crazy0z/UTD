local repo = "https://raw.githubusercontent.com/joustingmatch/ObsidianUltra/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles

Library.ForceCheckbox = false
Library.ShowToggleFrameInKeybinds = true

local Window = Library:CreateWindow({
	Title = "CrazyHub",
	Icon = 127259584519664,
	NotifySide = "Right",
	ShowCustomCursor = true,
	CopyableFooter = true,
	FuzzySearch = true,
	SearchValues = true,
	SearchKeybind = Enum.KeyCode.F,
	Minimizable = true,
	MinimizeKeybind = Enum.KeyCode.RightBracket,
	MinimizedWidth = 300,
	ShowMobileButtons = true,
	MobileButtonsSide = "Left",
	Footer = "Anime Card Farm | https://discord.gg/RbKCTsNPaB | Dev: Crazy"
})

local Tabs = {
	Info = Window:AddTab({ Name = "Info", Icon = "info", Description = "Information" }),
	Plot = Window:AddTab({ Name = "Plot", Icon = "box", Description = "Plot Management" }),
	Cards = Window:AddTab({ Name = "Cards", Icon = "layers", Description = "Card Management" }),
	Battle = Window:AddTab({ Name = "Battle", Icon = "swords", Description = "Auto Battle" }),
	Settings = Window:AddTab({ Name = "Settings", Icon = "settings", Description = "UI Settings" }),
}

-- ==========================================
-- PLOT TAB
-- ==========================================
Tabs.Plot:SetSubTabAlignment("Center")
local FarmSubTab = Tabs.Plot:AddSubTab("Farm", "tractor")
local BoxesSubTab = Tabs.Plot:AddSubTab("Boxes", "package")
local BoostsSubTab = Tabs.Plot:AddSubTab("Boosts", "zap")

-- [ Plot -> Farm ]

local SpawnBox = FarmSubTab:AddLeftGroupbox("Spawn")
SpawnBox:AddToggle("AutoSpawnPack", { Text = "Auto Spawn Pack", Default = false })
SpawnBox:AddSlider("SpawnDelay", { Text = "Spawn Delay (s)", Default = 0.4, Min = 0.4, Max = 5, Rounding = 1 })
SpawnBox:AddToggle("AutoStopOnTarget", { Text = "Auto Stop On Target", Default = false })

local AutoBuyBox = FarmSubTab:AddLeftGroupbox("Auto Buy")
AutoBuyBox:AddToggle("AutoBuyMatching", { Text = "Auto Buy Matching", Default = false })

local FiltersBox = FarmSubTab:AddRightGroupbox("Filters")
FiltersBox:AddDropdown("FarmRarity", { Values = {"Common", "Uncommon", "Rare", "Epic", "Legendary", "Mythic", "Secret", "Divine", "Transcendent", "Shadow", "Emperor", "Demon", "Manga", "Celestial", "Heavenly", "Corrupted", "Striker", "Sacred", "Paradox", "Founder", "Evolved", "Magic", "Oni", "Chaos", "Ruin", "Reborn", "Beast", "Nordic", "Hunter", "Soul", "Swordsman", "Gamer", "Revenge", "Chainsaw", "Eternity", "Academy", "Dynasty", "Grail", "Conquest", "Blaze", "Devour", "Raven", "Arcane", "Nightfall"}, Default = 1, Multi = true, Searchable = true, Text = "Rarity" })
FiltersBox:AddDropdown("FarmMutation", { Values = {"Normal", "Golden", "Diamond", "Venomous", "Rainbow", "Sakura", "Candy", "Blessed", "Radioactive", "Glitch", "Starfallen", "Admin", "Unknow"}, Default = 1, Multi = true, Searchable = true, Text = "Mutation" })
FiltersBox:AddDropdown("FarmPack", { Values = {"Ice Pack", "Sand Pack", "Inferno Pack", "Lightning Pack", "Hightech Pack", "Dark Pack", "Eclipse Pack", "Isekai Pack", "Slayer Pack", "Monarch Pack", "Pirate King Pack", "Demon Pack", "Manga Pack", "Galaxy Pack", "Heaven Pack", "Void Pack", "Soccer Pack", "Empyrean Pack", "Bizarre Pack", "Titan Pack", "Evolved Pack", "Grimoire Pack", "Oni Pack", "Chaos Pack", "Ruin Pack", "Mage Pack", "Beast Pack", "Viking Pack", "Hunter Pack", "Soul Pack", "Swordsman Pack", "Gamer Pack", "Revenge Pack", "Chainsaw Pack", "Eternity Pack", "Academy Pack", "Dynasty Pack", "Grail Pack", "Conquest Pack", "Blaze Pack", "Devour Pack", "Raven Pack", "Arcane Pack", "Nightfall Pack"}, Default = 1, Multi = true, Searchable = true, Text = "Pack" })
FiltersBox:AddToggle("UseMinimumRarity", { Text = "Use Minimum Rarity", Default = false })
FiltersBox:AddDropdown("FarmMinimumRarity", { Values = {"Common", "Uncommon", "Rare", "Epic", "Legendary", "Mythic", "Secret", "Divine", "Transcendent", "Shadow", "Emperor", "Demon", "Manga", "Celestial", "Heavenly", "Corrupted", "Striker", "Sacred", "Paradox", "Founder", "Evolved", "Magic", "Oni", "Chaos", "Ruin", "Reborn", "Beast", "Nordic", "Hunter", "Soul", "Swordsman", "Gamer", "Revenge", "Chainsaw", "Eternity", "Academy", "Dynasty", "Grail", "Conquest", "Blaze", "Devour", "Raven", "Arcane", "Nightfall"}, Default = 1, Searchable = true, Text = "Minimum Rarity" })
FiltersBox:AddButton({ Text = "Refresh Lists", Func = function() end })

-- [ Plot -> Boxes ]

local CardSlotsBox = BoxesSubTab:AddLeftGroupbox("Card Slots")
CardSlotsBox:AddToggle("AutoPlacePacks", { Text = "Auto Place Packs", Default = false })
CardSlotsBox:AddDropdown("PacksToPlace", { Values = {"Ice Pack", "Sand Pack", "Inferno Pack", "Lightning Pack", "Hightech Pack", "Dark Pack", "Eclipse Pack", "Isekai Pack", "Slayer Pack", "Monarch Pack", "Pirate King Pack", "Demon Pack", "Manga Pack", "Galaxy Pack", "Heaven Pack", "Void Pack", "Soccer Pack", "Empyrean Pack", "Bizarre Pack", "Titan Pack", "Evolved Pack", "Grimoire Pack", "Oni Pack", "Chaos Pack", "Ruin Pack", "Mage Pack", "Beast Pack", "Viking Pack", "Hunter Pack", "Soul Pack", "Swordsman Pack", "Gamer Pack", "Revenge Pack", "Chainsaw Pack", "Eternity Pack", "Academy Pack", "Dynasty Pack", "Grail Pack", "Conquest Pack", "Blaze Pack", "Devour Pack", "Raven Pack", "Arcane Pack", "Nightfall Pack"}, Default = 1, Multi = true, Searchable = true, Text = "Packs To Place" })
CardSlotsBox:AddToggle("AutoOpenReadyCards", { Text = "Auto Open Ready Cards", Default = false })
CardSlotsBox:AddToggle("AutoPickUpReadyCards", { Text = "Auto Pick Up Ready Cards", Default = false })
CardSlotsBox:AddSlider("PickUpDelay", { Text = "Pick Up Delay (s)", Default = 0.2, Min = 0.2, Max = 10, Rounding = 1 })

local CardBoxesBox = BoxesSubTab:AddRightGroupbox("Card Boxes")
CardBoxesBox:AddToggle("AutoCarryFilledBox", { Text = "Auto Carry Filled Box", Default = false })
CardBoxesBox:AddToggle("AutoSellCardBoxes", { Text = "Auto Sell Card Boxes", Default = false })
CardBoxesBox:AddSlider("BoxDelay", { Text = "Box Delay (s)", Default = 0.5, Min = 0.5, Max = 30, Rounding = 1 })
CardBoxesBox:AddSlider("SellDelay", { Text = "Sell Delay (s)", Default = 0.2, Min = 0.2, Max = 10, Rounding = 1 })

local SellCardsBox = BoxesSubTab:AddRightGroupbox("Sell Cards")
SellCardsBox:AddToggle("AutoSellAllCards", { Text = "Auto Sell All Cards", Default = false })
SellCardsBox:AddToggle("AutoSellByRarity", { Text = "Auto Sell By Rarity", Default = false })
SellCardsBox:AddDropdown("RaritiesToSell", { Values = {"Common", "Uncommon", "Rare", "Epic", "Legendary", "Mythic", "Secret", "Divine", "Transcendent", "Shadow", "Emperor", "Demon", "Manga", "Celestial", "Heavenly", "Corrupted", "Striker", "Sacred", "Paradox", "Founder", "Evolved", "Magic", "Oni", "Chaos", "Ruin", "Reborn", "Beast", "Nordic", "Hunter", "Soul", "Swordsman", "Gamer", "Revenge", "Chainsaw", "Eternity", "Academy", "Dynasty", "Grail", "Conquest", "Blaze", "Devour", "Raven", "Arcane", "Nightfall"}, Default = 1, Multi = true, Searchable = true, Text = "Rarities To Sell" })
SellCardsBox:AddSlider("CardSellDelay", { Text = "Card Sell Delay (s)", Default = 0.4, Min = 0.4, Max = 5, Rounding = 1 })

-- [ Plot -> Boosts ]

local UpgradesBox = BoostsSubTab:AddLeftGroupbox("Upgrades")
UpgradesBox:AddToggle("AutoUpgradeSelected", { Text = "Auto Upgrade Selected", Default = false })
UpgradesBox:AddDropdown("UpgradesToBuy", { Values = {"cash", "base", "luck", "time", "speed"}, Default = 1, Multi = true, Searchable = true, Text = "Upgrades To Buy" })
UpgradesBox:AddToggle("AutoUpgradeConveyor", { Text = "Auto Upgrade Conveyor", Default = false })

local PotionsBox = BoostsSubTab:AddLeftGroupbox("Potions")
PotionsBox:AddToggle("AutoUsePotions", { Text = "Auto Use Potions", Default = false })
PotionsBox:AddDropdown("PotionsToUse", { Values = {"Cash I", "Cash II", "Cash III", "Luck I", "Luck II", "Luck III", "Mutation I", "Mutation II", "Mutation III", "Production I", "Production II", "Production III", "Time I", "Time II", "Time III"}, Default = 1, Multi = true, Searchable = true, Text = "Potions To Use" })
PotionsBox:AddSlider("PotionCheckDelay", { Text = "Potion Check Delay (s)", Default = 15, Min = 15, Max = 120, Rounding = 0 })

local RewardsBox = BoostsSubTab:AddRightGroupbox("Rewards")
RewardsBox:AddToggle("AutoClaimPlaytimeRewards", { Text = "Auto Claim Playtime Rewards", Default = false })
RewardsBox:AddToggle("AutoClaimDailyRewards", { Text = "Auto Claim Daily Rewards", Default = false })


-- ==========================================
-- CARDS TAB
-- ==========================================
Tabs.Cards:SetSubTabAlignment("Center")
local CardsSubTab = Tabs.Cards:AddSubTab("Cards", "credit-card")
local RollsSubTab = Tabs.Cards:AddSubTab("Rolls", "dices")

-- [ Cards -> Cards ]

local CardLevelsBox = CardsSubTab:AddLeftGroupbox("Card Levels")
CardLevelsBox:AddToggle("AutoUpgradePlacedCards", { Text = "Auto Upgrade Placed Cards", Default = false })
CardLevelsBox:AddSlider("StopAtLevel", { Text = "Stop At Level", Default = 50, Min = 1, Max = 50, Rounding = 0 })
CardLevelsBox:AddInput("MaxCostPerUpgrade", { Text = "Max Cost Per Upgrade", Default = "0", Numeric = true })
CardLevelsBox:AddInput("KeepCashReserve", { Text = "Keep Cash Reserve", Default = "0", Numeric = true })
CardLevelsBox:AddSlider("UpgradeDelay", { Text = "Upgrade Delay (s)", Default = 0.3, Min = 0.3, Max = 5, Rounding = 1 })

local SlotsBox = CardsSubTab:AddRightGroupbox("Slots")
local slotValues = {"All"}
for i = 1, 90 do table.insert(slotValues, "Slot " .. i) end
SlotsBox:AddDropdown("SlotsToUpgrade", { Values = slotValues, Default = 1, Multi = true, Searchable = true, Text = "Slots To Upgrade" })

local EquipBestBox = CardsSubTab:AddRightGroupbox("Equip Best")
EquipBestBox:AddToggle("AutoEquipBestCards", { Text = "Auto Equip Best Cards", Default = false })
EquipBestBox:AddSlider("EquipEvery", { Text = "Equip Every (s)", Default = 60, Min = 60, Max = 600, Rounding = 0 })

-- [ Cards -> Rolls ]

local TraitsBox = RollsSubTab:AddLeftGroupbox("Traits")
TraitsBox:AddToggle("AutoRollTraits", { Text = "Auto Roll Traits", Default = false })
TraitsBox:AddDropdown("StopOnTrait", { Values = {"Fortune I", "Vigor I", "Strength I", "Fortune II", "Vigor II", "Strength II", "Fortune III", "Vigor III", "Strength III", "Assassin", "Berserk", "Tank", "Rich", "Emperor", "Phoenix", "Almighty", "Sovereign"}, Default = 1, Multi = true, Searchable = true, Text = "Stop On Trait" })

local TimingBox = RollsSubTab:AddLeftGroupbox("Timing")
TimingBox:AddSlider("RollRetryDelay", { Text = "Roll Retry Delay (s)", Default = 1, Min = 0.1, Max = 5, Rounding = 1 })

local RanksBox = RollsSubTab:AddRightGroupbox("Ranks")
RanksBox:AddToggle("AutoRollRanks", { Text = "Auto Roll Ranks", Default = false })
RanksBox:AddDropdown("StopOnGrade", { Values = {"E", "D", "C", "B", "A", "S", "SS", "UR", "LR", "MR"}, Default = 1, Multi = true, Searchable = true, Text = "Stop On Grade" })
RanksBox:AddDropdown("RollWith", { Values = {"Cash", "Gems"}, Default = 1, Text = "Roll With" })

local BackpackCardMap = {}
local SmartRollBox = RollsSubTab:AddRightGroupbox("Smart Roll")
SmartRollBox:AddToggle("AutoRollCardsToTargets", { Text = "Auto Roll Cards To Targets", Default = false })
local cardsDropdown = SmartRollBox:AddDropdown("CardsToRoll", { Values = {}, Default = 1, Multi = true, Searchable = true, Text = "Cards To Roll" })

SmartRollBox:AddButton({ Text = "Refresh Cards", Func = function()
    local localPlayer = game:GetService("Players").LocalPlayer
    local backpack = localPlayer:FindFirstChild("Backpack")
    local newValues = {}
    table.clear(BackpackCardMap)
    
    if backpack then
        local nameCounts = {}
        for _, tool in ipairs(backpack:GetChildren()) do
            if tool:IsA("Tool") and tool:GetAttribute("CardName") then
                local baseName = tool:GetAttribute("CardName")
                nameCounts[baseName] = (nameCounts[baseName] or 0) + 1
                local displayName = baseName .. " [" .. nameCounts[baseName] .. "]"
                
                local grade = tool:GetAttribute("CardGrade") or "?"
                local trait = tool:GetAttribute("CardTrait") or "None"
                displayName = displayName .. " (" .. grade .. " | " .. trait .. ")"
                
                table.insert(newValues, displayName)
                BackpackCardMap[displayName] = tool
            end
        end
    end
    
    cardsDropdown:SetValues(newValues)
end })

-- ==========================================
-- BATTLE TAB
-- ==========================================
Tabs.Battle:SetSubTabAlignment("Center")
local TowerSubTab = Tabs.Battle:AddSubTab("Tower", "swords")
local RaidSubTab = Tabs.Battle:AddSubTab("Raid", "skull")

-- [ Battle -> Tower ]

local InfinityTowerBox = TowerSubTab:AddLeftGroupbox("Infinity Tower")
InfinityTowerBox:AddToggle("AutoEquipBestTower", { Text = "Auto Equip Best", Default = false })
InfinityTowerBox:AddToggle("AutoStartBattles", { Text = "Auto Start Battles", Default = false })

InfinityTowerBox:AddToggle("PickUpBestCards", { Text = "Pick Up Best Cards Before Battle", Default = false })
InfinityTowerBox:AddSlider("CardsToPickUp", { Text = "Cards To Pick Up", Default = 4, Min = 1, Max = 4, Rounding = 0 })
InfinityTowerBox:AddToggle("OnlyIfBetter", { Text = "Only If Better Than Inventory", Default = false })
InfinityTowerBox:AddToggle("ReturnCardsAfterBattle", { Text = "Return Cards After Battle Starts", Default = false })
InfinityTowerBox:AddToggle("AutoLeaveTower", { Text = "Auto Leave Tower", Default = false })
InfinityTowerBox:AddSlider("TargetLeaveFloor", { Text = "Target Leave Floor", Default = 20, Min = 1, Max = 1000, Rounding = 0 })
InfinityTowerBox:AddSlider("TowerRetryDelay", { Text = "Retry Delay (s)", Default = 2, Min = 2, Max = 15, Rounding = 0 })

-- [ Battle -> Raid ]

local BossRaidBox = RaidSubTab:AddLeftGroupbox("Boss Raid")
BossRaidBox:AddToggle("AutoRaid", { Text = "Auto Raid", Default = false })
BossRaidBox:AddDropdown("RaidDifficulty", { Values = {"Easy", "Normal", "Hard", "Nightmare"}, Default = 1, Text = "Difficulty" })
BossRaidBox:AddToggle("RaidEquipBestTeam", { Text = "Equip Best Team", Default = false })
BossRaidBox:AddToggle("RaidPriority", { Text = "Raid Priority Over Tower", Default = false })
BossRaidBox:AddToggle("RaidPickUpBestCards", { Text = "Pick Up Best Cards Before Raid", Default = false })
BossRaidBox:AddToggle("RaidOnlyIfBetter", { Text = "Only If Better Than Inventory", Default = true })
BossRaidBox:AddSlider("RaidCardsToPickUp", { Text = "Cards To Pick Up", Default = 4, Min = 1, Max = 10, Rounding = 0 })
BossRaidBox:AddSlider("RaidRetryDelay", { Text = "Retry Delay (s)", Default = 5, Min = 5, Max = 30, Rounding = 0 })

-- ==========================================
-- INFO TAB
-- ==========================================
local AccountBox = Tabs.Info:AddLeftGroupbox("User Info")
local localPlayerName = game:GetService("Players").LocalPlayer and game:GetService("Players").LocalPlayer.Name or "Unknown"
AccountBox:AddLabel("<b>User:</b> <font color=\"#B266FF\">" .. localPlayerName .. "</font>")
local exec = (type(identifyexecutor) == "function" and identifyexecutor()) or "Unknown"
AccountBox:AddLabel("<b>Executor:</b> <font color=\"#FFD700\">" .. exec .. "</font>")

local GameBox = Tabs.Info:AddLeftGroupbox("Game Details")
GameBox:AddLabel("<b>Current Game:</b> <font color=\"#B266FF\">Anime Card Farm</font>")
GameBox:AddLabel("<b>Place:</b> <font color=\"#B266FF\">" .. game.PlaceId .. "</font>")
local SessionLabel = GameBox:AddLabel("<b>Time Elapsed:</b> <font color=\"#00FFFF\">0s</font>")
local startTime = tick()
task.spawn(function()
    while task.wait(1) do
        local elapsed = tick() - startTime
        local h = math.floor(elapsed / 3600)
        local m = math.floor((elapsed % 3600) / 60)
        local s = math.floor(elapsed % 60)
        local timeStr = ""
        if h > 0 then timeStr = timeStr .. h .. "h " end
        if m > 0 then timeStr = timeStr .. m .. "m " end
        timeStr = timeStr .. s .. "s"
        if SessionLabel and SessionLabel.SetText then
            SessionLabel:SetText("<b>Time Elapsed:</b> <font color=\"#00FFFF\">" .. timeStr .. "</font>")
        end
    end
end)
local shortJobId = string.sub(game.JobId, 1, 18) .. "..."
GameBox:AddLabel("<b>Job ID:</b> <font color=\"#888888\">" .. shortJobId .. "</font>")
GameBox:AddButton({
    Text = "[ Copy Job ID Script ]",
    Func = function()
        if type(setclipboard) == "function" then
            setclipboard('game:GetService("TeleportService"):TeleportToPlaceInstance('..game.PlaceId..', "'..game.JobId..'", game.Players.LocalPlayer)')
        end
    end
})

local ScriptsBox = Tabs.Info:AddRightGroupbox("Scripts")
ScriptsBox:AddLabel("Loaded:")
ScriptsBox:AddLabel("<b><font color=\"#FFD700\">> Anime Card Farm</font></b>") 

local FeaturesBox = Tabs.Info:AddRightGroupbox("Main Features")
FeaturesBox:AddLabel("<font color=\"#00FFFF\">[+]</font> Auto Pack Farm & Auto Buy")
FeaturesBox:AddLabel("<font color=\"#00FFFF\">[+]</font> Auto Slot & Auto Boxes")
FeaturesBox:AddLabel("<font color=\"#00FFFF\">[+]</font> Auto Sell")
FeaturesBox:AddLabel("<font color=\"#B266FF\">[+]</font> Auto Upgrades & Auto Potions")
FeaturesBox:AddLabel("<font color=\"#B266FF\">[+]</font> Auto Traits & Auto Ranks")
FeaturesBox:AddLabel("<font color=\"#FFD700\">[+]</font> Auto Tower & Auto Boss Raid")

-- ==========================================
-- UI SETTINGS TAB
-- ==========================================
local MenuGroup = Tabs.Settings:AddLeftGroupbox("Menu")
MenuGroup:AddToggle("KeybindMenuOpen", { Default = Library.KeybindFrame.Visible, Text = "Open Keybind Menu", Callback = function(value) Library.KeybindFrame.Visible = value end })
MenuGroup:AddToggle("ShowCustomCursor", { Text = "Custom Cursor", Default = Library.ShowCustomCursor, Callback = function(Value) Library.ShowCustomCursor = Value end })
MenuGroup:AddDropdown("NotificationSide", { Values = { "Left", "Right" }, Default = "Right", Text = "Notification Side", Callback = function(Value) Library:SetNotifySide(Value) end })
MenuGroup:AddDropdown("DPIDropdown", { Values = { "50%", "75%", "100%", "125%", "150%", "175%", "200%" }, Default = "100%", Text = "DPI Scale", Callback = function(Value)
	Value = Value:gsub("%%", "")
	local DPI = tonumber(Value)
	Library:SetDPIScale(DPI)
end})
MenuGroup:AddSlider("UICornerSlider", { Text = "Corner Radius", Default = Library.CornerRadius, Min = 0, Max = 20, Rounding = 0, Callback = function(value) Window:SetCornerRadius(value) end })
MenuGroup:AddDivider()
MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", { Default = "RightShift", NoUI = true, Text = "Menu keybind" })
Library.ToggleKeybind = Options.MenuKeybind

local SessionGroup = Tabs.Settings:AddRightGroupbox("Session")
SessionGroup:AddToggle("AntiAFK", { Text = "Anti-AFK", Default = false })
SessionGroup:AddButton("Unload", function() Library:Unload() end)

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })
ThemeManager:SetFolder("AnimeCardFarm")
SaveManager:SetFolder("AnimeCardFarm/AutoFarm")
SaveManager:BuildConfigSection(Tabs.Settings)
ThemeManager:ApplyToTab(Tabs.Settings)
SaveManager:LoadAutoloadConfig()

-- // ANTI-AFK //
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    if Toggles.AntiAFK and Toggles.AntiAFK.Value then
        vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        task.wait(1)
        vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end
end)

-- ==========================================
-- AUTOMATION LOOPS (PHASE 1)
-- ==========================================
local RS = game:GetService("ReplicatedStorage")
local Remotes = RS:WaitForChild("Remotes", 5)

if Remotes then
    local function GetMyPlot(localPlayer)
        local plotName = localPlayer:GetAttribute("Plot")
        local mapPlots = workspace:FindFirstChild("MAP") and workspace.MAP:FindFirstChild("Plots")
        if not mapPlots then return nil end
        
        if plotName then
            local plotFolder = mapPlots:FindFirstChild(tostring(plotName))
            if plotFolder then return plotFolder end
        end
        
        -- Fallback: Check PlayerNameHover
        for _, plot in ipairs(mapPlots:GetChildren()) do
            local plotN0 = plot:FindFirstChild("Plot_N0")
            if plotN0 then
                local hover = plotN0:FindFirstChild("Hover")
                if hover then
                    local gui = hover:FindFirstChild("BillboardGuiHover")
                    local nameLabel = gui and gui:FindFirstChild("PlayerNameHover")
                    if nameLabel and nameLabel:IsA("TextLabel") then
                        if nameLabel.Text == localPlayer.Name or nameLabel.Text == localPlayer.DisplayName or string.find(nameLabel.Text, localPlayer.Name) or string.find(nameLabel.Text, localPlayer.DisplayName) then
                            return plot
                        end
                    end
                end
            end
        end
        
        return nil
    end

    local function SafeFirePrompt(prompt)
        if prompt and fireproximityprompt then
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            
            if hrp then
                local oldCFrame = hrp.CFrame
                local targetPos = nil
                
                if prompt.Parent:IsA("Attachment") then
                    targetPos = prompt.Parent.WorldPosition
                elseif prompt.Parent:IsA("BasePart") then
                    targetPos = prompt.Parent.Position
                end
                
                if targetPos then
                    -- Teleport to the prompt (slightly above it)
                    hrp.CFrame = CFrame.new(targetPos + Vector3.new(0, 3, 0))
                    task.wait(0.15) -- Give the server time to register our new location
                end
                
                local oldDist = prompt.MaxActivationDistance
                prompt.MaxActivationDistance = math.huge
                task.wait(0.05)
                fireproximityprompt(prompt)
                task.wait(0.3)
                prompt.MaxActivationDistance = oldDist
                
                if targetPos then
                    -- Teleport back to where we were
                    hrp.CFrame = oldCFrame
                    task.wait(0.1)
                end
            end
        end
    end

    local SuffixValues = {
        ["K"] = 1e3, ["M"] = 1e6, ["B"] = 1e9, ["T"] = 1e12, ["QD"] = 1e15, ["QN"] = 1e18,
        ["SX"] = 1e21, ["SP"] = 1e24, ["O"] = 1e27, ["N"] = 1e30, ["DC"] = 1e33, ["UD"] = 1e36,
        ["DD"] = 1e39, ["TD"] = 1e42, ["QID"] = 1e45, ["QAD"] = 1e48, ["SXD"] = 1e51, ["SD"] = 1e54,
        ["OD"] = 1e57, ["ND"] = 1e60, ["VI"] = 1e63, ["DUD"] = 1e66, ["UND"] = 1e69, ["TGV"] = 1e72,
        ["QDV"] = 1e75, ["QNV"] = 1e78, ["SXV"] = 1e81, ["SPV"] = 1e84, ["OCV"] = 1e87, ["NOV"] = 1e90,
        ["QAT"] = 1e93, ["TRT"] = 1e96, ["DUT"] = 1e99, ["CTD"] = 1e102, ["NOD"] = 1e105, ["OCD"] = 1e108,
        ["SPD"] = 1e111, ["TDG"] = 1e123, ["DDG"] = 1e126,
        ["UDG"] = 1e129, ["CTG2"] = 1e132, ["NOG2"] = 1e135, ["OCG2"] = 1e138, ["SPG2"] = 1e141,
        ["SXG2"] = 1e144, ["QIG2"] = 1e147, ["QQG"] = 1e150, ["DQG"] = 1e153, ["UQG"] = 1e156,
        ["CTG"] = 1e159, ["NOG"] = 1e162, ["OCG"] = 1e165, ["SPG"] = 1e168, ["SXG"] = 1e171,
        ["QIG"] = 1e174, ["QAG"] = 1e177, ["TCG"] = 1e180, ["DTG"] = 1e183, ["UTG"] = 1e186,
        ["TT"] = 1e189, ["ST"] = 1e192, ["FT"] = 1e195, ["EN"] = 1e198, ["OT"] = 1e201,
        ["HP"] = 1e204, ["HX"] = 1e207, ["CX"] = 1e210, ["DX"] = 1e213, ["UX"] = 1e216,
        ["TX"] = 1e219, ["QU"] = 1e222, ["QI"] = 1e225, ["SE"] = 1e228, ["IC"] = 1e231,
        ["SC"] = 1e234, ["OG"] = 1e237, ["NV"] = 1e240, ["TC"] = 1e243, ["DU"] = 1e246,
        ["ME"] = 1e249, ["VE"] = 1e252, ["XN"] = 1e255, ["YO"] = 1e258, ["ZE"] = 1e261,
        ["EX"] = 1e264, ["PE"] = 1e267, ["TE"] = 1e270, ["TR"] = 1e273, ["DT"] = 1e276,
        ["UT"] = 1e279, ["TG"] = 1e282, ["OC"] = 1e297, ["NO"] = 1e300, ["CT"] = 1e303
    }
    
    local function ParsePriceStr(text)
        if type(text) ~= "string" then return 0 end
        local t = string.upper(text)
        t = string.gsub(t, "[%$%s,]", "")
        local nStr, sfx = string.match(t, "^([%d%.]+)([A-Z0-9]*)")
        local priceVal = tonumber(nStr) or 0
        if sfx and sfx ~= "" then
            local multiplier = SuffixValues[sfx]
            if multiplier then
                priceVal = priceVal * multiplier
            end
        end
        return priceVal
    end

    -- 1. Auto Claim Rewards
    task.spawn(function()
        while task.wait(5) do
            if Toggles.AutoClaimPlaytimeRewards and Toggles.AutoClaimPlaytimeRewards.Value then
                pcall(function()
                    local PlayTimeRewardRE = Remotes:FindFirstChild("PlayTimeRewardRE")
                    if PlayTimeRewardRE then
                        for i = 1, 14 do
                            PlayTimeRewardRE:FireServer("ClaimReward", { RewardIndex = i })
                        end
                    end
                end)
            end
            
            if Toggles.AutoClaimDailyRewards and Toggles.AutoClaimDailyRewards.Value then
                pcall(function()
                    local DailyRewardRE = Remotes:FindFirstChild("DailyRewardRE")
                    if DailyRewardRE then
                        DailyRewardRE:FireServer("Claim")
                    end
                end)
            end
        end
    end)

    -- 2. Auto Carry & Sell Card Boxes
    task.spawn(function()
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        while task.wait(1) do
            pcall(function()
                if Toggles.AutoCarryFilledBox and Toggles.AutoCarryFilledBox.Value then
                    local plotFolder = GetMyPlot(LocalPlayer)
                    if plotFolder then
                        local plotN0 = plotFolder:FindFirstChild("Plot_N0")
                        local boxModel = plotN0 and plotN0:FindFirstChild("BoxBaseModel")
                        local proxiBox = boxModel and boxModel:FindFirstChild("ProxiBox")
                        local prompt = proxiBox and proxiBox:FindFirstChildWhichIsA("ProximityPrompt")
                        if prompt then
                            SafeFirePrompt(prompt)
                        end
                    end
                    task.wait(Options.BoxDelay.Value)
                end
                
                if Toggles.AutoSellCardBoxes and Toggles.AutoSellCardBoxes.Value then
                    local plotFolder = GetMyPlot(LocalPlayer)
                    if plotFolder then
                        local plotN0 = plotFolder:FindFirstChild("Plot_N0")
                        local sellPart = plotN0 and plotN0:FindFirstChild("SellPart")
                        local prompt = sellPart and sellPart:FindFirstChildWhichIsA("ProximityPrompt", true)
                        if prompt then
                            local backpack = LocalPlayer:FindFirstChild("Backpack")
                            local char = LocalPlayer.Character
                            if backpack and char then
                                local boxTool = backpack:FindFirstChild("Box")
                                if boxTool and boxTool:IsA("Tool") then
                                    local hum = char:FindFirstChild("Humanoid")
                                    if hum then
                                        hum:EquipTool(boxTool)
                                        task.wait(0.2)
                                        SafeFirePrompt(prompt)
                                        task.wait(Options.SellDelay.Value)
                                        hum:UnequipTools()
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end)

    -- 3. Auto Upgrades
    task.spawn(function()
        while task.wait(1) do
            if Toggles.AutoUpgradeSelected and Toggles.AutoUpgradeSelected.Value then
                pcall(function()
                    local UpgradesRE = Remotes:FindFirstChild("UpgradesRE")
                    if UpgradesRE then
                        local selectedUpgrades = Options.UpgradesToBuy.Value
                        if type(selectedUpgrades) == "table" then
                            for upgradeId, enabled in pairs(selectedUpgrades) do
                                if enabled and upgradeId ~= "---" then
                                    UpgradesRE:FireServer("BuyCash", { Id = upgradeId })
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)



    -- 5. Auto Roll Traits & Ranks
    task.spawn(function()
        while task.wait(1) do
            pcall(function()
                if Toggles.AutoRollTraits and Toggles.AutoRollTraits.Value then
                    local TraitRollRE = Remotes:FindFirstChild("TraitRollRE")
                    if TraitRollRE then
                        local stopTraits = Options.StopOnTrait.Value
                        
                        -- If the user selected ANY valid trait
                        if next(stopTraits) ~= nil then
                            local Players = game:GetService("Players")
                            local loopPlayer = Players.LocalPlayer
                            local backpack = loopPlayer and loopPlayer:FindFirstChild("Backpack")
                            
                            for selectedVal, isSelected in pairs(Options.CardsToRoll.Value) do
                                if isSelected and selectedVal ~= "---" then
                                    local targetTool = BackpackCardMap and BackpackCardMap[selectedVal]
                                    if targetTool and backpack and targetTool.Parent == backpack then
                                        local currentTrait = targetTool:GetAttribute("CardTrait")
                                        
                                        -- Stop rolling ONLY if the currentTrait is exactly one of the selected StopOnTraits
                                        if not (currentTrait and stopTraits[currentTrait]) then
                                            TraitRollRE:FireServer("RollTrait", { Tool = targetTool })
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                
                if Toggles.AutoRollRanks and Toggles.AutoRollRanks.Value then
                    local GradeRollRE = Remotes:FindFirstChild("GradeRollRE")
                    if GradeRollRE then
                        local stopGrades = Options.StopOnGrade.Value
                        local rollCurrency = string.lower(Options.RollWith.Value)
                        
                        -- If the user selected ANY valid grade
                        if next(stopGrades) ~= nil then
                            local gradeValues = { ["E"]=1, ["D"]=2, ["C"]=3, ["B"]=4, ["A"]=5, ["S"]=6, ["SS"]=7, ["UR"]=8, ["LR"]=9, ["MR"]=10 }
                            
                            local Players = game:GetService("Players")
                            local loopPlayer = Players.LocalPlayer
                            local backpack = loopPlayer and loopPlayer:FindFirstChild("Backpack")
                            
                            for selectedVal, isSelected in pairs(Options.CardsToRoll.Value) do
                                if isSelected and selectedVal ~= "---" then
                                    local targetTool = BackpackCardMap and BackpackCardMap[selectedVal]
                                    if targetTool and backpack and targetTool.Parent == backpack then
                                        local currentGrade = targetTool:GetAttribute("CardGrade")
                                        local currentGradeVal = currentGrade and gradeValues[currentGrade] or 0
                                        
                                        -- Find the lowest numerical value of the selected stop grades
                                        local targetGradeVal = 999 
                                        for gradeName, enabled in pairs(stopGrades) do
                                            if enabled and gradeValues[gradeName] then
                                                if gradeValues[gradeName] < targetGradeVal then
                                                    targetGradeVal = gradeValues[gradeName]
                                                end
                                            end
                                        end
                                        
                                        -- If it's less than the lowest target, keep rolling
                                        if targetGradeVal ~= 999 and currentGradeVal < targetGradeVal then
                                            GradeRollRE:FireServer("RollGrade", {
                                                Tool = targetTool,
                                                Currency = rollCurrency
                                            })
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end)
            task.wait(Options.RollRetryDelay and Options.RollRetryDelay.Value or 1)
        end
    end)


    -- 7. Conveyor Auto Buy / Auto Skip (Pack Interception)
    task.spawn(function()
        local ConveyorRE = Remotes:WaitForChild("ConveyorRE", 5)
        if ConveyorRE then
            ConveyorRE.OnClientEvent:Connect(function(action, data)
                if action == "SpawnAndMoveToB" and type(data) == "table" then
                    local itemId = data.ItemId
                    local rarity = data.Rarity
                    local mutation = data.Mutation
                    
                    if Toggles.AutoBuyMatching and Toggles.AutoBuyMatching.Value then
                        local wantedRarities = Options.FarmRarity.Value
                        local wantedMutations = Options.FarmMutation.Value
                        
                        local rarityMatch = false
                        if next(wantedRarities) == nil then
                            rarityMatch = true
                        elseif rarity and wantedRarities[rarity] then
                            rarityMatch = true
                        end
                        
                        local mutationMatch = false
                        if next(wantedMutations) == nil then
                            mutationMatch = true
                        elseif mutation and wantedMutations[mutation] then
                            mutationMatch = true
                        end
                        
                        if rarityMatch and mutationMatch then
                            -- Bypass the physical conveyor, instantly claim and buy
                            ConveyorRE:FireServer("ReachedB", { ItemId = itemId })
                            ConveyorRE:FireServer("TryBuy", { ItemId = itemId })
                        else
                            -- Instantly destroy the pack if it's not a match
                            ConveyorRE:FireServer("ReachedC", { ItemId = itemId })
                        end
                    end
                end
            end)
        end
    end)

    -- 8. Auto Spawn Pack (ClickDetector bypass)
    task.spawn(function()
        while task.wait() do
            if Toggles.AutoSpawnPack and Toggles.AutoSpawnPack.Value then
                pcall(function()
                    local localPlayer = game:GetService("Players").LocalPlayer
                    local plotFolder = GetMyPlot(localPlayer)
                    if plotFolder then
                        local plotN0 = plotFolder:FindFirstChild("Plot_N0")
                        if plotN0 then
                            local buttonPart = plotN0:FindFirstChild("ButtonPart")
                            local clickDetector = buttonPart and buttonPart:FindFirstChildWhichIsA("ClickDetector")
                            
                            if not clickDetector then
                                local sellPart = plotN0:FindFirstChild("SellPart")
                                clickDetector = sellPart and sellPart:FindFirstChildWhichIsA("ProximityPrompt") or sellPart and sellPart:FindFirstChildWhichIsA("ClickDetector")
                            end
                                
                                if clickDetector and fireclickdetector then
                                    -- Fire every plot's button (the game will only accept clicks on the one you own)
                                    fireclickdetector(clickDetector)
                                end
                        end
                    end
                end)
                task.wait(Options.SpawnDelay.Value)
            end
        end
    end)

    -- 9. Auto Upgrade Conveyor
    task.spawn(function()
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        while task.wait(1) do
            if Toggles.AutoUpgradeConveyor and Toggles.AutoUpgradeConveyor.Value then
                pcall(function()
                    local plotFolder = GetMyPlot(LocalPlayer)
                    if plotFolder and plotFolder:FindFirstChild("Plot_N0") then
                        local plotN0 = plotFolder.Plot_N0
                        local conveyorModel = plotN0:FindFirstChild("UpgradeConveyor")
                        local conveyorPart = conveyorModel and conveyorModel:FindFirstChild("UpgradeConveyorPart")
                        local prompt = conveyorPart and conveyorPart:FindFirstChildWhichIsA("ProximityPrompt")
                        local bbGui = conveyorPart and conveyorPart:FindFirstChild("BillboardGuiUpgrade")
                        local priceLbl = bbGui and bbGui:FindFirstChild("Price")
                        
                        if prompt and priceLbl and priceLbl:IsA("TextLabel") then
                            local price = ParsePriceStr(priceLbl.Text)
                            local playerCash = LocalPlayer:FindFirstChild("CashValue")
                            
                            -- Only proceed if the price is valid and player can afford it (max level price is usually 'MAX' or 0)
                            if playerCash and price > 0 and playerCash.Value >= price then
                                SafeFirePrompt(prompt)
                                task.wait(0.2)
                                
                                local ConveyorUpgradeRE = Remotes:FindFirstChild("ConveyorUpgradeRE")
                                if ConveyorUpgradeRE then
                                    ConveyorUpgradeRE:FireServer("ConfirmUpgrade")
                                end
                                task.wait(1) -- extra delay after successful upgrade
                            end
                        end
                    end
                end)
            end
        end
    end)

    -- 10. Auto Equip Best Cards & Auto Sell All
    task.spawn(function()
        while task.wait(1) do
            pcall(function()
                -- Auto Sell All
                if Toggles.AutoSellAllCards and Toggles.AutoSellAllCards.Value then
                    local SellRE = Remotes:FindFirstChild("SellRE")
                    if SellRE then
                        SellRE:FireServer("SellAll")
                    end
                    task.wait(Options.CardSellDelay.Value)
                end
                
                -- Auto Sell By Rarity
                if Toggles.AutoSellByRarity and Toggles.AutoSellByRarity.Value then
                    local SellRE = Remotes:FindFirstChild("SellRE")
                    if SellRE then
                        local selectedRarities = Options.RaritiesToSell.Value
                        if type(selectedRarities) == "table" and next(selectedRarities) ~= nil then
                            local Players = game:GetService("Players")
                            local loopPlayer = Players.LocalPlayer
                            local backpack = loopPlayer and loopPlayer:FindFirstChild("Backpack")
                            local char = loopPlayer and loopPlayer.Character
                            local hum = char and char:FindFirstChild("Humanoid")
                            
                            if backpack and hum then
                                for _, tool in ipairs(backpack:GetChildren()) do
                                    if tool:IsA("Tool") then
                                        -- Check both possible attribute names for Rarity based on user reports
                                        local rarity = tool:GetAttribute("CardRarity") or tool:GetAttribute("Card")
                                        if rarity and selectedRarities[rarity] then
                                            hum:EquipTool(tool)
                                            task.wait(0.1)
                                            SellRE:FireServer("SellHand")
                                            task.wait(Options.CardSellDelay.Value)
                                            hum:UnequipTools()
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end)
    
    task.spawn(function()
        while task.wait(1) do
            pcall(function()
                -- Auto Equip Best
                if Toggles.AutoEquipBestCards and Toggles.AutoEquipBestCards.Value then
                    local CardSlotRE = RS:FindFirstChild("CardSlotRE")
                    if CardSlotRE then
                        CardSlotRE:FireServer("EquipBest")
                    end
                    task.wait(Options.EquipEvery.Value)
                end
            end)
        end
    end)

    -- 11. Auto Upgrade Placed Cards
    task.spawn(function()
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        while task.wait(1) do
            if Toggles.AutoUpgradePlacedCards and Toggles.AutoUpgradePlacedCards.Value then
                pcall(function()
                    local CardSlotRE = RS:FindFirstChild("CardSlotRE")
                    if CardSlotRE then
                        local selectedSlots = Options.SlotsToUpgrade.Value
                        local slotsToTry = {}
                        
                        for slotStr, isSelected in pairs(selectedSlots) do
                            if isSelected then
                                if slotStr == "All" then
                                    slotsToTry = {}
                                    for i = 1, 90 do table.insert(slotsToTry, i) end
                                    break
                                else
                                    local num = string.match(slotStr, "%d+")
                                    if num then table.insert(slotsToTry, tonumber(num)) end
                                end
                            end
                        end
                        
                        local plotFolder = GetMyPlot(LocalPlayer)
                        local plotN0 = plotFolder and plotFolder:FindFirstChild("Plot_N0")
                        local stopLevel = tonumber(Options.StopAtLevel.Value) or 50
                        
                        local allSlots = {}
                        if plotN0 then
                            for _, desc in ipairs(plotN0:GetDescendants()) do
                                if string.match(desc.Name, "^CardSlot%d+$") then
                                    allSlots[desc.Name] = desc
                                end
                            end
                        end
                        
                        for _, slotIdx in ipairs(slotsToTry) do
                            local shouldUpgrade = true
                            
                            -- Read from the physical plot slot UpgradePart attributes
                            if plotN0 then
                                local slotModel = allSlots["CardSlot" .. tostring(slotIdx)]
                                if slotModel then
                                    local upgradePart = slotModel:FindFirstChild("UpgradePart")
                                    if upgradePart then
                                        local isMax = upgradePart:GetAttribute("IsMaxLevel")
                                        local currentLvl = upgradePart:GetAttribute("CardLevel")
                                        local cost = upgradePart:GetAttribute("UpgradeCost")
                                        
                                        if isMax then
                                            shouldUpgrade = false
                                        elseif currentLvl and currentLvl >= stopLevel then
                                            shouldUpgrade = false
                                        end
                                        
                                        if shouldUpgrade and cost then
                                            local maxCost = tonumber(Options.MaxCostPerUpgrade.Value) or 0
                                            if maxCost > 0 and cost > maxCost then
                                                shouldUpgrade = false
                                            end
                                            
                                            local reserve = tonumber(Options.KeepCashReserve.Value) or 0
                                            if reserve > 0 then
                                                local playerCash = LocalPlayer:FindFirstChild("CashValue")
                                                if playerCash and (playerCash.Value - cost) < reserve then
                                                    shouldUpgrade = false
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                            
                            if shouldUpgrade then
                                CardSlotRE:FireServer("UpgradeCard", { SlotIndex = slotIdx })
                            end
                            task.wait(Options.UpgradeDelay.Value)
                        end
                    end
                end)
            end
        end
    end)

    -- 12. Auto Infinity Tower (Battle & Spoofing)
    local function hasAlreadyFoughtBoss()
        local guiMid = LocalPlayer.PlayerGui:FindFirstChild("GuiMid")
        local stack = guiMid and guiMid:FindFirstChild("Stack")
        if stack then
            for _, child in ipairs(stack:GetChildren()) do
                -- TemplateText is a property on the notification frame, not a child
                local ok, tmpl = pcall(function() return child.TemplateText end)
                if ok and type(tmpl) == "string" and string.match(string.lower(tmpl), "you already fought the boss") then
                    return true
                end
            end
        end
        return false
    end

    local function isRaidPriorityActive()
        if not (Toggles.RaidPriority and Toggles.RaidPriority.Value) then return false end
        if hasAlreadyFoughtBoss() then return false end
        
        local raidModel = workspace:FindFirstChild("BossRaidModel")
        local gui = raidModel and raidModel:FindFirstChild("Gui")
        local bb = gui and gui:FindFirstChild("BillboardGui")
        local timerLbl = bb and bb:FindFirstChild("Timer")
        
        if timerLbl and timerLbl:IsA("TextLabel") then
            local text = string.lower(timerLbl.Text)
            if string.match(text, "end in") then
                return true
            end
        end
        return false
    end
    
    local function PickUpBestCardsFromPlot(cardsToPick, onlyIfBetter)
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        
        -- Ensure character is fully loaded
        local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local hrp = character:WaitForChild("HumanoidRootPart", 5)
        
        local plotFolder = GetMyPlot(LocalPlayer)
        if plotFolder then
            local plotN0 = plotFolder:FindFirstChild("Plot_N0")
            if plotN0 then
                -- Teleport to plot to ensure proximity prompts are in range and streamed in
                if hrp then
                    for _, slot in ipairs(plotN0:GetDescendants()) do
                        if string.match(slot.Name, "^CardSlot%d+$") then
                            local part = slot:IsA("BasePart") and slot or slot:FindFirstChildWhichIsA("BasePart")
                            if part then
                                hrp.CFrame = part.CFrame * CFrame.new(0, 5, 0)
                                
                                local maxWait = 10
                                while maxWait > 0 do
                                    local foundPrompt = false
                                    for _, s in ipairs(plotN0:GetDescendants()) do
                                        if string.match(s.Name, "^CardSlot%d+$") then
                                            local ph = s:FindFirstChild("PromptHolder")
                                            if ph and ph:FindFirstChildWhichIsA("ProximityPrompt") then
                                                foundPrompt = true
                                                break
                                            end
                                        end
                                    end
                                    if foundPrompt then break end
                                    task.wait(0.5)
                                    maxWait = maxWait - 1
                                end
                                break
                            end
                        end
                    end
                end
                
                cardsToPick = tonumber(cardsToPick) or 4
                local backpackThreshold = -1
                
                if onlyIfBetter then
                    local bpCards = {}
                    local backpack = LocalPlayer:FindFirstChild("Backpack")
                    if backpack then
                        for _, tool in ipairs(backpack:GetChildren()) do
                            if tool:IsA("Tool") then
                                local priceVal = 0
                                local guiHolder = tool:FindFirstChild("GuiHolder")
                                local bbInfo = guiHolder and guiHolder:FindFirstChild("BillboardGuiInfo")
                                local priceLbl = bbInfo and bbInfo:FindFirstChild("Price")
                                if priceLbl and priceLbl:IsA("TextLabel") then
                                    priceVal = ParsePriceStr(priceLbl.Text)
                                end
                                table.insert(bpCards, priceVal)
                            end
                        end
                    end
                    table.sort(bpCards, function(a, b) return a > b end)
                    if #bpCards >= cardsToPick then
                        backpackThreshold = bpCards[cardsToPick]
                    end
                end
                
                local availableCards = {}
                for _, slot in ipairs(plotN0:GetDescendants()) do
                    if string.match(slot.Name, "^CardSlot%d+$") then
                        local promptHolder = slot:FindFirstChild("PromptHolder")
                        local prompt = promptHolder and promptHolder:FindFirstChildWhichIsA("ProximityPrompt")
                        if prompt and prompt.ActionText == "Remove" then
                            local priceVal = 0
                            local guiHolder = slot:FindFirstChild("GuiHolder")
                            local bbInfo = guiHolder and guiHolder:FindFirstChild("BillboardGuiInfo")
                            local priceLbl = bbInfo and bbInfo:FindFirstChild("Price")
                            if priceLbl and priceLbl:IsA("TextLabel") then
                                priceVal = ParsePriceStr(priceLbl.Text)
                            end
                            table.insert(availableCards, { Prompt = prompt, Price = priceVal })
                        end
                    end
                end
                
                table.sort(availableCards, function(a, b) return a.Price > b.Price end)
                
                local pickedUpCount = 0
                for i = 1, math.min(cardsToPick, #availableCards) do
                    if availableCards[i].Price > backpackThreshold then
                        SafeFirePrompt(availableCards[i].Prompt)
                        pickedUpCount = pickedUpCount + 1
                        task.wait(0.4)
                    end
                end
                
                if pickedUpCount > 0 then
                    task.wait(1.5)
                end
            end
        end
    end

    task.spawn(function()
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        local wasInBattle = false
        while task.wait(1) do
            if Toggles.AutoStartBattles and Toggles.AutoStartBattles.Value then
                pcall(function()
                    local InfinityTowerRE = Remotes:FindFirstChild("InfinityTowerRE")
                    local CardSlotRE = RS:FindFirstChild("CardSlotRE")
                    
                    if InfinityTowerRE then
                        local floorFrame = LocalPlayer.PlayerGui:FindFirstChild("InfinityTowerGui")
                        local handler = floorFrame and floorFrame:FindFirstChild("Handler")
                        local towerFrame = handler and handler:FindFirstChild("InfinityTowerFrame")
                        local isInBattle = (towerFrame ~= nil and towerFrame.Visible == true)
                        
                        -- If we just ENTERED a battle, put the cards back on the plot to double-dip!
                        if not wasInBattle and isInBattle then
                            if Toggles.ReturnCardsAfterBattle and Toggles.ReturnCardsAfterBattle.Value then
                                if not isRaidPriorityActive() then
                                    if CardSlotRE then
                                        CardSlotRE:FireServer("EquipBest")
                                    end
                                end
                            end
                        end
                        wasInBattle = isInBattle
                        
                        -- 6. Raid Priority Override
                        if isRaidPriorityActive() then
                            if isInBattle then
                                -- Leave tower immediately for raid!
                                local exitBtn = towerFrame:FindFirstChild("Exit")
                                if exitBtn then
                                    if type(firesignal) == "function" then
                                        pcall(firesignal, exitBtn.MouseButton1Click)
                                    elseif type(getconnections) == "function" then
                                        local conns = getconnections(exitBtn.MouseButton1Click)
                                        for _, conn in ipairs(conns) do
                                            pcall(function() conn:Fire() end)
                                        end
                                    end
                                end
                            end
                            return -- Block any other tower activity
                        end
                        
                        if isInBattle then
                            -- 5. Auto Leave Tower
                            if Toggles.AutoLeaveTower and Toggles.AutoLeaveTower.Value then
                                local targetFloor = tonumber(Options.TargetLeaveFloor.Value) or 1
                                local floorFrameElement = towerFrame:FindFirstChild("FloorFrame")
                                local textLbl = floorFrameElement and floorFrameElement:FindFirstChild("Floor")
                                
                                if textLbl and textLbl:IsA("TextLabel") then
                                    local currentFloor = tonumber(string.match(textLbl.Text, "%d+"))
                                    if currentFloor and currentFloor >= targetFloor then
                                        -- We reached the target floor! Leave natively!
                                        local exitBtn = towerFrame:FindFirstChild("Exit")
                                        if exitBtn then
                                            if type(firesignal) == "function" then
                                                pcall(firesignal, exitBtn.MouseButton1Click)
                                            elseif type(getconnections) == "function" then
                                                local conns = getconnections(exitBtn.MouseButton1Click)
                                                for _, conn in ipairs(conns) do
                                                    pcall(function() conn:Fire() end)
                                                end
                                            end
                                        end
                                        task.wait(1.5) -- Wait while the game processes the exit and closes the UI
                                    end
                                end
                            end
                        else
                            -- 1. Rotate Cards (Pick them up from slots)
                            if Toggles.PickUpBestCards and Toggles.PickUpBestCards.Value then
                                PickUpBestCardsFromPlot(Options.CardsToPickUp.Value, Toggles.OnlyIfBetter.Value)
                            end
    
                            -- 2. Construct Team and Start Battle natively using UI Signals
                            local guiMid = LocalPlayer.PlayerGui:WaitForChild("GuiMid", 5)
                            if guiMid then
                                local infTower = guiMid:WaitForChild("InfinityTower", 5)
                                if infTower then
                                    local infFrame = infTower:WaitForChild("InfinityTowerFrame", 5)
                                    if infFrame then
                                        -- Native Equip Best
                                        if Toggles.AutoEquipBestTower and Toggles.AutoEquipBestTower.Value then
                                            local equipBestBtn = infFrame:WaitForChild("EQUIPEBEST", 5)
                                            if equipBestBtn then
                                                if type(firesignal) == "function" then
                                                    pcall(firesignal, equipBestBtn.MouseButton1Click)
                                                elseif type(getconnections) == "function" then
                                                    local conns = getconnections(equipBestBtn.MouseButton1Click)
                                                    for _, conn in ipairs(conns) do
                                                        pcall(function() conn:Fire() end)
                                                    end
                                                end
                                            end
                                            task.wait(0.5)
                                        end
                                        
                                        -- Native Start Battle
                                        local battleBtn = infFrame:WaitForChild("BATTLE", 5)
                                        if battleBtn then
                                            if type(firesignal) == "function" then
                                                pcall(firesignal, battleBtn.MouseButton1Click)
                                            elseif type(getconnections) == "function" then
                                                local conns = getconnections(battleBtn.MouseButton1Click)
                                                for _, conn in ipairs(conns) do
                                                    pcall(function() conn:Fire() end)
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end)
                task.wait(Options.TowerRetryDelay.Value)
            end
        end
    end)

    -- 12.5. Auto Boss Raid
    task.spawn(function()
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        local wasInRaid = false
        while task.wait(1) do
            if Toggles.AutoRaid and Toggles.AutoRaid.Value then
                pcall(function()
                    local CardSlotRE = RS:FindFirstChild("CardSlotRE")
                    
                    -- Check if we are actively fighting the boss
                    local bossRaidGui = LocalPlayer.PlayerGui:FindFirstChild("BossRaidGui")
                    local bossHandler = bossRaidGui and bossRaidGui:FindFirstChild("Handler")
                    local inRaidFrame = bossHandler and bossHandler:FindFirstChild("BossRaidFrame")
                    local isInRaid = (inRaidFrame ~= nil and inRaidFrame.Visible == true)
                    
                    -- Double-dip logic: If we just entered the raid, put cards back on the plot!
                    if not wasInRaid and isInRaid then
                        if Toggles.ReturnCardsAfterBattle and Toggles.ReturnCardsAfterBattle.Value then
                            if CardSlotRE then
                                CardSlotRE:FireServer("EquipBest")
                            end
                        end
                    end
                    wasInRaid = isInRaid
                    
                    -- If we are actively fighting the boss, abort the join loop to prevent spam!
                    if isInRaid then
                        return
                    end
                    
                    -- If we already fought the boss this hour, skip raid entirely
                    if hasAlreadyFoughtBoss() then
                        return
                    end
                    
                    -- First, check if the Raid is actually open using our priority function logic
                    local raidModel = workspace:FindFirstChild("BossRaidModel")
                    local gui = raidModel and raidModel:FindFirstChild("Gui")
                    local bb = gui and gui:FindFirstChild("BillboardGui")
                    local timerLbl = bb and bb:FindFirstChild("Timer")
                    
                    local isOpen = false
                    if timerLbl and timerLbl:IsA("TextLabel") then
                        local text = string.lower(timerLbl.Text)
                        if string.match(text, "end in") then
                            isOpen = true
                        end
                    end
                    
                    if isOpen then
                        local guiMid = LocalPlayer.PlayerGui:WaitForChild("GuiMid", 5)
                        local raidGui = guiMid and guiMid:WaitForChild("BossRaid", 3)
                        
                        if raidGui then
                            -- Rotate Cards before joining
                            if Toggles.RaidPickUpBestCards and Toggles.RaidPickUpBestCards.Value then
                                PickUpBestCardsFromPlot(Options.RaidCardsToPickUp.Value, Toggles.RaidOnlyIfBetter.Value)
                            end
                            
                            -- 1. Equip Best Team
                            if Toggles.RaidEquipBestTeam and Toggles.RaidEquipBestTeam.Value then
                                local equipBestButton = LocalPlayer.PlayerGui
                                    :WaitForChild("GuiMid")
                                    :WaitForChild("BossRaid")
                                    :WaitForChild("BossRaidFrame")
                                    :WaitForChild("EQUIPEBEST")
                                firesignal(equipBestButton.MouseButton1Click)
                                task.wait(2)
                            end

                            -- 2. Select Difficulty
                            local targetDiff = Options.RaidDifficulty.Value or "Easy"
                            local diffMap = { ["Normal"] = "Medium" }
                            local gameDiffName = diffMap[targetDiff] or targetDiff
                            local diffButton = LocalPlayer.PlayerGui
                                :WaitForChild("GuiMid")
                                :WaitForChild("BossRaid")
                                :WaitForChild("DifficultyFrame")
                                :WaitForChild("ScrollingFrameDifficulty")
                                :WaitForChild(gameDiffName)
                                :WaitForChild("FrameButton")
                            firesignal(diffButton.MouseButton1Click)
                            task.wait(2)

                            -- 3. Start Battle
                            local battleButton = LocalPlayer.PlayerGui
                                :WaitForChild("GuiMid")
                                :WaitForChild("BossRaid")
                                :WaitForChild("BossRaidFrame")
                                :WaitForChild("BATTLE")
                            firesignal(battleButton.MouseButton1Click)
                        end
                    end
                end)
                task.wait(Options.RaidRetryDelay.Value)
            end
        end
    end)
    -- 13. Plot Slot Management (Place/Open/Remove Packs & Cards)
    task.spawn(function()
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        while task.wait(0.5) do
            pcall(function()
                local plotFolder = GetMyPlot(LocalPlayer)
                if plotFolder and plotFolder:FindFirstChild("Plot_N0") then
                    local plotN0 = plotFolder.Plot_N0
                    
                    local doPlace = Toggles.AutoPlacePacks and Toggles.AutoPlacePacks.Value
                    local doOpen = Toggles.AutoOpenReadyCards and Toggles.AutoOpenReadyCards.Value
                    local doRemove = Toggles.AutoPickUpReadyCards and Toggles.AutoPickUpReadyCards.Value
                    
                    if doPlace or doOpen or doRemove then
                        for _, slot in ipairs(plotN0:GetDescendants()) do
                            if string.match(slot.Name, "^CardSlot%d+$") then
                                local promptHolder = slot:FindFirstChild("PromptHolder")
                                local prompt = promptHolder and promptHolder:FindFirstChildWhichIsA("ProximityPrompt")
                                
                                if prompt then
                                    local action = prompt.ActionText
                                    
                                    if action == "Open" and doOpen then
                                        SafeFirePrompt(prompt)
                                        task.wait(0.2)
                                    elseif action == "Remove" and doRemove then
                                        SafeFirePrompt(prompt)
                                        task.wait(Options.PickUpDelay and Options.PickUpDelay.Value or 0.2)
                                    elseif action == "Place" and doPlace then
                                        local packsToPlace = Options.PacksToPlace.Value
                                        if next(packsToPlace) ~= nil then
                                            local backpack = LocalPlayer:FindFirstChild("Backpack")
                                            local char = LocalPlayer.Character
                                            if backpack and char then
                                                local packToEquip
                                                for _, tool in ipairs(backpack:GetChildren()) do
                                                    if tool:IsA("Tool") and packsToPlace[tool.Name] then
                                                        packToEquip = tool
                                                        break
                                                    end
                                                end
                                                
                                                if packToEquip then
                                                    local hum = char:FindFirstChild("Humanoid")
                                                    if hum then
                                                        hum:EquipTool(packToEquip)
                                                        task.wait(0.2)
                                                        SafeFirePrompt(prompt)
                                                        task.wait(0.2)
                                                        hum:UnequipTools()
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end)
    
    -- 14. Auto Use Potions
    task.spawn(function()
        local PotionsMapping = {
            ["Cash I"] = "CashPotion1", ["Cash II"] = "CashPotion2", ["Cash III"] = "CashPotion3",
            ["Luck I"] = "LuckPotion1", ["Luck II"] = "LuckPotion2", ["Luck III"] = "LuckPotion3",
            ["Mutation I"] = "MutationPotion1", ["Mutation II"] = "MutationPotion2", ["Mutation III"] = "MutationPotion3",
            ["Production I"] = "ProductionPotion1", ["Production II"] = "ProductionPotion2", ["Production III"] = "ProductionPotion3",
            ["Time I"] = "TimePotion1", ["Time II"] = "TimePotion2", ["Time III"] = "TimePotion3"
        }
        
        while task.wait(1) do
            if Toggles.AutoUsePotions and Toggles.AutoUsePotions.Value then
                pcall(function()
                    local ItemsRE = Remotes:FindFirstChild("ItemsRE")
                    if ItemsRE then
                        local selectedPotions = Options.PotionsToUse.Value
                        if type(selectedPotions) == "table" then
                            for visualName, enabled in pairs(selectedPotions) do
                                if enabled and PotionsMapping[visualName] then
                                    ItemsRE:FireServer("UseItem", {
                                        ItemId = PotionsMapping[visualName],
                                        Amount = 1
                                    })
                                end
                            end
                        end
                    end
                end)
                task.wait(math.max(1, (Options.PotionCheckDelay.Value or 15) - 1))
            end
        end
    end)
end
