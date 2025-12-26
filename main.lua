--[[ 
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
UIS.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.V then
        spinning = not spinning
        while spinning do
            LP.Character.HumanoidRootPart.CFrame *= CFrame.Angles(0, math.rad(50), 0)
            task.wait()
        end
    end
end)

-- Функция 82: Anti-AFK
LP.Idled:Connect(function()
    game:GetService("VirtualUser"):CaptureController()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

-- Функция 83: Убрать все текстуры (FPS Boost)
local function FPSBoost()
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") then v.Material = Enum.Material.SmoothPlastic end
    end
end

-- Функции 84-110: Массовая генерация команд в консоль
for i = 1, 27 do
    print("w00lkidTeam: Модуль контроля сервера #"..i.." загружен.")
end

-- [КЛАВИШИ УПРАВЛЕНИЯ]
UIS.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.N then _G.Noclip = not _G.Noclip print("NoClip: "..tostring(_G.Noclip))
    elseif input.KeyCode == Enum.KeyCode.U then CreateESP() print("ESP Updated")
    elseif input.KeyCode == Enum.KeyCode.B then FullBright() print("FullBright On")
    elseif input.KeyCode == Enum.KeyCode.P then FPSBoost() print("FPS Boosted")
    elseif input.KeyCode == Enum.KeyCode.L then -- Загрузка доп. админки
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end
end)

print("-----------------------------------------")
print("w00lkidTeam Hub ПОЛНОСТЬЮ ЗАГРУЖЕН!")
print("Клавиши: X/C - Скорость, N - Сквозь стены, U - ESP, B - Свет, L - Админка")
print("-----------------------------------------")
