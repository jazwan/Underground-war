--// Created by Ghazwan - Optimized for Cloud Loading
local NotificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMinisterq/Notification-Library/Main/Library.lua"))()
NotificationLibrary:SendNotification("Info", "واجهة إيم بوت باللون الأحمر والأسود - تصميم غزوان", 5)

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local gui = Instance.new("ScreenGui", gethui())
gui.ResetOnSpawn = false

-- الإطار الأساسي
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 150)
frame.Position = UDim2.new(0.5, -150, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
frame.BorderSizePixel = 2
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Active = true
frame.Draggable = true

-- العنوان
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 35)
title.BackgroundTransparency = 1
title.Text = "واجهة إيم بوت - تصميم غزوان"
title.TextColor3 = Color3.fromRGB(255, 0, 0)
title.Font = Enum.Font.GothamBold
title.TextSize = 20

-- الزر
local button = Instance.new("TextButton", frame)
button.Size = UDim2.new(0.7, 0, 0, 50)
button.Position = UDim2.new(0.15, 0, 0.5, -25)
button.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
button.Text = "إيم بوت"
button.TextColor3 = Color3.new(1,1,1)
button.Font = Enum.Font.GothamBold
button.TextSize = 24

button.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://pastefy.app/TXAILVzD/raw"))()
    NotificationLibrary:SendNotification("نجاح", "تم تفعيل الإيم بوت", 5)
end)
