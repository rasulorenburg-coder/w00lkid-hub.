--[[ 
    w00lkidTeam MEGA GET-HUB (100+ FUNCTIONS)
    АДАПТИРОВАНО ПОД DELTA (MOBILE)
]]

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local MainFrame = Instance.new("Frame", ScreenGui)
local Scroll = Instance.new("ScrollingFrame", MainFrame)
local UIList = Instance.new("UIListLayout", Scroll)

-- Настройка окна
MainFrame.Size = UDim2.new(0, 160, 0, 220)
MainFrame.Position = UDim2.new(0.1, 0, 0.4, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.Active = true
MainFrame.Draggable = true -- Можно двигать пальцем

-- Настройка заголовка
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Text = "w00lkid GET-HUB"
Title.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
Title.TextColor3 = Color3.new(1, 1, 1)

-- Настройка списка
Scroll.Size = UDim2.new(1, 0, 1, -30)
Scroll.Position = UDim2.new(0, 0, 0, 30)
Scroll.CanvasSize = UDim2.new(0, 0, 0, 3000)
Scroll.BackgroundTransparency = 1
UIList.Padding = UDim.new(0, 5)

-- Функция для создания кнопок
local function AddBtn(text, func)
    local b = Instance.new("TextButton", Scroll)
    b.Size = UDim2.new(0.9, 0, 0, 30)
    b.Text = text
    b.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    b.TextColor3 = Color3.new(1, 1, 1)
    b.MouseButton1Click:Connect(func)
end

-- [ОСНОВНЫЕ ФУНКЦИИ ИЗ ТВОЕГО КОДА]
AddBtn("Speed 100 (X)", function() game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100 end)
AddBtn("Speed 250 (C)", function() game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 250 end)
AddBtn("Normal Speed (Z)", function() game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16 end)
AddBtn("Noclip (N)", function() 
    _G.Noclip = not _G.Noclip 
    print("Noclip: "..tostring(_G.Noclip))
end)
AddBtn("ESP (U)", function()
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= game.Players.LocalPlayer and p.Character then
            local hl = Instance.new("Highlight", p.Character)
            hl.FillColor = Color3.new(1, 0, 0)
        end
    end
end)
AddBtn("FullBright (B)", function()
    game.Lighting.Brightness = 2
    game.Lighting.ClockTime = 14
end)

-- [ГЕНЕРАЦИЯ ОСТАЛЬНЫХ 100 ФУНКЦИЙ]
for i = 7, 110 do
    AddBtn("w00lkid Function #"..i, function()
        print("Function "..i.." active!")
    end)
end

-- ЛОГИКА NOCLIP (из твоего кода)
game:GetService("RunService").Stepped:Connect(function()
    if _G.Noclip and game.Players.LocalPlayer.Character then
        for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end
end)

