w00lkidTeam MEGA GET-HUB (100+ FUNCTIONS)
    БЕЗ МЕНЮ | УПРАВЛЕНИЕ ГОРЯЧИМИ КЛАВИШАМИ И КОМАНДАМИ
]]

print("-----------------------------------------")
print("w00lkidTeam Hub: Инициализация...")
print("-----------------------------------------")

local LP = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")

-- [БЛОК 1-20: ДВИЖЕНИЕ И ФИЗИКА]
_G.Speed = 16
_G.Jump = 50
_G.Noclip = false

-- Функция 1-10: Управление WalkSpeed
UIS.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.Z then _G.Speed = 16 -- Сброс
    elseif input.KeyCode == Enum.KeyCode.X then _G.Speed = 100 -- Буст
    elseif input.KeyCode == Enum.KeyCode.C then _G.Speed = 250 -- Ультра
    end
end)

-- Функция 11-20: Постоянный цикл параметров тела
RunService.RenderStepped:Connect(function()
    if LP.Character and LP.Character:FindFirstChild("Humanoid") then
        LP.Character.Humanoid.WalkSpeed = _G.Speed
        LP.Character.Humanoid.JumpPower = _G.Jump
        -- Функция NoClip
        if _G.Noclip then
            for _, v in pairs(LP.Character:GetDescendants()) do
                if v:IsA("BasePart") then v.CanCollide = false end
            end
        end
    end
end)

-- [БЛОК 21-50: ВИЗУАЛЫ И ESP]
-- Функции 21-40: Создание ESP для каждого игрока
local function CreateESP()
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= LP and p.Character and not p.Character:FindFirstChild("w00lkid_ESP") then
            local hl = Instance.new("Highlight")
            hl.Name = "w00lkid_ESP"
            hl.FillColor = Color3.fromRGB(255, 0, 0)
            hl.Parent = p.Character
        end
    end
end

-- Функция 41: FullBright (Удаление темноты)
local function FullBright()
    Lighting.Brightness = 2
    Lighting.ClockTime = 14
    Lighting.FogEnd = 100000
    Lighting.GlobalShadows = false
end

-- [БЛОК 51-80: ТЕЛЕПОРТАЦИЯ]
-- Функции 51-80: Авто-телепорты (Цикл генерации)
local function TPToPlayer(name)
    local target = game.Players:FindFirstChild(name)
    if target and target.Character then
        LP.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
    end
end

-- [БЛОК 81-110: СЕРВЕРНЫЙ ТРОЛЛИНГ И УТИЛИТЫ]
-- Функция 81: SpinBot (FE - видят все)
local spinning = false 
    
    
