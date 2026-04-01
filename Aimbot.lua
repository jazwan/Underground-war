-- [[ GHAZWAN V15 | BODY-LOCK EDITION ]]
-- مخصص لماب Underground War 2.0 بناءً على فحص أجزاء الجسم (Torso)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

-- [ إعدادات القوة المطلقة - استهداف الجسم ]
local Config = {
    Enabled = true,
    TeamCheck = true,
    KillDistance = 5000, -- يغطي الماب بالكامل
    TargetPart = "Torso" -- تم التغيير من Head إلى Torso (الجسم) كما طلبت
}

-- العثور على الريموت المسؤول عن الإطلاق في الماب
local Remote = ReplicatedStorage:WaitForChild("Events"):WaitForChild("Remote"):WaitForChild("ShotTarget")

-- [ وظيفة قفل الهدف على الجسم ]
local function GetBodyTarget()
    local target = nil
    local shortestDist = math.huge
    local myChar = LocalPlayer.Character
    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")

    if not myRoot then return nil end

    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and (not Config.TeamCheck or p.Team ~= LocalPlayer.Team) then
            local char = p.Character
            -- البحث عن الجسم (Torso) الذي ظهر في الكونسول الخاص بك
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

-- [ محرك الإبادة الفورية ]
RunService.Heartbeat:Connect(function()
    if not Config.Enabled then return end
    
    local char = LocalPlayer.Character
    local tool = char and char:FindFirstChildOfClass("Tool")
    
    -- السكربت يطلق النار بمجرد حمل السلاح (سنايبر أو مسدس)
    if tool and (tool.Name == "Sniper" or tool.Name == "Pistol") then
        local targetBody = GetBodyTarget()
        
        if targetBody then
            -- إرسال الإحداثيات مباشرة لمنتصف الجسم (Torso)
            -- السيرفر سيسجل الإصابة فوراً لأن مساحة الجذع كبيرة جداً
            Remote:FireServer(targetBody.Position, tool.Name)
        end
    end
end)

print("Ghazwan V15: BODY-LOCK ACTIVATED! (Torso Focus)")
