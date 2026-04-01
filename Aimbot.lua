--// Created by Ghazwan - Aimbot_jazwan27 FINAL V15
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

-- مكتبة التنبيهات
local NotificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMinisterq/Notification-Library/Main/Library.lua"))()
NotificationLibrary:SendNotification("Info", "Aimbot_jazwan27 V15 Loading...", 5)

-- [ إعدادات نظام V15 الخارق ]
local Config = {
    Enabled = false, -- يبدأ معطلاً حتى تضغط الزر
    TeamCheck = true,
    KillDistance = 5000,
    TargetPart = "Torso" -- استهداف الجسم كما طلبت
}

local Remote = ReplicatedStorage:WaitForChild("Events"):WaitForChild("Remote"):WaitForChild("ShotTarget")

-- [ منطق الأيم بوت V15 ]
local function GetBodyTarget()
    local target = nil
    local shortestDist = math.huge
    local myChar = LocalPlayer.Character
    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
    if not myRoot then return nil end

    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and (not Config.TeamCheck or p.Team ~= LocalPlayer.Team) then
            local char = p.Character
            local body = char and char:FindFirstChild(Config.TargetPart)
            local hum = char and char:FindFirstChild("Humanoid")
            
            if char and body and hum and hum.Health > 0 then
                local dist = (body.Position - myRoot.Position).Magnitude
                if dist < shortestDist and dist < Config.KillDistance then
                    shortestDist = dist
                    target = body
                end
            end
        end
    end
    return target
end

-- تشغيل المحرك في الخلفية
RunService.Heartbeat:Connect(function()
    if not Config.Enabled then return end
    local char = LocalPlayer.Character
    local tool = char and char:FindFirstChildOfClass("Tool")
    
    if tool and (tool.Name == "Sniper" or tool.Name == "Pistol") then
        local targetBody = GetBodyTarget()
        if targetBody then
            Remote:FireServer(targetBody.Position, tool.Name)
        end
    end
end)

-- [ إنشاء الواجهة (UI) ]
local gui = Instance.new("ScreenGui", gethui())
gui.Name = "Aimbot_jazwan27_UI"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 0, 0, 0)
frame.Position = UDim2.new(0.5, -150, 0.5, -80)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
frame.Active = true
frame.Draggable = true

local stroke = Instance.new("UIStroke", frame)
stroke.Thickness = 3
spawn(function()
    local counter = 0
    while wait() do
        counter = counter + 0.01
        stroke.Color = Color3.fromHSV(counter % 1, 1, 1)
    end
end)

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 6)

local header = Instance.new("Frame", frame)
header.Size = UDim2.new(1, 0, 0, 35)
header.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
Instance.new("UICorner", header)

local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(1, -40, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Aimbot_jazwan27 V15"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextXAlignment = Enum.TextXAlignment.Left

local closeButton = Instance.new("TextButton", header)
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -32, 0, 2)
closeButton.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.Font = Enum.Font.GothamBold
Instance.new("UICorner", closeButton)

closeButton.MouseButton1Click:Connect(function()
    frame:TweenSize(UDim2.new(0, 0, 0, 0), "In", "Back", 0.5, true)
    wait(0.5)
    gui:Destroy()
end)

local aimButton = Instance.new("TextButton", frame)
aimButton.Size = UDim2.new(0.8, 0, 0, 45)
aimButton.Position = UDim2.new(0.1, 0, 0.5, -5)
aimButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
aimButton.Text = "Enable Aimbot V15"
aimButton.TextColor3 = Color3.new(1, 1, 1)
aimButton.Font = Enum.Font.GothamBold
aimButton.TextSize = 18
Instance.new("UICorner", aimButton)

-- [ تفعيل السكربت عند ضغط الزر ]
aimButton.MouseButton1Click:Connect(function()
    Config.Enabled = not Config.Enabled
    if Config.Enabled then
        aimButton.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
        aimButton.Text = "Aimbot: ON"
        NotificationLibrary:SendNotification("Success", "Body-Lock V15 Activated!", 5)
    else
        aimButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        aimButton.Text = "Aimbot: OFF"
        NotificationLibrary:SendNotification("Info", "Aimbot Disabled", 5)
    end
end)

frame:TweenSize(UDim2.new(0, 300, 0, 160), "Out", "Back", 0.6, true)
print("Ghazwan V15 UI Integrated Successfully!")
