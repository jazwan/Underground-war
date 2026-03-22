--// Created by Ghazwan - Aimbot_jazwan27 Edition
local TweenService = game:GetService("TweenService")
local NotificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMinisterq/Notification-Library/Main/Library.lua"))()
NotificationLibrary:SendNotification("Info", "Aimbot_jazwan27 Activated", 5)

local gui = Instance.new("ScreenGui", gethui())
gui.Name = "Aimbot_jazwan27_UI"
gui.ResetOnSpawn = false

-- الإطار الأساسي
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 0, 0, 0) -- سيبدأ من الصفر للأنيميشن
frame.Position = UDim2.new(0.5, -150, 0.5, -80)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
frame.Active = true
frame.Draggable = true -- تفعيل خاصية السحب

-- إطار الحواف الملونة (RGB)
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

-- شريط العنوان
local header = Instance.new("Frame", frame)
header.Size = UDim2.new(1, 0, 0, 35)
header.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
local headerCorner = Instance.new("UICorner", header)

-- العنوان الجديد
local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(1, -40, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Aimbot_jazwan27"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextXAlignment = Enum.TextXAlignment.Left

-- زر الإغلاق مع أنيميشن
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

-- زر الأيم بوت الجديد
local aimButton = Instance.new("TextButton", frame)
aimButton.Size = UDim2.new(0.8, 0, 0, 45)
aimButton.Position = UDim2.new(0.1, 0, 0.5, -5)
aimButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
aimButton.Text = "Aimbot"
aimButton.TextColor3 = Color3.new(1, 1, 1)
aimButton.Font = Enum.Font.GothamBold
aimButton.TextSize = 18
Instance.new("UICorner", aimButton)

aimButton.MouseButton1Click:Connect(function()
    aimButton.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
    loadstring(game:HttpGet("https://pastefy.app/TXAILVzD/raw"))()
    NotificationLibrary:SendNotification("Success", "Aimbot Enabled!", 5)
    wait(0.2)
    aimButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
end)

-- أنيميشن فتح الواجهة (الظهور السلس)
frame:TweenSize(UDim2.new(0, 300, 0, 160), "Out", "Back", 0.6, true)
