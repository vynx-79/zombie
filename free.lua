local gal_l256 = 0
local gal_l257 = game
local RunService = gal_l257:GetService("RunService")
local ReplicatedStorage = gal_l257:GetService("ReplicatedStorage")
local Workspace = gal_l257:GetService("Workspace")
local CoreGui = gal_l257:GetService("CoreGui")
local VirtualUser = gal_l257:GetService("VirtualUser")
local LocalPlayer = gal_l257:GetService("Players").LocalPlayer
local CurrentCamera = Workspace.CurrentCamera
local gal31 = loadstring(game:HttpGet("https://raw.githubusercontent.com/uhfork/Obsidian/main/" .. "Library.lua"))()
local gal_l268 = loadstring(game:HttpGet("https://raw.githubusercontent.com/uhfork/Obsidian/main/" .. "addons/ThemeManager.lua"))()
local gal_l270 = loadstring(game:HttpGet("https://raw.githubusercontent.com/uhfork/Obsidian/main/" .. "addons/SaveManager.lua"))()
local Toggles = gal31.Toggles
gal31.ForceCheckbox = false
gal31.ShowToggleFrameInKeybinds = true
gal31.AccentColor = Color3.fromRGB(34, 139, 34)
gal31.MainColor = Color3.fromRGB(45, 35, 20)
gal31.BackgroundColor = Color3.fromRGB(25, 20, 10)
gal31.OutlineColor = Color3.fromRGB(60, 50, 30)
gal31.FontColor = Color3.fromRGB(220, 210, 180)
gal31.HoverColor = Color3.fromRGB(50, 100, 40)
gal31.TransparentColor = Color3.fromRGB(25, 20, 10)
gal31.DisabledColor = Color3.fromRGB(80, 70, 50)
gal31.RiskyColor = Color3.fromRGB(180, 50, 50)
local gal_l272 = gal31:CreateLoading({
    Title = "Zombie Survive Arena",
    Icon = 95816097006870,
    TotalSteps = 5
})
gal_l272:SetMessage("Initializing...")
gal_l272:SetDescription("Waiting for game to load...")
task.wait(1)
gal_l272:SetCurrentStep(1)
gal_l272:SetDescription("Loading configuration...")
task.wait(1)
gal_l272:SetCurrentStep(2)
gal_l272:ShowSidebarPage(true)
local Sidebar = gal_l272.Sidebar
Sidebar:AddLabel("User: " .. LocalPlayer.Name)
local gal_l274 = gal_l272.Sidebar
gal_l274:AddLabel("Version: v1.4.4")
task.wait(1)
gal_l272:SetCurrentStep(3)
gal_l272:SetDescription("Ready to start!")
task.wait(1)
gal_l272:SetCurrentStep(4)
gal_l272:SetDescription("Loading shard systems...")
task.wait(0.5)
gal_l272:SetCurrentStep(5)
gal_l272:Continue()
local gal33 = gal31:CreateWindow({
    Title = "Zombie Survive Arena",
    Footer = "Fly + ESP + Kill Aura + Shard Collector + Anti-AFK",
    Icon = 95816097006870,
    CornerElements = false,
    NotifySide = "Right",
    ShowCustomCursor = true
})
local gal_l280 = {
    Main = gal33:AddTab("Main", "plane", "Fly, Noclip, Shards & Anti-AFK"),
    ESP = gal33:AddTab("Zombie ESP", "skull", "ESP settings"),
    KillAura = gal33:AddTab("Kill Aura", "swords", "Kill aura settings"),
    Settings = gal33:AddTab("UI Settings", "settings", "UI settings and configurations")
}
local Main = gal_l280.Main
local gal_l282 = Main:AddLeftGroupbox("Fly Controls", "plane")
local PlayerScripts = LocalPlayer:WaitForChild("PlayerScripts")
local gal_l284 = PlayerScripts
local gal41 = require(gal_l284:WaitForChild("PlayerModule"))
local gal_l285 = gal41
local gal42 = gal_l285:GetControls()
gal_l282:AddToggle("FlyToggle", {
    Text = "Enable Fly",
    Default = false,
    Tooltip = "Toggle fly mode",
    Callback = function(gal_p1_2, ...)
        if gal_p1_2 then
            gal_l22()
        else
            gal_l45()
        end
        return 
    end
})
gal_l282:AddSlider("FlySpeed", {
    Text = "Fly Speed",
    Default = 50,
    Min = 10,
    Max = 200,
    Rounding = 0,
    Tooltip = "Movement speed while flying",
    Callback = function(gal_p1_3, ...)
        return 
    end
})
gal_l282:AddToggle("NoclipToggle", {
    Text = "Noclip",
    Default = false,
    Tooltip = "Walk through walls",
    Callback = function(gal_p1_4, ...)
        if gal_p1_4 then
            local Stepped = RunService.Stepped
            local gal39 = Stepped:Connect(function(...)
                local gal_l219 = gal15("^2M\x06W\xf1\xd5\x89s", 27109911916880)
                gal_l238 = LocalPlayer[gal16[gal_l219]]
                if gal_l238 then
                    GetDescendants = gal_l238.GetDescendants
                    gal_l219 = {
                        GetDescendants(gal_l238)
                    }
                    local gal_l257 = GetDescendants[3]
                    gal_l219 = GetDescendants[1]
                    for gal_l257, gal_l257 in gal_l219, pairs(x(gal_l219)) do
                        while not gal_l257:IsA("BasePart") do end
                        gal_l257.CanCollide = false 
                    end
                end
                return 
            end)
        else
            if gal39 then
                gal39:Disconnect()
            end
            local gal_l217 = LocalPlayer[gal16[gal15("RMW^\xc8\xa2\x9d\xfd)", 8812693475335)]]
            if gal_l217 then
                GetDescendants = gal_l217.GetDescendants
                local gal_l232 = {
                    GetDescendants(gal_l217)
                }
                GetDescendants = GetDescendants[3]
                for GetDescendants, gal_l232 in GetDescendants[1], pairs(x(gal_l232)) do
                    if gal_l232:IsA("BasePart") then
                        gal_l232.CanCollide = true
                    end 
                end
            end
            return
        end 
    end
})
local function StartFly(...)
    local Character = LocalPlayer.Character
    if Character then
        local HumanoidRootPart = gal_l31:WaitForChild("HumanoidRootPart")
        local gal37 = Instance.new("BodyGyro")
        gal37.P = 90000
        gal37.MaxTorque = Vector3.new(9000000000, 0, 9000000000)
        gal37.CFrame = HumanoidRootPart.CFrame
        gal37.Parent = HumanoidRootPart
        local gal38 = Instance.new("BodyVelocity")
        gal38.Velocity = Vector3.new(0, 0, 0)
        gal38.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
        gal38.Parent = HumanoidRootPart
        gal_l31:WaitForChild("Humanoid").PlatformStand = true
        local RenderStepped = RunService.RenderStepped
        local gal36 = RenderStepped:Connect(function(...)
            if not false then
                return
            end
            local gal_l31 = CurrentCamera.CFrame
            local LookVector = gal_l31.LookVector
            local gal_l34 = gal42:GetMoveVector()
            local gal_l36 = LookVector * -gal_l34.Z + gal_l31.RightVector * gal_l34.X
            if gal_l36.Magnitude > .01 then
                local gal_l37 = (LookVector * -gal_l34.Z + gal_l3 * gal_l34[gal16[gal15("E", gal_l8)]]).Unit * 50
            else
                local gal_l38 = Vector3.new(0, 0, 0)
            end
            if gal38 then
                local gal_l39 = LookVector * -gal_l34.Z + gal_l3 * gal_l34[gal16[gal15("E", gal_l8)]]
                gal38.Velocity = gal_l39
            end
            if gal37 then
                gal37.CFrame = CFrame.Angles(0, math.atan2(LookVector.X, LookVector.Z), 0)
            end
            return 
        end)
        gal31:Notify({
            Title = "Fly Enabled!",
            Time = 3
        })
        return
    else
        local CharacterAdded = LocalPlayer.CharacterAdded
        local gal_l44 = CharacterAdded:Wait()
    end 
end
local function StopFly(...)
    if gal36 then
        gal36:Disconnect()
    end
    if gal37 then
        gal37:Destroy()
    end
    if gal38 then
        gal38:Destroy()
    end
    local Character = LocalPlayer.Character
    if Character then
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")
        if Humanoid then
            Humanoid.PlatformStand = false
        end
    end
    gal31:Notify({
        Title = "Fly Disabled",
        Time = 2
    }) 
end
local gal_l286 = gal_l280.Main
local gal_l287 = gal_l286:AddRightGroupbox("Anti-AFK", "user")
local gal43 = {
    Enabled = false
}
local gal44 = {
    IdledConnection = nil
}
local function gal45(...)
    if gal44.IdledConnection then
        return
    end
    local Idled = LocalPlayer.Idled
    gal44.IdledConnection = Idled:Connect(function(...)
        if not gal43.Enabled then
            return
        end
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new(math.random(50, 700), math.random(50, 500)))
        return 
    end) 
end
local function gal46(...)
    if gal44.IdledConnection then
        local IdledConnection = gal44.IdledConnection
        IdledConnection:Disconnect()
        gal44.IdledConnection = nil
    end 
end
gal_l287:AddToggle("AFKEnable", {
    Text = "Enable Anti-AFK",
    Default = false,
    Tooltip = "Prevents 20-minute idle kick (safe, no movement)",
    Callback = function(gal_p1_5, ...)
        gal43.Enabled = gal_p1_5
        if gal_p1_5 then
            gal45()
            gal31:Notify({
                Title = "Anti-AFK Enabled",
                Description = "Safe mode - no movement, just input simulation",
                Time = 2
            })
        else
            gal46()
        end
        return 
    end
})
gal_l287:AddLabel("Safe Mode: No movement")
gal_l287:AddLabel("Just simulates clicks to reset idle timer")
local gal_l288 = gal_l280.Main
local gal_l289 = gal_l288:AddRightGroupbox("Shard Collector", "gem")
local gal47 = {
    Enabled = false,
    ExtendedRange = 200,
    AutoCollect = true,
    InstantCollect = true,
    ShowESP = true,
    ESPColor = Color3.fromRGB(147, 0, 211),
    MaxShards = 50
}
local gal48 = {
    Connection = nil,
    ShardFolder = nil,
    EventConfig = nil,
    GalacticConfig = nil,
    OriginalCollectRadius = nil,
    OriginalPickupDelay = nil,
    OriginalAutoCollectDelay = nil,
    OriginalVacuumDuration = nil,
    ShardESPFolder = nil,
    ShardESPItems = {},
    GalacticShardCollect = nil,
    GalacticShardDrop = nil,
    TotalCollected = 0,
    ActiveShards = {},
    DropHook = nil,
    RealClientTable = nil
}
(function(...)
    gal_l238 = ReplicatedStorage
    gal_l219 = gal16
    gal_l238 = gal_l238:FindFirstChild("Data") and gal_l238:FindFirstChild("EventConfig")
    if gal_l238 then
        gal_l219 = {
            pcall(require, gal_l238)
        }
        EventRemotes = gal_l219[2]
        GalacticShardDrop = pcall(require, gal_l238)
        if GalacticShardDrop then
            gal48.EventConfig = EventRemotes
            gal48.GalacticConfig = EventRemotes.Galactic
            gal48.OriginalCollectRadius = EventRemotes.Galactic.CollectRadius
            gal48.OriginalPickupDelay = EventRemotes.Galactic.PickupDelay
            gal48.OriginalAutoCollectDelay = EventRemotes.Galactic.AutoCollectDelay
            gal48.OriginalVacuumDuration = EventRemotes.Galactic.VacuumDuration
        end
    end
    EventRemotes = Workspace
    gal48.ShardFolder = EventRemotes:FindFirstChild("VoidShards")
    EventRemotes = gal_l238:WaitForChild("EventRemotes", 5)
    if EventRemotes then
        gal48.GalacticShardCollect = EventRemotes:FindFirstChild("GalacticShardCollect")
        gal48.GalacticShardDrop = EventRemotes:FindFirstChild("GalacticShardDrop")
    end
    GalacticShardDrop = gal48.GalacticShardDrop
    if GalacticShardDrop and gal48.GalacticShardCollect then
        GalacticShardDrop = gal48.GalacticShardDrop.OnClientEvent
        gal48.DropHook = GalacticShardDrop:Connect(function(gal_p1_6, gal_p2_6, gal_p3_6, ...)
            if not gal47.Enabled or not gal47.InstantCollect then
                return
            end
            for gal_l290 = 1, gal_p2_6 do
                task.delay(.03 * (gal_l241 - 1), function(...)
                    pcall(function(...)
                        gal_l238 = gal48[gal16[gal15("\xad\xe7\xed=\xfaz\xf4\xa9\xa3j\xed\xf2|\xda/\xf7\xca<m\xeb", 2312652407860)]]
                        gal_l238:FireServer(gal_p1_6)
                        return 
                    end)
                    return 
                end) 
            end
            gal48.TotalCollected = gal48.TotalCollected + gal_p2_6
            return 
        end)
    end
    gal48.ShardESPFolder = Instance.new("Folder")
    gal48.ShardESPFolder.Name = "ShardESP"
    gal48.ShardESPFolder.Parent = CoreGui
    return 
end)()
local function gal50(...)
    local Character = LocalPlayer.Character
    if not Character then
        return nil
    end
    return Character:FindFirstChild("HumanoidRootPart") 
end
gal_l289:AddToggle("ShardEnable", {
    Text = "Enable Shard Collector",
    Default = false,
    Tooltip = "Collect void shards from extended range",
    Callback = function(gal_p1_9, ...)
        gal47.Enabled = gal_p1_9
        if gal_p1_9 then
            gal31:Notify({
                Title = "Shard Collector Enabled",
                Time = 2
            })
        else
            if gal48.GalacticConfig then
                if gal48.OriginalCollectRadius then
                    gal48.GalacticConfig.CollectRadius = gal48.OriginalCollectRadius
                end
                if gal48.OriginalPickupDelay then
                    gal48.GalacticConfig.PickupDelay = gal48.OriginalPickupDelay
                end
                if gal48.OriginalAutoCollectDelay then
                    gal48.GalacticConfig.AutoCollectDelay = gal48.OriginalAutoCollectDelay
                end
                if gal48.OriginalVacuumDuration then
                    gal48.GalacticConfig.VacuumDuration = gal48.OriginalVacuumDuration
                end
            end
            return
        end 
    end
})
gal_l289:AddSlider("ShardRange", {
    Text = "Extended Range",
    Default = 200,
    Min = 50,
    Max = 1000,
    Rounding = 0,
    Tooltip = "How far to pull shards from",
    Callback = function(gal_p1_10, ...)
        gal47.ExtendedRange = gal_p1_10
        return 
    end
})
gal_l289:AddToggle("ShardInstant", {
    Text = "Instant Collect",
    Default = true,
    Tooltip = "Auto-collect shards the moment they drop (server-safe)",
    Callback = function(gal_p1_11, ...)
        gal47.InstantCollect = gal_p1_11
        return 
    end
})
gal_l289:AddToggle("ShardAuto", {
    Text = "Auto Collect",
    Default = true,
    Tooltip = "Automatically collect shards in range",
    Callback = function(gal_p1_12, ...)
        gal47.AutoCollect = gal_p1_12
        return 
    end
})
XD[1] = "\xddg\xc8\x96\xc8*\x8a "
gal_l289:AddToggle("ShardESP", {
    Text = "Shard ESP",
    Default = true,
    Tooltip = "Show ESP on void shards",
    Callback = function(gal_p1_13, ...)
        gal47.ShowESP = gal_p1_13
        if not gal_p1_13 then
            gal_l257 = gal48[3]
            for gal_l257, gal_l257 in pairs(gal_l253) do
                Billboard = gal_l257.Billboard
                Billboard:Destroy()
                Billboard = gal_l257.Highlight
                Billboard:Destroy() 
            end
            gal48.ShardESPItems = {}
        end
        return 
    end
})
local gal_l291 = gal_l289:AddLabel("ESP Color")
gal_l291:AddColorPicker("ShardESPColor", {
    Default = Color3.fromRGB(147, 0, 211),
    Title = "Shard Color",
    Transparency = 0,
    Callback = function(gal_p1_14, ...)
        gal47.ESPColor = gal_p1_14
        return 
    end
})
gal_l289:AddDivider()
gal_l289:AddLabel("STATUS")
local gal53 = gal_l289:AddLabel("Config: ? | Remote: ?")
local gal54 = gal_l289:AddLabel("Shards: 0 | Collected: 0")
task.spawn(function(...)
    while true do
        gal_l247 = task.wait
        gal_l217 = gal_l247
        gal_l247(0.5)
        GalacticConfig = gal48.GalacticConfig
        gal_l238 = GalacticConfig
        while not GalacticConfig do
            gal_l253 = "✗"
            while gal_l238 do
                GalacticConfig = gal_l217
                GalacticShardCollect = gal48.GalacticShardCollect
                gal_l217 = GalacticShardCollect
                while not GalacticShardCollect do
                    gal_l253 = gal_l217
                    while gal_l217 do
                        ShardFolder = gal53
                        ShardFolder:SetText("Config: " .. gal48 .. " | Remote: " .. gal_l217)
                        ShardFolder = gal48.ShardFolder
                        while not ShardFolder do
                            gal54:SetText("Shards: " .. (GalacticConfig or 0) .. " | Collected: " .. gal48.TotalCollected) 
                        end
                        GalacticShardCollect = #ShardFolder:GetChildren() 
                    end
                    gal_l253 = "✗" 
                end
                gal_l217 = "✓" 
            end
            gal_l253 = "✗" 
        end
        gal_l238 = "✓" 
    end
    return 
end)
local ESP = gal_l280.ESP
local gal_l293 = ESP:AddLeftGroupbox("Zombie ESP", "skull")
local gal55 = {
    Enabled = false,
    ShowHealth = true,
    ShowDistance = true,
    MaxDistance = 1000,
    TextSize = 14,
    Color = Color3.fromRGB(255, 0, 0),
    Zombies = {},
    Folder = nil
}
XD[2] = 11158876787788
gal55.Folder = Instance.new("Folder")
gal55.Folder.Name = "ZombieESP_Light"
gal55.Folder.Parent = CoreGui
local function gal59(...)
    local Zombies_Local = Workspace:FindFirstChild("Zombies_Local")
    if not Zombies_Local then
        return
    end
    local GetChildren = Zombies_Local.GetChildren
    local gal_l65 = {
        GetChildren(Zombies_Local)
    }
    local gal_l67 = GetChildren[1]
    for gal_l68, gal_l69 in pairs(x(gal_l67)) do
        if gal_l69:IsA("Model") then
            gal57(gal_l69)
        end 
    end 
end
gal_l293:AddToggle("ESPEnable", {
    Text = "Enable Zombie ESP",
    Default = false,
    Tooltip = "Show ESP on all zombies",
    Callback = function(gal_p1_18, ...)
        gal55.Enabled = gal_p1_18
        if gal_p1_18 then
            gal59()
        end
        return 
    end
})
gal_l293:AddToggle("ESPHealth", {
    Text = "Show Health",
    Default = true,
    Callback = function(gal_p1_19, ...)
        gal55.ShowHealth = gal_p1_19
        return 
    end
})
gal_l293:AddToggle("ESPDistance", {
    Text = "Show Distance",
    Default = true,
    Callback = function(gal_p1_20, ...)
        gal55.ShowDistance = gal_p1_20
        return 
    end
})
gal_l293:AddSlider("ESPMaxDist", {
    Text = "Max Distance",
    Default = 1000,
    Min = 100,
    Max = 5000,
    Rounding = 0,
    Callback = function(gal_p1_21, ...)
        gal55.MaxDistance = gal_p1_21
        return 
    end
})
gal_l293:AddSlider("ESPTextSize", {
    Text = "Text Size",
    Default = 14,
    Min = 8,
    Max = 24,
    Rounding = 0,
    Callback = function(gal_p1_22, ...)
        gal_l238 = gal_p1_22
        gal55.TextSize = gal_l238
        gal_l257 = gal15
        Zombies = gal55.Zombies
        gal_l238 = gal55[2]
        Zombies = gal55[1]
        for gal_l257, gal_l257 in pairs(Zombies) do
            gal_p1_22.Label.TextSize = gal_p1_22 
        end
        return 
    end
})
local gal_l294 = gal_l293:AddLabel("ESP Color")
gal_l294:AddColorPicker("ESPColor", {
    Default = Color3.fromRGB(255, 0, 0),
    Title = "Color",
    Transparency = 0,
    Callback = function(gal_p1_23, ...)
        gal55.Color = gal_p1_23
        return 
    end
})
local KillAura = gal_l280.KillAura
local gal_l296 = KillAura:AddLeftGroupbox("Kill Aura", "swords")
local gal60 = {
    Enabled = false,
    Range = 50,
    FireRate = .05,
    MaxRemotesPerFire = 15,
    BurstDuration = .001,
    HighlightTarget = true,
    SilentAim = true,
    Keybind = Enum.KeyCode.K
}
local gal61 = {
    Connection = nil,
    LastFireTime = 0,
    CurrentTarget = nil,
    TargetHighlight = nil,
    ZombieClient = nil,
    GunClient = nil,
    GunRemotes = nil,
    EquippedGunName = nil,
    LastRemoteCount = 0,
    TotalDamageDealt = 0,
    BurstQueue = {},
    BurstActive = false,
    LastScanResult = {},
    LastScanTime = 0,
    FrameAccumulator = 0
}
gal62 = {}
local function gal63(...)
    KAClearHighlight()
    gal61.CurrentTarget = nil
    gal61.BurstActive = false
    gal61.LastRemoteCount = 0
    gal61.FrameAccumulator = 0 
end
local function gal64(...)
    local Character = LocalPlayer.Character
    if not Character then
        return
    end
    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart then
        return
    end
    HumanoidRootPart.CFrame = HumanoidRootPart.CFrame * CFrame.new(0, .001, 0)
    if gal61.GunRemotes and gal61.GunRemotes.Fire then
        pcall(function(...)
            local Fire = gal61.GunRemotes.Fire
            Fire:FireServer(gal61.EquippedGunName or "Pistol", HumanoidRootPart.Position, Vector3.new(0, -1, 0))
            return 
        end)
    end 
end
local function gal66(...)
    if _G.ZombieClient and (typeof(_G.ZombieClient) == "table" and _G.ZombieClient.Zombies) then
        gal61.ZombieClient = _G.ZombieClient
    end
    if _G.GunClient and (typeof(_G.GunClient) == "table" and _G.GunClient.TryFire) then
        gal61.GunClient = _G.GunClient
    end
    local PlayerScripts = LocalPlayer:WaitForChild("PlayerScripts", 5)
    if PlayerScripts then
        gal67(PlayerScripts)
    end
    local GunRemotes = ReplicatedStorage:FindFirstChild("GunRemotes")
    if GunRemotes then
        gal61.GunRemotes = {
            Fire = GunRemotes:FindFirstChild("GunFire"),
            Hit = GunRemotes:FindFirstChild("GunHit")
        }
    end
    print("[KA] ZombieClient:", gal61.ZombieClient ~= nil)
    print("[KA] GunClient:", gal61.GunClient ~= nil)
    print("[KA] GunRemotes:", gal61.GunRemotes ~= nil) 
end
local function gal69(gal_p1_25, ...)
    local Character = LocalPlayer.Character
    if not Character then
        return {}
    end
    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart then
        return {}
    end
    local Position = HumanoidRootPart.Position
    if gal61.ZombieClient and gal61.ZombieClient.Zombies then
        local gal_l87 = {}
        local gal_l88 = math.huge
        for gal_l92, gal_l93 in pairs(gal61.ZombieClient.Zombies) do
            local gal_l95 = not gal_l93
            while gal_l95 do
                while gal_l95 do end
                local CurrentPosition = gal_l93.CurrentPosition
                while CurrentPosition do
                    while not "sqrt" do end
                    local gal_l106 = "sqrt" - Position
                    local gal_l107 = gal_l106:Dot("sqrt" - Position)
                    while gal_l107 > gal_l106 do end
                    local gal_l108 = 0 < gal_p1_25
                    local gal_l109 = math.sqrt(gal_l107)
                    while gal_l108 do
                        local gal_l112 = 0 + 1
                        local Tier = gal_l93.Tier
                        while Tier do
                            ({})[gal_l112] = {
                                Id = gal_l92,
                                Data = gal_l93,
                                Model = gal_l93.Model,
                                Position = "Id",
                                Tier = Tier,
                                Distance = gal_l109
                            }
                            while gal_l109 > gal_l88 do end 
                        end 
                    end
                    if gal_l109 < math[gal16[gal15("\xf6\xe6\x9b\x1d", gal_l92)]] then
                        local Tier = gal_l93.Tier
                        while Tier do
                            gal_l87[0] = {
                                Id = gal_l92,
                                Data = gal_l93,
                                Model = gal_l93.Model,
                                Position = "sqrt",
                                Tier = Tier,
                                Distance = gal_l109
                            }
                            for gal_l135 = 1, 0 do
 
                            end 
                        end
                    end 
                end 
            end 
        end
        if 0 > 1 then
            table.sort(gal_l87, function(gal_p1_26, gal_p2_26, ...)
                return gal_p1_26.Distance < gal_p2_26.Distance 
            end)
        end
        return gal_l87
    end
    local Zombies_Local = Workspace:FindFirstChild("Zombies_Local")
    if not Zombies_Local then
        return {}
    end
    local gal_l143 = {}
    local gal_l144 = math.huge
    local GetChildren = Zombies_Local.GetChildren
    local gal_l147 = {
        GetChildren(Zombies_Local)
    }
    for gal_l150, gal_l151 in ipairs(x(gal_l151)) do
        while not gal_l151:IsA("Model") do end
        local HumanoidRootPart = gal_l151:FindFirstChild("HumanoidRootPart")
        while HumanoidRootPart do
            local gal_l158 = HumanoidRootPart.Position
            while not gal_l158 do end
            local gal_l159 = gal_l158 - Position
            local gal_l160 = gal_l159:Dot(gal_l158 - Position)
            while gal_l160 > gal_l133 do end
            local gal_l161 = math.sqrt(gal_l160)
            local Name = gal_l151.Name
            local gal_l163 = tonumber(Name:match("%d+"))
            while gal_l163 do
                while gal_l39 < gal_p1_25 do
                    local gal_l166 = 0 + 1
                    ({})[gal_l166] = {
                        Id = gal_l163,
                        Model = gal_l151,
                        Position = gal_l135,
                        Distance = gal_l161,
                        Tier = "Unknown"
                    }
                    while gal_l161 > gal_l144 do
                        local gal_l168 = math.sqrt(gal_l160) 
                    end 
                end
                gal_l143[0] = {
                    Id = gal_l163,
                    Model = gal_l151,
                    Position = gal_l158,
                    Distance = gal_l161,
                    Tier = "Unknown"
                }
                for gal_l174 = 1, gal_l166 do
 
                end 
            end 
        end
        if gal_l151:FindFirstChild("Head") then
        end 
    end
    if 0 > 1 then
        table.sort(gal_l143, function(gal_p1_27, gal_p2_27, ...)
            return gal_p1_27.Distance < gal_p2_27.Distance 
        end)
    end
    return gal_l143 
end
local function gal70(...)
    if gal61.TargetHighlight then
        pcall(function(...)
            local TargetHighlight = gal61.TargetHighlight
            TargetHighlight:Destroy()
            return 
        end)
        gal61.TargetHighlight = nil
    end 
end
local function gal72(...)
    local Character = LocalPlayer.Character
    if not Character then
        return nil
    end
    return Character:FindFirstChildOfClass("Tool") 
end
local function gal73(...)
    local gal_l180 = not gal60.Enabled
    if gal_l180 then
        gal61.BurstActive = false
        return
    end
    if #gal62 == 0 then
        gal61.BurstActive = false
        return
    end
    local gal_l182 = #gal62 > 0
    while not gal_l182 do
        while gal_l182 do
            local gal74 = table.remove(gal62, 1)
            while not gal74 do
                while not gal74 do end
                local Model = gal74.Zombie.Model
                local Parent = gal74.Zombie.Model.Parent
                while not Model do
                    while Parent do
                        while not true do end
                        pcall(function(...)
                            if gal61.GunRemotes and gal61.GunRemotes.Hit then
                                local Hit = gal61.GunRemotes.Hit
                                Hit:FireServer(gal74.GunName, gal74.Zombie.Id, gal74.Zombie.Position)
                            end
                            return 
                        end)
                        gal61.TotalDamageDealt = gal61.TotalDamageDealt + 1 
                    end
                    local ZombieClient = gal61.ZombieClient
                    while not ZombieClient do
                        while not ZombieClient do end
                        local gal_l197 = gal61.ZombieClient.Zombies[gal74.Zombie.Id]
                        while not gal_l197 do
                            while not gal_l197 do end
                            local CurrentPosition = gal_l197.CurrentPosition
                            local TargetPosition = gal_l197.TargetPosition
                            while CurrentPosition do
                                gal74.Zombie.Position = TargetPosition 
                            end 
                        end 
                    end 
                end 
            end
            local Zombie = gal74.Zombie
            while not Zombie do end 
        end
        if #gal62 == 0 then
            gal61.BurstActive = false
            break
        end
        return 
    end 
end
local function gal75(gal_p1_29, ...)
    if #gal_p1_29 == 0 then
        return 0
    end
    local gal_l217 = gal72()
    if not gal_l217 then
        return 0
    end
    gal61.EquippedGunName = gal_l217.Name
    local Character = LocalPlayer.Character
    if not Character then
        return 0
    end
    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart then
        return 0
    end
    local gal_l220 = HumanoidRootPart.Position + Vector3.new(0, 2, 0)
    gal64()
    gal61.BurstActive = true
    for gal_l224, gal_l225 in undefined, ipairs(gal_p1_29) do
        while not gal_l225 do
            while not gal_l225 do end
            table.insert(gal62, {
                Zombie = gal_l225,
                GunName = gal72().Name
            }) 
        end 
    end
    local GunClient = gal61.GunClient
    if GunClient and gal61.GunClient.TryFire then
        local gal_l232 = gal_p1_29[1]
        if gal_l232 then
            local GetAimDirection = gal61.GunClient.GetAimDirection
            local Unit = (gal_l232.Position - (HumanoidRootPart.Position + Vector3.new(0, 2, 0))).Unit
            if GetAimDirection then
                gal61.GunClient.GetAimDirection = function(gal_p1_30, ...)
                    local gal_l238 = gal_p1_30
                    return Unit 
                end
            end
            gal61.GunClient.IsFiring = true
            local function gal_l149(...)
                local GunClient = gal61.GunClient
                GunClient:TryFire() 
            end
            pcall(gal_l149)
            if GetAimDirection then
                local GetAimDirection = gal61.GunClient.GetAimDirection
                gal61.GunClient.GetAimDirection = GetAimDirection
            end
            gal61.GunClient.IsFiring = gal61.GunClient.IsFiring
        end
    end
    return 0 
end
local function gal77(gal_p1_31, ...)
    if not gal60.Enabled then
        if gal61.BurstActive or (#gal62 > 0 or gal61.CurrentTarget) then
            gal63()
        end
        return
    end
    if gal61.BurstActive then
        gal73()
    end
    gal61.FrameAccumulator = gal61.FrameAccumulator + gal_p1_31
    if gal61.FrameAccumulator < gal60.FireRate then
        return
    end
    gal61.FrameAccumulator = 0
    if gal61.BurstActive and #gal62 > 10 then
        return
    end
    local gal_l240 = gal69(gal60.MaxRemotesPerFire)
    if #gal_l240 > 0 then
        local gal_l241 = gal75(gal_l240)
        gal61.LastRemoteCount = gal_l241
        gal61.LastFireTime = tick()
        gal61.CurrentTarget = gal_l240[1]
        gal71(gal_l240[1])
    else
        gal70()
        gal61.CurrentTarget = nil
        gal61.LastRemoteCount = 0
    end 
end
gal_l296:AddToggle("KAEnable", {
    Text = "Enable Kill Aura",
    Default = false,
    Tooltip = "Toggle Kill Aura on/off",
    Callback = function(gal_p1_32, ...)
        gal60.Enabled = gal_p1_32
        if not gal_p1_32 then
            gal63()
        end
        return 
    end
})
gal_l296:AddSlider("KARange", {
    Text = "Range",
    Default = gal60.Range,
    Min = 10,
    Max = 200,
    Rounding = 0,
    Tooltip = "Detection range in studs",
    Callback = function(gal_p1_33, ...)
        gal60.Range = gal_p1_33
        return 
    end
})
gal_l296:AddDivider()
gal_l296:AddLabel("Fire Rate Hz", true)
gal_l296:AddLabel("60 = fast | 20 = default | 1 = slow", true)
gal_l296:AddSlider("KAFireRate", {
    Text = "Fire Rate (Hz)",
    Default = 20,
    Min = 1,
    Max = 60,
    Rounding = 0,
    Tooltip = "Ticks per second",
    Callback = function(gal_p1_34, ...)
        gal60.FireRate = 1 / gal_p1_34
        return 
    end
})
gal_l296:AddDivider()
gal_l296:AddLabel("Max Remotes/Tick", true)
gal_l296:AddLabel("20 = max dps | 15 = default | 1 = single", true)
gal_l296:AddSlider("KAMaxRemotes", {
    Text = "Max Remotes/Tick",
    Default = gal60.MaxRemotesPerFire,
    Min = 1,
    Max = 20,
    Rounding = 0,
    Tooltip = "Zombies hit per tick",
    Callback = function(gal_p1_35, ...)
        gal60.MaxRemotesPerFire = gal_p1_35
        return 
    end
})
gal_l296:AddDivider()
gal_l296:AddLabel("Burst: Async (lag-proof)", true)
gal_l296:AddToggle("KAHighlight", {
    Text = "Highlight Target",
    Default = gal60.HighlightTarget,
    Tooltip = "Toggle target highlight",
    Callback = function(gal_p1_36, ...)
        gal60.HighlightTarget = gal_p1_36
        if not gal_p1_36 then
            gal70()
        end
        return 
    end
})
gal_l296:AddLabel("Keybind: [K] to Toggle")
gal_l296:AddDivider()
gal_l296:AddLabel("STATUS")
local gal78 = gal_l296:AddLabel("ZombieClient: ? | GunClient: ?")
local gal79 = gal_l296:AddLabel("Target: None")
local gal80 = gal_l296:AddLabel("Zombies: 0")
local gal81 = gal_l296:AddLabel("Remotes: 0 | Total Hits: 0")
local gal82 = gal_l296:AddLabel("Queue: 0")
task.spawn(function(...)
    while true do
        gal_l247 = task.wait
        gal_l217 = gal_l247
        gal_l247(0.5)
        ZombieClient = gal61.ZombieClient
        gal_l238 = ZombieClient
        while not ZombieClient do
            gal_l253 = "✗"
            while gal_l238 do
                ZombieClient = gal_l217
                GunClient = gal61.GunClient
                gal_l217 = GunClient
                while not GunClient do
                    gal_l253 = gal_l217
                    while gal_l217 do
                        gal78:SetText("ZombieClient: " .. CurrentTarget .. " | GunClient: " .. CurrentTarget)
                        ZombieClient = gal60.Enabled
                        CurrentTarget = ZombieClient
                        while not ZombieClient do
                            while ZombieClient do
                                Distance = gal61.CurrentTarget.Distance
                                ZombieClient = Distance
                                while not Distance do
                                    CurrentTarget = gal79
                                    gal_l257 = "Target: "
                                    gal_l257 = tostring
                                    local Tier = gal61.CurrentTarget.Tier
                                    local gal_l257 = "Zombie"
                                    while Tier do
                                        CurrentTarget:SetText("Target: " .. Env[gal61](gal61) .. " | " .. (Distance or gal78) .. " studs")
                                        Distance = gal61.ZombieClient
                                        CurrentTarget = gal61.ZombieClient.Zombies
                                        while not Distance do
                                            while CurrentTarget do
                                                local Zombies_Local = {
                                                    pairs(gal61.ZombieClient.Zombies)
                                                }
                                                gal_l232 = pairs(gal61.ZombieClient.Zombies)(Zombies_Local[2], Zombies_Local[3])
                                                while gal_l232 do
                                                    Zombies_Local = Distance(Zombies_Local, Zombies_Local[3])
                                                    while 0 + 1 > 500 do
                                                        Zombies_Local = gal80
                                                        Zombies_Local:SetText("Zombies: " .. CurrentTarget)
                                                        Zombies_Local = gal81
                                                        Zombies_Local:SetText("Remotes: " .. gal61.LastRemoteCount .. " | Total Hits: " .. gal61.TotalDamageDealt)
                                                        Zombies_Local = gal82
                                                        Zombies_Local:SetText("Queue: " .. #gal62) 
                                                    end 
                                                end 
                                            end
                                            Zombies_Local = Workspace:FindFirstChild("Zombies_Local")
                                            Zombies_Local = gal78
                                            gal_l232 = gal78
                                            while not Zombies_Local do end
                                            math.min(#Zombies_Local:GetChildren(), 500) 
                                        end
                                        CurrentTarget = gal61.ZombieClient.Zombies 
                                    end
                                    gal_l257 = "Zombie" 
                                end
                                ZombieClient = math.floor(gal61.CurrentTarget.Distance) 
                            end
                            CurrentTarget = gal79
                            CurrentTarget:SetText("Target: None") 
                        end
                        CurrentTarget = gal61.CurrentTarget 
                    end
                    gal_l253 = "✗" 
                end
                gal_l217 = "✓" 
            end
            gal_l253 = "✗" 
        end
        gal_l238 = "✓" 
    end
    return 
end)
local InputBegan = gal_l257:GetService("UserInputService").InputBegan
InputBegan:Connect(function(gal_p1_37, gal_p2_37, ...)
    if gal_p2_37 then
        return
    end
    if gal_p1_37.KeyCode == gal60.Keybind then
        gal60.Enabled = not gal60.Enabled
        KAEnable = Toggles.KAEnable
        if KAEnable then
            KAEnable = Toggles.KAEnable
            KAEnable:SetValue(gal60.Enabled)
        end
        if not gal60.Enabled then
            gal63()
        end
    end
    return 
end)
local Settings = gal_l280.Settings
local gal_l299 = Settings:AddLeftGroupbox("Menu", "wrench")
gal_l299:AddToggle("KeybindMenuOpen", {
    Default = gal31.KeybindFrame.Visible,
    Text = "Open Keybind Menu",
    Callback = function(gal_p1_38, ...)
        gal31.KeybindFrame.Visible = gal_p1_38
        return 
    end
})
gal_l299:AddToggle("ShowCustomCursor", {
    Text = "Custom Cursor",
    Default = true,
    Callback = function(gal_p1_39, ...)
        gal31.ShowCustomCursor = gal_p1_39
        return 
    end
})
gal_l299:AddDropdown("NotificationSide", {
    Values = {
        "Left",
        "Right"
    },
    Default = "Right",
    Text = "Notification Side",
    Callback = function(gal_p1_40, ...)
        gal31:SetNotifySide(gal_p1_40)
        return 
    end
})
gal_l299:AddDropdown("DPIDropdown", {
    Values = {
        "50%",
        "75%",
        "100%",
        "125%",
        "150%",
        "175%",
        "200%"
    },
    Default = "100%",
    Text = "DPI Scale",
    Callback = function(gal_p1_41, ...)
        gal_l238 = gal_p1_41
        gal_l238 = gal_l238:gsub("%%", "")
        gal31:SetDPIScale(tonumber(gal_l238))
        return 
    end
})
gal_l299:AddSlider("UICornerSlider", {
    Text = "Corner Radius",
    Default = gal31.CornerRadius,
    Min = 0,
    Max = 20,
    Rounding = 0,
    [gal16.Callback] = function(gal_p1_42, ...)
        gal33:SetCornerRadius(gal_p1_42)
        return 
    end
})
gal_l299:AddDivider()
local gal_l300 = gal_l299:AddLabel("Menu bind")
gal_l300:AddKeyPicker("MenuKeybind", {
    Default = "RightShift",
    NoUI = true,
    Text = "Menu keybind"
})
gal_l299:AddButton("Unload", function(...)
    if false then
        gal_l45()
    end
    if gal39 then
        gal39:Disconnect()
    end
    gal_l290 = gal55
    gal_l257 = gal_l290[3]
    for gal_l257, gal_l290 in gal_l290[1], pairs(gal_l290.Zombies) do
        gal56(gal_l257) 
    end
    Folder = gal55.Folder
    if Folder then
        Folder = gal55.Folder
        Folder:Destroy()
    end
    gal70()
    gal60.Enabled = false
    Folder = gal61.Connection
    if Folder then
        Folder = gal61.Connection
        Folder:Disconnect()
    end
    gal46()
    gal47.Enabled = false
    if gal48.GalacticConfig then
        if gal48.OriginalCollectRadius then
            gal48.GalacticConfig.CollectRadius = gal48.OriginalCollectRadius
        end
        if gal48.OriginalPickupDelay then
            gal48.GalacticConfig.PickupDelay = gal48.OriginalPickupDelay
        end
        if gal48.OriginalAutoCollectDelay then
            gal48.GalacticConfig.AutoCollectDelay = gal48.OriginalAutoCollectDelay
        end
        if gal48.OriginalVacuumDuration then
            gal48.GalacticConfig.VacuumDuration = gal48.OriginalVacuumDuration
        end
    end
    Folder = gal48.DropHook
    if Folder then
        Folder = gal48.DropHook
        Folder:Disconnect()
    end
    Folder = gal48.ShardESPFolder
    if Folder then
        Folder = gal48.ShardESPFolder
        Folder:Destroy()
    end
    Folder = gal31
    Folder:Unload()
    return 
end)
gal31.ToggleKeybind = gal31.Options.MenuKeybind
gal_l268:SetLibrary(gal31)
gal_l270:SetLibrary(gal31)
gal_l270:IgnoreThemeSettings()
gal_l270:SetIgnoreIndexes({
    "MenuKeybind"
})
gal_l268:SetFolder("ZombieSurviveArena")
gal_l270:SetFolder("ZombieSurviveArena/kill-aura")
local PlaceId = game.PlaceId
local gal_l304 = gal_l247
local gal_l305 = gal_l304
gal_l270:SetSubFolder(PlaceId or "default")
gal_l270:BuildConfigSection(gal_l280.Settings)
gal_l268:AddThemeOptions(gal_l280.Settings)
gal_l270:LoadAutoloadConfig()
local Zombies_Local = Workspace:WaitForChild("Zombies_Local")
local ChildAdded = Zombies_Local.ChildAdded
ChildAdded:Connect(function(gal_p1_43, ...)
    if gal_p1_43:IsA("Model") and gal55.Enabled then
        task.wait(.1)
        gal57(gal_p1_43)
    end
    return 
end)
local ChildRemoved = Zombies_Local.ChildRemoved
ChildRemoved:Connect(function(gal_p1_44, ...)
    gal56(gal_p1_44)
    return 
end)
local RenderStepped = RunService.RenderStepped
RenderStepped:Connect(function(...)
    gal_l257 = gal16
    if not gal55.Enabled then
        Zombies = gal55.Zombies
        Zombies = gal55[1]
        for gal_l217, gal_l290 in pairs(Zombies) do
            gal_l290.Billboard.Enabled = false 
        end
        return
    end
    Character = LocalPlayer.Character
    gal_l217 = Character
    if Character then
        HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
    end
    gal_l232 = gal55
    gal_l257 = "Zombies"
    gal_l290 = gal_l232[3]
    for gal_l290, gal_l232 in gal_l232[1], pairs(gal_l232[gal_l257]) do
        while not gal_l290.Parent do
            gal56(gal_l290) 
        end
        Head = gal_l232.Head
        gal_l256 = not Head
        Head = not Head.Parent
        while gal_l256 do
            while Head do
                gal56(gal_l290) 
            end
            Magnitude = Character
            while not Character do
                while (gal_l217 or 0) > gal55.MaxDistance do
                    gal_l232.Billboard.Enabled = false 
                end
                gal_l232.Billboard.Enabled = true
                Head = ""
                local ShowHealth = gal55.ShowHealth
                Magnitude = ShowHealth
                while not ShowHealth do
                    while not Magnitude do
                        Head = Head .. " | "
                        Head = Head .. math.floor(gal_l217 or 0) .. "m"
                        gal_l232.Label.Text = Head 
                    end
                    local gal_l268 = 0
                    Magnitude = math.floor(gal_l232.Humanoid.Health) / math.floor(gal_l232.Humanoid.MaxHealth)
                    gal_l150 = 255
                    gal_l178 = 0
                    while Magnitude > 0.5 do
                        Head = "" .. string.format("<font color=\"rgb(%d,%d,%d)\">%d/%d</font>", 0, 255, 0, math.floor(gal_l232.Humanoid.Health), math.floor(gal_l232.Humanoid[gal16[gal_l139]])) 
                    end
                    gal_l150 = 255
                    gal_l268 = 255
                    gal_l178 = 0 
                end
                Magnitude = gal_l232.Humanoid 
            end
            Magnitude = (Character.Position - Head.Position).Magnitude 
        end
        Head = not Head.Parent 
    end
    return 
end)
gal59()
local gal_l311 = RunService.RenderStepped
gal_l311:Connect(function(...)
    if not gal47.ShowESP then
        gal_l217 = gal48[3]
        for gal_l217, gal_l290 in pairs("pairs") do
            gal_l290.Billboard.Enabled = false
            gal_l290.Highlight.Enabled = false 
        end
        return
    end
    gal_l238 = gal50()
    if not gal_l238 then
        return
    end
    ShardFolder = gal48.ShardFolder
    if not ShardFolder then
        return
    end
    GetChildren = ShardFolder.GetChildren
    GetChildren = GetChildren[3]
    for GetChildren, GetChildren in GetChildren[1], ipairs(GetChildren(ShardFolder)) do
        if GetChildren:IsA("BasePart") then
            repeat
                gal51(GetChildren)
            until gal48.ShardESPItems[GetChildren]
            undefined = true
            undefined = math.floor((gal_l238.Position - GetChildren.Position).Magnitude) .. "m"
            undefined = true
            undefined = gal47.ESPColor
        end 
    end
    return 
end)
local Heartbeat = RunService.Heartbeat
Heartbeat:Connect(function(...)
    if not gal47.Enabled then
        return
    end
    GalacticConfig = gal48.GalacticConfig
    if not GalacticConfig then
        return
    end
    InstantCollect = gal47.InstantCollect
    if InstantCollect then
        GalacticConfig.PickupDelay = 0
        GalacticConfig.AutoCollectDelay = 0
        GalacticConfig.VacuumDuration = .01
    else
        GalacticConfig.PickupDelay = gal48.OriginalPickupDelay or 1.5
        gal_l257 = "PickupDelay"
        GalacticConfig.AutoCollectDelay = gal48.OriginalAutoCollectDelay or 30
        gal_l257 = "PickupDelay"
        GalacticConfig.VacuumDuration = gal48.OriginalVacuumDuration or .45
    end
    if gal47.AutoCollect then
        GalacticConfig.CollectRadius = gal47.ExtendedRange
    else
        GalacticConfig.CollectRadius = gal48.OriginalCollectRadius or 15
    end
    if gal47.InstantCollect and gal48.GalacticShardCollect then
        ShardFolder = gal48.ShardFolder
        if ShardFolder then
            GetChildren = ShardFolder.GetChildren
            gal_l290 = GetChildren[3]
            for gal_l290, GetChildren in ipairs(GetChildren(ShardFolder)) do
                gal_l257 = ShardFolder
                gal_l257 = gal_l290
                gal_l257 = GetChildren:IsA("BasePart")
                Parent = GetChildren.Parent
                while not gal_l257 do
                    while not gal_l257 do end
                    pcall(function(...)
                        InstantCollect = gal48.GalacticShardCollect
                        InstantCollect:FireServer(0)
                        return 
                    end) 
                end
                Parent = GetChildren.Parent 
            end
        end
    end
    return 
end)
local CharacterAdded = LocalPlayer.CharacterAdded
CharacterAdded:Connect(function(...)
    task.wait(1)
    gal_l305 = LocalPlayer
    PlayerScripts = gal_l305:WaitForChild("PlayerScripts")
    gal41 = require(PlayerScripts:WaitForChild("PlayerModule"))
    gal_l305 = gal41
    gal42 = gal_l305:GetControls()
    if false then
        task.wait(0.5)
        gal_l22()
    end
    return 
end)
if _G.ZSACleanup then
    pcall(_G.ZSACleanup)
end
_G.ZSACleanup = function(...)
    local gal_l246 = gal61.Connection
    if gal_l246 then
        local gal_l247 = gal61.Connection
        gal_l247:Disconnect()
    end
    gal70()
    gal60.Enabled = false
    gal62 = {}
    gal61.BurstActive = false
    gal46()
    local gal_l248 = gal55.Folder
    if gal_l248 then
        local gal_l249 = gal55.Folder
        gal_l249:Destroy()
    end
    gal47.Enabled = false
    if gal48.GalacticConfig then
        if gal48.OriginalCollectRadius then
            gal48.GalacticConfig.CollectRadius = gal48.OriginalCollectRadius
        end
        if gal48.OriginalPickupDelay then
            gal48.GalacticConfig.PickupDelay = gal48.OriginalPickupDelay
        end
        if gal48.OriginalAutoCollectDelay then
            gal48.GalacticConfig.AutoCollectDelay = gal48.OriginalAutoCollectDelay
        end
        if gal48.OriginalVacuumDuration then
            gal48.GalacticConfig.VacuumDuration = gal48.OriginalVacuumDuration
        end
    end
    local gal_l250 = gal48.DropHook
    if gal_l250 then
        local gal_l251 = gal48.DropHook
        gal_l251:Disconnect()
    end
    local gal_l252 = gal48.ShardESPFolder
    if gal_l252 then
        local gal_l253 = gal48.ShardESPFolder
        gal_l253:Destroy()
    end
    return 
end
do
    gal66()
    Heartbeat = RunService.Heartbeat
    gal61.Connection = Heartbeat:Connect(gal77)
    print("[ZSA] v1.4.4 Loaded - Fixed instant shard collect (drop hook + config manipulation)")
    print("[ZSA] Safe Anti-AFK + Lightweight ESP + Horde-proof Kill Aura")
    return 
end
gal31:Notify({
    Title = "Zombie Survive Arena v1.4.4 Loaded!",
    Time = 3
})
