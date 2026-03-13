--// Created by Ghazwan - Updated Version (Draggable + Close Button)
local NotificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMinisterq/Notification-Library/Main/Library.lua"))()
NotificationLibrary:SendNotification("Info", "واجهة غزوان: الآن تدعم السحب والإغلاق", 5)

local gui = Instance.new("ScreenGui", gethui())
gui.ResetOnSpawn = false

-- الإطار الأساسي
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 160)
frame.Position = UDim2.new(0.5, -150, 0.5, -80)
frame.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
frame.Active = true
frame.Draggable = true -- تفعيل خاصية السحب

-- زر الإغلاق (X)
local closeButton = Instance.new("TextButton", frame)
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 18

closeButton.MouseButton1Click:Connect(function()
    gui:Destroy() -- إغلاق الواجهة تماماً
end)

-- العنوان
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, -40, 0, 35)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "واجهة غزوان المطورة"
title.TextColor3 = Color3.fromRGB(255, 0, 0)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextXAlignment = Enum.TextXAlignment.Left

-- زر الإيم بوت الأساسي
local aimButton = Instance.new("TextButton", frame)
aimButton.Size = UDim2.new(0.8, 0, 0, 45)
aimButton.Position = UDim2.new(0.1, 0, 0.5, -5)
aimButton.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
aimButton.Text = "تفعيل الإيم بوت"
aimButton.TextColor3 = Color3.new(1, 1, 1)
aimButton.Font = Enum.Font.GothamBold
aimButton.TextSize = 20

aimButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://pastefy.app/TXAILVzD/raw"))()
    NotificationLibrary:SendNotification("نجاح", "تم تفعيل الإيم بوت بنجاح", 5)
end)
